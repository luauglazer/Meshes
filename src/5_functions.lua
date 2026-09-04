	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------Function----------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------
	----------------------------------------------------------------------------------------------------

	function Function.convertToJSON(value:UDim2)
		if typeof(value) == "Color3" then
			return {["R"] = value.R, ["G"] = value.G, ["B"] = value.B}
		elseif typeof(value) == "Vector3" then
			return {["X"] = value.X, ["Y"] = value.Y, ["Z"] = value.Z}
		elseif typeof(value) == "CFrame" then
			return {["CFrameComponents"] = {value:GetComponents()}}
		elseif typeof(value) == "EnumItem" then
			local enumType = tostring(value.EnumType):gsub("^Enum%.", "")
			return {["EnumType"] = enumType, ["Value"] = value.Value, ["Name"] = value.Name}
		elseif typeof(value) == "UDim2" then
			return {["Scale"]={["X"] = value.X.Scale, ["Y"] = value.Y.Scale}, 
				["Offset"]={["X"] = value.X.Offset, ["Y"] = value.Y.Offset}}
		end
		return value
	end

	function Function.convertFromJSON(value)
		if typeof(value) == "table" then
			if value["R"] and value["G"] and value["B"] then
				return Color3.new(value.R, value.G, value.B)
			elseif value["X"] and value["Y"] and value["Z"] then
				return Vector3.new(value.X, value.Y, value.Z)
			elseif value["CFrameComponents"] then
				local c = value["CFrameComponents"]
				return CFrame.new(table.unpack(c))
			elseif value["EnumType"] and (value["Name"] or value["Value"]) then
				local enumType = tostring(value.EnumType):gsub("^Enum%.", "")
				local enumObj = Enum[enumType]
				if enumObj then
					if value["Name"] then
						local s, res = pcall(function() return enumObj[value.Name] end)
						if s and typeof(res) == "EnumItem" then
							return res
						end
					end
					if value["Value"] and enumObj.FromValue then
						local s, res = pcall(function() return enumObj:FromValue(value.Value) end)
						if s and typeof(res) == "EnumItem" then
							return res
						end
					end
				end
			elseif value["Scale"] and value["Offset"] then
				return UDim2.new(value.Scale.X, value.Offset.X, value.Scale.Y, value.Offset.Y)
			end
		end
		return value,true
	end

	function Function.ResolveKeybind(val, fallback)
		if typeof(val) == "EnumItem" then
			return val
		elseif typeof(val) == "table" then
			local converted = Function.convertFromJSON(val)
			if typeof(converted) == "EnumItem" then
				return converted
			end
			if val.Name then
				local s, res = pcall(function() return Enum.KeyCode[val.Name] end)
				if s and typeof(res) == "EnumItem" then return res end
			end
			if val.Value then
				local s, res = pcall(function() return Enum.KeyCode:FromValue(val.Value) end)
				if s and typeof(res) == "EnumItem" then return res end
			end
		elseif typeof(val) == "string" then
			local cleanName = tostring(val):gsub("^Enum%.KeyCode%.", ""):gsub("^KeyCode%.", "")
			local s, res = pcall(function() return Enum.KeyCode[cleanName] end)
			if s and typeof(res) == "EnumItem" then
				return res
			end
		elseif typeof(val) == "number" then
			local s, res = pcall(function() return Enum.KeyCode:FromValue(val) end)
			if s and typeof(res) == "EnumItem" then
				return res
			end
		end
		return fallback
	end

	function Function.SaveSettings(showButtonFeedback)
		local success, err = pcall(function()
			if not env.writefile then return end

			if env.makefolder then
				local isfolderFn = env.isfolder or function() return false end
				if not isfolderFn("RClothesLerp") then
					pcall(env.makefolder, "RClothesLerp")
				end
				if not isfolderFn("RClothesLerp/Bundles") then
					pcall(env.makefolder, "RClothesLerp/Bundles")
				end
			end

			local saveData = {
				loadupClosed = (loadupClosed == true),
				loadupExecute = (loadupExecute == true),
				loadupFPerson = tonumber(loadupFPerson) or 0,
				loadupBundle = tostring(loadupBundle or "Default"),
				saveClothesOption = tostring(saveClothesOption or "Clothed"),
				KEYBIND = Function.convertToJSON(KEYBIND),
				hpKEYBIND = Function.convertToJSON(hpKEYBIND),
				dpKEYBIND = Function.convertToJSON(dpKEYBIND),
			}

			local mobileButtons = {}
			if GUIObject and GUIObject.ImageHeal and GUIObject.ImageHeal.Position then
				mobileButtons.HealPos = Function.convertToJSON(GUIObject.ImageHeal.Position)
			end
			if GUIObject and GUIObject.ImageTear and GUIObject.ImageTear.Position then
				mobileButtons.TearPos = Function.convertToJSON(GUIObject.ImageTear.Position)
			end

			env.writefile("RClothesLerp/Settings.json", HS:JSONEncode(saveData))
			if mobileButtons.HealPos and mobileButtons.TearPos then
				env.writefile("RClothesLerp/MobileButtonPlacement.json", HS:JSONEncode(mobileButtons))
			end
		end)

		if showButtonFeedback and GUIObject and GUIObject.saveButton then
			if success then
				GUIObject.saveButton.Text = "Saved"
				task.delay(1, function()
					if GUIObject and GUIObject.saveButton then
						GUIObject.saveButton.Text = "Save"
					end
				end)
			else
				GUIObject.saveButton.Text = "FAILED!"
				task.delay(1, function()
					if GUIObject and GUIObject.saveButton then
						GUIObject.saveButton.Text = "Save"
					end
				end)
			end
		end
		return success
	end

	function Function.LoadSettings()
		local loadSuccess, err = pcall(function()
			local readFn = env.readfile
			local isfileFn = env.isfile or function(p)
				local s, c = pcall(readFn, p)
				return s and c ~= nil
			end

			if not (readFn and isfileFn and isfileFn("RClothesLerp/Settings.json")) then
				return
			end

			local content = readFn("RClothesLerp/Settings.json")
			if not content or content == "" then return end

			local settings = HS:JSONDecode(content)
			if typeof(settings) ~= "table" then return end

			for i, v in pairs(settings) do
				settings[i] = Function.convertFromJSON(v)
			end

			if settings.loadupBundle ~= nil and settings.loadupBundle ~= "" then
				loadupBundle = tostring(settings.loadupBundle)
			end
			if settings.loadupExecute ~= nil then
				loadupExecute = (settings.loadupExecute == true)
			end
			if settings.loadupClosed ~= nil then
				loadupClosed = (settings.loadupClosed == true)
			end
			if settings.loadupFPerson ~= nil then
				local num = tonumber(settings.loadupFPerson)
				if num and num >= 0 and num <= maxFPersonMethod then
					loadupFPerson = num
				end
			end
			if settings.saveClothesOption ~= nil then
				saveClothesOption = tostring(settings.saveClothesOption)
			end
			if settings.KEYBIND ~= nil then
				KEYBIND = Function.ResolveKeybind(settings.KEYBIND, KEYBIND)
			end
			if settings.hpKEYBIND ~= nil then
				hpKEYBIND = Function.ResolveKeybind(settings.hpKEYBIND, hpKEYBIND)
			end
			if settings.dpKEYBIND ~= nil then
				dpKEYBIND = Function.ResolveKeybind(settings.dpKEYBIND, dpKEYBIND)
			end
		end)

		pcall(function()
			local readFn = env.readfile
			local isfileFn = env.isfile or function(p)
				local s, c = pcall(readFn, p)
				return s and c ~= nil
			end
			if readFn and isfileFn and isfileFn("RClothesLerp/MobileButtonPlacement.json") then
				local content = readFn("RClothesLerp/MobileButtonPlacement.json")
				if content and content ~= "" then
					local mSettings = HS:JSONDecode(content)
					if typeof(mSettings) == "table" then
						for i, v in pairs(mSettings) do
							mSettings[i] = Function.convertFromJSON(v)
						end
						task.delay(0, function()
							if GUIObject and GUIObject.ImageHeal and mSettings.HealPos then
								GUIObject.ImageHeal.Position = mSettings.HealPos
							end
							if GUIObject and GUIObject.ImageTear and mSettings.TearPos then
								GUIObject.ImageTear.Position = mSettings.TearPos
							end
						end)
					end
				end
			end
		end)
		return loadSuccess
	end
	
	function Function.toFormatString(value)
		if typeof(value) == "Color3" then
			return string.format("Color3.fromRGB(%s, %s, %s)", value.R * 255, value.G * 255, value.B * 255)
		elseif typeof(value) == "Vector3" then
			return string.format("Vector3.new(%s, %s, %s)", value.X, value.Y, value.Z)
		elseif typeof(value) == "string" then
			return string.format("%q", value)
		elseif typeof(value) == "CFrame" then
			return string.format("CFrame.new(%s)", tostring(value))
		end
		return tostring(value)
	end

	function Function.JaroSimilarity(original: string, target: string): number
		local original_len = original:len()
		local target_len = target:len()

		if (original_len == 0 and target_len == 0) or (original == target) then return 1 end

		local match_distance = (math.floor(math.max(original_len, target_len) / 2)) - 1
		local original_matches = table.create(original_len, false)
		local target_matches = table.create(target_len, false)

		local matches = 0
		local transpositions = 0

		local min = math.min
		local max = math.max
		for i = 1, original_len do
			local _start = max(1, i - match_distance)
			local _end = min(i + match_distance + 1, target_len)

			for j = _start, _end do
				if target_matches[j] then
					continue end
				if original:sub(i, i) ~= target:sub(j, j)  then
					continue end
				original_matches[i] = true
				target_matches[j] = true
				matches += 1
				break
			end
		end

		if matches == 0 then
			return 0
		end

		local k = 1
		for i = 1, original_len do
			if not original_matches[i] then continue end

			while target_matches[k] == false do
				k += 1
			end

			if original:sub(i, i) ~= target:sub(k, k) then
				transpositions += 1
			end
			k += 1
		end

		local similarity = ((matches / original_len) + (matches / target_len) + ((matches - transpositions / 2) / matches)) / 3

		return similarity
	end

	function Function.JaroDistance(original: string, target: string): number
		return 1 - Function.JaroSimilarity(original, target)
	end

	function Function.AttachmentCreate(Character)
		for Attach, ParentName in pairs(AttachmentParent) do
			local Base = Character:FindFirstChild(ParentName)

			if Base and not Base:FindFirstChild(Attach) then
				local Attachment = Instance.new("Attachment", Base)
				Attachment.Name = Attach
				Attachment.CFrame = AttachmentCFrame[Attach]
			end
		end
	end

	function Function.HeadMesh(Part)
		local SpecialMesh = Instance.new("SpecialMesh", Part)
		SpecialMesh.MeshType = Enum.MeshType.Head
		SpecialMesh.Scale = Vector3.new(1.25, 1.25, 1.25)
	end

	function Function.Dummy(CF)
		local DummyModel = Instance.new("Model")
		DummyModel.Archivable = not hidden
		DummyModel:AddTag("RoClothes")
		local DummyHumanoid = Instance.new("Humanoid", DummyModel)

		local RootPart = Instance.new("Part", DummyModel)
		RootPart.Name = "HumanoidRootPart"
		RootPart.Size = Vector3.new(2,2,1)
		RootPart.Anchored = true
		RootPart.Transparency = 1

		DummyModel.PrimaryPart = RootPart

		for Name, Property in pairs(DummyMesh) do
			local Part = Instance.new("Part", DummyModel)
			Part.Size = Property.Size
			Part.CFrame = RootPart.CFrame * Property.Offset
			Part.Anchored = true
			Part.Name = Name

			if Name == "Head" then
				Function.HeadMesh(Part)
			end
		end

		Function.AttachmentCreate(DummyModel)

		return DummyModel
	end

	function Function.CharacterPreview(Data)
		if CharacterPreviewLoading == false then
			CharacterPreviewLoading = true
			GUIObject.ViewportFrame:ClearAllChildren()

			local Dummy = Function.Dummy()

			local DataCharacter = PS:FindFirstChild(Data)

			if DataCharacter then
				for _, v in pairs(DataCharacter.Character:GetChildren()) do
					if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") or v:IsA("Accessory") or v:IsA("BodyColors") then
						local cv = v:Clone()

						cv.Parent = Dummy

						if cv:IsA("Accessory") then
							local Handle = cv:FindFirstChildOfClass("Part") or v:FindFirstChildOfClass("MeshPart")

							if Handle then
								local Weld = Handle:FindFirstChildOfClass("Weld")

								if Weld and Weld.Part0 then
									Weld.Part0 = Dummy:FindFirstChild(Weld.Part0.Name)
								end
							end
						end
					elseif v:IsA("Part") then
						local Base = Dummy:FindFirstChild(v.Name)

						if Base then
							Base.Color = v.Color
						end
					end
				end
			end

			Dummy.Parent = game.Workspace
			Function.CharacterReset(SelectPlayer, Data)
			Function.CharacterExecute(Dummy, Data)

			task.wait()
			Dummy.Parent = GUIObject.ViewportFrame

			CharacterPreviewLoading = false

			return Dummy
		end
	end

	function Function.SpringCreate(Object, Base, Target, Velocity, Speed, Damper, PositionOffset, Position, RotationOffset, Rotation, Data)

		local Weld = Object:FindFirstChildOfClass("Weld")
		if Weld then
			--[[
			if Base.Name == "Torso" and Weld.Part0 == Base then
				local invert0 = Weld.Part1.CFrame:ToObjectSpace(Weld.Part1.CFrame:ToWorldSpace(Weld.C1))
				local invert1 = Weld.Part1.CFrame:ToObjectSpace(Weld.Part1.CFrame:ToWorldSpace(Weld.C0))
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[Object].CFrame = invert0
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[Object].CFrame1 = invert1
				Weld.Part0 = Object
				Weld.Part1 = Base
				Weld.C0 = invert0
				Weld.C1 = invert1
				
			end
			]]
			local CF = Weld.C0
			local CF1 = Weld.C1

			local Spring = Function.Spring.new(Vector3.new(0,0,0))
			Spring.Target = Target;
			Spring.Velocity = Velocity;
			Spring.Speed = Speed;
			Spring.Damper = Damper;


			PlayerData[Data].CurrentPartList.BodyPartPhysics[Object] = {
				Spring = Spring,
				Base = Base,
				Weld = Weld,
				CF = CF,
				CF1 = CF1,
				OriginCFrame = Base.CFrame,
				PositionOffset = PositionOffset,
				Position = Position,
				RotationOffset = RotationOffset,
				Rotation = Rotation,
				BreastsType = PlayerData[Data].BreastsType
			}
		end
	end

	function Function.MinMaxCalulate(Base, Min, Max)
		return math.max(math.min(Base, Max), Min)
	end

	function Function.CFrameOrientation(CF)
		local x, y, z = CF:ToOrientation()
		return Vector3.new(math.deg(x), math.deg(y), math.deg(z))
	end

	function Function.MultiplyCalculate(Base, Default)
		local X = Base.X / Default.X
		local Y = Base.Y / Default.Y
		local Z = Base.Z / Default.Z

		return X,Y,Z
	end

	function Function.UIStrokeCreate(Parent)
		local UIStroke = Instance.new("UIStroke")
		UIStroke.Color = Color3.fromRGB(48, 52, 68)
		UIStroke.Thickness = 1.2
		UIStroke.Transparency = 0
		UIStroke.Parent = Parent
		return UIStroke
	end

	function Function.ButtonCreate(ButtonName, ButtonParent, IsTextbox, TextboxOption)
		local Button = Instance.new("Frame")
		local Button_2

		if IsTextbox == true then
			Button_2 = Instance.new("TextBox")
		else
			Button_2 = Instance.new("TextButton")
		end

		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner_2 = Instance.new("UICorner")
		local UIGradient_2 = Instance.new("UIGradient")

		Button.Name = ButtonName
		Button.Parent = ButtonParent
		Button.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
		Button.Size = UDim2.new(0, 200, 0, 50)

		UIAspectRatioConstraint.Parent = Button

		UICorner_2.CornerRadius = UDim.new(0.25, 0)
		UICorner_2.Parent = Button

		Button_2.Parent = Button
		Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_2.BackgroundTransparency = 1.000
		Button_2.Size = UDim2.new(1, 0, 1, 0)
		Button_2.Font = Enum.Font.Code
		Button_2.TextColor3 = Color3.fromRGB(235, 235, 242)
		Button_2.TextStrokeColor3 = Color3.fromRGB(10, 10, 14)
		Button_2.TextScaled = true
		Button_2.TextSize = 14.000
		Button_2.TextStrokeTransparency = 0.400
		Button_2.TextWrapped = true

		if IsTextbox and TextboxOption then
			Button_2.ClearTextOnFocus = false
			Button_2.PlaceholderText = TextboxOption.Text
			Button_2.PlaceholderColor3 = TextboxOption.Color
		else
			Button_2.Text = ButtonName
		end

		UIGradient_2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 54))}
		UIGradient_2.Rotation = -90
		UIGradient_2.Parent = Button

		Function.UIStrokeCreate(Button)

		if ButtonName == "nil" then
			Button.LayoutOrder = -1
		end

		return Button
	end

	function Function.ButtonCreate2(ButtonName, ButtonParent, IsTextbox, Properties, Gradient)
		local Button = Instance.new("Frame")
		local Button_2

		if IsTextbox == true then
			Button_2 = Instance.new("TextBox")
		else
			Button_2 = Instance.new("TextButton")
		end

		local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
		local UICorner_2 = Instance.new("UICorner")
		local UIGradient_2 = Instance.new("UIGradient")

		Button.Name = ButtonName
		Button.Parent = ButtonParent
		Button.BackgroundColor3 = Color3.fromRGB(20, 22, 28)
		Button.BorderColor3 = Color3.fromRGB(0, 0, 0)
		Button.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
		Button.Size = UDim2.new(0, 200, 0, 50)

		UIAspectRatioConstraint.Parent = Button

		UICorner_2.CornerRadius = UDim.new(0.25, 0)
		UICorner_2.Parent = Button

		Button_2.Parent = Button
		Button_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		Button_2.BackgroundTransparency = 1.000
		Button_2.Size = UDim2.new(1, 0, 1, 0)
		Button_2.Font = Enum.Font.Code
		Button_2.TextColor3 = Color3.fromRGB(235, 235, 242)
		Button_2.TextStrokeColor3 = Color3.fromRGB(10, 10, 14)
		Button_2.TextScaled = true
		Button_2.TextSize = 14.000
		Button_2.TextStrokeTransparency = 0.400
		Button_2.TextWrapped = true

		Function.UIStrokeCreate(Button)

		if ButtonName == "nil" then
			Button.LayoutOrder = -1
		end

		return Button
	end

	function Function.CatalogAccessoryFrameAdd(Data)
		if not GUIObject.Catalog_3:FindFirstChild(Data) then
			local CatalogListFrame = Instance.new("ScrollingFrame")

			CatalogListFrame.Name = Data
			CatalogListFrame.Parent = GUIObject.Catalog_3
			CatalogListFrame.Active = true
			CatalogListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
			CatalogListFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
			CatalogListFrame.BackgroundTransparency = 1.000
			CatalogListFrame.BorderSizePixel = 0
			CatalogListFrame.Position = UDim2.new(0.499999911, 0, 0.76, 0)
			CatalogListFrame.Size = UDim2.new(0.949999988, 0, 0.45, 0)
			CatalogListFrame.BottomImage = "rbxassetid://5946093983"
			CatalogListFrame.MidImage = ""
			CatalogListFrame.ScrollBarThickness = 0
			CatalogListFrame.CanvasSize = UDim2.new(1, 0, 1, 0)
			CatalogListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
			CatalogListFrame.TopImage = "rbxassetid://5946093983"

			local UIGridLayout_3 = Instance.new("UIGridLayout")

			UIGridLayout_3.Parent = CatalogListFrame
			UIGridLayout_3.SortOrder = Enum.SortOrder.LayoutOrder
			UIGridLayout_3.CellPadding = UDim2.new(0, 0, .1, 0)
			UIGridLayout_3.CellSize = UDim2.new(0.315, 0, 0.262, 0)
		end
	end

	function Function.CapturePlayerOwnAvatar(Name)
		local targetPlr = PS:FindFirstChild(Name) or Player
		local char = targetPlr and targetPlr.Character
		if not char then return end

		local s = char:FindFirstChildOfClass("Shirt")
		local p = char:FindFirstChildOfClass("Pants")
		local g = char:FindFirstChildOfClass("ShirtGraphic")
		local bc = char:FindFirstChildOfClass("BodyColors")

		local desc = nil
		if targetPlr and targetPlr.UserId and targetPlr.UserId > 0 then
			pcall(function() desc = PS:GetHumanoidDescriptionFromUserId(targetPlr.UserId) end)
		end

		local sTemplate = (s and s.ShirtTemplate ~= "" and s.ShirtTemplate)
			or (desc and desc.Shirt and desc.Shirt ~= 0 and ("rbxassetid://" .. tostring(desc.Shirt)))
			or ""

		local pTemplate = (p and p.PantsTemplate ~= "" and p.PantsTemplate)
			or (desc and desc.Pants and desc.Pants ~= 0 and ("rbxassetid://" .. tostring(desc.Pants)))
			or ""

		local gTemplate = (g and g.Graphic ~= "" and g.Graphic)
			or (desc and desc.GraphicTShirt and desc.GraphicTShirt ~= 0 and ("rbxassetid://" .. tostring(desc.GraphicTShirt)))
			or ""

		local bcData = nil
		if bc then
			bcData = {
				HeadColor3 = bc.HeadColor3,
				TorsoColor3 = bc.TorsoColor3,
				LeftArmColor3 = bc.LeftArmColor3,
				RightArmColor3 = bc.RightArmColor3,
				LeftLegColor3 = bc.LeftLegColor3,
				RightLegColor3 = bc.RightLegColor3,
			}
		elseif desc then
			bcData = {
				HeadColor3 = desc.HeadColor,
				TorsoColor3 = desc.TorsoColor,
				LeftArmColor3 = desc.LeftArmColor,
				RightArmColor3 = desc.RightArmColor,
				LeftLegColor3 = desc.LeftLegColor,
				RightLegColor3 = desc.RightLegColor,
			}
		end

		if PlayerData[Name] then
			PlayerData[Name].PlayerOwnAvatar = {
				ShirtTemplate = sTemplate,
				PantsTemplate = pTemplate,
				Graphic = gTemplate,
				BodyColors = bcData,
			}
			if desc and desc.Shirt and desc.Shirt > 0 then
				PlayerData[Name].PlayerOwnClothes.Shirt = desc.Shirt
			end
			if desc and desc.Pants and desc.Pants > 0 then
				PlayerData[Name].PlayerOwnClothes.Pants = desc.Pants
			end
		end
	end

	function Function.PlayerDataAdd(Name)
		if not PlayerData[Name] then
			PlayerData[Name] = Function.PlayerDataDefault()
			PlayerData[Name].AutoExecute = false
			local targetPlr = PS:FindFirstChild(Name) or Player
			if targetPlr and targetPlr.UserId and targetPlr.UserId > 0 then
				pcall(function()
					local d = PS:GetHumanoidDescriptionFromUserId(targetPlr.UserId)
					if d then
						if d.Shirt and d.Shirt > 0 then
							PlayerData[Name].PlayerOwnClothes.Shirt = d.Shirt
						end
						if d.Pants and d.Pants > 0 then
							PlayerData[Name].PlayerOwnClothes.Pants = d.Pants
						end
					end
				end)
			end
		end
	end

	function Function.CFrameMultiply(CF, Multiply)
		return CFrame.new(
			CF.Position.X * Multiply.X,
			CF.Position.Y * Multiply.Y,
			CF.Position.Z * Multiply.Z
		) * CF.Rotation
	end

	function Function.Vector3Multiply(Vector, Multiply)
		return Vector3.new(
			Vector.X * Multiply.X,
			Vector.Y * Multiply.Y,
			Vector.Z * Multiply.Z
		)
	end

	function Function.Round(num: number, places: number): number
		local decimalPivot = 10^places
		return math.floor(num * decimalPivot + 0.5) / decimalPivot
	end

	local printed={}
	function Function.Weld(MeshDetail, Character, Extra, Data)
		if Character.Parent ~= nil then
			setmetatable(MeshDetail, MetaClothes)

			local INSTANCE = MeshDetail["Instance"]
			local NAME = MeshDetail["Name"]

			local SIZE = MeshDetail["Size"]
			local CFRAME = MeshDetail["CFrame"]
			local CFRAME1 = MeshDetail["CFrame1"]
			local OFFSET = MeshDetail["Offset"]
			local ROTATION = MeshDetail["Rotation"]
			if OFFSET then
				CFRAME = CFRAME+OFFSET
			end
			if ROTATION then
				CFRAME = CFRAME*CFrame.Angles(math.rad(ROTATION.X),math.rad(ROTATION.Y),math.rad(ROTATION.Z))
			end
			local TRANSPARENCY = MeshDetail["Transparency"]
			local REFLECTANCE = MeshDetail["Reflectance"]
			local MESHBASEPARTTRANSPARENCY = MeshDetail["MeshBasePartTransparency"]
			local MATERIAL = MeshDetail["Material"]
			local COLOR = MeshDetail["Color"]
			local PARENT = MeshDetail["Parent"]
			local PARENTTRANSPARENCY = MeshDetail["ParentTransparency"]
			local FUNCTION = MeshDetail["Function"]
			local SCALE = MeshDetail["Scale"]
			local ADJUSTSCALE = MeshDetail["AdjustScale"]

			local MESHID = MeshDetail["MeshId"]
			local TEXTUREID = MeshDetail["TextureId"]
			local DOUBLESIDED = MeshDetail["DoubleSided"]

			local SHAPE = MeshDetail["Shape"]

			if Debug == true then
				for i, v in pairs(PartList) do
					if NAME == v.Name and MESHID == v.MeshId then
						if not printed[i] or printed[i] == false then
							printed[i] = true
							task.delay(.1,function()
								printed[i] = false
							end)
							print(i)
							break
						end
					end
				end
			end

			local BodyPart = Character:FindFirstChild(PARENT[1])

			local OldCharacter
			if Method == 3 then
				if BodyPart and PlayerData[Data].LocalTransparency[BodyPart.Name] == true then
					OldCharacter = Character

					Character = Method2CharacterFolder:FindFirstChild(Data)

					if not Character then
						Character = Instance.new("Model", Method2CharacterFolder)
						Character:AddTag("RoClothes")
						Character.Archivable = not hidden
						Character.Name = Data

						local CharacterValue = Instance.new("ObjectValue", Character)
						CharacterValue.Value = OldCharacter

						for _, v in pairs(CharacterValue.Value:GetChildren()) do
							if v:IsA("BasePart") and table.find(Method2BodyPart, v.Name) or v.Name == "HumanoidRootPart" then
								PlayerData[Data].CurrentPartList.ParentTransparency[v] = {v = v.Transparency}
								if v.Name ~= "Head" then
									PlayerData[Data].CurrentPartList.ParentTransparency[v] = {v = v.Transparency, T = 1}
								end

								local Part = Instance.new("Part", Character)
								Part.Size = v.Size
								Part.Name = v.Name
								Part.Transparency = 1
								Part.CanCollide = false
								Part.CanQuery = false
								Part.CanTouch = false
								Part.Massless = true
								Part.CustomPhysicalProperties = PhysicalProperties.new(0.0001)
								Part.Color = v.Color

								local Weld = Instance.new("Weld", Part)
								Weld.Part0 = v
								Weld.Part1 = Part

								if Part.Name == "HumanoidRootPart" then
									Character.PrimaryPart = Part
								end

								local detectRemoval
								detectRemoval = Part.ChildRemoved:Connect(function(c)
									if Part.Parent ~= nil then
										if c:IsA("Weld") and c.Part0 == v then
											c:Clone().Parent = Part
										end
									else
										detectRemoval:Disconnect()
									end
								end)
								table.insert(AllConnect,detectRemoval)
							end
						end
					end
				end
			elseif Method == 2 then
				OldCharacter = PlayerData[Data].Character
			end

			if BodyPart then
				if Method == 2 or OldCharacter then
					BodyPart = OldCharacter:FindFirstChild(PARENT[1])
				end
				local XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(BodyPart.Size, BodyPartSize[PARENT[1]])

				local ObjectInstance

				local Parent = Character
				local Scale = 1

				for Index = 1, #PARENT do
					Parent = Parent:FindFirstChild(PARENT[Index])
				end

				if SCALE then
					Scale = PlayerData[Data][SCALE]
				end

				if SIZE == "Overlay" then
					local pData = PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[Parent]
					if pData then
						SIZE = Vector3.new(pData.Size.X+0.003,pData.Size.Y+0.003,pData.Size.Z+0.003)
					else
						SIZE = Vector3.new(Parent.Size.X+0.003,Parent.Size.Y+0.003,Parent.Size.Z+0.003)
					end
				elseif SIZE == "Underlay" then
					local pData = PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[Parent]
					if pData then
						SIZE = Vector3.new(pData.Size.X-0.003,pData.Size.Y-0.003,pData.Size.Z-0.003)
					else
						SIZE = Vector3.new(Parent.Size.X-0.003,Parent.Size.Y-0.003,Parent.Size.Z-0.003)
					end
				end

				for i, Adjust in pairs(ADJUSTSCALE) do
					if SCALE == "LegsScale" then
						if Adjust == "Size" then
							SIZE = Function.Vector3Multiply(SIZE, {X = Scale, Y = 1+((Scale-1)*.2), Z = Scale})
						elseif Adjust == "CFrame" then
							CFRAME = Function.CFrameMultiply(CFRAME, {X = Scale, Y = 1+((Scale-1)*.2), Z = Scale})
						elseif Adjust == "CFrame1" then
							CFRAME1 = Function.CFrameMultiply(CFRAME1, {X = Scale, Y = 1+((Scale-1)*.2), Z = Scale})
						end
						if i == "Size" then
							local Scale = 1+((Scale-1)*Adjust)
							SIZE = Function.Vector3Multiply(SIZE, {X = Scale, Y = 1+((Scale-1)*.2), Z = Scale})
						elseif i == "CFrame" then
							local Scale = 1+((Scale-1)*Adjust)
							CFRAME = Function.CFrameMultiply(CFRAME, {X = Scale, Y = Scale, Z = Scale})
						elseif i == "CFrame1" then
							local Scale = 1+((Scale-1)*Adjust)
							CFRAME1 = Function.CFrameMultiply(CFRAME1, {X = Scale, Y = Scale, Z = Scale})
						end
					else
						if Adjust == "Size" then
							SIZE = Function.Vector3Multiply(SIZE, {X = Scale, Y = Scale, Z = Scale})
						elseif Adjust == "CFrame" then
							CFRAME = Function.CFrameMultiply(CFRAME, {X = Scale, Y = Scale, Z = Scale})
						elseif Adjust == "CFrame1" then
							CFRAME1 = Function.CFrameMultiply(CFRAME1, {X = Scale, Y = Scale, Z = Scale})
						end
						if i == "Size" then
							local Scale = 1+((Scale-1)*Adjust)
							SIZE = Function.Vector3Multiply(SIZE, {X = Scale, Y = Scale, Z = Scale})
						elseif i == "CFrame" then
							local Scale = 1+((Scale-1)*Adjust)
							CFRAME = Function.CFrameMultiply(CFRAME, {X = Scale, Y = Scale, Z = Scale})
						elseif i == "CFrame1" then
							local Scale = 1+((Scale-1)*Adjust)
							CFRAME1 = Function.CFrameMultiply(CFRAME1, {X = Scale, Y = Scale, Z = Scale})
						end
					end
				end

				if PARENTTRANSPARENCY ~= nil then
					if OldCharacter and OldCharacter:FindFirstChild(Parent.Name) then
						PlayerData[Data].CurrentPartList.ParentTransparency[OldCharacter:FindFirstChild(Parent.Name)] = {D = OldCharacter:FindFirstChild(Parent.Name).Transparency, T = PARENTTRANSPARENCY}
						--OldCharacter:FindFirstChild(Parent.Name).Transparency = PARENTTRANSPARENCY
					end
					PlayerData[Data].CurrentPartList.ParentTransparency[Parent] = {D = Parent.Transparency, T = PARENTTRANSPARENCY}
					--Parent.Transparency = PARENTTRANSPARENCY
				end

				if INSTANCE == "Mesh" then
					if MESHID == "Parent" then
						if Parent:IsA("MeshPart") then
							MESHID = Parent.MeshId
						elseif Parent:FindFirstChildOfClass("SpecialMesh") then
							MESHID = Parent:FindFirstChildOfClass("SpecialMesh").MeshId
						elseif Parent:FindFirstChildOfClass("CharacterMesh") then
							MESHID = "rbxassetid://" .. tostring(Parent:FindFirstChildOfClass("CharacterMesh").MeshId)
						else
							local sm = Parent.Parent and (Parent.Parent:FindFirstChildOfClass("SpecialMesh") or (Parent.Parent:IsA("MeshPart") and Parent.Parent))
							if sm and sm:IsA("MeshPart") then
								MESHID = sm.MeshId
							elseif sm and sm:IsA("SpecialMesh") then
								MESHID = sm.MeshId
							else
								MESHID = ""
							end
						end
					end
					local resolvedMeshId = (MESHID and MESHID ~= "") and getAsset(MESHID) or ""
					local resolvedTextureId = (TEXTUREID and TEXTUREID ~= "") and getAsset(TEXTUREID) or ""
					
					local ok, meshPart = false, nil
					if resolvedMeshId ~= "" then
						ok, meshPart = pcall(function()
							return IS:CreateMeshPartAsync(resolvedMeshId, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
						end)
						if (not ok or not meshPart) and resolvedMeshId ~= MESHID then
							ok, meshPart = pcall(function()
								return IS:CreateMeshPartAsync(MESHID, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
							end)
						end
						if (not ok or not meshPart) and not MESHID:match("^rbxasset://") then
							ok, meshPart = pcall(function()
								return IS:CreateMeshPartAsync("rbxasset://" .. MESHID, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
							end)
						end
					end
					if ok and meshPart then
						ObjectInstance = meshPart
						ObjectInstance:AddTag("RoClothes")
						ObjectInstance.TextureID = resolvedTextureId
						ObjectInstance.DoubleSided = DOUBLESIDED
					else
						ObjectInstance = Instance.new("Part")
						ObjectInstance:AddTag("RoClothes")
						if resolvedMeshId ~= "" then
							local sm = Instance.new("SpecialMesh", ObjectInstance)
							sm.MeshType = Enum.MeshType.FileMesh
							sm.MeshId = resolvedMeshId
							sm.TextureId = resolvedTextureId
						end
					end
				elseif INSTANCE == "Part" then
					ObjectInstance = Instance.new("Part")
					ObjectInstance:AddTag("RoClothes")
					ObjectInstance.Shape = SHAPE
				end

				local Color

				if COLOR["Color"] == "Parent" then
					Color = Parent.Color
				else
					Color = COLOR["Color"]
				end

				local H,S,V = Color:ToHSV()

				if COLOR["Tone"] == "Darker" then
					Color = Color3.fromHSV(H,S,V+(-DarkerColorPercentage * V/100))
				elseif COLOR["Tone"] == "Darker2" then
					Color = Color3.fromHSV(H,S,V+(-Darker2ColorPercentage * V/100))
				end

				if PlayerData[Data].MeshBasePartInvisible then
					ObjectInstance.Transparency = MESHBASEPARTTRANSPARENCY
				end

				ObjectInstance.Color = Color
				
				ObjectInstance.CanCollide = false
				ObjectInstance.CanQuery = false
				ObjectInstance.CanTouch = false
				ObjectInstance.Massless = true
				ObjectInstance.CustomPhysicalProperties = PhysicalProperties.new(0.0001)

				ObjectInstance.Name = NAME
				ObjectInstance.Transparency = TRANSPARENCY
				ObjectInstance.Reflectance = REFLECTANCE
				ObjectInstance.Material = MATERIAL
				
				if Parent and not Function.IsParentNil(Parent) and not Function.FallenPartCheck(Parent) then
					ObjectInstance.CFrame = Parent.CFrame
				end
				local WeldInstance = Instance.new("Weld", ObjectInstance)
				WeldInstance.Name = NAME.." Weld"
				WeldInstance.Part0 = Parent
				WeldInstance.Part1 = ObjectInstance

				ObjectInstance.Size = SIZE

				WeldInstance.C0 = CFRAME

				WeldInstance.C1 = CFRAME1

				local detectRemoval
				detectRemoval = ObjectInstance.ChildRemoved:Connect(function(c)
					if ObjectInstance.Parent ~= nil then
						if c:IsA("Weld") and c.Part1 == ObjectInstance then
							c:Clone().Parent = ObjectInstance
						end
					else
						detectRemoval:Disconnect()
					end
				end)
				table.insert(AllConnect,detectRemoval)



				if PlayerData[Data].MeshSizeLock == false then
					ObjectInstance.Size = Function.Vector3Multiply(SIZE, {X = XMultiply, Y = YMultiply, Z = ZMultiply})
					WeldInstance.C0 = Function.CFrameMultiply(CFRAME, {X = XMultiply, Y = YMultiply, Z = ZMultiply})
					WeldInstance.C1 = Function.CFrameMultiply(CFRAME1, {X = XMultiply, Y = YMultiply, Z = ZMultiply})
				end


				ObjectInstance.Parent = Parent

				if FUNCTION ~= "" then
					if typeof(FUNCTION) == "string" then
						Function[FUNCTION](ObjectInstance, Character, Extra, Data)
					elseif typeof(FUNCTION) == "table" then
						for i, v in pairs(FUNCTION) do
							Function[v](ObjectInstance, Character, Extra, Data)
						end
					end
				end
				PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[ObjectInstance] = {Size = SIZE, CFrame = CFRAME, CFrame1 = CFRAME1, Base = BodyPart, Weld = WeldInstance}
				return ObjectInstance
			end 
		end

	end

	function Function.CharacterFunction(Character, Data)
		local CharacterAttachment = {}

		for _, v in pairs(Character:GetDescendants()) do
			if v:IsA("Attachment") and v.Parent.Name ~= "Handle" and BodyPartSize[v.Parent.Name] and not CharacterAttachment[v.Name] then
				CharacterAttachment[v.Name] = v
			end
		end

		for _, v in pairs(Character:GetDescendants()) do
			if v:IsA("Accessory") then
				local Handle = v:FindFirstChildOfClass("Part") or v:FindFirstChildOfClass("MeshPart")

				if Handle then
					if PlayerData[Data].CurrentBundle ~= "nil" then
						local curB = Bundle[PlayerData[Data].CurrentBundle]
						if curB and curB["Accessory"] and #curB["Accessory"] > 0 then
							PlayerData[Data].CurrentPartList.ParentTransparency[Handle] = {D = 0, T = 1}
						end
					else
						local Attachment = Handle:FindFirstChildOfClass("Attachment")
						if Attachment then
							local SpecialMesh = Handle:FindFirstChildOfClass("SpecialMesh")
							local Weld = Handle:FindFirstChildOfClass("Weld")
							local ParentAttachment = CharacterAttachment[Attachment.Name]

							if Weld and SpecialMesh and ParentAttachment and Attachment then

								local HandleParent = ParentAttachment.Parent
								local Size = HandleParent.Size
								local HandleSize = Handle.Size

								if Size and BodyPartSize[HandleParent.Name] then
									local XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(Size, BodyPartSize[HandleParent.Name])

									local AttachCF = Attachment.CFrame
									local PAttachCF = AttachmentCFrame[ParentAttachment.Name]
									local Scale = SpecialMesh.Scale

									PlayerData[Data].CurrentPartList.RealtimeUpdateList.Accessory[Handle] = {Scale = Scale, SpecialMesh = SpecialMesh, Size = Size, CFrame = AttachCF, Attachment = Attachment, ParentAttachment = ParentAttachment, Base = HandleParent, Weld = Weld}
								end
							end
						end
					end
				end
			end
		end

		return CharacterAttachment
	end

	function Function.BodyColorForceSet(Character, Color)
		for i, v in pairs(BodyColorPart) do
			local Base = Character:FindFirstChild(v)
			if Base then
				Base.Color = Color
			end
		end
		if Method == 2 and Method2CharacterFolder:FindFirstChild(Character.Name) then
			local m2Char = Method2CharacterFolder[Character.Name]
			for i, v in pairs(BodyColorPart) do
				local Base = m2Char:FindFirstChild(v)
				if Base then
					Base.Color = Color
				end
			end
		end
		local pData = PlayerData[Character.Name]
		if pData and pData.CurrentPartList and pData.CurrentPartList["Organ"] then
			for _, organ in pairs(pData.CurrentPartList["Organ"]) do
				if organ and organ:IsA("BasePart") then
					organ.Color = Color
				end
			end
		end
	end

	function Function.BodyColorSet(Character, BodyColor)
		for i, v in pairs(BodyColorPart) do
			local Base = Character:FindFirstChild(v)

			if Base then
				Base.Color = BodyColor[i]
			end
		end
	end

	function Function.BodyColorsFunction(Character, SelectBundle, Data)
		if Bundle[SelectBundle] and Bundle[SelectBundle]["Body Color"] ~= nil and PlayerData[Data].BundleBodyColor then
			local BodyColors = Character:FindFirstChildOfClass("BodyColors") or Instance.new("BodyColors", Character)

			for i, v in pairs(Bundle[SelectBundle]["Body Color"]) do
				local col = v
				if typeof(col) == "table" and col.R and col.G and col.B then
					col = Color3.new(col.R, col.G, col.B)
				end
				pcall(function() BodyColors[i] = col end)
			end

			Function.BodyColorSet(Character, BodyColors)

			if Method == 2 and Method2CharacterFolder:FindFirstChild(Data) then
				local m2Char = Method2CharacterFolder[Data]
				Function.BodyColorSet(m2Char, BodyColors)
			end

			-- Also apply full body colors directly to all custom organs (Torso, Breasts, Butt, Limbs):
			if PlayerData[Data] and PlayerData[Data].CurrentPartList and PlayerData[Data].CurrentPartList["Organ"] then
				local tCol = BodyColors.TorsoColor3
				if tCol then
					for organName, organPart in pairs(PlayerData[Data].CurrentPartList["Organ"]) do
						if organPart and organPart:IsA("BasePart") then
							if organName == "Torso" or organName:find("Breast") or organName:find("Butt") then
								organPart.Color = tCol
							elseif organName:find("Left Arm") and BodyColors.LeftArmColor3 then
								organPart.Color = BodyColors.LeftArmColor3
							elseif organName:find("Right Arm") and BodyColors.RightArmColor3 then
								organPart.Color = BodyColors.RightArmColor3
							elseif organName:find("Left Leg") and BodyColors.LeftLegColor3 then
								organPart.Color = BodyColors.LeftLegColor3
							elseif organName:find("Right Leg") and BodyColors.RightLegColor3 then
								organPart.Color = BodyColors.RightLegColor3
							else
								organPart.Color = tCol
							end
						end
					end
				end
			end
		end
	end

	function Function.AccessoryAdd(Character, v, CharacterAttachment, Data)
		local CAccessory = v:Clone()
		local CHandle = CAccessory:FindFirstChildOfClass("Part")
		local CAttachment = CHandle:FindFirstChildOfClass("Attachment")
		local CSpecialMesh = CHandle:FindFirstChildOfClass("SpecialMesh")
		CAccessory:AddTag("RoClothes")

		PlayerData[Data].CurrentPartList["Accessory"][CAccessory] = CAccessory

		if isTailAccessory(CAccessory) then
			setUpTailAccessory(Character, CAccessory, Data)
		end

		local CParentAttachment = CharacterAttachment[CAttachment.Name]

		if CParentAttachment then
			local HandleParent = CParentAttachment.Parent
			local Size = HandleParent.Size
			local HandleSize = CHandle.Size

			local BodySize = BodyPartSize[HandleParent.Name]
			local CalcSize = Size
			local specialHead = false
			if not BodySize then
				if HandleParent.Name == "UpperTorso" or HandleParent.Name == "LowerTorso" then
					BodySize = BodyPartSize["Torso"]
				elseif HandleParent.Name == "RightUpperArm" or HandleParent.Name == "LeftLowerArm" then
					BodySize = BodyPartSize["Left Arm"]
				elseif HandleParent.Name == "RightUpperArm" or HandleParent.Name == "RightLowerArm" then
					BodySize = BodyPartSize["Right Arm"]
				elseif HandleParent.Name == "LeftUpperLeg" or HandleParent.Name == "LeftLowerLeg" then
					BodySize = BodyPartSize["Left Leg"]
				elseif HandleParent.Name == "RightUpperLeg" or HandleParent.Name == "RightLowerrLeg" then
					BodySize = BodyPartSize["Right Leg"]
				end
			elseif HandleParent.Name == "Head" and HandleParent:IsA("MeshPart") then
				if HandleParent:FindFirstChild("OriginalSize") then
					BodySize = HandleParent:FindFirstChild("OriginalSize").Value
				else
					BodySize = BodyPartSize["HeadMeshFix"]
				end
			elseif HandleParent.Name == "Head" and HandleParent:FindFirstChildOfClass("SpecialMesh") then
				local SM:SpecialMesh = HandleParent:FindFirstChildOfClass("SpecialMesh")
				if SM.MeshType == Enum.MeshType.Head then
					specialHead = true
					BodySize = BodyPartSize["HeadScale"]
				else
					CalcSize = SM.Scale
					BodySize = BodyPartSize["HeadScale"]
				end
			end

			local XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(CalcSize, BodySize)
			if specialHead == true then
				local SM:SpecialMesh = HandleParent:FindFirstChildOfClass("SpecialMesh")

				if CalcSize.X > CalcSize.Z then
					CalcSize = Vector3.new(CalcSize.Z,CalcSize.Y,CalcSize.Z)
				end
				if CalcSize.Z > CalcSize.X then
					CalcSize = Vector3.new(CalcSize.X,CalcSize.Y,CalcSize.X)
				end
				XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(CalcSize, BodySize)

				local S = SM.Scale
				if S.X > S.Z then
					S = Vector3.new(S.Z,S.Y,S.Z)
				end
				if S.Z > S.X then
					S = Vector3.new(S.X,S.Y,S.X)
				end
				local XMS, YMS, ZMS = Function.MultiplyCalculate(S, vector3New(1.25,1.25,1.25))

				XMultiply = XMultiply*XMS
				YMultiply = YMultiply*YMS
				ZMultiply = ZMultiply*ZMS
			end

			local CAttachCF = CAttachment.CFrame
			local PAttachCF = AttachmentCFrame[CParentAttachment.Name]
			local Scale = CSpecialMesh.Scale

			if PlayerData[Data].AccessorySizeLock == false then
				CHandle.Size = Vector3.new(HandleSize.X * XMultiply, HandleSize.Y * YMultiply, HandleSize.Z * ZMultiply)
				CSpecialMesh.Scale = Vector3.new(Scale.X * XMultiply, Scale.Y * YMultiply, Scale.Z * ZMultiply)CAttachment.CFrame = CFrame.new(CAttachCF.Position.X * XMultiply, CAttachCF.Position.Y * YMultiply, CAttachCF.Position.Z * ZMultiply) * CAttachCF.Rotation
				if not PlayerData[Data].CurrentPartList.physicsTails[CAccessory] then
					CParentAttachment.CFrame = CFrame.new(PAttachCF.Position.X * XMultiply, PAttachCF.Position.Y * YMultiply, PAttachCF.Position.Z * ZMultiply) * PAttachCF.Rotation
				end
			else
				CHandle.Size = HandleSize
				CSpecialMesh.Scale = Scale
			end
			
			CHandle.CanCollide = false
			CHandle.CanQuery = false
			CHandle.CanTouch = false
			CHandle.Massless = true
			CHandle.CustomPhysicalProperties = PhysicalProperties.new(0.0001)

			CAccessory.Parent = Character
			v:Destroy()
			
			CHandle.CFrame = CParentAttachment.Parent.CFrame
			local Weld = Instance.new("Weld", CHandle)
			Weld.Part0 = CHandle
			Weld.Part1 = CParentAttachment.Parent

			Weld.C0 = CAttachment.CFrame
			Weld.C1 = CParentAttachment.CFrame

			-- Restore exact saved accessory scales/offsets if recorded in bundle:
			local curBName = PlayerData[Data] and PlayerData[Data].CurrentBundle
			local bData = curBName and Bundle[curBName]
			local accPosBundle = bData and bData["AccessoryPositions"]
			local savedPos = nil
			if accPosBundle then
				local meshNum = nil
				if CSpecialMesh and CSpecialMesh.MeshId then
					meshNum = tostring(CSpecialMesh.MeshId:match("%d+"))
				elseif CHandle:IsA("MeshPart") and CHandle.MeshId then
					meshNum = tostring(CHandle.MeshId:match("%d+"))
				end

				-- Strictly match by unique mesh ID or accessory name to avoid attachment collision bugs:
				if meshNum and accPosBundle[meshNum] then
					savedPos = accPosBundle[meshNum]
				elseif accPosBundle[CAccessory.Name] then
					savedPos = accPosBundle[CAccessory.Name]
				elseif accPosBundle[v.Name] then
					savedPos = accPosBundle[v.Name]
				end
			end

			if savedPos then
				local function toCF(val)
					if typeof(val) == "CFrame" then return val end
					if typeof(val) == "table" and val.CFrameComponents then
						return CFrame.new(table.unpack(val.CFrameComponents))
					end
					return nil
				end
				local function toV3(val)
					if typeof(val) == "Vector3" then return val end
					if typeof(val) == "table" and val.X and val.Y and val.Z then
						return Vector3.new(val.X, val.Y, val.Z)
					end
					return nil
				end

				local c0 = toCF(savedPos.C0)
				local c1 = toCF(savedPos.C1)
				local mScale = toV3(savedPos.MeshScale)
				local mOffset = toV3(savedPos.MeshOffset)
				local hSize = toV3(savedPos.HandleSize)

				-- Only apply static weld offsets if specifically defined, NEVER animated relative CFrame
				if c0 and c1 then
					Weld.C0 = c0
					Weld.C1 = c1
				end
				if mScale and CSpecialMesh then
					CSpecialMesh.Scale = mScale
				end
				if mOffset and CSpecialMesh then
					CSpecialMesh.Offset = mOffset
				end
				if hSize then
					CHandle.Size = hSize
				end
			end

			local detectRemoval
			detectRemoval = CHandle.ChildRemoved:Connect(function(c)
				if CHandle.Parent ~= nil then
					if c:IsA("Weld") and c.Part0 == CHandle then
						c:Clone().Parent = CHandle
					end
				else
					detectRemoval:Disconnect()
				end
			end)
			table.insert(AllConnect,detectRemoval)

			PlayerData[Data].CurrentPartList.RealtimeUpdateList.Accessory[CHandle] = {Scale = Scale, SpecialMesh = CSpecialMesh, Size = Size, CFrame = CAttachCF, Attachment = CAttachment, ParentAttachment = CParentAttachment, Base = HandleParent, Weld = Weld}
		end
	end

	function Function.HumanoidDescriptionSet(AccessoryList, ClothesList, HumanoidDescription)
		local IsAdded = false

		if AccessoryList ~= nil then
			local amountFinished = 0
			local totalAccessories = 0
			for _, Id in pairs(AccessoryList) do
				totalAccessories += 1
				task.spawn(function()
					local success, output = pcall(function()
						local AccessoryInfo = MPS:GetProductInfo(Id)
						local Type = AccessoryType[AccessoryInfo.AssetTypeId] or "HatAccessory"

						if HumanoidDescription[Type] == "" then
							HumanoidDescription[Type] = tostring(Id)
						else
							HumanoidDescription[Type] = HumanoidDescription[Type]..", "..Id
						end
					end)
					if not success then
						warn('Accessory ID "'..tostring(Id)..'" could not be loaded: ' .. tostring(output))
					else
						IsAdded = true
					end
					amountFinished += 1
				end)
			end
			local timeout = 0
			while amountFinished < totalAccessories and timeout < 60 do
				task.wait(0.05)
				timeout += 1
			end
		end

		if ClothesList ~= nil then
			for Type, Id in pairs(ClothesList) do
				if Id and Id ~= "" and Id ~= "nil" and tonumber(Id) then
					local numId = tonumber(Id)
					if Type == "Shirt" then
						HumanoidDescription.Shirt = numId
					elseif Type == "Pants" then
						HumanoidDescription.Pants = numId
					elseif Type == "ShirtGraphic" then
						HumanoidDescription.GraphicTShirt = numId
					end

					IsAdded = true
				end
			end
		end

		return IsAdded
	end

	function Function.HumanoidDescriptionLoader(Character, HumanoidDescription, CharacterAttachment, UseBodyColor, Data, isCatalogUsername, oChar, tailCheck)
		local AccessoryLoaderModel = Instance.new("Model", game)
		AccessoryLoaderModel.Archivable = not hidden
		AccessoryLoaderModel:AddTag("RoClothes")
		local HumanoidAccessoryLoader = Instance.new("Humanoid", AccessoryLoaderModel)

		HumanoidAccessoryLoader:ApplyDescription(HumanoidDescription)
		local waitCount = 0
		while #AccessoryLoaderModel:GetChildren() <= 2 and waitCount < 30 do
			task.wait(0.05)
			waitCount += 1
		end

		for _, v in pairs(AccessoryLoaderModel:GetChildren()) do
			if v:IsA("Accessory") then
				if tailCheck == true then
					v.Name = v.Name.."RCTailCertified"
				end
				Function.AccessoryAdd(Character, v, CharacterAttachment, Data)
			elseif v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
				--[[if DecalCheck then
					if v:IsA("Shirt") and DecalCheck[1] ~= nil then
						v.ShirtTemplate = "rbxassetid://".. DecalCheck[1]
					elseif v:IsA("Pants") and DecalCheck[2] ~= nil then
						v.PantsTemplate = "rbxassetid://".. DecalCheck[2]
					elseif v:IsA("ShirtGraphic") and DecalCheck[3] ~= nil then
						v.Graphic = "rbxassetid://".. DecalCheck[3]
					end
				end]]
				local function convertId(id)
					local success, decalObjecct = pcall(function()
						local decalObjecct = game:GetObjects("rbxassetid://"..id)[1]
						return decalObjecct
					end)
					if success then
						return decalObjecct.Texture
					elseif string.gsub(id,"%D","") == id then
						return "rbxassetid://".. id
					else
						return id
					end
				end
				if v:IsA("Shirt") and string.gsub(v.ShirtTemplate,"%D","") == "855777285" and HumanoidDescription.Shirt then
					v.ShirtTemplate = convertId(HumanoidDescription.Shirt)
				elseif v:IsA("Pants") and string.gsub(v.PantsTemplate,"%D","") == "867826313" and HumanoidDescription.Pants then
					v.PantsTemplate = convertId(HumanoidDescription.Pants)
				end
				local OldCloth = Character:FindFirstChildOfClass(v.ClassName)

				if OldCloth then
					if PlayerData[Data].OldestClothings[v.ClassName] == nil then
						PlayerData[Data].OldestClothings[v.ClassName] = OldCloth:Clone()
					end
					OldCloth:Destroy()
				end

				v.Parent = Character
			elseif v:IsA("BodyColors") and UseBodyColor == true then
				local OldBC = Character:FindFirstChildOfClass("BodyColors")

				if OldBC then
					OldBC:Destroy()
				end

				v.Parent = Character

				Function.BodyColorSet(Character, v)
			end
		end

		if isCatalogUsername == true then

			if Character:FindFirstChild("Head") then
				local LoadedAvatar = game:GetService("Players"):CreateHumanoidModelFromDescription(HumanoidDescription, Enum.HumanoidRigType.R6)
				local head = LoadedAvatar:WaitForChild("Head")

				local OldFC = Character:FindFirstChild("Head"):FindFirstChildOfClass("Decal")
				local OldSM = Character:FindFirstChild("Head"):FindFirstChildOfClass("SpecialMesh")

				if Character:FindFirstChild("Head"):IsA("MeshPart") then
					local v = Character:FindFirstChild("Head")
					local newHead = Instance.new("Part",v)
					newHead:AddTag("RoClothes")
					newHead.Size = v.Size
					newHead.Name = "RCFake"..v.Name
					newHead.CanCollide = false
					newHead.CanQuery = false
					newHead.CanTouch = false
					newHead.Massless = true
					newHead.CustomPhysicalProperties = PhysicalProperties.new(0.0001)
					newHead.Color = v.Color
					newHead.Material = v.Material
					newHead.Reflectance = v.Reflectance
					PlayerData[Data].CurrentPartList.Organ["Head"] = newHead
					PlayerData[Data].CurrentPartList.TransparencyLink[newHead] = {T=v}
					
					newHead.CFrame = v.CFrame
					local Weld = Instance.new("Weld", newHead)
					Weld.Part0 = v
					Weld.Part1 = newHead

					if PlayerData[Data].Face == true then
						if head:FindFirstChildOfClass("Decal") then
							if OldFC then
								OldFC:Destroy()
							end
							local newDC=head:FindFirstChildOfClass("Decal"):Clone()
							newDC.Parent = newHead
							PlayerData[Data].CurrentPartList.TransparencyLink[newDC] = {T=newHead}
						elseif OldFC then
							OldFC.Parent = newHead
						end
					elseif OldFC then
						OldFC:Destroy()
					end
					if head:FindFirstChildOfClass("SpecialMesh") then
						PlayerData[Data].CurrentPartList.ParentTransparency[v] = {v = v.Transparency, T = 1}
						local mesh = head:FindFirstChildOfClass("SpecialMesh"):Clone()
						mesh.Parent = newHead
						if mesh.MeshType == Enum.MeshType.Head then
							mesh.Scale = Vector3.new(1,1,1)
						end
						PlayerData[Data].CurrentPartList.RealtimeUpdateList.SpecialMesh[mesh] = {
							Base=v,
							Size=mesh.Scale,
							CFrame = CFrame.new(0,0,0),
							CFrame1 = CFrame.new(0,0,0),
							Weld = Weld,
						}
					else
						local mesh = Instance.new("SpecialMesh",newHead)
						mesh.MeshId = getAsset(v.MeshId)
					end
				elseif Method == 2 and oChar then
					local h = Character:FindFirstChild("Head")
					--PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[h] = {Base = h}
					--h.Transparency = 0

					local function newhed(id,texture)
						local newHead
						local resolvedId = getAsset(id)
						local resolvedTex = getAsset(texture)
						local success = pcall(function()
							newHead = IS:CreateMeshPartAsync(resolvedId, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
						end)
						if not success then
							newHead = IS:CreateMeshPartAsync("rbxasset://fonts//head.mesh", Enum.CollisionFidelity.Box, Enum.RenderFidelity.Automatic)
						end
						newHead.Parent = h
						local appearance = Instance.new("SurfaceAppearance",newHead)
						appearance.ColorMap = resolvedTex
						newHead:AddTag("ImportantSurfaceAppearance")
						newHead:AddTag("RoClothes")
						--newHead.Size = h.Size
						newHead.Name = h.Name
						newHead.CanCollide = false
						newHead.CanQuery = false
						newHead.CanTouch = false
						newHead.Massless = true
						newHead.CustomPhysicalProperties = PhysicalProperties.new(0.0001)
						newHead.Color = h.Color
						newHead.Material = h.Material
						newHead.Reflectance = h.Reflectance
						PlayerData[Data].CurrentPartList.Organ["Head"] = newHead
						
						newHead.CFrame = h.CFrame
						local Weld = Instance.new("Weld", newHead)
						Weld.Part0 = h
						Weld.Part1 = newHead
						PlayerData[Data].CurrentPartList.RealtimeUpdateList.Mesh[newHead] = {Base = Character:FindFirstChild("Head"),Size=newHead.Size,CFrame=CFrame.new(0,0,0),CFrame1=CFrame.new(0,0,0),Weld=Weld}
						return newHead
					end

					PlayerData[Data].CurrentPartList.ParentTransparency[h] = {D = 1}
					PlayerData[Data].CurrentPartList.ParentTransparency[oChar:FindFirstChild("Head")] = {D = oChar:FindFirstChild("Head").Transparency, T = 1}

					if OldFC then
						OldFC:Destroy()
					end
					if OldSM then
						OldSM:Destroy()
					end
					local OldFC = oChar:FindFirstChild("Head"):FindFirstChildOfClass("Decal")
					local OldSM = oChar:FindFirstChild("Head"):FindFirstChildOfClass("SpecialMesh")

					if head:FindFirstChildOfClass("SpecialMesh") then
						h = newhed(head:FindFirstChildOfClass("SpecialMesh").MeshId,head:FindFirstChildOfClass("SpecialMesh").TextureId)
					elseif OldSM then
						h = newhed(OldSM.MeshId,OldSM.TextureId)
					end
					if PlayerData[Data].Face == true then
						if head:FindFirstChildOfClass("Decal") then
							if OldFC then
								OldFC.Transparency = 1
								PlayerData[Data].CurrentPartList.ParentTransparency[OldFC] = {D = 0}
							end
							local d = head:FindFirstChildOfClass("Decal"):Clone()
							PlayerData[Data].CurrentPartList.TransparencyLink[d] = {T=h}
							d.Parent = h
						elseif OldFC then
							local o = OldFC:Clone()
							PlayerData[Data].CurrentPartList.ParentTransparency[o] = {D = 1}
							PlayerData[Data].CurrentPartList.TransparencyLink[o] = {T=h}
							o.Parent = h
						end
					elseif OldFC then
						OldFC.Transparency = 1
						PlayerData[Data].CurrentPartList.ParentTransparency[OldFC] = {D = 0}
					end
				else
					if head:FindFirstChildOfClass("Decal") and PlayerData[Data].Face == true then
						if OldFC then
							OldFC:Destroy()
						end
						head:FindFirstChildOfClass("Decal"):Clone().Parent = Character:FindFirstChild("Head")
					elseif OldFC then
						OldFC:Destroy()
					end
					if head:FindFirstChildOfClass("SpecialMesh") then
						if OldSM then
							OldSM:Destroy()
						end
						head:FindFirstChildOfClass("SpecialMesh"):Clone().Parent = Character:FindFirstChild("Head")
					end
				end

				LoadedAvatar:Destroy()
			end
		end

		AccessoryLoaderModel:Destroy()
		HumanoidDescription:Destroy()
	end

	function Function.AccessoryLoaderFunction(Character, CharacterAttachment, SelectBundle, Data)
		local Human = Character:FindFirstChildOfClass("Humanoid")

		local HumanoidDescription = Instance.new("HumanoidDescription", game)
		local HumanoidDescriptionTail = Instance.new("HumanoidDescription", game)

		local IsAdded = Function.HumanoidDescriptionSet(Bundle[SelectBundle]["Accessory"], Bundle[SelectBundle]["Clothes"], HumanoidDescription)
		local IsTail = Function.HumanoidDescriptionSet(Bundle[SelectBundle]["TailAccessory"], nil, HumanoidDescriptionTail)

		if IsAdded == true then

			Function.HumanoidDescriptionLoader(Character, HumanoidDescription, CharacterAttachment, false, Data)
		end
		if IsTail == true then

			Function.HumanoidDescriptionLoader(Character, HumanoidDescriptionTail, CharacterAttachment, false, Data, nil, nil, true)
		end

		HumanoidDescription:Destroy()
		HumanoidDescriptionTail:Destroy()
	end

	function Function.CatalogLoader(Character, CharacterAttachment, Data, oChar)
		local Human = Character:FindFirstChildOfClass("Humanoid")

		--[[local DecalInfo
		if PlayerData[Data].CatalogClothes.DecalClothes == true then
			DecalInfo = {PlayerData[Data].CatalogClothes.Shirt,PlayerData[Data].CatalogClothes.Pants,PlayerData[Data].CatalogClothes.ShirtGraphic}
		end]]
		if PlayerData[Data].CatalogUsername ~= "" then

			pcall(function()
				local UsernameId = PS:GetUserIdFromNameAsync(PlayerData[Data].CatalogUsername)

				local HumanoidDescription = PS:GetHumanoidDescriptionFromUserId(UsernameId)

				for Type, Id in pairs(PlayerData[Data].CatalogClothes) do
					if Id ~= "" then
						if Type == "Shirt" then
							HumanoidDescription.Shirt = Id
						elseif Type == "Pants" then
							HumanoidDescription.Pants = Id
						elseif Type == "ShirtGraphic" then
							HumanoidDescription.GraphicTShirt = Id
						end
					end
				end

				if #PlayerData[Data].CatalogRemove > 0 then
					local accessories = HumanoidDescription:GetAccessories(true)
					for _, remove in pairs(PlayerData[Data].CatalogRemove) do
						for asset, accessory in pairs(accessories) do
							if accessory.AssetId == remove then
								table.remove(accessories,asset)
							end
						end
					end
					HumanoidDescription:SetAccessories(accessories,true)
				end

				Function.HumanoidDescriptionLoader(Character, HumanoidDescription, CharacterAttachment, true, Data, true, oChar)
			end)
		end
		if PlayerData[Data].CatalogOutfitId ~= "" then
			pcall(function()
				local HumanoidDescription =  PS:GetHumanoidDescriptionFromOutfitId(PlayerData[Data].CatalogOutfitId)

				for Type, Id in pairs(PlayerData[Data].CatalogClothes) do
					if Id ~= "" then
						if Type == "Shirt" then
							HumanoidDescription.Shirt = Id
						elseif Type == "Pants" then
							HumanoidDescription.Pants = Id
						elseif Type == "ShirtGraphic" then
							HumanoidDescription.GraphicTShirt = Id
						end
					end
				end

				if #PlayerData[Data].CatalogRemove > 0 then
					local accessories = HumanoidDescription:GetAccessories(true)
					for _, remove in pairs(PlayerData[Data].CatalogRemove) do
						for asset, accessory in pairs(accessories) do
							if accessory.AssetId == remove then
								table.remove(accessories,asset)
							end
						end
					end
					HumanoidDescription:SetAccessories(accessories,true)
				end

				Function.HumanoidDescriptionLoader(Character, HumanoidDescription, CharacterAttachment, true, Data, true, oChar)
			end)
		end
		local HumanoidDescription = Instance.new("HumanoidDescription", game.Workspace)
		local HumanoidDescriptionTail = Instance.new("HumanoidDescription", game.Workspace)

		local IsAdded = Function.HumanoidDescriptionSet(PlayerData[Data].CatalogAccessory, PlayerData[Data].CatalogClothes, HumanoidDescription)
		local IsTail = Function.HumanoidDescriptionSet(PlayerData[Data].CatalogTail, nil, HumanoidDescriptionTail)

		if IsAdded == true then
			Function.HumanoidDescriptionLoader(Character, HumanoidDescription, CharacterAttachment, false, Data, nil, nil)
		else
			HumanoidDescription:Destroy()
		end
		if IsTail == true then
			Function.HumanoidDescriptionLoader(Character, HumanoidDescriptionTail, CharacterAttachment, false, Data, nil, nil, true)
		else
			HumanoidDescriptionTail:Destroy()
		end
	end
	function Function.TableFind(Table, Value)
		for i, v in pairs(Table) do
			if v == Value then
				return i
			end
		end
	end
	function Function.TableClone(Table)
		local newtable = {}
		for i, v in pairs(Table) do
			newtable[i] = v
		end
		return newtable
	end

	function Function.CharacterReset(PlayerName,NPCClear)
		local ExecutePlayer
		if typeof(PlayerName) ~= "Instance" then
			ExecutePlayer = PS:FindFirstChild(PlayerName) -- check if this function is called by Player name target(most of time 'Self')
		end

		local DataList = nil
		local PartListPlayer = nil

		if not PlayerName then
			if GUIObject.PlayerExecute.Text == "Self" then
				ExecutePlayer = Player
				DataList = PlayerData[ExecutePlayer.Name]
				PartListPlayer = DataList.CurrentPartList
			end
		elseif ExecutePlayer then
			if PlayerData[ExecutePlayer.Name] == nil then
				return
			end
			DataList = PlayerData[ExecutePlayer.Name]
			PartListPlayer = DataList.CurrentPartList
		end
		--[[ below if is for ClickExecute
		if type(PlayerName) ~= "string" and Function.IsCharacter(PlayerName) then
			if Function.TableFind(NPCs, PlayerName) == nil then
				return
			else
				local NPC = Function.TableFind(NPCs, PlayerName)
				for i, v in pairs(PlayerName:GetDescendants()) do
					if v.ClassName == "MeshPart" or v:HasTag("RoClothes") then
						if v.Parent == PlayerName:FindFirstChild("Torso") or v.Parent == PlayerName:FindFirstChild("Left Leg") or v.Parent == PlayerName:FindFirstChild("Right Leg") or
							v.Parent == PlayerName:FindFirstChild("Left Arm") or v.Parent == PlayerName:FindFirstChild("Right Arm") or v:HasTag("RoClothes") then
							v:Destroy()
						end
					end
				end
				if Method2CharacterFolder:FindFirstChild(NPC) then
					for i, v in pairs(Method2CharacterFolder[NPC]:GetDescendants()) do
						if v.ClassName == "MeshPart" or v:HasTag("RoClothes") then
							if v.Parent == PlayerName:FindFirstChild("Torso") or v.Parent == PlayerName:FindFirstChild("Left Leg") or v.Parent == PlayerName:FindFirstChild("Right Leg") or
								v.Parent == PlayerName:FindFirstChild("Left Arm") or v.Parent == PlayerName:FindFirstChild("Right Arm") or v:HasTag("RoClothes") then
								v:Destroy()
							end
						end
					end
				end
				if NPCClear == true then
					PlayerData[Function.TableFind(NPCs, PlayerName)] = nil
				end
			end
			return
		end]]

		if type(PlayerName) ~= "string" and Function.IsCharacter(PlayerName) then
			if Function.TableFind(NPCs, PlayerName) == nil or not PlayerData[Function.TableFind(NPCs, PlayerName)] then
				return
			else
				DataList = PlayerData[Function.TableFind(NPCs, PlayerName)]
				PartListPlayer = DataList.CurrentPartList
				if NPCClear == true then
					PlayerData[Function.TableFind(NPCs, PlayerName)] = nil
				end
			end
		end

		if DataList["Cooldown"] == true then
			return
		end

		if PartListPlayer then
			local SpecialList = PartListPlayer.RealtimeUpdateList["Special"]
			local OrganList = PartListPlayer["Organ"]
			local ClothesList = PartListPlayer["Clothes"]
			local AccessoryList = PartListPlayer["Accessory"]
			local ParentTransparencyList = PartListPlayer["ParentTransparency"]

			if SpecialList then
				for _, v in pairs(SpecialList) do
					v:Destroy()
				end
			end

			if OrganList then
				for _, v in pairs(OrganList) do
					v:Destroy()
				end
			end

			if ClothesList then
				for _, v in pairs(ClothesList) do
					v:Destroy()
				end
			end

			if AccessoryList then
				for _, v in pairs(AccessoryList) do
					v:Destroy()
				end
			end

			if ParentTransparencyList then
				for Object, Property in pairs(ParentTransparencyList) do
					local D = Property.D
					if D ~= nil then
						if Object.Name ~= "HumanoidRootPart" then
							Object.Transparency = D
							Object.LocalTransparencyModifier = Object.Transparency
						end
					end
				end
			end
			
			if PartListPlayer.OriginalTransparency then
				for i, v in pairs(PartListPlayer.OriginalTransparency) do
					if i.Name ~= "HumanoidRootPart" then
						i.Transparency = v
						i.LocalTransparencyModifier = v
					end
				end
			end

			DataList.CurrentPartList = Function.PlayerDataDefault().CurrentPartList

			local targetPlr = PS:FindFirstChild(PlayerName) or Player
			local char = (targetPlr and targetPlr.Character) or DataList.Character

			if Method2CharacterFolder:FindFirstChild(PlayerName) then
				Method2CharacterFolder[PlayerName]:Destroy()
			end

			if DataList.ConvertedPart then
				for _, cp in pairs(DataList.ConvertedPart) do
					if cp.Part and cp.Part.Parent then
						cp.Part.Transparency = 1
						cp.Part.LocalTransparencyModifier = 1
					end
				end
			end

			for i, v in pairs(game:GetService("CollectionService"):GetTagged("Visibility")) do
				v.Transparency = v:GetAttribute("Visibility")
				v.LocalTransparencyModifier = v:GetAttribute("Visibility")
				v:SetAttribute("Visibility", nil)
				v:RemoveTag("Visibility")
			end

			if char then
				-- Clean up any residual RoClothes objects on the base character
				for _, item in ipairs(char:GetDescendants()) do
					if item:HasTag("RoClothes") or item:HasTag("ImportantSurfaceAppearance") then
						item:Destroy()
					end
				end

				-- Restore base character body parts and genuine accessories (strictly keep HumanoidRootPart invisible!)
				for _, v in ipairs(char:GetChildren()) do
					if v:IsA("BasePart") then
						if v.Name == "HumanoidRootPart" then
							v.Transparency = 1
							v.LocalTransparencyModifier = 1
							v.CanCollide = false
						else
							v.Transparency = 0
							v.LocalTransparencyModifier = 0
						end
					elseif v:IsA("Accessory") then
						if v:HasTag("RoClothes") then
							v:Destroy()
						else
							local handle = v:FindFirstChild("Handle") or v:FindFirstChildOfClass("BasePart")
							if handle then
								handle.Transparency = 0
								handle.LocalTransparencyModifier = 0
							end
						end
					end
				end

				-- Restore player's genuine own avatar state (clothes, body colors, graphics):
				local own = DataList.PlayerOwnAvatar
				if not own then
					Function.CapturePlayerOwnAvatar(PlayerName)
					own = DataList.PlayerOwnAvatar
				end

				if own then
					if own.ShirtTemplate and own.ShirtTemplate ~= "" then
						local s = char:FindFirstChildOfClass("Shirt") or Instance.new("Shirt", char)
						s.ShirtTemplate = own.ShirtTemplate
					else
						if char:FindFirstChildOfClass("Shirt") then
							char:FindFirstChildOfClass("Shirt"):Destroy()
						end
					end

					if own.PantsTemplate and own.PantsTemplate ~= "" then
						local p = char:FindFirstChildOfClass("Pants") or Instance.new("Pants", char)
						p.PantsTemplate = own.PantsTemplate
					else
						if char:FindFirstChildOfClass("Pants") then
							char:FindFirstChildOfClass("Pants"):Destroy()
						end
					end

					if own.Graphic and own.Graphic ~= "" then
						local g = char:FindFirstChildOfClass("ShirtGraphic") or Instance.new("ShirtGraphic", char)
						g.Graphic = own.Graphic
					end

					if own.BodyColors then
						local bc = char:FindFirstChildOfClass("BodyColors") or Instance.new("BodyColors", char)
						for prop, col in pairs(own.BodyColors) do
							pcall(function() bc[prop] = col end)
						end
						Function.BodyColorSet(char, bc)
					end
				end
			end
		end
	end

	function Function.RodPhysics(ObjectInstance, Character, Extra, Data)
		if PlayerData[Data].BodyPartPhysics then
			local PhysicsRotationOffset
			local Rotation = {
				X = 2,
				Y = 7,
				Z = 5
			}
			if tostring(ObjectInstance) == "Rod" then
				Rotation = {
					X = 2,
					Y = -7,
					Z = 5
				}
				PhysicsRotationOffset = {
					X = "X",
					Y = "Z",
					Z = "Y",
				}
			elseif tostring(ObjectInstance) == "HorseRod" then
				Rotation = {
					X = 2,
					Y = -7,
					Z = 5
				}
				PhysicsRotationOffset = {
					X = "Y",
					Y = "X",
					Z = "Z",
				}
			else
				PhysicsRotationOffset = {
					X = "Y",
					Y = "X",
					Z = "Z",
				}
			end
			Function.SpringCreate(
				ObjectInstance, 
				PlayerData[Data].CurrentPartList["Organ"]["Torso"], 
				Vector3.new(0,0,0), 
				Vector3.new(0,0,0), 
				10, 
				0.2, 
				{
					X = "X",
					Y = "Y",
					Z = "Z",
				},
				{
					X = 0,
					Y = 0,
					Z = 0
				},
				PhysicsRotationOffset,
				Rotation,
				Data
			)
		end
	end

	function Function.BBCBallPhysics(ObjectInstance, Character, Extra, Data)
		if PlayerData[Data].BodyPartPhysics then
			local PhysicsRotationOffset
			local Rotation = {
				X = 2,
				Y = 1,
				Z = 5
			}
			local Rod
			if tostring(ObjectInstance) == "BBC Balls" then
				Rod = PlayerData[Data].CurrentPartList["Clothes"]["BBC Rod"]
				PhysicsRotationOffset = {
					X = "Y",
					Y = "X",
					Z = "Z",
				}
			elseif tostring(ObjectInstance) == "ballsKnot" or tostring(ObjectInstance) == "ballsKnotR" then
				if tostring(ObjectInstance) == "ballsKnot" then
					Rod = PlayerData[Data].CurrentPartList["Clothes"]["mainKnot"]
				else
					Rod = PlayerData[Data].CurrentPartList["Clothes"]["mainKnotRetracted"]
				end
				PhysicsRotationOffset = {
					X = "X",
					Y = "Y",
					Z = "Z",
				}
			elseif tostring(ObjectInstance) == "HorseBall" then
				Rod = PlayerData[Data].CurrentPartList["Clothes"]["HorseRod"]
				PhysicsRotationOffset = {
					X = "Y",
					Y = "X",
					Z = "Z",
				}
			else
				Rod = PlayerData[Data].CurrentPartList["Clothes"]["Cock"]
				PhysicsRotationOffset = {
					X = "X",
					Y = "Y",
					Z = "Z",
				}
			end
			Function.SpringCreate(
				ObjectInstance,
				Rod, 
				Vector3.new(0,0,0), 
				Vector3.new(0,0,0), 
				10, 
				0.2, 
				{
					X = "X",
					Y = "Y",
					Z = "Z",
				},
				{
					X = 0,
					Y = 0,
					Z = 0
				},
				PhysicsRotationOffset,
				{
					X = 2,
					Y = 1,
					Z = 5
				},
				Data
			)
		end
	end

	function Function.Converter(Character, Data)
		for _, v in pairs(Character:GetChildren()) do
			if v:IsA("BasePart") and table.find(R15Transparency, v.Name) then
				--v.Transparency = 1
				PlayerData[Data].CurrentPartList.ParentTransparency[v] = {D=0,T=1}
			end
		end
		--[[
		if Method == 2 then
			local OldCharacter = Character

			Character = Method2CharacterFolder:FindFirstChild(OldCharacter.Name)

			if not Character then
				Character = Instance.new("Model", Method2CharacterFolder)
				Character.Name = OldCharacter.Name

				local Humanoid = Instance.new("Humanoid", Character)
				Humanoid.RigType = Enum.HumanoidRigType.R6
				Humanoid.PlatformStand = true

				local CharacterValue = Instance.new("ObjectValue", Character)
				CharacterValue.Value = OldCharacter

				for _, v in pairs(CharacterValue.Value:GetChildren()) do
					if v:IsA("BasePart") and table.find(Method2BodyPart, v.Name) then
						local Part

						if v.Name ~= "Head" then
							Part = Instance.new("Part", Character)
						else
							Part = Instance.new("MeshPart", Character)
						end

						Part.Size = v.Size
						Part.Name = v.Name
						Part.Transparency = 1
						Part.CanCollide = false
						Part.CanQuery = false
						Part.CanTouch = false
						Part.Massless = true
						Part.Color = v.Color

						local Weld = Instance.new("Weld", Part)
						Weld.Part0 = v
						Weld.Part1 = Part
					end
				end
			end
		end
		]]
		if Character:FindFirstChild("UpperTorso") and not Character:FindFirstChild("Torso") then
			for New, Base in pairs(ConvertPart) do
				local BasePart = Character:FindFirstChild(Base)

				if BasePart then
					local Part

					if New == "Torso" then
						Part = IS:CreateMeshPartAsync(R6Mesh[New.."Female"], Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
					else
						Part = IS:CreateMeshPartAsync(R6Mesh[New], Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance)
					end

					Part.Name = New
					Part.Color = BasePart.Color
					Part.CanCollide = false
					Part.CanQuery = false
					Part.CanTouch = false
					Part.Massless = true
					Part.CustomPhysicalProperties = PhysicalProperties.new(0.0001)
					Part.Size = R6Size[New]
					Part.Material = Enum.Material.SmoothPlastic
					Part.Transparency = 1
					Part.LocalTransparencyModifier = 1
					Part:SetAttribute("Visibility",0)
					
					Part.CFrame = BasePart.CFrame
					local Weld = Instance.new("Weld", Part)
					Weld.Part0 = BasePart
					Weld.Part1 = Part
					Weld.C0 = WeldCFrame[New]

					Part.Parent = Character

					Part:AddTag("RoClothes")
					PlayerData[Data].ConvertedPart[New] = {Part = Part, Weld = Weld, Base = BasePart}
				end
			end
		elseif Character:FindFirstChild("UpperTorso") and Character:FindFirstChild("Torso") then
			for i, v in pairs(PlayerData[Data].ConvertedPart) do
				v.Part.Transparency = 1
				v.Part.LocalTransparencyModifier = 1
			end
		end
	end

	function Function.CharacterExecute(Character, Data, bool)

		if Character then

			local Human = Character:FindFirstChildOfClass("Humanoid")
			local Head = Character:FindFirstChild("Head")
			local FaceDecal = Head and (Head:FindFirstChild("face") or Head:FindFirstChild("Face"))
			if not Human then
				return
			end

			Function.CharacterReset(Character)

			Function.PlayerDataAdd(Data)

			local DataDetail = PlayerData[Data]

			if DataDetail["Cooldown"] == true then
				return
			end
			DataDetail["Cooldown"] = true
			DataDetail["Character"] = Character

			Function.Converter(Character,Data)
			Function.AttachmentCreate(Character)

			local CharacterAttachment = Function.CharacterFunction(Character, Data)

			if Human then
				DataDetail.SavedPreviousHP = Human.Health
				if DataDetail.TopHP ~= "" then
					DataDetail.SavedTopHP = DataDetail.TopHP
				end
				if DataDetail.BottomHP ~= "" then
					DataDetail.SavedBottomHP = DataDetail.BottomHP
				end
			end
			DataDetail.TopRipped = false
			DataDetail.BottomRipped = false
			local OldCharacter
			if Method == 2 then
				OldCharacter = Character

				-- Safely capture original untouched avatar state once:
				if not DataDetail.OriginalAvatarState and OldCharacter then
					local s = OldCharacter:FindFirstChildOfClass("Shirt")
					local p = OldCharacter:FindFirstChildOfClass("Pants")
					local g = OldCharacter:FindFirstChildOfClass("ShirtGraphic")
					local bc = OldCharacter:FindFirstChildOfClass("BodyColors")
					local targetPlr = PS:FindFirstChild(Data) or Player
					local desc = nil
					if targetPlr and targetPlr.UserId and targetPlr.UserId > 0 then
						pcall(function() desc = PS:GetHumanoidDescriptionFromUserId(targetPlr.UserId) end)
					end
					DataDetail.OriginalAvatarState = {
						ShirtTemplate = (s and s.ShirtTemplate ~= "" and s.ShirtTemplate) or (desc and desc.Shirt and desc.Shirt ~= 0 and ("rbxassetid://" .. desc.Shirt)) or "",
						PantsTemplate = (p and p.PantsTemplate ~= "" and p.PantsTemplate) or (desc and desc.Pants and desc.Pants ~= 0 and ("rbxassetid://" .. desc.Pants)) or "",
						Graphic = (g and g.Graphic ~= "" and g.Graphic) or (desc and desc.GraphicTShirt and desc.GraphicTShirt ~= 0 and ("rbxassetid://" .. desc.GraphicTShirt)) or "",
						BodyColors = bc and {
							HeadColor3 = bc.HeadColor3,
							TorsoColor3 = bc.TorsoColor3,
							LeftArmColor3 = bc.LeftArmColor3,
							RightArmColor3 = bc.RightArmColor3,
							LeftLegColor3 = bc.LeftLegColor3,
							RightLegColor3 = bc.RightLegColor3,
						},
					}
				end

				Character = Method2CharacterFolder:FindFirstChild(Data)

				if Character then
					for i, v in pairs(Character:GetChildren()) do
						if Character then
							if v:IsA("BasePart") and table.find(Method2BodyPart, v.Name) then
								if OldCharacter:FindFirstChild(v.Name) then
									if (v.Position-OldCharacter:FindFirstChild(v.Name).Position).Magnitude > 2 then
										Character:Destroy()
										Character = nil
										break
									else
										-- Keep clone part color synchronized with live avatar:
										v.Color = OldCharacter:FindFirstChild(v.Name).Color
									end
								end
							end
						end
					end
				end

				if not Character then
					Character = Instance.new("Model", Method2CharacterFolder)
					Character:AddTag("RoClothes")
					Character.Archivable = not hidden
					Character.Name = Data
					--[[
					local Humanoid = Instance.new("Humanoid", Character)
					Humanoid.RigType = Enum.HumanoidRigType.R6
					Humanoid.PlatformStand = true
					]]
					local CharacterValue = Instance.new("ObjectValue", Character)
					CharacterValue.Value = OldCharacter

					for _, v in pairs(CharacterValue.Value:GetChildren()) do
						if v:IsA("BasePart") and table.find(Method2BodyPart, v.Name) or v.Name == "HumanoidRootPart" then
							if v.Name ~= "Head" then
								DataDetail.CurrentPartList.ParentTransparency[v] = {D = v.Transparency,T = 1}
							end

							local Part = Instance.new("Part", Character)
							Part.Size = v.Size
							Part.Name = v.Name
							Part.Transparency = 1
							Part.CanCollide = false
							Part.CanQuery = false
							Part.CanTouch = false
							Part.Massless = true
							Part.CustomPhysicalProperties = PhysicalProperties.new(0.0001)
							Part.Color = v.Color
							
							Part.CFrame = v.CFrame
							local Weld = Instance.new("Weld", Part)
							Weld.Part0 = v
							Weld.Part1 = Part

							if Part.Name == "HumanoidRootPart" then
								Character.PrimaryPart = Part
							end

							local detectRemoval
							detectRemoval = Part.ChildRemoved:Connect(function(c)
								if Part.Parent ~= nil then
									if c:IsA("Weld") and c.Part0 == v then
										c:Clone().Parent = Part
									end
								else
									detectRemoval:Disconnect()
								end
							end)
							table.insert(AllConnect,detectRemoval)
						end
					end
				end
				if OldCharacter:FindFirstChildOfClass("Shirt") then
					if DataDetail.OldestClothings.Shirt == nil then
						DataDetail.OldestClothings.Shirt = OldCharacter:FindFirstChildOfClass("Shirt"):Clone()
					end
					if Character:FindFirstChildOfClass("Shirt") then
						Character:FindFirstChildOfClass("Shirt"):Destroy()
					end
					OldCharacter:FindFirstChildOfClass("Shirt"):Clone().Parent = Character
				end
				if OldCharacter:FindFirstChildOfClass("Pants") then
					if DataDetail.OldestClothings.Pants == nil then
						DataDetail.OldestClothings.Pants = OldCharacter:FindFirstChildOfClass("Pants"):Clone()
					end
					if Character:FindFirstChildOfClass("Pants") then
						Character:FindFirstChildOfClass("Pants"):Destroy()
					end
					OldCharacter:FindFirstChildOfClass("Pants"):Clone().Parent = Character
				end
			end

			if Bundle[DataDetail.CurrentBundle]["TClothes"] then
				for i, v in pairs(Bundle[DataDetail.CurrentBundle]["TClothes"]) do
					DataDetail.HPClothes[i] = v
				end
			end

			if Bundle[DataDetail.CurrentBundle]["NippleColor"] and DataDetail.Tone == "Use NippleColor" and DataDetail.NippleColor == nil then
				DataDetail.NippleColor = Bundle[DataDetail.CurrentBundle]["NippleColor"]
			end

			local TShirt = Character:FindFirstChildOfClass("ShirtGraphic")
			local Shirt = Character:FindFirstChildOfClass("Shirt")
			local Pants = Character:FindFirstChildOfClass("Pants")

			-- Ensure PlayerOwnAvatar is captured if using own avatar:
			if (DataDetail.CurrentBundle == "nil" or DataDetail.CurrentBundle == "Default") and not DataDetail.PlayerOwnAvatar then
				Function.CapturePlayerOwnAvatar(Data)
			end

			-- Maintain and apply character shirt and pants:
			local isPresetWithClothes = (DataDetail.CurrentBundle ~= "nil" and DataDetail.CurrentBundle ~= "Default" and Bundle[DataDetail.CurrentBundle] and Bundle[DataDetail.CurrentBundle]["Clothes"])
			local bClothes = isPresetWithClothes and Bundle[DataDetail.CurrentBundle]["Clothes"]
			local savedShirtId = bClothes and bClothes.Shirt
			local savedPantsId = bClothes and bClothes.Pants

			local ownAvatar = DataDetail.PlayerOwnAvatar
			local ownShirtTemplate = (ownAvatar and ownAvatar.ShirtTemplate ~= "" and ownAvatar.ShirtTemplate)
				or (OldCharacter and OldCharacter:FindFirstChildOfClass("Shirt") and OldCharacter:FindFirstChildOfClass("Shirt").ShirtTemplate)
				or ""

			local ownPantsTemplate = (ownAvatar and ownAvatar.PantsTemplate ~= "" and ownAvatar.PantsTemplate)
				or (OldCharacter and OldCharacter:FindFirstChildOfClass("Pants") and OldCharacter:FindFirstChildOfClass("Pants").PantsTemplate)
				or ""

			local function resolveTemplate(assetId, fallbackObj, prop)
				if assetId and tonumber(assetId) and tonumber(assetId) > 0 then
					local num = tonumber(assetId)
					if clothesTemplateCache and clothesTemplateCache[num] then
						return clothesTemplateCache[num]
					end
					local realTex = nil
					pcall(function()
						local obj = game:GetObjects("rbxassetid://" .. tostring(num))[1]
						if obj and obj[prop] and obj[prop] ~= "" then
							realTex = obj[prop]
						end
					end)
					if realTex then
						if not clothesTemplateCache then clothesTemplateCache = {} end
						clothesTemplateCache[num] = realTex
						return realTex
					end
					local rbxId = "rbxassetid://" .. tostring(num)
					if not clothesTemplateCache then clothesTemplateCache = {} end
					clothesTemplateCache[num] = rbxId
					return rbxId
				end
				if fallbackObj and fallbackObj[prop] and fallbackObj[prop] ~= "" then
					return fallbackObj[prop]
				end
				return nil
			end

			local finalShirtTemplate = nil
			local finalPantsTemplate = nil

			if savedShirtId and savedShirtId > 0 then
				finalShirtTemplate = resolveTemplate(savedShirtId, nil, "ShirtTemplate")
			elseif table.find(DataDetail.CurrentClothes, "Roblox Shirt") then
				finalShirtTemplate = (ownShirtTemplate ~= "" and ownShirtTemplate) or nil
			end

			if savedPantsId and savedPantsId > 0 then
				finalPantsTemplate = resolveTemplate(savedPantsId, nil, "PantsTemplate")
			elseif table.find(DataDetail.CurrentClothes, "Roblox Pants") then
				finalPantsTemplate = (ownPantsTemplate ~= "" and ownPantsTemplate) or nil
			end

			if finalShirtTemplate and finalShirtTemplate ~= "" then
				local s = Character:FindFirstChildOfClass("Shirt") or Instance.new("Shirt", Character)
				s.ShirtTemplate = finalShirtTemplate
			else
				if Character:FindFirstChildOfClass("Shirt") then
					Character:FindFirstChildOfClass("Shirt"):Destroy()
				end
			end

			if finalPantsTemplate and finalPantsTemplate ~= "" then
				local p = Character:FindFirstChildOfClass("Pants") or Instance.new("Pants", Character)
				p.PantsTemplate = finalPantsTemplate
			else
				if Character:FindFirstChildOfClass("Pants") then
					Character:FindFirstChildOfClass("Pants"):Destroy()
				end
			end

			if DataDetail.CurrentBundle ~= "nil" and (not Bundle[DataDetail.CurrentBundle]["Override"] or Bundle[DataDetail.CurrentBundle]["Override"] == false) then

				if DataDetail.CurrentBundle ~= "Bald" then

					Function.AccessoryLoaderFunction(Character, CharacterAttachment, DataDetail.CurrentBundle, Data)

					if DataDetail.SkinTone == nil then
						Function.BodyColorsFunction(Character, DataDetail.CurrentBundle, Data)
					end
				end
			end

			Function.CatalogLoader(Character, CharacterAttachment, Data, OldCharacter)
			if DataDetail.SkinTone ~= nil then
				Function.BodyColorForceSet(Character, DataDetail.SkinTone)
			end

			if DataDetail.CurrentBundle ~= "nil" and Bundle[DataDetail.CurrentBundle]["Override"] == true then

				if TShirt then
					if DataDetail.OldestClothings.ShirtGraphic == nil then
						DataDetail.OldestClothings.ShirtGraphic = TShirt:Clone()
					end
					TShirt:Destroy()
					TShirt = nil
				end
-- Shirt and Pants preserved

				if DataDetail.CurrentBundle ~= "Bald" then

					Function.AccessoryLoaderFunction(Character, CharacterAttachment, DataDetail.CurrentBundle, Data)

					if DataDetail.SkinTone == nil then
						Function.BodyColorsFunction(Character, DataDetail.CurrentBundle, Data)
					end
				end
			end

			TShirt = Character:FindFirstChildOfClass("ShirtGraphic")
			Shirt = Character:FindFirstChildOfClass("Shirt")
			Pants = Character:FindFirstChildOfClass("Pants")

			local Extra = {
				["TShirt"] = TShirt,
				["Shirt"] = (finalShirtTemplate and finalShirtTemplate ~= "" and { ShirtTemplate = finalShirtTemplate }) or nil,
				["Pants"] = (finalPantsTemplate and finalPantsTemplate ~= "" and { PantsTemplate = finalPantsTemplate }) or nil,
				["Tone"] = DataDetail.Tone,
				["SkinTone"] = DataDetail.SkinTone,
				["NippleColor"] = DataDetail.NippleColor
			}

			if DataDetail.HPClothes and ((DataDetail.HPClothes.Shirt and DataDetail.HPClothes.Shirt ~= "") or (DataDetail.HPClothes.Pants and DataDetail.HPClothes.Pants ~= "")) then
				local HumanoidDescription = Instance.new("HumanoidDescription")
				for Type, Id in pairs(DataDetail.HPClothes) do
					if Id and Id ~= "" and (type(Id) == "string" or type(Id) == "number") then
						if Type == "Shirt" then
							HumanoidDescription.Shirt = Id
						elseif Type == "Pants" then
							HumanoidDescription.Pants = Id
						elseif Type == "ShirtGraphic" then
							HumanoidDescription.GraphicTShirt = Id
						end
					end
				end
				local AccessoryLoaderModel = Instance.new("Model", workspace)
				AccessoryLoaderModel:AddTag("RoClothes")
				AccessoryLoaderModel.Archivable = not hidden
				local HumanoidAccessoryLoader = Instance.new("Humanoid", AccessoryLoaderModel)
				pcall(function()
					HumanoidAccessoryLoader:ApplyDescription(HumanoidDescription)
				end)

				for _, v in pairs(AccessoryLoaderModel:GetChildren()) do
					if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("ShirtGraphic") then
						local function convertId(id)
							local success, decalObjecct = pcall(function()
								local decalObjecct = game:GetObjects("rbxassetid://"..id)[1]
								return decalObjecct
							end)
							if success then
								return decalObjecct.Texture
							elseif string.gsub(id,"%D","") == id then
								return "rbxassetid://".. id
							else
								return id
							end
						end
						if v:IsA("Shirt") and string.gsub(v.ShirtTemplate,"%D","") == "855777285" and HumanoidDescription.Shirt then
							v.ShirtTemplate = convertId(HumanoidDescription.Shirt)
						elseif v:IsA("Pants") and string.gsub(v.PantsTemplate,"%D","") == "867826313" and HumanoidDescription.Pants then
							v.PantsTemplate = convertId(HumanoidDescription.Pants)
						end
						DataDetail.HPClothes[v.ClassName] = v
					end
				end
				AccessoryLoaderModel:Destroy()
				HumanoidDescription:Destroy()
			end

			local PartListData = DataDetail.PartList

			local PhysicsRotationOffset = {
				X = "Z",
				Y = "X",
				Z = "Y",
			}
			local Rotation = {
				X = 5,
				Y = -5,
				Z = 5
			}

			local TORSO
			local LEFTLEG
			local RIGHTLEG
			local LEFTARM
			local RIGHTARM
			local LEFTBUTT
			local RIGHTBUTT

			local LEFTBREAST
			local RIGHTBREAST

			if DataDetail.TorsoType == 1 then
				TORSO = Function.Weld(PartListData["Torso"], Character, Extra, Data)
			else
				TORSO = Function.Weld(PartListData["Torso".. DataDetail.TorsoType], Character, Extra, Data)
			end
			if TORSO and TORSO:IsA("BasePart") then
				local torsoCol = nil
				-- 1. Bundle body color override (only if explicitly enabled AND not Default):
				if DataDetail.CurrentBundle ~= "nil" and DataDetail.CurrentBundle ~= "Default" and Bundle[DataDetail.CurrentBundle] and Bundle[DataDetail.CurrentBundle]["Body Color"] and DataDetail.BundleBodyColor == true then
					torsoCol = Bundle[DataDetail.CurrentBundle]["Body Color"]["TorsoColor3"]
				end
				-- 2. User custom skin tone override:
				if not torsoCol and DataDetail.SkinTone ~= nil then
					torsoCol = DataDetail.SkinTone
				end
				-- 3. Live avatar body color (from OldCharacter live parts):
				if not torsoCol then
					local liveTorso = (OldCharacter and (OldCharacter:FindFirstChild("Torso") or OldCharacter:FindFirstChild("UpperTorso")))
					local liveHead = (OldCharacter and OldCharacter:FindFirstChild("Head"))
					torsoCol = (liveTorso and liveTorso.Color) or (liveHead and liveHead.Color) or (Character:FindFirstChild("Torso") and Character.Torso.Color)
				end
				if typeof(torsoCol) == "table" and torsoCol.R and torsoCol.G and torsoCol.B then
					torsoCol = Color3.new(torsoCol.R, torsoCol.G, torsoCol.B)
				end
				if typeof(torsoCol) == "Color3" then
					TORSO.Color = torsoCol
				end
			end

			if DataDetail.ArmType == 1 then
				LEFTARM = Function.Weld(PartListData["Left Arm"], Character, Extra, Data)
				RIGHTARM = Function.Weld(PartListData["Right Arm"], Character, Extra, Data)
			else
				LEFTARM = Function.Weld(PartListData["Left Arm".. DataDetail.ArmType], Character, Extra, Data)
				RIGHTARM = Function.Weld(PartListData["Right Arm".. DataDetail.ArmType], Character, Extra, Data)
			end

			if DataDetail.LegsType == 1 then
				LEFTLEG = Function.Weld(PartListData["Left Leg"], Character, Extra, Data)
				RIGHTLEG = Function.Weld(PartListData["Right Leg"], Character, Extra, Data)
			else
				LEFTLEG = Function.Weld(PartListData["Left Leg".. DataDetail.LegsType], Character, Extra, Data)
				RIGHTLEG = Function.Weld(PartListData["Right Leg".. DataDetail.LegsType], Character, Extra, Data)
			end

			if DataDetail.ButtType == 1 then
				LEFTBUTT = Function.Weld(PartListData["Left Butt"], Character, Extra, Data)
				RIGHTBUTT = Function.Weld(PartListData["Right Butt"], Character, Extra, Data)
			else
				LEFTBUTT = Function.Weld(PartListData["Left Butt".. DataDetail.ButtType], Character, Extra, Data)
				RIGHTBUTT = Function.Weld(PartListData["Right Butt".. DataDetail.ButtType], Character, Extra, Data)
			end

			PlayerData[Data].CurrentPartList["Organ"]["Torso"] = TORSO
			PlayerData[Data].CurrentPartList["Organ"]["Left Leg"] = LEFTLEG
			PlayerData[Data].CurrentPartList["Organ"]["Right Leg"] = RIGHTLEG
			PlayerData[Data].CurrentPartList["Organ"]["Left Arm"] = LEFTARM
			PlayerData[Data].CurrentPartList["Organ"]["Right Arm"] = RIGHTARM
			PlayerData[Data].CurrentPartList["Organ"]["Left Butt"] = LEFTBUTT
			PlayerData[Data].CurrentPartList["Organ"]["Right Butt"] = RIGHTBUTT

			-- Synchronize all custom limbs, torso, butt with avatar skin tone:
			local liveBc = (OldCharacter and OldCharacter:FindFirstChildOfClass("BodyColors"))
				or (DataDetail.OriginalAvatarState and DataDetail.OriginalAvatarState.BodyColors)
			local headCol = (OldCharacter and OldCharacter:FindFirstChild("Head") and OldCharacter.Head.Color) or (TORSO and TORSO.Color)
			local activeTorsoCol = (TORSO and TORSO.Color) or headCol
			local armCol = (liveBc and liveBc.LeftArmColor3) or headCol or activeTorsoCol
			local legCol = (liveBc and liveBc.LeftLegColor3) or headCol or activeTorsoCol

			if LEFTARM and LEFTARM:IsA("BasePart") then LEFTARM.Color = armCol end
			if RIGHTARM and RIGHTARM:IsA("BasePart") then RIGHTARM.Color = (liveBc and liveBc.RightArmColor3) or armCol end
			if LEFTLEG and LEFTLEG:IsA("BasePart") then LEFTLEG.Color = legCol end
			if RIGHTLEG and RIGHTLEG:IsA("BasePart") then RIGHTLEG.Color = (liveBc and liveBc.RightLegColor3) or legCol end
			if LEFTBUTT and LEFTBUTT:IsA("BasePart") then LEFTBUTT.Color = activeTorsoCol end
			if RIGHTBUTT and RIGHTBUTT:IsA("BasePart") then RIGHTBUTT.Color = activeTorsoCol end

			if DataDetail.BreastsType == 1 then
				LEFTBREAST = Function.Weld(PartListData["Left Breast"], Character, Extra, Data)
				RIGHTBREAST = Function.Weld(PartListData["Right Breast"], Character, Extra, Data)

				local LEFTNIPPLE = Function.Weld(PartListData["Left Nipple"], Character, Extra, Data)
				local RIGHTNIPPLE = Function.Weld(PartListData["Right Nipple"], Character, Extra, Data)

				PlayerData[Data].CurrentPartList["Organ"]["Left Nipple"] = LEFTNIPPLE
				PlayerData[Data].CurrentPartList["Organ"]["Right Nipple"] = RIGHTNIPPLE
			elseif DataDetail.BreastsType == 2 then
				LEFTBREAST = Function.Weld(PartListData["Left Breast Type 2"], Character, Extra, Data)
				RIGHTBREAST = Function.Weld(PartListData["Right Breast Type 2"], Character, Extra, Data)

				PhysicsRotationOffset = {
					X = "Y",
					Y = "X",
					Z = "Z",
				}
			elseif DataDetail.BreastsType == 3 then
				LEFTBREAST = Function.Weld(PartListData["Left Breast Type 3"], Character, Extra, Data)
				RIGHTBREAST = Function.Weld(PartListData["Right Breast Type 3"], Character, Extra, Data)

				local LEFTNIPPLE = Function.Weld(PartListData["Left Nipple Type 3"], Character, Extra, Data)
				local RIGHTNIPPLE = Function.Weld(PartListData["Right Nipple Type 3"], Character, Extra, Data)

				PlayerData[Data].CurrentPartList["Organ"]["Left Nipple"] = LEFTNIPPLE
				PlayerData[Data].CurrentPartList["Organ"]["Right Nipple"] = RIGHTNIPPLE
			elseif DataDetail.BreastsType == 4 then
				LEFTBREAST = Function.Weld(PartListData["Left Breast Type 4"], Character, Extra, Data)
				RIGHTBREAST = Function.Weld(PartListData["Right Breast Type 4"], Character, Extra, Data)

				local LEFTAREOLA = Function.Weld(PartListData["Left Areola Type 4"], Character, Extra, Data)
				local RIGHTAREOLA = Function.Weld(PartListData["Right Areola Type 4"], Character, Extra, Data)
				local LEFTNIPPLE = Function.Weld(PartListData["Left Nipple Type 4"], Character, Extra, Data)
				local RIGHTNIPPLE = Function.Weld(PartListData["Right Nipple Type 4"], Character, Extra, Data)
				PlayerData[Data].CurrentPartList.TransparencyLink[LEFTAREOLA] = {T=LEFTNIPPLE}
				PlayerData[Data].CurrentPartList.TransparencyLink[RIGHTAREOLA] = {T=RIGHTNIPPLE}

				PlayerData[Data].CurrentPartList["Organ"]["Left Areola"] = LEFTAREOLA
				PlayerData[Data].CurrentPartList["Organ"]["Right Areola"] = RIGHTAREOLA
				PlayerData[Data].CurrentPartList["Organ"]["Left Nipple"] = LEFTNIPPLE
				PlayerData[Data].CurrentPartList["Organ"]["Right Nipple"] = RIGHTNIPPLE
			elseif DataDetail.BreastsType == 5 then
				LEFTBREAST = Function.Weld(PartListData["Left Breast Type 5"], Character, Extra, Data)
				RIGHTBREAST = Function.Weld(PartListData["Right Breast Type 5"], Character, Extra, Data)

				local LEFTNIPPLE = Function.Weld(PartListData["Left Nipple Type 5"], Character, Extra, Data)
				local RIGHTNIPPLE = Function.Weld(PartListData["Right Nipple Type 5"], Character, Extra, Data)

				PlayerData[Data].CurrentPartList["Organ"]["Left Nipple"] = LEFTNIPPLE
				PlayerData[Data].CurrentPartList["Organ"]["Right Nipple"] = RIGHTNIPPLE

				PhysicsRotationOffset = {
					X = "Y",
					Y = "X",
					Z = "Z",
				}
				Rotation = {
					X = 5,
					Y = 5,
					Z = 5
				}
			end

			PlayerData[Data].CurrentPartList["Organ"]["Left Breast"] = LEFTBREAST
			PlayerData[Data].CurrentPartList["Organ"]["Right Breast"] = RIGHTBREAST

			if DataDetail.BodyPartPhysics then
				local Torso = Character:FindFirstChild("Torso")

				if Torso then
					Function.SpringCreate(
						RIGHTBUTT, 
						Torso, 
						Vector3.new(0,0,0), 
						Vector3.new(0,0,0), 
						10, 
						0.1,
						{
							X = "X",
							Y = "Y",
							Z = "Z",
						},
						{
							X = 1/20,
							Y = 1/40,
							Z = 1/20
						},
						{
							X = "Y",
							Y = "X",
							Z = "Z",
						},
						{
							X = 3,
							Y = 2,
							Z = 2
						},
						Data
					)
					Function.SpringCreate(
						LEFTBUTT, 
						Torso, 
						Vector3.new(0,0,0), 
						Vector3.new(0,0,0), 
						10, 
						0.1, 
						{
							X = "X",
							Y = "Y",
							Z = "Z",
						},
						{
							X = 1/20,
							Y = 1/40,
							Z = 1/20
						},
						{
							X = "Y",
							Y = "X",
							Z = "Z",
						},
						{
							X = 3,
							Y = 2,
							Z = 2
						},
						Data
					)
					-- just so i remember, the default breastphyiscs speed&damper were 10, 0.20
					-- default rotation were 5, -5, 5
					Function.SpringCreate(
						RIGHTBREAST, 
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
						{
							X = 0,
							Y = 0,
							Z = 0
						},
						PhysicsRotationOffset,
						Rotation,
						Data
					)
					Function.SpringCreate(
						LEFTBREAST, 
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
						{
							X = 0,
							Y = 0,
							Z = 0
						},
						PhysicsRotationOffset,
						Rotation,
						Data
					)
				end
			end

			if DataDetail.MeshBasePartInvisible then
				TORSO.Transparency = 1
				LEFTLEG.Transparency = 1
				RIGHTLEG.Transparency = 1
				LEFTARM.Transparency = 1
				RIGHTARM.Transparency = 1
				DataDetail.CurrentPartList.ParentTransparency[TORSO] = {D = 0, T = 1}
				DataDetail.CurrentPartList.ParentTransparency[LEFTLEG] = {D = 0, T = 1}
				DataDetail.CurrentPartList.ParentTransparency[RIGHTLEG] = {D = 0, T = 1}
				DataDetail.CurrentPartList.ParentTransparency[LEFTARM] = {D = 0, T = 1}
				DataDetail.CurrentPartList.ParentTransparency[RIGHTARM] = {D = 0, T = 1}
			end

			for _, SelectClothes in pairs(DataDetail.CurrentClothes) do
				if SelectClothes ~= "nil" then

					local function weldClothes(w)
						for i, v in pairs(w) do

							local ClothesPart = Function.Weld(PartListData[v], Character, Extra, Data)
							if ClothesPart then
								DataDetail.CurrentPartList["Clothes"][v] = ClothesPart
								if DataDetail.ClothesRecolor[SelectClothes] and PartListData[v].Recolor then
									local function toCol3(c)
										if typeof(c) == "Color3" then
											return c
										elseif typeof(c) == "table" and c.R and c.G and c.B then
											return Color3.new(c.R, c.G, c.B)
										end
										return nil
									end
									local pCol = toCol3(DataDetail.ClothesRecolor[SelectClothes].Primary)
									local sCol = toCol3(DataDetail.ClothesRecolor[SelectClothes].Secondary)
									local tCol = toCol3(DataDetail.ClothesRecolor[SelectClothes].Tertiary)

									if pCol and PartListData[v].Recolor == "Primary" then
										ClothesPart.Color = pCol
									elseif sCol and PartListData[v].Recolor == "Secondary" then
										ClothesPart.Color = sCol
									elseif tCol and PartListData[v].Recolor == "Tertiary" then
										ClothesPart.Color = tCol
									end
								end
							else
								warn("what the bloody hell just happened".. v)
							end
						end
					end

					if Clothes[SelectClothes]["Weld"] then
						if Clothes[SelectClothes].Alternative and Clothes[SelectClothes].Alternative.Condition then
							local a = Function[Clothes[SelectClothes].Alternative.Condition](Data)
							if a and a == true then
								weldClothes(Clothes[SelectClothes].Alternative["Weld"])
							else
								weldClothes(Clothes[SelectClothes]["Weld"])
							end
						else
							local metCondition = false
							if Clothes[SelectClothes].Alternative then
								for i, alts in pairs(Clothes[SelectClothes].Alternative) do
									if metCondition == false then
										local a = Function[alts.Condition](Data)
										if a and a == true then
											metCondition = true
											weldClothes(alts["Weld"])
										end
									end
								end
							end
							if metCondition == false then
								weldClothes(Clothes[SelectClothes]["Weld"])
							end
						end
					end

					if Clothes[SelectClothes]["Unvisible"] ~= nil then
						for i, v in pairs(Clothes[SelectClothes]["Unvisible"]) do
							local UnvisiblePart = DataDetail.CurrentPartList["Organ"][v]

							if UnvisiblePart then
								UnvisiblePart.Transparency = 1
							elseif string.find(string.lower(v),"areola") then
								for areola, parent in pairs(DataDetail.CurrentPartList["AreolaDecal"]) do
									if parent and 
										(string.find(string.lower(v),"left") and string.find(string.lower(parent.Name),"left")) or
										(string.find(string.lower(v),"right") and string.find(string.lower(parent.Name),"right")) then
										areola.Transparency = 1
									end
								end
							end
						end
					end
				end
			end

			local function transparent(o,v)
				if v >= 1 and o.Material == Enum.Material.Glass then
					o:AddTag("RCGlassMat")
					o.Material = Enum.Material.Neon
				elseif v < 1 and o.Material == Enum.Material.Neon and o:HasTag("RCGlassMat") then
					o:RemoveTag("RCGlassMat")
					o.Material = Enum.Material.Glass
				end
				o:SetAttribute("maxTransparencyRC",v)
				o.Transparency = v
			end
			if DataDetail.TopHP ~= "" then
				for c, set in pairs(DataDetail.ClothesHP) do
					if not table.find(DataDetail.CurrentClothes,c) then
						continue
					end
					local w = Clothes[c].Weld
					if Clothes[c].Alternative and Clothes[c].Alternative.Condition then
						local a = Function[Clothes[c].Alternative.Condition](Data)
						if a and a == true then
							w = Clothes[c].Alternative.Weld
						end
					elseif Clothes[c].Alternative then
						local metCondition = false
						for i, alts in pairs(Clothes[c].Alternative) do
							if metCondition == false then
								local a = Function[alts.Condition](Data)
								if a and a == true then
									metCondition = true
									w = alts["Weld"]
								end
							end
						end
					end
					if set["HP"] == "TopHP" then
						if set["Inverse"] == true then
							for i, v in pairs(w) do
								if DataDetail.CurrentPartList["Clothes"][v] then
									transparent(DataDetail.CurrentPartList["Clothes"][v],1)
								end
							end
							if Clothes[c].Unvisible then
								for i, v in pairs(Clothes[c].Unvisible) do
									if DataDetail.CurrentPartList["Organ"][v] then
										local t = DataDetail.CurrentPartList["Organ"][v]:GetAttribute("Alpha") or 0
										transparent(DataDetail.CurrentPartList["Organ"][v],t)
									end
								end
							end
							if Clothes[c].HPFunction then
								if typeof(Clothes[c].HPFunction) == "string" then
									Function[Clothes[c].HPFunction](false,Character,Data,c)
								elseif typeof(Clothes[c].HPFunction) == "table" then
									for i, v in pairs(Clothes[c].HPFunction) do
										Function[v](false,Character,Data,c)
									end
								end
							end
						else
							for i, v in pairs(w) do
								if DataDetail.CurrentPartList["Clothes"][v] then
									local t = DataDetail.CurrentPartList["Clothes"][v]:GetAttribute("Alpha") or 0
									transparent(DataDetail.CurrentPartList["Clothes"][v],t)
								end
							end
							if Clothes[c].Unvisible then
								for i, v in pairs(Clothes[c].Unvisible) do
									if DataDetail.CurrentPartList["Organ"][v] then
										transparent(DataDetail.CurrentPartList["Organ"][v],1)
									end
								end
							end
							if Clothes[c].HPFunction then
								if typeof(Clothes[c].HPFunction) == "string" then
									Function[Clothes[c].HPFunction](true,Character,Data,c)
								elseif typeof(Clothes[c].HPFunction) == "table" then
									for i, v in pairs(Clothes[c].HPFunction) do
										Function[v](true,Character,Data,c)
									end
								end
							end
						end
					end
				end
			end
			if DataDetail.BottomHP ~= "" then
				for c, set in pairs(DataDetail.ClothesHP) do
					if not table.find(DataDetail.CurrentClothes,c) then
						continue
					end
					local w = Clothes[c].Weld
					if Clothes[c].Alternative and Clothes[c].Alternative.Condition then
						local a = Function[Clothes[c].Alternative.Condition](Data)
						if a and a == true then
							w = Clothes[c].Alternative.Weld
						end
					elseif Clothes[c].Alternative then
						local metCondition = false
						for i, alts in pairs(Clothes[c].Alternative) do
							if metCondition == false then
								local a = Function[alts.Condition](Data)
								if a and a == true then
									metCondition = true
									w = alts["Weld"]
								end
							end
						end
					end
					if set["HP"] == "BottomHP" then
						if set["Inverse"] == true then
							for i, v in pairs(w) do
								if DataDetail.CurrentPartList["Clothes"][v] then
									transparent(DataDetail.CurrentPartList["Clothes"][v],1)
								end
							end
							if Clothes[c].Unvisible then
								for i, v in pairs(Clothes[c].Unvisible) do
									if DataDetail.CurrentPartList["Organ"][v] then
										local t = DataDetail.CurrentPartList["Organ"][v]:GetAttribute("Alpha") or 0
										transparent(DataDetail.CurrentPartList["Organ"][v],t)
									end
								end
							end
							if Clothes[c].HPFunction then
								if typeof(Clothes[c].HPFunction) == "string" then
									Function[Clothes[c].HPFunction](false,Character,Data,c)
								elseif typeof(Clothes[c].HPFunction) == "table" then
									for i, v in pairs(Clothes[c].HPFunction) do
										Function[v](false,Character,Data,c)
									end
								end
							end
						else
							for i, v in pairs(w) do
								if DataDetail.CurrentPartList["Clothes"][v] then
									local t = DataDetail.CurrentPartList["Clothes"][v]:GetAttribute("Alpha") or 0
									transparent(DataDetail.CurrentPartList["Clothes"][v],t)
								end
							end
							if Clothes[c].Unvisible then
								for i, v in pairs(Clothes[c].Unvisible) do
									if DataDetail.CurrentPartList["Organ"][v] then
										transparent(DataDetail.CurrentPartList["Organ"][v],1)
									end
								end
							end
							if Clothes[c].HPFunction then
								if typeof(Clothes[c].HPFunction) == "string" then
									Function[Clothes[c].HPFunction](true,Character,Data,c)
								elseif typeof(Clothes[c].HPFunction) == "table" then
									for i, v in pairs(Clothes[c].HPFunction) do
										Function[v](true,Character,Data,c)
									end
								end
							end
						end
					end
				end
			end

			if FaceDecal and DataDetail.Face == false then
				--FaceDecal.Transparency = 1
				DataDetail.CurrentPartList.ParentTransparency[FaceDecal] = {D = 0, T = 1}
			end
			task.wait()
			DataDetail["Cooldown"] = false
		end
	end

	function Function.CharacterConnection(Player)
		local CharacterConnect = Player.CharacterAdded:Connect(function(Character)
			if PlayerData[Player.Name] ~= nil then
				repeat task.wait(0.5) until Character.Parent ~= nil
				task.wait(0.1)
				Function.CapturePlayerOwnAvatar(Player.Name)

				if PlayerData[Player.Name].AutoExecute then
					task.wait(PlayerData[Player.Name].DelayTime)
					Function.CharacterExecute(Character, Player.Name)
				end
			end
		end)

		table.insert(AllConnect, CharacterConnect)
	end

	function Function.StringTo(String, Type)
		local Split = string.split(String, ",")

		if Type == "CFrame" then
			return CFrame.new(Split[1],Split[2],Split[3],Split[4],Split[5],Split[6],Split[7],Split[8],Split[9],Split[10],Split[11],Split[12])
		elseif Type == "RGB" then
			return Color3.fromRGB(Split[1],Split[2],Split[3])
		elseif Type == "Vector3" then
			return Vector3.new(Split[1],Split[2],Split[3])
		end
	end

	function Function.MeshEditButton(Name)
		for _, v in pairs(GUIObject.PropertyListFrame:GetChildren()) do
			if v:IsA(("Frame")) then
				v:Destroy()
			end
		end
		Debug = false

		for _, v in pairs(MeshEditConnect) do
			v:Disconnect()
		end

		MeshEditConnect = {}

		local PlayerPartList = PlayerData[SelectPlayer]["PartList"]
		local MeshDetail = PlayerPartList[Name]

		if MeshDetail then
			setmetatable(MeshDetail, MetaClothes)

			if MeshDetail then
				if MeshDetail["Scale"] == "CockScale" then
					local Button = Function.ButtonCreate("CockScale", GUIObject.PropertyListFrame, true, {Color = Color3.fromRGB(93, 93, 93), Text = "CockScale"})
					local Textbox = Button:FindFirstChildOfClass("TextBox")
					Textbox.Text = PlayerData[SelectPlayer].CockScale

					local TextboxConnect = Textbox.FocusLost:Connect(function()
						PlayerData[SelectPlayer].CockScale = tonumber(Textbox.Text)
					end)

					table.insert(MeshEditConnect, TextboxConnect)
					table.insert(AllConnect, TextboxConnect)
				end
				for _, PropertyName in pairs(EditableProperty) do
					local Value = MeshDetail[PropertyName]
					if Value == nil then Value = "" end
					local Button = Function.ButtonCreate(PropertyName, GUIObject.PropertyListFrame, true, {Color = Color3.fromRGB(93, 93, 93), Text = PropertyName})
					local Textbox = Button:FindFirstChildOfClass("TextBox")

					if PropertyName == "Color" then
						local Split = string.split(tostring(Value.Color), ",")

						if tonumber(Split[1]) and tonumber(Split[2]) and tonumber(Split[3]) then
							Textbox.Text = math.round(Split[1]*255)..","..math.round(Split[2]*255)..","..math.round(Split[3]*255)
							Textbox.TextColor3 = Value.Color
							Textbox.TextStrokeTransparency = 0
							Textbox.TextStrokeColor3 = Color3.new(1,1,1)
						else
							Textbox.Text = ""
						end
					else
						Textbox.Text = tostring(Value)
					end

					local TextboxConnect = Textbox.FocusLost:Connect(function()
						if PropertyName == "Size" then
							PlayerData[SelectPlayer]["PartList"][Name][PropertyName] = Function.StringTo(Textbox.Text, "Vector3")
						elseif PropertyName == "Offset" then
							PlayerData[SelectPlayer]["PartList"][Name][PropertyName] = Function.StringTo(Textbox.Text, "Vector3")
						elseif PropertyName == "Rotation" then
							PlayerData[SelectPlayer]["PartList"][Name][PropertyName] = Function.StringTo(Textbox.Text, "Vector3")
						elseif PropertyName == "TextureId" then
							PlayerData[SelectPlayer]["PartList"][Name][PropertyName] = Textbox.Text
						elseif PropertyName == "Color" then
							local RGB = Function.StringTo(Textbox.Text, "RGB")

							PlayerData[SelectPlayer]["PartList"][Name][PropertyName].Color = RGB
							Textbox.TextColor3 = RGB
						else
							PlayerData[SelectPlayer]["PartList"][Name][PropertyName] = tonumber(Textbox.Text)
						end
					end)

					table.insert(MeshEditConnect, TextboxConnect)
					table.insert(AllConnect, TextboxConnect)
				end
			end
		elseif Name == "DEBUG" then
			Debug = true
		end
	end




	function Function.DragUpdate()
		if GUIObject.hardcoreGroup.Visible == true and GUIObject.hardcoreGroup.GroupTransparency < 1 then
			local pos = UIS:GetMouseLocation()

			GUIObject.hardcoreGroup.Position = UDim2.fromOffset(pos.X,pos.Y)
		end
		--[[
		if IsEnterFrame == true and IsMouseDown == true and MouseDownStart and GuiPositionStart then
			local CurrentPosition = UIS:GetMouseLocation() - MouseDownStart
			local ToChangePosition = UDim2.new(GuiPositionStart.X.Scale, GuiPositionStart.X.Offset + CurrentPosition.X, GuiPositionStart.Y.Scale, GuiPositionStart.Y.Offset + CurrentPosition.Y)

			GUIObject.MainFrame.Position = GUIObject.MainFrame.Position:Lerp(ToChangePosition, 0.5)
		end
		]]
	end

	function Function.IsCharacter(Model)
		return Model:FindFirstChild("Torso") or Model:FindFirstChild("Head") or Model:FindFirstChild("Right Arm") or Model:FindFirstChild("Left Arm") or Model:FindFirstChild("Right Leg") or Model:FindFirstChild("Left Leg")
	end

	function Function.GUIUpdate()
		for i, v in pairs(GUIObject.ClothesButtonFrame:GetChildren()) do
			if v:IsA("Frame") then
				if table.find(PlayerData[SelectPlayer].CurrentClothes, v.Name) then
					v.BackgroundColor3 = Color3.fromRGB(255, 242, 67)
				else
					v.BackgroundColor3 = Color3.fromRGB(6, 0, 76)
				end 

				if GUIObject.ClothesSearch.Text ~= "" then
					v.Visible = string.find(string.lower(v.Name),string.lower(GUIObject.ClothesSearch.Text))
				else
					v.Visible = true
				end
			end
		end
		for i, v in pairs(GUIObject.BundlesButtonFrame:GetChildren()) do
			if v:IsA("Frame") then
				if v.Name == PlayerData[SelectPlayer].CurrentBundle then
					v.BackgroundColor3 = Color3.fromRGB(255, 242, 67)
					if v.Name == "nil" then
						v:FindFirstChildOfClass("TextButton").Text = "CLEAR?"
					end
				elseif v.BackgroundColor3 == Color3.fromRGB(255, 242, 67) then
					v.BackgroundColor3 = Color3.fromRGB(6, 0, 76)
					if v.Name == "nil" then
						v:FindFirstChildOfClass("TextButton").Text = "nil"
					end
				end 

				if GUIObject.BundleSearch.Text ~= "" then
					v.Visible = string.find(string.lower(v.Name),string.lower(GUIObject.BundleSearch.Text))
				else
					v.Visible = true
				end
			end
		end

		if PlayerData[SelectPlayer].AutoExecute then
			GUIObject.AutoExecuteButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.AutoExecuteButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].BundleBodyColor then
			GUIObject.BundleBodyColorButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.BundleBodyColorButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].Face then
			GUIObject.FaceButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.FaceButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].MeshSizeLock then
			GUIObject.MeshSizeLockButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.MeshSizeLockButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].AccessorySizeLock then
			GUIObject.AccessorySizeLockButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.AccessorySizeLockButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].MeshBasePartInvisible then
			GUIObject.MeshBasePartInvisibleButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.MeshBasePartInvisibleButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].BodyPartPhysics then
			GUIObject.BodyPartPhysicsButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.BodyPartPhysicsButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		for BodyP, Bool in pairs(PlayerData[SelectPlayer].LocalTransparency) do
			local Button = GUIObject.CharacterFrame:FindFirstChild(BodyP)

			if Button then
				if BodyP == "Hat" then
					if Bool == true then
						Button.ImageTransparency = 0
					else
						Button.ImageTransparency = 0.5
					end
				else
					if Bool == true then
						Button.BackgroundTransparency = 0
					else
						Button.BackgroundTransparency = 0.5
					end
				end
			end
		end

		if ClickExecute then
			GUIObject.ClickExecuteButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.ClickExecuteButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].FPerson then
			GUIObject.FPExecute.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.FPExecute.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].PhysicsObeyGravity then
			GUIObject.GravityButton.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.GravityButton.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].TearParticles then
			GUIObject.TPToggle.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.TPToggle.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].HealParticles then
			GUIObject.PHToggle.TextStrokeColor3 = Color3.new(0,255,0)
		else
			GUIObject.PHToggle.TextStrokeColor3 = Color3.new(255,0,0)
		end

		if PlayerData[SelectPlayer].SkinTone then
			GUIObject.SkinToneText.Text = math.round(PlayerData[SelectPlayer].SkinTone.R*255) ..", "..math.round(PlayerData[SelectPlayer].SkinTone.G*255) ..", "..math.round(PlayerData[SelectPlayer].SkinTone.B*255)
			GUIObject.SkinToneText.TextColor3 = PlayerData[SelectPlayer].SkinTone
		end

		if PlayerData[SelectPlayer].NippleColor then
			GUIObject.NippleColorText.Text = math.round(PlayerData[SelectPlayer].NippleColor.R*255) ..", "..math.round(PlayerData[SelectPlayer].NippleColor.G*255) ..", "..math.round(PlayerData[SelectPlayer].NippleColor.B*255)
			GUIObject.NippleColorText.TextColor3 = PlayerData[SelectPlayer].NippleColor
		end

		if PlayerData[SelectPlayer].RealtimeBodyTransparency then
			GUIObject.BodyTransparencyButton.TextStrokeColor3 = Color3.new(0,1,0)
		else
			GUIObject.BodyTransparencyButton.TextStrokeColor3 = Color3.new(1,0,0)
		end

		if PlayerData[SelectPlayer].HardcoreHP then
			GUIObject.HardcoreToggle.TextStrokeColor3 = Color3.new(0,1,0)

			if not UIS.KeyboardEnabled then
				GUIObject.ImageHeal.Visible = true
				GUIObject.ImageTear.Visible = true
			end
		else
			GUIObject.HardcoreToggle.TextStrokeColor3 = Color3.new(1,0,0)

			if not UIS.KeyboardEnabled then
				GUIObject.ImageHeal.Visible = false
				GUIObject.ImageTear.Visible = false
			end
		end

		if PlayerData[SelectPlayer].tailSettings.tailPhysicsEnabled then
			GUIObject.tailToggleButton.TextStrokeColor3 = Color3.new(0,1,0)
		else
			GUIObject.tailToggleButton.TextStrokeColor3 = Color3.new(1,0,0)
		end

		if loadupClosed then
			GUIObject.closeOptionButton.TextStrokeColor3 = Color3.new(0,1,0)
		else
			GUIObject.closeOptionButton.TextStrokeColor3 = Color3.new(1,0,0)
		end

		if loadupExecute then
			GUIObject.executeOptionButton.TextStrokeColor3 = Color3.new(0,1,0)
		else
			GUIObject.executeOptionButton.TextStrokeColor3 = Color3.new(1,0,0)
		end

		if saveClothesOption == "Boob Naked" then
			GUIObject.saveClothesOptionButton.Text = "Outfit Clothes: Boob Naked"
			GUIObject.saveClothesOptionButton.TextStrokeColor3 = Color3.fromRGB(0, 200, 255)
		elseif saveClothesOption == "Clothed" then
			GUIObject.saveClothesOptionButton.Text = "Outfit Clothes: Clothed"
			GUIObject.saveClothesOptionButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
		else
			GUIObject.saveClothesOptionButton.Text = "Outfit Clothes: Naked"
			GUIObject.saveClothesOptionButton.TextStrokeColor3 = Color3.fromRGB(255, 60, 60)
		end

		if Bundle[loadupBundle] then
			GUIObject.bundleLoadButton.Text = "Loadup Bundle: ".. loadupBundle
		else
			GUIObject.bundleLoadButton.Text = "Loadup Bundle: nil"
		end

		if loadupFPerson == 0 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: false"
		elseif loadupFPerson == 1 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: Body & POV"
		elseif loadupFPerson == 2 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: Body"
		elseif loadupFPerson == 3 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: Snappy"
		elseif loadupFPerson == 4 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: Snappy Body"
		elseif loadupFPerson == 5 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: No Headtracking"
		elseif loadupFPerson == 6 then
			GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: No Headtracking Body"
		end

		GUIObject.DelayTimeText.Text = PlayerData[SelectPlayer].DelayTime
		GUIObject.PositionPhysicsMultiplyText.Text = PositionPhysicsMultiply
		GUIObject.RotationPhysicsMultiplyText.Text = RotationPhysicsMultiply
		GUIObject.MethodButton.Text = "Method: "..Method
		GUIObject.BundleText.Text = "Bundle: "..PlayerData[SelectPlayer].CurrentBundle
		GUIObject.ToneButton.Text = "Tone: "..PlayerData[SelectPlayer].Tone
		GUIObject.UsernameTextbox.Text = PlayerData[SelectPlayer].CatalogUsername
		GUIObject.ShirtTextbox.Text = PlayerData[SelectPlayer].CatalogClothes.Shirt
		GUIObject.PantsTextbox.Text = PlayerData[SelectPlayer].CatalogClothes.Pants
		GUIObject.ShirtGraphicTextbox.Text = PlayerData[SelectPlayer].CatalogClothes.ShirtGraphic
		GUIObject.BreastsScaleText.Text = PlayerData[SelectPlayer].BreastsScale
		GUIObject.ButtsScaleText.Text = PlayerData[SelectPlayer].ButtsScale
		GUIObject.LegsScaleText.Text = PlayerData[SelectPlayer].LegsScale
		GUIObject.BreastsTypeButton.Text = "Breasts Type: "..PlayerData[SelectPlayer].BreastsType
		GUIObject.TorsoTypeButton.Text = "Torso Type: "..PlayerData[SelectPlayer].TorsoType
		GUIObject.ArmTypeButton.Text = "Arm Type: "..PlayerData[SelectPlayer].ArmType
		GUIObject.LegsTypeButton.Text = "Legs Type: "..PlayerData[SelectPlayer].LegsType
		GUIObject.ButtTypeButton.Text = "Butt Type: "..PlayerData[SelectPlayer].ButtType
		GUIObject.OutfitIdTextbox.Text = PlayerData[SelectPlayer].CatalogOutfitId

		GUIObject.TopHPText.Text = PlayerData[SelectPlayer].TopHP
		GUIObject.BottomHPText.Text = PlayerData[SelectPlayer].BottomHP
		GUIObject.DamageSFX.Text = PlayerData[SelectPlayer].DamageSFX
		GUIObject.VolumeText.Text = PlayerData[SelectPlayer].Volume

		if KEYBIND and GUIObject and GUIObject.KeybindButton then
			GUIObject.KeybindButton.Text = (typeof(KEYBIND) == "EnumItem" and KEYBIND.Name) or tostring(KEYBIND):gsub("^Enum%.KeyCode%.", "")
		end

		Function.CatalogAccessoryFrameAdd(SelectPlayer)
		Function.MeshEditButton(GUIObject.MeshNameTextbox.Text)
	end

	function Function.FallenPartCheck(Object)
		if Object:IsA("BasePart") then
			return Object.Position.Y < game.Workspace.FallenPartsDestroyHeight
		end
	end

	function Function.IsParentNil(Object)
		if Object then
			local Target = Object

			while Target and Target.Parent ~= nil and Target ~= game do
				Target = Target.Parent
			end

			if Target ~= game then
				return true
			end
		end
		return false
	end

	function Function.GetMiddleNumber(Numbers)
		table.sort(Numbers, function(a,b)
			return a < b
		end)

		local Count = #Numbers

		if Count % 2 == 0 then
			local middleIndex1 = Count / 2
			local middleIndex2 = middleIndex1 + 1
			local middleNumber = (Numbers[middleIndex1] + Numbers[middleIndex2]) / 2

			return middleNumber
		else
			local middleIndex = math.ceil(Count / 2)
			local middleNumber = Numbers[middleIndex]

			return middleNumber
		end
	end




	local loadDataSuccess = pcall(function()
		if RS:IsClient() and not RS:IsStudio() then
			local function toJSON(t)
				for i, v in pairs(t) do
					if typeof(v) == "table" then
						toJSON(v)
					else
						t[i] = Function.convertToJSON(v)
					end
				end
			end
			local function fromJSON(t)
				for i, v in pairs(t) do
					local value,original = Function.convertFromJSON(v)
					t[i] = value
					if typeof(v) == "table" and original then
						fromJSON(v)
					end
				end
			end

			Function.LoadSettings()

			if env.makefolder and env.isfolder and env.readfile and env.writefile and env.listfiles and env.isfile then
				if not env.isfolder("RClothesLerp") then
					env.makefolder("RClothesLerp")
				end
				if not env.isfolder("RClothesLerp/Bundles") then
					env.makefolder("RClothesLerp/Bundles")
				end
				if env.isfile("RClothesLerp/BundleLoader.json") then
					local readOk, content = pcall(env.readfile, "RClothesLerp/BundleLoader.json")
					local decodeOk, decode = false, nil
					if readOk and content and content ~= "" then
						decodeOk, decode = pcall(function() return HS:JSONDecode(content) end)
					end
					if decodeOk and typeof(decode) == "table" then
						fromJSON(decode)

						local bundleAmount = 0
						for name, bundle in pairs(decode) do
							bundleAmount += 1
							bundle["BundleName"] = nil
							Bundle[name] = bundle
						end
					end
					task.spawn(function() -- compile overtime --
						local timeOut = 1000
						local amount = 0
						local filesFound = env.listfiles("RClothesLerp/Bundles")
						if #filesFound <= 0 then
							repeat
								task.wait()
								filesFound = env.listfiles("RClothesLerp/Bundles")
								timeOut -= 1
							until timeOut <= 0 or #filesFound > 0
						end
						local tab = {}
						for i, v in pairs(filesFound) do
							if env.isfile(v) then
								local okR, content = pcall(env.readfile, v)
								local okD, b = false, nil
								if okR and content and content ~= "" then
									okD, b = pcall(function() return HS:JSONDecode(content) end)
								end
								if okD and typeof(b) == "table" then
									local storedName = b.BundleName or v:match("([^/\\]+)%.json$")
									b["BundleName"] = nil

									fromJSON(b)

									Bundle[storedName] = b
									local asset = {}
									local function transferTable(n,isTable)
										local newTable = {}
										for i, v in pairs(n) do
											if isTable then
												if typeof(v) == "table" then
													newTable[i] = transferTable(v,true)
												else
													newTable[i] = v
												end
											else
												if typeof(v) == "table" then
													asset[i] = transferTable(v,true)
												else
													asset[i] = v
												end
											end
										end
										return newTable
									end
									transferTable(b)
									tab[storedName] = asset
								end
							end
						end

						if #filesFound > 0 then
							toJSON(tab)
							env.writefile("RClothesLerp/BundleLoader.json", HS:JSONEncode(tab))
						elseif env.isfile("RClothesLerp/BundleLoader.json") then
							warn("No bundles. Is this an error?")
							env.delfile("RClothesLerp/BundleLoader.json")
						end
					end)
				else
					local filesFound = env.listfiles("RClothesLerp/Bundles")
					local t = {}
					for i, v in pairs(filesFound) do
						if env.isfile(v) then
							local okR, content = pcall(env.readfile, v)
							local okD, b = false, nil
							if okR and content and content ~= "" then
								okD, b = pcall(function() return HS:JSONDecode(content) end)
							end
							if okD and typeof(b) == "table" then
								local storedName = b.BundleName or v:match("([^/\\]+)%.json$")
								b["BundleName"] = nil

								fromJSON(b)
								Bundle[storedName] = b

								local asset = {}
								local function transferTable(n,isTable)
									local newTable = {}
									for i, v in pairs(n) do
										if isTable then
											if typeof(v) == "table" then
												newTable[i] = transferTable(v,true)
											else
												newTable[i] = v
											end
										else
											if typeof(v) == "table" then
												asset[i] = transferTable(v,true)
											else
												asset[i] = v
											end
										end
									end
									return newTable
								end
								transferTable(b)
								t[storedName] = asset
							end
						end
					end

					local failed = false
					if #filesFound > 0 then
						toJSON(t)
						env.writefile("RClothesLerp/BundleLoader.json", HS:JSONEncode(t))
					else
						failed = true
						-- No custom saved bundles in RClothesLerp/Bundles yet; using defaults
					end
					task.spawn(function() -- compile overtime --
						local timeOut = 500
						local amount = 0
						local filesFound = env.listfiles("RClothesLerp/Bundles")
						if #filesFound <= 0 then
							repeat
								task.wait()
								filesFound = env.listfiles("RClothesLerp/Bundles")
								timeOut -= 1
							until timeOut <= 0 or #filesFound > 0
						end
						local t = {}
						for i, v in pairs(filesFound) do
							if env.isfile(v) then
								local okR, content = pcall(env.readfile, v)
								local okD, b = false, nil
								if okR and content and content ~= "" then
									okD, b = pcall(function() return HS:JSONDecode(content) end)
								end
								if okD and typeof(b) == "table" then
									local storedName = b.BundleName or v:match("([^/\\]+)%.json$")
									b["BundleName"] = nil

									fromJSON(b)
									Bundle[storedName] = b

									local asset = {}
									local function transferTable(n,isTable)
										local newTable = {}
										for i, v in pairs(n) do
											if isTable then
												if typeof(v) == "table" then
													newTable[i] = transferTable(v,true)
												else
													newTable[i] = v
												end
											else
												if typeof(v) == "table" then
													asset[i] = transferTable(v,true)
												else
													asset[i] = v
												end
											end
										end
										return newTable
									end
									transferTable(b)
									t[storedName] = asset
								end
							end
						end

						if #filesFound > 0 then
							toJSON(t)
							env.writefile("RClothesLerp/BundleLoader.json", HS:JSONEncode(t))
							if failed == true then
								warn("Failsafe has found files, script reload is required to load bundles!")
							end
						end
					end)
				end
			else
				warn("Executor is not compatible for saving data!")
			end
		elseif RS:IsStudio() then
			if script:FindFirstChild("loadupSettings") then
				local loadupSettings = require(script.loadupSettings)
				if loadupSettings.loadupBundle then
					loadupBundle = loadupSettings.loadupBundle
				end
				if loadupSettings.loadupExecute then
					loadupExecute = loadupSettings.loadupExecute
				end
				if loadupSettings.loadupClosed then
					loadupClosed = loadupSettings.loadupClosed
				end
				if loadupSettings.loadupFPerson then
					loadupFPerson = loadupSettings.loadupFPerson
				end
				if loadupSettings.KEYBIND then
					KEYBIND = Function.ResolveKeybind(loadupSettings.KEYBIND, KEYBIND)
				end
				if loadupSettings.hpKEYBIND then
					hpKEYBIND = Function.ResolveKeybind(loadupSettings.hpKEYBIND, hpKEYBIND)
				end
				if loadupSettings.dpKEYBIND then
					dpKEYBIND = Function.ResolveKeybind(loadupSettings.dpKEYBIND, dpKEYBIND)
				end
			end
			if script:FindFirstChild("myBundles") then
				local myBundles = require(script.myBundles)
				for i, v in pairs(myBundles) do
					Bundle[i] = v
				end
			end
		end
	end)
	if not loadDataSuccess then
		warn("Data saving failed compatibility! Executor might not be compatible for saving data!")
	end

	--[[
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	
                  ░█████╗░░█████╗░███╗░░██╗███╗░░██╗███████╗░█████╗░████████╗██╗░█████╗░███╗░░██╗
                  ██╔══██╗██╔══██╗████╗░██║████╗░██║██╔════╝██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║
                  ██║░░╚═╝██║░░██║██╔██╗██║██╔██╗██║█████╗░░██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║
                  ██║░░██╗██║░░██║██║╚████║██║╚████║██╔══╝░░██║░░██╗░░░██║░░░██║██║░░██║██║╚████║
                  ╚█████╔╝╚█████╔╝██║░╚███║██║░╚███║███████╗╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║
                  ░╚════╝░░╚════╝░╚═╝░░╚══╝╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝
                                  
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	--------------------------------------------------------------------------------------------------------------
	]]
