	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	-----------------------------------------------Module-----------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	function Function.Spring.new(initial, clock)
		local target = initial or 0
		clock = clock or os.clock
		return setmetatable({
			_clock = clock;
			_time0 = clock();
			_position0 = target;
			_velocity0 = 0*target;
			_target = target;
			_damper = 1;
			_speed = 1;
		}, Function.Spring)
	end
	function Function.Spring:Impulse(velocity)
		self.Velocity = self.Velocity + velocity
	end
	function Function.Spring:TimeSkip(delta)
		local now = self._clock()
		local position, velocity = self:_positionVelocity(now+delta)
		self._position0 = position
		self._velocity0 = velocity
		self._time0 = now
	end
	function Function.Spring:__index(index)
		if Function.Spring[index] then
			return Function.Spring[index]
		elseif index == "Value" or index == "Position" or index == "p" then
			local position, _ = self:_positionVelocity(self._clock())
			return position
		elseif index == "Velocity" or index == "v" then
			local _, velocity = self:_positionVelocity(self._clock())
			return velocity
		elseif index == "Target" or index == "t" then
			return self._target
		elseif index == "Damper" or index == "d" then
			return self._damper
		elseif index == "Speed" or index == "s" then
			return self._speed
		elseif index == "Clock" then
			return self._clock
		else
			error(("%q is not a valid member of Spring"):format(tostring(index)), 2)
		end
	end
	function Function.Spring:__newindex(index, value)
		local now = self._clock()

		if index == "Value" or index == "Position" or index == "p" then
			local _, velocity = self:_positionVelocity(now)
			self._position0 = value
			self._velocity0 = velocity
			self._time0 = now
		elseif index == "Velocity" or index == "v" then
			local position, _ = self:_positionVelocity(now)
			self._position0 = position
			self._velocity0 = value
			self._time0 = now
		elseif index == "Target" or index == "t" then
			local position, velocity = self:_positionVelocity(now)
			self._position0 = position
			self._velocity0 = velocity
			self._target = value
			self._time0 = now
		elseif index == "Damper" or index == "d" then
			local position, velocity = self:_positionVelocity(now)
			self._position0 = position
			self._velocity0 = velocity
			self._damper = value
			self._time0 = now
		elseif index == "Speed" or index == "s" then
			local position, velocity = self:_positionVelocity(now)
			self._position0 = position
			self._velocity0 = velocity
			self._speed = value < 0 and 0 or value
			self._time0 = now
		elseif index == "Clock" then
			local position, velocity = self:_positionVelocity(now)
			self._position0 = position
			self._velocity0 = velocity
			self._clock = value
			self._time0 = value()
		else
			error(("%q is not a valid member of Spring"):format(tostring(index)), 2)
		end
	end
	function Function.Spring:_positionVelocity(now)
		local p0 = self._position0
		local v0 = self._velocity0
		local p1 = self._target
		local d = self._damper
		local s = self._speed

		local t = s*(now - self._time0)
		local d2 = d*d

		local h, si, co
		if d2 < 1 then
			h = math.sqrt(1 - d2)
			local ep = math.exp(-d*t)/h
			co, si = ep*math.cos(h*t), ep*math.sin(h*t)
		elseif d2 == 1 then
			h = 1
			local ep = math.exp(-d*t)/h
			co, si = ep, ep*t
		else
			h = math.sqrt(d2 - 1)
			local u = math.exp((-d + h)*t)/(2*h)
			local v = math.exp((-d - h)*t)/(2*h)
			co, si = u + v, u - v
		end

		local a0 = h*co + d*si
		local a1 = 1 - (h*co + d*si)
		local a2 = si/s

		local b0 = -s*si
		local b1 = s*si
		local b2 = h*co - d*si

		return a0*p0 + a1*p1 + a2*v0,b0*p0 + b1*p1 + b2*v0
	end

	-- tail module --

	local modelInstance = Instance.new("Model")
	local modelGetScale = modelInstance.GetScale

	local cframeIdentity = CFrame.identity
	local cframeToObjectSpace = cframeIdentity.ToObjectSpace
	local cframeVectorToObjectSpace = cframeIdentity.VectorToObjectSpace
	local cframeInverse = cframeIdentity.Inverse
	local cframeToEulerAnglesXYZ = cframeIdentity.ToEulerAnglesXYZ
	local cframeFromEulerAngles = CFrame.fromEulerAngles
	local cframeNew = CFrame.new

	-- Caculate Elasticity
	local function calculateElasticity(
		position: Vector3,
		velocity: Vector3,
		stiffness: number,
		damping: number
	): (Vector3, Vector3)
		local springForce = stiffness * position -- position is the displacement since anchor is (0, 0, 0) otherwise this would be (position - anchor).
		local dampingForce = damping * velocity
		local acceleration = springForce + dampingForce

		local newVelocity = velocity - acceleration * timeStep
		local newValue = position + newVelocity * timeStep

		return newValue, newVelocity
	end

	local function vector3ToAngles(vector3:Vector3):CFrame
		return cframeFromEulerAngles(vector3.X, vector3.Y, vector3.Z)
	end

	-- Linear interpolation.
	local function lerp(from:number, to:number, alpha:number):number
		return from + (to - from) * alpha
	end

	local function cframeOrAttachmentOrNilParameterToCFrame(parameter:CFrame|Attachment?):CFrame
		return parameter and (typeof(parameter) == "CFrame" and parameter or parameter.CFrame) or CFrame.identity
	end

	-- Converts a string to a wag seed which is used to desync tails.
	local function nameToTailWagSeed(name:string):number
		local wagSeed = 0
		for _, byte:string in {string.byte(name, 1, string.len(name))} do
			wagSeed += (byte * byte)
		end
		return wagSeed
	end


	-- Fast system for checking if an accessory's name is an included accessory.
	local includedAccessoryNamesValidationSet:{[Instance]:boolean} = {}

	-- The table includedAccessoryNames could have changes and this allows the set to only be computed when necessary.
	local includedAccessoryNamesValidationSetNeedsUpdating = true

	-- Creates the set that allows for indexing with an accessory name to recieve true or nil.
	local function updateIncludedAccessoryNamesValidationSet()
		includedAccessoryNamesValidationSet = {}
		for _, accessoryName in includedAccessoryNames do
			includedAccessoryNamesValidationSet[accessoryName] = true
		end
		for _, accessoryName in excludeAccessoryNames do
			includedAccessoryNamesValidationSet[accessoryName] = false
		end
		includedAccessoryNamesValidationSetNeedsUpdating = false
	end

	local function isTailAccessory(accessory:Accessory):boolean
		local accessoryType = accessory.AccessoryType
		local accessoryName = accessory.Name
		if accessoryType == Enum.AccessoryType.Back or accessoryType == Enum.AccessoryType.Waist then
			if includedAccessoryNamesValidationSetNeedsUpdating then updateIncludedAccessoryNamesValidationSet() end
			if string.find(string.lower(accessoryName), "tail", 1, true) then
				if includedAccessoryNamesValidationSet[accessoryName] == nil
					or includedAccessoryNamesValidationSet[accessoryName] == true then
					return true
				end
			elseif includedAccessoryNamesValidationSet[accessoryName] then
				return true
			end
		end
		return false
	end

	-- R6 Torso tail pivot offset.
	local r6TailPivotOffset = CFrame.new(0, 0.3, 0)
	-- Gets the tail pivot offset from a root part for both R15 and R6.
	local function getTailPivotOffsetFromRoot(root:Part):CFrame?
		if root then
			-- R15 — LowerTorso and UpperTorso have WaistRigAttachment.
			local waistRigAttachment:Attachment = root:FindFirstChild("WaistRigAttachment")
			if waistRigAttachment then
				return waistRigAttachment.CFrame * CFrame.new(0, 0, root.Size.Z * 0.5)
			end

			-- R6 — Torso.
			local waistBackAttachment:Attachment = root:FindFirstChild("WaistBackAttachment")
			if waistBackAttachment then
				return waistBackAttachment.CFrame * r6TailPivotOffset
			end
		end
	end

	local function setUpWeld(character:Model, weld:Weld, tailPart:BasePart, customPivotOffset:CFrame|Attachment?, Data)
		-- Get root part.
		local flipAccessoryWeldParts = false
		local root:Part
		local retries = 0
		local function loadRoot(c)
			if c then
				if retries > 10 then
					if c == 0 then
						warn(weld.Name.."\" for the character \""..character.Name.."\" did not have Part0. Make sure the character has finished loading and you've set Part0.")
					else
						warn(weld.Name.."\" for the character \""..character.Name.."\" did not have Part1. Make sure the character has finished loading and you've set Part0.")
					end
					return
				else
					retries += 1
					task.wait()
				end
			end

			root = weld.Part0
			if not root then loadRoot(0) end
			if root == tailPart then
				root = weld.Part1
				if not root then loadRoot(1) end
				flipAccessoryWeldParts = true
			end
		end
		loadRoot()
		if not root then return end

		-- Get pivot offset.
		local pivotOffset:CFrame?
		if customPivotOffset then
			pivotOffset = cframeOrAttachmentOrNilParameterToCFrame(customPivotOffset)
		else
			pivotOffset = getTailPivotOffsetFromRoot(root)
		end
		if not pivotOffset then warn("Could not find attachment on part \""..root.Name.."\" for the character \""..character.Name.."\". Make sure the character has finished loading and you've set Part0.") return end

		-- Get weld original cframe.
		local weldOriginalCFrame:CFrame
		if flipAccessoryWeldParts then
			weldOriginalCFrame = weld.C1 * cframeInverse(weld.C0) -- C1 * C0^-1

			-- Switch around because physics tails handles Part0 as the root.
			weld.Part0, weld.Part1 = root, tailPart
		else
			weldOriginalCFrame = weld.C0 * cframeInverse(weld.C1) -- C0 * C1^-1
		end

		-- Update weld.
		weld.C0 = weldOriginalCFrame -- Not really required but theoretically it could render 1 frame before it's updated by the physics tails engine.
		weld.C1 = cframeIdentity -- Clearing C1 is required (merged with C0), the tails do not use C1. Available for people if they want.

		-- Adjust pivot to be relative to weldOriginalCFrame.
		pivotOffset = cframeToObjectSpace(weldOriginalCFrame, cframeNew(pivotOffset.Position))

		-- Get wag seed.
		local wagSeed = nameToTailWagSeed(character.Name)
		local player = PS:GetPlayerFromCharacter(character)
		if player then
			wagSeed += player.UserId
		end

		-- Add to physicsTails table.
		local physicsTail = {
			root = root,
			rootPreviousCFrame = root.CFrame,
			rootPreviousDeltaCFrame = cframeIdentity,

			weld = weld,
			weldOriginalCFrame = weldOriginalCFrame,
			weldPreviousCFrame = weldOriginalCFrame,

			weldCurrentCFrame = weldOriginalCFrame,

			currentAngle = Vector3.zero,
			angularVelocity = Vector3.zero,
			wagAnimationBlendAlpha = 0,
			wagSeed = wagSeed,

			--pivotOffset = pivotOffset,
			pivotCFrame = weldOriginalCFrame * pivotOffset,
			inversePivotOffsetCFrame = cframeInverse(pivotOffset),

			character = character,
			inverseCharacterScale = 1 / modelGetScale(character),
		}
		PlayerData[Data].CurrentPartList.physicsTails[tailPart.Parent] = physicsTail
		--table.insert(PlayerData[Data].CurrentPartList.physicsTails, physicsTail)

		--[[ Detect weld deletion.
		weld.AncestryChanged:Connect(function()
			if not weld.Parent and PlayerData[Data].CurrentPartList.physicsTails[tailPart.Parent] then
				PlayerData[Data].CurrentPartList.physicsTails[tailPart.Parent] = physicsTail
				--[[local index = table.find(PlayerData[Data].CurrentPartList.physicsTails, physicsTail)
				table.remove(PlayerData[Data].CurrentPartList.physicsTails, index)
			end
		end)]]
	end

	local function setUpTailAccessory(character:Model, accessory:Accessory, Data)
		-- Get weld.
		local handle:Part = accessory:FindFirstChild("Handle")
		if not handle then
			-- Accessory is most likely still loading. We will just wait until the handle is added.
			accessory.ChildAdded:Once(function()
				setUpTailAccessory(character, accessory, Data)
			end)
			return
		end

		local weld:Weld = handle:FindFirstChildOfClass("Weld")
		if not weld then
			-- Accessory is most likely still loading. We will just wait until the handle is added.
			handle.ChildAdded:Once(function()
				setUpTailAccessory(character, accessory, Data)
			end)
			return
		end

		-- Set up accessory weld.
		setUpWeld(character, weld, handle, nil, Data)
	end


	-- Updates the physics tail to display as its static form.
	local function updatePhysicsTailToStatic(physicsTail:physicsTail)
		-- Get character scale.
		local characterScale = physicsTail.inverseCharacterScale * modelGetScale(physicsTail.character)

		local weldOriginalCFrame = physicsTail.weldOriginalCFrame -- Avoiding table lookups is faster.
		physicsTail.weld.C0 = weldOriginalCFrame.Rotation + weldOriginalCFrame.Position * characterScale
	end

	-- Computes a frame of the tail animation.
	local function getTailAnimationOffset(physicsTail:physicsTail,Data):Vector3
		local variables = tailVariables[Data]
		local wagAnimationBlendAlpha = physicsTail.wagAnimationBlendAlpha -- Avoiding table lookups is faster.
		if physicsTail.angularVelocity.Magnitude > 0.3 then
			-- Lerp algorithm simplified.
			wagAnimationBlendAlpha = wagAnimationBlendAlpha < 0.01 and 0 or wagAnimationBlendAlpha * (1 - wagAnimationBlendOutAlpha)
		else
			wagAnimationBlendAlpha = wagAnimationBlendAlpha > 0.99 and 1 or lerp(wagAnimationBlendAlpha, 1, wagAnimationBlendInAlpha)
		end
		physicsTail.wagAnimationBlendAlpha = wagAnimationBlendAlpha

		-- Check if it has to do anything otherwise if wagAnimationBlendAlpha is 0 then there is no animation offset.
		if wagAnimationBlendAlpha > 0 then
			local wagTime = variables.tailScaledAnimationTime + physicsTail.wagSeed

			-- FluctuatingWagTime allows the tail to move visually randomly instead of a plain linear timeline.
			local fluctuatingWagTime = wagTime + math.sin(wagTime) * math.sin(wagTime * 0.22727272727272727) * 0.9

			-- Add to newCurrentAngle since it will add to the tail from there anyway.
			return Vector3.new(
				(math.sin(fluctuatingWagTime * 2) + 0.8) * wagAnimationDropAmplitude * wagAnimationBlendAlpha,
				math.cos(fluctuatingWagTime) * wagAnimationSwayAmplitude * wagAnimationBlendAlpha,
				math.sin(fluctuatingWagTime) * -wagAnimationRollAmplitude * wagAnimationBlendAlpha
			)
		end

		return Vector3.zero
	end

	-- Updates the physics tail to display as its interpolated cframe.
	local function updatePhysicsTailToInterpolation(physicsTail:physicsTail, interpolationAlpha:number, Data)
		-- Get character scale.
		local characterScale = physicsTail.inverseCharacterScale * modelGetScale(physicsTail.character)

		-- Interpolate.
		local weldCFrame = physicsTail.weldPreviousCFrame:Lerp(physicsTail.weldCurrentCFrame, interpolationAlpha)

		-- Wag animation.
		if PlayerData[Data].tailSettings.wagAnimationEnabled then
			-- Take the animation-pivoted rotation and figure out what rotation difference it represents in the current tail's space, then apply it to the tail.
			weldCFrame *= cframeInverse(
				cframeToObjectSpace(weldCFrame,
					physicsTail.pivotCFrame * vector3ToAngles(getTailAnimationOffset(physicsTail,Data)) * physicsTail.inversePivotOffsetCFrame
				)
			)
		end

		-- Update weld.
		physicsTail.weld.C0 = weldCFrame.Rotation + weldCFrame.Position * characterScale
	end



	local persistantTailWindUnit:Vector3 -- Wind direction.
	local persistantTailWindAlpha:number -- Wind from 0 to 1 defining how significant it is.
	local persistantTailWindAlpha_Times_04:number -- Pre-computation.
	local persistantTailWindAlpha_Squared_Times_006:number -- Pre-computation.
	local persistantTailWindForceRelevant = false -- If wind force magnitude is 0 then this is false.

	local function updateTailPersistantWindForceInformation()
		local persistantTailWindForce = globalWindEnabled and (workspace.GlobalWind + customPersistantWindForce) or customPersistantWindForce

		-- Wind direction.
		persistantTailWindUnit = persistantTailWindForce.Unit

		-- Wind magnitude.
		persistantTailWindAlpha = persistantTailWindForce.Magnitude * 0.5

		-- Pre-computations.
		persistantTailWindAlpha_Times_04 = persistantTailWindAlpha * 0.4
		persistantTailWindAlpha_Squared_Times_006 = persistantTailWindAlpha * persistantTailWindAlpha * 0.06

		-- Wind relevance.
		persistantTailWindForceRelevant = persistantTailWindAlpha > 0
	end
	updateTailPersistantWindForceInformation()

	-- Update wind information on change.
	local workspaceGlobalWindPropertyChangeSignal = workspace:GetPropertyChangedSignal("GlobalWind"):Connect(updateTailPersistantWindForceInformation)
	table.insert(AllConnect,workspaceGlobalWindPropertyChangeSignal)

	local gravityForce:Vector3 -- Gravity force.
	local persistantTailLinearForce:Vector3 -- Linear force.
	local persistantTailLinearForceRelevant = false -- If linear force magnitude is 0 then this is false.
	local function updateTailPersistantLinearForceInformation()
		-- Linear force.
		persistantTailLinearForce = gravityEnabled and (gravityForce + customPersistantLinearForce) or customPersistantLinearForce

		-- Linear force relevance.
		persistantTailLinearForceRelevant = persistantTailLinearForce.Magnitude > 0
	end

	local function updateGravityInformation()
		local gravity = workspace.Gravity

		gravityForce = Vector3.new(0,
		--[[
			This calculates the effect of the gravity and returns:
			-1 to 0.1 (tail slightly lifted in low gravity and pulled in high gravity for a nice visual aesthetic).
		]]
			math.max((196.2 - gravity) * 0.004, -1))

		-- Update persistantTailLinearForce after gravityForce update.
		updateTailPersistantLinearForceInformation()
	end
	updateGravityInformation()

	-- Update gravity information on change.
	local workspaceGravityPropertyChangeSignal = workspace:GetPropertyChangedSignal("Gravity"):Connect(updateGravityInformation)
	table.insert(AllConnect,workspaceGravityPropertyChangeSignal)


	local vector3Zero = Vector3.zero
	local vector3Cross = vector3Zero.Cross
	local vector3New = Vector3.new
	-- Update/step a physics tail.
	local function updatePhysicsTail(physicsTail:physicsTail, updateWeld:boolean, interpolationAlpha:number, Data)
		local tailSettings = PlayerData[Data].tailSettings
		local variables = tailVariables[Data]

		-- Get new state of the root part.
		local rootCFrame = physicsTail.root.CFrame

		-- Change in position, which is velocity (without change in time).
		local rootDeltaCFrame = cframeToObjectSpace(physicsTail.rootPreviousCFrame, rootCFrame)

		-- Max a tail can have physics from movement.
		if rootDeltaCFrame.Position.Magnitude > math.max(1,physicsTail.root.AssemblyLinearVelocity.Magnitude) --[[movementDistanceThreshold]] then
			warn("cleared", Function.Round(rootDeltaCFrame.Position.Magnitude,3), Function.Round(physicsTail.root.AssemblyLinearVelocity.Magnitude,3))
			rootDeltaCFrame = rootDeltaCFrame.Rotation -- clear position
		end

		-- Change in velocity, which is acceleration (without change in time).
		local rootAcceleration = cframeToObjectSpace(physicsTail.rootPreviousDeltaCFrame, rootDeltaCFrame)

		-- Force from walking around + any other forces that will be added before calculating it all to angular velocity.
		local tailForce = rootAcceleration.Position * tailSettings.linearAmplitude

		-- Compute wind force fluctuation.
		if tailSettings.persistantTailWindForceRelevant then
			-- Cache sin(unixTime * 4).
			local sinUnixTime4 = math.sin(variables.tailScaledTime * 4)

			-- Jittery effect for when the wind is strong.
			local unstableWindFlow = math.sin(variables.tailScaledTime * 2 * sinUnixTime4) * persistantTailWindAlpha_Times_04

			-- Calm wind effect.
			local stableWindFlow = math.sin(variables.tailScaledTime * 2) * sinUnixTime4

			-- Add wind force.
			tailForce -= cframeVectorToObjectSpace(rootCFrame, persistantTailWindUnit * persistantTailWindAlpha_Squared_Times_006 * (1 + (stableWindFlow + unstableWindFlow) * 0.4))
		end

		-- Add persistant linear force.
		if persistantTailLinearForceRelevant then tailForce -= cframeVectorToObjectSpace(rootCFrame, persistantTailLinearForce) end

		-- Cache pivotCFrame to use in displacement and weld CFrame
		local pivotCFrame = physicsTail.pivotCFrame -- Avoiding table lookups is faster.

		-- Forces for walking around.
		local displacement = pivotCFrame.Position - physicsTail.weldPreviousCFrame.Position
		local torque = vector3Cross(displacement, tailForce)

		-- Forces for turning around.
		local angularAcceleration = vector3New(cframeToEulerAnglesXYZ(rootAcceleration)) * tailSettings.angularAmplitude

		-- Update old forces. Originally had it as: physicsTail.currentAngle, physicsTail.angularVelocity = fun(...) however avoiding table lookups is faster.
		local newCurrentAngle, newAngularVelocity = calculateElasticity(physicsTail.currentAngle, physicsTail.angularVelocity, tailSettings.stiffness, tailSettings.damping)

		-- Update newCurrentAngle before we make further changes to it with the wag animation.
		physicsTail.currentAngle = newCurrentAngle

		-- Get character scale.
		local characterScale = physicsTail.inverseCharacterScale * modelGetScale(physicsTail.character)

		-- Update and apply new forces.
		physicsTail.angularVelocity = newAngularVelocity + torque / characterScale - angularAcceleration

		-- Update weld.
		local currentAngleCFrame = vector3ToAngles(newCurrentAngle) -- newCurrentAngle here is the one modified by wag animation.
		local newWeldCurrentCFrame = pivotCFrame * currentAngleCFrame * physicsTail.inversePivotOffsetCFrame
		local newWeldPreviousCFrame = physicsTail.weldCurrentCFrame
		if updateWeld then
			-- Interpolate.
			local weldCFrame = newWeldPreviousCFrame:Lerp(newWeldCurrentCFrame, interpolationAlpha)

			-- Wag animation.
			if tailSettings.wagAnimationEnabled then
				-- Take the animation-pivoted rotation and figure out what rotation difference it represents in the current tail's space, then apply it to the tail.
				weldCFrame *= cframeInverse(
					cframeToObjectSpace(weldCFrame,
						pivotCFrame * vector3ToAngles(getTailAnimationOffset(physicsTail,Data)) * physicsTail.inversePivotOffsetCFrame
					)
				)
			end

			-- Update weld.
			physicsTail.weld.C0 = weldCFrame.Rotation + weldCFrame.Position * characterScale
		end

		-- Update previous.
		physicsTail.rootPreviousCFrame = rootCFrame
		physicsTail.rootPreviousDeltaCFrame = rootDeltaCFrame

		physicsTail.weldPreviousCFrame = newWeldPreviousCFrame
		physicsTail.weldCurrentCFrame = newWeldCurrentCFrame
	end

	local cameraPosition = Vector3.zero
	local function physicsTailsDistanceToCameraComparer(a:physicsTail, b:physicsTail):boolean
		return a.distanceToCamera < b.distanceToCamera
	end


