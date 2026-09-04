	
	function Function.compileOvertime()
		task.spawn(function()
			if not (env.listfiles and env.readfile and env.writefile) then return end
			local ok, filesFound = pcall(env.listfiles, "RClothesLerp/Bundles")
			if not ok or type(filesFound) ~= "table" then return end
			local t = {}
			for i, v in pairs(filesFound) do
				if env.isfile and env.isfile(v) then
					local readOk, content = pcall(env.readfile, v)
					if readOk and content and content ~= "" then
						local decodeOk, b = pcall(function() return HS:JSONDecode(content) end)
						if decodeOk and typeof(b) == "table" then
							local storedName = b.BundleName or v:match("([^/\\]+)%.json$")
							b["BundleName"] = nil

							local function fromJSON(tbl)
								for ki, vi in pairs(tbl) do
									local value, original = Function.convertFromJSON(vi)
									tbl[ki] = value
									if typeof(vi) == "table" and original then
										fromJSON(vi)
									end
								end
							end
							fromJSON(b)

							t[storedName] = b
						end
					end
				end
			end
			local function toJSON(tbl)
				for ki, vi in pairs(tbl) do
					if typeof(vi) == "table" then
						toJSON(vi)
					else
						tbl[ki] = Function.convertToJSON(vi)
					end
				end
			end
			toJSON(t)
			if #filesFound > 0 then
				pcall(env.writefile, "RClothesLerp/BundleLoader.json", HS:JSONEncode(t))
			elseif env.delfile then
				pcall(env.delfile, "RClothesLerp/BundleLoader.json")
			end
		end)
	end
	

	local HPButtons = {}
	function Function.GUIFunc()
		for _, Button in pairs(GUIObject.ButtonFrame:GetChildren()) do
			if Button:FindFirstChildOfClass("TextButton") then
				Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
					for _, Page in pairs(GUIObject.PageFrame:GetChildren()) do
						if Page:IsA("Frame") or Page:IsA("ScrollingFrame") then
							Page.Visible = false
						end
					end

					local Page = GUIObject.PageFrame:WaitForChild(Button.Name)
					Page.Visible = true
					if Page.Name == "HP" then
						for i, v in pairs(GUIObject.HPListFrame:GetChildren()) do
							if not v:IsA("UIGridLayout") then
								v:Destroy()
							end
						end
						for i, v in pairs(HPButtons) do
							v:Disconnect()
							table.remove(AllConnect,table.find(AllConnect, v))
						end
						HPButtons = {}

						for i, v in pairs(PlayerData[SelectPlayer].CurrentClothes) do
							local button = Function.ButtonCreate(v, GUIObject.HPListFrame, false, {Color = Color3.new(1,1,1), Text = v.. ": nil"})
							button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()
							local b = button:FindFirstChildOfClass("TextButton")

							local switch = PlayerData[SelectPlayer].ClothesHP[v] or 0
							if switch ~= 0 then
								if PlayerData[SelectPlayer].ClothesHP[v].HP == "TopHP" then
									if PlayerData[SelectPlayer].ClothesHP[v].Inverse == true then
										switch = 3
										b.Text = v.. ": InverseTop"
									else
										switch = 1
										b.Text = v.. ": TopHP"
									end
								elseif PlayerData[SelectPlayer].ClothesHP[v].HP == "BottomHP" then
									if PlayerData[SelectPlayer].ClothesHP[v].Inverse == true then
										switch = 4
										b.Text = v.. ": InverseBottom"
									else
										switch = 2
										b.Text = v.. ": BottomHP"
									end
								end
							else
								if switch == 0 then
									b.Text = v.. ": nil"
								else
									b.Text = v.. ": "..switch
									switch = 0
								end
							--[[else
								if Clothes[v] then
									switch = Clothes[v].HP
									if Clothes[v].HP == 1 then
										b.Text = v.. ": TopHP"
										PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="TopHP",["Inverse"]=false}
									elseif Clothes[v].HP == 2 then
										b.Text = v.. ": BottomHP"
										PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="BottomHP",["Inverse"]=false}
									elseif Clothes[v].HP == 3 then
										b.Text = v.. ": InverseTop"
										PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="TopHP",["Inverse"]=true}
									elseif Clothes[v].HP == 4 then
										b.Text = v.. ": InverseBottom"
										PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="BottomHP",["Inverse"]=true}
									elseif not Clothes[v].HP or Clothes[v].HP == 0 then
										b.Text = v.. ": nil"
										PlayerData[SelectPlayer].ClothesHP[v] = nil
									else
										b.Text = v.. ": ".. Clothes[v].HP
										PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]=Clothes[v].HP,["Inverse"]=false}
									end
								end]]
							end
							local changeConnect = button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
								switch += 1 
								if switch > 4 then
									switch = 0
								elseif switch < 0 then
									switch = 4
								end

								if switch == 1 then
									b.Text = v.. ": TopHP"
									PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="TopHP",["Inverse"]=false}
								elseif switch == 2 then
									b.Text = v.. ": BottomHP"
									PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="BottomHP",["Inverse"]=false}
								elseif switch == 3 then
									b.Text = v.. ": InverseTop"
									PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="TopHP",["Inverse"]=true}
								elseif switch == 4 then
									b.Text = v.. ": InverseBottom"
									PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="BottomHP",["Inverse"]=true}
								else
									b.Text = v.. ": nil"
									PlayerData[SelectPlayer].ClothesHP[v] = nil
								end
							end)
							table.insert(HPButtons,changeConnect)
							table.insert(AllConnect,changeConnect)
						end
					end
				end)
			end
		end
		GUIObject.TailButton.MouseButton1Click:Connect(function()
			for _, Page in pairs(GUIObject.PageFrame:GetChildren()) do
				if Page:IsA("Frame") or Page:IsA("ScrollingFrame") then
					Page.Visible = false
				end
			end

			local Page = GUIObject.PageFrame:WaitForChild(GUIObject.TailButton.Name)
			Page.Visible = true
		end)
		GUIObject.optionsButton.MouseButton1Click:Connect(function()
			for _, Page in pairs(GUIObject.PageFrame:GetChildren()) do
				if Page:IsA("Frame") or Page:IsA("ScrollingFrame") then
					Page.Visible = false
				end
			end

			local Page = GUIObject.PageFrame:WaitForChild(GUIObject.optionsButton.Name)
			Page.Visible = true
		end)
		local debounce = false
		local ExecuteConnect = GUIObject.ExecuteButton.MouseButton1Click:Connect(function()
			if debounce == false then
				debounce = true
				local ExecutePlayer = PS:FindFirstChild(SelectPlayer)

				if ExecutePlayer then
					local ExecuteCharacter = ExecutePlayer.Character

					if ExecuteCharacter then
						local pData = PlayerData[SelectPlayer]
						-- If user was wearing clothes on their avatar and has no 3D clothes selected, preserve their clothes:
						if pData and #pData.CurrentClothes == 0 and (not pData.CurrentBundle or pData.CurrentBundle == "nil") then
							local hasShirt = ExecuteCharacter:FindFirstChildOfClass("Shirt") and ExecuteCharacter:FindFirstChildOfClass("Shirt").ShirtTemplate ~= ""
							local hasPants = ExecuteCharacter:FindFirstChildOfClass("Pants") and ExecuteCharacter:FindFirstChildOfClass("Pants").PantsTemplate ~= ""
							if hasShirt or hasPants then
								table.insert(pData.CurrentClothes, "Roblox Shirt")
								table.insert(pData.CurrentClothes, "Roblox Butt Shirt")
								table.insert(pData.CurrentClothes, "Roblox Pants")
							end
						end

						Function.CharacterReset(ExecutePlayer.Name)
						Function.CharacterExecute(ExecuteCharacter, ExecutePlayer.Name)
					end
				end
				debounce = false
			end
		end)

		local ResetConnect = GUIObject.ResetButton.MouseButton1Click:Connect(function()
			local pData = PlayerData[SelectPlayer]
			if pData then
				pData.CurrentClothes = {
					"Roblox Shirt",
					"Roblox Butt Shirt",
					"Roblox Pants",
					"Nipple Piercing 20",
					"Womb Mark Animalistic",
				}
				pData.CurrentBundle = "Default"
				pData.SkinTone = nil
				pData.BundleBodyColor = true
				pData.CatalogClothes = { Shirt = "", Pants = "", ShirtGraphic = "" }
				pData.CatalogAccessory = {}
				pData.CatalogTail = {}
				pData.PartList = Function.PartListDefault()
				pData.ClothesRecolor = {
					["Womb Mark Animalistic"] = {
						["Primary"] = "nil",
					},
				}
				pData.HPClothes = {
					Shirt = "",
					Pants = "",
				}
				pData.ClothesHP = {
					["Roblox Butt Shirt"] = {
						["HP"] = "TopHP",
						["Inverse"] = false,
					},
					["Roblox Pants"] = {
						["HP"] = "BottomHP",
						["Inverse"] = false,
					},
					["Roblox Shirt"] = {
						["HP"] = "TopHP",
						["Inverse"] = false,
					},
				}
			end
			Function.CapturePlayerOwnAvatar(SelectPlayer)
			Function.CharacterReset(SelectPlayer)
			if Method2CharacterFolder:FindFirstChild(SelectPlayer) then
				Method2CharacterFolder[SelectPlayer]:Destroy()
			end
			Function.GUIUpdate()
		end)

		local DestroyConnect = GUIObject.DestroyButton.MouseButton1Click:Connect(function()
			local BreakerInstance = Instance.new("BoolValue", workspace)
			BreakerInstance.Name = "RoClothesBreaker"
			game:GetService("Debris"):AddItem(BreakerInstance,2)
		end)

		local DelayTimeConnect = GUIObject.DelayTimeText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.DelayTimeText.Text) then
				PlayerData[SelectPlayer].DelayTime = tonumber(GUIObject.DelayTimeText.Text)
			end
		end)

		local PlayerChangeConnect = GUIObject.PlayerExecute:GetPropertyChangedSignal("Text"):Connect(function()
			if PS:FindFirstChild(GUIObject.PlayerExecute.Text) then
				SelectPlayer = GUIObject.PlayerExecute.Text
				GUIObject.PlayerExecute.TextColor3 = Color3.new(1,1,1)

				Function.PlayerDataAdd(SelectPlayer)
				Function.GUIUpdate()
			elseif not PS:FindFirstChild(GUIObject.PlayerExecute.Text) and GUIObject.PlayerExecute.Text ~= "Self" then
				GUIObject.PlayerExecute.TextColor3 = Color3.new(1,0,0)
			elseif not PS:FindFirstChild(GUIObject.PlayerExecute.Text) and GUIObject.PlayerExecute.Text == "Self" then
				SelectPlayer = Player.Name
				GUIObject.PlayerExecute.TextColor3 = Color3.new(1,1,1)

				Function.GUIUpdate()
			end
		end)

		local AutoExecuteConnect = GUIObject.AutoExecuteButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].AutoExecute = not PlayerData[SelectPlayer].AutoExecute

			Function.GUIUpdate()
		end)

		local BundleBodyColorConnect = GUIObject.BundleBodyColorButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].BundleBodyColor = not PlayerData[SelectPlayer].BundleBodyColor

			Function.GUIUpdate()
		end)

		local FaceConnect = GUIObject.FaceButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].Face = not PlayerData[SelectPlayer].Face

			Function.GUIUpdate()
		end)

		local MeshSizeLockConnect = GUIObject.MeshSizeLockButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].MeshSizeLock = not PlayerData[SelectPlayer].MeshSizeLock

			Function.GUIUpdate()
		end)

		local AccessorySizeLockConnect = GUIObject.AccessorySizeLockButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].AccessorySizeLock = not PlayerData[SelectPlayer].AccessorySizeLock

			Function.GUIUpdate()
		end)

		local MeshBasePartInvisibleConnect = GUIObject.MeshBasePartInvisibleButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].MeshBasePartInvisible = not PlayerData[SelectPlayer].MeshBasePartInvisible

			Function.GUIUpdate()
		end)

		local BodyPartPhysicsConnect = GUIObject.BodyPartPhysicsButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].BodyPartPhysics = not PlayerData[SelectPlayer].BodyPartPhysics

			Function.GUIUpdate()
		end)

		local ToneConnect = GUIObject.ToneButton.MouseButton1Click:Connect(function()
			if PlayerData[SelectPlayer].Tone == "Base" then
				PlayerData[SelectPlayer].Tone = "Dark"
			elseif PlayerData[SelectPlayer].Tone == "Dark" then
				PlayerData[SelectPlayer].Tone = "Use NippleColor"
			elseif PlayerData[SelectPlayer].Tone == "Use NippleColor" then
				PlayerData[SelectPlayer].Tone = "Base"
			end

			Function.GUIUpdate()
			local targetPlayer = PS:FindFirstChild(SelectPlayer) or Player
			if targetPlayer and targetPlayer.Character then
				Function.CharacterReset(SelectPlayer)
				Function.CharacterExecute(targetPlayer.Character, SelectPlayer)
			end
		end)

		local KeybindConnect = GUIObject.KeybindButton.MouseButton1Click:Connect(function()
			if UIS.KeyboardEnabled then
				if KeybindDetect then
					KeybindDetect = false
					GUIObject.KeybindButton.Text = (typeof(KEYBIND) == "EnumItem" and KEYBIND.Name) or tostring(KEYBIND):gsub("^Enum%.KeyCode%.", "")
				else
					GUIObject.KeybindButton.Text = "Change Keybind (Click On Keyboard)"
					KeybindDetect = true
				end
			end
		end)

		local MethodConnect = GUIObject.MethodButton.MouseButton1Click:Connect(function()
			Method += 1

			if Method > MaxMethod then
				Method = 1
			end

			GUIObject.MethodButton.Text = "Method: "..Method

			Function.GUIUpdate()
		end)
		local MethodConnect2 = GUIObject.MethodButton.MouseButton2Click:Connect(function()
			Method -= 1

			if Method < 1 then
				Method = MaxMethod
			end

			GUIObject.MethodButton.Text = "Method: "..Method

			Function.GUIUpdate()
		end)

		local UsernameConnect = GUIObject.UsernameTextbox.FocusLost:Connect(function()
			PlayerData[SelectPlayer].CatalogUsername = GUIObject.UsernameTextbox.Text

			PlayerData[SelectPlayer].CatalogRemove = {}
			if GUIObject.Catalog_3:FindFirstChild(SelectPlayer) then
				for i, v in pairs(GUIObject.Catalog_3:FindFirstChild(SelectPlayer):GetChildren()) do
					if not v:IsA("UIGridLayout") and not table.find(PlayerData[SelectPlayer].CatalogAccessory,tonumber(v.Name)) 
						and not table.find(PlayerData[SelectPlayer].CatalogTail,tonumber(v.Name)) then
						v:Destroy()
					end
				end
			end
			if PlayerData[SelectPlayer].CatalogUsername ~= "" then

				pcall(function()
					local UsernameId = PS:GetUserIdFromNameAsync(PlayerData[SelectPlayer].CatalogUsername)

					local HumanoidDescription = PS:GetHumanoidDescriptionFromUserId(UsernameId)

					for i, accessory in pairs(HumanoidDescription:GetAccessories(true)) do
						task.spawn(function()
							if accessory then
								local AccessoryInfo = MPS:GetProductInfo(accessory.AssetId)

								local Button = Function.ButtonCreate(AccessoryInfo.Name, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))

								local AccessoryRemoveButtonConnect
								AccessoryRemoveButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
									if not table.find(PlayerData[SelectPlayer].CatalogRemove, accessory.AssetId) then
										table.insert(PlayerData[SelectPlayer].CatalogRemove, accessory.AssetId)
									end

									Button:Destroy()
									AccessoryRemoveButtonConnect:Disconnect()
								end)

								table.insert(AllConnect, AccessoryRemoveButtonConnect)
							end
						end)
					end

				end)
			end

			Function.GUIUpdate()
		end)

		local ShirtConnect = GUIObject.ShirtTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.ShirtTextbox.Text) then
				PlayerData[SelectPlayer].CatalogClothes.Shirt = GUIObject.ShirtTextbox.Text

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].CatalogClothes.Shirt = ""

				Function.GUIUpdate()
			end
		end)

		local PantsConnect = GUIObject.PantsTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.PantsTextbox.Text) then
				PlayerData[SelectPlayer].CatalogClothes.Pants = GUIObject.PantsTextbox.Text

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].CatalogClothes.Pants = ""

				Function.GUIUpdate()
			end
		end)

		local ShirtGraphicConnect = GUIObject.ShirtGraphicTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.ShirtGraphicTextbox.Text) then
				PlayerData[SelectPlayer].CatalogClothes.ShirtGraphic = GUIObject.ShirtGraphicTextbox.Text

				Function.GUIUpdate()
			end
		end)

		local BreastsScaleConnect = GUIObject.BreastsScaleText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.BreastsScaleText.Text) then
				PlayerData[SelectPlayer].BreastsScale = GUIObject.BreastsScaleText.Text

				Function.GUIUpdate()
			end
		end)

		local ButtsScaleConnect = GUIObject.ButtsScaleText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.ButtsScaleText.Text) then
				PlayerData[SelectPlayer].ButtsScale = GUIObject.ButtsScaleText.Text

				Function.GUIUpdate()
			end
		end)

		local LegsScaleConnect = GUIObject.LegsScaleText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.LegsScaleText.Text) then
				PlayerData[SelectPlayer].LegsScale = GUIObject.LegsScaleText.Text

				Function.GUIUpdate()
			end
		end)

		local PositionPhysicsMultiplyConnect = GUIObject.PositionPhysicsMultiplyText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.PositionPhysicsMultiplyText.Text) then
				PositionPhysicsMultiply = GUIObject.PositionPhysicsMultiplyText.Text

				Function.GUIUpdate()
			end
		end)

		local RotationPhysicsMultiplyConnect = GUIObject.RotationPhysicsMultiplyText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.RotationPhysicsMultiplyText.Text) then
				RotationPhysicsMultiply = GUIObject.RotationPhysicsMultiplyText.Text

				Function.GUIUpdate()
			end
		end)

		local BreastsTypeConnect = GUIObject.BreastsTypeButton.MouseButton1Down:Connect(function()
			PlayerData[SelectPlayer].BreastsType += 1

			if PlayerData[SelectPlayer].BreastsType > MaxBreastsType then
				PlayerData[SelectPlayer].BreastsType = 1
			end

			Function.GUIUpdate()
		end)

		local TorsoTypeConnect = GUIObject.TorsoTypeButton.MouseButton1Down:Connect(function()
			PlayerData[SelectPlayer].TorsoType += 1

			if PlayerData[SelectPlayer].TorsoType > MaxTorsoType then
				PlayerData[SelectPlayer].TorsoType = 1
			end

			Function.GUIUpdate()
		end)

		local ArmTypeConnect = GUIObject.ArmTypeButton.MouseButton1Down:Connect(function()
			PlayerData[SelectPlayer].ArmType += 1

			if PlayerData[SelectPlayer].ArmType > MaxArmType then
				PlayerData[SelectPlayer].ArmType = 1
			end

			Function.GUIUpdate()
		end)

		local LegsTypeConnect = GUIObject.LegsTypeButton.MouseButton1Down:Connect(function()
			PlayerData[SelectPlayer].LegsType += 1

			if PlayerData[SelectPlayer].LegsType > MaxLegsType then
				PlayerData[SelectPlayer].LegsType = 1
			end

			Function.GUIUpdate()
		end)

		local LegsTypeConnect = GUIObject.ButtTypeButton.MouseButton1Down:Connect(function()
			PlayerData[SelectPlayer].ButtType += 1

			if PlayerData[SelectPlayer].ButtType > MaxButtType then
				PlayerData[SelectPlayer].ButtType = 1
			end

			Function.GUIUpdate()
		end)

		local BodyTransparencyConnect = GUIObject.BodyTransparencyButton.MouseButton1Click:Connect(function()
			if PlayerData[SelectPlayer].RealtimeBodyTransparency == false then
				if PlayerData[SelectPlayer].CurrentPartList.OriginalTransparency then
					for i, v in pairs(PlayerData[SelectPlayer].CurrentPartList.OriginalTransparency) do
						i.Transparency = v
						i.LocalTransparencyModifier = v
					end
				end
			end
			PlayerData[SelectPlayer].RealtimeBodyTransparency = not PlayerData[SelectPlayer].RealtimeBodyTransparency

			Function.GUIUpdate()
		end)

		local ClickExecuteConnect = GUIObject.ClickExecuteButton.MouseButton1Click:Connect(function()
			ClickExecute = not ClickExecute

			Function.GUIUpdate()
		end)

		--[[local TCS = game:GetService("TextChatService")
		if TCS:FindFirstChild("TextChatCommands") == nil then
			local newfolder = Instance.new("Folder", TCS)
			newfolder.Name = "TextChatCommands"
		end

		local BBCToggleCommand = Instance.new("TextChatCommand", game:GetService("TextChatService").TextChatCommands)
		BBCToggleCommand.Name = "ToggleCommand"
		BBCToggleCommand.PrimaryAlias = "/e toggle"
		BBCToggleCommand.SecondaryAlias = "/e tg"

		local BBCToggleConnect = BBCToggleCommand.Triggered:Connect(function()
			if PlayerData[SelectPlayer].ToggleBBC == true then
				PlayerData[SelectPlayer].ToggleBBC = false
			else
				PlayerData[SelectPlayer].ToggleBBC = true
			end
			local TextChatService = game:GetService("TextChatService")
			local Channel = TextChatService:WaitForChild("TextChannels"):WaitForChild("RBXGeneral")
			Channel:DisplaySystemMessage(tostring(PlayerData[SelectPlayer].ToggleBBC))
		end)]]

		local MobileCloseConnect = GUIObject.MobileCloseButton.MouseButton1Click:Connect(function()
			GUIObject.Screen.Enabled = not GUIObject.Screen.Enabled
		end)

		local SkinToneConnect = GUIObject.SkinToneText.FocusLost:Connect(function()
			local Text = GUIObject.SkinToneText.Text

			if Text == "" then
				PlayerData[SelectPlayer].SkinTone = nil
			else
				local Color = Function.StringTo(Text, "RGB")

				PlayerData[SelectPlayer].SkinTone = Color
				GUIObject.SkinToneText.TextColor3 = Color
			end

			Function.GUIUpdate()
			local targetPlayer = PS:FindFirstChild(SelectPlayer) or Player
			if targetPlayer and targetPlayer.Character then
				Function.CharacterReset(SelectPlayer)
				Function.CharacterExecute(targetPlayer.Character, SelectPlayer)
			end
		end)

		local NippleColorConnect = GUIObject.NippleColorText.FocusLost:Connect(function()
			local Text = GUIObject.NippleColorText.Text

			if Text == "" then
				PlayerData[SelectPlayer].NippleColor = nil
				if PlayerData[SelectPlayer].Tone == "Use NippleColor" then
					PlayerData[SelectPlayer].Tone = "Base"
				end
			else
				local Color = Function.StringTo(Text, "RGB")

				PlayerData[SelectPlayer].NippleColor = Color
				PlayerData[SelectPlayer].Tone = "Use NippleColor"
				GUIObject.NippleColorText.TextColor3 = Color
			end

			Function.GUIUpdate()
			local targetPlayer = PS:FindFirstChild(SelectPlayer) or Player
			if targetPlayer and targetPlayer.Character then
				Function.CharacterReset(SelectPlayer)
				Function.CharacterExecute(targetPlayer.Character, SelectPlayer)
			end
		end)

		local AccessoryConnect = GUIObject.AccessoryTextbox.FocusLost:Connect(function()
			if tonumber(GUIObject.AccessoryTextbox.Text) then
				table.insert(PlayerData[SelectPlayer].CatalogAccessory, GUIObject.AccessoryTextbox.Text)

				local Button = Function.ButtonCreate(GUIObject.AccessoryTextbox.Text, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))

				local AccessoryButtonConnect
				AccessoryButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
					for i, v in pairs(PlayerData[SelectPlayer].CatalogAccessory) do
						if tonumber(v) == tonumber(Button.Name) then
							table.remove(PlayerData[SelectPlayer].CatalogAccessory, i)
						end
					end

					Button:Destroy()
					AccessoryButtonConnect:Disconnect()
				end)

				table.insert(AllConnect, AccessoryButtonConnect)
			end
		end)

		local OutfitIdConnect = GUIObject.OutfitIdTextbox.FocusLost:Connect(function()
			if tonumber(GUIObject.OutfitIdTextbox.Text) or GUIObject.OutfitIdTextbox.Text == "" then
				local Text = GUIObject.OutfitIdTextbox.Text

				if Text == "" then
					PlayerData[SelectPlayer].CatalogOutfitId = ""
				else
					PlayerData[SelectPlayer].CatalogOutfitId = Text
				end

				PlayerData[SelectPlayer].CatalogRemove = {}
				if GUIObject.Catalog_3:FindFirstChild(SelectPlayer) then
					for i, v in pairs(GUIObject.Catalog_3:FindFirstChild(SelectPlayer):GetChildren()) do
						if not v:IsA("UIGridLayout") and not table.find(PlayerData[SelectPlayer].CatalogAccessory,tonumber(v.Name))
							and not table.find(PlayerData[SelectPlayer].CatalogTail,tonumber(v.Name)) then
							v:Destroy()
						end
					end
				end
				if PlayerData[SelectPlayer].CatalogOutfitId ~= "" then

					pcall(function()
						local HumanoidDescription = PS:GetHumanoidDescriptionFromOutfitId(PlayerData[SelectPlayer].CatalogOutfitId)

						for i, accessory in pairs(HumanoidDescription:GetAccessories(true)) do
							task.spawn(function()
								if accessory then
									local AccessoryInfo = MPS:GetProductInfo(accessory.AssetId)

									local Button = Function.ButtonCreate(AccessoryInfo.Name, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))

									local AccessoryRemoveButtonConnect
									AccessoryRemoveButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
										if not table.find(PlayerData[SelectPlayer].CatalogRemove, accessory.AssetId) then
											table.insert(PlayerData[SelectPlayer].CatalogRemove, accessory.AssetId)
										end

										Button:Destroy()
										AccessoryRemoveButtonConnect:Disconnect()
									end)

									table.insert(AllConnect, AccessoryRemoveButtonConnect)
								end
							end)
						end

					end)
				end

				Function.GUIUpdate()
			end
		end)

		local MeshNameConnect = GUIObject.MeshNameTextbox:GetPropertyChangedSignal("Text"):Connect(function()
			local Text = GUIObject.MeshNameTextbox.Text

			if PartList[Text] then
				GUIObject.MeshNameTextbox.TextColor3 = Color3.new(1,1,1)

				Function.GUIUpdate()
			elseif Text == "DEBUG" then
				GUIObject.MeshNameTextbox.TextColor3 = Color3.new(0,1,0)

				Function.GUIUpdate()
			else
				GUIObject.MeshNameTextbox.TextColor3 = Color3.new(1,0,0)
			end
		end)

		local CharacterPreviewConnect = GUIObject.PreviewButton.MouseButton1Click:Connect(function()
			Function.CharacterPreview(SelectPlayer)
		end)

		local BundleButtons = {}
		local ClothesButtons = {}
		local RecolorButtons = {}
		
		local function convertTableToString(t,indent)
			indent = indent or 0
			local s = ""
			for i, v in pairs(t) do
				for i = 1, indent do
					s = s .. "	"
				end
				if typeof(v) == "table" then
					if type(i) == "number" then
						s = s ..'['..tostring(i)..'] = { \n'
					else
						s = s ..'["'..tostring(i)..'"] = { \n'
					end
					s = s .. convertTableToString(v,indent+1)
					for i = 1, indent do
						s = s .. "	"
					end
					s = s .. "}, \n"
				else
					if type(i) == "number" then
						s = s ..Function.toFormatString(v)..", \n"
					else
						s = s ..'["'..tostring(i)..'"] = '..Function.toFormatString(v)..", \n"
					end
				end
			end
			return s
		end
		local function toBundleFormat(t,bundleName)
			local s = "[".. Function.toFormatString(bundleName) .."] = { \n"
			s = s .. convertTableToString(t, 1) .. "},"
			return s
		end
		Function.TableToString = toBundleFormat
		
		local function checkBundle(v)

			if v.ClearClothing == true or v.IsFullAvatar == true or (not v.ClothingBundle and not v.IsPreset) then
				PlayerData[SelectPlayer].CurrentClothes = {}
				PlayerData[SelectPlayer].PartList = Function.PartListDefault()
				PlayerData[SelectPlayer].ClothesRecolor = {}
				PlayerData[SelectPlayer].ClothesHP = {}
			end

			if v["Clothes"] then
				if v["Clothes"].Shirt then
					PlayerData[SelectPlayer].CatalogClothes.Shirt = tostring(v["Clothes"].Shirt)
				end
				if v["Clothes"].Pants then
					PlayerData[SelectPlayer].CatalogClothes.Pants = tostring(v["Clothes"].Pants)
				end
				if v["Clothes"].ShirtTemplate then
					PlayerData[SelectPlayer].CatalogClothes.ShirtTemplate = v["Clothes"].ShirtTemplate
				end
				if v["Clothes"].PantsTemplate then
					PlayerData[SelectPlayer].CatalogClothes.PantsTemplate = v["Clothes"].PantsTemplate
				end
			else
				PlayerData[SelectPlayer].CatalogClothes.Shirt = ""
				PlayerData[SelectPlayer].CatalogClothes.Pants = ""
				PlayerData[SelectPlayer].CatalogClothes.ShirtTemplate = nil
				PlayerData[SelectPlayer].CatalogClothes.PantsTemplate = nil
			end

			if v["Body Color"] then
				PlayerData[SelectPlayer].SkinTone = nil
				PlayerData[SelectPlayer].BundleBodyColor = true
			end
			if v["SkinTone"] then
				PlayerData[SelectPlayer].SkinTone = v["SkinTone"]
			end

			local targetNipColor = v["NippleColor"] or (v.Preset and v.Preset.NippleColor)
			if targetNipColor then
				if typeof(targetNipColor) == "table" and targetNipColor.R and targetNipColor.G and targetNipColor.B then
					targetNipColor = Color3.new(targetNipColor.R, targetNipColor.G, targetNipColor.B)
				end
				PlayerData[SelectPlayer].NippleColor = targetNipColor
				PlayerData[SelectPlayer].Tone = "Use NippleColor"
				if GUIObject.NippleColorText then
					GUIObject.NippleColorText.Text = math.round(targetNipColor.R * 255) .. ", " .. math.round(targetNipColor.G * 255) .. ", " .. math.round(targetNipColor.B * 255)
					GUIObject.NippleColorText.TextColor3 = targetNipColor
				end
			end

			if v["Accessory"] and (not v.ClothingBundle or v.ClothingBundle == false) then
				PlayerData[SelectPlayer].CatalogAccessory = {}
				PlayerData[SelectPlayer].CatalogTail = {}
				if GUIObject.Catalog_3:FindFirstChild(SelectPlayer) then
					for _, ch in pairs(GUIObject.Catalog_3:FindFirstChild(SelectPlayer):GetChildren()) do
						if not ch:IsA("UIGridLayout") then
							ch:Destroy()
						end
					end
				end
				for _, accId in pairs(v["Accessory"]) do
					local num = tonumber(accId)
					if num and not table.find(PlayerData[SelectPlayer].CatalogAccessory, num) then
						table.insert(PlayerData[SelectPlayer].CatalogAccessory, num)
						local Button = Function.ButtonCreate(num, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))
						local AccessoryButtonConnect
						AccessoryButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
							for i, b in pairs(PlayerData[SelectPlayer].CatalogAccessory) do
								if tonumber(b) == tonumber(Button.Name) then
									table.remove(PlayerData[SelectPlayer].CatalogAccessory, i)
								end
							end
							Button:Destroy()
							AccessoryButtonConnect:Disconnect()
						end)
						table.insert(AllConnect, AccessoryButtonConnect)
					end
				end
			end

			if v["TailAccessory"] and typeof(v["TailAccessory"]) == "table" and (not v.ClothingBundle or v.ClothingBundle == false) then
				for _, tailId in pairs(v["TailAccessory"]) do
					local num = tonumber(tailId)
					if num and not table.find(PlayerData[SelectPlayer].CatalogTail, num) then
						table.insert(PlayerData[SelectPlayer].CatalogTail, num)
						local Button = Function.ButtonCreate(num, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))
						local AccessoryButtonConnect
						AccessoryButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
							for i, b in pairs(PlayerData[SelectPlayer].CatalogTail) do
								if tonumber(b) == tonumber(Button.Name) then
									table.remove(PlayerData[SelectPlayer].CatalogTail, i)
								end
							end
							Button:Destroy()
							AccessoryButtonConnect:Disconnect()
						end)
						table.insert(AllConnect, AccessoryButtonConnect)
					end
				end
			end

			if v.Preset then

				if v.Preset["CatalogUsername"] or v.Preset["CatalogAccessory"] then

					if GUIObject.Catalog_3:FindFirstChild(SelectPlayer) then
						for i, v in pairs(GUIObject.Catalog_3:FindFirstChild(SelectPlayer):GetChildren()) do
							if not v:IsA("UIGridLayout") and not table.find(PlayerData[SelectPlayer].CatalogAccessory,tonumber(v.Name)) then
								v:Destroy()
							end
						end
					end

				end

				for setting, value in pairs(v.Preset) do
					if setting ~= "PositionPhysicsMultiply"
						and setting ~= "RotationPhysicsMultiply"
						and setting ~= "Method"
						and setting ~= "includedAccessoryNames" 
						and setting ~= "excludeAccessoryNames" then
						if setting == "CurrentBundle" then
							if (not Bundle[value].ClothingBundle or Bundle[value].ClothingBundle == false) and 
								(not Bundle[value].IsPreset or Bundle[value].IsPreset == false) then
								PlayerData[SelectPlayer][setting] = value
							end
							checkBundle(Bundle[value])
						elseif setting == "CatalogUsername" then
							PlayerData[SelectPlayer][setting] = value

							task.spawn(function()
								pcall(function()
									local UsernameId = PS:GetUserIdFromNameAsync(value)

									local HumanoidDescription = PS:GetHumanoidDescriptionFromUserId(UsernameId)

									for i, accessory in pairs(HumanoidDescription:GetAccessories(true)) do
										task.spawn(function()
											if accessory and not (v.Preset.CatalogRemove and table.find(v.Preset.CatalogRemove, accessory.AssetId)) then
												local AccessoryInfo = MPS:GetProductInfo(accessory.AssetId)

												local Button = Function.ButtonCreate(AccessoryInfo.Name, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))

												local AccessoryRemoveButtonConnect
												AccessoryRemoveButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
													if not table.find(PlayerData[SelectPlayer].CatalogRemove, accessory.AssetId) then
														table.insert(PlayerData[SelectPlayer].CatalogRemove, accessory.AssetId)
													end

													Button:Destroy()
													AccessoryRemoveButtonConnect:Disconnect()
												end)

												table.insert(AllConnect, AccessoryRemoveButtonConnect)
											end
										end)
									end

								end)
							end)
						elseif setting == "CatalogAccessory" then
							PlayerData[SelectPlayer][setting] = {}
							for i, x in pairs(value) do

								table.insert(PlayerData[SelectPlayer][setting], x)
								local Button = Function.ButtonCreate(x, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))

								local AccessoryButtonConnect
								AccessoryButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
									for i, v in pairs(PlayerData[SelectPlayer].CatalogAccessory) do
										if tonumber(v) == tonumber(Button.Name) then
											table.remove(PlayerData[SelectPlayer].CatalogAccessory, i)
										end
									end

									Button:Destroy()
									AccessoryButtonConnect:Disconnect()
								end)

								table.insert(AllConnect, AccessoryButtonConnect)
							end
						elseif setting == "CatalogTail" then
							for i, x in pairs(value) do

								local Button = Function.ButtonCreate(x, GUIObject.Catalog_3:FindFirstChild(SelectPlayer))

								local AccessoryButtonConnect
								AccessoryButtonConnect = Button:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
									for i, v in pairs(PlayerData[SelectPlayer].CatalogTail) do
										if tonumber(v) == tonumber(Button.Name) then
											table.remove(PlayerData[SelectPlayer].CatalogTail, i)
										end
									end

									Button:Destroy()
									AccessoryButtonConnect:Disconnect()
								end)

								table.insert(AllConnect, AccessoryButtonConnect)
							end
							PlayerData[SelectPlayer][setting] = value
						elseif setting == "tailSettings" and typeof(value) == "table" then
							if not PlayerData[SelectPlayer].tailSettings then
								PlayerData[SelectPlayer].tailSettings = {}
							end
							for tk, tv in pairs(value) do
								PlayerData[SelectPlayer].tailSettings[tk] = tv
							end
						elseif setting == "LocalTransparency" and typeof(value) == "table" then
							if not PlayerData[SelectPlayer].LocalTransparency then
								PlayerData[SelectPlayer].LocalTransparency = {}
							end
							for lk, lv in pairs(value) do
								PlayerData[SelectPlayer].LocalTransparency[lk] = lv
							end
						elseif setting == "FPerson" then
							PlayerData[SelectPlayer].FPerson = (value == true)
							if not value and SelectPlayer == Player.Name and Player.Character then
								local human = Player.Character:FindFirstChildOfClass("Humanoid")
								if human then
									human.CameraOffset = Vector3.new(0, 0, 0)
								end
							end
						elseif setting == "Tone" then
							if not targetNipColor or value == "Dark" then
								PlayerData[SelectPlayer].Tone = value
							else
								PlayerData[SelectPlayer].Tone = "Use NippleColor"
							end
						else
							PlayerData[SelectPlayer][setting] = value
						end
					else
						if setting == "PositionPhysicsMultiply" then
							PositionPhysicsMultiply = value
						elseif setting == "RotationPhysicsMultiply" then
							RotationPhysicsMultiply = value
						elseif setting == "Method" then
							Method = value
						elseif setting == "includedAccessoryNames" then
							includedAccessoryNames = {}
							for i, v in pairs(value) do
								table.insert(includedAccessoryNames, v)
							end
						elseif setting == "excludeAccessoryNames" then
							excludeAccessoryNames = {}
							for i, v in pairs(value) do
								table.insert(excludeAccessoryNames, v)
							end
						end
					end
				end
			end

			if v.Clothing then
				for i, v in pairs(v.Clothing) do
					if not Clothes[v] then
						warn(v.. " does not exist. Update your bundle!")
						continue
					end
					
					if Clothes[v].Blacklist then
						for i, b in pairs(Clothes[v].Blacklist) do
							if table.find(PlayerData[SelectPlayer].CurrentClothes, b) then
								table.remove(PlayerData[SelectPlayer].CurrentClothes, table.find(PlayerData[SelectPlayer].CurrentClothes, b))
							end
						end
					end
					if not table.find(PlayerData[SelectPlayer].CurrentClothes, v) then
						table.insert(PlayerData[SelectPlayer].CurrentClothes, v)
					end

					if Clothes[v] and Clothes[v]["HP"] then
						if Clothes[v].HP == 1 then
							PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="TopHP",["Inverse"]=false}
						elseif Clothes[v].HP == 2 then
							PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="BottomHP",["Inverse"]=false}
						elseif Clothes[v].HP == 3 then
							PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="TopHP",["Inverse"]=true}
						elseif Clothes[v].HP == 4 then
							PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]="BottomHP",["Inverse"]=true}
						elseif not Clothes[v].HP or Clothes[v].HP == 0 then
							PlayerData[SelectPlayer].ClothesHP[v] = nil
						else
							PlayerData[SelectPlayer].ClothesHP[v] = {["HP"]=Clothes[v].HP,["Inverse"]=false}
						end
					end

					for i, c in pairs(Clothes[v].Weld) do -- CHANGE here
						if PartList[c] and PartList[c].Recolor then
							if not PlayerData[SelectPlayer].ClothesRecolor[v] then
								PlayerData[SelectPlayer].ClothesRecolor[v] = {}
								RecolorButtons[v] = {}
							end
							if PartList[c].Recolor == "Primary" and not PlayerData[SelectPlayer].ClothesRecolor[v]["Primary"] then
								PlayerData[SelectPlayer].ClothesRecolor[v]["Primary"] = "nil"
								local button = Function.ButtonCreate(v, GUIObject.RecolorListFrame, true, {Color = PartList[c].Color.Color, Text = v.. " PrimaryColor"})
								button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()

								button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[c].Color.Color
								button:FindFirstChildOfClass("TextBox").Text = ""
								local primaryChangeConnect = button:FindFirstChildOfClass("TextBox").FocusLost:Connect(function()
									if button:FindFirstChildOfClass("TextBox").Text ~= "" then
										local RGB = Function.StringTo(button:FindFirstChildOfClass("TextBox").Text, "RGB")

										button:FindFirstChildOfClass("TextBox").TextColor3 = RGB
										PlayerData[SelectPlayer].ClothesRecolor[v]["Primary"] = RGB
									else
										PlayerData[SelectPlayer].ClothesRecolor[v]["Primary"] = "nil"
										button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[c].Color.Color
									end
								end)
								table.insert(RecolorButtons[v],primaryChangeConnect)
								table.insert(AllConnect,primaryChangeConnect)
							elseif PartList[c].Recolor == "Secondary" and not PlayerData[SelectPlayer].ClothesRecolor[v]["Secondary"] then
								PlayerData[SelectPlayer].ClothesRecolor[v]["Secondary"] = "nil"
								local button = Function.ButtonCreate(v, GUIObject.RecolorListFrame, true, {Color = PartList[c].Color.Color, Text = v.. " SecondaryColor"})
								button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()

								button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[c].Color.Color
								button:FindFirstChildOfClass("TextBox").Text = ""
								local secondaryChangeConnect = button:FindFirstChildOfClass("TextBox").FocusLost:Connect(function()
									if button:FindFirstChildOfClass("TextBox").Text ~= "" then
										local RGB = Function.StringTo(button:FindFirstChildOfClass("TextBox").Text, "RGB")

										button:FindFirstChildOfClass("TextBox").TextColor3 = RGB
										PlayerData[SelectPlayer].ClothesRecolor[v]["Secondary"] = RGB
									else
										PlayerData[SelectPlayer].ClothesRecolor[v]["Secondary"] = "nil"
										button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[c].Color.Color
									end
								end)
								table.insert(RecolorButtons[v],secondaryChangeConnect)
								table.insert(AllConnect,secondaryChangeConnect)
							elseif PartList[c].Recolor == "Tertiary" and not PlayerData[SelectPlayer].ClothesRecolor[v]["Tertiary"] then
								PlayerData[SelectPlayer].ClothesRecolor[v]["Tertiary"] = "nil"
								local button = Function.ButtonCreate(v, GUIObject.RecolorListFrame, true, {Color = PartList[c].Color.Color, Text = v.. " TertiaryColor"})
								button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()

								button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[c].Color.Color
								button:FindFirstChildOfClass("TextBox").Text = ""
								local tertiaryChangeConnect = button:FindFirstChildOfClass("TextBox").FocusLost:Connect(function()
									if button:FindFirstChildOfClass("TextBox").Text ~= "" then
										local RGB = Function.StringTo(button:FindFirstChildOfClass("TextBox").Text, "RGB")

										button:FindFirstChildOfClass("TextBox").TextColor3 = RGB
										PlayerData[SelectPlayer].ClothesRecolor[v]["Tertiary"] = RGB
									else
										PlayerData[SelectPlayer].ClothesRecolor[v]["Tertiary"] = "nil"
										button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[c].Color.Color
									end
								end)
								table.insert(RecolorButtons[v],tertiaryChangeConnect)
								table.insert(AllConnect,tertiaryChangeConnect)
							end
						end
					end
				end
			end

			if v.Recolor then
				for i, recolorData in pairs(v.Recolor) do
					local cleanRecolor = {}
					for color, rawColor in pairs(recolorData) do
						local colorObj = nil
						if typeof(rawColor) == "Color3" then
							colorObj = rawColor
						elseif typeof(rawColor) == "table" and rawColor.R and rawColor.G and rawColor.B then
							colorObj = Color3.new(rawColor.R, rawColor.G, rawColor.B)
						elseif typeof(rawColor) == "string" and rawColor ~= "nil" and rawColor ~= "" and not rawColor:find("table:") then
							pcall(function()
								colorObj = Function.StringTo(rawColor, "RGB")
							end)
						end

						if colorObj then
							cleanRecolor[color] = colorObj
						else
							cleanRecolor[color] = "nil"
						end

						for z, button in pairs(GUIObject.RecolorListFrame:GetChildren()) do
							if button.Name == i then
								local tb = button:FindFirstChildOfClass("TextBox")
								if tb and tb.PlaceholderText == i.." "..color.."Color" then
									if colorObj then
										tb.TextColor3 = colorObj
										tb.Text = math.round(colorObj.R * 255) .. "," .. math.round(colorObj.G * 255) .. "," .. math.round(colorObj.B * 255)
									else
										tb.Text = ""
									end
								end
							end
						end
					end
					PlayerData[SelectPlayer].ClothesRecolor[i] = cleanRecolor
				end
			end

			if targetNipColor then
				PlayerData[SelectPlayer].NippleColor = targetNipColor
				if PlayerData[SelectPlayer].Tone ~= "Dark" then
					PlayerData[SelectPlayer].Tone = "Use NippleColor"
				end
				if GUIObject.NippleColorText then
					GUIObject.NippleColorText.Text = math.round(targetNipColor.R * 255) .. ", " .. math.round(targetNipColor.G * 255) .. ", " .. math.round(targetNipColor.B * 255)
					GUIObject.NippleColorText.TextColor3 = targetNipColor
				end
			end

			if v["Body Color"] then
				local cleanBC = {}
				for k, val in pairs(v["Body Color"]) do
					if typeof(val) == "Color3" then
						cleanBC[k] = val
					elseif typeof(val) == "table" and val.R and val.G and val.B then
						cleanBC[k] = Color3.new(val.R, val.G, val.B)
					end
				end
				v["Body Color"] = cleanBC
			end

			if v.MeshEdit then
				for Name, Property in pairs(v.MeshEdit) do
					for PropertyName, propVal in pairs(Property) do
						if PropertyName == "CockScale" then
							PlayerData[SelectPlayer].CockScale = propVal
						elseif PropertyName == "Color" then
							local targetPL = PlayerData[SelectPlayer]["PartList"][Name]
							if targetPL and targetPL["Color"] then
								if typeof(propVal) == "Color3" then
									targetPL["Color"].Color = propVal
								elseif typeof(propVal) == "table" then
									if propVal.Color == "Parent" then
										targetPL["Color"].Color = "Parent"
									elseif propVal.R and propVal.G and propVal.B then
										targetPL["Color"].Color = Color3.new(propVal.R, propVal.G, propVal.B)
									elseif propVal.Color and typeof(propVal.Color) == "table" and propVal.Color.R then
										targetPL["Color"].Color = Color3.new(propVal.Color.R, propVal.Color.G, propVal.Color.B)
									end
								elseif typeof(propVal) == "string" then
									if propVal == "Parent" then
										targetPL["Color"].Color = "Parent"
									elseif propVal ~= "" and propVal ~= "nil" and not propVal:find("table:") then
										pcall(function()
											local RGB = Function.StringTo(propVal, "RGB")
											if RGB then targetPL["Color"].Color = RGB end
										end)
									end
								end
							end
						else
							PlayerData[SelectPlayer]["PartList"][Name][PropertyName] = propVal
						end
					end
				end
			end

			if v.HPClothes then
				for name, v in pairs(v.HPClothes) do
					PlayerData[SelectPlayer]["ClothesHP"][name] = v
				end
			end

		end

		local function registerBundleButton(name, bData)
			Bundle[name] = bData

			local oldChild = GUIObject.BundlesButtonFrame:FindFirstChild(name)
			if oldChild then
				for idx, btn in ipairs(BundleButtons) do
					if btn == oldChild then
						table.remove(BundleButtons, idx)
						break
					end
				end
				oldChild:Destroy()
			end

			local BButton = Function.ButtonCreate(name, GUIObject.BundlesButtonFrame)
			if bData.ClothingBundle and bData.ClothingBundle == true then
				BButton.BackgroundColor3 = Color3.fromRGB(90, 38, 0)
			elseif bData.IsPreset == true then
				BButton.BackgroundColor3 = Color3.fromRGB(25, 84, 0)
			end

			if name ~= "nil" and name ~= "Bald" then
				table.insert(BundleButtons, BButton)
			else
				if name == "nil" then
					BButton.LayoutOrder = -999999999
				else
					BButton.LayoutOrder = -999999998
				end
			end

			local BBConnect = BButton:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()
				local currentData = Bundle[name] or bData
				if DetectingBundle == false then
					if BButton.Name == "nil" and PlayerData[SelectPlayer].CurrentBundle == "nil" then
						Function.CharacterReset(SelectPlayer)
						PlayerData[SelectPlayer] = Function.PlayerDataDefault()
						for i, v in pairs(GUIObject.RecolorListFrame:GetChildren()) do
							if v:IsA("Frame") then
								v:Destroy()
							end
						end

						task.delay(0, function()
							BButton:FindFirstChildOfClass("TextButton").Text = "CLEARED"
						end)
					end

					if (not currentData.ClothingBundle or currentData.ClothingBundle == false) and (not currentData.IsPreset or currentData.IsPreset == false) then
						PlayerData[SelectPlayer].CurrentBundle = BButton.Name
					end

					checkBundle(currentData)
					Function.GUIUpdate()

					local targetPlayer = PS:FindFirstChild(SelectPlayer) or Player
					if targetPlayer and targetPlayer.Character then
						Function.CharacterReset(SelectPlayer)
						Function.CharacterExecute(targetPlayer.Character, SelectPlayer)
					end
				elseif DetectingBundle == "loadup" then
					DetectingBundle = false
					GUIObject.Bundles.Visible = false
					GUIObject.optionsFrame.Visible = true
					if BButton.Name == "nil" then
						loadupBundle = ""
					else
						loadupBundle = BButton.Name
					end
				elseif DetectingBundle == "export" then
					DetectingBundle = false
					GUIObject.Bundles.Visible = false
					GUIObject.optionsFrame.Visible = true

					local exportString = toBundleFormat(currentData, BButton.Name)

					local successfulCopy = pcall(function()
						if env.copy then
							GUIObject.exportButton.Text = "Copied exported bundle!"
							env.copy(exportString)
						else
							error("no")
						end
					end)
					if not successfulCopy then
						GUIObject.exportButton.Text = "CANNOT COPY, EXPORTED TO CONSOLE"
						print(exportString)
					end
					task.delay(2, function()
						GUIObject.exportButton.Text = "Export Bundle"
					end)
				elseif DetectingBundle == "delete" then
					local function sanitize(str)
						for _, char in ipairs({"/", "<", ">", "?", "*", "|", " ", "\\", '"', ":"}) do
							str = string.gsub(str, char, "_")
						end
						return str
					end
					DetectingBundle = false
					GUIObject.Bundles.Visible = false
					GUIObject.optionsFrame.Visible = true

					Bundle[BButton.Name] = nil
					if env.delfile then
						pcall(function()
							local p = "RClothesLerp/Bundles/"..sanitize(BButton.Name)..".json"
							if env.isfile and env.isfile(p) then
								env.delfile(p)
							end
						end)
					end
					for idx, btn in ipairs(BundleButtons) do
						if btn == BButton then
							table.remove(BundleButtons, idx)
							break
						end
					end
					GUIObject.delButton.Text = BButton.Name.." Deleted"
					BButton:Destroy()
					Function.compileOvertime()
					task.delay(2, function()
						GUIObject.delButton.Text = "Delete Bundle"
					end)
				end

				Function.GUIUpdate()
			end)

			table.insert(AllConnect, BBConnect)
			return BButton
		end
		Function.registerBundleButton = registerBundleButton

		for i, v in pairs(Bundle) do
			registerBundleButton(i, v)
		end

		if loadupBundle ~= nil and Bundle[loadupBundle] then
			local v = Bundle[loadupBundle]
			if (not v.ClothingBundle or v.ClothingBundle == false) and (not v.IsPreset or v.IsPreset == false) then
				PlayerData[Player.Name].CurrentBundle = loadupBundle
			end
			checkBundle(Bundle[loadupBundle])
		elseif loadupBundle ~= nil and loadupBundle ~= "" then
			warn('No bundle named "'.. loadupBundle ..'" was found!')
		end

		for i, v in pairs(Clothes) do
			local CButton = Function.ButtonCreate(i, GUIObject.ClothesButtonFrame)

			if i ~= "nil" then
				table.insert(ClothesButtons, CButton)
			end

			local CBConnect = CButton:FindFirstChildOfClass("TextButton").MouseButton1Click:Connect(function()

				if not table.find(PlayerData[SelectPlayer].CurrentClothes, CButton.Name) then
					table.insert(PlayerData[SelectPlayer].CurrentClothes, CButton.Name)

					if Clothes[CButton.Name].Weld then

						for i, v in pairs(Clothes[CButton.Name].Weld) do
							if PartList[v] and PartList[v].Recolor then
								if not PlayerData[SelectPlayer].ClothesRecolor[CButton.Name] then
									PlayerData[SelectPlayer].ClothesRecolor[CButton.Name] = {}
									RecolorButtons[CButton.Name] = {}
								end
								if PartList[v].Recolor == "Primary" and not PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Primary"] then
									PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Primary"] = "nil"
									local button = Function.ButtonCreate(CButton.Name, GUIObject.RecolorListFrame, true, {Color = PartList[v].Color.Color, Text = CButton.Name.. " PrimaryColor"})
									button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()

									button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[v].Color.Color
									button:FindFirstChildOfClass("TextBox").Text = ""
									local primaryChangeConnect = button:FindFirstChildOfClass("TextBox").FocusLost:Connect(function()
										if button:FindFirstChildOfClass("TextBox").Text ~= "" then
											local RGB = Function.StringTo(button:FindFirstChildOfClass("TextBox").Text, "RGB")

											button:FindFirstChildOfClass("TextBox").TextColor3 = RGB
											PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Primary"] = RGB
										else
											PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Primary"] = "nil"
											button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[v].Color.Color
										end
									end)
									table.insert(RecolorButtons[CButton.Name],primaryChangeConnect)
									table.insert(AllConnect,primaryChangeConnect)
								elseif PartList[v].Recolor == "Secondary" and not PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Secondary"] then
									PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Secondary"] = "nil"
									local button = Function.ButtonCreate(CButton.Name, GUIObject.RecolorListFrame, true, {Color = PartList[v].Color.Color, Text = CButton.Name.. " SecondaryColor"})
									button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()

									button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[v].Color.Color
									button:FindFirstChildOfClass("TextBox").Text = ""
									local secondaryChangeConnect = button:FindFirstChildOfClass("TextBox").FocusLost:Connect(function()
										if button:FindFirstChildOfClass("TextBox").Text ~= "" then
											local RGB = Function.StringTo(button:FindFirstChildOfClass("TextBox").Text, "RGB")

											button:FindFirstChildOfClass("TextBox").TextColor3 = RGB
											PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Secondary"] = RGB
										else
											PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Secondary"] = "nil"
											button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[v].Color.Color
										end
									end)
									table.insert(RecolorButtons[CButton.Name],secondaryChangeConnect)
									table.insert(AllConnect,secondaryChangeConnect)
								elseif PartList[v].Recolor == "Tertiary" and not PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Tertiary"] then
									PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Tertiary"] = "nil"
									local button = Function.ButtonCreate(CButton.Name, GUIObject.RecolorListFrame, true, {Color = PartList[v].Color.Color, Text = CButton.Name.. " TertiaryColor"})
									button:FindFirstChildOfClass("UIAspectRatioConstraint"):Destroy()

									button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[v].Color.Color
									button:FindFirstChildOfClass("TextBox").Text = ""
									local tertiaryChangeConnect = button:FindFirstChildOfClass("TextBox").FocusLost:Connect(function()
										if button:FindFirstChildOfClass("TextBox").Text ~= "" then
											local RGB = Function.StringTo(button:FindFirstChildOfClass("TextBox").Text, "RGB")

											button:FindFirstChildOfClass("TextBox").TextColor3 = RGB
											PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Tertiary"] = RGB
										else
											PlayerData[SelectPlayer].ClothesRecolor[CButton.Name]["Tertiary"] = "nil"
											button:FindFirstChildOfClass("TextBox").TextColor3 = PartList[v].Color.Color
										end
									end)
									table.insert(RecolorButtons[CButton.Name],tertiaryChangeConnect)
									table.insert(AllConnect,tertiaryChangeConnect)
								end
							end
						end

						if Clothes[CButton.Name]["Blacklist"] then
							for i, v in pairs(Clothes[CButton.Name]["Blacklist"]) do
								if table.find(PlayerData[SelectPlayer].CurrentClothes, v) then
									table.remove(PlayerData[SelectPlayer].CurrentClothes, table.find(PlayerData[SelectPlayer].CurrentClothes, v))
								end
							end
						end

						if Clothes[CButton.Name]["HP"] then
							if Clothes[CButton.Name].HP == 1 then
								PlayerData[SelectPlayer].ClothesHP[CButton.Name] = {["HP"]="TopHP",["Inverse"]=false}
							elseif Clothes[CButton.Name].HP == 2 then
								PlayerData[SelectPlayer].ClothesHP[CButton.Name] = {["HP"]="BottomHP",["Inverse"]=false}
							elseif Clothes[CButton.Name].HP == 3 then
								PlayerData[SelectPlayer].ClothesHP[CButton.Name] = {["HP"]="TopHP",["Inverse"]=true}
							elseif Clothes[CButton.Name].HP == 4 then
								PlayerData[SelectPlayer].ClothesHP[CButton.Name] = {["HP"]="BottomHP",["Inverse"]=true}
							elseif not Clothes[CButton.Name].HP or Clothes[CButton.Name].HP == 0 then
								PlayerData[SelectPlayer].ClothesHP[CButton.Name] = nil
							else
								PlayerData[SelectPlayer].ClothesHP[CButton.Name] = {["HP"]=Clothes[CButton.Name].HP,["Inverse"]=false}
							end
						end

					end

				else
					for i, v in pairs(PlayerData[SelectPlayer].CurrentClothes) do
						if v == CButton.Name then
							table.remove(PlayerData[SelectPlayer].CurrentClothes, i)

							if PlayerData[SelectPlayer].ClothesRecolor[CButton.Name] then
								PlayerData[SelectPlayer].ClothesRecolor[CButton.Name] = nil
								for i, v in pairs(GUIObject.RecolorListFrame:GetChildren()) do
									if v.Name == CButton.Name then
										v:Destroy()
									end
								end
								for i, v in pairs(RecolorButtons[CButton.Name]) do
									table.remove(AllConnect,table.find(AllConnect,v))
								end
								RecolorButtons[CButton.Name] = nil
							end

						end
					end
				end

				Function.GUIUpdate()
			end)

			table.insert(AllConnect, CBConnect)
		end

		table.sort(BundleButtons, function(a,b)
			return a.Name:lower() < b.Name:lower()
		end)
		table.sort(ClothesButtons, function(a,b)
			return a.Name < b.Name
		end)

		for i, v in pairs(BundleButtons) do
			local extraorder = 0
			if Bundle[v.Name].ClothingBundle and Bundle[v.Name].ClothingBundle == true then
				extraorder = -999
			elseif Bundle[v.Name].IsPreset and Bundle[v.Name].IsPreset == true then
				extraorder = -999999
			end
			v.LayoutOrder = i+extraorder
		end
		for i, v in pairs(ClothesButtons) do
			v.LayoutOrder = i
		end

		for _, Button in pairs(GUIObject.CharacterFrame:GetChildren()) do
			if Button:IsA("ImageButton") and PlayerData[SelectPlayer].LocalTransparency[Button.Name] ~= nil then
				local LocalTransparencyConnect = Button.MouseButton1Click:Connect(function()
					PlayerData[SelectPlayer].LocalTransparency[Button.Name] = not PlayerData[SelectPlayer].LocalTransparency[Button.Name]

					Function.GUIUpdate()
				end)

				table.insert(AllConnect, LocalTransparencyConnect)
			end
		end

		local ClothesSearchConnect = GUIObject.ClothesSearch:GetPropertyChangedSignal("Text"):Connect(function()
			Function.GUIUpdate()
		end)

		local BundleSearchConnect = GUIObject.BundleSearch:GetPropertyChangedSignal("Text"):Connect(function()
			Function.GUIUpdate()
		end)

		local FirstPersonConnect = GUIObject.FPExecute.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].FPerson = not PlayerData[SelectPlayer].FPerson
			if not PlayerData[SelectPlayer].FPerson and SelectPlayer == Player.Name and Player.Character then
				local human = Player.Character:FindFirstChildOfClass("Humanoid")
				if human then
					human.CameraOffset = Vector3.new(0, 0, 0)
				end
			end

			Function.GUIUpdate()
		end)

		local GravityConnect = GUIObject.GravityButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].PhysicsObeyGravity = not PlayerData[SelectPlayer].PhysicsObeyGravity

			Function.GUIUpdate()
		end)

		local ShirtHPConnect = GUIObject.TopHPText.FocusLost:Connect(function()
			if tonumber(GUIObject.TopHPText.Text) then
				PlayerData[SelectPlayer].TopHP = tonumber(GUIObject.TopHPText.Text)

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].TopHP = ""

				Function.GUIUpdate()
			end
		end)

		local PantsHPConnect = GUIObject.BottomHPText.FocusLost:Connect(function()
			if tonumber(GUIObject.BottomHPText.Text) then
				PlayerData[SelectPlayer].BottomHP = tonumber(GUIObject.BottomHPText.Text)

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].BottomHP = ""

				Function.GUIUpdate()
			end
		end)

		local ShirtClothesConnect = GUIObject.TopClothesText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.TopClothesText.Text) then
				PlayerData[SelectPlayer].HPClothes.Shirt = tonumber(GUIObject.TopClothesText.Text)

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].HPClothes.Shirt = ""

				Function.GUIUpdate()
			end
		end)

		local PantsClothesConnect = GUIObject.BottomClothesText:GetPropertyChangedSignal("Text"):Connect(function()
			if tonumber(GUIObject.BottomClothesText.Text) then
				PlayerData[SelectPlayer].HPClothes.Pants = tonumber(GUIObject.BottomClothesText.Text)

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].HPClothes.Pants = ""

				Function.GUIUpdate()
			end
		end)

		local DamageSFXConnect = GUIObject.DamageSFX.FocusLost:Connect(function()
			if tonumber(GUIObject.DamageSFX.Text) then
				PlayerData[SelectPlayer].DamageSFX = tonumber(GUIObject.DamageSFX.Text)

				Function.GUIUpdate()
			else
				PlayerData[SelectPlayer].DamageSFX = ""

				Function.GUIUpdate()
			end
		end)

		local VolumeSFXConnect = GUIObject.VolumeText.FocusLost:Connect(function()
			if tonumber(GUIObject.VolumeText.Text) then
				PlayerData[SelectPlayer].Volume = tonumber(GUIObject.VolumeText.Text)

				Function.GUIUpdate()
			end
		end)

		local TearToggleConnect = GUIObject.TPToggle.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].TearParticles = not PlayerData[SelectPlayer].TearParticles

			Function.GUIUpdate()
		end)

		local HealToggleConnect = GUIObject.PHToggle.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].HealParticles = not PlayerData[SelectPlayer].HealParticles

			Function.GUIUpdate()
		end)

		local HardcoreToggleConnect = GUIObject.HardcoreToggle.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].HardcoreHP = not PlayerData[SelectPlayer].HardcoreHP

			Function.GUIUpdate()
		end)

		local TailPhysicsToggleConnect = GUIObject.tailToggleButton.MouseButton1Click:Connect(function()
			PlayerData[SelectPlayer].tailSettings.tailPhysicsEnabled = not PlayerData[SelectPlayer].tailSettings.tailPhysicsEnabled

			Function.GUIUpdate()
		end)

		local loadupClosedConnect = GUIObject.closeOptionButton.MouseButton1Click:Connect(function()
			loadupClosed = not loadupClosed

			Function.GUIUpdate()
			Function.SaveSettings()
		end)

		local loadupExecuteConnect = GUIObject.executeOptionButton.MouseButton1Click:Connect(function()
			loadupExecute = not loadupExecute

			Function.GUIUpdate()
			Function.SaveSettings()
		end)

		local saveClothesToggleConnect = GUIObject.saveClothesOptionButton.MouseButton1Click:Connect(function()
			if saveClothesOption == "Boob Naked" then
				saveClothesOption = "Clothed"
			elseif saveClothesOption == "Clothed" then
				saveClothesOption = "Naked"
			else
				saveClothesOption = "Boob Naked"
			end
			Function.GUIUpdate()
			Function.SaveSettings()
		end)
		table.insert(AllConnect, saveClothesToggleConnect)

		local saveClothesToggleConnect2 = GUIObject.saveClothesOptionButton.MouseButton2Click:Connect(function()
			if saveClothesOption == "Boob Naked" then
				saveClothesOption = "Naked"
			elseif saveClothesOption == "Naked" then
				saveClothesOption = "Clothed"
			else
				saveClothesOption = "Boob Naked"
			end
			Function.GUIUpdate()
			Function.SaveSettings()
		end)
		table.insert(AllConnect, saveClothesToggleConnect2)

		local loadupFPersonConnect = GUIObject.FPersonLoadupButton.MouseButton1Click:Connect(function()
			loadupFPerson += 1

			if loadupFPerson > maxFPersonMethod then
				loadupFPerson = 0
			end
			Function.GUIUpdate()
			Function.SaveSettings()
		end)

		local loadupFPersonConnect2 = GUIObject.FPersonLoadupButton.MouseButton2Click:Connect(function()
			loadupFPerson -= 1

			if loadupFPerson < 0 then
				loadupFPerson = maxFPersonMethod
			end
			Function.GUIUpdate()
			Function.SaveSettings()
		end)

		local loadupBundleConnect = GUIObject.bundleLoadButton.MouseButton1Click:Connect(function()
			DetectingBundle = "loadup"
			GUIObject.Bundles.Visible = true
			GUIObject.optionsFrame.Visible = false

			task.spawn(function()
				repeat task.wait() until DetectingBundle == false or GUIObject.Bundles.Visible == false
				DetectingBundle = false
				Function.GUIUpdate()
				Function.SaveSettings()
			end)
		end)

		local exportBundleConnect = GUIObject.exportButton.MouseButton1Click:Connect(function()
			DetectingBundle = "export"
			GUIObject.Bundles.Visible = true
			GUIObject.optionsFrame.Visible = false

			task.spawn(function()
				repeat task.wait() until DetectingBundle == false or GUIObject.Bundles.Visible == false
				DetectingBundle = false
				Function.GUIUpdate()
			end)
		end)

		local delBundleConnect = GUIObject.delButton.MouseButton1Click:Connect(function()
			DetectingBundle = "delete"
			GUIObject.Bundles.Visible = true
			GUIObject.optionsFrame.Visible = false

			task.spawn(function()
				repeat task.wait() until DetectingBundle == false or GUIObject.Bundles.Visible == false
				DetectingBundle = false
				Function.GUIUpdate()
			end)
		end)

		local robloxClothingItems = {
			"Roblox Shirt",
			"Roblox Butt Shirt",
			"Roblox Pants",
			"Roblox Breasts Clothing"
		}

		local function getClothesIdHelper(charData, partClass, desc, char, m2Char)
			local curB = charData and charData.CurrentBundle
			if curB and curB ~= "nil" and curB ~= "Default" and Bundle[curB] and Bundle[curB]["Clothes"] and Bundle[curB]["Clothes"][partClass] then
				local bId = tonumber(tostring(Bundle[curB]["Clothes"][partClass]):match("%d+"))
				if bId and bId > 0 then return bId end
			end

			if charData and charData.CatalogClothes and charData.CatalogClothes[partClass] and charData.CatalogClothes[partClass] ~= "" then
				local id = tonumber(tostring(charData.CatalogClothes[partClass]):match("%d+"))
				if id and id > 0 then return id end
			end

			if desc and desc[partClass] and tonumber(desc[partClass]) and tonumber(desc[partClass]) > 0 then
				return tonumber(desc[partClass])
			end
			if charData and charData.PlayerOwnClothes and charData.PlayerOwnClothes[partClass] then
				local id = tonumber(charData.PlayerOwnClothes[partClass])
				if id and id > 0 then return id end
			end

			local liveObj = (char and char:FindFirstChildOfClass(partClass))
				or (m2Char and m2Char:FindFirstChildOfClass(partClass))
				or (charData and charData.OldestClothings and charData.OldestClothings[partClass])
			if liveObj and liveObj[partClass .. "Template"] and liveObj[partClass .. "Template"] ~= "" then
				local id = tonumber(liveObj[partClass .. "Template"]:match("%d+"))
				if id and id > 0 then return id end
			end
			return nil
		end

		local saveOutfitConnect = GUIObject.saveOutfitButton.MouseButton1Click:Connect(function()
			if debounce == false then
				debounce = true
				local charData = PlayerData[SelectPlayer]
				if not charData then
					GUIObject.saveOutfitButton.Text = "No Player Selected!"
					task.delay(1.5, function()
						GUIObject.saveOutfitButton.Text = "Save Outfit (Clothing Preset)"
						debounce = false
					end)
					return
				end

				local rawName = GUIObject.outfitNameBox.Text
				local outfitName = rawName:match("^%s*(.-)%s*$")
				if not outfitName or outfitName == "" or outfitName == "Outfit Name (Type before saving)" then
					outfitName = "Custom Outfit " .. os.date("%H%M%S")
				end

				local targetPlr = PS:FindFirstChild(SelectPlayer) or Player
				local char = targetPlr and targetPlr.Character
				local m2Char = Method2CharacterFolder and Method2CharacterFolder:FindFirstChild(SelectPlayer)
				local desc = nil
				if targetPlr and targetPlr.UserId and targetPlr.UserId > 0 then
					pcall(function() desc = PS:GetHumanoidDescriptionFromUserId(targetPlr.UserId) end)
				end

				local shirtId = getClothesIdHelper(charData, "Shirt", desc, char, m2Char)
				local pantsId = getClothesIdHelper(charData, "Pants", desc, char, m2Char)

				local liveShirt = (char and char:FindFirstChildOfClass("Shirt"))
					or (m2Char and m2Char:FindFirstChildOfClass("Shirt"))
					or (charData and charData.OldestClothings and charData.OldestClothings["Shirt"])
				local livePants = (char and char:FindFirstChildOfClass("Pants"))
					or (m2Char and m2Char:FindFirstChildOfClass("Pants"))
					or (charData and charData.OldestClothings and charData.OldestClothings["Pants"])

				local liveShirtTemplate = (liveShirt and liveShirt.ShirtTemplate ~= "" and liveShirt.ShirtTemplate)
					or (charData and charData.PlayerOwnAvatar and charData.PlayerOwnAvatar.ShirtTemplate ~= "" and charData.PlayerOwnAvatar.ShirtTemplate)
					or (Function.CharacterClothesCache and Function.CharacterClothesCache[SelectPlayer] and Function.CharacterClothesCache[SelectPlayer].ShirtTemplate)
				local livePantsTemplate = (livePants and livePants.PantsTemplate ~= "" and livePants.PantsTemplate)
					or (charData and charData.PlayerOwnAvatar and charData.PlayerOwnAvatar.PantsTemplate ~= "" and charData.PlayerOwnAvatar.PantsTemplate)
					or (Function.CharacterClothesCache and Function.CharacterClothesCache[SelectPlayer] and Function.CharacterClothesCache[SelectPlayer].PantsTemplate)

				if not shirtId and liveShirtTemplate then
					shirtId = tonumber(liveShirtTemplate:match("%d+"))
				end
				if not pantsId and livePantsTemplate then
					pantsId = tonumber(livePantsTemplate:match("%d+"))
				end

				if Function.ClothesTemplateCache then
					if shirtId and liveShirtTemplate then
						Function.ClothesTemplateCache[shirtId] = liveShirtTemplate
						Function.ClothesTemplateCache[tostring(shirtId)] = liveShirtTemplate
					end
					if pantsId and livePantsTemplate then
						Function.ClothesTemplateCache[pantsId] = livePantsTemplate
						Function.ClothesTemplateCache[tostring(pantsId)] = livePantsTemplate
					end
				end
				if Function.CharacterClothesCache then
					Function.CharacterClothesCache[SelectPlayer] = {
						ShirtTemplate = liveShirtTemplate,
						PantsTemplate = livePantsTemplate,
						Shirt = shirtId,
						Pants = pantsId,
					}
				end

				-- Capture exact accessory positions, attachment CFrames, welds, mesh scales, and types
				local accessoryPositions = {}
				local accessoryTypes = {}
				local accessoryIds = {}

				if desc then
					pcall(function()
						local accProps = {
							HatAccessory = "HatAccessory",
							HairAccessory = "HairAccessory",
							FaceAccessory = "FaceAccessory",
							NeckAccessory = "NeckAccessory",
							ShouldersAccessory = "ShouldersAccessory",
							FrontAccessory = "FrontAccessory",
							BackAccessory = "BackAccessory",
							WaistAccessory = "WaistAccessory",
						}
						for prop, tName in pairs(accProps) do
							local val = desc[prop]
							if val and type(val) == "string" and val ~= "" then
								for idStr in string.gmatch(val, "%d+") do
									local nId = tonumber(idStr)
									if nId then
										accessoryTypes[tostring(nId)] = tName
										accessoryTypes[nId] = tName
										if not table.find(accessoryIds, nId) then
											table.insert(accessoryIds, nId)
										end
									end
								end
							end
						end
						local accList = desc:GetAccessories(true)
						if accList then
							for _, item in pairs(accList) do
								if item.AssetId and item.AccessoryType then
									local tName = item.AccessoryType.Name .. "Accessory"
									if item.AccessoryType == Enum.AccessoryType.Shoulder then
										tName = "ShouldersAccessory"
									end
									accessoryTypes[tostring(item.AssetId)] = tName
									accessoryTypes[item.AssetId] = tName
									if not table.find(accessoryIds, item.AssetId) then
										table.insert(accessoryIds, item.AssetId)
									end
								end
							end
						end
					end)
				end
				if charData.CatalogAccessory then
					for _, id in pairs(charData.CatalogAccessory) do
						local nid = tonumber(id)
						if nid and nid > 0 and not table.find(accessoryIds, nid) then
							table.insert(accessoryIds, nid)
						end
					end
				end

				local function scanAccPos(model)
					if not model then return end
					for _, acc in pairs(model:GetChildren()) do
						if acc:IsA("Accessory") then
							local aid = acc:GetAttribute("AssetId") or (acc:FindFirstChild("AssetId") and acc.AssetId.Value)
							if aid and tonumber(aid) then
								local numId = tonumber(aid)
								if acc.AccessoryType and acc.AccessoryType ~= Enum.AccessoryType.Unknown then
									local tName = acc.AccessoryType.Name .. "Accessory"
									if acc.AccessoryType == Enum.AccessoryType.Shoulder then
										tName = "ShouldersAccessory"
									end
									accessoryTypes[tostring(numId)] = tName
									accessoryTypes[numId] = tName
								end
							end

							local handle = acc:FindFirstChild("Handle") or acc:FindFirstChildOfClass("BasePart")
							if handle then
								local weld = handle:FindFirstChildOfClass("Weld") or handle:FindFirstChild("AccessoryWeld") or handle:FindFirstChildOfClass("Motor6D")
								local att = handle:FindFirstChildOfClass("Attachment")
								local sm = handle:FindFirstChildOfClass("SpecialMesh")
								local parentPart = weld and (weld.Part0 == handle and weld.Part1 or weld.Part0)
								if not parentPart and handle.Parent and handle.Parent.Parent then
									parentPart = handle.Parent.Parent:FindFirstChild("Head") or handle.Parent.Parent:FindFirstChild("Torso")
								end

								if not weld and parentPart then
									for _, ch in pairs(parentPart:GetChildren()) do
										if (ch:IsA("Weld") or ch:IsA("Motor6D")) and (ch.Part0 == handle or ch.Part1 == handle) then
											weld = ch
											break
										end
									end
								end

								local c0 = weld and (weld.Part0 == handle and weld.C0 or weld.C1)
								local c1 = weld and (weld.Part0 == handle and weld.C1 or weld.C0)

								if not c0 or not c1 then
									if att then
										c0 = att.CFrame
										local pAtt = parentPart and parentPart:FindFirstChild(att.Name)
										c1 = pAtt and pAtt.CFrame or CFrame.new()
									end
								end

								if parentPart and parentPart.Name == "Head" and c1 then
									local pAtt = parentPart:FindFirstChild(att and att.Name or "HairAttachment")
									local expectedY = (pAtt and pAtt.CFrame.Position.Y) or (att and AttachmentCFrame[att.Name] and AttachmentCFrame[att.Name].Position.Y) or 0.6
									if c1.Position.Y < expectedY - 0.15 then
										c1 = CFrame.new(c1.Position.X, expectedY, c1.Position.Z) * c1.Rotation
									end
								end

								local posData = {
									AttachmentName = att and att.Name,
									C0 = c0,
									C1 = c1,
									MeshScale = sm and sm.Scale,
									MeshOffset = sm and sm.Offset,
									HandleSize = handle.Size,
								}
								if not accessoryPositions[acc.Name] then
									accessoryPositions[acc.Name] = posData
								end
								local cleanName = acc.Name:gsub("RCTailCertified$", "")
								if cleanName ~= acc.Name and not accessoryPositions[cleanName] then
									accessoryPositions[cleanName] = posData
								end
								if aid and not accessoryPositions[tostring(aid)] then
									accessoryPositions[tostring(aid)] = posData
								end
								local mNum = nil
								if sm and sm.MeshId then
									mNum = tostring(sm.MeshId:match("%d+"))
								elseif handle:IsA("MeshPart") and handle.MeshId then
									mNum = tostring(handle.MeshId:match("%d+"))
								end
								if mNum and not accessoryPositions[mNum] then
									accessoryPositions[mNum] = posData
								end
								if att and att.Name and not accessoryPositions[att.Name] then
									accessoryPositions[att.Name] = posData
								end
							end
						end
					end
				end

				if m2Char then scanAccPos(m2Char) end
				if char then scanAccPos(char) end

				local clothingList = {}
				local clothesData = nil
				local hpClothesData = {}

				if saveClothesOption == "Boob Naked" then
					clothesData = {}
					if shirtId and shirtId > 0 then clothesData["Shirt"] = shirtId end
					if pantsId and pantsId > 0 then clothesData["Pants"] = pantsId end
					if liveShirtTemplate and liveShirtTemplate ~= "" then clothesData["ShirtTemplate"] = liveShirtTemplate end
					if livePantsTemplate and livePantsTemplate ~= "" then clothesData["PantsTemplate"] = livePantsTemplate end
					if next(clothesData) == nil and charData and charData.PlayerOwnClothes then
						if charData.PlayerOwnClothes.Shirt then clothesData["Shirt"] = charData.PlayerOwnClothes.Shirt end
						if charData.PlayerOwnClothes.Pants then clothesData["Pants"] = charData.PlayerOwnClothes.Pants end
					end
					if next(clothesData) == nil then clothesData = nil end

					table.insert(clothingList, "Roblox Shirt")
					table.insert(clothingList, "Roblox Butt Shirt")
					table.insert(clothingList, "Roblox Pants")

					hpClothesData = {
						["Roblox Butt Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
						["Roblox Pants"] = { ["HP"] = "BottomHP", ["Inverse"] = false },
						["Roblox Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
					}
				elseif saveClothesOption == "Clothed" then
					clothesData = {}
					if shirtId and shirtId > 0 then clothesData["Shirt"] = shirtId end
					if pantsId and pantsId > 0 then clothesData["Pants"] = pantsId end
					if liveShirtTemplate and liveShirtTemplate ~= "" then clothesData["ShirtTemplate"] = liveShirtTemplate end
					if livePantsTemplate and livePantsTemplate ~= "" then clothesData["PantsTemplate"] = livePantsTemplate end
					if next(clothesData) == nil and charData and charData.PlayerOwnClothes then
						if charData.PlayerOwnClothes.Shirt then clothesData["Shirt"] = charData.PlayerOwnClothes.Shirt end
						if charData.PlayerOwnClothes.Pants then clothesData["Pants"] = charData.PlayerOwnClothes.Pants end
					end
					if next(clothesData) == nil then clothesData = nil end

					table.insert(clothingList, "Roblox Shirt")
					table.insert(clothingList, "Roblox Butt Shirt")
					table.insert(clothingList, "Roblox Pants")
					table.insert(clothingList, "Roblox Breasts Clothing")

					hpClothesData = {
						["Roblox Butt Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
						["Roblox Pants"] = { ["HP"] = "BottomHP", ["Inverse"] = false },
						["Roblox Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
					}
				elseif saveClothesOption == "Naked" then
					clothesData = nil
					hpClothesData = {}
				end

				-- Preserve only non-Roblox items (e.g. piercings, womb marks, tattoos):
				if charData.CurrentClothes then
					for _, cName in ipairs(charData.CurrentClothes) do
						if not table.find(robloxClothingItems, cName) and not table.find(clothingList, cName) then
							table.insert(clothingList, cName)
						end
					end
				end

				local activeNippleCol = charData.NippleColor
				if not activeNippleCol and charData.CurrentPartList and charData.CurrentPartList["Organ"] then
					local nip = charData.CurrentPartList["Organ"]["Left Nipple"] or charData.CurrentPartList["Organ"]["Right Nipple"]
					if nip and nip:IsA("BasePart") then
						activeNippleCol = nip.Color
					end
				end
				if not activeNippleCol and Bundle[charData.CurrentBundle] and Bundle[charData.CurrentBundle]["NippleColor"] then
					activeNippleCol = Bundle[charData.CurrentBundle]["NippleColor"]
				end
				if activeNippleCol then
					if typeof(activeNippleCol) == "table" and activeNippleCol.R and activeNippleCol.G and activeNippleCol.B then
						activeNippleCol = Color3.new(activeNippleCol.R, activeNippleCol.G, activeNippleCol.B)
					end
				end

				local newBundle = {
					["ClothingBundle"] = true,
					["Clothing"] = clothingList,
					["Clothes"] = clothesData,
					["ClearClothing"] = true,
					["Accessory"] = accessoryIds,
					["AccessoryPositions"] = accessoryPositions,
					["AccessoryTypes"] = accessoryTypes,
					["Preset"] = {
						Tone = activeNippleCol and "Use NippleColor" or charData.Tone or "Base",
						NippleColor = activeNippleCol,
						SkinTone = charData.SkinTone,
						Face = charData.Face,
						MeshSizeLock = charData.MeshSizeLock,
						AccessorySizeLock = charData.AccessorySizeLock,
						MeshBasePartInvisible = charData.MeshBasePartInvisible,
						BodyPartPhysics = charData.BodyPartPhysics,
						PhysicsObeyGravity = charData.PhysicsObeyGravity,
						RealtimeBodyTransparency = charData.RealtimeBodyTransparency,
						PositionPhysicsMultiply = PositionPhysicsMultiply,
						RotationPhysicsMultiply = RotationPhysicsMultiply,
						CockScale = charData.CockScale,
						BreastsScale = charData.BreastsScale,
						ButtsScale = charData.ButtsScale,
						LegsScale = charData.LegsScale,
						BreastsType = charData.BreastsType,
						TorsoType = charData.TorsoType,
						ArmType = charData.ArmType,
						LegsType = charData.LegsType,
						ButtType = charData.ButtType,
						HardcoreHP = (charData.HardcoreHP == true),
						TopHP = charData.TopHP,
						BottomHP = charData.BottomHP,
						DamageSFX = charData.DamageSFX,
						Volume = charData.Volume,
						DelayTime = charData.DelayTime,
						HealParticles = (charData.HealParticles ~= false),
						DamageParticles = (charData.DamageParticles ~= false),
						FPerson = (charData.FPerson == true),
						FPsnap = (charData.FPsnap == true),
						HeadTracking = (charData.HeadTracking ~= false),
						isTailCurrentlyEnabled = (charData.isTailCurrentlyEnabled ~= false),
						tailSettings = charData.tailSettings,
						LocalTransparency = charData.LocalTransparency,
					}
				}

				if activeNippleCol then
					newBundle["NippleColor"] = activeNippleCol
				end

				if charData.ClothesRecolor then
					local hasRecolor = false
					local recolorTable = {}
					for cName, colors in pairs(charData.ClothesRecolor) do
						if typeof(colors) == "table" then
							local validChannels = {}
							for channel, col in pairs(colors) do
								if col ~= "nil" and col ~= nil then
									validChannels[channel] = col
								end
							end
							if next(validChannels) then
								hasRecolor = true
								recolorTable[cName] = validChannels
							end
						end
					end
					if hasRecolor then
						newBundle["Recolor"] = recolorTable
					end
				end

				if next(hpClothesData) then
					newBundle["HPClothes"] = hpClothesData
				elseif charData.ClothesHP and next(charData.ClothesHP) then
					newBundle["HPClothes"] = {}
					for cName, hpData in pairs(charData.ClothesHP) do
						newBundle["HPClothes"][cName] = hpData
					end
				end

				registerBundleButton(outfitName, newBundle)

				if env.writefile then
					pcall(function()
						local function sanitize(str)
							for _, char in ipairs({"/", "<", ">", "?", "*", "|", " ", "\\", '"', ":"}) do
								str = string.gsub(str, char, "_")
							end
							return str
						end
						local t = {}
						local function transferTable(n, isTable)
							local newTable = {}
							for i, v in pairs(n) do
								if isTable then
									if typeof(v) == "table" then
										newTable[i] = transferTable(v, true)
									else
										newTable[i] = v
									end
								else
									if typeof(v) == "table" then
										t[i] = transferTable(v, true)
									else
										t[i] = v
									end
								end
							end
							return newTable
						end
						transferTable(newBundle)
						local function convertTable(inp)
							for i, v in pairs(inp) do
								if typeof(v) == "table" then
									convertTable(v)
								else
									inp[i] = Function.convertToJSON(v)
								end
							end
						end
						convertTable(t)
						t["BundleName"] = outfitName
						env.writefile("RClothesLerp/Bundles/"..sanitize(outfitName)..".json", HS:JSONEncode(t))
						Function.compileOvertime()
					end)
				end

				local exportString = toBundleFormat(newBundle, outfitName)
				pcall(function()
					if env.copy then
						env.copy(exportString)
					end
				end)

				GUIObject.saveOutfitButton.Text = "Saved & Copied: " .. outfitName
				task.delay(2, function()
					GUIObject.saveOutfitButton.Text = "Save Outfit (Clothing Preset)"
					debounce = false
				end)
			end
		end)

		local saveFullOutfitConnect = GUIObject.saveFullOutfitButton.MouseButton1Click:Connect(function()
			if debounce == false then
				debounce = true
				local charData = PlayerData[SelectPlayer]
				if not charData then
					GUIObject.saveFullOutfitButton.Text = "No Player Selected!"
					task.delay(1.5, function()
						GUIObject.saveFullOutfitButton.Text = "Save Outfit (Full Avatar)"
						debounce = false
					end)
					return
				end

				local rawName = GUIObject.outfitNameBox.Text
				local outfitName = rawName:match("^%s*(.-)%s*$")
				if not outfitName or outfitName == "" or outfitName == "Outfit Name (Type before saving)" then
					outfitName = "Avatar Outfit " .. os.date("%H%M%S")
				end

				local targetPlayer = PS:FindFirstChild(SelectPlayer) or Player
				local char = targetPlayer and targetPlayer.Character
				local humanoid = char and char:FindFirstChildOfClass("Humanoid")
				local bodyColors = char and char:FindFirstChildOfClass("BodyColors")
				local m2Char = Method2CharacterFolder and Method2CharacterFolder:FindFirstChild(SelectPlayer)

				-- Obtain description safely: try applied description first, then UserId fallback
				local desc = nil
				pcall(function()
					if humanoid then
						desc = humanoid:GetAppliedDescription()
					end
				end)
				if not desc and targetPlayer and targetPlayer.UserId and targetPlayer.UserId > 0 then
					pcall(function()
						desc = PS:GetHumanoidDescriptionFromUserId(targetPlayer.UserId)
					end)
				end

				-- Capture full Roblox character body colors with robust priority
				local defSkin = Color3.fromRGB(255, 204, 153)
				local function resolveColor(partName, bcProp)
					if charData and charData.SkinTone then
						return charData.SkinTone
					end
					if charData and charData.PartList and charData.PartList[partName] and charData.PartList[partName].Color then
						local plCol = charData.PartList[partName].Color.Color
						if typeof(plCol) == "Color3" then
							return plCol
						end
					end
					if charData and charData.CurrentPartList and charData.CurrentPartList["Organ"] and charData.CurrentPartList["Organ"][partName] then
						local organ = charData.CurrentPartList["Organ"][partName]
						if organ and organ:IsA("BasePart") then
							return organ.Color
						end
					end
					if m2Char and m2Char:FindFirstChild(partName) and m2Char[partName]:IsA("BasePart") then
						return m2Char[partName].Color
					end
					if char then
						local p = char:FindFirstChild(partName) or (partName == "Torso" and char:FindFirstChild("UpperTorso"))
						if p and p:IsA("BasePart") then
							return p.Color
						end
					end
					if bodyColors and bodyColors[bcProp] then
						return bodyColors[bcProp]
					end
					if desc then
						local descProp = bcProp:gsub("3$", "")
						local ok, val = pcall(function() return desc[descProp] end)
						if ok and typeof(val) == "Color3" then
							return val
						end
					end
					return defSkin
				end

				local bodyColorsData = {
					["HeadColor3"] = resolveColor("Head", "HeadColor3"),
					["TorsoColor3"] = resolveColor("Torso", "TorsoColor3"),
					["LeftArmColor3"] = resolveColor("Left Arm", "LeftArmColor3"),
					["RightArmColor3"] = resolveColor("Right Arm", "RightArmColor3"),
					["LeftLegColor3"] = resolveColor("Left Leg", "LeftLegColor3"),
					["RightLegColor3"] = resolveColor("Right Leg", "RightLegColor3"),
				}

				-- Capture genuine accessory catalog asset IDs (NOT mesh IDs!)
				local accessoryIds = {}
				local accessoryProps = {
					"HatAccessory", "HairAccessory", "FaceAccessory", "ShouldersAccessory",
					"NeckAccessory", "FrontAccessory", "BackAccessory", "WaistAccessory"
				}
				if desc then
					pcall(function()
						local accList = desc:GetAccessories(true)
						if accList then
							for _, acc in ipairs(accList) do
								local aid = tonumber(acc.AssetId)
								if aid and aid > 0 and not table.find(accessoryIds, aid) then
									table.insert(accessoryIds, aid)
								end
							end
						end
					end)
					for _, prop in ipairs(accessoryProps) do
						local ok, val = pcall(function() return desc[prop] end)
						if ok and typeof(val) == "string" then
							for id in val:gmatch("%d+") do
								local nid = tonumber(id)
								if nid and nid > 0 and not table.find(accessoryIds, nid) then
									table.insert(accessoryIds, nid)
								end
							end
						end
					end
				end
				if charData.CatalogAccessory then
					for _, id in pairs(charData.CatalogAccessory) do
						local nid = tonumber(id)
						if nid and nid > 0 and not table.find(accessoryIds, nid) then
							table.insert(accessoryIds, nid)
						end
					end
				end
				if char then
					for _, acc in pairs(char:GetChildren()) do
						if acc:IsA("Accessory") and not acc:HasTag("RoClothes") then
							local aid = acc:GetAttribute("AssetId") or (acc:FindFirstChild("AssetId") and acc.AssetId.Value)
							if aid and tonumber(aid) and tonumber(aid) > 0 and not table.find(accessoryIds, tonumber(aid)) then
								table.insert(accessoryIds, tonumber(aid))
							end
						end
					end
				end

				local shirtId = getClothesIdHelper(charData, "Shirt", desc, char, m2Char)
				local pantsId = getClothesIdHelper(charData, "Pants", desc, char, m2Char)

				-- Capture exact accessory positions, attachment CFrames, welds, mesh scales, and types
				local accessoryPositions = {}
				local accessoryTypes = {}

				if desc then
					pcall(function()
						local accProps = {
							HatAccessory = "HatAccessory",
							HairAccessory = "HairAccessory",
							FaceAccessory = "FaceAccessory",
							NeckAccessory = "NeckAccessory",
							ShouldersAccessory = "ShouldersAccessory",
							FrontAccessory = "FrontAccessory",
							BackAccessory = "BackAccessory",
							WaistAccessory = "WaistAccessory",
						}
						for prop, tName in pairs(accProps) do
							local val = desc[prop]
							if val and type(val) == "string" and val ~= "" then
								for idStr in string.gmatch(val, "%d+") do
									local nId = tonumber(idStr)
									if nId then
										accessoryTypes[tostring(nId)] = tName
										accessoryTypes[nId] = tName
									end
								end
							end
						end
						local accList = desc:GetAccessories(true)
						if accList then
							for _, item in pairs(accList) do
								if item.AssetId and item.AccessoryType then
									local tName = item.AccessoryType.Name .. "Accessory"
									if item.AccessoryType == Enum.AccessoryType.Shoulder then
										tName = "ShouldersAccessory"
									end
									accessoryTypes[tostring(item.AssetId)] = tName
									accessoryTypes[item.AssetId] = tName
								end
							end
						end
					end)
				end

				local function scanAccPos(model)
					if not model then return end
					for _, acc in pairs(model:GetChildren()) do
						if acc:IsA("Accessory") then
							local aid = acc:GetAttribute("AssetId") or (acc:FindFirstChild("AssetId") and acc.AssetId.Value)
							if aid and tonumber(aid) then
								local numId = tonumber(aid)
								if acc.AccessoryType and acc.AccessoryType ~= Enum.AccessoryType.Unknown then
									local tName = acc.AccessoryType.Name .. "Accessory"
									if acc.AccessoryType == Enum.AccessoryType.Shoulder then
										tName = "ShouldersAccessory"
									end
									accessoryTypes[tostring(numId)] = tName
									accessoryTypes[numId] = tName
								end
							end

							local handle = acc:FindFirstChild("Handle") or acc:FindFirstChildOfClass("BasePart")
							if handle then
								local weld = handle:FindFirstChildOfClass("Weld") or handle:FindFirstChild("AccessoryWeld") or handle:FindFirstChildOfClass("Motor6D")
								local att = handle:FindFirstChildOfClass("Attachment")
								local sm = handle:FindFirstChildOfClass("SpecialMesh")
								local parentPart = weld and (weld.Part0 == handle and weld.Part1 or weld.Part0)
								if not parentPart and handle.Parent and handle.Parent.Parent then
									parentPart = handle.Parent.Parent:FindFirstChild("Head") or handle.Parent.Parent:FindFirstChild("Torso")
								end

								if not weld and parentPart then
									for _, ch in pairs(parentPart:GetChildren()) do
										if (ch:IsA("Weld") or ch:IsA("Motor6D")) and (ch.Part0 == handle or ch.Part1 == handle) then
											weld = ch
											break
										end
									end
								end

								local c0 = weld and (weld.Part0 == handle and weld.C0 or weld.C1)
								local c1 = weld and (weld.Part0 == handle and weld.C1 or weld.C0)

								if not c0 or not c1 then
									if att then
										c0 = att.CFrame
										local pAtt = parentPart and parentPart:FindFirstChild(att.Name)
										c1 = pAtt and pAtt.CFrame or CFrame.new()
									end
								end

								if parentPart and parentPart.Name == "Head" and c1 then
									local pAtt = parentPart:FindFirstChild(att and att.Name or "HairAttachment")
									local expectedY = (pAtt and pAtt.CFrame.Position.Y) or (att and AttachmentCFrame[att.Name] and AttachmentCFrame[att.Name].Position.Y) or 0.6
									if c1.Position.Y < expectedY - 0.15 then
										c1 = CFrame.new(c1.Position.X, expectedY, c1.Position.Z) * c1.Rotation
									end
								end

								local posData = {
									AttachmentName = att and att.Name,
									C0 = c0,
									C1 = c1,
									MeshScale = sm and sm.Scale,
									MeshOffset = sm and sm.Offset,
									HandleSize = handle.Size,
								}
								if not accessoryPositions[acc.Name] then
									accessoryPositions[acc.Name] = posData
								end
								local cleanName = acc.Name:gsub("RCTailCertified$", "")
								if cleanName ~= acc.Name and not accessoryPositions[cleanName] then
									accessoryPositions[cleanName] = posData
								end
								if aid and not accessoryPositions[tostring(aid)] then
									accessoryPositions[tostring(aid)] = posData
								end
								-- Unique mesh ID indexing (guaranteed to match without name confusion):
								local mNum = nil
								if sm and sm.MeshId then
									mNum = tostring(sm.MeshId:match("%d+"))
								elseif handle:IsA("MeshPart") and handle.MeshId then
									mNum = tostring(handle.MeshId:match("%d+"))
								end
								if mNum and not accessoryPositions[mNum] then
									accessoryPositions[mNum] = posData
								end
								if att and att.Name and not accessoryPositions[att.Name] then
									accessoryPositions[att.Name] = posData
								end
							end
						end
					end
				end

				-- Scan Method 2 model first (active RoCC accessories), then base character (only for uncaptured items)
				if m2Char then
					scanAccPos(m2Char)
				end
				if char then
					scanAccPos(char)
				end

				local liveShirt = (char and char:FindFirstChildOfClass("Shirt"))
					or (m2Char and m2Char:FindFirstChildOfClass("Shirt"))
					or (charData and charData.OldestClothings and charData.OldestClothings["Shirt"])
				local livePants = (char and char:FindFirstChildOfClass("Pants"))
					or (m2Char and m2Char:FindFirstChildOfClass("Pants"))
					or (charData and charData.OldestClothings and charData.OldestClothings["Pants"])

				local liveShirtTemplate = (liveShirt and liveShirt.ShirtTemplate ~= "" and liveShirt.ShirtTemplate)
					or (charData and charData.PlayerOwnAvatar and charData.PlayerOwnAvatar.ShirtTemplate ~= "" and charData.PlayerOwnAvatar.ShirtTemplate)
					or (Function.CharacterClothesCache and Function.CharacterClothesCache[SelectPlayer] and Function.CharacterClothesCache[SelectPlayer].ShirtTemplate)
				local livePantsTemplate = (livePants and livePants.PantsTemplate ~= "" and livePants.PantsTemplate)
					or (charData and charData.PlayerOwnAvatar and charData.PlayerOwnAvatar.PantsTemplate ~= "" and charData.PlayerOwnAvatar.PantsTemplate)
					or (Function.CharacterClothesCache and Function.CharacterClothesCache[SelectPlayer] and Function.CharacterClothesCache[SelectPlayer].PantsTemplate)

				if not shirtId and liveShirtTemplate then
					shirtId = tonumber(liveShirtTemplate:match("%d+"))
				end
				if not pantsId and livePantsTemplate then
					pantsId = tonumber(livePantsTemplate:match("%d+"))
				end

				if Function.ClothesTemplateCache then
					if shirtId and liveShirtTemplate then
						Function.ClothesTemplateCache[shirtId] = liveShirtTemplate
						Function.ClothesTemplateCache[tostring(shirtId)] = liveShirtTemplate
					end
					if pantsId and livePantsTemplate then
						Function.ClothesTemplateCache[pantsId] = livePantsTemplate
						Function.ClothesTemplateCache[tostring(pantsId)] = livePantsTemplate
					end
				end
				if Function.CharacterClothesCache then
					Function.CharacterClothesCache[SelectPlayer] = {
						ShirtTemplate = liveShirtTemplate,
						PantsTemplate = livePantsTemplate,
						Shirt = shirtId,
						Pants = pantsId,
					}
				end

				local clothesData = nil
				local clothingList = {}

				local hpClothesData = {}
				if saveClothesOption == "Boob Naked" then
					clothesData = {}
					if shirtId and shirtId > 0 then clothesData["Shirt"] = shirtId end
					if pantsId and pantsId > 0 then clothesData["Pants"] = pantsId end
					if liveShirtTemplate and liveShirtTemplate ~= "" then clothesData["ShirtTemplate"] = liveShirtTemplate end
					if livePantsTemplate and livePantsTemplate ~= "" then clothesData["PantsTemplate"] = livePantsTemplate end
					if next(clothesData) == nil and charData and charData.PlayerOwnClothes then
						if charData.PlayerOwnClothes.Shirt then clothesData["Shirt"] = charData.PlayerOwnClothes.Shirt end
						if charData.PlayerOwnClothes.Pants then clothesData["Pants"] = charData.PlayerOwnClothes.Pants end
					end
					if next(clothesData) == nil then clothesData = nil end

					table.insert(clothingList, "Roblox Shirt")
					table.insert(clothingList, "Roblox Butt Shirt")
					table.insert(clothingList, "Roblox Pants")

					hpClothesData = {
						["Roblox Butt Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
						["Roblox Pants"] = { ["HP"] = "BottomHP", ["Inverse"] = false },
						["Roblox Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
					}
				elseif saveClothesOption == "Clothed" then
					clothesData = {}
					if shirtId and shirtId > 0 then clothesData["Shirt"] = shirtId end
					if pantsId and pantsId > 0 then clothesData["Pants"] = pantsId end
					if liveShirtTemplate and liveShirtTemplate ~= "" then clothesData["ShirtTemplate"] = liveShirtTemplate end
					if livePantsTemplate and livePantsTemplate ~= "" then clothesData["PantsTemplate"] = livePantsTemplate end
					if next(clothesData) == nil and charData and charData.PlayerOwnClothes then
						if charData.PlayerOwnClothes.Shirt then clothesData["Shirt"] = charData.PlayerOwnClothes.Shirt end
						if charData.PlayerOwnClothes.Pants then clothesData["Pants"] = charData.PlayerOwnClothes.Pants end
					end
					if next(clothesData) == nil then clothesData = nil end

					table.insert(clothingList, "Roblox Shirt")
					table.insert(clothingList, "Roblox Butt Shirt")
					table.insert(clothingList, "Roblox Pants")
					table.insert(clothingList, "Roblox Breasts Clothing")

					hpClothesData = {
						["Roblox Butt Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
						["Roblox Pants"] = { ["HP"] = "BottomHP", ["Inverse"] = false },
						["Roblox Shirt"] = { ["HP"] = "TopHP", ["Inverse"] = false },
					}
				elseif saveClothesOption == "Naked" then
					clothesData = nil
					hpClothesData = {}
				end

				-- Preserve only non-Roblox items (e.g. piercings, womb marks, tattoos):
				if charData.CurrentClothes then
					for _, item in pairs(charData.CurrentClothes) do
						if not table.find(robloxClothingItems, item) and not table.find(clothingList, item) then
							table.insert(clothingList, item)
						end
					end
				end

				local newBundle = {
					["BundleName"] = outfitName,
					["ClearClothing"] = true,
					["Body Color"] = bodyColorsData,
					["Accessory"] = accessoryIds,
					["AccessoryPositions"] = accessoryPositions,
					["AccessoryTypes"] = accessoryTypes,
					["Clothes"] = clothesData,
					["Clothing"] = clothingList,
					["HPClothes"] = hpClothesData,
					["Preset"] = {
						Tone = charData.Tone or "Base",
						SkinTone = charData.SkinTone,
						Face = charData.Face,
						MeshSizeLock = charData.MeshSizeLock,
						AccessorySizeLock = (charData.AccessorySizeLock == true),
						MeshBasePartInvisible = charData.MeshBasePartInvisible,
						BodyPartPhysics = charData.BodyPartPhysics,
						PhysicsObeyGravity = charData.PhysicsObeyGravity,
						RealtimeBodyTransparency = charData.RealtimeBodyTransparency,
						PositionPhysicsMultiply = PositionPhysicsMultiply,
						RotationPhysicsMultiply = RotationPhysicsMultiply,
						BreastsScale = charData.BreastsScale,
						ButtsScale = charData.ButtsScale,
						LegsScale = charData.LegsScale,
						BreastsType = charData.BreastsType,
						TorsoType = charData.TorsoType,
						ArmType = charData.ArmType,
						LegsType = charData.LegsType,
						ButtType = charData.ButtType,
						CockScale = charData.CockScale,
						HardcoreHP = charData.HardcoreHP,
						TopHP = charData.TopHP,
						BottomHP = charData.BottomHP,
						DamageSFX = charData.DamageSFX,
						Volume = charData.Volume,
						DelayTime = charData.DelayTime,
						HealParticles = (charData.HealParticles ~= false),
						DamageParticles = (charData.DamageParticles ~= false),
						FPerson = (charData.FPerson == true),
						FPsnap = (charData.FPsnap == true),
						HeadTracking = (charData.HeadTracking ~= false),
						isTailCurrentlyEnabled = (charData.isTailCurrentlyEnabled ~= false),
						tailSettings = charData.tailSettings,
						LocalTransparency = charData.LocalTransparency,
					}
				}

				local activeNippleCol = charData.NippleColor
				if not activeNippleCol and charData.CurrentPartList and charData.CurrentPartList["Organ"] then
					local nip = charData.CurrentPartList["Organ"]["Left Nipple"] or charData.CurrentPartList["Organ"]["Right Nipple"]
					if nip and nip:IsA("BasePart") then
						activeNippleCol = nip.Color
					end
				end
				if not activeNippleCol and Bundle[charData.CurrentBundle] and Bundle[charData.CurrentBundle]["NippleColor"] then
					activeNippleCol = Bundle[charData.CurrentBundle]["NippleColor"]
				end
				if activeNippleCol then
					if typeof(activeNippleCol) == "table" and activeNippleCol.R and activeNippleCol.G and activeNippleCol.B then
						activeNippleCol = Color3.new(activeNippleCol.R, activeNippleCol.G, activeNippleCol.B)
					end
					newBundle["NippleColor"] = activeNippleCol
					newBundle["Preset"].NippleColor = activeNippleCol
					newBundle["Preset"].Tone = "Use NippleColor"
				end

				if charData.CatalogTail and #charData.CatalogTail > 0 then
					newBundle["TailAccessory"] = charData.CatalogTail
				end

-- 3D clothing items merged above into clothingList

				-- Recolors
				if charData.ClothesRecolor then
					local hasRecolor = false
					local recolorTable = {}
					for k, v in pairs(charData.ClothesRecolor) do
						if typeof(v) == "table" then
							local validChannels = {}
							for channel, col in pairs(v) do
								if col ~= "nil" and col ~= nil then
									validChannels[channel] = col
								end
							end
							if next(validChannels) then
								hasRecolor = true
								recolorTable[k] = validChannels
							end
						end
					end
					if hasRecolor then
						newBundle["Recolor"] = recolorTable
					end
				end

				-- HP / tears
				if charData.ClothesHP then
					local hasHP = false
					local hpTable = {}
					for k, v in pairs(charData.ClothesHP) do
						hasHP = true
						hpTable[k] = v
					end
					if hasHP then
						newBundle["HPClothes"] = hpTable
					end
				end

				-- Capture MeshEdit / customized part positions and attachment offsets
				if charData.PartList then
					local defaultPL = Function.PartListDefault()
					local meshEdit = {}
					local hasMeshEdit = false
					for pName, pData in pairs(charData.PartList) do
						local defPart = defaultPL[pName]
						if defPart then
							local diffs = {}
							for propName, propVal in pairs(pData) do
								if propName ~= "Part" and propName ~= "Instance" and propName ~= "Weld" then
									if propName == "Color" then
										-- Only record Color diff if genuinely overridden to a custom Color3:
										if typeof(propVal) == "table" and typeof(defPart["Color"]) == "table" then
											if propVal.Color ~= defPart["Color"].Color and propVal.Color ~= "Parent" then
												diffs[propName] = propVal.Color
											end
										end
									else
										if defPart[propName] ~= propVal then
											diffs[propName] = propVal
										end
									end
								end
							end
							if next(diffs) then
								meshEdit[pName] = diffs
								hasMeshEdit = true
							end
						end
					end
					if hasMeshEdit then
						newBundle["MeshEdit"] = meshEdit
					end
				end

				-- Write to disk in exploit workspace with deep JSON conversion
				if env.writefile then
					pcall(function()
						if env.isfolder and not env.isfolder("RClothesLerp") then
							env.makefolder("RClothesLerp")
						end
						if env.isfolder and not env.isfolder("RClothesLerp/Bundles") then
							env.makefolder("RClothesLerp/Bundles")
						end
						local function deepToJSON(t)
							local res = {}
							for k, v in pairs(t) do
								if typeof(v) == "table" then
									res[k] = deepToJSON(v)
								else
									res[k] = Function.convertToJSON(v)
								end
							end
							return res
						end
						local jsonBundle = deepToJSON(newBundle)
						jsonBundle["BundleName"] = outfitName
						local function sanitize(str)
							for _, char in ipairs({"/", "<", ">", "?", "*", "|", " ", "\\", '"', ":"}) do
								str = string.gsub(str, char, "_")
							end
							return str
						end
						env.writefile("RClothesLerp/Bundles/" .. sanitize(outfitName) .. ".json", HS:JSONEncode(jsonBundle))
						Function.compileOvertime()
					end)
				end

				registerBundleButton(outfitName, newBundle)

				-- Copy formatted Luau bundle table to clipboard
				pcall(function()
					local exportString = toBundleFormat(newBundle, outfitName)
					if env.copy then
						env.copy(exportString)
					end
				end)

				GUIObject.saveFullOutfitButton.Text = "Saved Avatar: " .. outfitName
				task.delay(2, function()
					GUIObject.saveFullOutfitButton.Text = "Save Outfit (Full Avatar)"
					debounce = false
				end)
			end
		end)
		--[[local loadupBundleConnect = GUIObject.bundleLoadBox:GetPropertyChangedSignal("Text"):Connect(function()
			local Text = GUIObject.bundleLoadBox.Text

			if Bundle[Text] then
				GUIObject.bundleLoadBox.TextColor3 = Color3.new(1, 1, 1)
				loadupBundle = Text
			else
				GUIObject.bundleLoadBox.TextColor3 = Color3.new(1, 0, 0)
				loadupBundle = Text
			end
			Function.GUIUpdate()
		end)
		
		local loadupBundleEnterConnect = GUIObject.bundleLoadBox.FocusLost:Connect(function()
			local Text = GUIObject.bundleLoadBox.Text
			
			if Bundle[Text] then
				GUIObject.bundleLoadBox.TextColor3 = Color3.new(1, 1, 1)
			else
				if Text ~= "" then
					for i, v in pairs(Bundle) do
						if string.find(string.lower(i), string.lower(Text)) then
							loadupBundle = i
							GUIObject.bundleLoadBox.Text = i
							GUIObject.bundleLoadBox.TextColor3 = Color3.new(1, 1, 1)
							break
						end
					end
				end

				if not Bundle[loadupBundle] then
					GUIObject.bundleLoadBox.TextColor3 = Color3.new(1,0,0)
					loadupBundle = ""
				end
			end
			Function.GUIUpdate()
		end)]]

		local debounce = false
		local saveConnect = GUIObject.saveButton.MouseButton1Click:Connect(function()
			if debounce == false then
				debounce = true
				Function.SaveSettings(true)
				task.delay(1, function()
					debounce = false
				end)
			end
		end)

		local debounce = false
		local importConnect = GUIObject.importBundleBox.FocusLost:Connect(function()
			local Text = GUIObject.importBundleBox.Text
			if Text ~= "" then
				if debounce == false then
					debounce = true
					local success, ouput = pcall(function()
						return loadstring(Text)()
					end)
					if not success then
						local reFormat = "local import = {".. Text .."} return import"
						success, ouput = pcall(function()
							return loadstring(reFormat)()
						end)
					end
					if success then
						local function sanitize(str)
							for _, char in ipairs({"/", "<", ">", "?", "*", "|", "\ ","\\",'"', ":"}) do
								str = string.gsub(str, char, "_")
							end
							return str
						end
						
						local allBundlesSuccess = true
						local s, ouput = pcall(function()
							for name, input in pairs(ouput) do
								-- error checker --
								local invalidBundle = false
								local function bWarn(reason)
									if invalidBundle == false then
										invalidBundle = true
										warn("----------------------------------------------------------")
									end
									warn(reason)
								end
								if input["Clothing"] then
									for i, v in pairs(input["Clothing"]) do
										if not Clothes[v] then
											bWarn(name.. ": Could not find "..tostring(v).." as Clothing.")
										end
									end
								end
								if input["Recolor"] then
									for i, v in pairs(input["Recolor"]) do
										if Clothes[i] then
											for cType, color in pairs(v) do
												if cType ~= "Primary" and cType ~= "Secondary" and cType ~= "Tertiary" then
													bWarn(name.. ": "..tostring(cType).." is not a valid color type.")
												end
											end
										else
											bWarn(name.. ": Recolor could not find "..tostring(i).." as Clothing.")
										end
									end
								end
								if input["MeshEdit"] then
									for i, v in pairs(input["MeshEdit"]) do
										if Function.PartListDefault()[i] then
											for property, value in pairs(v) do
												if not MetaClothes.__index[property] then
													bWarn(name.. ": "..tostring(property).." is not a valid property.")
												end
											end
										else
											bWarn(name.. ": MeshEdit does not register "..tostring(i).." as a valid part.")
										end
									end
								end
								if input["HPClothes"] then
									for i, v in pairs(input["HPClothes"]) do
										if Clothes[i] then
											for property, value in pairs(v) do
												if property ~= "HP" and property ~= "Inverse" then
													bWarn(name.. ": "..tostring(property).." isn't registered. Make sure to use HP or Inverse only.")
												elseif property == "HP" and value ~= "TopHP" and value ~= "BottomHP" then
													print("No such thing as "..tostring(value).." for HP. Layered HP is not supported yet! This function will be treated as nil.")
												end
											end
										else
											bWarn(name.. ": HPClothes could not find "..tostring(i).." as Clothing.")
										end
									end
								end

								if invalidBundle == true then
									allBundlesSuccess = false
									warn("⚠️ Bundle "..name.." has been aborted! ⚠️")
									continue
								end
								registerBundleButton(name, input)
								table.sort(BundleButtons, function(a,b)
									return a.Name:lower() < b.Name:lower()
								end)
								table.sort(ClothesButtons, function(a,b)
									return a.Name < b.Name
								end)
								for i, v in pairs(BundleButtons) do
									local extraorder = 0
									if Bundle[v.Name].ClothingBundle and Bundle[v.Name].ClothingBundle == true then
										extraorder = -999
									elseif Bundle[v.Name].IsPreset and Bundle[v.Name].IsPreset == true then
										extraorder = -999999
									end
									v.LayoutOrder = i+extraorder
								end
								for i, v in pairs(ClothesButtons) do
									v.LayoutOrder = i
								end

								if env.writefile then
									local t = {}
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
													t[i] = transferTable(v,true)
												else
													t[i] = v
												end
											end
										end
										return newTable
									end
									transferTable(input)
									local function convertTable(inp)
										for i, v in pairs(inp) do
											if typeof(v) == "table" then
												convertTable(v)
											else
												inp[i] = Function.convertToJSON(v)
											end
										end
									end
									convertTable(t)
									t["BundleName"] = name
									local fileConvertedName = sanitize(name)
									env.writefile("RClothesLerp/Bundles/"..fileConvertedName..".json", HS:JSONEncode(t))

									Function.compileOvertime()

								end
							end
						end)
						if s then
							if allBundlesSuccess then
								GUIObject.importBundleBox.Text = "Bundle(s) were imported!"
							else
								GUIObject.importBundleBox.Text = "Errors were found. Check Developer Console for list of errors."
							end
						else
							GUIObject.importBundleBox.Text = ouput
						end
					else
						GUIObject.importBundleBox.Text = ouput
						warn(ouput)
					end
					task.wait(1)
					debounce = false
				else
					GUIObject.importBundleBox.Text = "Please wait before importing again!"
				end
			end
		end)

		table.insert(AllConnect, ExecuteConnect)
		table.insert(AllConnect, ResetConnect)
		table.insert(AllConnect, DelayTimeConnect)
		table.insert(AllConnect, DestroyConnect)
		table.insert(AllConnect, BundleBodyColorConnect)
		table.insert(AllConnect, MeshSizeLockConnect)
		table.insert(AllConnect, AccessorySizeLockConnect)
		table.insert(AllConnect, MeshBasePartInvisibleConnect)
		table.insert(AllConnect, BodyPartPhysicsConnect)
		table.insert(AllConnect, UsernameConnect)
		table.insert(AllConnect, MethodConnect)
		table.insert(AllConnect, MethodConnect2)
		table.insert(AllConnect, KeybindConnect)
		table.insert(AllConnect, ToneConnect)
		table.insert(AllConnect, ShirtConnect)
		table.insert(AllConnect, ShirtGraphicConnect)
		table.insert(AllConnect, PantsConnect)
		table.insert(AllConnect, AccessoryConnect)
		table.insert(AllConnect, PositionPhysicsMultiplyConnect)
		table.insert(AllConnect, RotationPhysicsMultiplyConnect)
		table.insert(AllConnect, ClickExecuteConnect)
		table.insert(AllConnect, MobileCloseConnect)
		table.insert(AllConnect, SkinToneConnect)
		table.insert(AllConnect, NippleColorConnect)
		table.insert(AllConnect, BreastsTypeConnect)
		table.insert(AllConnect, OutfitIdConnect)
		--table.insert(AllConnect, BBCToggleConnect)
		table.insert(AllConnect, ClothesSearchConnect)
		table.insert(AllConnect, BundleSearchConnect)
		table.insert(AllConnect, TorsoTypeConnect)
		table.insert(AllConnect, LegsTypeConnect)
		table.insert(AllConnect, FirstPersonConnect)
		table.insert(AllConnect, ShirtHPConnect)
		table.insert(AllConnect, PantsHPConnect)
		table.insert(AllConnect, ShirtClothesConnect)
		table.insert(AllConnect, PantsClothesConnect)
		table.insert(AllConnect, DamageSFXConnect)
		table.insert(AllConnect, VolumeSFXConnect)
		table.insert(AllConnect, TearToggleConnect)
		table.insert(AllConnect, HealToggleConnect)
		table.insert(AllConnect, HardcoreToggleConnect)
		table.insert(AllConnect, GravityConnect)
		table.insert(AllConnect, TailPhysicsToggleConnect)
		table.insert(AllConnect, loadupClosedConnect)
		table.insert(AllConnect, loadupExecuteConnect)
		table.insert(AllConnect, loadupFPersonConnect)
		table.insert(AllConnect, loadupFPersonConnect2)
		table.insert(AllConnect, loadupBundleConnect)
		--table.insert(AllConnect, loadupBundleEnterConnect)
		table.insert(AllConnect, saveConnect)
		table.insert(AllConnect, importConnect)
		table.insert(AllConnect, exportBundleConnect)
		table.insert(AllConnect, delBundleConnect)
		table.insert(AllConnect, saveOutfitConnect)
		table.insert(AllConnect, saveFullOutfitConnect)
	end

	Function.UIStrokeCreate(GUIObject.PageFrame)
	Function.UIStrokeCreate(GUIObject.ToneFrame)
	Function.UIStrokeCreate(GUIObject.ResetFrame)
	Function.UIStrokeCreate(GUIObject.DelayFrame)
	Function.UIStrokeCreate(GUIObject.BundleFrame)
	Function.UIStrokeCreate(GUIObject.DestroyFrame)
	Function.UIStrokeCreate(GUIObject.PlayerFrame)
	Function.UIStrokeCreate(GUIObject.BreastsTypeFrame)
	Function.UIStrokeCreate(GUIObject.TorsoTypeFrame)
	Function.UIStrokeCreate(GUIObject.ArmTypeFrame)
	Function.UIStrokeCreate(GUIObject.LegsTypeFrame)
	Function.UIStrokeCreate(GUIObject.ButtTypeFrame)
	Function.UIStrokeCreate(GUIObject.AutoExecuteFrame)
	Function.UIStrokeCreate(GUIObject.BundleBodyColorFrame)
	Function.UIStrokeCreate(GUIObject.ExecuteFrame)
	Function.UIStrokeCreate(GUIObject.KeybindFrame)
	Function.UIStrokeCreate(GUIObject.FaceFrame)
	Function.UIStrokeCreate(GUIObject.Bundles_2)
	Function.UIStrokeCreate(GUIObject.Clothes_2)
	Function.UIStrokeCreate(GUIObject.Menu_2)
	Function.UIStrokeCreate(GUIObject.Menu2_2)
	Function.UIStrokeCreate(GUIObject.LocalTransparencyFrame)
	Function.UIStrokeCreate(GUIObject.MeshSizeLockFrame)
	Function.UIStrokeCreate(GUIObject.AccessorySizeLockFrame)
	Function.UIStrokeCreate(GUIObject.MeshBasePartInvisibleFrame)
	Function.UIStrokeCreate(GUIObject.BodyPartPhysicsFrame)
	Function.UIStrokeCreate(GUIObject.MethodFrame)
	Function.UIStrokeCreate(GUIObject.Catalog_2)
	Function.UIStrokeCreate(GUIObject.Edit_2)
	Function.UIStrokeCreate(GUIObject.HP)
	Function.UIStrokeCreate(GUIObject.FPFrame)
	Function.UIStrokeCreate(GUIObject.MeshNameFrame)
	Function.UIStrokeCreate(GUIObject.ShirtFrame)
	Function.UIStrokeCreate(GUIObject.ShirtGraphicFrame)
	Function.UIStrokeCreate(GUIObject.PantsFrame)
	Function.UIStrokeCreate(GUIObject.AccessoryFrame)
	Function.UIStrokeCreate(GUIObject.UsernameFrame)
	Function.UIStrokeCreate(GUIObject.ClickExecuteFrame)
	Function.UIStrokeCreate(GUIObject.PositionPhysicsMultiplyFrame)
	Function.UIStrokeCreate(GUIObject.RotationPhysicsMultiplyFrame)
	Function.UIStrokeCreate(GUIObject.SkinToneFrame)
	Function.UIStrokeCreate(GUIObject.NippleColorFrame)
	Function.UIStrokeCreate(GUIObject.Menu3_3)
	Function.UIStrokeCreate(GUIObject.BreastsScaleFrame)
	Function.UIStrokeCreate(GUIObject.ButtsScaleFrame)
	Function.UIStrokeCreate(GUIObject.LegsScaleFrame)
	Function.UIStrokeCreate(GUIObject.OutfitIdFrame)
	Function.UIStrokeCreate(GUIObject.TopHPFrame)
	Function.UIStrokeCreate(GUIObject.TopClothesFrame)
	Function.UIStrokeCreate(GUIObject.BottomHPFrame)
	Function.UIStrokeCreate(GUIObject.BottomClothesFrame)
	Function.UIStrokeCreate(GUIObject.DamageFrame)
	Function.UIStrokeCreate(GUIObject.VolumeFrame)
	Function.UIStrokeCreate(GUIObject.TPFrame)
	Function.UIStrokeCreate(GUIObject.PHFrame)
	Function.UIStrokeCreate(GUIObject.Recolor)
	Function.UIStrokeCreate(GUIObject.GravityFrame)
	Function.UIStrokeCreate(GUIObject.BodyTransparencyFrame)
	Function.UIStrokeCreate(GUIObject.HardcoreFrame)
	Function.UIStrokeCreate(GUIObject.tailToggleFrame)
	Function.UIStrokeCreate(GUIObject.optionsframeButton)
	Function.UIStrokeCreate(GUIObject.saveFrame)
	Function.UIStrokeCreate(GUIObject.closeOption)
	Function.UIStrokeCreate(GUIObject.executeOption)
	Function.UIStrokeCreate(GUIObject.bundleLoad)
	Function.UIStrokeCreate(GUIObject.FPersonLoadup)
	Function.UIStrokeCreate(GUIObject.importBundle)
	Function.UIStrokeCreate(GUIObject.exportBox)
	Function.UIStrokeCreate(GUIObject.saveOutfitBox)
	Function.UIStrokeCreate(GUIObject.saveFullOutfitBox)
	Function.UIStrokeCreate(GUIObject.saveClothesOption)
	Function.UIStrokeCreate(GUIObject.delFrame)

	--Properties:
	do
	GUIObject.Screen.Name = "RoClothes"
	GUIObject.Screen.DisplayOrder = 999
	GUIObject.Screen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	GUIObject.Screen.ResetOnSpawn = false
	GUIObject.Screen.Enabled = true

	GUIObject.MobileCloseButtonScreen.Name = "RoClothesCloseButton"
	GUIObject.MobileCloseButtonScreen.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	GUIObject.MobileCloseButtonScreen.ResetOnSpawn = false
	GUIObject.MobileCloseButtonScreen.Enabled = not UIS.KeyboardEnabled

	if RS:IsClient() and not RS:IsStudio() then
		local uiParent
		local function missing(t, f, fallback)
			if type(f) == t then return f end
			return fallback
		end
		local gethui = missing("function", gethui or get_hidden_gui)
		local protectgui = missing("function", protect_gui or (syn and syn.protect_gui))
		if gethui then
			uiParent = gethui()
		elseif protectgui then
			protectgui(GUIObject.Screen)
			protectgui(GUIObject.MobileCloseButtonScreen)
			uiParent = game:GetService("CoreGui")
		else
			uiParent = game:GetService("CoreGui")
		end

		GUIObject.Screen.Parent = uiParent
		GUIObject.MobileCloseButtonScreen.Parent = uiParent
	else
		GUIObject.Screen.Parent = Player:WaitForChild("PlayerGui")
		GUIObject.MobileCloseButtonScreen.Parent = Player:WaitForChild("PlayerGui")
	end

	GUIObject.MainFrame.Name = "MainFrame"
	GUIObject.MainFrame.Text = ""
	GUIObject.MainFrame.Modal = false
	GUIObject.MainFrame.Parent = GUIObject.Screen
	GUIObject.MainFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MainFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.MainFrame.Position = UDim2.new(0.757, 0, 0.231759638, 0)
	GUIObject.MainFrame.Size = UDim2.new(0.18244803, 0, 0.536480665, 0)
	GUIObject.MainFrame.BackgroundTransparency = 1

	GUIObject.Dragger.Parent = GUIObject.MainFrame

	GUIObject.PageFrame.Name = "PageFrame"
	GUIObject.PageFrame.Parent = GUIObject.MainFrame
	GUIObject.PageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PageFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.PageFrame.Position = UDim2.new(0,0,0)
	GUIObject.PageFrame.Size = UDim2.new(1,0,1,0)

	GUIObject.UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 15, 19)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 24, 30))}
	GUIObject.UIGradient.Rotation = -90
	GUIObject.UIGradient.Parent = GUIObject.PageFrame

	GUIObject.UICorner.CornerRadius = UDim.new(0.100000001, 0)
	GUIObject.UICorner.Parent = GUIObject.PageFrame

	GUIObject.Clothes_3.Name = "Clothes"
	GUIObject.Clothes_3.Parent = GUIObject.PageFrame
	GUIObject.Clothes_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Clothes_3.BackgroundTransparency = 1.000
	GUIObject.Clothes_3.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Clothes_3.Visible = false

	GUIObject.ClothesSearch.Name = "ClothesSearch"
	GUIObject.ClothesSearch.Parent = GUIObject.Clothes_3
	GUIObject.ClothesSearch.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ClothesSearch.BackgroundColor3 = Color3.fromRGB(6, 0, 76)
	GUIObject.ClothesSearch.BorderColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ClothesSearch.Position = UDim2.new(0.5, 0, 1.02, 0)
	GUIObject.ClothesSearch.Size = UDim2.new(.9, 0, 0.0646399707, 0)

	GUIObject.UIGradient_34.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 13, 17)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 22, 28))}
	GUIObject.UIGradient_34.Rotation = -90
	GUIObject.UIGradient_34.Parent = GUIObject.ClothesSearch

	Function.UIStrokeCreate(GUIObject.ClothesSearch).ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	GUIObject.UICorner_35.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_35.Parent = GUIObject.ClothesSearch

	--GUIObject.ClothesSearch.ClearTextOnFocus = false
	GUIObject.ClothesSearch.Font = Enum.Font.Code
	GUIObject.ClothesSearch.Text = ""
	GUIObject.ClothesSearch.PlaceholderText = "Search Clothes"
	GUIObject.ClothesSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ClothesSearch.TextScaled = true
	GUIObject.ClothesSearch.TextSize = 14.000
	GUIObject.ClothesSearch.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.ClothesSearch.TextWrapped = true

	GUIObject.ClothesButtonFrame.Name = "ClothesButtonFrame"
	GUIObject.ClothesButtonFrame.Parent = GUIObject.Clothes_3
	GUIObject.ClothesButtonFrame.Active = true
	GUIObject.ClothesButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.ClothesButtonFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ClothesButtonFrame.BackgroundTransparency = 1.000
	GUIObject.ClothesButtonFrame.BorderSizePixel = 0
	GUIObject.ClothesButtonFrame.ClipsDescendants = true
	GUIObject.ClothesButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	GUIObject.ClothesButtonFrame.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
	GUIObject.ClothesButtonFrame.Visible = true
	GUIObject.ClothesButtonFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.ClothesButtonFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	GUIObject.ClothesButtonFrame.ScrollBarThickness = 0

	GUIObject.UIGridLayout.Parent = GUIObject.ClothesButtonFrame
	GUIObject.UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	GUIObject.UIGridLayout.CellSize = UDim2.new(0.300000012, 0, 0.174999997, 0)

	GUIObject.Menu.Name = "Menu"
	GUIObject.Menu.Parent = GUIObject.PageFrame
	GUIObject.Menu.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu.BackgroundTransparency = 1.000
	GUIObject.Menu.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.DestroyFrame.Name = "DestroyFrame"
	GUIObject.DestroyFrame.Parent = GUIObject.optionsFrame
	GUIObject.DestroyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.DestroyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.DestroyFrame.Position = UDim2.new(0.05, 0, 0.702, 0)
	GUIObject.DestroyFrame.Size = UDim2.new(0.18244803, 0, 0.058, 0)

	GUIObject.UIAspectRatioConstraint_2.Parent = GUIObject.DestroyFrame

	GUIObject.UIGradient_3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(40, 12, 16)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(68, 18, 24))}
	GUIObject.UIGradient_3.Rotation = -90
	GUIObject.UIGradient_3.Parent = GUIObject.DestroyFrame

	GUIObject.UICorner_3.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_3.Parent = GUIObject.DestroyFrame

	GUIObject.DestroyButton.Name = "DestroyButton"
	GUIObject.DestroyButton.Parent = GUIObject.DestroyFrame
	GUIObject.DestroyButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.DestroyButton.BackgroundTransparency = 1.000
	GUIObject.DestroyButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.DestroyButton.Font = Enum.Font.Code
	GUIObject.DestroyButton.Text = "DESTROY"
	GUIObject.DestroyButton.TextColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.DestroyButton.TextScaled = true
	GUIObject.DestroyButton.TextSize = 14.000
	GUIObject.DestroyButton.TextStrokeColor3 = Color3.fromRGB(104, 0, 0)
	GUIObject.DestroyButton.TextStrokeTransparency = 0.000
	GUIObject.DestroyButton.TextWrapped = true

	GUIObject.PlayerFrame.Name = "PlayerFrame"
	GUIObject.PlayerFrame.Parent = GUIObject.Menu
	GUIObject.PlayerFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.PlayerFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PlayerFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.PlayerFrame.Position = UDim2.new(0.5, 0, 0.025, 0)
	GUIObject.PlayerFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_4.Rotation = -90
	GUIObject.UIGradient_4.Parent = GUIObject.PlayerFrame

	GUIObject.UICorner_4.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_4.Parent = GUIObject.PlayerFrame

	GUIObject.PlayerExecute.Name = "PlayerExecute"
	GUIObject.PlayerExecute.Parent = GUIObject.PlayerFrame
	GUIObject.PlayerExecute.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.PlayerExecute.BackgroundTransparency = 1.000
	GUIObject.PlayerExecute.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.PlayerExecute.ClearTextOnFocus = false
	GUIObject.PlayerExecute.Font = Enum.Font.Code
	GUIObject.PlayerExecute.PlaceholderText = "Player To Execute (Self = Yourself)"
	GUIObject.PlayerExecute.Text = "Self"
	GUIObject.PlayerExecute.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PlayerExecute.TextScaled = true
	GUIObject.PlayerExecute.TextSize = 14.000
	GUIObject.PlayerExecute.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.PlayerExecute.TextWrapped = true

	GUIObject.BreastsTypeFrame.Name = "BreastsTypeFrame"
	GUIObject.BreastsTypeFrame.Parent = GUIObject.Menu
	GUIObject.BreastsTypeFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BreastsTypeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BreastsTypeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BreastsTypeFrame.Position = UDim2.new(0.5, 0, 0.195, 0)
	GUIObject.BreastsTypeFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 56))}
	GUIObject.UIGradient_5.Rotation = -90
	GUIObject.UIGradient_5.Parent = GUIObject.BreastsTypeFrame

	GUIObject.UICorner_5.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_5.Parent = GUIObject.BreastsTypeFrame

	GUIObject.BreastsTypeButton.Name = "BreastsTypeButton"
	GUIObject.BreastsTypeButton.Parent = GUIObject.BreastsTypeFrame
	GUIObject.BreastsTypeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BreastsTypeButton.BackgroundTransparency = 1.000
	GUIObject.BreastsTypeButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BreastsTypeButton.ZIndex = 2
	GUIObject.BreastsTypeButton.Font = Enum.Font.Code
	GUIObject.BreastsTypeButton.Text = "Breasts Type: 1"
	GUIObject.BreastsTypeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BreastsTypeButton.TextScaled = true
	GUIObject.BreastsTypeButton.TextSize = 14.000
	GUIObject.BreastsTypeButton.TextWrapped = true

	GUIObject.BundleSearch.Name = "BundleSearch"
	GUIObject.BundleSearch.Parent = GUIObject.Bundles
	GUIObject.BundleSearch.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BundleSearch.BackgroundColor3 = Color3.fromRGB(6, 0, 76)
	GUIObject.BundleSearch.BorderColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleSearch.Position = UDim2.new(0.5, 0, 1.02, 0)
	GUIObject.BundleSearch.Size = UDim2.new(.9, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(12, 13, 17)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(20, 22, 28))}
	GUIObject.UIGradient_A17.Rotation = -90
	GUIObject.UIGradient_A17.Parent = GUIObject.BundleSearch

	Function.UIStrokeCreate(GUIObject.BundleSearch).ApplyStrokeMode = Enum.ApplyStrokeMode.Border

	GUIObject.UICorner_A17.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A17.Parent = GUIObject.BundleSearch

	--GUIObject.ClothesSearch.ClearTextOnFocus = false
	GUIObject.BundleSearch.Font = Enum.Font.Code
	GUIObject.BundleSearch.Text = ""
	GUIObject.BundleSearch.PlaceholderText = "Search Bundles"
	GUIObject.BundleSearch.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleSearch.TextScaled = true
	GUIObject.BundleSearch.TextSize = 14.000
	GUIObject.BundleSearch.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.BundleSearch.TextWrapped = true

	GUIObject.BundleFrame.Name = "BundleFrame"
	GUIObject.BundleFrame.Parent = GUIObject.Menu
	GUIObject.BundleFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BundleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BundleFrame.Position = UDim2.new(0.5, 0, 0.11, 0)
	GUIObject.BundleFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_6.Rotation = -90
	GUIObject.UIGradient_6.Parent = GUIObject.BundleFrame

	GUIObject.UICorner_6.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_6.Parent = GUIObject.BundleFrame

	GUIObject.BundleText.Name = "BundleText"
	GUIObject.BundleText.Parent = GUIObject.BundleFrame
	GUIObject.BundleText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleText.BackgroundTransparency = 1.000
	GUIObject.BundleText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BundleText.ZIndex = 2
	GUIObject.BundleText.Font = Enum.Font.Code
	GUIObject.BundleText.Text = "Bundle: nil"
	GUIObject.BundleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleText.TextScaled = true
	GUIObject.BundleText.TextSize = 14.000
	GUIObject.BundleText.TextWrapped = true

	GUIObject.DelayFrame.Name = "DelayFrame"
	GUIObject.DelayFrame.Parent = GUIObject.Menu
	GUIObject.DelayFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.DelayFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.DelayFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.DelayFrame.Position = UDim2.new(0.5, 0, 0.535, 0)
	GUIObject.DelayFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_7.Rotation = -90
	GUIObject.UIGradient_7.Parent = GUIObject.DelayFrame

	GUIObject.UICorner_7.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_7.Parent = GUIObject.DelayFrame

	GUIObject.DelayTimeText.Name = "DelayTimeText"
	GUIObject.DelayTimeText.Parent = GUIObject.DelayFrame
	GUIObject.DelayTimeText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.DelayTimeText.BackgroundTransparency = 1.000
	GUIObject.DelayTimeText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.DelayTimeText.Font = Enum.Font.Code
	GUIObject.DelayTimeText.PlaceholderText = "Delay Time After Respawn"
	GUIObject.DelayTimeText.Text = "1"
	GUIObject.DelayTimeText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.DelayTimeText.TextScaled = true
	GUIObject.DelayTimeText.TextSize = 14.000
	GUIObject.DelayTimeText.TextWrapped = true

	GUIObject.AutoExecuteFrame.Name = "AutoExecuteFrame"
	GUIObject.AutoExecuteFrame.Parent = GUIObject.Menu
	GUIObject.AutoExecuteFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.AutoExecuteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.AutoExecuteFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.AutoExecuteFrame.Position = UDim2.new(0.5, 0, 0.62, 0)
	GUIObject.AutoExecuteFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_8.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_8.Parent = GUIObject.AutoExecuteFrame

	GUIObject.UIGradient_8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_8.Rotation = -90
	GUIObject.UIGradient_8.Parent = GUIObject.AutoExecuteFrame

	GUIObject.AutoExecuteButton.Name = "AutoExecuteButton"
	GUIObject.AutoExecuteButton.Parent = GUIObject.AutoExecuteFrame
	GUIObject.AutoExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.AutoExecuteButton.BackgroundTransparency = 1.000
	GUIObject.AutoExecuteButton.BorderSizePixel = 0
	GUIObject.AutoExecuteButton.LayoutOrder = 1
	GUIObject.AutoExecuteButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.AutoExecuteButton.Font = Enum.Font.Code
	GUIObject.AutoExecuteButton.Text = "Auto Execute"
	GUIObject.AutoExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.AutoExecuteButton.TextScaled = true
	GUIObject.AutoExecuteButton.TextSize = 14.000
	GUIObject.AutoExecuteButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.AutoExecuteButton.TextStrokeTransparency = 0.000
	GUIObject.AutoExecuteButton.TextWrapped = true

	GUIObject.BundleBodyColorFrame.Name = "BundleBodyColorFrame"
	GUIObject.BundleBodyColorFrame.Parent = GUIObject.Menu
	GUIObject.BundleBodyColorFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BundleBodyColorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleBodyColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BundleBodyColorFrame.Position = UDim2.new(0.5, 0, 0.365, 0)
	GUIObject.BundleBodyColorFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_15.Rotation = -90
	GUIObject.UIGradient_15.Parent = GUIObject.BundleBodyColorFrame

	GUIObject.UICorner_15.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_15.Parent = GUIObject.BundleBodyColorFrame

	GUIObject.BundleBodyColorButton.Name = "BundleBodyColorButton"
	GUIObject.BundleBodyColorButton.Parent = GUIObject.BundleBodyColorFrame
	GUIObject.BundleBodyColorButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BundleBodyColorButton.BackgroundTransparency = 1.000
	GUIObject.BundleBodyColorButton.BorderSizePixel = 0
	GUIObject.BundleBodyColorButton.LayoutOrder = 1
	GUIObject.BundleBodyColorButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BundleBodyColorButton.Font = Enum.Font.Code
	GUIObject.BundleBodyColorButton.Text = "Bundle Body Color"
	GUIObject.BundleBodyColorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundleBodyColorButton.TextScaled = true
	GUIObject.BundleBodyColorButton.TextSize = 14.000
	GUIObject.BundleBodyColorButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.BundleBodyColorButton.TextStrokeTransparency = 0.000
	GUIObject.BundleBodyColorButton.TextWrapped = true

	GUIObject.ResetFrame.Name = "ResetFrame"
	GUIObject.ResetFrame.Parent = GUIObject.Menu
	GUIObject.ResetFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ResetFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ResetFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ResetFrame.Position = UDim2.new(0.5, 0, 0.705, 0)
	GUIObject.ResetFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_9.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_9.Parent = GUIObject.ResetFrame

	GUIObject.UIGradient_9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(52, 16, 22)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(82, 22, 30))}
	GUIObject.UIGradient_9.Rotation = -90
	GUIObject.UIGradient_9.Parent = GUIObject.ResetFrame

	GUIObject.ResetButton.Name = "ResetButton"
	GUIObject.ResetButton.Parent = GUIObject.ResetFrame
	GUIObject.ResetButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ResetButton.BackgroundTransparency = 1.000
	GUIObject.ResetButton.BorderSizePixel = 0
	GUIObject.ResetButton.LayoutOrder = 1
	GUIObject.ResetButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ResetButton.Font = Enum.Font.Code
	GUIObject.ResetButton.Text = "Reset"
	GUIObject.ResetButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ResetButton.TextScaled = true
	GUIObject.ResetButton.TextSize = 14.000
	GUIObject.ResetButton.TextStrokeColor3 = Color3.fromRGB(99, 0, 0)
	GUIObject.ResetButton.TextWrapped = true

	GUIObject.ExecuteFrame.Name = "ExecuteFrame"
	GUIObject.ExecuteFrame.Parent = GUIObject.Menu
	GUIObject.ExecuteFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ExecuteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ExecuteFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ExecuteFrame.Position = UDim2.new(0.5, 0, 0.79, 0)
	GUIObject.ExecuteFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_10.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_10.Parent = GUIObject.ExecuteFrame

	GUIObject.UIGradient_10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(42, 16, 62)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(72, 25, 108))}
	GUIObject.UIGradient_10.Rotation = -90
	GUIObject.UIGradient_10.Parent = GUIObject.ExecuteFrame

	GUIObject.ExecuteButton.Name = "ExecuteButton"
	GUIObject.ExecuteButton.Parent = GUIObject.ExecuteFrame
	GUIObject.ExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ExecuteButton.BackgroundTransparency = 1.000
	GUIObject.ExecuteButton.BorderSizePixel = 0
	GUIObject.ExecuteButton.LayoutOrder = 1
	GUIObject.ExecuteButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ExecuteButton.Font = Enum.Font.Code
	GUIObject.ExecuteButton.Text = "Execute"
	GUIObject.ExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ExecuteButton.TextScaled = true
	GUIObject.ExecuteButton.TextSize = 14.000
	GUIObject.ExecuteButton.TextStrokeColor3 = Color3.fromRGB(99, 0, 0)
	GUIObject.ExecuteButton.TextWrapped = true

	GUIObject.ToneFrame.Name = "ToneFrame"
	GUIObject.ToneFrame.Parent = GUIObject.Menu
	GUIObject.ToneFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ToneFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ToneFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ToneFrame.Position = UDim2.new(0.5, 0, 0.28, 0)
	GUIObject.ToneFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 23, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 36, 54))}
	GUIObject.UIGradient_11.Rotation = -90
	GUIObject.UIGradient_11.Parent = GUIObject.ToneFrame

	GUIObject.UICorner_11.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_11.Parent = GUIObject.ToneFrame

	GUIObject.ToneButton.Name = "ToneButton"
	GUIObject.ToneButton.Parent = GUIObject.ToneFrame
	GUIObject.ToneButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ToneButton.BackgroundTransparency = 1.000
	GUIObject.ToneButton.BorderSizePixel = 0
	GUIObject.ToneButton.LayoutOrder = 1
	GUIObject.ToneButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ToneButton.Font = Enum.Font.Code
	GUIObject.ToneButton.Text = "Tone: Base"
	GUIObject.ToneButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ToneButton.TextScaled = true
	GUIObject.ToneButton.TextSize = 14.000
	GUIObject.ToneButton.TextStrokeColor3 = Color3.fromRGB(57, 57, 57)
	GUIObject.ToneButton.TextWrapped = true

	GUIObject.Bundles.Name = "Bundles"
	GUIObject.Bundles.Parent = GUIObject.PageFrame
	GUIObject.Bundles.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Bundles.BackgroundTransparency = 1.000
	GUIObject.Bundles.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Bundles.Visible = false

	GUIObject.BundlesButtonFrame.Name = "BundlesButtonFrame"
	GUIObject.BundlesButtonFrame.Parent = GUIObject.Bundles
	GUIObject.BundlesButtonFrame.Active = true
	GUIObject.BundlesButtonFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.BundlesButtonFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BundlesButtonFrame.BackgroundTransparency = 1.000
	GUIObject.BundlesButtonFrame.BorderSizePixel = 0
	GUIObject.BundlesButtonFrame.ClipsDescendants = true
	GUIObject.BundlesButtonFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	GUIObject.BundlesButtonFrame.Size = UDim2.new(0.949999988, 0, 0.949999988, 0)
	GUIObject.BundlesButtonFrame.Visible = true
	GUIObject.BundlesButtonFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.BundlesButtonFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	GUIObject.BundlesButtonFrame.ScrollBarThickness = 0

	GUIObject.UIGridLayout_2.Parent = GUIObject.BundlesButtonFrame
	GUIObject.UIGridLayout_2.SortOrder = Enum.SortOrder.LayoutOrder
	GUIObject.UIGridLayout_2.CellSize = UDim2.new(0.300000012, 0, 0.174999997, 0)

	GUIObject.ButtonFrame.Name = "ButtonFrame"
	GUIObject.ButtonFrame.Parent = GUIObject.MainFrame
	GUIObject.ButtonFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ButtonFrame.BackgroundTransparency = 1.000
	GUIObject.ButtonFrame.Position = UDim2.new(1.055,0,0,0)
	GUIObject.ButtonFrame.Size = UDim2.new(0.15,0,1,0)

	GUIObject.UIListLayout.Parent = GUIObject.ButtonFrame
	GUIObject.UIListLayout.SortOrder = Enum.SortOrder.LayoutOrder
	GUIObject.UIListLayout.Padding = UDim.new(0.025, 0)
	GUIObject.UIListLayout.VerticalAlignment = Enum.VerticalAlignment.Center
	GUIObject.UIListLayout.VerticalFlex = Enum.UIFlexAlignment.SpaceEvenly

	GUIObject.Menu_2.Name = "Menu"
	GUIObject.Menu_2.Parent = GUIObject.ButtonFrame
	GUIObject.Menu_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Menu_2.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Menu_2.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_3.Parent = GUIObject.Menu_2

	GUIObject.UICorner_12.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_12.Parent = GUIObject.Menu_2

	GUIObject.MenuButton.Name = "MenuButton"
	GUIObject.MenuButton.Parent = GUIObject.Menu_2
	GUIObject.MenuButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MenuButton.BackgroundTransparency = 1.000
	GUIObject.MenuButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.MenuButton.Font = Enum.Font.Code
	GUIObject.MenuButton.Text = "Menu"
	GUIObject.MenuButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MenuButton.TextScaled = true
	GUIObject.MenuButton.TextSize = 14.000
	GUIObject.MenuButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.MenuButton.TextWrapped = true

	GUIObject.UIGradient_12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.UIGradient_12.Rotation = -90
	GUIObject.UIGradient_12.Parent = GUIObject.Menu_2

	GUIObject.Menu2_2.Name = "Menu2"
	GUIObject.Menu2_2.Parent = GUIObject.ButtonFrame
	GUIObject.Menu2_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu2_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Menu2_2.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Menu2_2.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_7.Parent = GUIObject.Menu2_2

	GUIObject.UICorner_20.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_20.Parent = GUIObject.Menu2_2

	GUIObject.Menu2Button.Name = "Menu2Button"
	GUIObject.Menu2Button.Parent = GUIObject.Menu2_2
	GUIObject.Menu2Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu2Button.BackgroundTransparency = 1.000
	GUIObject.Menu2Button.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Menu2Button.Font = Enum.Font.Code
	GUIObject.Menu2Button.Text = "Settings"
	GUIObject.Menu2Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu2Button.TextScaled = true
	GUIObject.Menu2Button.TextSize = 14.000
	GUIObject.Menu2Button.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.Menu2Button.TextWrapped = true

	GUIObject.UIGradient_19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.UIGradient_19.Rotation = -90
	GUIObject.UIGradient_19.Parent = GUIObject.Menu2_2

	GUIObject.Menu3_3.Name = "Menu3"
	GUIObject.Menu3_3.Parent = GUIObject.ButtonFrame
	GUIObject.Menu3_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu3_3.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Menu3_3.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Menu3_3.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.M3UIAspectRatioConstraint.Parent = GUIObject.Menu3_3

	GUIObject.M3UICorner.CornerRadius = UDim.new(0.25, 0)
	GUIObject.M3UICorner.Parent = GUIObject.Menu3_3

	GUIObject.Menu3Button.Name = "Menu3Button"
	GUIObject.Menu3Button.Parent = GUIObject.Menu3_3
	GUIObject.Menu3Button.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu3Button.BackgroundTransparency = 1.000
	GUIObject.Menu3Button.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Menu3Button.Font = Enum.Font.Code
	GUIObject.Menu3Button.Text = "Body"
	GUIObject.Menu3Button.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu3Button.TextScaled = true
	GUIObject.Menu3Button.TextSize = 14.000
	GUIObject.Menu3Button.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.Menu3Button.TextWrapped = true

	GUIObject.M3UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.M3UIGradient.Rotation = -90
	GUIObject.M3UIGradient.Parent = GUIObject.Menu3_3

	GUIObject.Clothes_2.Name = "Clothes"
	GUIObject.Clothes_2.Parent = GUIObject.ButtonFrame
	GUIObject.Clothes_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Clothes_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Clothes_2.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Clothes_2.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_4.Parent = GUIObject.Clothes_2

	GUIObject.UICorner_13.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_13.Parent = GUIObject.Clothes_2

	GUIObject.ClothesButton.Name = "ClothesButton"
	GUIObject.ClothesButton.Parent = GUIObject.Clothes_2
	GUIObject.ClothesButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ClothesButton.BackgroundTransparency = 1.000
	GUIObject.ClothesButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ClothesButton.Font = Enum.Font.Code
	GUIObject.ClothesButton.Text = "Clothes"
	GUIObject.ClothesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ClothesButton.TextScaled = true
	GUIObject.ClothesButton.TextSize = 14.000
	GUIObject.ClothesButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.ClothesButton.TextWrapped = true

	GUIObject.UIGradient_13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.UIGradient_13.Rotation = -90
	GUIObject.UIGradient_13.Parent = GUIObject.Clothes_2

	GUIObject.Bundles_2.Name = "Bundles"
	GUIObject.Bundles_2.Parent = GUIObject.ButtonFrame
	GUIObject.Bundles_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Bundles_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Bundles_2.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Bundles_2.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_5.Parent = GUIObject.Bundles_2

	GUIObject.UICorner_14.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_14.Parent = GUIObject.Bundles_2

	GUIObject.BundlesButton.Name = "BundlesButton"
	GUIObject.BundlesButton.Parent = GUIObject.Bundles_2
	GUIObject.BundlesButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundlesButton.BackgroundTransparency = 1.000
	GUIObject.BundlesButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BundlesButton.Font = Enum.Font.Code
	GUIObject.BundlesButton.Text = "Bundles"
	GUIObject.BundlesButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BundlesButton.TextScaled = true
	GUIObject.BundlesButton.TextSize = 14.000
	GUIObject.BundlesButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.BundlesButton.TextWrapped = true

	GUIObject.UIGradient_14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.UIGradient_14.Rotation = -90
	GUIObject.UIGradient_14.Parent = GUIObject.Bundles_2

	GUIObject.NameFrame.Name = "NameFrame"
	GUIObject.NameFrame.Parent = GUIObject.MainFrame
	GUIObject.NameFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.NameFrame.BackgroundTransparency = 1.000
	GUIObject.NameFrame.Position = UDim2.new(0, 0, -0.096, 0)
	GUIObject.NameFrame.Size = UDim2.new(0.561, 0, 0.04, 0)

	GUIObject.NameText.Name = "NameText"
	GUIObject.NameText.Parent = GUIObject.NameFrame
	GUIObject.NameText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.NameText.BackgroundTransparency = 1.000
	GUIObject.NameText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.NameText.ZIndex = 2
	GUIObject.NameText.Font = Enum.Font.Code
	GUIObject.NameText.Text = "Roclothes Modded Purrw Edition"
	GUIObject.NameText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.NameText.TextScaled = true
	GUIObject.NameText.TextSize = 14.000
	GUIObject.NameText.TextWrapped = true
	GUIObject.NameText.TextXAlignment = Enum.TextXAlignment.Left

	GUIObject.VersionText.Name = "VersionText"
	GUIObject.VersionText.Parent = GUIObject.NameFrame
	GUIObject.VersionText.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.VersionText.BackgroundTransparency = 1.000
	GUIObject.VersionText.Position = UDim2.new(0, 0, 1.06666636, 0)
	GUIObject.VersionText.Size = UDim2.new(1, 0, 0.799999952, 0)
	GUIObject.VersionText.ZIndex = 2
	GUIObject.VersionText.Font = Enum.Font.Code
	GUIObject.VersionText.Text = "Version - "..CVersion
	GUIObject.VersionText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.VersionText.TextScaled = true
	GUIObject.VersionText.TextSize = 14.000
	GUIObject.VersionText.TextWrapped = true
	GUIObject.VersionText.TextXAlignment = Enum.TextXAlignment.Left

	GUIObject.KeybindFrame.Name = "KeybindFrame"
	GUIObject.KeybindFrame.Parent = GUIObject.optionsFrame
	GUIObject.KeybindFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.KeybindFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.KeybindFrame.Position = UDim2.new(0.28, 0, 0.702, 0)
	GUIObject.KeybindFrame.Size = UDim2.new(0.684944391, 0, 0.058, 0)

	GUIObject.UIGradient_16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 45))}
	GUIObject.UIGradient_16.Rotation = -90
	GUIObject.UIGradient_16.Parent = GUIObject.KeybindFrame

	GUIObject.UICorner_16.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_16.Parent = GUIObject.KeybindFrame

	GUIObject.KeybindButton.Name = "KeybindButton"
	GUIObject.KeybindButton.Parent = GUIObject.KeybindFrame
	GUIObject.KeybindButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.KeybindButton.BackgroundTransparency = 1.000
	GUIObject.KeybindButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.KeybindButton.Font = Enum.Font.Code
	GUIObject.KeybindButton.Text = (typeof(KEYBIND) == "EnumItem" and KEYBIND.Name) or tostring(KEYBIND or "Insert"):gsub("^Enum%.KeyCode%.", "")
	GUIObject.KeybindButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.KeybindButton.TextScaled = true
	GUIObject.KeybindButton.TextSize = 14.000
	GUIObject.KeybindButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.KeybindButton.TextWrapped = true

	GUIObject.FaceFrame.Name = "FaceFrame"
	GUIObject.FaceFrame.Parent = GUIObject.Menu
	GUIObject.FaceFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.FaceFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FaceFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.FaceFrame.Position = UDim2.new(0.5, 0, 0.449999988, 0)
	GUIObject.FaceFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_17.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_17.Rotation = -90
	GUIObject.UIGradient_17.Parent = GUIObject.FaceFrame

	GUIObject.UICorner_17.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_17.Parent = GUIObject.FaceFrame

	GUIObject.FaceButton.Name = "FaceButton"
	GUIObject.FaceButton.Parent = GUIObject.FaceFrame
	GUIObject.FaceButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.FaceButton.BackgroundTransparency = 1.000
	GUIObject.FaceButton.BorderSizePixel = 0
	GUIObject.FaceButton.LayoutOrder = 1
	GUIObject.FaceButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.FaceButton.Font = Enum.Font.Code
	GUIObject.FaceButton.Text = "Face"
	GUIObject.FaceButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FaceButton.TextScaled = true
	GUIObject.FaceButton.TextSize = 14.000
	GUIObject.FaceButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.FaceButton.TextStrokeTransparency = 0.000
	GUIObject.FaceButton.TextWrapped = true

	GUIObject.Menu2.Name = "Menu2"
	GUIObject.Menu2.Parent = GUIObject.PageFrame
	GUIObject.Menu2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu2.BackgroundTransparency = 1.000
	GUIObject.Menu2.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Menu2.Visible = false

	GUIObject.LocalTransparencyFrame.Name = "LocalTransparencyFrame"
	GUIObject.LocalTransparencyFrame.Parent = GUIObject.Menu2
	GUIObject.LocalTransparencyFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.LocalTransparencyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LocalTransparencyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.LocalTransparencyFrame.Position = UDim2.new(0.647907138, 0, 0.0250000004, 0)
	GUIObject.LocalTransparencyFrame.Size = UDim2.new(0.595495105, 0, 0.0646399707, 0)

	GUIObject.UIGradient_18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_18.Rotation = -90
	GUIObject.UIGradient_18.Parent = GUIObject.LocalTransparencyFrame

	GUIObject.UICorner_18.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_18.Parent = GUIObject.LocalTransparencyFrame

	GUIObject.LocalTransparencyButton.Name = "LocalTransparency"
	GUIObject.LocalTransparencyButton.Parent = GUIObject.LocalTransparencyFrame
	GUIObject.LocalTransparencyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.LocalTransparencyButton.BackgroundTransparency = 1.000
	GUIObject.LocalTransparencyButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.LocalTransparencyButton.ClearTextOnFocus = false
	GUIObject.LocalTransparencyButton.Font = Enum.Font.Code
	GUIObject.LocalTransparencyButton.PlaceholderText = "Player To Execute (Self = Yourself)"
	GUIObject.LocalTransparencyButton.Text = "0"
	GUIObject.LocalTransparencyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LocalTransparencyButton.TextScaled = true
	GUIObject.LocalTransparencyButton.TextSize = 14.000
	GUIObject.LocalTransparencyButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.LocalTransparencyButton.TextWrapped = true

	GUIObject.CharacterFrame.Name = "CharacterFrame"
	GUIObject.CharacterFrame.Parent = GUIObject.Menu2
	GUIObject.CharacterFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.CharacterFrame.BackgroundTransparency = 1.000
	GUIObject.CharacterFrame.Position = UDim2.new(0.0591630787, 0, 0.0266665854, 0)
	GUIObject.CharacterFrame.Size = UDim2.new(0.272571504, 0, 0.218666583, 0)

	GUIObject.UIAspectRatioConstraint_6.Parent = GUIObject.CharacterFrame
	GUIObject.UIAspectRatioConstraint_6.AspectRatio = 0.750

	GUIObject.LeftArmButton.Name = "Left Arm"
	GUIObject.LeftArmButton.Parent = GUIObject.CharacterFrame
	GUIObject.LeftArmButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LeftArmButton.BackgroundTransparency = 0.500
	GUIObject.LeftArmButton.BorderSizePixel = 0
	GUIObject.LeftArmButton.Position = UDim2.new(0, 0, 0.25, 0)
	GUIObject.LeftArmButton.Size = UDim2.new(0.25, 0, 0.449999988, 0)
	GUIObject.LeftArmButton.Image = "rbxasset0"
	GUIObject.LeftArmButton.ImageTransparency = 1.000

	GUIObject.TorsoButton.Name = "Torso"
	GUIObject.TorsoButton.Parent = GUIObject.CharacterFrame
	GUIObject.TorsoButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TorsoButton.BackgroundTransparency = 0.500
	GUIObject.TorsoButton.BorderSizePixel = 0
	GUIObject.TorsoButton.Position = UDim2.new(0.25, 0, 0.25, 0)
	GUIObject.TorsoButton.Size = UDim2.new(0.5, 0, 0.449999988, 0)
	GUIObject.TorsoButton.Image = "rbxasset0"
	GUIObject.TorsoButton.ImageTransparency = 1.000

	GUIObject.RightArmButton.Name = "Right Arm"
	GUIObject.RightArmButton.Parent = GUIObject.CharacterFrame
	GUIObject.RightArmButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RightArmButton.BackgroundTransparency = 0.500
	GUIObject.RightArmButton.BorderSizePixel = 0
	GUIObject.RightArmButton.Position = UDim2.new(0.75, 0, 0.25, 0)
	GUIObject.RightArmButton.Size = UDim2.new(0.25, 0, 0.449999988, 0)
	GUIObject.RightArmButton.Image = "rbxasset0"
	GUIObject.RightArmButton.ImageTransparency = 1.000

	GUIObject.RightLegButton.Name = "Right Leg"
	GUIObject.RightLegButton.Parent = GUIObject.CharacterFrame
	GUIObject.RightLegButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RightLegButton.BackgroundTransparency = 0.500
	GUIObject.RightLegButton.BorderSizePixel = 0
	GUIObject.RightLegButton.Position = UDim2.new(0.5, 0, 0.699999988, 0)
	GUIObject.RightLegButton.Size = UDim2.new(0.25, 0, 0.449999988, 0)
	GUIObject.RightLegButton.Image = "rbxasset0"
	GUIObject.RightLegButton.ImageTransparency = 1.000

	GUIObject.LeftLegButton.Name = "Left Leg"
	GUIObject.LeftLegButton.Parent = GUIObject.CharacterFrame
	GUIObject.LeftLegButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LeftLegButton.BackgroundTransparency = 0.500
	GUIObject.LeftLegButton.BorderSizePixel = 0
	GUIObject.LeftLegButton.Position = UDim2.new(0.25, 0, 0.699999988, 0)
	GUIObject.LeftLegButton.Size = UDim2.new(0.25, 0, 0.449999988, 0)
	GUIObject.LeftLegButton.Image = "rbxasset0"
	GUIObject.LeftLegButton.ImageTransparency = 1.000

	GUIObject.HeadButton.Name = "Head"
	GUIObject.HeadButton.Parent = GUIObject.CharacterFrame
	GUIObject.HeadButton.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.HeadButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HeadButton.BackgroundTransparency = 0.500
	GUIObject.HeadButton.BorderSizePixel = 0
	GUIObject.HeadButton.Position = UDim2.new(0.5, 0, 0, 0)
	GUIObject.HeadButton.Size = UDim2.new(0.349999994, 0, 0.25, 0)
	GUIObject.HeadButton.Image = "rbxasset0"
	GUIObject.HeadButton.ImageTransparency = 1.000

	GUIObject.UICorner_19.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_19.Parent = GUIObject.HeadButton

	GUIObject.HatButton.Name = "Hat"
	GUIObject.HatButton.Parent = GUIObject.CharacterFrame
	GUIObject.HatButton.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.HatButton.BackgroundTransparency = 1
	GUIObject.HatButton.BorderSizePixel = 0
	GUIObject.HatButton.Position = UDim2.new(0.85, 0, -0.05, 0)
	GUIObject.HatButton.Size = UDim2.new(0.35, 0, 0.35, 0)
	GUIObject.HatButton.Image = "rbxassetid://13285138825"
	GUIObject.HatButton.ImageColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HatButton.ScaleType = Enum.ScaleType.Fit

	GUIObject.MeshSizeLockFrame.Name = "MeshSizeLockFrame"
	GUIObject.MeshSizeLockFrame.Parent = GUIObject.Menu2
	GUIObject.MeshSizeLockFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.MeshSizeLockFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MeshSizeLockFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.MeshSizeLockFrame.Position = UDim2.new(0.5, 0, 0.289999992, 0)
	GUIObject.MeshSizeLockFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_20.Rotation = -90
	GUIObject.UIGradient_20.Parent = GUIObject.MeshSizeLockFrame

	GUIObject.UICorner_21.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_21.Parent = GUIObject.MeshSizeLockFrame

	GUIObject.MeshSizeLockButton.Name = "MeshSizeLockButton"
	GUIObject.MeshSizeLockButton.Parent = GUIObject.MeshSizeLockFrame
	GUIObject.MeshSizeLockButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.MeshSizeLockButton.BackgroundTransparency = 1.000
	GUIObject.MeshSizeLockButton.BorderSizePixel = 0
	GUIObject.MeshSizeLockButton.LayoutOrder = 1
	GUIObject.MeshSizeLockButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.MeshSizeLockButton.Font = Enum.Font.Code
	GUIObject.MeshSizeLockButton.Text = "Mesh Size Lock"
	GUIObject.MeshSizeLockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MeshSizeLockButton.TextScaled = true
	GUIObject.MeshSizeLockButton.TextSize = 14.000
	GUIObject.MeshSizeLockButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.MeshSizeLockButton.TextStrokeTransparency = 0.000
	GUIObject.MeshSizeLockButton.TextWrapped = true

	GUIObject.AccessorySizeLockFrame.Name = "AccessorySizeLockFrame"
	GUIObject.AccessorySizeLockFrame.Parent = GUIObject.Menu2
	GUIObject.AccessorySizeLockFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.AccessorySizeLockFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.AccessorySizeLockFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.AccessorySizeLockFrame.Position = UDim2.new(0.5, 0, 0.375, 0)
	GUIObject.AccessorySizeLockFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_21.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_21.Rotation = -90
	GUIObject.UIGradient_21.Parent = GUIObject.AccessorySizeLockFrame

	GUIObject.UICorner_22.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_22.Parent = GUIObject.AccessorySizeLockFrame

	GUIObject.AccessorySizeLockButton.Name = "AccessorySizeLockButton"
	GUIObject.AccessorySizeLockButton.Parent = GUIObject.AccessorySizeLockFrame
	GUIObject.AccessorySizeLockButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.AccessorySizeLockButton.BackgroundTransparency = 1.000
	GUIObject.AccessorySizeLockButton.BorderSizePixel = 0
	GUIObject.AccessorySizeLockButton.LayoutOrder = 1
	GUIObject.AccessorySizeLockButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.AccessorySizeLockButton.Font = Enum.Font.Code
	GUIObject.AccessorySizeLockButton.Text = "Accessory Size Lock"
	GUIObject.AccessorySizeLockButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.AccessorySizeLockButton.TextScaled = true
	GUIObject.AccessorySizeLockButton.TextSize = 14.000
	GUIObject.AccessorySizeLockButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.AccessorySizeLockButton.TextStrokeTransparency = 0.000
	GUIObject.AccessorySizeLockButton.TextWrapped = true

	GUIObject.MeshBasePartInvisibleFrame.Name = "MeshBasePartInvisibleFrame"
	GUIObject.MeshBasePartInvisibleFrame.Parent = GUIObject.Menu2
	GUIObject.MeshBasePartInvisibleFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.MeshBasePartInvisibleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MeshBasePartInvisibleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.MeshBasePartInvisibleFrame.Position = UDim2.new(0.271, 0, 0.46, 0)
	GUIObject.MeshBasePartInvisibleFrame.Size = UDim2.new(0.425, 0, 0.0646399707, 0)

	GUIObject.UIGradient_22.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_22.Rotation = -90
	GUIObject.UIGradient_22.Parent = GUIObject.MeshBasePartInvisibleFrame

	GUIObject.UICorner_23.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_23.Parent = GUIObject.MeshBasePartInvisibleFrame

	GUIObject.MeshBasePartInvisibleButton.Name = "MeshBasePartInvisibleButton"
	GUIObject.MeshBasePartInvisibleButton.Parent = GUIObject.MeshBasePartInvisibleFrame
	GUIObject.MeshBasePartInvisibleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.MeshBasePartInvisibleButton.BackgroundTransparency = 1.000
	GUIObject.MeshBasePartInvisibleButton.BorderSizePixel = 0
	GUIObject.MeshBasePartInvisibleButton.LayoutOrder = 1
	GUIObject.MeshBasePartInvisibleButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.MeshBasePartInvisibleButton.Font = Enum.Font.Code
	GUIObject.MeshBasePartInvisibleButton.Text = "Mesh Base Part Invisible"
	GUIObject.MeshBasePartInvisibleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MeshBasePartInvisibleButton.TextScaled = true
	GUIObject.MeshBasePartInvisibleButton.TextSize = 14.000
	GUIObject.MeshBasePartInvisibleButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.MeshBasePartInvisibleButton.TextStrokeTransparency = 0.000
	GUIObject.MeshBasePartInvisibleButton.TextWrapped = true

	GUIObject.BodyPartPhysicsFrame.Name = "BodyPartPhysicsFrame"
	GUIObject.BodyPartPhysicsFrame.Parent = GUIObject.Menu2
	GUIObject.BodyPartPhysicsFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BodyPartPhysicsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BodyPartPhysicsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BodyPartPhysicsFrame.Position = UDim2.new(0.5, 0, 0.545, 0)
	GUIObject.BodyPartPhysicsFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_23.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_23.Rotation = -90
	GUIObject.UIGradient_23.Parent = GUIObject.BodyPartPhysicsFrame

	GUIObject.UICorner_24.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_24.Parent = GUIObject.BodyPartPhysicsFrame

	GUIObject.BodyPartPhysicsButton.Name = "BodyPartPhysicsButton"
	GUIObject.BodyPartPhysicsButton.Parent = GUIObject.BodyPartPhysicsFrame
	GUIObject.BodyPartPhysicsButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BodyPartPhysicsButton.BackgroundTransparency = 1.000
	GUIObject.BodyPartPhysicsButton.BorderSizePixel = 0
	GUIObject.BodyPartPhysicsButton.LayoutOrder = 1
	GUIObject.BodyPartPhysicsButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BodyPartPhysicsButton.Font = Enum.Font.Code
	GUIObject.BodyPartPhysicsButton.Text = "Body Part Physics"
	GUIObject.BodyPartPhysicsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BodyPartPhysicsButton.TextScaled = true
	GUIObject.BodyPartPhysicsButton.TextSize = 14.000
	GUIObject.BodyPartPhysicsButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BodyPartPhysicsButton.TextStrokeTransparency = 0.000
	GUIObject.BodyPartPhysicsButton.TextWrapped = true

	GUIObject.MethodFrame.Name = "MethodFrame"
	GUIObject.MethodFrame.Parent = GUIObject.Menu
	GUIObject.MethodFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MethodFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.MethodFrame.Position = UDim2.new(0.0542876273, 0, 0.89, 0)
	GUIObject.MethodFrame.Size = UDim2.new(0.684944391, 0, 0.0646399707, 0)

	GUIObject.UIGradient_24.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 54))}
	GUIObject.UIGradient_24.Rotation = -90
	GUIObject.UIGradient_24.Parent = GUIObject.MethodFrame

	GUIObject.UICorner_25.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_25.Parent = GUIObject.MethodFrame

	GUIObject.MethodButton.Name = "MethodButton"
	GUIObject.MethodButton.Parent = GUIObject.MethodFrame
	GUIObject.MethodButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MethodButton.BackgroundTransparency = 1.000
	GUIObject.MethodButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.MethodButton.Font = Enum.Font.Code
	GUIObject.MethodButton.Text = "Method: 1"
	GUIObject.MethodButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MethodButton.TextScaled = true
	GUIObject.MethodButton.TextSize = 14.000
	GUIObject.MethodButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.MethodButton.TextWrapped = true

	GUIObject.Catalog_2.Name = "Catalog"
	GUIObject.Catalog_2.Parent = GUIObject.ButtonFrame
	GUIObject.Catalog_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Catalog_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Catalog_2.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Catalog_2.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_9.Parent = GUIObject.Catalog_2

	GUIObject.UICorner_34.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_34.Parent = GUIObject.Catalog_2

	GUIObject.CatalogButton.Name = "CatalogButton"
	GUIObject.CatalogButton.Parent = GUIObject.Catalog_2
	GUIObject.CatalogButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.CatalogButton.BackgroundTransparency = 1.000
	GUIObject.CatalogButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.CatalogButton.Font = Enum.Font.Code
	GUIObject.CatalogButton.Text = "Catalog"
	GUIObject.CatalogButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.CatalogButton.TextScaled = true
	GUIObject.CatalogButton.TextSize = 14.000
	GUIObject.CatalogButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.CatalogButton.TextWrapped = true

	GUIObject.UIGradient_33.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.UIGradient_33.Rotation = -90
	GUIObject.UIGradient_33.Parent = GUIObject.Catalog_2

	GUIObject.Edit_2.Name = "Edit"
	GUIObject.Edit_2.Parent = GUIObject.ButtonFrame
	GUIObject.Edit_2.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Edit_2.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Edit_2.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Edit_2.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_8.Parent = GUIObject.Edit_2

	GUIObject.UICorner_33.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_33.Parent = GUIObject.Edit_2

	GUIObject.EditButton.Name = "EditButton"
	GUIObject.EditButton.Parent = GUIObject.Edit_2
	GUIObject.EditButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.EditButton.BackgroundTransparency = 1.000
	GUIObject.EditButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.EditButton.Font = Enum.Font.Code
	GUIObject.EditButton.Text = "Edit"
	GUIObject.EditButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.EditButton.TextScaled = true
	GUIObject.EditButton.TextSize = 14.000
	GUIObject.EditButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.EditButton.TextWrapped = true

	GUIObject.UIGradient_32.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 22, 28)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(32, 35, 46))}
	GUIObject.UIGradient_32.Rotation = -90
	GUIObject.UIGradient_32.Parent = GUIObject.Edit_2

	GUIObject.Catalog_3.Name = "Catalog"
	GUIObject.Catalog_3.Parent = GUIObject.PageFrame
	GUIObject.Catalog_3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Catalog_3.BackgroundTransparency = 1.000
	GUIObject.Catalog_3.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Catalog_3.Visible = false

	GUIObject.UsernameFrame.Name = "UsernameFrame"
	GUIObject.UsernameFrame.Parent = GUIObject.Catalog_3
	GUIObject.UsernameFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.UsernameFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.UsernameFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.UsernameFrame.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	GUIObject.UsernameFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_27.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_27.Parent = GUIObject.UsernameFrame

	GUIObject.UsernameTextbox.Name = "UsernameTextbox"
	GUIObject.UsernameTextbox.Parent = GUIObject.UsernameFrame
	GUIObject.UsernameTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.UsernameTextbox.BackgroundTransparency = 1.000
	GUIObject.UsernameTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.UsernameTextbox.ClearTextOnFocus = false
	GUIObject.UsernameTextbox.Font = Enum.Font.Code
	GUIObject.UsernameTextbox.PlaceholderText = "Username"
	GUIObject.UsernameTextbox.Text = ""
	GUIObject.UsernameTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.UsernameTextbox.TextScaled = true
	GUIObject.UsernameTextbox.TextSize = 14.000
	GUIObject.UsernameTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.UsernameTextbox.TextWrapped = true

	GUIObject.UIGradient_26.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 15, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 24, 32))}
	GUIObject.UIGradient_26.Rotation = -90
	GUIObject.UIGradient_26.Parent = GUIObject.UsernameFrame

	GUIObject.AccessoryFrame.Name = "AccessoryFrame"
	GUIObject.AccessoryFrame.Parent = GUIObject.Catalog_3
	GUIObject.AccessoryFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.AccessoryFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.AccessoryFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.AccessoryFrame.Position = UDim2.new(0.5, 0, 0.109999999, 0)
	GUIObject.AccessoryFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_28.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_28.Parent = GUIObject.AccessoryFrame

	GUIObject.AccessoryTextbox.Name = "AccessoryTextbox"
	GUIObject.AccessoryTextbox.Parent = GUIObject.AccessoryFrame
	GUIObject.AccessoryTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.AccessoryTextbox.BackgroundTransparency = 1.000
	GUIObject.AccessoryTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.AccessoryTextbox.ClearTextOnFocus = false
	GUIObject.AccessoryTextbox.Font = Enum.Font.Code
	GUIObject.AccessoryTextbox.PlaceholderText = "Accessory Id"
	GUIObject.AccessoryTextbox.Text = ""
	GUIObject.AccessoryTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.AccessoryTextbox.TextScaled = true
	GUIObject.AccessoryTextbox.TextSize = 14.000
	GUIObject.AccessoryTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.AccessoryTextbox.TextWrapped = true

	GUIObject.UIGradient_27.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 45, 94)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 80, 145))}
	GUIObject.UIGradient_27.Rotation = -90
	GUIObject.UIGradient_27.Parent = GUIObject.AccessoryFrame

	GUIObject.ShirtFrame.Name = "ShirtFrame"
	GUIObject.ShirtFrame.Parent = GUIObject.Catalog_3
	GUIObject.ShirtFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ShirtFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ShirtFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ShirtFrame.Position = UDim2.new(0.5, 0, 0.194999993, 0)
	GUIObject.ShirtFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_29.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_29.Parent = GUIObject.ShirtFrame

	GUIObject.ShirtTextbox.Name = "ShirtTextbox"
	GUIObject.ShirtTextbox.Parent = GUIObject.ShirtFrame
	GUIObject.ShirtTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ShirtTextbox.BackgroundTransparency = 1.000
	GUIObject.ShirtTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ShirtTextbox.ClearTextOnFocus = false
	GUIObject.ShirtTextbox.Font = Enum.Font.Code
	GUIObject.ShirtTextbox.PlaceholderText = "Shirt Id"
	GUIObject.ShirtTextbox.Text = ""
	GUIObject.ShirtTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ShirtTextbox.TextScaled = true
	GUIObject.ShirtTextbox.TextSize = 14.000
	GUIObject.ShirtTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.ShirtTextbox.TextWrapped = true

	GUIObject.UIGradient_28.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 45, 94)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 80, 145))}
	GUIObject.UIGradient_28.Rotation = -90
	GUIObject.UIGradient_28.Parent = GUIObject.ShirtFrame

	GUIObject.PantsFrame.Name = "PantsFrame"
	GUIObject.PantsFrame.Parent = GUIObject.Catalog_3
	GUIObject.PantsFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.PantsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PantsFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.PantsFrame.Position = UDim2.new(0.5, 0, 0.280000001, 0)
	GUIObject.PantsFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_30.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_30.Parent = GUIObject.PantsFrame

	GUIObject.PantsTextbox.Name = "PantsTextbox"
	GUIObject.PantsTextbox.Parent = GUIObject.PantsFrame
	GUIObject.PantsTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.PantsTextbox.BackgroundTransparency = 1.000
	GUIObject.PantsTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.PantsTextbox.ClearTextOnFocus = false
	GUIObject.PantsTextbox.Font = Enum.Font.Code
	GUIObject.PantsTextbox.PlaceholderText = "Pants Id"
	GUIObject.PantsTextbox.Text = ""
	GUIObject.PantsTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PantsTextbox.TextScaled = true
	GUIObject.PantsTextbox.TextSize = 14.000
	GUIObject.PantsTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.PantsTextbox.TextWrapped = true

	GUIObject.UIGradient_29.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 45, 94)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 80, 145))}
	GUIObject.UIGradient_29.Rotation = -90
	GUIObject.UIGradient_29.Parent = GUIObject.PantsFrame

	GUIObject.ShirtGraphicFrame.Name = "ShirtGraphicFrame"
	GUIObject.ShirtGraphicFrame.Parent = GUIObject.Catalog_3
	GUIObject.ShirtGraphicFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ShirtGraphicFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ShirtGraphicFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ShirtGraphicFrame.Position = UDim2.new(0.5, 0, 0.36500001, 0)
	GUIObject.ShirtGraphicFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_31.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_31.Parent = GUIObject.ShirtGraphicFrame

	GUIObject.ShirtGraphicTextbox.Name = "ShirtGraphicTextbox"
	GUIObject.ShirtGraphicTextbox.Parent = GUIObject.ShirtGraphicFrame
	GUIObject.ShirtGraphicTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ShirtGraphicTextbox.BackgroundTransparency = 1.000
	GUIObject.ShirtGraphicTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ShirtGraphicTextbox.ClearTextOnFocus = false
	GUIObject.ShirtGraphicTextbox.Font = Enum.Font.Code
	GUIObject.ShirtGraphicTextbox.PlaceholderText = "Shirt Graphic Id"
	GUIObject.ShirtGraphicTextbox.Text = ""
	GUIObject.ShirtGraphicTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ShirtGraphicTextbox.TextScaled = true
	GUIObject.ShirtGraphicTextbox.TextSize = 14.000
	GUIObject.ShirtGraphicTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.ShirtGraphicTextbox.TextWrapped = true

	GUIObject.UIGradient_30.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 45, 94)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 80, 145))}
	GUIObject.UIGradient_30.Rotation = -90
	GUIObject.UIGradient_30.Parent = GUIObject.ShirtGraphicFrame

	GUIObject.Edit.Name = "Edit"
	GUIObject.Edit.Parent = GUIObject.PageFrame
	GUIObject.Edit.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Edit.BackgroundTransparency = 1.000
	GUIObject.Edit.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Edit.Visible = false

	GUIObject.MeshNameFrame.Name = "MeshNameFrame"
	GUIObject.MeshNameFrame.Parent = GUIObject.Edit
	GUIObject.MeshNameFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.MeshNameFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MeshNameFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.MeshNameFrame.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	GUIObject.MeshNameFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICorner_32.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_32.Parent = GUIObject.MeshNameFrame

	GUIObject.MeshNameTextbox.Name = "MeshNameTextbox"
	GUIObject.MeshNameTextbox.Parent = GUIObject.MeshNameFrame
	GUIObject.MeshNameTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.MeshNameTextbox.BackgroundTransparency = 1.000
	GUIObject.MeshNameTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.MeshNameTextbox.ClearTextOnFocus = false
	GUIObject.MeshNameTextbox.Font = Enum.Font.Code
	GUIObject.MeshNameTextbox.PlaceholderText = "Mesh Name"
	GUIObject.MeshNameTextbox.Text = ""
	GUIObject.MeshNameTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MeshNameTextbox.TextScaled = true
	GUIObject.MeshNameTextbox.TextSize = 14.000
	GUIObject.MeshNameTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.MeshNameTextbox.TextWrapped = true

	GUIObject.UIGradient_31.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 15, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 24, 32))}
	GUIObject.UIGradient_31.Rotation = -90
	GUIObject.UIGradient_31.Parent = GUIObject.MeshNameFrame

	GUIObject.PropertyListFrame.Name = "PropertyListFrame"
	GUIObject.PropertyListFrame.Parent = GUIObject.Edit
	GUIObject.PropertyListFrame.Active = true
	GUIObject.PropertyListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.PropertyListFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.PropertyListFrame.BackgroundTransparency = 1.000
	GUIObject.PropertyListFrame.BorderSizePixel = 0
	GUIObject.PropertyListFrame.Position = UDim2.new(0.499999911, 0, 0.605427802, 0)
	GUIObject.PropertyListFrame.Size = UDim2.new(0.949999988, 0, 0.74982059, 0)
	GUIObject.PropertyListFrame.BottomImage = "rbxassetid://5946093983"
	GUIObject.PropertyListFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.PropertyListFrame.MidImage = ""
	GUIObject.PropertyListFrame.ScrollBarThickness = 0
	GUIObject.PropertyListFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.PropertyListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	GUIObject.PropertyListFrame.TopImage = "rbxassetid://5946093983"

	GUIObject.UIGridLayout_4.Parent = GUIObject.PropertyListFrame
	GUIObject.UIGridLayout_4.SortOrder = Enum.SortOrder.LayoutOrder
	GUIObject.UIGridLayout_4.CellPadding = UDim2.new(0,0,0,0)
	GUIObject.UIGridLayout_4.CellSize = UDim2.new(0.300000012*3.5, 0, 0.174999997*3.5, 0)

	GUIObject.EditNote.Parent = GUIObject.Edit
	GUIObject.EditNote.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.EditNote.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.EditNote.BackgroundTransparency = 1.000
	GUIObject.EditNote.Position = UDim2.new(0.50000006, 0, 0.110409796, 0)
	GUIObject.EditNote.Size = UDim2.new(0.890999973, 0, 0.1, 0)
	GUIObject.EditNote.Font = Enum.Font.Code
	GUIObject.EditNote.Text = "Self = Change Default Mesh Part\\n--------------------------------------\\nPlayer Name = Change Personal Mesh Part"
	GUIObject.EditNote.TextColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.EditNote.TextScaled = true
	GUIObject.EditNote.TextSize = 14.000
	GUIObject.EditNote.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.EditNote.TextStrokeTransparency = 0.000
	GUIObject.EditNote.TextWrapped = true
	GUIObject.EditNote.TextXAlignment = Enum.TextXAlignment.Left
	GUIObject.EditNote.Visible = false

	GUIObject.CharacterPreviewFrame.Name = "CharacterPreviewFrame"
	GUIObject.CharacterPreviewFrame.Parent = GUIObject.MainFrame
	GUIObject.CharacterPreviewFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.CharacterPreviewFrame.BackgroundTransparency = 1.000
	GUIObject.CharacterPreviewFrame.Position = UDim2.new(-0.458589792, 0, 0, 0)
	GUIObject.CharacterPreviewFrame.Size = UDim2.new(0.468550086, 0, 0.378379911, 0)

	GUIObject.ViewportFrame.BackgroundTransparency = 1.000
	GUIObject.ViewportFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ViewportFrame.Size = UDim2.new(1,0,1,0)
	GUIObject.ViewportFrame.CurrentCamera = GUIObject.ViewportCamera
	GUIObject.ViewportFrame.Parent = GUIObject.CharacterPreviewFrame

	GUIObject.ViewportCamera.CFrame = CFrame.new(4, 0.300000012, -4, -0.819152057, 0, 0.57357645, 0, 1, 0, -0.57357645, 0, -0.819152057)
	GUIObject.ViewportCamera.Parent = GUIObject.CharacterPreviewFrame

	GUIObject.PreviewUIAspectRatioConstraint.Parent = GUIObject.CharacterPreviewFrame
	GUIObject.PreviewUIAspectRatioConstraint.AspectRatio = 0.750
	GUIObject.PreviewUIAspectRatioConstraint.DominantAxis = Enum.DominantAxis.Height

	GUIObject.PreviewButton.Parent = GUIObject.CharacterPreviewFrame
	GUIObject.PreviewButton.Name = "PreviewButton"
	GUIObject.PreviewButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PreviewButton.BackgroundTransparency = 1.000
	GUIObject.PreviewButton.Position = UDim2.new(0, 0, 1.00000012, 0)
	GUIObject.PreviewButton.Size = UDim2.new(1, 0, 0.153530627, 0)
	GUIObject.PreviewButton.Font = Enum.Font.Code
	GUIObject.PreviewButton.Text = "Preview"
	GUIObject.PreviewButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PreviewButton.TextScaled = true
	GUIObject.PreviewButton.TextSize = 14.000
	GUIObject.PreviewButton.TextStrokeTransparency = 0.000
	GUIObject.PreviewButton.TextWrapped = true

	GUIObject.ClickExecuteFrame.Name = "ClickExecuteFrame"
	GUIObject.ClickExecuteFrame.Parent = GUIObject.Menu2
	GUIObject.ClickExecuteFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ClickExecuteFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ClickExecuteFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ClickExecuteFrame.Position = UDim2.new(0.5, 0, 0.629999995, 0)
	GUIObject.ClickExecuteFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradientCE.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(42, 16, 62)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(72, 25, 108))}
	GUIObject.UIGradientCE.Rotation = -90
	GUIObject.UIGradientCE.Parent = GUIObject.ClickExecuteFrame

	GUIObject.UICornerCE.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICornerCE.Parent = GUIObject.ClickExecuteFrame

	GUIObject.ClickExecuteButton.Name = "ClickExecuteButton"
	GUIObject.ClickExecuteButton.Parent = GUIObject.ClickExecuteFrame
	GUIObject.ClickExecuteButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ClickExecuteButton.BackgroundTransparency = 1.000
	GUIObject.ClickExecuteButton.BorderSizePixel = 0
	GUIObject.ClickExecuteButton.LayoutOrder = 1
	GUIObject.ClickExecuteButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ClickExecuteButton.Font = Enum.Font.Code
	GUIObject.ClickExecuteButton.Text = "Click Execute"
	GUIObject.ClickExecuteButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ClickExecuteButton.TextScaled = true
	GUIObject.ClickExecuteButton.TextSize = 14.000
	GUIObject.ClickExecuteButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ClickExecuteButton.TextStrokeTransparency = 0.000
	GUIObject.ClickExecuteButton.TextWrapped = true

	GUIObject.PositionPhysicsMultiplyFrame.Name = "PositionPhysicsMultiplyFrame"
	GUIObject.PositionPhysicsMultiplyFrame.Parent = GUIObject.Menu2
	GUIObject.PositionPhysicsMultiplyFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.PositionPhysicsMultiplyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PositionPhysicsMultiplyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.PositionPhysicsMultiplyFrame.Position = UDim2.new(0.5, 0, 0.714999974, 0)
	GUIObject.PositionPhysicsMultiplyFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICornerPPM.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICornerPPM.Parent = GUIObject.PositionPhysicsMultiplyFrame

	GUIObject.PositionPhysicsMultiplyText.Name = "PositionPhysicsMultiplyText"
	GUIObject.PositionPhysicsMultiplyText.Parent = GUIObject.PositionPhysicsMultiplyFrame
	GUIObject.PositionPhysicsMultiplyText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.PositionPhysicsMultiplyText.BackgroundTransparency = 1.000
	GUIObject.PositionPhysicsMultiplyText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.PositionPhysicsMultiplyText.Font = Enum.Font.Code
	GUIObject.PositionPhysicsMultiplyText.PlaceholderText = "Position Physics Multiply"
	GUIObject.PositionPhysicsMultiplyText.Text = "1"
	GUIObject.PositionPhysicsMultiplyText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PositionPhysicsMultiplyText.TextScaled = true
	GUIObject.PositionPhysicsMultiplyText.TextSize = 14.000
	GUIObject.PositionPhysicsMultiplyText.TextWrapped = true

	GUIObject.UIGradientPPM.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 52))}
	GUIObject.UIGradientPPM.Rotation = -90
	GUIObject.UIGradientPPM.Parent = GUIObject.PositionPhysicsMultiplyFrame

	GUIObject.RotationPhysicsMultiplyFrame.Name = "RotationPhysicsMultiplyFrame"
	GUIObject.RotationPhysicsMultiplyFrame.Parent = GUIObject.Menu2
	GUIObject.RotationPhysicsMultiplyFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.RotationPhysicsMultiplyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RotationPhysicsMultiplyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.RotationPhysicsMultiplyFrame.Position = UDim2.new(0.5, 0, 0.800000012, 0)
	GUIObject.RotationPhysicsMultiplyFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICornerRPM.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICornerRPM.Parent = GUIObject.RotationPhysicsMultiplyFrame

	GUIObject.RotationPhysicsMultiplyText.Name = "RotationPhysicsMultiplyText"
	GUIObject.RotationPhysicsMultiplyText.Parent = GUIObject.RotationPhysicsMultiplyFrame
	GUIObject.RotationPhysicsMultiplyText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.RotationPhysicsMultiplyText.BackgroundTransparency = 1.000
	GUIObject.RotationPhysicsMultiplyText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.RotationPhysicsMultiplyText.Font = Enum.Font.Code
	GUIObject.RotationPhysicsMultiplyText.PlaceholderText = "Rotation Physics Multiply"
	GUIObject.RotationPhysicsMultiplyText.Text = "4"
	GUIObject.RotationPhysicsMultiplyText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RotationPhysicsMultiplyText.TextScaled = true
	GUIObject.RotationPhysicsMultiplyText.TextSize = 14.000
	GUIObject.RotationPhysicsMultiplyText.TextWrapped = true

	GUIObject.UIGradientRPM.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 52))}
	GUIObject.UIGradientRPM.Rotation = -90
	GUIObject.UIGradientRPM.Parent = GUIObject.RotationPhysicsMultiplyFrame

	GUIObject.MobileCloseButton.Name = "MobileCloseButton"
	GUIObject.MobileCloseButton.Parent = GUIObject.MobileCloseButtonScreen
	GUIObject.MobileCloseButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.MobileCloseButton.BackgroundTransparency = 1.000
	GUIObject.MobileCloseButton.Position = UDim2.new(0.964, 0, 0.947, 0)
	GUIObject.MobileCloseButton.Size = UDim2.new(0.036, 0, 0.053, 0)
	GUIObject.MobileCloseButton.Image = "rbxassetid://264596039"

	GUIObject.MCBUIAspectRatioConstraint.Parent = GUIObject.MobileCloseButton

	GUIObject.SkinToneFrame.Name = "SkinToneFrame"
	GUIObject.SkinToneFrame.Parent = GUIObject.Menu2
	GUIObject.SkinToneFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.SkinToneFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.SkinToneFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.SkinToneFrame.Position = UDim2.new(0.271, 0, 0.88499999, 0)
	GUIObject.SkinToneFrame.Size = UDim2.new(0.425, 0, 0.0646399707, 0)

	GUIObject.STUICorner.CornerRadius = UDim.new(0.25, 0)
	GUIObject.STUICorner.Parent = GUIObject.SkinToneFrame

	GUIObject.SkinToneText.Name = "SkinToneText"
	GUIObject.SkinToneText.Parent = GUIObject.SkinToneFrame
	GUIObject.SkinToneText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.SkinToneText.BackgroundTransparency = 1.000
	GUIObject.SkinToneText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.SkinToneText.Font = Enum.Font.Code
	GUIObject.SkinToneText.PlaceholderText = "Skin Tone [RGB] (Empty=Disable)"
	GUIObject.SkinToneText.Text = ""
	GUIObject.SkinToneText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.SkinToneText.TextScaled = true
	GUIObject.SkinToneText.TextSize = 14.000
	GUIObject.SkinToneText.TextWrapped = true

	GUIObject.STUIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 23, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 36, 54))}
	GUIObject.STUIGradient.Rotation = -90
	GUIObject.STUIGradient.Parent = GUIObject.SkinToneFrame

	GUIObject.NippleColorFrame.Name = "NippleColorFrame"
	GUIObject.NippleColorFrame.Parent = GUIObject.Menu2
	GUIObject.NippleColorFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.NippleColorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.NippleColorFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.NippleColorFrame.Position = UDim2.new(0.731, 0, 0.88499999, 0)
	GUIObject.NippleColorFrame.Size = UDim2.new(0.425, 0, 0.0646399707, 0)

	GUIObject.NTUICorner.CornerRadius = UDim.new(0.25, 0)
	GUIObject.NTUICorner.Parent = GUIObject.NippleColorFrame

	GUIObject.NippleColorText.Name = "NippleColorText"
	GUIObject.NippleColorText.Parent = GUIObject.NippleColorFrame
	GUIObject.NippleColorText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.NippleColorText.BackgroundTransparency = 1.000
	GUIObject.NippleColorText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.NippleColorText.Font = Enum.Font.Code
	GUIObject.NippleColorText.PlaceholderText = "Nipple Color [RGB] (Empty=Disable)"
	GUIObject.NippleColorText.Text = ""
	GUIObject.NippleColorText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.NippleColorText.TextScaled = true
	GUIObject.NippleColorText.TextSize = 14.000
	GUIObject.NippleColorText.TextWrapped = true

	GUIObject.NTUIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(25, 23, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 36, 54))}
	GUIObject.NTUIGradient.Rotation = -90
	GUIObject.NTUIGradient.Parent = GUIObject.NippleColorFrame

	GUIObject.Menu3.Name = "Menu3"
	GUIObject.Menu3.Parent = GUIObject.PageFrame
	GUIObject.Menu3.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Menu3.BackgroundTransparency = 1.000
	GUIObject.Menu3.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.Menu3.Visible = false

	GUIObject.BreastsScaleFrame.Name = "BreastsScaleFrame"
	GUIObject.BreastsScaleFrame.Parent = GUIObject.Menu3
	GUIObject.BreastsScaleFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BreastsScaleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BreastsScaleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BreastsScaleFrame.Position = UDim2.new(0.5, 0, 0.0250000004, 0)
	GUIObject.BreastsScaleFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.BS1UICorner.CornerRadius = UDim.new(0.25, 0)
	GUIObject.BS1UICorner.Parent = GUIObject.BreastsScaleFrame

	GUIObject.BreastsScaleText.Name = "BreastsScaleText"
	GUIObject.BreastsScaleText.Parent = GUIObject.BreastsScaleFrame
	GUIObject.BreastsScaleText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BreastsScaleText.BackgroundTransparency = 1.000
	GUIObject.BreastsScaleText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BreastsScaleText.ClearTextOnFocus = false
	GUIObject.BreastsScaleText.Font = Enum.Font.Code
	GUIObject.BreastsScaleText.PlaceholderText = "Breasts Scale"
	GUIObject.BreastsScaleText.Text = "1"
	GUIObject.BreastsScaleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BreastsScaleText.TextScaled = true
	GUIObject.BreastsScaleText.TextSize = 14.000
	GUIObject.BreastsScaleText.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.BreastsScaleText.TextWrapped = true

	GUIObject.BS1UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 52))}
	GUIObject.BS1UIGradient.Rotation = -90
	GUIObject.BS1UIGradient.Parent = GUIObject.BreastsScaleFrame

	GUIObject.ButtsScaleFrame.Name = "ButtsScaleFrame"
	GUIObject.ButtsScaleFrame.Parent = GUIObject.Menu3
	GUIObject.ButtsScaleFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ButtsScaleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ButtsScaleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ButtsScaleFrame.Position = UDim2.new(0.5, 0, 0.109999999, 0)
	GUIObject.ButtsScaleFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.BS2UICorner.CornerRadius = UDim.new(0.25, 0)
	GUIObject.BS2UICorner.Parent = GUIObject.ButtsScaleFrame

	GUIObject.BS2UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 52))}
	GUIObject.BS2UIGradient.Rotation = -90
	GUIObject.BS2UIGradient.Parent = GUIObject.ButtsScaleFrame

	GUIObject.ButtsScaleText.Name = "ButtsScaleText"
	GUIObject.ButtsScaleText.Parent = GUIObject.ButtsScaleFrame
	GUIObject.ButtsScaleText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.ButtsScaleText.BackgroundTransparency = 1.000
	GUIObject.ButtsScaleText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ButtsScaleText.ClearTextOnFocus = false
	GUIObject.ButtsScaleText.Font = Enum.Font.Code
	GUIObject.ButtsScaleText.PlaceholderText = "Butts Scale"
	GUIObject.ButtsScaleText.Text = "1"
	GUIObject.ButtsScaleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ButtsScaleText.TextScaled = true
	GUIObject.ButtsScaleText.TextSize = 14.000
	GUIObject.ButtsScaleText.TextWrapped = true

	GUIObject.LegsScaleFrame.Name = "LegsScaleFrame"
	GUIObject.LegsScaleFrame.Parent = GUIObject.Menu3
	GUIObject.LegsScaleFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.LegsScaleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LegsScaleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.LegsScaleFrame.Position = UDim2.new(0.5, 0, 0.195, 0)
	GUIObject.LegsScaleFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.BS3UICorner.CornerRadius = UDim.new(0.25, 0)
	GUIObject.BS3UICorner.Parent = GUIObject.LegsScaleFrame

	GUIObject.BS3UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 52))}
	GUIObject.BS3UIGradient.Rotation = -90
	GUIObject.BS3UIGradient.Parent = GUIObject.LegsScaleFrame

	GUIObject.LegsScaleText.Name = "LegsScaleText"
	GUIObject.LegsScaleText.Parent = GUIObject.LegsScaleFrame
	GUIObject.LegsScaleText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.LegsScaleText.BackgroundTransparency = 1.000
	GUIObject.LegsScaleText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.LegsScaleText.ClearTextOnFocus = false
	GUIObject.LegsScaleText.Font = Enum.Font.Code
	GUIObject.LegsScaleText.PlaceholderText = "Legs Scale"
	GUIObject.LegsScaleText.Text = "1"
	GUIObject.LegsScaleText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LegsScaleText.TextScaled = true
	GUIObject.LegsScaleText.TextSize = 14.000
	GUIObject.LegsScaleText.TextWrapped = true

	GUIObject.OutfitIdFrame.Name = "Outfit Id"
	GUIObject.OutfitIdFrame.Parent = GUIObject.Catalog_3
	GUIObject.OutfitIdFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.OutfitIdFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.OutfitIdFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.OutfitIdFrame.Position = UDim2.new(0.5, 0, 0.449999988, 0)
	GUIObject.OutfitIdFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UICornerUI.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICornerUI.Parent = GUIObject.OutfitIdFrame

	GUIObject.OutfitIdTextbox.Name = "OutfitIdTextbox"
	GUIObject.OutfitIdTextbox.Parent = GUIObject.OutfitIdFrame
	GUIObject.OutfitIdTextbox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.OutfitIdTextbox.BackgroundTransparency = 1.000
	GUIObject.OutfitIdTextbox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.OutfitIdTextbox.ClearTextOnFocus = false
	GUIObject.OutfitIdTextbox.Font = Enum.Font.Code
	GUIObject.OutfitIdTextbox.PlaceholderText = "Outfit Id"
	GUIObject.OutfitIdTextbox.Text = ""
	GUIObject.OutfitIdTextbox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.OutfitIdTextbox.TextScaled = true
	GUIObject.OutfitIdTextbox.TextSize = 14.000
	GUIObject.OutfitIdTextbox.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.OutfitIdTextbox.TextWrapped = true

	GUIObject.UIGradientUI.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(14, 15, 20)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(22, 24, 32))}
	GUIObject.UIGradientUI.Rotation = -90
	GUIObject.UIGradientUI.Parent = GUIObject.OutfitIdFrame

	GUIObject.TorsoTypeFrame.Name = "TorsoTypeFrame"
	GUIObject.TorsoTypeFrame.Parent = GUIObject.Menu3
	GUIObject.TorsoTypeFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.TorsoTypeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TorsoTypeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.TorsoTypeFrame.Position = UDim2.new(0.5, 0, 0.28, 0)
	GUIObject.TorsoTypeFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A1.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 56))}
	GUIObject.UIGradient_A1.Rotation = -90
	GUIObject.UIGradient_A1.Parent = GUIObject.TorsoTypeFrame

	GUIObject.UICorner_A1.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A1.Parent = GUIObject.TorsoTypeFrame

	GUIObject.TorsoTypeButton.Name = "TorsoTypeButton"
	GUIObject.TorsoTypeButton.Parent = GUIObject.TorsoTypeFrame
	GUIObject.TorsoTypeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TorsoTypeButton.BackgroundTransparency = 1.000
	GUIObject.TorsoTypeButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.TorsoTypeButton.ZIndex = 2
	GUIObject.TorsoTypeButton.Font = Enum.Font.Code
	GUIObject.TorsoTypeButton.Text = "Torso Type: 1"
	GUIObject.TorsoTypeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TorsoTypeButton.TextScaled = true
	GUIObject.TorsoTypeButton.TextSize = 14.000
	GUIObject.TorsoTypeButton.TextWrapped = true

	GUIObject.LegsTypeFrame.Name = "LegsTypeFrame"
	GUIObject.LegsTypeFrame.Parent = GUIObject.Menu3
	GUIObject.LegsTypeFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.LegsTypeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LegsTypeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.LegsTypeFrame.Position = UDim2.new(0.5, 0, 0.45, 0)
	GUIObject.LegsTypeFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A2.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 56))}
	GUIObject.UIGradient_A2.Rotation = -90
	GUIObject.UIGradient_A2.Parent = GUIObject.LegsTypeFrame

	GUIObject.UICorner_A2.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A2.Parent = GUIObject.LegsTypeFrame

	GUIObject.LegsTypeButton.Name = "LegsTypeButton"
	GUIObject.LegsTypeButton.Parent = GUIObject.LegsTypeFrame
	GUIObject.LegsTypeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LegsTypeButton.BackgroundTransparency = 1.000
	GUIObject.LegsTypeButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.LegsTypeButton.ZIndex = 2
	GUIObject.LegsTypeButton.Font = Enum.Font.Code
	GUIObject.LegsTypeButton.Text = "Legs Type: 1"
	GUIObject.LegsTypeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.LegsTypeButton.TextScaled = true
	GUIObject.LegsTypeButton.TextSize = 14.000
	GUIObject.LegsTypeButton.TextWrapped = true

	GUIObject.ArmTypeFrame.Name = "ArmTypeFrame"
	GUIObject.ArmTypeFrame.Parent = GUIObject.Menu3
	GUIObject.ArmTypeFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ArmTypeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ArmTypeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ArmTypeFrame.Position = UDim2.new(0.5, 0, 0.365, 0)
	GUIObject.ArmTypeFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A11.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 56))}
	GUIObject.UIGradient_A11.Rotation = -90
	GUIObject.UIGradient_A11.Parent = GUIObject.ArmTypeFrame

	GUIObject.UICorner_A11.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A11.Parent = GUIObject.ArmTypeFrame

	GUIObject.ArmTypeButton.Name = "ArmTypeButton"
	GUIObject.ArmTypeButton.Parent = GUIObject.ArmTypeFrame
	GUIObject.ArmTypeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ArmTypeButton.BackgroundTransparency = 1.000
	GUIObject.ArmTypeButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ArmTypeButton.ZIndex = 2
	GUIObject.ArmTypeButton.Font = Enum.Font.Code
	GUIObject.ArmTypeButton.Text = "Arm Type: 1"
	GUIObject.ArmTypeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ArmTypeButton.TextScaled = true
	GUIObject.ArmTypeButton.TextSize = 14.000
	GUIObject.ArmTypeButton.TextWrapped = true

	GUIObject.ButtTypeFrame.Name = "ButtTypeFrame"
	GUIObject.ButtTypeFrame.Parent = GUIObject.Menu3
	GUIObject.ButtTypeFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.ButtTypeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ButtTypeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.ButtTypeFrame.Position = UDim2.new(0.5, 0, 0.535, 0)
	GUIObject.ButtTypeFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A16.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 36)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 56))}
	GUIObject.UIGradient_A16.Rotation = -90
	GUIObject.UIGradient_A16.Parent = GUIObject.ButtTypeFrame

	GUIObject.UICorner_A16.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A16.Parent = GUIObject.ButtTypeFrame

	GUIObject.ButtTypeButton.Name = "ButtTypeButton"
	GUIObject.ButtTypeButton.Parent = GUIObject.ButtTypeFrame
	GUIObject.ButtTypeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ButtTypeButton.BackgroundTransparency = 1.000
	GUIObject.ButtTypeButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.ButtTypeButton.ZIndex = 2
	GUIObject.ButtTypeButton.Font = Enum.Font.Code
	GUIObject.ButtTypeButton.Text = "Butt Type: 1"
	GUIObject.ButtTypeButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.ButtTypeButton.TextScaled = true
	GUIObject.ButtTypeButton.TextSize = 14.000
	GUIObject.ButtTypeButton.TextWrapped = true

	GUIObject.FPFrame.Name = "FirstPersonFrame"
	GUIObject.FPFrame.Parent = GUIObject.Menu2
	GUIObject.FPFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.FPFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FPFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.FPFrame.Position = UDim2.new(0.647907138, 0, 0.11, 0)
	GUIObject.FPFrame.Size = UDim2.new(0.595495105, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A4.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A4.Rotation = -90
	GUIObject.UIGradient_A4.Parent = GUIObject.FPFrame

	GUIObject.UICorner_A4.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A4.Parent = GUIObject.FPFrame

	GUIObject.FPExecute.Name = "FirstPerson"
	GUIObject.FPExecute.Parent = GUIObject.FPFrame
	GUIObject.FPExecute.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.FPExecute.BackgroundTransparency = 1.000
	GUIObject.FPExecute.BorderSizePixel = 0
	GUIObject.FPExecute.LayoutOrder = 1
	GUIObject.FPExecute.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.FPExecute.Font = Enum.Font.Code
	GUIObject.FPExecute.Text = "First Person POV"
	GUIObject.FPExecute.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FPExecute.TextScaled = true
	GUIObject.FPExecute.TextSize = 14.000
	GUIObject.FPExecute.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.FPExecute.TextStrokeTransparency = 0.000
	GUIObject.FPExecute.TextWrapped = true

	GUIObject.GravityFrame.Name = "GravityFrame"
	GUIObject.GravityFrame.Parent = GUIObject.Menu2
	GUIObject.GravityFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.GravityFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.GravityFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.GravityFrame.Position = UDim2.new(0.647907138, 0, 0.195, 0)
	GUIObject.GravityFrame.Size = UDim2.new(0.595495105, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A15.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A15.Rotation = -90
	GUIObject.UIGradient_A15.Parent = GUIObject.GravityFrame

	GUIObject.UICorner_A15.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A15.Parent = GUIObject.GravityFrame

	GUIObject.GravityButton.Name = "GravityButton"
	GUIObject.GravityButton.Parent = GUIObject.GravityFrame
	GUIObject.GravityButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.GravityButton.BackgroundTransparency = 1.000
	GUIObject.GravityButton.BorderSizePixel = 0
	GUIObject.GravityButton.LayoutOrder = 1
	GUIObject.GravityButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.GravityButton.Font = Enum.Font.Code
	GUIObject.GravityButton.Text = "Physics Obey Gravity"
	GUIObject.GravityButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.GravityButton.TextScaled = true
	GUIObject.GravityButton.TextSize = 14.000
	GUIObject.GravityButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.GravityButton.TextStrokeTransparency = 0.000
	GUIObject.GravityButton.TextWrapped = true

	GUIObject.HP.Name = "HP"
	GUIObject.HP.Parent = GUIObject.ButtonFrame
	GUIObject.HP.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HP.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.HP.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.HP.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_A1.Parent = GUIObject.HP

	GUIObject.UICorner_A3.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A3.Parent = GUIObject.HP

	GUIObject.HPButton.Name = "HPButton"
	GUIObject.HPButton.Parent = GUIObject.HP
	GUIObject.HPButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HPButton.BackgroundTransparency = 1.000
	GUIObject.HPButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.HPButton.Font = Enum.Font.Code
	GUIObject.HPButton.Text = "HP"
	GUIObject.HPButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HPButton.TextScaled = true
	GUIObject.HPButton.TextSize = 14.000
	GUIObject.HPButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.HPButton.TextWrapped = true

	GUIObject.UIGradient_A3.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A3.Rotation = -90
	GUIObject.UIGradient_A3.Parent = GUIObject.HP

	GUIObject.HPFrame.Name = "HP"
	GUIObject.HPFrame.Parent = GUIObject.PageFrame
	GUIObject.HPFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HPFrame.BackgroundTransparency = 1.000
	GUIObject.HPFrame.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.HPFrame.Visible = false

	GUIObject.TopHPFrame.Name = "TopHPFrame"
	GUIObject.TopHPFrame.Parent = GUIObject.HPFrame
	GUIObject.TopHPFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.TopHPFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TopHPFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.TopHPFrame.Position = UDim2.new(0.5, 0, 0.025, 0)
	GUIObject.TopHPFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A5.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A5.Rotation = -90
	GUIObject.UIGradient_A5.Parent = GUIObject.TopHPFrame

	GUIObject.UICorner_A5.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A5.Parent = GUIObject.TopHPFrame

	GUIObject.TopHPText.Name = "TopHPText"
	GUIObject.TopHPText.ClearTextOnFocus = false
	GUIObject.TopHPText.Parent = GUIObject.TopHPFrame
	GUIObject.TopHPText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.TopHPText.BackgroundTransparency = 1.000
	GUIObject.TopHPText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.TopHPText.Font = Enum.Font.Code
	GUIObject.TopHPText.PlaceholderText = "Shirt Health"
	GUIObject.TopHPText.Text = ""
	GUIObject.TopHPText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TopHPText.TextScaled = true
	GUIObject.TopHPText.TextSize = 14.000
	GUIObject.TopHPText.TextWrapped = true

	GUIObject.TopClothesFrame.Name = "TopClothesFrame"
	GUIObject.TopClothesFrame.Parent = GUIObject.HPFrame
	GUIObject.TopClothesFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.TopClothesFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TopClothesFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.TopClothesFrame.Position = UDim2.new(0.5, 0, 0.11, 0)
	GUIObject.TopClothesFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A6.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A6.Rotation = -90
	GUIObject.UIGradient_A6.Parent = GUIObject.TopClothesFrame

	GUIObject.UICorner_A6.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A6.Parent = GUIObject.TopClothesFrame

	GUIObject.TopClothesText.Name = "TopClothesText"
	GUIObject.TopClothesText.ClearTextOnFocus = false
	GUIObject.TopClothesText.Parent = GUIObject.TopClothesFrame
	GUIObject.TopClothesText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.TopClothesText.BackgroundTransparency = 1.000
	GUIObject.TopClothesText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.TopClothesText.Font = Enum.Font.Code
	GUIObject.TopClothesText.PlaceholderText = "Ripped Shirt Id"
	GUIObject.TopClothesText.Text = ""
	GUIObject.TopClothesText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TopClothesText.TextScaled = true
	GUIObject.TopClothesText.TextSize = 14.000
	GUIObject.TopClothesText.TextWrapped = true

	GUIObject.BottomHPFrame.Name = "BottomHPFrame"
	GUIObject.BottomHPFrame.Parent = GUIObject.HPFrame
	GUIObject.BottomHPFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BottomHPFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BottomHPFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BottomHPFrame.Position = UDim2.new(0.5, 0, 0.195, 0)
	GUIObject.BottomHPFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A7.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A7.Rotation = -90
	GUIObject.UIGradient_A7.Parent = GUIObject.BottomHPFrame

	GUIObject.UICorner_A7.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A7.Parent = GUIObject.BottomHPFrame

	GUIObject.BottomHPText.Name = "BottomHPText"
	GUIObject.BottomHPText.ClearTextOnFocus = false
	GUIObject.BottomHPText.Parent = GUIObject.BottomHPFrame
	GUIObject.BottomHPText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BottomHPText.BackgroundTransparency = 1.000
	GUIObject.BottomHPText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BottomHPText.Font = Enum.Font.Code
	GUIObject.BottomHPText.PlaceholderText = "Pants Health"
	GUIObject.BottomHPText.Text = ""
	GUIObject.BottomHPText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BottomHPText.TextScaled = true
	GUIObject.BottomHPText.TextSize = 14.000
	GUIObject.BottomHPText.TextWrapped = true

	GUIObject.BottomClothesFrame.Name = "BottomClothesFrame"
	GUIObject.BottomClothesFrame.Parent = GUIObject.HPFrame
	GUIObject.BottomClothesFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BottomClothesFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BottomClothesFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BottomClothesFrame.Position = UDim2.new(0.5, 0, 0.28, 0)
	GUIObject.BottomClothesFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A8.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A8.Rotation = -90
	GUIObject.UIGradient_A8.Parent = GUIObject.BottomClothesFrame

	GUIObject.UICorner_A8.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A8.Parent = GUIObject.BottomClothesFrame

	GUIObject.BottomClothesText.Name = "BottomClothesText"
	GUIObject.BottomClothesText.ClearTextOnFocus = false
	GUIObject.BottomClothesText.Parent = GUIObject.BottomClothesFrame
	GUIObject.BottomClothesText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BottomClothesText.BackgroundTransparency = 1.000
	GUIObject.BottomClothesText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BottomClothesText.Font = Enum.Font.Code
	GUIObject.BottomClothesText.PlaceholderText = "Ripped Pants Id"
	GUIObject.BottomClothesText.Text = ""
	GUIObject.BottomClothesText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BottomClothesText.TextScaled = true
	GUIObject.BottomClothesText.TextSize = 14.000
	GUIObject.BottomClothesText.TextWrapped = true

	GUIObject.DamageFrame.Name = "DamageFrame"
	GUIObject.DamageFrame.Parent = GUIObject.HPFrame
	GUIObject.DamageFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.DamageFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.DamageFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.DamageFrame.Position = UDim2.new(0.5, 0, 0.365, 0)
	GUIObject.DamageFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A9.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 22, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 34, 48))}
	GUIObject.UIGradient_A9.Rotation = -90
	GUIObject.UIGradient_A9.Parent = GUIObject.DamageFrame

	GUIObject.UICorner_A9.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A9.Parent = GUIObject.DamageFrame

	GUIObject.DamageSFX.Name = "DamageSFX"
	GUIObject.DamageSFX.ClearTextOnFocus = false
	GUIObject.DamageSFX.Parent = GUIObject.DamageFrame
	GUIObject.DamageSFX.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.DamageSFX.BackgroundTransparency = 1.000
	GUIObject.DamageSFX.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.DamageSFX.Font = Enum.Font.Code
	GUIObject.DamageSFX.PlaceholderText = "Damage SFX Minimum (leave blank to disable)"
	GUIObject.DamageSFX.Text = ""
	GUIObject.DamageSFX.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.DamageSFX.TextScaled = true
	GUIObject.DamageSFX.TextSize = 14.000
	GUIObject.DamageSFX.TextWrapped = true

	GUIObject.VolumeFrame.Name = "VolumeFrame"
	GUIObject.VolumeFrame.Parent = GUIObject.HPFrame
	GUIObject.VolumeFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.VolumeFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.VolumeFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.VolumeFrame.Position = UDim2.new(0.5, 0, 0.45, 0)
	GUIObject.VolumeFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A10.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 22, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 34, 48))}
	GUIObject.UIGradient_A10.Rotation = -90
	GUIObject.UIGradient_A10.Parent = GUIObject.VolumeFrame

	GUIObject.UICorner_A10.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A10.Parent = GUIObject.VolumeFrame

	GUIObject.VolumeText.Name = "VolumeText"
	GUIObject.VolumeText.ClearTextOnFocus = false
	GUIObject.VolumeText.Parent = GUIObject.VolumeFrame
	GUIObject.VolumeText.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.VolumeText.BackgroundTransparency = 1.000
	GUIObject.VolumeText.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.VolumeText.Font = Enum.Font.Code
	GUIObject.VolumeText.PlaceholderText = "Volume"
	GUIObject.VolumeText.Text = "1"
	GUIObject.VolumeText.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.VolumeText.TextScaled = true
	GUIObject.VolumeText.TextSize = 14.000
	GUIObject.VolumeText.TextWrapped = true

	GUIObject.TPFrame.Name = "TearFrame"
	GUIObject.TPFrame.Parent = GUIObject.HPFrame
	GUIObject.TPFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.TPFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TPFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.TPFrame.Position = UDim2.new(0.271, 0, 0.535, 0)
	GUIObject.TPFrame.Size = UDim2.new(0.425, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A12.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 22, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 34, 48))}
	GUIObject.UIGradient_A12.Rotation = -90
	GUIObject.UIGradient_A12.Parent = GUIObject.TPFrame

	GUIObject.UICorner_A12.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A12.Parent = GUIObject.TPFrame

	GUIObject.TPToggle.Name = "TearToggle"
	GUIObject.TPToggle.Parent = GUIObject.TPFrame
	GUIObject.TPToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.TPToggle.BackgroundTransparency = 1.000
	GUIObject.TPToggle.BorderSizePixel = 0
	GUIObject.TPToggle.LayoutOrder = 1
	GUIObject.TPToggle.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.TPToggle.Font = Enum.Font.Code
	GUIObject.TPToggle.Text = "Tear Particles"
	GUIObject.TPToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TPToggle.TextScaled = true
	GUIObject.TPToggle.TextSize = 14.000
	GUIObject.TPToggle.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.TPToggle.TextStrokeTransparency = 0.000
	GUIObject.TPToggle.TextWrapped = true

	GUIObject.PHFrame.Name = "HealFrame"
	GUIObject.PHFrame.Parent = GUIObject.HPFrame
	GUIObject.PHFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.PHFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PHFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.PHFrame.Position = UDim2.new(0.731, 0, 0.535, 0)
	GUIObject.PHFrame.Size = UDim2.new(0.425, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A13.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 22, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 34, 48))}
	GUIObject.UIGradient_A13.Rotation = -90
	GUIObject.UIGradient_A13.Parent = GUIObject.PHFrame

	GUIObject.UICorner_A13.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A13.Parent = GUIObject.PHFrame

	GUIObject.PHToggle.Name = "HealToggle"
	GUIObject.PHToggle.Parent = GUIObject.PHFrame
	GUIObject.PHToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.PHToggle.BackgroundTransparency = 1.000
	GUIObject.PHToggle.BorderSizePixel = 0
	GUIObject.PHToggle.LayoutOrder = 1
	GUIObject.PHToggle.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.PHToggle.Font = Enum.Font.Code
	GUIObject.PHToggle.Text = "Heal Particles"
	GUIObject.PHToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.PHToggle.TextScaled = true
	GUIObject.PHToggle.TextSize = 14.000
	GUIObject.PHToggle.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.PHToggle.TextStrokeTransparency = 0.000
	GUIObject.PHToggle.TextWrapped = true

	GUIObject.Recolor.Name = "Recolor"
	GUIObject.Recolor.Parent = GUIObject.ButtonFrame
	GUIObject.Recolor.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.Recolor.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.Recolor.Position = UDim2.new(0.784810185, 0, 0.866666734, 0)
	GUIObject.Recolor.Size = UDim2.new(1, 0, 1, 0)

	GUIObject.UIAspectRatioConstraint_A2.Parent = GUIObject.Recolor

	GUIObject.UICorner_A14.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A14.Parent = GUIObject.Recolor

	GUIObject.RecolorButton.Name = "RecolorButton"
	GUIObject.RecolorButton.Parent = GUIObject.Recolor
	GUIObject.RecolorButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RecolorButton.BackgroundTransparency = 1.000
	GUIObject.RecolorButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.RecolorButton.Font = Enum.Font.Code
	GUIObject.RecolorButton.Text = "Recolor"
	GUIObject.RecolorButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RecolorButton.TextScaled = true
	GUIObject.RecolorButton.TextSize = 14.000
	GUIObject.RecolorButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.RecolorButton.TextWrapped = true

	GUIObject.UIGradient_A14.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 22, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 34, 48))}
	GUIObject.UIGradient_A14.Rotation = -90
	GUIObject.UIGradient_A14.Parent = GUIObject.Recolor

	GUIObject.RecolorFrame.Name = "Recolor"
	GUIObject.RecolorFrame.Parent = GUIObject.PageFrame
	GUIObject.RecolorFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.RecolorFrame.BackgroundTransparency = 1.000
	GUIObject.RecolorFrame.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.RecolorFrame.Visible = false

	GUIObject.RecolorListFrame.Name = "RecolorListFrame"
	GUIObject.RecolorListFrame.Parent = GUIObject.RecolorFrame
	GUIObject.RecolorListFrame.Active = true
	GUIObject.RecolorListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.RecolorListFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.RecolorListFrame.BackgroundTransparency = 1.000
	GUIObject.RecolorListFrame.BorderSizePixel = 0
	GUIObject.RecolorListFrame.Position = UDim2.new(0.5, 0, 0.5, 0)
	GUIObject.RecolorListFrame.Size = UDim2.new(0.95, 0, 0.95, 0)
	GUIObject.RecolorListFrame.BottomImage = "rbxassetid://5946093983"
	GUIObject.RecolorListFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.RecolorListFrame.MidImage = ""
	GUIObject.RecolorListFrame.ScrollBarThickness = 0
	GUIObject.RecolorListFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.RecolorListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	GUIObject.RecolorListFrame.TopImage = "rbxassetid://5946093983"

	GUIObject.UIGridLayout_A1.Parent = GUIObject.RecolorListFrame
	GUIObject.UIGridLayout_A1.SortOrder = Enum.SortOrder.LayoutOrder
	GUIObject.UIGridLayout_A1.HorizontalAlignment = Enum.HorizontalAlignment.Center
	GUIObject.UIGridLayout_A1.CellPadding = UDim2.new(0,0,.02,0)
	GUIObject.UIGridLayout_A1.CellSize = UDim2.new(.98, 0, 0.1, 0)

	GUIObject.BodyTransparencyFrame.Name = "BodyTransparencyFrame"
	GUIObject.BodyTransparencyFrame.Parent = GUIObject.Menu2
	GUIObject.BodyTransparencyFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.BodyTransparencyFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BodyTransparencyFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.BodyTransparencyFrame.Position = UDim2.new(0.731, 0, 0.46, 0)
	GUIObject.BodyTransparencyFrame.Size = UDim2.new(0.425, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A18.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 24, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 38, 50))}
	GUIObject.UIGradient_A18.Rotation = -90
	GUIObject.UIGradient_A18.Parent = GUIObject.BodyTransparencyFrame

	GUIObject.UICorner_A18.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A18.Parent = GUIObject.BodyTransparencyFrame

	GUIObject.BodyTransparencyButton.Name = "BodyTransparencyButton"
	GUIObject.BodyTransparencyButton.Parent = GUIObject.BodyTransparencyFrame
	GUIObject.BodyTransparencyButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.BodyTransparencyButton.BackgroundTransparency = 1.000
	GUIObject.BodyTransparencyButton.BorderSizePixel = 0
	GUIObject.BodyTransparencyButton.LayoutOrder = 1
	GUIObject.BodyTransparencyButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.BodyTransparencyButton.Font = Enum.Font.Code
	GUIObject.BodyTransparencyButton.Text = "Realtime Body Transparency"
	GUIObject.BodyTransparencyButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.BodyTransparencyButton.TextScaled = true
	GUIObject.BodyTransparencyButton.TextSize = 14.000
	GUIObject.BodyTransparencyButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.BodyTransparencyButton.TextStrokeTransparency = 0.000
	GUIObject.BodyTransparencyButton.TextWrapped = true

	GUIObject.HardcoreFrame.Name = "HardcoreFrame"
	GUIObject.HardcoreFrame.Parent = GUIObject.HPFrame
	GUIObject.HardcoreFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.HardcoreFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HardcoreFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.HardcoreFrame.Position = UDim2.new(0.5, 0, 0.62, 0)
	GUIObject.HardcoreFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A19.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(38, 16, 24)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(60, 24, 36))}
	GUIObject.UIGradient_A19.Rotation = -90
	GUIObject.UIGradient_A19.Parent = GUIObject.HardcoreFrame

	GUIObject.UICorner_A19.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A19.Parent = GUIObject.HardcoreFrame

	GUIObject.HardcoreToggle.Name = "HardcoreToggle"
	GUIObject.HardcoreToggle.Parent = GUIObject.HardcoreFrame
	GUIObject.HardcoreToggle.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.HardcoreToggle.BackgroundTransparency = 1.000
	GUIObject.HardcoreToggle.BorderSizePixel = 0
	GUIObject.HardcoreToggle.LayoutOrder = 1
	GUIObject.HardcoreToggle.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.HardcoreToggle.Font = Enum.Font.Code
	GUIObject.HardcoreToggle.Text = "Clothing Hardcore HP"
	GUIObject.HardcoreToggle.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HardcoreToggle.TextScaled = true
	GUIObject.HardcoreToggle.TextSize = 14.000
	GUIObject.HardcoreToggle.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.HardcoreToggle.TextStrokeTransparency = 0.000
	GUIObject.HardcoreToggle.TextWrapped = true

	GUIObject.hardcoreUI.Parent = GUIObject.Screen
	GUIObject.hardcoreUI.IgnoreGuiInset = true
	GUIObject.hardcoreUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	GUIObject.hardcoreUI.Name = "HealthUI"

	GUIObject.hardcoreGroup.Parent = GUIObject.hardcoreUI
	GUIObject.hardcoreGroup.BackgroundTransparency = 1
	GUIObject.hardcoreGroup.AnchorPoint = Vector2.new(0.5,0.5)
	GUIObject.hardcoreGroup.Size = UDim2.new(0.1,0,0.1,0)
	GUIObject.hardcoreGroup.GroupTransparency = 1
	GUIObject.hardcoreGroup.Visible = false
	local aspectRatio = Instance.new("UIAspectRatioConstraint",GUIObject.hardcoreGroup)

	GUIObject.repairBar.Parent = GUIObject.hardcoreGroup
	GUIObject.repairBar.AnchorPoint = Vector2.new(0.5,0.5)
	GUIObject.repairBar.Position = UDim2.new(0.5,0,0.5,0)
	GUIObject.repairBar.BackgroundTransparency = 1
	GUIObject.repairBar.Size = UDim2.new(.5,0,.5,0)
	GUIObject.repairBar.Image = "rbxassetid://2866648598"
	GUIObject.repairBar.ImageTransparency = .2
	GUIObject.repairBar.Visible = false
	GUIObject.repairDisplay.Parent = GUIObject.repairBar
	GUIObject.repairDisplay.Color = ColorSequence.new(
		{ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
			ColorSequenceKeypoint.new(0.00001,Color3.new(0, 0, 0)),
			ColorSequenceKeypoint.new(1,Color3.new(0, 0, 0))}
	)

	local uiStroke = Instance.new("UIStroke",GUIObject.topHPDisplay)
	GUIObject.topHPDisplay.Parent = GUIObject.hardcoreGroup
	GUIObject.topHPDisplay.BackgroundTransparency = 1
	GUIObject.topHPDisplay.Size = UDim2.new(1,0,0.25,0)
	GUIObject.topHPDisplay.TextScaled = true
	GUIObject.topHPDisplay.Font = Enum.Font.Sarpanch
	GUIObject.topHPDisplay.TextColor3 = Color3.new(0,1,0)
	GUIObject.topHPDisplay.Text = ""

	local uiStroke = Instance.new("UIStroke",GUIObject.bottomHPDisplay)
	GUIObject.bottomHPDisplay.Parent = GUIObject.hardcoreGroup
	GUIObject.bottomHPDisplay.BackgroundTransparency = 1
	GUIObject.bottomHPDisplay.Position = UDim2.fromScale(0,.75)
	GUIObject.bottomHPDisplay.Size = UDim2.new(1,0,0.25,0)
	GUIObject.bottomHPDisplay.TextScaled = true
	GUIObject.bottomHPDisplay.Font = Enum.Font.Sarpanch
	GUIObject.bottomHPDisplay.TextColor3 = Color3.new(0,1,0)
	GUIObject.bottomHPDisplay.Text = ""


	GUIObject.TailButton.Name = "Tail"
	GUIObject.TailButton.Parent = GUIObject.CharacterFrame
	GUIObject.TailButton.BackgroundTransparency = 1
	GUIObject.TailButton.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.TailButton.Size = UDim2.new(0.431, 0, 0.413, 0)
	GUIObject.TailButton.Position = UDim2.new(0.035,0,0.734,0)
	GUIObject.TailButton.Image = "rbxassetid://9086291527"
	GUIObject.TailButton.ScaleType = Enum.ScaleType.Crop

	GUIObject.TailFrame.Name = "Tail"
	GUIObject.TailFrame.Parent = GUIObject.PageFrame
	GUIObject.TailFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TailFrame.BackgroundTransparency = 1.000
	GUIObject.TailFrame.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.TailFrame.Visible = false

	GUIObject.tailToggleFrame.Name = "TailToggleFrame"
	GUIObject.tailToggleFrame.Parent = GUIObject.TailFrame
	GUIObject.tailToggleFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.tailToggleFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.tailToggleFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.tailToggleFrame.Position = UDim2.new(0.5, 0, 0.025, 0)
	GUIObject.tailToggleFrame.Size = UDim2.new(0.891309202, 0, 0.0646399707, 0)

	GUIObject.UIGradient_A20.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(32, 18, 44)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(52, 28, 72))}
	GUIObject.UIGradient_A20.Rotation = -90
	GUIObject.UIGradient_A20.Parent = GUIObject.tailToggleFrame

	GUIObject.UICorner_A20.CornerRadius = UDim.new(0.25, 0)
	GUIObject.UICorner_A20.Parent = GUIObject.tailToggleFrame

	GUIObject.tailToggleButton.Name = "TailToggle"
	GUIObject.tailToggleButton.Parent = GUIObject.tailToggleFrame
	GUIObject.tailToggleButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.tailToggleButton.BackgroundTransparency = 1.000
	GUIObject.tailToggleButton.BorderSizePixel = 0
	GUIObject.tailToggleButton.LayoutOrder = 1
	GUIObject.tailToggleButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.tailToggleButton.Font = Enum.Font.Code
	GUIObject.tailToggleButton.Text = "Tail Physics"
	GUIObject.tailToggleButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.tailToggleButton.TextScaled = true
	GUIObject.tailToggleButton.TextSize = 14.000
	GUIObject.tailToggleButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.tailToggleButton.TextStrokeTransparency = 0.000
	GUIObject.tailToggleButton.TextWrapped = true


	GUIObject.optionsframeButton.Name = "OptionsFrame"
	GUIObject.optionsframeButton.Parent = GUIObject.Menu
	GUIObject.optionsframeButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.optionsframeButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.optionsframeButton.Position = UDim2.new(0.784810185, 0, 0.875, 0)
	GUIObject.optionsframeButton.Size = UDim2.new(0.18244803, 0, 0.128480643, 0)
	local UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint",GUIObject.optionsframeButton)
	local UIGradient = Instance.new("UIGradient",GUIObject.optionsframeButton)
	local UICorner = Instance.new("UICorner",GUIObject.optionsframeButton)
	UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 14, 27)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 27, 50))}
	UIGradient.Rotation = -90
	UICorner.CornerRadius = UDim.new(0.25, 0)

	GUIObject.optionsButton.Name = "Options"
	GUIObject.optionsButton.Parent = GUIObject.optionsframeButton
	GUIObject.optionsButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.optionsButton.BackgroundTransparency = 1.000
	GUIObject.optionsButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.optionsButton.Font = Enum.Font.Code
	GUIObject.optionsButton.Text = "Options"
	GUIObject.optionsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.optionsButton.TextScaled = true
	GUIObject.optionsButton.TextSize = 14.000
	GUIObject.optionsButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.optionsButton.TextStrokeTransparency = 1.000
	GUIObject.optionsButton.TextWrapped = true

	GUIObject.optionsFrame.Name = "Options"
	GUIObject.optionsFrame.Parent = GUIObject.PageFrame
	GUIObject.optionsFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.optionsFrame.BackgroundTransparency = 1.000
	GUIObject.optionsFrame.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.optionsFrame.Visible = false

	GUIObject.saveFrame.Name = "saveFrame"
	-- Row 1: Save (Y = 0.020)
	GUIObject.saveFrame.Parent = GUIObject.optionsFrame
	GUIObject.saveFrame.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.saveFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.saveFrame.Position = UDim2.new(0.5, 0, 0.020, 0)
	GUIObject.saveFrame.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.saveFrame)
		local UICorner = Instance.new("UICorner",GUIObject.saveFrame)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 50, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 100, 0))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.saveButton.Name = "saveButton"
	GUIObject.saveButton.Parent = GUIObject.saveFrame
	GUIObject.saveButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveButton.BackgroundTransparency = 1.000
	GUIObject.saveButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.saveButton.Font = Enum.Font.Code
	GUIObject.saveButton.Text = "Save"
	GUIObject.saveButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveButton.TextScaled = true
	GUIObject.saveButton.TextSize = 14.000
	GUIObject.saveButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.saveButton.TextStrokeTransparency = 1.000
	GUIObject.saveButton.TextWrapped = true

	-- Row 2: Close UI on Loadup (Y = 0.082)
	GUIObject.closeOption.Name = "CloseOptionFrame"
	GUIObject.closeOption.Parent = GUIObject.optionsFrame
	GUIObject.closeOption.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.closeOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.closeOption.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.closeOption.Position = UDim2.new(0.5, 0, 0.082, 0)
	GUIObject.closeOption.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.closeOption)
		local UICorner = Instance.new("UICorner",GUIObject.closeOption)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(53, 15, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 48, 0))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.closeOptionButton.Name = "CloseOption"
	GUIObject.closeOptionButton.Parent = GUIObject.closeOption
	GUIObject.closeOptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.closeOptionButton.BackgroundTransparency = 1.000
	GUIObject.closeOptionButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.closeOptionButton.Font = Enum.Font.Code
	GUIObject.closeOptionButton.Text = "Close UI on Loadup"
	GUIObject.closeOptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.closeOptionButton.TextScaled = true
	GUIObject.closeOptionButton.TextSize = 14.000
	GUIObject.closeOptionButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.closeOptionButton.TextStrokeTransparency = 0.000
	GUIObject.closeOptionButton.TextWrapped = true

	-- Row 3: Execute on Loadup (Y = 0.144)
	GUIObject.executeOption.Name = "ExecuteOptionFrame"
	GUIObject.executeOption.Parent = GUIObject.optionsFrame
	GUIObject.executeOption.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.executeOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.executeOption.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.executeOption.Position = UDim2.new(0.5, 0, 0.144, 0)
	GUIObject.executeOption.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.executeOption)
		local UICorner = Instance.new("UICorner",GUIObject.executeOption)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(53, 15, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 48, 0))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.executeOptionButton.Name = "ExecuteOption"
	GUIObject.executeOptionButton.Parent = GUIObject.executeOption
	GUIObject.executeOptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.executeOptionButton.BackgroundTransparency = 1.000
	GUIObject.executeOptionButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.executeOptionButton.Font = Enum.Font.Code
	GUIObject.executeOptionButton.Text = "Execute on Loadup"
	GUIObject.executeOptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.executeOptionButton.TextScaled = true
	GUIObject.executeOptionButton.TextSize = 14.000
	GUIObject.executeOptionButton.TextStrokeColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.executeOptionButton.TextStrokeTransparency = 0.000
	GUIObject.executeOptionButton.TextWrapped = true

	-- Row 4: FPerson Loadup (Y = 0.206)
	GUIObject.FPersonLoadup.Name = "FPersonLoadFrame"
	GUIObject.FPersonLoadup.Parent = GUIObject.optionsFrame
	GUIObject.FPersonLoadup.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.FPersonLoadup.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FPersonLoadup.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.FPersonLoadup.Position = UDim2.new(0.5, 0, 0.206, 0)
	GUIObject.FPersonLoadup.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.FPersonLoadup)
		local UICorner = Instance.new("UICorner",GUIObject.FPersonLoadup)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(53, 15, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 48, 0))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.FPersonLoadupButton.Name = "FPersonLoad"
	GUIObject.FPersonLoadupButton.Parent = GUIObject.FPersonLoadup
	GUIObject.FPersonLoadupButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FPersonLoadupButton.BackgroundTransparency = 1.000
	GUIObject.FPersonLoadupButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.FPersonLoadupButton.Font = Enum.Font.Code
	GUIObject.FPersonLoadupButton.Text = "FPerson Loadup: false"
	GUIObject.FPersonLoadupButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.FPersonLoadupButton.TextScaled = true
	GUIObject.FPersonLoadupButton.TextSize = 14.000
	GUIObject.FPersonLoadupButton.TextStrokeColor3 = Color3.fromRGB(12, 12, 16)
	GUIObject.FPersonLoadupButton.TextStrokeTransparency = 1.000
	GUIObject.FPersonLoadupButton.TextWrapped = true

	-- Row 5: Loadup Bundle (Y = 0.268)
	GUIObject.bundleLoad.Name = "loadupBundleFrame"
	GUIObject.bundleLoad.Parent = GUIObject.optionsFrame
	GUIObject.bundleLoad.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.bundleLoad.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.bundleLoad.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.bundleLoad.Position = UDim2.new(0.5, 0, 0.268, 0)
	GUIObject.bundleLoad.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.bundleLoad)
		local UICorner = Instance.new("UICorner",GUIObject.bundleLoad)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(53, 15, 0)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(121, 48, 0))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.bundleLoadButton.Name = "loadupBundle"
	GUIObject.bundleLoadButton.Parent = GUIObject.bundleLoad
	GUIObject.bundleLoadButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.bundleLoadButton.BackgroundTransparency = 1.000
	GUIObject.bundleLoadButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.bundleLoadButton.Font = Enum.Font.Code
	GUIObject.bundleLoadButton.Text = "Loadup Bundle: nil"
	GUIObject.bundleLoadButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.bundleLoadButton.TextScaled = true
	GUIObject.bundleLoadButton.TextSize = 14.000
	GUIObject.bundleLoadButton.TextWrapped = true

	-- Row 6: Outfit Name Box (Y = 0.330)
	GUIObject.outfitName.Name = "outfitNameFrame"
	GUIObject.outfitName.Parent = GUIObject.optionsFrame
	GUIObject.outfitName.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.outfitName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.outfitName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.outfitName.Position = UDim2.new(0.5, 0, 0.330, 0)
	GUIObject.outfitName.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.outfitName)
		local UICorner = Instance.new("UICorner",GUIObject.outfitName)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 25, 60)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 45, 130))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.1, 0)
	end

	GUIObject.outfitNameBox.Name = "outfitName"
	GUIObject.outfitNameBox.ClearTextOnFocus = false
	GUIObject.outfitNameBox.Parent = GUIObject.outfitName
	GUIObject.outfitNameBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.outfitNameBox.BackgroundTransparency = 1.000
	GUIObject.outfitNameBox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.outfitNameBox.Font = Enum.Font.Code
	GUIObject.outfitNameBox.PlaceholderText = "Outfit Name (Type before saving)"
	GUIObject.outfitNameBox.Text = ""
	GUIObject.outfitNameBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.outfitNameBox.TextScaled = true
	GUIObject.outfitNameBox.TextSize = 14.000
	GUIObject.outfitNameBox.TextWrapped = true
	do
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint",GUIObject.outfitNameBox)
		UITextSizeConstraint.MaxTextSize = 30
	end

	-- Row 7: Save Outfit (Clothing Preset) (Y = 0.392)
	GUIObject.saveOutfitBox.Name = "saveOutfitFrame"
	GUIObject.saveOutfitBox.Parent = GUIObject.optionsFrame
	GUIObject.saveOutfitBox.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.saveOutfitBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveOutfitBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.saveOutfitBox.Position = UDim2.new(0.5, 0, 0.392, 0)
	GUIObject.saveOutfitBox.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradientSaveOutfit = Instance.new("UIGradient", GUIObject.saveOutfitBox)
		local UICornerSaveOutfit = Instance.new("UICorner", GUIObject.saveOutfitBox)
		UIGradientSaveOutfit.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 44, 32)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 72, 52))}
		UIGradientSaveOutfit.Rotation = -90
		UICornerSaveOutfit.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.saveOutfitButton.Name = "saveOutfitButton"
	GUIObject.saveOutfitButton.Parent = GUIObject.saveOutfitBox
	GUIObject.saveOutfitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveOutfitButton.BackgroundTransparency = 1.000
	GUIObject.saveOutfitButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.saveOutfitButton.Font = Enum.Font.Code
	GUIObject.saveOutfitButton.Text = "Save Outfit (Clothing Preset)"
	GUIObject.saveOutfitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveOutfitButton.TextScaled = true
	GUIObject.saveOutfitButton.TextSize = 14.000
	GUIObject.saveOutfitButton.TextWrapped = true

	-- Row 8: Save Outfit (Full Avatar) (Y = 0.454)
	GUIObject.saveFullOutfitBox.Name = "saveFullOutfitFrame"
	GUIObject.saveFullOutfitBox.Parent = GUIObject.optionsFrame
	GUIObject.saveFullOutfitBox.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.saveFullOutfitBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveFullOutfitBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.saveFullOutfitBox.Position = UDim2.new(0.5, 0, 0.454, 0)
	GUIObject.saveFullOutfitBox.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradientSaveFullOutfit = Instance.new("UIGradient", GUIObject.saveFullOutfitBox)
		local UICornerSaveFullOutfit = Instance.new("UICorner", GUIObject.saveFullOutfitBox)
		UIGradientSaveFullOutfit.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 26, 55)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(36, 44, 90))}
		UIGradientSaveFullOutfit.Rotation = -90
		UICornerSaveFullOutfit.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.saveFullOutfitButton.Name = "saveFullOutfitButton"
	GUIObject.saveFullOutfitButton.Parent = GUIObject.saveFullOutfitBox
	GUIObject.saveFullOutfitButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveFullOutfitButton.BackgroundTransparency = 1.000
	GUIObject.saveFullOutfitButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.saveFullOutfitButton.Font = Enum.Font.Code
	GUIObject.saveFullOutfitButton.Text = "Save Outfit (Full Avatar)"
	GUIObject.saveFullOutfitButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveFullOutfitButton.TextScaled = true
	GUIObject.saveFullOutfitButton.TextSize = 14.000
	GUIObject.saveFullOutfitButton.TextWrapped = true

	-- Row 9: Save Shirt & Pants with Outfit (Y = 0.516)
	GUIObject.saveClothesOption.Name = "SaveClothesOptionFrame"
	GUIObject.saveClothesOption.Parent = GUIObject.optionsFrame
	GUIObject.saveClothesOption.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.saveClothesOption.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveClothesOption.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.saveClothesOption.Position = UDim2.new(0.5, 0, 0.516, 0)
	GUIObject.saveClothesOption.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradientSaveClothes = Instance.new("UIGradient", GUIObject.saveClothesOption)
		local UICornerSaveClothes = Instance.new("UICorner", GUIObject.saveClothesOption)
		UIGradientSaveClothes.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(24, 26, 34)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(38, 42, 54))}
		UIGradientSaveClothes.Rotation = -90
		UICornerSaveClothes.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.saveClothesOptionButton.Name = "SaveClothesOptionButton"
	GUIObject.saveClothesOptionButton.Parent = GUIObject.saveClothesOption
	GUIObject.saveClothesOptionButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveClothesOptionButton.BackgroundTransparency = 1.000
	GUIObject.saveClothesOptionButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.saveClothesOptionButton.Font = Enum.Font.Code
	GUIObject.saveClothesOptionButton.Text = "Outfit Clothes: Boob Naked"
	GUIObject.saveClothesOptionButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.saveClothesOptionButton.TextScaled = true
	GUIObject.saveClothesOptionButton.TextSize = 14.000
	GUIObject.saveClothesOptionButton.TextStrokeColor3 = Color3.fromRGB(0, 255, 0)
	GUIObject.saveClothesOptionButton.TextStrokeTransparency = 0.000
	GUIObject.saveClothesOptionButton.TextWrapped = true

	-- Row 10: Import Bundle (Y = 0.578)
	GUIObject.importBundle.Name = "importBundleFrame"
	GUIObject.importBundle.Parent = GUIObject.optionsFrame
	GUIObject.importBundle.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.importBundle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.importBundle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.importBundle.Position = UDim2.new(0.5, 0, 0.578, 0)
	GUIObject.importBundle.Size = UDim2.new(0.891309202, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.importBundle)
		local UICorner = Instance.new("UICorner",GUIObject.importBundle)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(0, 45, 50)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(0, 100, 85))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.1, 0)
	end

	GUIObject.importBundleBox.Name = "importBundle"
	GUIObject.importBundleBox.ClearTextOnFocus = true
	GUIObject.importBundleBox.Parent = GUIObject.importBundle
	GUIObject.importBundleBox.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.importBundleBox.BackgroundTransparency = 1.000
	GUIObject.importBundleBox.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.importBundleBox.Font = Enum.Font.Code
	GUIObject.importBundleBox.PlaceholderText = "Import Bundle (Paste Lua Table)"
	GUIObject.importBundleBox.Text = ""
	GUIObject.importBundleBox.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.importBundleBox.TextScaled = true
	GUIObject.importBundleBox.TextSize = 14.000
	GUIObject.importBundleBox.TextWrapped = true
	do
		local UITextSizeConstraint = Instance.new("UITextSizeConstraint",GUIObject.importBundleBox)
		UITextSizeConstraint.MaxTextSize = 30
	end

	-- Row 11: Delete Bundle & Export Bundle (Y = 0.640)
	GUIObject.exportBox.Name = "exportFrame"
	GUIObject.exportBox.Parent = GUIObject.optionsFrame
	GUIObject.exportBox.AnchorPoint = Vector2.new(0.5, 0)
	GUIObject.exportBox.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.exportBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.exportBox.Position = UDim2.new(0.605, 0, 0.640, 0)
	GUIObject.exportBox.Size = UDim2.new(0.681, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.exportBox)
		local UICorner = Instance.new("UICorner",GUIObject.exportBox)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(68, 0, 35)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(145, 0, 56))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.exportButton.Name = "exportButton"
	GUIObject.exportButton.Parent = GUIObject.exportBox
	GUIObject.exportButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.exportButton.BackgroundTransparency = 1.000
	GUIObject.exportButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.exportButton.Font = Enum.Font.Code
	GUIObject.exportButton.Text = "Export Bundle"
	GUIObject.exportButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.exportButton.TextScaled = true
	GUIObject.exportButton.TextSize = 14.000
	GUIObject.exportButton.TextWrapped = true

	GUIObject.delFrame.Name = "delFrame"
	GUIObject.delFrame.Parent = GUIObject.optionsFrame
	GUIObject.delFrame.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.delFrame.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.delFrame.Position = UDim2.new(0.05, 0, 0.640, 0)
	GUIObject.delFrame.Size = UDim2.new(0.2, 0, 0.052, 0)
	do
		local UIGradient = Instance.new("UIGradient",GUIObject.delFrame)
		local UICorner = Instance.new("UICorner",GUIObject.delFrame)
		UIGradient.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(79, 0, 1)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(172, 0, 3))}
		UIGradient.Rotation = -90
		UICorner.CornerRadius = UDim.new(0.25, 0)
	end

	GUIObject.delButton.Name = "exportButton"
	GUIObject.delButton.Parent = GUIObject.delFrame
	GUIObject.delButton.BackgroundColor3 = Color3.fromRGB(255, 0, 0)
	GUIObject.delButton.BackgroundTransparency = 1.000
	GUIObject.delButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.delButton.Font = Enum.Font.Code
	GUIObject.delButton.Text = "Delete Bundle"
	GUIObject.delButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.delButton.TextScaled = true
	GUIObject.delButton.TextSize = 14.000
	GUIObject.delButton.TextWrapped = true

	GUIObject.HPListFrame.Name = "HPListFrame"
	GUIObject.HPListFrame.Parent = GUIObject.HPFrame
	GUIObject.HPListFrame.Active = true
	GUIObject.HPListFrame.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.HPListFrame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	GUIObject.HPListFrame.BackgroundTransparency = 1.000
	GUIObject.HPListFrame.BorderSizePixel = 0
	GUIObject.HPListFrame.Position = UDim2.new(0.5, 0, 0.85, 0)
	GUIObject.HPListFrame.Size = UDim2.new(0.95, 0, 0.3, 0)
	GUIObject.HPListFrame.BottomImage = "rbxassetid://5946093983"
	GUIObject.HPListFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.HPListFrame.MidImage = ""
	GUIObject.HPListFrame.ScrollBarThickness = 0
	GUIObject.HPListFrame.CanvasSize = UDim2.new(0, 0, 0.5, 0)
	GUIObject.HPListFrame.AutomaticCanvasSize = Enum.AutomaticSize.Y
	GUIObject.HPListFrame.TopImage = "rbxassetid://5946093983"

	local UIGridLayout = Instance.new("UIGridLayout",GUIObject.HPListFrame)
	UIGridLayout.SortOrder = Enum.SortOrder.LayoutOrder
	UIGridLayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	UIGridLayout.CellPadding = UDim2.new(0,0,.02,0)
	UIGridLayout.CellSize = UDim2.new(.98, 0, 0.33, 0)

	local UIGridLayout = Instance.new("UIAspectRatioConstraint",GUIObject.ImageHeal)
	local UIDragger = Instance.new("UIDragDetector",GUIObject.ImageHeal)
	UIDragger.Enabled = false
	GUIObject.ImageHeal.Name = "MobileHeal"
	GUIObject.ImageHeal.Parent = GUIObject.hardcoreUI
	GUIObject.ImageHeal.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.ImageHeal.BackgroundTransparency = 1
	GUIObject.ImageHeal.Size = UDim2.fromScale(.08,.08)
	GUIObject.ImageHeal.Position = UDim2.fromScale(.85,.45)
	GUIObject.ImageHeal.Image = "rbxassetid://9631050557"
	GUIObject.ImageHeal.Visible = false

	local UICorner = Instance.new("UICorner",GUIObject.HealButton)
	UICorner.CornerRadius = UDim.new(1,0)
	GUIObject.HealButton.Name = "HealButton"
	GUIObject.HealButton.Parent = GUIObject.ImageHeal
	GUIObject.HealButton.BackgroundTransparency = 1
	GUIObject.HealButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.HealButton.Font = Enum.Font.Merriweather
	GUIObject.HealButton.Text = "+"
	GUIObject.HealButton.TextTransparency = .5
	GUIObject.HealButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.HealButton.TextScaled = true
	GUIObject.HealButton.TextSize = 14.000
	GUIObject.HealButton.TextWrapped = true

	local UIGridLayout = Instance.new("UIAspectRatioConstraint",GUIObject.ImageTear)
	local UIDragger = Instance.new("UIDragDetector",GUIObject.ImageTear)
	UIDragger.Enabled = false
	GUIObject.ImageTear.Name = "MobileTear"
	GUIObject.ImageTear.Parent = GUIObject.hardcoreUI
	GUIObject.ImageTear.AnchorPoint = Vector2.new(0.5, 0.5)
	GUIObject.ImageTear.BackgroundTransparency = 1
	GUIObject.ImageTear.Size = UDim2.fromScale(.08,.08)
	GUIObject.ImageTear.Position = UDim2.fromScale(.85,.55)
	GUIObject.ImageTear.Image = "rbxassetid://9631050557"
	GUIObject.ImageTear.Visible = false

	local UICorner = Instance.new("UICorner",GUIObject.TearButton)
	UICorner.CornerRadius = UDim.new(1,0)
	GUIObject.TearButton.Name = "TearButton"
	GUIObject.TearButton.Parent = GUIObject.ImageTear
	GUIObject.TearButton.BackgroundTransparency = 1
	GUIObject.TearButton.Size = UDim2.new(1, 0, 1, 0)
	GUIObject.TearButton.Font = Enum.Font.Merriweather
	GUIObject.TearButton.Text = "-"
	GUIObject.TearButton.TextTransparency = .5
	GUIObject.TearButton.TextColor3 = Color3.fromRGB(255, 255, 255)
	GUIObject.TearButton.TextScaled = true
	GUIObject.TearButton.TextSize = 14.000
	GUIObject.TearButton.TextWrapped = true

	if not UIS.KeyboardEnabled then
		GUIObject.MobileCloseButtonScreen.Enabled = true
		--Method = 2
	end
	end

	Function.CatalogAccessoryFrameAdd(SelectPlayer)
	Function.GUIFunc()
	Function.GUIUpdate()

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
	
                               ██████╗░██████╗░███████╗░█████╗░██╗░░██╗███████╗██████╗░
                               ██╔══██╗██╔══██╗██╔════╝██╔══██╗██║░██╔╝██╔════╝██╔══██╗
                               ██████╦╝██████╔╝█████╗░░███████║█████═╝░█████╗░░██████╔╝
                               ██╔══██╗██╔══██╗██╔══╝░░██╔══██║██╔═██╗░██╔══╝░░██╔══██╗
                               ██████╦╝██║░░██║███████╗██║░░██║██║░╚██╗███████╗██║░░██║
                               ╚═════╝░╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝╚═╝░░╚═╝╚══════╝╚═╝░░╚═╝
                                  
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
