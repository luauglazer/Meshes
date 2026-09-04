	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------PartList----------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	function Function.CumDripDisplay(ObjectInstance, Character, Extra, Data)
		local attach = Instance.new("Attachment",ObjectInstance)
		attach.Name = "cTrail"
		PlayerData[Data].CurrentPartList.RealtimeUpdateList.Special["Attachment"] = attach

		local particle = Instance.new("ParticleEmitter",attach)
		particle.Orientation = Enum.ParticleOrientation.VelocityPerpendicular
		particle.Size = NumberSequence.new(
			{NumberSequenceKeypoint.new(0,1.5,1),
				NumberSequenceKeypoint.new(1,1.5,1)}
		)
		particle.Texture = getAsset("RClothesContent/16235774309.png")
		particle.Transparency = NumberSequence.new(
			{NumberSequenceKeypoint.new(0,1),
				NumberSequenceKeypoint.new(.2,.5),
				NumberSequenceKeypoint.new(1,1)}
		)
		particle.ZOffset = .1
		particle.LightInfluence = 1
		particle.Lifetime = NumberRange.new(2,6)
		particle.Rate = 10
		particle.Rotation = NumberRange.new(-360,360)
		particle.Speed = NumberRange.new(0.001)
		task.delay(0,function()
			particle.Color = ColorSequence.new(ObjectInstance.Color)
		end)
	end

	function Function.Lactation(ObjectInstance, Character, Extra, Data)
		local particle = Instance.new("ParticleEmitter",ObjectInstance)
		particle.Orientation = Enum.ParticleOrientation.VelocityParallel
		particle.LightEmission = .1
		particle.LightInfluence = 1
		particle.EmissionDirection = Enum.NormalId.Bottom
		particle.Size = NumberSequence.new(.05)
		particle.Texture = "http://www.roblox.com/asset/?id=296981321"
		particle.Squash = NumberSequence.new(
			{NumberSequenceKeypoint.new(0,.7),
				NumberSequenceKeypoint.new(.752,.95),
				NumberSequenceKeypoint.new(1,.45)}
		)
		particle.Transparency = NumberSequence.new(
			{NumberSequenceKeypoint.new(0,.169),
				NumberSequenceKeypoint.new(.251,.557),
				NumberSequenceKeypoint.new(.519,.814),
				NumberSequenceKeypoint.new(.772,.918),
				NumberSequenceKeypoint.new(1,1)}
		)
		particle.Lifetime = NumberRange.new(.8)
		particle.Rate = 50
		particle.Rotation = NumberRange.new(90)
		particle.Speed = NumberRange.new(1,5)
		particle.SpreadAngle = Vector2.new(-30,30)
		particle.Acceleration = Vector3.new(0,-25,0)
		particle.Drag = 2
		particle.VelocityInheritance = .3
		task.delay(0,function()
			particle.Color = ColorSequence.new(ObjectInstance.Color)
			if PlayerData[Data].BreastsType == 5 then
				particle.Size = NumberSequence.new(.1)
				particle.EmissionDirection = Enum.NormalId.Top
				if ObjectInstance.Parent.Parent.Name == "Left Breast" then
					PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Weld.C0 = CFrame.new(0.123999998, 0.244960785, -0.0383028984, 0.866025388, 0.5, -0, -0.5, 0.866025388, -0, 0, 0, 1)
					PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].CFrame = CFrame.new(0.123999998, 0.244960785, -0.0383028984, 0.866025388, 0.5, -0, -0.5, 0.866025388, -0, 0, 0, 1)
				else
					PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Weld.C0 = CFrame.new(-0.124103546, 0.244960785, -0.0383028984, 0.866027117, -0.499990761, -1.61431331e-06, 0.499992698, 0.866029799, -3.49144102e-06, 2.21932714e-06, 2.92656478e-06, 0.99999994)
					PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].CFrame = CFrame.new(-0.124103546, 0.244960785, -0.0383028984, 0.866027117, -0.499990761, -1.61431331e-06, 0.499992698, 0.866029799, -3.49144102e-06, 2.21932714e-06, 2.92656478e-06, 0.99999994)
				end
			end
		end)
	end

	function Function.OilUp(ObjectInstance, Character, Extra, Data)
		local function oil(v)
			if game:GetService("RunService"):IsStudio() then
				local mat
				if game:GetService("MaterialService"):FindFirstChild("wetSmoothROCLOTHES") then
					mat = game:GetService("MaterialService")["wetSmoothROCLOTHES"]
				else
					mat = Instance.new("MaterialVariant",game:GetService("MaterialService"))
					mat.Name="wetSmoothROCLOTHES"
					mat.BaseMaterial = Enum.Material.SmoothPlastic
					mat.MaterialPattern = Enum.MaterialPattern.Organic
					mat.RoughnessMap = "rbxassetid://14142895952"
					mat:AddTag("RoClothes")
				end

				v.Material = Enum.Material.SmoothPlastic
				v.MaterialVariant = "wetSmoothROCLOTHES"
				if v:FindFirstChildOfClass("SurfaceAppearance") and not v:HasTag("ImportantSurfaceAppearance") then
					if v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Transparency then
						v.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
						v.Transparency = 0.011
						v:SetAttribute("Alpha",0.011)
					elseif v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Overlay then
						local overlay = v:Clone()
						overlay.Name = v.Name.."OILOVERLAY"
						overlay:ClearAllChildren()
						overlay.Parent = v
						local overlayWeld = Instance.new("Weld",overlay)
						overlayWeld.Part0 = overlay
						overlayWeld.Part1 = v
						overlay.Size = v.Size + Vector3.new(.001,.001,.001)
						overlay.Transparency = 0.01
						PlayerData[Data].CurrentPartList.TransparencyLink[overlay] = {T=v,Define=.01}
						PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[overlay] = {Base=v.Parent,Size=overlay.Size,CFrame=CFrame.new(0,0,0),CFrame1=CFrame.new(0,0,0),Weld=overlayWeld}
						overlay.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
					end
					v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			else
				v.Material = Enum.Material.Glass
				if v.Transparency >= 1 then
					v:AddTag("RCGlassMat")
					v.Material = Enum.Material.Neon
				end
				if v:FindFirstChildOfClass("SurfaceAppearance") and not v:HasTag("ImportantSurfaceAppearance") then
					if v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Transparency then
						v.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
						v.Transparency = 0.011
						v:SetAttribute("Alpha",0.011)
					elseif v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Overlay then
						local overlay = v:Clone()
						overlay.Name = v.Name.."OILOVERLAY"
						overlay:ClearAllChildren()
						overlay.Parent = v
						local overlayWeld = Instance.new("Weld",overlay)
						overlayWeld.Part0 = overlay
						overlayWeld.Part1 = v
						overlay.Size = v.Size + Vector3.new(.001,.001,.001)
						overlay.Transparency = 0.01
						PlayerData[Data].CurrentPartList.TransparencyLink[overlay] = {T=v,Define=.01}
						PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[overlay] = {Base=v.Parent,Size=overlay.Size,CFrame=CFrame.new(0,0,0),CFrame1=CFrame.new(0,0,0),Weld=overlayWeld}
						overlay.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
					end
					v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			end
		end
		task.delay(0,function()
			for i, v in pairs(PlayerData[Data].CurrentPartList.Organ) do
				oil(v)
			end
			--[[for i, v in pairs(PlayerData[Data].CurrentPartList.Clothes) do
				if string.find(string.lower(v.Name),"shirt") then
					oil(v)
					v.Transparency = 0.011
				end
			end]]
		end)
	end
	function Function.OilUp2(ObjectInstance, Character, Extra, Data)
		local function oil(v)
			if game:GetService("RunService"):IsStudio() then
				v.Material = Enum.Material.Glass
				if v:FindFirstChildOfClass("SurfaceAppearance") and not v:HasTag("ImportantSurfaceAppearance") then
					if v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Transparency then
						v.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
						v.Transparency = 0.011
						v:SetAttribute("Alpha",0.011)
					elseif v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Overlay then
						local overlay = v:Clone()
						overlay.Name = v.Name.."OILOVERLAY"
						overlay:ClearAllChildren()
						overlay.Parent = v
						overlay.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
						local overlayWeld = Instance.new("Weld",overlay)
						overlayWeld.Part0 = overlay
						overlayWeld.Part1 = v
						overlay.Size = v.Size + Vector3.new(.001,.001,.001)
						overlay.Transparency = 0.01
						PlayerData[Data].CurrentPartList.TransparencyLink[overlay] = {T=v,Define=.01}
						PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[overlay] = {Base=v.Parent,Size=overlay.Size,CFrame=CFrame.new(0,0,0),CFrame1=CFrame.new(0,0,0),Weld=overlayWeld}
					end
					v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			else
				local mat
				if game:GetService("MaterialService"):FindFirstChild("wetSmoothROCLOTHES") then
					mat = game:GetService("MaterialService")["wetSmoothROCLOTHES"]
				else
					mat = Instance.new("MaterialVariant",game:GetService("MaterialService"))
					mat.Name="wetSmoothROCLOTHES"
					mat.BaseMaterial = Enum.Material.SmoothPlastic
					mat.MaterialPattern = Enum.MaterialPattern.Organic
					mat.RoughnessMap = "rbxassetid://14142895952"
					mat:AddTag("RoClothes")
				end

				v.Material = Enum.Material.SmoothPlastic
				v.MaterialVariant = "wetSmoothROCLOTHES"
				if v:FindFirstChildOfClass("SurfaceAppearance") and not v:HasTag("ImportantSurfaceAppearance") then
					if v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Transparency then
						v.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
						v.Transparency = 0.011
						v:SetAttribute("Alpha",0.011)
					elseif v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Overlay then
						local overlay = v:Clone()
						overlay.Name = v.Name.."OILOVERLAY"
						overlay:ClearAllChildren()
						overlay.Parent = v
						overlay.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
						local overlayWeld = Instance.new("Weld",overlay)
						overlayWeld.Part0 = overlay
						overlayWeld.Part1 = v
						overlay.Size = v.Size + Vector3.new(.001,.001,.001)
						overlay.Transparency = 0.01
						PlayerData[Data].CurrentPartList.TransparencyLink[overlay] = {T=v,Define=.01}
						PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[overlay] = {Base=v.Parent,Size=overlay.Size,CFrame=CFrame.new(0,0,0),CFrame1=CFrame.new(0,0,0),Weld=overlayWeld}
					end
					v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			end
		end
		task.delay(0,function()
			for i, v in pairs(PlayerData[Data].CurrentPartList.Organ) do
				oil(v)
			end
			--[[for i, v in pairs(PlayerData[Data].CurrentPartList.Clothes) do
				if string.find(string.lower(v.Name),"shirt") then
					oil(v)
					v.Transparency = 0.011
				end
			end]]
		end)
	end
	function Function.OilUp3(ObjectInstance, Character, Extra, Data)
		local function oil(v)
			if game:GetService("RunService"):IsStudio() then
				local mat
				if game:GetService("MaterialService"):FindFirstChild("wetSmoothROCLOTHES") then
					mat = game:GetService("MaterialService")["wetSmoothROCLOTHES"]
				else
					mat = Instance.new("MaterialVariant",game:GetService("MaterialService"))
					mat.Name="wetSmoothROCLOTHES"
					mat.BaseMaterial = Enum.Material.SmoothPlastic
					mat.MaterialPattern = Enum.MaterialPattern.Organic
					mat.RoughnessMap = "rbxassetid://14142895952"
					mat:AddTag("RoClothes")
				end

				v.Material = Enum.Material.SmoothPlastic
				v.MaterialVariant = "wetSmoothROCLOTHES"
			else
				v.Material = Enum.Material.Glass
				if v.Transparency >= 1 then
					v:AddTag("RCGlassMat")
					v.Material = Enum.Material.Neon
				end
			end
		end
		task.delay(0,function()
			for i, v in pairs(PlayerData[Data].CurrentPartList.Organ) do
				oil(v)
			end
		end)
	end
	function Function.OilUpOld(ObjectInstance, Character, Extra, Data)
		local function oil(v)
			if game:GetService("RunService"):IsStudio() then
				local mat
				if game:GetService("MaterialService"):FindFirstChild("wetSmoothROCLOTHES") then
					mat = game:GetService("MaterialService")["wetSmoothROCLOTHES"]
				else
					mat = Instance.new("MaterialVariant",game:GetService("MaterialService"))
					mat.Name="wetSmoothROCLOTHES"
					mat.BaseMaterial = Enum.Material.SmoothPlastic
					mat.MaterialPattern = Enum.MaterialPattern.Organic
					mat.RoughnessMap = "rbxassetid://14142895952"
					mat:AddTag("RoClothes")
				end

				v.Material = Enum.Material.SmoothPlastic
				v.MaterialVariant = "wetSmoothROCLOTHES"
				if v:FindFirstChildOfClass("SurfaceAppearance") and not v:HasTag("ImportantSurfaceAppearance") then
					v.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
					if v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Transparency then
						v.Transparency = 0.011
						v:SetAttribute("Alpha",0.011)
					end
					v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			else
				v.Material = Enum.Material.Glass
				if v.Transparency >= 1 then
					v:AddTag("RCGlassMat")
					v.Material = Enum.Material.Neon
				end
				if v:FindFirstChildOfClass("SurfaceAppearance") and not v:HasTag("ImportantSurfaceAppearance") then
					v.TextureID = v:FindFirstChildOfClass("SurfaceAppearance").ColorMap
					if v:FindFirstChildOfClass("SurfaceAppearance").AlphaMode == Enum.AlphaMode.Transparency then
						v.Transparency = 0.011
						v:SetAttribute("Alpha",0.011)
					end
					v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			end
		end
		task.delay(0,function()
			for i, v in pairs(PlayerData[Data].CurrentPartList.Organ) do
				oil(v)
			end
			for i, v in pairs(PlayerData[Data].CurrentPartList.Clothes) do
				if string.find(string.lower(v.Name),"shirt") then
					oil(v)
					v.Transparency = 0.011
				end
			end
		end)
	end

	function Function.HideBreastPants(ObjectInstance, Character, Extra, Data)
		task.delay(0,function()
			if not PlayerData[Data].CurrentPartList.Clothes["Breasts Pants"] 
				and not PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 2"]
				and not PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 3"] then
				local void = 100
				repeat
					task.wait()
					void -= 1
				until void <= 0
					or PlayerData[Data].CurrentPartList.Clothes["Breasts Pants"]
					or PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 2"]
					or PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 3"]
			end

			local organ
			local function getOrgan()
				if PlayerData[Data].CurrentPartList.Clothes["Breasts Pants"] then
					organ = PlayerData[Data].CurrentPartList.Clothes["Breasts Pants"]
				elseif PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 2"] then
					organ = PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 2"]
				elseif PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 3"] then
					organ = PlayerData[Data].CurrentPartList.Clothes["Breasts Pants 3"]
				end
			end
			getOrgan()

			if organ then
				local void = 100
				repeat
					task.wait()
					void -= 1
					getOrgan()
				until void <= 0 or PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[organ]
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[organ].Size = Vector3.new(0,0,0)
				organ.Size = Vector3.new(0,0,0)
			end
		end)
	end

	function Function.HideBreastShirt(ObjectInstance, Character, Extra, Data)
		task.delay(0,function()
			if not PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt"] 
				and not PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 2"]
				and not PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 3"] then
				local void = 100
				repeat
					task.wait()
					void -= 1
				until void <= 0
					or PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt"]
					or PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 2"]
					or PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 3"]
			end

			local organ
			local function getOrgan()
				if PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt"] then
					organ = PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt"]
				elseif PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 2"] then
					organ = PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 2"]
				elseif PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 3"] then
					organ = PlayerData[Data].CurrentPartList.Clothes["Breasts Shirt 3"]
				end
			end
			getOrgan()

			if organ then
				local void = 100
				repeat
					task.wait()
					void -= 1
					getOrgan()
				until void <= 0 or PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[organ]
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[organ].Size = Vector3.new(0,0,0)
				organ.Size = Vector3.new(0,0,0)
			end
		end)
	end

	function Function.addFreckles(ObjectInstance, Character, Extra, Data)
		local oldObjectInstance
		if ObjectInstance.Name == "UnnecessaryPart" then
			oldObjectInstance = ObjectInstance
			ObjectInstance = ObjectInstance.Parent
		end
		for i = 1, 6 do
			local Texture = Instance.new("Decal", ObjectInstance)
			if oldObjectInstance then
				Texture.Color3 = oldObjectInstance.Color
			end
			Texture.Texture = "rbxassetid://7317286674"
			Texture.Transparency = 0.55
			PlayerData[Data].CurrentPartList.TransparencyLink[Texture] = {T=ObjectInstance,Define=.55}

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"
			end
		end
	end

	function Function.addFreckles2(ObjectInstance, Character, Extra, Data)
		local oldObjectInstance
		if ObjectInstance.Name == "UnnecessaryPart" then
			oldObjectInstance = ObjectInstance
			ObjectInstance = ObjectInstance.Parent
		end
		for i = 1, 6 do
			local Texture = Instance.new("Decal", ObjectInstance)
			if oldObjectInstance then
				Texture.Color3 = oldObjectInstance.Color
			end
			Texture.Texture = "rbxassetid://7317286674"
			Texture.Transparency = 0.3
			PlayerData[Data].CurrentPartList.TransparencyLink[Texture] = {T=ObjectInstance,Define=.3}

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"
			end
		end
	end

	function Function.addFrecklesC(ObjectInstance, Character, Extra, Data)
		local oldObjectInstance
		if ObjectInstance.Name == "UnnecessaryPart" then
			oldObjectInstance = ObjectInstance
			ObjectInstance = ObjectInstance.Parent
		end
		local transparency = .55
		if oldObjectInstance then
			transparency = oldObjectInstance.Transparency
			oldObjectInstance.Transparency = 1
		end
		for i = 1, 6 do
			local Texture = Instance.new("Decal", ObjectInstance)
			Texture.Texture = getAsset("RClothesContent/colorableFreckles.png")
			task.delay(0,function()
				if oldObjectInstance then
					Texture.Color3 = oldObjectInstance.Color
				end
			end)
			Texture.Transparency = transparency
			PlayerData[Data].CurrentPartList.TransparencyLink[Texture] = {T=ObjectInstance,Define=transparency}

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"
			end
		end
	end

	function Function.nippleCensor(ObjectInstance, Character, Extra, Data)
		local Ui = Instance.new("ScreenGui",GUIObject.Screen)
		Ui.Name = "nCensor"
		Ui.DisplayOrder = -9999
		local objctValue = Instance.new("ObjectValue",Ui)
		objctValue.Value = ObjectInstance
		PlayerData[Data].CurrentPartList.RealtimeUpdateList.Special["nippleCensor"] = Ui

		local frame = Instance.new("Frame",Ui)
		frame.Size = UDim2.fromScale(0,0)
		frame.BackgroundColor3 = Color3.fromRGB(0,0,0)
		frame.BorderSizePixel = 0
	end
	
	function Function.twitchEffect(ObjectInstance, Character, Extra, Data)
		task.spawn(function()
			repeat
				task.wait(math.random(5,40)*0.1)
				for Part, Property in pairs(PlayerData[Data].CurrentPartList.BodyPartPhysics) do
					if Part.Name == "Rod" or Part.Name == "HorseRod" or Part.Name == "Main" or Part.Name == "BBC Rod" then
						local Spring = Property.Spring

						for i=1, math.random(2,10) do
							Spring:Impulse(Vector3.new(0,0.05,0))
							task.wait()
						end
					end
				end
			until ObjectInstance == nil or Function.IsParentNil(ObjectInstance) or Function.FallenPartCheck(ObjectInstance)
		end)
	end

	function Function.TurtleTexture(ObjectInstance, Character, Extra, Data)
		for i = 1, 6 do
			local Texture = Instance.new("Texture", ObjectInstance)
			Texture.Color3 = Color3.fromRGB(255,255,255)
			Texture.Texture = getAsset("RClothesContent/187645444.png")
			Texture.Transparency = 0.3

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"
			end
		end
	end


	function Function.StringTexture(ObjectInstance, Character, Extra, Data)
		for i = 1, 6 do
			local Texture = Instance.new("Texture", ObjectInstance)
			Texture.Texture = "rbxassetid://12083492516"
			Texture.Transparency = 0.3
			Texture.StudsPerTileU = 10
			Texture.StudsPerTileV = 12
			task.delay(0,function()
				Texture.Color3 = ObjectInstance.Color
			end)

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"
			end
		end
	end

	function Function.FabricTexture(ObjectInstance, Character, Extra, Data)
		for i = 1, 6 do
			local Texture = Instance.new("Texture", ObjectInstance)
			Texture.Color3 = Color3.fromRGB(55, 55, 55)
			Texture.Texture = getAsset("RClothesContent/739677490.png")
			Texture.Transparency = 0.3

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"
			end
		end
	end

	function Function.SockLineDecal(ObjectInstance, Character, Extra, Data)
		for i = 1, 4 do
			local Texture = Instance.new("Texture", ObjectInstance)
			Texture.Color3 = Color3.fromRGB(255, 255, 255)
			Texture.Texture = getAsset("RClothesContent/8131038954.png")
			Texture.Transparency = 0.3

			if i == 1 then
				Texture.Face = "Left"
			elseif i == 2 then
				Texture.Face = "Right"
			elseif i == 3 then
				Texture.Face = "Back"
			elseif i == 4 then
				Texture.Face = "Front"
			--[[elseif i == 5 then
				Texture.Face = "Bottom"
			elseif i == 6 then
				Texture.Face = "Top"]]
			end
		end
	end

	function Function.AreolaDecalCreate(ObjectInstance, Character, Extra, Data)
		if not table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and ObjectInstance.Transparency ~= 1 or table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and (ObjectInstance.Name ~= "Left Breast" and ObjectInstance.Name ~= "Right Breast") and ObjectInstance.Transparency ~= 1 then
			for i = 1, 2 do
				local Decal = Instance.new("Decal", ObjectInstance)
				Decal.Color3 = Color3.fromRGB(255, 167, 169)
				Decal.Texture = getAsset("RClothesContent/6667257628.png")
				Decal.Face = "Left"
				Decal.Name = "Areola Decal".." "..tostring(i)
				PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

				if Extra.NippleColor ~= nil then
					Decal.Color3 = Extra.NippleColor
				elseif Extra.Tone == "Dark" then
					local H,S,V = ObjectInstance.Color:ToHSV()
					local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

					Decal.Color3 = DarkerColorCode
				end
			end
		else
			for i = 1, 2 do
				local Decal = Instance.new("Decal", ObjectInstance)
				Decal.Transparency = 1
				Decal.Color3 = Color3.fromRGB(255, 167, 169)
				Decal.Texture = getAsset("RClothesContent/6667257628.png")
				Decal.Face = "Left"
				Decal.Name = "Areola Decal".." "..tostring(i)
				PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

				if Extra.NippleColor ~= nil then
					Decal.Color3 = Extra.NippleColor
				elseif Extra.Tone == "Dark" then
					local H,S,V = ObjectInstance.Color:ToHSV()
					local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

					Decal.Color3 = DarkerColorCode
				end
			end
		end
	end

	function Function.AreolaDecalType2Create(ObjectInstance, Character, Extra, Data)
		if not table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and ObjectInstance.Transparency ~= 1 or table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and (ObjectInstance.Name ~= "Left Breast" and ObjectInstance.Name ~= "Right Breast") and ObjectInstance.Transparency ~= 1 then
			local Decal = Instance.new("Decal", ObjectInstance)
			Decal.Color3 = Color3.fromRGB(255, 167, 169)
			Decal.Texture = getAsset("RClothesContent/10374562715.png")
			Decal.Face = "Front"
			Decal.Name = "Areola Decal"
			PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

			if Extra.NippleColor ~= nil then
				Decal.Color3 = Extra.NippleColor
			elseif Extra.Tone == "Dark" then
				local H,S,V = ObjectInstance.Color:ToHSV()
				local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

				Decal.Color3 = DarkerColorCode
			end
		else
			local Decal = Instance.new("Decal", ObjectInstance)
			Decal.Transparency = 1
			Decal.Color3 = Color3.fromRGB(255, 167, 169)
			Decal.Texture = getAsset("RClothesContent/10374562715.png")
			Decal.Face = "Front"
			Decal.Name = "Areola Decal"
			PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

			if Extra.NippleColor ~= nil then
				Decal.Color3 = Extra.NippleColor
			elseif Extra.Tone == "Dark" then
				local H,S,V = ObjectInstance.Color:ToHSV()
				local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

				Decal.Color3 = DarkerColorCode
			end
		end
	end

	function Function.AreolaDecalType3Create(ObjectInstance, Character, Extra, Data)
		if not table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and ObjectInstance.Transparency ~= 1 or table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and (ObjectInstance.Name ~= "Left Breast" and ObjectInstance.Name ~= "Right Breast") and ObjectInstance.Transparency ~= 1 then
			local Decal = Instance.new("Decal", ObjectInstance)
			Decal.Color3 = Color3.fromRGB(255, 167, 169)
			Decal.Texture = getAsset("RClothesContent/9065282081.png")
			Decal.Face = "Right"
			Decal.Name = "Areola Decal"
			PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

			if Extra.NippleColor ~= nil then
				Decal.Color3 = Extra.NippleColor
			elseif Extra.Tone == "Dark" then
				local H,S,V = ObjectInstance.Color:ToHSV()
				local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

				Decal.Color3 = DarkerColorCode
			end
		else
			local Decal = Instance.new("Decal", ObjectInstance)
			Decal.Transparency = 1
			Decal.Color3 = Color3.fromRGB(255, 167, 169)
			Decal.Texture = getAsset("RClothesContent/9065282081.png")
			Decal.Face = "Right"
			Decal.Name = "Areola Decal"
			PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

			if Extra.NippleColor ~= nil then
				Decal.Color3 = Extra.NippleColor
			elseif Extra.Tone == "Dark" then
				local H,S,V = ObjectInstance.Color:ToHSV()
				local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

				Decal.Color3 = DarkerColorCode
			end
		end
	end

	function Function.AreolaDecalType5Create(ObjectInstance, Character, Extra, Data)
		--[[local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
		ObjectInstance:AddTag("ImportantSurfaceAppearance")
		Decal.Color = Color3.fromRGB(255, 167, 169)
		Decal.ColorMap = "rbxassetid://13779954418.png"
		Decal.Name = "Areola Decal"

		if Extra.NippleColor ~= nil then
			Decal.Color = Extra.NippleColor
		elseif Extra.Tone == "Dark" then
			local H,S,V = ObjectInstance.Color:ToHSV()
			local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

			Decal.Color = DarkerColorCode
		end]]

		if not table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and ObjectInstance.Transparency ~= 1 or table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing") and (ObjectInstance.Name ~= "Left Breast" and ObjectInstance.Name ~= "Right Breast") and ObjectInstance.Transparency ~= 1 then
			local Decal = Instance.new("Decal", ObjectInstance)
			Decal.Color3 = Color3.fromRGB(255, 167, 169)
			Decal.Texture = getAsset("RClothesContent/13779954418.png")
			Decal.Face = "Right"
			Decal.Name = "Areola Decal"
			PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

			if Extra.NippleColor ~= nil then
				Decal.Color3 = Extra.NippleColor
			elseif Extra.Tone == "Dark" then
				local H,S,V = ObjectInstance.Color:ToHSV()
				local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

				Decal.Color3 = DarkerColorCode
			end
		else
			local Decal = Instance.new("Decal", ObjectInstance)
			Decal.Transparency = 1
			Decal.Color3 = Color3.fromRGB(255, 167, 169)
			Decal.Texture = getAsset("RClothesContent/13779954418.png")
			Decal.Face = "Right"
			Decal.Name = "Areola Decal"
			PlayerData[Data].CurrentPartList.AreolaDecal[Decal] = ObjectInstance

			if Extra.NippleColor ~= nil then
				Decal.Color3 = Extra.NippleColor
			elseif Extra.Tone == "Dark" then
				local H,S,V = ObjectInstance.Color:ToHSV()
				local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

				Decal.Color3 = DarkerColorCode
			end
		end
	end

	function Function.NippleType5Mesh(ObjectInstance, Character, Extra, Data)
		local SpecialMesh = Instance.new("SpecialMesh")
		local Scale = PlayerData[Data]["BreastsScale"]

		SpecialMesh.MeshType = Enum.MeshType.FileMesh

		if ObjectInstance.Parent.Name == "Left Breast" then
			SpecialMesh.MeshId = getAsset("RClothesContent/13779756984.mesh")
		else
			SpecialMesh.MeshId = getAsset("RClothesContent/13779756939.mesh")
		end

		if Scale ~= nil then
			SpecialMesh.Scale = Function.Vector3Multiply(Vector3.new(0.336, 0.332, 0.333), {X = Scale, Y = Scale, Z = Scale})
		else
			SpecialMesh.Scale = Vector3.new(0.336, 0.332, 0.333)
		end

		SpecialMesh.Parent = ObjectInstance
		PlayerData[Data].CurrentPartList.RealtimeUpdateList.SpecialMesh[SpecialMesh] = {
			Base=Character:FindFirstChild("Torso"),
			Size=SpecialMesh.Scale,
		}
	end

	function Function.DarkPart(ObjectInstance, Character, Extra, Data)
		if Extra.NippleColor ~= nil then
			ObjectInstance.Color = Extra.NippleColor
		elseif Extra.Tone == "Dark" then
			local H,S,V = ObjectInstance.Parent.Color:ToHSV()
			local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

			ObjectInstance.Color = DarkerColorCode
		end
	end

	function Function.Dark2Part(ObjectInstance, Character, Extra, Data)
		if Extra.NippleColor ~= nil then
			local H,S,V = Extra.NippleColor:ToHSV()
			local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))

			ObjectInstance.Color = DarkerColorCode
		elseif Extra.Tone == "Dark" then
			local H,S,V = ObjectInstance.Parent.Color:ToHSV()
			local DarkerColorCode = Color3.fromHSV(H,S,V+(-Darker2ColorPercentage * V/100))

			ObjectInstance.Color = DarkerColorCode
		end
	end

	function Function.AreolaDecalUVCreate(ObjectInstance, Character, Extra, Data)
		if ObjectInstance:IsA("MeshPart") then
			local success, Decal = pcall(function()
				return Instance.new("SurfaceAppearance", ObjectInstance)
			end)
			if success and Decal then
				Decal.Color = Color3.fromRGB(255, 167, 169)
				Decal.ColorMap = "rbxassetid://9065282081"
				Decal.Name = "Areola Decal"
				Decal:AddTag("ImportantSurfaceAppearance")

				if Extra.NippleColor ~= nil then
					Decal.Color = Extra.NippleColor
				elseif Extra.Tone == "Dark" then
					local H,S,V = ObjectInstance.Color:ToHSV()
					local DarkerColorCode = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))
					Decal.Color = DarkerColorCode
				end
			end
		end
	end

	function Function.ToarBreastsOffset(ObjectInstance, Character, Extra, Data)
		local Torso = Character:WaitForChild("Torso")
		local LB = Torso:WaitForChild("Left Breast")
		local RB = Torso:WaitForChild("Right Breast")
		local LBW = LB:WaitForChild("Left Breast Weld")
		local RBW = RB:WaitForChild("Right Breast Weld")

		local LCF0 = CFrame.new(-0.24647522, 0.635473013, -0.450714111, 0.171514884, 0.185762599, -0.967509627, -0.0996441022, 0.980297148, 0.170553446, 0.980129421, 0.067154184, 0.186645687)
		local LCF1 = CFrame.new(0.200012207, 0.400001526, -1.52587891e-05, 1, 0, 0, 0, 1, 0, 0, 0, 1)
		local RCF0 = CFrame.new(0.246000007, 0.63499999, -0.451000005, -0.157161966, -0.1847606, -0.970135868, -0.0996441022, 0.980297148, -0.170553446, 0.982533038, 0.0698638037, -0.172475725)
		local RCF1 = CFrame.new(0.200000003, 0.400000006, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1)

		local XM, YM, ZM = Function.MultiplyCalculate(Torso.Size, BodyPartSize[Torso.Name])

		local RealtimeProperty = PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[LB]

		RealtimeProperty.CFrame = LCF0

		RealtimeProperty.CFrame1 = LCF1

		PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[LB] = RealtimeProperty

		local RealtimeProperty2 = PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[RB]
		RealtimeProperty2.CFrame = RCF0
		RealtimeProperty2.CFrame1 = RCF1
		PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[RB] = RealtimeProperty2

		if PlayerData[Data].MeshSizeLock == false then
			LBW.C0 = CFrame.new(LCF0.Position.X * XM, LCF0.Position.Y * YM, LCF0.Position.Z * ZM) * LCF0.Rotation
			LBW.C1 = CFrame.new(LCF1.Position.X * XM, LCF1.Position.Y * YM, LCF1.Position.Z * ZM) * LCF1.Rotation
			RBW.C0 = CFrame.new(RCF0.Position.X * XM, RCF0.Position.Y * YM, RCF0.Position.Z * ZM) * RCF0.Rotation
			RBW.C1 = CFrame.new(RCF1.Position.X * XM, RCF1.Position.Y * YM, RCF1.Position.Z * ZM) * RCF1.Rotation
		else
			LBW.C0 = LCF0
			LBW.C1 = LCF1
			RBW.C0 = RCF0
			RBW.C1 = RCF1
		end
	end

	function Function.BunnyBandPin(ObjectInstance, Character, Extra, Data)
		local BasePart

		if ObjectInstance.Name == "Left Bunny Band" then
			BasePart = Character:FindFirstChild("Left Arm")
		else
			BasePart = Character:FindFirstChild("Right Arm")
		end

		local Pin = Instance.new("Part", ObjectInstance)
		Pin.Shape = Enum.PartType.Cylinder
		Pin.Color = Color3.fromRGB(253, 234, 141)
		Pin.Material = Enum.Material.Metal
		Pin.CanCollide = false
		Pin.CanQuery = false
		Pin.CanTouch = false
		Pin.Massless = true
		Pin.CustomPhysicalProperties = PhysicalProperties.new(0.0001)
		Pin.Size = Vector3.new(0.052, 0.269, 0.218)

		local Weld = Instance.new("Weld", Pin)
		Weld.Part0 = ObjectInstance
		Weld.Part1 = Pin
		Weld.C0 = CFrame.new(0.007, 0, -0.593) * CFrame.Angles(0, 0, math.rad(180))

		PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[Pin] = {Size = Pin.Size, CFrame = Weld.C0, CFrame1 = CFrame.new(0,0,0), Base = BasePart, Weld = Weld}
	end

	function Function.SurfaceTexture(ObjectInstance, Character, Extra, Data)	
		if ObjectInstance:IsA("MeshPart") then
			local success, SP = pcall(function() return Instance.new("SurfaceAppearance", ObjectInstance) end)
			if success and SP then
				SP.ColorMap = ObjectInstance.TextureID
				ObjectInstance.TextureID = ""
			end
		end
	end

	function Function.ShirtTexture(ObjectInstance, Character, Extra, Data)	
		if Extra.Shirt and Extra.Shirt.ShirtTemplate and table.find(PlayerData[Data].CurrentClothes, "Roblox Shirt") then
			pcall(function() ObjectInstance.TextureID = Extra.Shirt.ShirtTemplate end)
			if ObjectInstance:FindFirstChildOfClass("SpecialMesh") then
				pcall(function() ObjectInstance:FindFirstChildOfClass("SpecialMesh").TextureId = Extra.Shirt.ShirtTemplate end)
			end
			if ObjectInstance.Material ~= Enum.Material.Glass and ObjectInstance:IsA("MeshPart") then
				local success, SP = pcall(function()
					return ObjectInstance:FindFirstChildOfClass("SurfaceAppearance") or Instance.new("SurfaceAppearance", ObjectInstance)
				end)
				if success and SP then
					SP.ColorMap = Extra.Shirt.ShirtTemplate
					SP.AlphaMode = Enum.AlphaMode.Overlay
				end
			end
		else
			local SP = ObjectInstance:FindFirstChildOfClass("SurfaceAppearance")
			if SP then SP:Destroy() end
		end
	end

	function Function.PantsTexture(ObjectInstance, Character, Extra, Data)
		if Extra.Pants and Extra.Pants.PantsTemplate and table.find(PlayerData[Data].CurrentClothes, "Roblox Pants") then
			pcall(function() ObjectInstance.TextureID = Extra.Pants.PantsTemplate end)
			if ObjectInstance:FindFirstChildOfClass("SpecialMesh") then
				pcall(function() ObjectInstance:FindFirstChildOfClass("SpecialMesh").TextureId = Extra.Pants.PantsTemplate end)
			end
			if ObjectInstance.Material ~= Enum.Material.Glass and ObjectInstance:IsA("MeshPart") then
				local success, SP = pcall(function()
					return ObjectInstance:FindFirstChildOfClass("SurfaceAppearance") or Instance.new("SurfaceAppearance", ObjectInstance)
				end)
				if success and SP then
					SP.ColorMap = Extra.Pants.PantsTemplate
					SP.AlphaMode = Enum.AlphaMode.Overlay
				end
			end
		else
			local SP = ObjectInstance:FindFirstChildOfClass("SurfaceAppearance")
			if SP then SP:Destroy() end
		end
	end

	function Function.TorsoShirtTexture(ObjectInstance, Character, Extra, Data)
		if Extra.Shirt and Extra.Shirt.ShirtTemplate and (table.find(PlayerData[Data].CurrentClothes, "Roblox Shirt") or table.find(PlayerData[Data].CurrentClothes, "New Woman") or table.find(PlayerData[Data].CurrentClothes, "Roblox Breasts Clothing")) then
			pcall(function() ObjectInstance.TextureID = Extra.Shirt.ShirtTemplate end)
			if ObjectInstance:FindFirstChildOfClass("SpecialMesh") then
				pcall(function() ObjectInstance:FindFirstChildOfClass("SpecialMesh").TextureId = Extra.Shirt.ShirtTemplate end)
			end
			if ObjectInstance.Material == Enum.Material.Glass or ObjectInstance:HasTag("RCGlassMat") or not ObjectInstance:IsA("MeshPart") then
				if ObjectInstance.Transparency < 1 then
					ObjectInstance.Transparency = 0.011
				end
			else
				local success, SP = pcall(function() return Instance.new("SurfaceAppearance", ObjectInstance) end)
				if success and SP then
					SP.ColorMap = Extra.Shirt.ShirtTemplate
					SP.AlphaMode = Enum.AlphaMode.Transparency
					ObjectInstance.Transparency = 0
				end
			end
		end
	end

	function Function.TorsoPantsTexture(ObjectInstance, Character, Extra, Data)
		if Extra.Pants and Extra.Pants.PantsTemplate and (table.find(PlayerData[Data].CurrentClothes, "Roblox Pants")) then
			pcall(function() ObjectInstance.TextureID = Extra.Pants.PantsTemplate end)
			if ObjectInstance:FindFirstChildOfClass("SpecialMesh") then
				pcall(function() ObjectInstance:FindFirstChildOfClass("SpecialMesh").TextureId = Extra.Pants.PantsTemplate end)
			end
			if ObjectInstance.Material == Enum.Material.Glass or ObjectInstance:HasTag("RCGlassMat") or not ObjectInstance:IsA("MeshPart") then
				if ObjectInstance.Transparency < 1 then
					ObjectInstance.Transparency = 0.011
				end
			else
				local success, SP = pcall(function() return Instance.new("SurfaceAppearance", ObjectInstance) end)
				if success and SP then
					SP.ColorMap = Extra.Pants.PantsTemplate
					SP.AlphaMode = Enum.AlphaMode.Transparency
					ObjectInstance.Transparency = 0
				end
			end
		end
	end

	function Function.TorsoShirtGraphic(ObjectInstance, Character, Extra, Data)
		if Extra.TShirt and table.find(PlayerData[Data].CurrentClothes, "Roblox Shirt") then
			if ObjectInstance:IsA("MeshPart") then
				pcall(function()
					local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
					Decal.ColorMap = Extra.TShirt.Graphic
				end)
			else
				pcall(function()
					local Decal = Instance.new("Decal", ObjectInstance)
					Decal.Texture = Extra.TShirt.Graphic
				end)
			end
		end
	end

	function Function.NewWomanShirtClothing(ObjectInstance, Character, Extra, Data)
		local Model = Instance.new("Model", ObjectInstance)
		if ObjectInstance.Name == "New Woman Left Arm Mesh" then
			local Arm = ObjectInstance:Clone()
			Arm.Transparency = 0
			Arm.Parent = Model
			Arm.Name = "Left Arm"
			local weld = Instance.new("Weld", Model)
			weld.Part0 = ObjectInstance
			weld.Part1 = Arm
			local Cmesh = Instance.new("CharacterMesh", Model)
			Cmesh.BodyPart = Enum.BodyPart.LeftArm
			Cmesh.MeshId = 83001137
		else
			local Arm = ObjectInstance:Clone()
			Arm.Transparency = 0
			Arm.Parent = Model
			Arm.Name = "Right Arm"
			local weld = Instance.new("Weld", Model)
			weld.Part0 = ObjectInstance
			weld.Part1 = Arm
			local Cmesh = Instance.new("CharacterMesh", Model)
			Cmesh.BodyPart = Enum.BodyPart.RightArm
			Cmesh.MeshId = 83001181
		end
		Instance.new("Humanoid", Model)
		if Extra.Shirt and table.find(PlayerData[Data].CurrentClothes, "New Woman") then
			Extra.Shirt:Clone().Parent = Model
		end
	end

	function Function.NewWomanBreastShirtClothing(ObjectInstance, Character, Extra, Data)
		if Extra.Shirt and table.find(PlayerData[Data].CurrentClothes, "New Woman") then
			pcall(function() ObjectInstance.TextureID = Extra.Shirt.ShirtTemplate end)
			if ObjectInstance:IsA("MeshPart") then
				pcall(function()
					local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
					Decal.ColorMap = Extra.Shirt.ShirtTemplate
					Decal.AlphaMode = Enum.AlphaMode.Transparency
				end)
			end
			for i, v in pairs(PlayerData[Data].CurrentPartList.AreolaDecal) do
				for i1, v1 in pairs(v:GetDescendants()) do
					if v1.ClassName == "Decal" then
						v1.Transparency = 1
					end
				end
			end
		end
	end
	function Function.NewWomanBreastPantsClothing(ObjectInstance, Character, Extra, Data)
		if Extra.Shirt and table.find(PlayerData[Data].CurrentClothes, "New Woman") then
			pcall(function() ObjectInstance.TextureID = Extra.Shirt.ShirtTemplate end)
			if ObjectInstance:IsA("MeshPart") then
				pcall(function()
					local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
					Decal.ColorMap = Extra.Shirt.ShirtTemplate
					Decal.AlphaMode = Enum.AlphaMode.Transparency
				end)
			end
			for i, v in pairs(PlayerData[Data].CurrentPartList.AreolaDecal) do
				for i1, v1 in pairs(v:GetDescendants()) do
					if v1.ClassName == "Decal" then
						v1.Transparency = 1
					end
				end
			end
		end
	end

	function Function.NewWomanTorsoShirtClothing(ObjectInstance, Character, Extra, Data)
		if Extra.Shirt and table.find(PlayerData[Data].CurrentClothes, "New Woman") then
			pcall(function() ObjectInstance.TextureID = Extra.Shirt.ShirtTemplate end)
			if ObjectInstance:IsA("MeshPart") then
				pcall(function()
					local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
					Decal.ColorMap = Extra.Shirt.ShirtTemplate
				end)
			end
		end
	end

	function Function.NewWomanTorsoPantsClothing(ObjectInstance, Character, Extra, Data)
		if Extra.Pants and table.find(PlayerData[Data].CurrentClothes, "New Woman") then
			pcall(function() ObjectInstance.TextureID = Extra.Pants.PantsTemplate end)
			if ObjectInstance:IsA("MeshPart") then
				pcall(function()
					local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
					Decal.ColorMap = Extra.Pants.PantsTemplate
					if PlayerData[Data].CurrentPartList.Organ["Right Butt"] and PlayerData[Data].CurrentPartList.Organ["Right Butt"]:IsA("MeshPart") then
						Decal:Clone().Parent = PlayerData[Data].CurrentPartList.Organ["Right Butt"]
					end
					if PlayerData[Data].CurrentPartList.Organ["Left Butt"] and PlayerData[Data].CurrentPartList.Organ["Left Butt"]:IsA("MeshPart") then
						Decal:Clone().Parent = PlayerData[Data].CurrentPartList.Organ["Left Butt"]
					end
				end)
			end
		end
	end

	function Function.NewWomanPantsClothing(ObjectInstance, Character, Extra, Data)
		if Extra.Pants and table.find(PlayerData[Data].CurrentClothes, "New Woman") then
			pcall(function() ObjectInstance.TextureID = Extra.Pants.PantsTemplate end)
			if ObjectInstance:IsA("MeshPart") then
				pcall(function()
					local Decal = Instance.new("SurfaceAppearance", ObjectInstance)
					Decal.ColorMap = Extra.Pants.PantsTemplate
				end)
			end
		end
	end

	function Function.BreastsType2Mesh(ObjectInstance, Character, Extra, Data)
		local SpecialMesh = Instance.new("SpecialMesh")
		local Scale = PlayerData[Data]["BreastsScale"]

		SpecialMesh.MeshType = Enum.MeshType.FileMesh

		if ObjectInstance.Name == "Left Breast" then
			SpecialMesh.MeshId = getAsset("RClothesContent/99196487433776.mesh")
		else
			SpecialMesh.MeshId = getAsset("RClothesContent/135832822984550.mesh")
		end

		if Scale ~= nil then
			SpecialMesh.Scale = Function.Vector3Multiply(Vector3.new(1, 1, 1), {X = Scale, Y = Scale, Z = Scale})
		else
			SpecialMesh.Scale = Vector3.new(1, 1, 1)
		end

		SpecialMesh.Parent = ObjectInstance
	end

	function Function.BreastsType3Mesh(ObjectInstance, Character, Extra, Data)
		local SpecialMesh = Instance.new("SpecialMesh")
		local Scale = PlayerData[Data]["BreastsScale"]

		SpecialMesh.MeshType = Enum.MeshType.FileMesh

		if ObjectInstance.Name == "Left Breast" then
			SpecialMesh.MeshId = getAsset("RClothesContent/5270415437.mesh")
		else
			SpecialMesh.MeshId = getAsset("RClothesContent/5270413797.mesh")
		end

		if Scale ~= nil then
			SpecialMesh.Scale = Function.Vector3Multiply(Vector3.new(0.541, 0.541, 0.541), {X = Scale, Y = Scale, Z = Scale})
		else
			SpecialMesh.Scale = Vector3.new(0.541, 0.541, 0.541)
		end

		SpecialMesh.Parent = ObjectInstance
	end

	function Function.AreolaType4Mesh(ObjectInstance, Character, Extra, Data)
		local SpecialMesh = Instance.new("SpecialMesh")

		SpecialMesh.MeshType = Enum.MeshType.Sphere
		SpecialMesh.Parent = ObjectInstance
	end

	function Function.BreastPhysics(ObjectInstance, Character, Extra, Data)
		if PlayerData[Data].BodyPartPhysics then
			local Torso = Character:FindFirstChild("Torso")

			if Torso then
				local Rotation = {
					X = 2.5,
					Y = -5,
					Z = 0
				}
				local Position = {
					X = 0,
					Y = 0,
					Z = 0
				}	

				Function.SpringCreate(
					ObjectInstance, 
					Torso, 
					Vector3.new(0,0,0), 
					Vector3.new(0,0,0), 
					8, 
					0.207, 
					{
						X = "X",
						Y = "Y",
						Z = "Z",
					},
					Position,
					{
						X = "Z",
						Y = "X",
						Z = "Y",
					},
					Rotation,
					Data
				)
			end
		end
	end

	function Function.VibratorStrings(ObjectInstance, Character, Extra, Data)
		for i = 1, 6 do
			local Right = Instance.new("Attachment", ObjectInstance)
			Right.CFrame = CFrame.new(0.499897003, -0.149800062, 0.0025343895, 4.35450538e-08, 7.4505806e-09, 1, 3.80969833e-09, 1, -7.4505806e-09, -1, 3.80969878e-09, 4.35450538e-08)
			local Left = Instance.new("Attachment", ObjectInstance)
			Left.CFrame = CFrame.new(-0.500102997, -0.150360584, -0.00253152847, 4.35450538e-08, 7.4505806e-09, 1, 3.80969833e-09, 1, -7.4505806e-09, -1, 3.80969878e-09, 4.35450538e-08)

			local LB = PlayerData[Data].CurrentPartList.Clothes["Left Vibrator Bullet"]
			local LBR = Instance.new("Attachment", LB)
			LBR.CFrame = CFrame.new(0.0799999982, 0, -0.0649999976, 1, 7.45057704e-08, 4.09781755e-08, -7.45057704e-08, 1, -1.22124469e-15, -4.09781755e-08, -1.83186587e-15, 1)
			local LBL = Instance.new("Attachment", LB)
			LBL.CFrame = CFrame.new(0.0799999982, 0, 0.0700000003, 1, 1.043081e-07, 5.215405e-08, -1.043081e-07, 1, -3.10862362e-15, -5.215405e-08, -2.33146623e-15, 1)

			local RB = PlayerData[Data].CurrentPartList.Clothes["Right Vibrator Bullet"]
			local RBR = Instance.new("Attachment", RB)
			RBR.CFrame = CFrame.new(0.0799999982, 0, -0.0649999976, 1, 7.45057704e-08, 4.09781755e-08, -7.45057704e-08, 1, -1.22124469e-15, -4.09781755e-08, -1.83186587e-15, 1)
			local RBL = Instance.new("Attachment", RB)
			RBL.CFrame = CFrame.new(0.0799999982, 0, 0.0700000003, 1, 1.043081e-07, 5.215405e-08, -1.043081e-07, 1, -3.10862362e-15, -5.215405e-08, -2.33146623e-15, 1)

			local l1 = Instance.new("RopeConstraint",LB)
			l1.Thickness = 0.02
			l1.Length = 1.5
			l1.Color = BrickColor.new("Carnation pink")
			l1.Visible = true
			l1.Attachment0 = LBR
			l1.Attachment1 = Left
			local l2 = Instance.new("RopeConstraint",LB)
			l2.Thickness = 0.02
			l2.Length = 1.5
			l2.Color = BrickColor.new("Carnation pink")
			l2.Visible = true
			l2.Attachment0 = LBL
			l2.Attachment1 = Left

			local r1 = Instance.new("RopeConstraint",RB)
			r1.Thickness = 0.02
			r1.Length = 1.5
			r1.Color = BrickColor.new("Carnation pink")
			r1.Visible = true
			r1.Attachment0 = RBL
			r1.Attachment1 = Right
			local r2 = Instance.new("RopeConstraint",RB)
			r2.Thickness = 0.02
			r2.Length = 1.5
			r2.Color = BrickColor.new("Carnation pink")
			r2.Visible = true
			r2.Attachment0 = RBR
			r2.Attachment1 = Right
		end
	end

	function Function.TopLayer(Visible, c, Data)
		local PData = PlayerData[Data]
		local appliedOrgans = {
			PData.CurrentPartList["Organ"]["Left Arm"],
			PData.CurrentPartList["Organ"]["Right Arm"],
		}
		local appliedTOrgans = {
			PData.CurrentPartList["Clothes"]["Torso Shirt"],
			PData.CurrentPartList["Clothes"]["Breasts Shirt"],
			PData.CurrentPartList["Clothes"]["Breasts Shirt 2"],
			PData.CurrentPartList["Clothes"]["Breasts Shirt 3"]
		}
		if Visible == false then
			for i, v in pairs(appliedOrgans) do
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					if PData.HPClothes.Shirt ~= "" and not tonumber(PData.HPClothes.Shirt) then
						s.TextureID = PData.HPClothes.Shirt.ShirtTemplate
					else
						s.Transparency = 1
						s:SetAttribute("MaxTransparenyRC",1)
					end
				else
					if v:FindFirstChildOfClass("SurfaceAppearance") then
						v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
					end
					if PData.HPClothes.Shirt ~= "" and not tonumber(PData.HPClothes.Shirt) then
						Function.ShirtTexture(v,nil,{Shirt = PData.HPClothes.Shirt},Data)
					end
				end
			end
			for i, v in pairs(appliedTOrgans) do
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					if PData.HPClothes.Shirt ~= "" and not tonumber(PData.HPClothes.Shirt) then
						s.TextureID = PData.HPClothes.Shirt.ShirtTemplate
					else
						s.Transparency = 1
						s:SetAttribute("MaxTransparenyRC",1)
					end
				else
					if PData.HPClothes.Shirt ~= "" and not tonumber(PData.HPClothes.Shirt) then
						if v.Name == "Torso Shirt" then
							v:SetAttribute("maxDeterminedRC",false)
							v:SetAttribute("MaxTransparenyRC",nil)
							v.Transparency = v.Parent.Transparency
						end
						Function.TorsoShirtTexture(v,nil,{Shirt = PData.HPClothes.Shirt},Data)
					end
				end
			end

			--[[if PData.HPClothes.Shirt ~= "" and not tonumber(PData.HPClothes.Shirt) then
				if not PData.HPClothes.Pants then
					local v = PData.CurrentPartList["Organ"]["Torso"]
					if v:FindFirstChild(v.Name.. "OILOVERLAY") then
						local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
						s.TextureID =  PData.HPClothes.Shirt.ShirtTemplate
					else
						Function.ShirtTexture(PData.CurrentPartList["Organ"]["Torso"],c,{Shirt = PData.HPClothes.Shirt},Data)
					end
				end
			end]]
		else
			for i, v in pairs(appliedOrgans) do
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					if c:FindFirstChildOfClass("Shirt") then
						s:SetAttribute("MaxTransparenyRC",nil)
						s.TextureID = c:FindFirstChildOfClass("Shirt").ShirtTemplate
					end
				else
					if v:FindFirstChildOfClass("SurfaceAppearance") then
						v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
					end
					if c:FindFirstChildOfClass("Shirt") then
						Function.ShirtTexture(v,c,{Shirt = c:FindFirstChildOfClass("Shirt")},Data)
					end
				end
			end
			for i, v in pairs(appliedTOrgans) do
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					if c:FindFirstChildOfClass("Shirt") then
						s:SetAttribute("MaxTransparenyRC",nil)
						s.TextureID = c:FindFirstChildOfClass("Shirt").ShirtTemplate
					end
				else
					if v:FindFirstChildOfClass("SurfaceAppearance") then
						v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
					end
					if c:FindFirstChildOfClass("Shirt") then
						Function.TorsoShirtTexture(v,c,{Shirt = c:FindFirstChildOfClass("Shirt")},Data)
					end
				end
			end

			--[[local v = PData.CurrentPartList["Organ"]["Torso"]
			if (not c:FindFirstChildOfClass("Pants") or not PData.HPClothes.Pants) and v:FindFirstChildOfClass("SurfaceAppearance") then
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					s:SetAttribute("MaxTransparenyRC",1)
				else
					PData.CurrentPartList["Organ"]["Torso"]:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
				end
			end]]
		end
	end

	function Function.BottomLayer(Visible, c, Data)
		local PData = PlayerData[Data]
		local appliedOrgans = {
			PData.CurrentPartList["Organ"]["Torso"],
			PData.CurrentPartList["Organ"]["Left Leg"],
			PData.CurrentPartList["Organ"]["Right Leg"],
			PData.CurrentPartList["Organ"]["Left Butt"],
			PData.CurrentPartList["Organ"]["Right Butt"],
			PData.CurrentPartList["Organ"]["Breasts Pants"],
			PData.CurrentPartList["Organ"]["Breasts Pants 2"],
			PData.CurrentPartList["Organ"]["Breasts Pants 3"]
		}

		if Visible == false then
			for i, v in pairs(appliedOrgans) do
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					if PData.HPClothes.Pants ~= "" and not tonumber(PData.HPClothes.Pants) then
						s.TextureID = PData.HPClothes.Pants.PantsTemplate
					else
						s.Transparency = 1
						s:SetAttribute("MaxTransparenyRC",1)
					end
				else
					if v:FindFirstChildOfClass("SurfaceAppearance") then
						v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
					end
					if PData.HPClothes.Pants ~= "" and not tonumber(PData.HPClothes.Pants) then
						Function.PantsTexture(v,nil,{Pants = PData.HPClothes.Pants},Data)
					end
				end
			end
		else
			for i, v in pairs(appliedOrgans) do
				if v:FindFirstChild(v.Name.. "OILOVERLAY") then
					local s = v:FindFirstChild(v.Name.. "OILOVERLAY")
					if c:FindFirstChildOfClass("Pants") then
						s:SetAttribute("MaxTransparenyRC",nil)
						s.TextureID = c:FindFirstChildOfClass("Pants").PantsTemplate
					end
				else
					if v:FindFirstChildOfClass("SurfaceAppearance") then
						v:FindFirstChildOfClass("SurfaceAppearance"):Destroy()
					end
					if c:FindFirstChildOfClass("Shirt") then
						Function.PantsTexture(v,c,{Pants = c:FindFirstChildOfClass("Pants")},Data)
					end
				end
			end
		end
	end

	function Function.HPLactation(Visible, Character, Data)
		local PData = PlayerData[Data]
		local particleOrgans = {
			PData.CurrentPartList["Organ"]["Left Nipple"],
			PData.CurrentPartList["Organ"]["Right Nipple"],
		}
		for i, v in pairs(particleOrgans) do
			if v:FindFirstChild("Lactation") then
				local s = v:FindFirstChild("Lactation")
				if s:FindFirstChildOfClass("ParticleEmitter") then
					s:FindFirstChildOfClass("ParticleEmitter").Enabled = Visible
				end
			end
		end
	end

	function Function.HPPussyCum(Visible, Character, Data)
		local PData = PlayerData[Data]
		if PData.CurrentPartList["Clothes"]["Pussy Cum"] then
			if PData.CurrentPartList["Clothes"]["Pussy Cum"]:FindFirstChildOfClass("Attachment") then
				local attach = PData.CurrentPartList["Clothes"]["Pussy Cum"]:FindFirstChildOfClass("Attachment")
				attach:FindFirstChildOfClass("ParticleEmitter"):SetAttribute("Enabled",Visible)
				attach:FindFirstChildOfClass("ParticleEmitter").Enabled = false
			end
		end
	end

	function Function.ShirtPop(Visible, Character, Data, Clothing)
		local PData = PlayerData[Data]
		if Visible == false then
			
		end
	end


	function Function.CumBreastTypeSupport(ObjectInstance, Character, Extra, Data)
		local function adjustSize(SIZE,CFRAME,CFRAME1)
			local pList = PlayerData[Data].PartList

			if pList[ObjectInstance.Name].Scale then
				local Scale = PlayerData[Data][pList[ObjectInstance.Name].Scale]
				for i, Adjust in pairs(pList[ObjectInstance.Name].AdjustScale) do
					if Adjust == "Size" and SIZE then
						SIZE = Function.Vector3Multiply(SIZE, {X = Scale, Y = Scale, Z = Scale})
					elseif Adjust == "CFrame" and CFRAME then
						CFRAME = Function.CFrameMultiply(CFRAME, {X = Scale, Y = Scale, Z = Scale})
					elseif Adjust == "CFrame1" and CFRAME1 then
						CFRAME1 = Function.CFrameMultiply(CFRAME1, {X = Scale, Y = Scale, Z = Scale})
					end
				end
				return SIZE,CFRAME,CFRAME1
			end
		end

		task.delay(0,function()
			local SIZE,CFRAME,CFRAME1
			if PlayerData[Data].BreastsType == 5 then
				if ObjectInstance.Name == "Left Breast Cum" then
					SIZE,CFRAME,CFRAME1 = adjustSize(
						Vector3.new(1.0431958436965942, 1.0279223918914795, 1.0504292249679565),
						CFrame.new(-0.0385475159, 0.00672912598, 0.191131592, -0.257634491, -0.0129809687, 0.966147125, 0.2354206, -0.970619977, 0.049738057, 0.937122285, 0.240266144, 0.25312531),
						nil
					)
				else
					SIZE,CFRAME,CFRAME1 = adjustSize(
						Vector3.new(1.0545662641525269, 1.1099238395690918, 1.0778725147247314),
						CFrame.new(0.00855636597, 0.0169401169, 0.177431107, 0.200725764, -0.0731868595, 0.976906657, 0.245940372, -0.961504698, -0.122565337, 0.94827354, 0.26486361, -0.175000176),
						nil
					)
				end
			end
			if CFRAME then
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Weld.C0 = CFRAME
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].CFrame = CFRAME
			end
			if CFRAME1 then
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Weld.C1 = CFRAME1
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].CFrame1 = CFRAME1
			end
			if SIZE then
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Size = SIZE
			end
		end)
	end

	function Function.CumBreastTypeSupport2(ObjectInstance, Character, Extra, Data)
		local function adjustSize(SIZE,CFRAME,CFRAME1)
			local pList = PlayerData[Data].PartList

			if pList[ObjectInstance.Name].Scale then
				local Scale = PlayerData[Data][pList[ObjectInstance.Name].Scale]
				for i, Adjust in pairs(pList[ObjectInstance.Name].AdjustScale) do
					if Adjust == "Size" and SIZE then
						SIZE = Function.Vector3Multiply(SIZE, {X = Scale, Y = Scale, Z = Scale})
					elseif Adjust == "CFrame" and CFRAME then
						CFRAME = Function.CFrameMultiply(CFRAME, {X = Scale, Y = Scale, Z = Scale})
					elseif Adjust == "CFrame1" and CFRAME1 then
						CFRAME1 = Function.CFrameMultiply(CFRAME1, {X = Scale, Y = Scale, Z = Scale})
					end
				end
				return SIZE,CFRAME,CFRAME1
			end
		end

		task.delay(0,function()
			local SIZE,CFRAME,CFRAME1
			if PlayerData[Data].BreastsType == 5 then
				if ObjectInstance.Name == "Left Breast Cum Type2" then
					SIZE,CFRAME,CFRAME1 = adjustSize(
						Vector3.new(1.0918655395507812, 1.1918118000030518, 0.9290794730186462),
						CFrame.new(0.0232696533, 0.0218110085, 0.150587082, -0.398268014, 0.315826893, 0.861175716, 0.190337941, -0.889963865, 0.414410204, 0.897302926, 0.328962803, 0.294332504),
						nil
					)
				else
					SIZE,CFRAME,CFRAME1 = adjustSize(
						Vector3.new(1.0635958909988403, 1.1270167827606201, 0.9429950714111328),
						CFrame.new(0.0309181213, 0.048415184, 0.11444664, 0.403301537, -0.0736357272, 0.912096083, 0.305572629, -0.928701997, -0.210090145, 0.862538338, 0.363442421, -0.352047503),
						nil
					)
				end
			end
			if CFRAME then
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Weld.C0 = CFRAME
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].CFrame = CFRAME
			end
			if CFRAME1 then
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Weld.C1 = CFRAME1
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].CFrame1 = CFRAME1
			end
			if SIZE then
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance].Size = SIZE
			end
		end)
	end

	function Function.ButtType1(Data)
		local PData = PlayerData[Data]
		if PData.ButtType == 1 then
			return true
		else
			return false
		end
	end

	function Function.RudolphTorso(Data)
		local PData = PlayerData[Data]
		if PData.TorsoType == 3 then
			return true
		else
			return false
		end
	end

	function Function.RudolphArms(Data)
		local PData = PlayerData[Data]
		if PData.ArmType == 2 then
			return true
		else
			return false
		end
	end

	function Function.RudolphLegs(Data)
		local PData = PlayerData[Data]
		if PData.LegsType == 3 then
			return true
		else
			return false
		end
	end

