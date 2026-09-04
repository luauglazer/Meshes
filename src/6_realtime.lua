
	for _, v in pairs(PS:GetPlayers()) do
		Function.CharacterConnection(v)
	end

	PS.PlayerAdded:Connect(function(v)
		Function.CharacterConnection(v)
	end)

	local tap = false
	local cd = false

	local hardcoreGUITween
	local repairTween
	local function setUpHPBinds()
		local function HealFunction()
			if cd == false then
				local LP = game:GetService("Players").LocalPlayer
				local data = PlayerData[LP.Name]
				if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") and data then 
					if data["HardcoreHP"] == true and (data["TopHP"] ~= "" or data["BottomHP"] ~= "") then
						if data["Healing"] == false then

							GUIObject.hardcoreGroup.Visible = true
							if hardcoreGUITween and hardcoreGUITween.PlaybackState == Enum.PlaybackState.Playing then
								hardcoreGUITween:Cancel()
							end
							hardcoreGUITween = TS:Create(GUIObject.hardcoreGroup,TweenInfo.new(.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency = 0})
							hardcoreGUITween:Play()

							task.delay(0,function()
								Function.DragUpdate()
							end)
							data["Healing"] = true
							cd = true
							tap = true
							task.wait(.3)
							cd = false
							tap = false
							if data["Healing"] == true and (data["TopHP"] ~= "" and data["SavedTopHP"] < data["TopHP"] 
								or data["BottomHP"] ~= "" and data["SavedBottomHP"] < data["BottomHP"]) then
								local healTime = 0
								local timeAccumulated = 0
								local totalTime = 0
								if data["TopHP"] ~= "" then
									healTime += math.max((data["TopHP"]/math.max(data["SavedTopHP"],1))*0.04,.5)
								end
								if data["BottomHP"] ~= "" then
									healTime += math.max((data["BottomHP"]/math.max(data["SavedBottomHP"],1))*0.04,.5)
								end

								GUIObject.repairDisplay.Color = ColorSequence.new(
									{ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
										ColorSequenceKeypoint.new(0.00001,Color3.new(0, 0, 0)),
										ColorSequenceKeypoint.new(1,Color3.new(0, 0, 0))}
								)
								GUIObject.repairBar.Size = UDim2.fromScale(.2,.2)
								GUIObject.repairBar.ImageTransparency = 1
								GUIObject.repairBar.Visible = true
								if repairTween and repairTween.PlaybackState == Enum.PlaybackState.Playing then
									repairTween:Cancel()
								end
								repairTween = TS:Create(GUIObject.repairBar,TweenInfo.new(.3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.fromScale(.5,.5),ImageTransparency=.2})
								repairTween:Play()
								repeat
									GUIObject.repairBar.Visible = true
									if (not tonumber(data["TopHP"]) or data["SavedTopHP"] >= data["TopHP"]) and 
										(not tonumber(data["BottomHP"]) or data["SavedBottomHP"] >= data["BottomHP"]) then
										data["Healing"] = false
									end
									local focus
									local timeRequired
									if data["BottomHP"] ~= "" and (data["TopHP"] == "" 
										or data["SavedBottomHP"] <= 0 or data["SavedTopHP"]/data["TopHP"] >= data["SavedBottomHP"]/data["BottomHP"]) then
										focus = "BottomHP"
										timeRequired = math.max((data["BottomHP"]/math.max(data["SavedBottomHP"],1))*0.04,.5)
									elseif data["TopHP"] ~= "" and (data["BottomHP"] == "" 
										or data["SavedTopHP"] <= 0 or data["SavedTopHP"]/data["TopHP"] < data["SavedBottomHP"]/data["BottomHP"]) then
										focus = "TopHP"
										timeRequired = math.max((data["TopHP"]/math.max(data["SavedTopHP"],1))*0.04,.5)
									end
									local t = task.wait()
									timeAccumulated += t
									totalTime += t
									GUIObject.repairDisplay.Offset = Vector2.new(timeAccumulated/timeRequired,0)
									if timeAccumulated >= timeRequired then
										timeAccumulated = 0
										if focus == "TopHP" then
											data["SavedTopHP"]=data["TopHP"]
										else
											data["SavedBottomHP"]=data["BottomHP"]
										end
									end
								until data["Healing"] == false
								if GUIObject.repairDisplay.Color == ColorSequence.new(
									{ColorSequenceKeypoint.new(0,Color3.new(1,1,1)),
										ColorSequenceKeypoint.new(0.00001,Color3.new(0, 0, 0)),
										ColorSequenceKeypoint.new(1,Color3.new(0, 0, 0))}
									) then
									repairTween = TS:Create(GUIObject.repairBar,TweenInfo.new(.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Size = UDim2.fromScale(.2,.2),ImageTransparency=1})
									repairTween:Play()
								end
							end
						end
					elseif data["HardcoreHP"] == false and (data["TopHP"] ~= "" or data["BottomHP"] ~= "") then
						GUIObject.hardcoreGroup.Visible = true
						if hardcoreGUITween ~= nil and hardcoreGUITween.PlaybackState == Enum.PlaybackState.Playing then
							hardcoreGUITween:Cancel()
						end
						hardcoreGUITween = TS:Create(GUIObject.hardcoreGroup,TweenInfo.new(.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency = 0})
						hardcoreGUITween:Play()
						data["Healing"] = true
						cd = true
						task.wait(.3)
						cd = false
					end
				end
			end
		end
		local function DamageFunction()
			if cd == false then
				local LP = game:GetService("Players").LocalPlayer
				local data = PlayerData[LP.Name]
				if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") and data then 
					if data["HardcoreHP"] == true and (data["TopHP"] ~= "" or data["BottomHP"] ~= "") then
						if data["Healing"] == false then
							cd = true

							GUIObject.hardcoreGroup.Visible = true
							if hardcoreGUITween and hardcoreGUITween.PlaybackState == Enum.PlaybackState.Playing then
								hardcoreGUITween:Cancel()
							end
							hardcoreGUITween = TS:Create(GUIObject.hardcoreGroup,TweenInfo.new(.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency = 0})
							hardcoreGUITween:Play()

							task.delay(0,function()
								Function.DragUpdate()
							end)
							cd = true
							data["Healing"] = true

							GUIObject.repairDisplay.Color = ColorSequence.new(
								{ColorSequenceKeypoint.new(0,Color3.new(1, 0.3, 0.3)),
									ColorSequenceKeypoint.new(0.00001,Color3.new(0, 0, 0)),
									ColorSequenceKeypoint.new(1,Color3.new(0, 0, 0))}
							)
							GUIObject.repairBar.Size = UDim2.fromScale(.2,.2)
							GUIObject.repairBar.ImageTransparency = 1
							GUIObject.repairBar.Visible = true
							if repairTween and repairTween.PlaybackState == Enum.PlaybackState.Playing then
								repairTween:Cancel()
							end
							repairTween = TS:Create(GUIObject.repairBar,TweenInfo.new(.3,Enum.EasingStyle.Sine,Enum.EasingDirection.Out),{Size = UDim2.fromScale(.5,.5),ImageTransparency=.2})
							repairTween:Play()

							local timeAccumulated = 0
							repeat
								GUIObject.repairBar.Visible = true
								if data["SavedTopHP"] <= 0 and data["SavedBottomHP"] <= 0 then
									data["Healing"] = false
								end
								local focus
								local timeRequired = 1
								if data["TopHP"] ~= "" and data["SavedTopHP"]/data["TopHP"] > 0 then
									focus = "TopHP"
								elseif data["BottomHP"] ~= "" and data["SavedBottomHP"]/data["BottomHP"] > 0 then
									focus = "BottomHP"
								end
								local t = task.wait()
								timeAccumulated += t
								GUIObject.repairDisplay.Offset = Vector2.new(timeAccumulated/timeRequired,0)
								if timeAccumulated >= timeRequired then
									timeAccumulated = 0
									if focus == "TopHP" then
										data["SavedTopHP"]=0
									else
										data["SavedBottomHP"]=0
									end
								end
							until data["Healing"] == false
							if GUIObject.repairDisplay.Color == ColorSequence.new(
								{ColorSequenceKeypoint.new(0,Color3.new(1, 0.3, 0.3)),
									ColorSequenceKeypoint.new(0.00001,Color3.new(0, 0, 0)),
									ColorSequenceKeypoint.new(1,Color3.new(0, 0, 0))}
								) then
								repairTween = TS:Create(GUIObject.repairBar,TweenInfo.new(.1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{Size = UDim2.fromScale(.2,.2),ImageTransparency=1})
								repairTween:Play()
							end
							cd = false
						end
					end
				end
			end
		end
		local function CancelHP()
			local LP = game:GetService("Players").LocalPlayer
			local data = PlayerData[LP.Name]
			if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") and data then
				if data.HardcoreHP == true or (data["TopHP"] ~= "" or data["BottomHP"] ~= "") then
					if data["Healing"] == true then
						data["Healing"] = false
					end
					if GUIObject.hardcoreGroup.GroupTransparency < 1 then
						task.delay(.5,function()
							if tap == false and data["Healing"] == false then
								if hardcoreGUITween ~= nil and hardcoreGUITween.PlaybackState == Enum.PlaybackState.Playing then
									hardcoreGUITween:Cancel()
								end
								hardcoreGUITween = TS:Create(GUIObject.hardcoreGroup,TweenInfo.new(1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{GroupTransparency = 1})
								hardcoreGUITween:Play()
							end
						end)
					end
				end
			end
		end

		local UISBeganConnect = UIS.InputBegan:Connect(function(Keycode, Process)
			if Process then return end

			if KeybindDetect == true then
				if Keycode.KeyCode == Enum.KeyCode.Escape or Keycode.KeyCode == Enum.KeyCode.Unknown then
					KeybindDetect = false
					GUIObject.KeybindButton.Text = (typeof(KEYBIND) == "EnumItem" and KEYBIND.Name) or tostring(KEYBIND):gsub("^Enum%.KeyCode%.", "")
					return
				end
				KEYBIND = Keycode.KeyCode
				GUIObject.KeybindButton.Text = (typeof(KEYBIND) == "EnumItem" and KEYBIND.Name) or tostring(KEYBIND):gsub("^Enum%.KeyCode%.", "")
				KeybindDetect = false
				Function.SaveSettings()
			else
				if Keycode.KeyCode == KEYBIND then
					GUIObject.Screen.Enabled = not GUIObject.Screen.Enabled
				end
			end
			if hpKeybindDetect == true then
				hpKEYBIND = Keycode.KeyCode
				hpKeybindDetect = false
				Function.SaveSettings()
			elseif Keycode.KeyCode == hpKEYBIND then
				HealFunction()
			end
			if dpKeybindDetect == true then
				dpKEYBIND = Keycode.KeyCode
				dpKeybindDetect = false
				Function.SaveSettings()
			elseif Keycode.KeyCode == dpKEYBIND then
				DamageFunction()
			end
		end)
		table.insert(AllConnect, UISBeganConnect)
		local UISEndedConnect = UIS.InputEnded:Connect(function(Keycode,Process)
			if Process then return end

			if Keycode.KeyCode == hpKEYBIND or Keycode.KeyCode == dpKEYBIND then
				CancelHP()
			end
		end)
		table.insert(AllConnect, UISEndedConnect)

		local mobileHealCancel,mobileHealInput,mobileHealOutput,mobileDMGCancel,mobileDMGInput,mobileDMGOutput
		local moveStroke = Instance.new("UIStroke")
		moveStroke.Color = Color3.fromRGB(125,0,255)
		moveStroke.Thickness = 1.5
		local mobileHeal = {["hold"]=false,["cancel"]=false}
		local healDrag = false
		mobileHealCancel = GUIObject.HealButton.MouseLeave:Connect(function()
			if mobileHeal["hold"] == true then
				mobileHeal["cancel"] = true
			end
		end)
		mobileHealInput = GUIObject.HealButton.MouseButton1Down:Connect(function()
			local LP = game:GetService("Players").LocalPlayer
			local data = PlayerData[LP.Name]
			mobileHeal["hold"] = true
			local holdTime = 1
			if healDrag == true then
				holdTime = .25
			end
			repeat
				local t = RS.Heartbeat:Wait()
				holdTime -= t
			until mobileHeal["hold"] == false or holdTime <= 0 or mobileHeal["cancel"] == true
			if mobileHeal["cancel"] == true then
				mobileHeal["cancel"] = false
				return
			end
			if mobileHeal["hold"] == false then
				if healDrag == false then
					if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") and data then
						if cd == false and data["Healing"] == false then
							HealFunction()
							if cd == false then
								CancelHP()
							end
						else
							CancelHP()
						end
					end
				else
					healDrag = false
					moveStroke.Parent = nil
					GUIObject.ImageHeal:FindFirstChildOfClass("UIDragDetector").Enabled = false
					GUIObject.HealButton.Active = true
				end
			else
				healDrag = true
				moveStroke.Parent = GUIObject.ImageHeal
				GUIObject.ImageHeal:FindFirstChildOfClass("UIDragDetector").Enabled = true
				GUIObject.HealButton.Active = false
			end
		end)
		mobileHealOutput = GUIObject.HealButton.MouseButton1Up:Connect(function()
			mobileHeal["hold"] = false
		end)
		table.insert(AllConnect, mobileHealCancel)
		table.insert(AllConnect, mobileHealInput)
		table.insert(AllConnect, mobileHealOutput)

		local moveStroke = Instance.new("UIStroke")
		moveStroke.Color = Color3.fromRGB(125,0,255)
		moveStroke.Thickness = 1.5
		local mobileDMG = {["hold"]=false,["cancel"]=false}
		local tearDrag = false
		mobileDMGCancel = GUIObject.TearButton.MouseLeave:Connect(function()
			if mobileDMG["hold"] == true then
				mobileDMG["cancel"] = true
			end
		end)
		mobileDMGInput = GUIObject.TearButton.MouseButton1Down:Connect(function()
			local LP = game:GetService("Players").LocalPlayer
			local data = PlayerData[LP.Name]
			mobileDMG["hold"] = true
			local holdTime = 1
			if tearDrag == true then
				holdTime = .25
			end
			repeat
				local t = RS.Heartbeat:Wait()
				holdTime -= t
			until mobileDMG["hold"] == false or holdTime <= 0 or mobileDMG["cancel"] == true
			if mobileDMG["cancel"] == true then
				mobileDMG["cancel"] = false
				return
			end
			if mobileDMG["hold"] == false then
				if tearDrag == false then
					if LP.Character and LP.Character:FindFirstChildOfClass("Humanoid") and data then
						if cd == false and data["Healing"] == false then
							DamageFunction()
							if cd == false then
								CancelHP()
							end
						else
							CancelHP()
						end
					end
				else
					tearDrag = false
					moveStroke.Parent = nil
					GUIObject.ImageTear:FindFirstChildOfClass("UIDragDetector").Enabled = false
					GUIObject.TearButton.Active = true
				end
			else
				tearDrag = true
				moveStroke.Parent = GUIObject.ImageTear
				GUIObject.ImageTear:FindFirstChildOfClass("UIDragDetector").Enabled = true
				GUIObject.TearButton.Active = false
			end
		end)
		mobileDMGOutput = GUIObject.TearButton.MouseButton1Up:Connect(function()
			mobileDMG["hold"] = false
		end)
		table.insert(AllConnect, mobileDMGCancel)
		table.insert(AllConnect, mobileDMGInput)
		table.insert(AllConnect, mobileDMGOutput)
	end
	setUpHPBinds()

	local collisionList = {}
	local collisionChecks = {}
	--[[
	for i, v in pairs(workspace:GetDescendants()) do
		if v:IsA("BasePart") and v.CanCollide == false then
			table.insert(collisionList,v)
			local collisionChange = v:GetPropertyChangedSignal("CanCollide"):Connect(function()
				if v.CanCollide == false and not table.find(collisionList,v) then
					table.insert(collisionList,v)
				elseif v.CanCollide == true then
					table.remove(collisionList,table.find(collisionList,v))
				end
			end)
			collisionChecks[v] = collisionChange
			table.insert(AllConnect, collisionChange)
		end
	end
	local collisionAdded = workspace.DescendantAdded:Connect(function(v)
		if v:IsA("BasePart") and v.CanCollide == false then
			table.insert(collisionList,v)
			local collisionChange = v:GetPropertyChangedSignal("CanCollide"):Connect(function()
				if v.CanCollide == false and not table.find(collisionList,v) then
					table.insert(collisionList,v)
				elseif v.CanCollide == true then
					table.remove(collisionList,table.find(collisionList,v))
				end
			end)
			table.insert(AllConnect, collisionChange)
		end
	end)
	table.insert(AllConnect, collisionAdded)
	]]

	local aWhile = task.spawn(function()
		while task.wait() do
			local lP = game:GetService("Players").LocalPlayer
			if PlayerData[lP.Name] and PlayerData[lP.Name].FPerson == true then
				PlayerData[lP.Name].updateCooldown = true
				local ti = TweenInfo.new(0.3,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)
				local ti2 = TweenInfo.new(0.1,Enum.EasingStyle.Quad,Enum.EasingDirection.Out)

				if lP and lP.Character then
					local char = lP.Character
					if char:FindFirstChild("Head") and char:FindFirstChild("HumanoidRootPart") and char:FindFirstChildOfClass("Humanoid") then
						local hed = char:WaitForChild("Head")
						local rootpart = char:WaitForChild("HumanoidRootPart")
						local human = char:FindFirstChildOfClass("Humanoid")
						local torso = char:FindFirstChild("Torso") or rootpart
						local ray = Ray.new(hed.Position, ((hed.CFrame + hed.CFrame.LookVector * 2) - hed.Position).Position.Unit)

						local currentCamera = workspace.CurrentCamera
						if currentCamera then
							local distance = (currentCamera.Focus.p - currentCamera:GetRenderCFrame().p).magnitude
							local d = (distance<2) and (1.0-(distance-0.5)/1.5) or 0
							if d < 0.5 then
								d = 0
							end

							local ignoreList = {}
							for i, v in pairs(collisionList) do
								table.insert(ignoreList,v)
							end
							for i, v in pairs(Player.Character:GetDescendants()) do
								if v:IsA("BasePart") then
									table.insert(ignoreList,v)
								end
							end
							for i, v in pairs(Method2CharacterFolder:GetDescendants()) do
								if v:IsA("BasePart") then
									table.insert(ignoreList,v)
								end
							end

							local hit, pos = game.Workspace:FindPartOnRayWithIgnoreList(ray, ignoreList)

							if hit and hit.CanCollide == false and not collisionChecks[hit] then
								table.insert(collisionList,hit)
								local collisionChange = hit:GetPropertyChangedSignal("CanCollide"):Connect(function()
									if hit.CanCollide == false and not table.find(collisionList,hit) then
										table.insert(collisionList,hit)
									elseif hit.CanCollide == true then
										table.remove(collisionList,table.find(collisionList,hit))
									end
								end)
								collisionChecks[hit] = collisionChange
								table.insert(AllConnect, collisionChange)
								PlayerData[lP.Name].updateCooldown = false
							end

							-- (workspace.CurrentCamera.CFrame.p - hed.Position).Magnitude <= 1.65
							-- (hed.LocalTransparencyModifier >= .6 or (workspace.CurrentCamera.CFrame.p - hed.Position).Magnitude <= 1)
							local perspective
							local toHead = ((rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p))
							if PlayerData[lP.Name].HeadTracking == true then
								local offset = hed.CFrame.LookVector
								local Yset = torso.CFrame:ToObjectSpace(hed.CFrame).LookVector --hed.CFrame.LookVector
								local equation = math.max(0,math.pow(-1+10000000,math.min(1,(-Yset.Y)/.98))/9999999)
								local downwardsOffset = math.lerp(0,2,Function.Round(equation,3))
								perspective = (rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p+(offset*Vector3.new(1,math.clamp(1-(-Yset.Y/.98),0,1),1))+(torso.CFrame.LookVector*Vector3.new(.2,.2,.2)*downwardsOffset))-toHead
							else
								perspective = Vector3.new(0,0,-1)
							end
							if hit and d >= .8 then
								if PlayerData[lP.Name].FPsnap == false then
									TS:Create(human,ti2,{CameraOffset = ((rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p))+perspective*(hed.Position - pos).magnitude}):Play()
								else
									human.CameraOffset = ((rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p))+perspective*(hed.Position - pos).magnitude
								end
							elseif d >= .8 then
								if PlayerData[lP.Name].FPsnap == false then
									TS:Create(human,ti2,{CameraOffset = ((rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p))+perspective}):Play()
								else
									human.CameraOffset = ((rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p))+perspective
								end
							else
								TS:Create(human,ti,{CameraOffset = (rootpart.CFrame+Vector3.new(0,1.5,0)):PointToObjectSpace(hed.CFrame.p)}):Play()
							end
						end
					end
				end
			else
				if lP and lP.Character then
					local human = lP.Character:FindFirstChildOfClass("Humanoid")
					if human and human.CameraOffset.Magnitude > 0.001 then
						human.CameraOffset = Vector3.new(0, 0, 0)
					end
				end
			end

			for PlayerName, DataList in pairs(PlayerData) do

				for Part, Property in pairs(DataList.CurrentPartList.RealtimeUpdateList.Mesh) do

					if game:GetService("Players"):FindFirstChild(PlayerName) then
						local p = game:GetService("Players"):FindFirstChild(PlayerName)
						if p.Character and p.Character.PrimaryPart then
							local chr = p.Character
							local h = chr:FindFirstChildOfClass("Humanoid")
							if Method == 2 and Method2CharacterFolder:FindFirstChild(PlayerName) then
								chr = Method2CharacterFolder[PlayerName]
							end
							local PData = PlayerData[PlayerName]
							if h and PData.Cooldown == false and PData.Character then
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
								-- top --
								if PData.TopHP ~= "" and 
									(PData.HardcoreHP == false and h.MaxHealth-h.Health >= PData.TopHP or 
										PData.HardcoreHP == true and PData.SavedTopHP <= 0
									) then
									if PData.TopRipped == false then
										PData.TopRipped = true

										if UIS.KeyboardEnabled then
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = getAsset("RClothesContent/Sound/Tear/tear"..  math.random(1,3) ..".mp3")
											audio.Volume = 0.75*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										else
											local sounds = {9113827650,9113827551,9113833815}
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = "rbxassetid://"..  sounds[math.random(1,#sounds)]
											audio.Volume = 0.75*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										end

										if PData.TearParticles == true then
											local particle = Instance.new("ParticleEmitter",chr:FindFirstChild("HumanoidRootPart"))
											particle.Enabled = false
											particle.Texture = "rbxassetid://386425736"
											particle.Size = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,.7,.375),
													NumberSequenceKeypoint.new(1,.4)
												}
											)
											particle.Transparency = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,1),
													NumberSequenceKeypoint.new(0.214,0),
													NumberSequenceKeypoint.new(0.545,0),
													NumberSequenceKeypoint.new(1,1)
												}
											)
											particle.Lifetime = NumberRange.new(0.5,1)
											particle.Rotation = NumberRange.new(-360,360)
											particle.RotSpeed = NumberRange.new(-360,360)
											particle.Speed = NumberRange.new(15,20)
											particle.SpreadAngle = Vector2.new(75,75)
											particle.Acceleration = Vector3.new(0,-15,0)
											particle.Drag = 5
											particle:Emit(50)
											game:GetService("Debris"):AddItem(particle,3)
										end

										for c, set in pairs(PData.ClothesHP) do
											if not table.find(PData.CurrentClothes,c) then
												continue
											end
											local w = Clothes[c].Weld
											if Clothes[c].Alternative and Clothes[c].Alternative.Condition then
												local a = Function[Clothes[c].Alternative.Condition](PlayerName)
												if a and a == true then
													w = Clothes[c].Alternative.Weld
												end
											elseif Clothes[c].Alternative then
												local metCondition = false
												for i, alts in pairs(Clothes[c].Alternative) do
													if metCondition == false then
														local a = Function[alts.Condition](PlayerName)
														if a and a == true then
															metCondition = true
															w = alts["Weld"]
														end
													end
												end
											end
											if set["HP"] == "TopHP" then
												if set["Inverse"] == false then
													for i, v in pairs(w) do
														if PData.CurrentPartList["Clothes"][v] then
															transparent(PData.CurrentPartList["Clothes"][v],1)
														end
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																local t = PData.CurrentPartList["Organ"][v]:GetAttribute("Alpha") or 0
																transparent(PData.CurrentPartList["Organ"][v],t)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](false,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](false,chr,PlayerName,c)
															end
														end
													end
												else
													for i, v in pairs(w) do
														if PData.CurrentPartList["Clothes"][v] then
															local t = PData.CurrentPartList["Clothes"][v]:GetAttribute("Alpha") or 0
															transparent(PData.CurrentPartList["Clothes"][v],t)
														end
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																transparent(PData.CurrentPartList["Organ"][v],1)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](true,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](true,chr,PlayerName,c)
															end
														end
													end
												end
											end
										end
									end
								elseif PData.TopHP ~= "" and 
									(PData.HardcoreHP == false and h.MaxHealth-h.Health < PData.TopHP or
										PData.HardcoreHP == true and PData.SavedTopHP > 0
									) then
									if PData.TopRipped == true then
										PData.TopRipped = false

										if UIS.KeyboardEnabled then
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = getAsset("RClothesContent/Sound/Heal/heal"..  math.random(1,4) ..".mp3")
											audio.Volume = 2.5*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										else
											local sounds = {9113824422,9119138453,9113384209,9113824860}
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = "rbxassetid://"..  sounds[math.random(1,#sounds)]
											audio.Volume = 2.5*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										end

										if PData.HealParticles == true then
											local particle = Instance.new("ParticleEmitter",chr:FindFirstChild("HumanoidRootPart"))
											particle.Enabled = false
											particle.Texture = "rbxassetid://16291625893"
											particle.LightEmission = 1
											particle.ZOffset = 1
											particle.Size = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,0),
													NumberSequenceKeypoint.new(1,.5)
												}
											)
											particle.Transparency = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,1),
													NumberSequenceKeypoint.new(0.5,0),
													NumberSequenceKeypoint.new(1,1)
												}
											)
											particle.Lifetime = NumberRange.new(0.5,1)
											particle.Rotation = NumberRange.new(-10,10)
											particle.RotSpeed = NumberRange.new(-10,10)
											particle.Speed = NumberRange.new(-1,2)
											particle.Drag = 2
											particle:Emit(math.random(4,8))
											game:GetService("Debris"):AddItem(particle,3)
										end

										for c, set in pairs(PData.ClothesHP) do
											if not table.find(PData.CurrentClothes,c) then
												continue
											end
											local w = Clothes[c].Weld
											if Clothes[c].Alternative and Clothes[c].Alternative.Condition then
												local a = Function[Clothes[c].Alternative.Condition](PlayerName)
												if a and a == true then
													w = Clothes[c].Alternative.Weld
												end
											elseif Clothes[c].Alternative then
												local metCondition = false
												for i, alts in pairs(Clothes[c].Alternative) do
													if metCondition == false then
														local a = Function[alts.Condition](PlayerName)
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
														if PData.CurrentPartList["Clothes"][v] then
															transparent(PData.CurrentPartList["Clothes"][v],1)
														end
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																local t = PData.CurrentPartList["Organ"][v]:GetAttribute("Alpha") or 0
																transparent(PData.CurrentPartList["Organ"][v],t)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](false,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](false,chr,PlayerName,c)
															end
														end
													end
												else
													for i, v in pairs(w) do
														if PData.CurrentPartList["Clothes"][v] then
															local t = PData.CurrentPartList["Clothes"][v]:GetAttribute("Alpha") or 0
															transparent(PData.CurrentPartList["Clothes"][v],t)
														end
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																transparent(PData.CurrentPartList["Organ"][v],1)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](true,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](true,chr,PlayerName,c)
															end
														end
													end
												end
											end
										end
									end
								end
								-- bottom --
								if PData.BottomHP ~= "" and 
									(PData.HardcoreHP == false and h.MaxHealth-h.Health >= PData.BottomHP or
										PData.HardcoreHP == true and PData.SavedBottomHP <= 0
									) then
									if PData.BottomRipped == false then
										PData.BottomRipped = true

										if UIS.KeyboardEnabled then
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = getAsset("RClothesContent/Sound/Tear/tear"..  math.random(1,3) ..".mp3")
											audio.Volume = 0.75*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										else
											local sounds = {9113827650,9113827551,9113833815}
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = "rbxassetid://"..  sounds[math.random(1,#sounds)]
											audio.Volume = 0.75*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										end

										if PData.TearParticles == true then
											local particle = Instance.new("ParticleEmitter",chr:FindFirstChild("HumanoidRootPart"))
											particle.Enabled = false
											particle.Texture = "rbxassetid://386425736"
											particle.Size = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,.7,.375),
													NumberSequenceKeypoint.new(1,.4)
												}
											)
											particle.Transparency = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,1),
													NumberSequenceKeypoint.new(0.214,0),
													NumberSequenceKeypoint.new(0.545,0),
													NumberSequenceKeypoint.new(1,1)
												}
											)
											particle.Lifetime = NumberRange.new(0.5,1)
											particle.Rotation = NumberRange.new(-360,360)
											particle.RotSpeed = NumberRange.new(-360,360)
											particle.Speed = NumberRange.new(15,20)
											particle.SpreadAngle = Vector2.new(75,75)
											particle.Acceleration = Vector3.new(0,-15,0)
											particle.Drag = 5
											particle:Emit(50)
											game:GetService("Debris"):AddItem(particle,3)
										end

										for c, set in pairs(PData.ClothesHP) do
											if not table.find(PData.CurrentClothes,c) then
												continue
											end
											local w = Clothes[c].Weld
											if Clothes[c].Alternative and Clothes[c].Alternative.Condition then
												local a = Function[Clothes[c].Alternative.Condition](PlayerName)
												if a and a == true then
													w = Clothes[c].Alternative.Weld
												end
											elseif Clothes[c].Alternative then
												local metCondition = false
												for i, alts in pairs(Clothes[c].Alternative) do
													if metCondition == false then
														local a = Function[alts.Condition](PlayerName)
														if a and a == true then
															metCondition = true
															w = alts["Weld"]
														end
													end
												end
											end
											if set["HP"] == "BottomHP" then
												if set["Inverse"] == false then
													for i, v in pairs(w) do
														if PData.CurrentPartList["Clothes"][v] then
															transparent(PData.CurrentPartList["Clothes"][v],1)
														end
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																local t = PData.CurrentPartList["Organ"][v]:GetAttribute("Alpha") or 0
																transparent(PData.CurrentPartList["Organ"][v],t)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](false,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](false,chr,PlayerName,c)
															end
														end
													end
												else
													for i, v in pairs(w) do
														if PData.CurrentPartList["Clothes"][v] then
															local t = PData.CurrentPartList["Clothes"][v]:GetAttribute("Alpha") or 0
															transparent(PData.CurrentPartList["Clothes"][v],t)
														end
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																transparent(PData.CurrentPartList["Organ"][v],1)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](true,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](true,chr,PlayerName,c)
															end
														end
													end
												end
											end
										end
									end
								elseif PData.BottomHP ~= "" and 
									(PData.HardcoreHP == false and h.MaxHealth-h.Health < PData.BottomHP or
										PData.HardcoreHP == true and PData.SavedBottomHP > 0
									) then
									if PData.BottomRipped == true then
										PData.BottomRipped = false

										if UIS.KeyboardEnabled then
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = getAsset("RClothesContent/Sound/Heal/heal"..  math.random(1,4) ..".mp3")
											audio.Volume = 2.5*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										else
											local sounds = {9113824422,9119138453,9113384209,9113824860}
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = "rbxassetid://"..  sounds[math.random(1,#sounds)]
											audio.Volume = 2.5*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										end

										if PData.HealParticles == true then
											local particle = Instance.new("ParticleEmitter",chr:FindFirstChild("HumanoidRootPart"))
											particle.Enabled = false
											particle.Texture = "rbxassetid://16291625893"
											particle.LightEmission = 1
											particle.ZOffset = 1
											particle.Size = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,0),
													NumberSequenceKeypoint.new(1,.5)
												}
											)
											particle.Transparency = NumberSequence.new(
												{
													NumberSequenceKeypoint.new(0,1),
													NumberSequenceKeypoint.new(0.5,0),
													NumberSequenceKeypoint.new(1,1)
												}
											)
											particle.Lifetime = NumberRange.new(0.5,1)
											particle.Rotation = NumberRange.new(-10,10)
											particle.RotSpeed = NumberRange.new(-10,10)
											particle.Speed = NumberRange.new(-1,2)
											particle.Drag = 2
											particle:Emit(math.random(4,8))
											game:GetService("Debris"):AddItem(particle,3)
										end

										for c, set in pairs(PData.ClothesHP) do
											if not table.find(PData.CurrentClothes,c) then
												continue
											end
											local w = Clothes[c].Weld
											if Clothes[c].Alternative and Clothes[c].Alternative.Condition then
												local a = Function[Clothes[c].Alternative.Condition](PlayerName)
												if a and a == true then
													w = Clothes[c].Alternative.Weld
												end
											elseif Clothes[c].Alternative then
												local metCondition = false
												for i, alts in pairs(Clothes[c].Alternative) do
													if metCondition == false then
														local a = Function[alts.Condition](PlayerName)
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
														transparent(PData.CurrentPartList["Clothes"][v],1)
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																local t = PData.CurrentPartList["Organ"][v]:GetAttribute("Alpha") or 0
																transparent(PData.CurrentPartList["Organ"][v],t)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](false,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](false,chr,PlayerName,c)
															end
														end
													end
												else
													for i, v in pairs(w) do
														local t = PData.CurrentPartList["Clothes"][v]:GetAttribute("Alpha") or 0
														transparent(PData.CurrentPartList["Clothes"][v],t)
													end
													if Clothes[c].Unvisible then
														for i, v in pairs(Clothes[c].Unvisible) do
															if PData.CurrentPartList["Organ"][v] then
																transparent(PData.CurrentPartList["Organ"][v],1)
															end
														end
													end
													if Clothes[c].HPFunction then
														if typeof(Clothes[c].HPFunction) == "string" then
															Function[Clothes[c].HPFunction](true,chr,PlayerName,c)
														elseif typeof(Clothes[c].HPFunction) == "table" then
															for i, v in pairs(Clothes[c].HPFunction) do
																Function[v](true,chr,PlayerName,c)
															end
														end
													end
												end
											end
										end
									end
								end

								if (PData.SavedPreviousHP-h.Health) > 0 and PData.HardcoreHP == true then
									PData.SavedTopHP = math.max(PData.SavedTopHP-(PData.SavedPreviousHP-h.Health),0)
									PData.SavedBottomHP = math.max(PData.SavedBottomHP-(PData.SavedPreviousHP-h.Health),0)
									if PData["Healing"] == true then
										PData["Healing"] = false
										GUIObject.repairDisplay.Color = ColorSequence.new(
											{ColorSequenceKeypoint.new(0,Color3.new(1,0,0)),
												ColorSequenceKeypoint.new(0.00001,Color3.new(0, 0, 0)),
												ColorSequenceKeypoint.new(1,Color3.new(0, 0, 0))}
										)
										repairTween = TS:Create(GUIObject.repairBar,TweenInfo.new(1,Enum.EasingStyle.Sine,Enum.EasingDirection.In),{ImageTransparency=1})
										repairTween:Play()
									end
								end
								if PData.DamageSFX ~= "" and h.Health < PData.SavedPreviousHP then
									if (PData.SavedPreviousHP-h.Health) >= PData.DamageSFX then
										if UIS.KeyboardEnabled then
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = getAsset("RClothesContent/Sound/Moan/"..  math.random(1,8) ..".ogg")
											audio.Volume = 1.5*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										else
											local sounds = {4792913155,4792899013,4792904673,4792901644,4792915329,4792884617}
											local audio = Instance.new("Sound",chr.PrimaryPart)
											audio.SoundId = "rbxassetid://".. sounds[math.random(1,#sounds)]
											audio.Volume = 1.5*PData.Volume
											audio:Play()
											game:GetService("Debris"):AddItem(audio,3)
										end
									end
								end
								PData.SavedPreviousHP = h.Health
								if PData.HardcoreHP == true then
									if PData.TopHP ~= "" then
										GUIObject.topHPDisplay.Text = math.clamp(math.round((PData.SavedTopHP/PData.TopHP)*100),0,100).."%"
										GUIObject.topHPDisplay.TextColor3 = Color3.new(1-PData.SavedTopHP/PData.TopHP,PData.SavedTopHP/PData.TopHP,0)
									else
										GUIObject.topHPDisplay.Text = ""
									end
									if PData.BottomHP ~= "" then 
										GUIObject.bottomHPDisplay.Text = math.clamp(math.round((PData.SavedBottomHP/PData.BottomHP)*100),0,100).."%"
										GUIObject.bottomHPDisplay.TextColor3 = Color3.new(1-PData.SavedBottomHP/PData.BottomHP,PData.SavedBottomHP/PData.BottomHP,0)
									else
										GUIObject.bottomHPDisplay.Text = ""
									end
								else
									if PData.TopHP ~= "" then
										GUIObject.topHPDisplay.Text = math.clamp(math.round((1-(h.MaxHealth-h.Health)/PData.TopHP)*100),0,100).."%"
										GUIObject.topHPDisplay.TextColor3 = Color3.new(1-(1-(h.MaxHealth-h.Health)/PData.TopHP),(1-(h.MaxHealth-h.Health)/PData.TopHP),0)
									else
										GUIObject.topHPDisplay.Text = ""
									end
									if PData.BottomHP ~= "" then
										GUIObject.bottomHPDisplay.Text = math.clamp(math.round((1-(h.MaxHealth-h.Health)/PData.BottomHP)*100),0,100).."%"
										GUIObject.bottomHPDisplay.TextColor3 = Color3.new(1-(1-(h.MaxHealth-h.Health)/PData.BottomHP),(1-(h.MaxHealth-h.Health)/PData.BottomHP),0)
									else
										GUIObject.bottomHPDisplay.Text = ""
									end
								end
							end
						end
					end

				end

			end

		end
	end)

	local highlights = {}
	local currentCamera = workspace.CurrentCamera
	local currentFocus = currentCamera.Focus
	local currentCFrame = currentCamera:GetRenderCFrame()

	local camUpdater = RS:BindToRenderStep("CameraUpdate", Enum.RenderPriority.Camera.Value, function()
		currentCamera = workspace.CurrentCamera
		currentFocus = currentCamera.Focus
		currentCFrame = currentCamera:GetRenderCFrame()
	end)

	local RunConnect = RS.RenderStepped:Connect(function()
		for _, v in pairs(Method2CharacterFolder:GetChildren()) do
			local CharacterValue = v:FindFirstChildOfClass("ObjectValue")

			if CharacterValue and CharacterValue.Value.Parent == nil then
				v:Destroy()
			end
		end

		local lP = game:GetService("Players").LocalPlayer

		for PlayerName, DataList in pairs(PlayerData) do

			for Name, Property in pairs(DataList.ConvertedPart) do
				local Part = Property.Part
				local Weld = Property.Weld
				local Base = Property.Base
				local BaseSize = R15Size[Base.Name]
				if DataList.Character and DataList.Character:FindFirstChild(Base.Name) and DataList.Character:FindFirstChild(Base.Name):FindFirstChild("OriginalSize") then
					BaseSize = DataList.Character:FindFirstChild(Base.Name):FindFirstChild("OriginalSize").Value
				end

				if Base:IsA("MeshPart") and Base.MeshId == "http://www.roblox.com/asset/?id=542765884" then
					BaseSize = R15Size["UpperTorsoFemale"]
				end

				local XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(Base.Size, BaseSize)

				Part.Color = Base.Color
				Part.Material = Base.Material
				if Method == 2 or (PlayerData[lP.Name] and PlayerData[lP.Name].MeshBasePartInvisible == true) then
					Part.Transparency = 1
					Part.LocalTransparencyModifier = 1
				else
					Part.Transparency = Base.Transparency
					Part.LocalTransparencyModifier = 1
				end

				if PlayerData[lP.Name].MeshSizeLock == false then
					Part.Size = Vector3.new(R6Size[Name].X * XMultiply, R6Size[Name].Y * YMultiply, R6Size[Name].Z * ZMultiply)
					Weld.C0 = CFrame.new(WeldCFrame[Name].Position.X * XMultiply, WeldCFrame[Name].Position.Y * YMultiply, WeldCFrame[Name].Position.Z * ZMultiply) * WeldCFrame[Name].Rotation
				end
			end

			for Part, Property in pairs(DataList.CurrentPartList.RealtimeUpdateList.Mesh) do
				local Removed = false

				local oldBase
				local Base = Property.Base
				if Method == 2 or Method == 3 then
					oldBase = DataList.Character
					local m2Char = Method2CharacterFolder:FindFirstChild(PlayerName)
					if m2Char and Base then
						Base = m2Char:FindFirstChild(Base.Name) or Base
					end
				end
				if Part.Parent == nil or Function.FallenPartCheck(Part) or not Base then
					DataList.CurrentPartList.RealtimeUpdateList.Mesh[Part] = nil
					Removed = true
				end

				if Removed == false then
					local CFRAME = Property.CFrame
					local CFRAME1 = Property.CFrame1
					local SIZE = Property.Size
					local Weld = Property.Weld
					if Base and CFRAME and CFRAME1 and SIZE and Weld then
						local BodySize = BodyPartSize[Base.Name]
						local CalcSize = Base.Size
						local specialHead = false
						if Base.Name == "Head" and Base:IsA("MeshPart") then
							if Base:FindFirstChild("OriginalSize") then
								BodySize = Base:FindFirstChild("OriginalSize").Value
							else
								BodySize = BodyPartSize["HeadMeshFix"]
							end
						elseif Base.Name == "Head" and Base:FindFirstChildOfClass("SpecialMesh") then
							local SM:SpecialMesh = Base:FindFirstChildOfClass("SpecialMesh")
							if SM.MeshType == Enum.MeshType.Head then
								specialHead = true
								BodySize = BodyPartSize["HeadScale"]
							else
								local success, trueSize = pcall(function()
									if not DataList.CurrentPartList["TrueMeshSize"] 
										or DataList.CurrentPartList["TrueMeshSize"].MeshId ~= SM.MeshId then
										DataList.CurrentPartList["TrueMeshSize"] = {
											Part=IS:CreateMeshPartAsync(SM.MeshId, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance),
											ID=SM.MeshId
										}
									end
									return DataList.CurrentPartList["TrueMeshSize"].Part
								end)
								if success then
									CalcSize = trueSize.Size*SM.Scale
									BodySize = BodyPartSize["HeadMeshFix"]
								else
									CalcSize = SM.Scale
									BodySize = BodyPartSize["HeadScale"]
								end
							end
						end

						local XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(CalcSize, BodySize)
						if specialHead == true then
							local SM:SpecialMesh = Base:FindFirstChildOfClass("SpecialMesh")

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

						local CCFRAME = CFrame.new(CFRAME.Position.X * XMultiply, CFRAME.Position.Y * YMultiply, CFRAME.Position.Z * ZMultiply) * CFRAME.Rotation
						local CCFRAME1 = CFrame.new(CFRAME1.Position.X * XMultiply, CFRAME1.Position.Y * YMultiply, CFRAME1.Position.Z * ZMultiply) * CFRAME1.Rotation

						if DataList.MeshSizeLock == false and not DataList.CurrentPartList.BodyPartPhysics[Part] then
							if Part.Size ~= Vector3.new(SIZE.X * XMultiply, SIZE.Y * YMultiply, SIZE.Z * ZMultiply) then
								Part.Size = Vector3.new(SIZE.X * XMultiply, SIZE.Y * YMultiply, SIZE.Z * ZMultiply)
							end
							if Weld.C0 ~= CCFRAME then
								Weld.C0 = CCFRAME
							end
							if Weld.C1 ~= CCFRAME1 then
								Weld.C1 = CCFRAME1
							end
						elseif DataList.MeshSizeLock == false and DataList.CurrentPartList.BodyPartPhysics[Part] then
							if Part.Size ~= Vector3.new(SIZE.X * XMultiply, SIZE.Y * YMultiply, SIZE.Z * ZMultiply) then
								Part.Size = Vector3.new(SIZE.X * XMultiply, SIZE.Y * YMultiply, SIZE.Z * ZMultiply)
							end
							if DataList.CurrentPartList.BodyPartPhysics[Part].CF ~= CCFRAME then
								DataList.CurrentPartList.BodyPartPhysics[Part].CF = CCFRAME
							end
							if DataList.CurrentPartList.BodyPartPhysics[Part].CF1 ~= CCFRAME1 then
								DataList.CurrentPartList.BodyPartPhysics[Part].CF1 = CCFRAME1
							end
						end
					end

					if oldBase then
						if DataList.Character:FindFirstChildOfClass("Highlight") 
							and not table.find(highlights,DataList.Character:FindFirstChildOfClass("Highlight")) then
							local h:Highlight = DataList.Character:FindFirstChildOfClass("Highlight")
							if not h.Adornee or h.Adornee == h.Parent then
								table.insert(highlights,h)
								local replicate = h:Clone()
								replicate.Parent = Method2CharacterFolder:FindFirstChild(PlayerName)
								local changed
								changed = h.Changed:Connect(function(c)
									if h.Parent == nil then
										replicate:Destroy()
										changed:Disconnect()
										table.remove(highlights,table.find(highlights,h))
									elseif (not h.Adornee and h.Parent ~= DataList.Character) or (h.Adornee and h.Adornee ~= DataList.Character) then
										replicate.Parent = nil
									else
										if c ~= "Adornee" then
											replicate[c] = h[c]
										end
										replicate.Parent = Method2CharacterFolder:FindFirstChild(PlayerName)
									end
									if h.Parent ~= DataList.Character and (not h.Adornee or h.Adornee ~= DataList.Character) then
										replicate:Destroy()
										changed:Disconnect()
										table.remove(highlights,table.find(highlights,h))
									end
								end)
								table.insert(AllConnect,changed)
							end
						end
					end

					if DataList.RealtimeBodyTransparency == true and Method ~= 2 and Method ~= 3 then 
						local updated = false
						if --Part.Transparency == PlayerData[PlayerName].OldTransparency[Base] and 
							Base.Transparency ~= DataList.OldTransparency[Base] then
							Part.Transparency = math.clamp(Base.Transparency,Part:GetAttribute("maxTransparencyRC") or -math.huge,math.huge)
							updated = true
						end
						if Part.Transparency ~= Part:GetAttribute("maxTransparencyRC") and 
							(Part.Transparency ~= Base.Transparency or Part.Transparency == Base.Transparency and updated == false and Part:GetAttribute("maxDeterminedRC") == false) then
							Part:SetAttribute("maxDeterminedRC",false)
							Part:SetAttribute("maxTransparencyRC",Part.Transparency)
						elseif Part.Transparency ~= Part:GetAttribute("maxTransparencyRC") and 
							Part.Transparency == Base.Transparency and updated == true then
							Part:SetAttribute("maxDeterminedRC",true)
						end
						Part.Transparency = math.clamp(Base.Transparency,Part:GetAttribute("maxTransparencyRC") or -math.huge,math.huge)
						if Part.Transparency == Base.Transparency then
							Part:SetAttribute("maxDeterminedRC",true)
						end
					end
					if PlayerName == lP.Name then
						if DataList.LocalTransparency[Base.Name] == true then
							Part.LocalTransparencyModifier = Part.Transparency
						elseif Method == 2 then
							if lP.Character and lP.Character:FindFirstChild("HumanoidRootPart") then
								local chr = lP.Character
								local human = chr.Humanoid
								local rootPart = chr.HumanoidRootPart

								if currentCamera then
									local distance = (currentFocus.p - currentCFrame.p).magnitude
									local transparency = (distance<2) and (1.0-(distance-0.5)/1.5) or 0
									if transparency < 0.5 then
										transparency = 0
									end

									transparency = math.clamp(Function.Round(transparency, 2), 0, 1)
									if transparency >= 0.85 then
										transparency = 1
									end
									if Part.LocalTransparencyModifier ~= transparency then
										if math.abs(Part.LocalTransparencyModifier-transparency) > .4 or Part.LocalTransparencyModifier > .95 then
											Part.LocalTransparencyModifier = transparency
										else
											Part.LocalTransparencyModifier = Part.Transparency+math.lerp(Part.LocalTransparencyModifier,transparency,.2)
										end
									end
								end
							--[[
							local centerCam = rootPart.Position+Vector3.new(0,1.5,0)
							local camToHead = (workspace.CurrentCamera.CFrame.Position-(centerCam+(rootPart.CFrame:VectorToWorldSpace(human.CameraOffset))))
							
							local transparent
							if 1.5-camToHead.Magnitude > 0.95 then
								transparent = 1
							else
								transparent = 1.5-camToHead.Magnitude
							end
							Part.LocalTransparencyModifier = Base.Transparency+math.lerp(Part.LocalTransparencyModifier,transparent,.5)
							]]
							end
						end
					end

					if Part.Material == Enum.Material.Glass and Part.Transparency >= 1 then
						Part:AddTag("RCGlassMat")
						Part.Material = Enum.Material.Neon
					elseif Part.Material == Enum.Material.Neon and Part:HasTag("RCGlassMat") and Part.Transparency < 1 then
						Part:RemoveTag("RCGlassMat")
						Part.Material = Enum.Material.Glass
					end
				end
			end

			for Part, Property in pairs(DataList.CurrentPartList.RealtimeUpdateList.Accessory) do
				local Removed = false

				if Part.Parent == nil or Function.IsParentNil(Part) or Function.FallenPartCheck(Part) then
					DataList.CurrentPartList.RealtimeUpdateList.Accessory[Part] = nil

					Removed = true
				end

				if Removed == false then
					local Base = Property.Base
					local Attach = Property.Attachment
					local PAttach = Property.ParentAttachment
					local CF = Property.CFrame
					local Size = Property.Size
					local Scale = Property.Scale
					local SpecialMesh = Property.SpecialMesh
					local Weld = Property.Weld

					local PAttachCFrame = AttachmentCFrame[PAttach.Name]

					local CalcSize = Base.Size
					local BodySize = BodyPartSize[Base.Name]
					local specialHead = false
					if not BodySize then
						if Base.Name == "UpperTorso" or Base.Name == "LowerTorso" then
							BodySize = BodyPartSize["Torso"]
						elseif Base.Name == "RightUpperArm" or Base.Name == "LeftLowerArm" then
							BodySize = BodyPartSize["Left Arm"]
						elseif Base.Name == "RightUpperArm" or Base.Name == "RightLowerArm" then
							BodySize = BodyPartSize["Right Arm"]
						elseif Base.Name == "LeftUpperLeg" or Base.Name == "LeftLowerLeg" then
							BodySize = BodyPartSize["Left Leg"]
						elseif Base.Name == "RightUpperLeg" or Base.Name == "RightLowerrLeg" then
							BodySize = BodyPartSize["Right Leg"]
						end
					elseif Base.Name == "Head" and Base:IsA("MeshPart") then
						if Base:FindFirstChild("OriginalSize") then
							BodySize = Base:FindFirstChild("OriginalSize").Value
						else
							BodySize = BodyPartSize["HeadMeshFix"]
						end
					elseif Base.Name == "Head" and Base:FindFirstChildOfClass("SpecialMesh") then
						local SM:SpecialMesh = Base:FindFirstChildOfClass("SpecialMesh")
						if SM.MeshType == Enum.MeshType.Head then
							specialHead = true
							BodySize = BodyPartSize["HeadScale"]
						else
							local success, trueSize = pcall(function()
								if not DataList.CurrentPartList["TrueMeshSize"] 
									or DataList.CurrentPartList["TrueMeshSize"].MeshId ~= SM.MeshId then
									DataList.CurrentPartList["TrueMeshSize"] = {
										Part=IS:CreateMeshPartAsync(SM.MeshId, Enum.CollisionFidelity.Box, Enum.RenderFidelity.Performance),
										ID=SM.MeshId
									}
								end
								return DataList.CurrentPartList["TrueMeshSize"].Part
							end)
							if success then
								CalcSize = trueSize.Size*SM.Scale
								BodySize = BodyPartSize["HeadMeshFix"]
							else
								CalcSize = SM.Scale
								BodySize = BodyPartSize["HeadScale"]
							end
						end
					end

					local XMultiply, YMultiply, ZMultiply = Function.MultiplyCalculate(CalcSize, BodySize)
					if specialHead == true then
						local SM:SpecialMesh = Base:FindFirstChildOfClass("SpecialMesh")

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

					if PlayerData[PlayerName].RealtimeBodyTransparency == true and Method ~= 2 and Method ~= 3 then
						Part.Transparency = Base.Transparency
					end
					if PlayerName == lP.Name then
						if PlayerData[PlayerName].LocalTransparency[Base.Name] == true 
							and PlayerData[PlayerName].LocalTransparency["Hat"] == true then
							Part.LocalTransparencyModifier = Part.Transparency
						elseif Method == 2 then
							if lP.Character and lP.Character:FindFirstChild("HumanoidRootPart") then
								local chr = lP.Character
								local human = chr.Humanoid
								local rootPart = chr.HumanoidRootPart

								if currentCamera then
									local distance = (currentFocus.p - currentCFrame.p).magnitude
									local transparency = (distance<2) and (1.0-(distance-0.5)/1.5) or 0
									if transparency < 0.5 then
										transparency = 0
									end

									transparency = math.clamp(Function.Round(transparency, 2), 0, 1)
									if transparency >= 0.85 then
										transparency = 1
									end
									if Part.LocalTransparencyModifier ~= transparency then
										if math.abs(Part.LocalTransparencyModifier-transparency) > .4 or Part.LocalTransparencyModifier > .95 then
											Part.LocalTransparencyModifier = transparency
										else
											Part.LocalTransparencyModifier = Part.Transparency+math.lerp(Part.LocalTransparencyModifier,transparency,.2)
										end
									end
								end
							end
						end
					end

					if PlayerData[PlayerName].AccessorySizeLock == false then
						Part.Size = Vector3.new(Size.X * XMultiply, Size.Y * YMultiply, Size.Z * ZMultiply)
						SpecialMesh.Scale = Vector3.new(Scale.X * XMultiply, Scale.Y * YMultiply, Scale.Z * ZMultiply)
						if not PlayerData[PlayerName].CurrentPartList.physicsTails[Part.Parent] then
							Attach.CFrame = CFrame.new(CF.Position.X * XMultiply, CF.Position.Y * YMultiply, CF.Position.Z * ZMultiply) * CF.Rotation
							PAttach.CFrame = CFrame.new(PAttachCFrame.Position.X * XMultiply, PAttachCFrame.Position.Y * YMultiply, PAttachCFrame.Position.Z * ZMultiply) * PAttachCFrame.Rotation
							Weld.C0 = Attach.CFrame
							Weld.C1 = PAttach.CFrame
						end
					end
				end
			end

			for SpecialMesh, Property in pairs(DataList.CurrentPartList.RealtimeUpdateList.SpecialMesh) do
				local Removed = false

				if SpecialMesh.Parent == nil or Function.IsParentNil(SpecialMesh) or Function.FallenPartCheck(SpecialMesh) then
					DataList.CurrentPartList.RealtimeUpdateList.SpecialMesh[SpecialMesh] = nil

					Removed = true
				end

				if Removed == false then
					local Base = Property.Base
					local SIZE = Property.Size

					if Method == 2 or Method == 3 then
						Base = DataList.Character:FindFirstChild(Base.Name)
					end
					if Base and SIZE and SpecialMesh then
						local BodySize = BodyPartSize[Base.Name]
						local CalcSize = Base.Size
						local specialHead = false
						if Base.Name == "Head" and Base:IsA("MeshPart") then
							if Base:FindFirstChild("OriginalSize") then
								BodySize = Base:FindFirstChild("OriginalSize").Value
							else
								BodySize = BodyPartSize["HeadMeshFix"]
							end
						elseif Base.Name == "Head" and Base:FindFirstChildOfClass("SpecialMesh") then
							local SM:SpecialMesh = Base:FindFirstChildOfClass("SpecialMesh")
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
							local SM:SpecialMesh = Base:FindFirstChildOfClass("SpecialMesh")

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

						if DataList.MeshSizeLock == false then
							if SpecialMesh.Scale ~= Vector3.new(SIZE.X * XMultiply, SIZE.Y * YMultiply, SIZE.Z * ZMultiply) then
								SpecialMesh.Scale = Vector3.new(SIZE.X * XMultiply, SIZE.Y * YMultiply, SIZE.Z * ZMultiply)
							end
						end
					end
				end
			end

			for i, v in pairs(DataList.CurrentPartList.RealtimeUpdateList.Special) do
				local Removed = false

				if v.Parent == nil or Function.IsParentNil(v) then
					DataList.CurrentPartList.RealtimeUpdateList.Special[i] = nil

					Removed = true
				end

				if Removed == false then
					if v.Name == "cTrail" then
						local origin = v.Parent
						local particle = v:FindFirstChildOfClass("ParticleEmitter")
						--[[
						local par = RaycastParams.new()
						par.FilterDescendantsInstances = {Player.Character:GetDescendants(),Method2CharacterFolder:GetDescendants()}
						par.FilterType = Enum.RaycastFilterType.Exclude
						par.RespectCanCollide = true
						local cast = workspace:Raycast(origin.Position,Vector3.new(0,-10000,0),par)
						if cast then
							particle.Enabled = true
							v.WorldCFrame = CFrame.new(Vector3.new(cast)) * cast.Instance.CFrame.Rotation
						else
							particle.Enabled = false
						end
						]]
						if particle:GetAttribute("Enabled") ~= false then
							local ignoreList = {}
							for i, v in pairs(collisionList) do
								table.insert(ignoreList,v)
							end
							for i, v in pairs(Player.Character:GetDescendants()) do
								if v:IsA("BasePart") then
									table.insert(ignoreList,v)
								end
							end
							for i, v in pairs(Method2CharacterFolder:GetDescendants()) do
								if v:IsA("BasePart") then
									table.insert(ignoreList,v)
								end
							end
							local instance,hit = workspace:FindPartOnRayWithIgnoreList(
								Ray.new(origin.Position,Vector3.new(0,-10000,0)),
								ignoreList
							)
							if hit then
								if instance.CanCollide == false and not collisionChecks[instance] then
									table.insert(collisionList,instance)
									local collisionChange = instance:GetPropertyChangedSignal("CanCollide"):Connect(function()
										if instance.CanCollide == false and not table.find(collisionList,instance) then
											table.insert(collisionList,instance)
										elseif instance.CanCollide == true then
											table.remove(collisionList,table.find(collisionList,instance))
										end
									end)
									collisionChecks[instance] = collisionChange
									table.insert(AllConnect, collisionChange)
								else
									particle.Enabled = true
									v.WorldCFrame = CFrame.new(hit) --* instance.CFrame.Rotation
								end
							else
								particle.Enabled = false
							end
						else
							particle.Enabled = false
						end
					elseif v.Name == "nCensor" and v:FindFirstChildOfClass("ObjectValue") then
						local origin = v:FindFirstChildOfClass("ObjectValue")
						if origin.Value and origin.Value.Parent ~= nil then
							local tors = origin.Value.Parent
							local LNipple:MeshPart
							local RNipple:MeshPart

							if tors:FindFirstChild("Left Breast") and tors:FindFirstChild("Left Breast"):FindFirstChild("Nipple") then
								LNipple = tors["Left Breast"]["Nipple"]
							end
							if tors:FindFirstChild("Right Breast") and tors:FindFirstChild("Right Breast"):FindFirstChild("Nipple") then
								RNipple = tors["Right Breast"]["Nipple"]
							end
							if tors and LNipple and RNipple and v:FindFirstChildOfClass("Frame") then
								local angle = math.acos(
									math.clamp(
										currentCFrame.LookVector:Dot(tors.CFrame.LookVector),
										-1, 1)
								)

								if angle > math.pi/2.8 and (LNipple.Transparency < 1 or RNipple.Transparency < 1) then
									local corners = {
										RNipple.CFrame * Vector3.new(-.45, -.3, -.3),
										LNipple.CFrame * Vector3.new(-.45, -.3, .3),
										RNipple.CFrame * Vector3.new(-.45, .3, -.3),
										LNipple.CFrame * Vector3.new(-.45, .3, .3),
										RNipple.CFrame * Vector3.new(.45, -.3, -.3),
										LNipple.CFrame * Vector3.new(.45, -.3, .3),
										RNipple.CFrame * Vector3.new(.45, .3, -.3),
										LNipple.CFrame * Vector3.new(.45, .3, .3)
									}

									local minX, minY = math.huge, math.huge
									local maxX, maxY = -math.huge, -math.huge

									-- Project to screen space
									for _, corner in ipairs(corners) do
										local screenPos, onScreen = currentCamera:WorldToScreenPoint(corner)
										minX = math.min(minX, screenPos.X)
										minY = math.min(minY, screenPos.Y)
										maxX = math.max(maxX, screenPos.X)
										maxY = math.max(maxY, screenPos.Y)
									end

									-- Screen-aligned bounding box
									local screenBoundingBox = {
										x = minX,
										y = minY,
										width = maxX - minX,
										height = maxY - minY
									}

									v.Frame.Position = UDim2.new(0, screenBoundingBox.x, 0, screenBoundingBox.y)
									v.Frame.Size = UDim2.new(0, screenBoundingBox.width, 0, screenBoundingBox.height)
									v.Frame.Visible = true
								else
									v.Frame.Visible = false
								end
							end
						else
							v:Destroy()
							DataList.CurrentPartList.RealtimeUpdateList.Special[i] = nil
						end
					end
				end
			end

			for Part, Property in pairs(DataList.CurrentPartList.ParentTransparency) do
				local Removed = false

				if Part.Parent == nil or Function.IsParentNil(Part) or Function.FallenPartCheck(Part) then
					DataList.CurrentPartList.ParentTransparency[Part] = nil

					Removed = true
				end

				if Removed == false then
					local T = Property.T

					if T then
						PlayerData[PlayerName].OldTransparency[Part] = Part.Transparency
						if PlayerData[PlayerName].RealtimeBodyTransparency == true then
							Part.LocalTransparencyModifier = T
						else
							if not PlayerData[PlayerName].CurrentPartList.OriginalTransparency[Part] then
								PlayerData[PlayerName].CurrentPartList.OriginalTransparency[Part] = Part.Transparency
							end
							Part.Transparency = T
						end
					end
				end
			end
			
			for Part, Property in pairs(DataList.CurrentPartList.TransparencyLink) do
				local Removed = false

				if Part.Parent == nil or Function.IsParentNil(Part) or Function.FallenPartCheck(Part) then
					DataList.CurrentPartList.TransparencyLink[Part] = nil

					Removed = true
				end

				if Removed == false then
					local T = Property.T.Transparency
					local D = Property.Define or 0
					if Part:GetAttribute("MaxTransparenyRC") and D < Part:GetAttribute("MaxTransparenyRC") then
						D = Part:GetAttribute("MaxTransparenyRC")
					end

					Part.LocalTransparencyModifier = math.clamp(Property.T.LocalTransparencyModifier,D,math.huge)
					Part.Transparency = math.clamp(T,D,math.huge)
				end
			end

			for Decal, Part in pairs(DataList.CurrentPartList.AreolaDecal) do
				local Removed = false

				if Part.Parent == nil or Function.IsParentNil(Part) or Function.FallenPartCheck(Part) then
					DataList.CurrentPartList.AreolaDecal[Decal] = nil

					Removed = true
				end

				if Removed == false then
					Decal.Transparency = Part.Transparency
					Decal.LocalTransparencyModifier = Part.LocalTransparencyModifier
				end
			end
		end

		PreviewRotate += Circle / PreviewRotateSpeed
		GUIObject.ViewportCamera.CFrame = CFrame.lookAt(Vector3.new(math.sin(PreviewRotate)*PreviewRadius, 0, math.cos(PreviewRotate)*PreviewRadius), Vector3.new(0,0,0))
	end)

	local PhysicsConnect = RS.RenderStepped:Connect(function(d)
		for PlayerName, DataList in pairs(PlayerData) do
			for Part, Property in pairs(DataList.CurrentPartList.BodyPartPhysics) do
				task.spawn(function()
					if Function.FallenPartCheck(Part) then
						DataList.CurrentPartList.BodyPartPhysics[Part] = nil

						return
					end

					local Character = DataList.Character
					local Human = Character:FindFirstChildOfClass("Humanoid")

					if Character and Human then
						local Base = Property.Base
						local Camera = game.Workspace.CurrentCamera

						local CurrentCFrame = Base.CFrame

						local OriginCFrame = Property.OriginCFrame
						local OriginPosition = OriginCFrame.Position
						local CurrentPosition = CurrentCFrame.Position
						local PositionDistance = (OriginPosition - CurrentPosition)

						--[[print(Function.Round(PositionDistance.Magnitude,2),math.max(Human.WalkSpeed/8,1),Function.Round(Base.AssemblyLinearVelocity.Magnitude,2))]]
						if (Camera.CFrame.Position - Base.Position).Magnitude < 300 
							and (PositionDistance.Magnitude < math.max(Human.WalkSpeed/8,1) or PositionDistance.Magnitude <= Base.AssemblyLinearVelocity.Magnitude) then
							local Weld = Property.Weld
							local CF = Property.CF
							local CF1 = Property.CF1
							local Spring = Property.Spring
							local PositionOffset = Property.PositionOffset
							local RotationOffset = Property.RotationOffset
							local Position = Property.Position
							local Rotation = Property.Rotation

							local OriginLookVector = OriginCFrame.LookVector
							local CurrentLookVector = CurrentCFrame.LookVector
							local LookVectorDistance = (OriginLookVector - CurrentLookVector)
							local LookVectorAxis = Vector3.new(LookVectorDistance.X, LookVectorDistance.Y, LookVectorDistance.Z--[[0]])

							Spring:TimeSkip(d)
							Spring:Impulse(PositionDistance + LookVectorAxis)

							local PositionList = {
								X = 0,
								Y = 0,
								Z = 0
							}

							local RotationList = {
								X = 0,
								Y = 0,
								Z = 0
							}

							for From, To in pairs(PositionOffset) do
								PositionList[From] = (Position[To] * Spring.Velocity[To]) * PositionPhysicsMultiply
							end

							for From, To in pairs(RotationOffset) do
								RotationList[From] = (math.rad(Rotation[To] * Spring.Velocity[To])) * RotationPhysicsMultiply
							end

							Weld.C0 = CF * (
								CFrame.new(
									PositionList.X,
									PositionList.Y,
									PositionList.Z
								) * CFrame.Angles(
									RotationList.X,
									RotationList.Y,
									RotationList.Z
								)
							)

							if DataList["PhysicsObeyGravity"] == true then

								if Part.Name == "Left Breast" then
									Part:AddTag("AppliedPhysics")
									local frame = Base.CFrame

									if Property.BreastsType == 2 then -- type2
										Weld.C1 = CF1 * CFrame.Angles(
											math.abs(OriginLookVector.Y)*-math.clamp(frame.LookVector.Y,-math.huge,.35),
											0,
											-frame.RightVector.Y
										)
									elseif Property.BreastsType == 3 then -- type3
										Weld.C1 = CF1 * CFrame.Angles(
											(-frame.LookVector.Y*.2)-frame.RightVector.Y,
											0,
											math.abs(OriginLookVector.Y)*math.clamp(frame.LookVector.Y,-math.huge,.35)
										)
									elseif Property.BreastsType == 5 then -- type2
										Weld.C1 = CF1 * CFrame.Angles(
											math.abs(OriginLookVector.Y)*math.clamp(frame.LookVector.Y,-math.huge,.35),
											0,
											frame.RightVector.Y
										)
									else -- default
										Weld.C1 = CF1 * CFrame.Angles(
											(frame.LookVector.Y*.2)+frame.RightVector.Y,
											0,
											math.abs(OriginLookVector.Y)*-math.clamp(frame.LookVector.Y,-math.huge,.35)
										)
									end

								elseif Part.Name == "Right Breast" then
									Part:AddTag("AppliedPhysics")
									local frame = Base.CFrame

									if Property.BreastsType == 2 then -- type2
										Weld.C1 = CF1 * CFrame.Angles(
											math.abs(OriginLookVector.Y)*-math.clamp(frame.LookVector.Y,-math.huge,.35),
											0,
											-frame.RightVector.Y
										)
									elseif Property.BreastsType == 3 then -- type3
										Weld.C1 = CF1 * CFrame.Angles(
											(frame.LookVector.Y*.2)-frame.RightVector.Y,
											0,
											math.abs(OriginLookVector.Y)*math.clamp(frame.LookVector.Y,-math.huge,.35)
										)
									elseif Property.BreastsType == 5 then -- type5
										Weld.C1 = CF1 * CFrame.Angles(
											math.abs(OriginLookVector.Y)*math.clamp(frame.LookVector.Y,-math.huge,.35),
											0,
											frame.RightVector.Y
										)
									else -- default
										Weld.C1 = CF1 * CFrame.Angles(
											(-frame.LookVector.Y*.2)+frame.RightVector.Y,
											0,
											math.abs(OriginLookVector.Y)*-math.clamp(frame.LookVector.Y,-math.huge,.35)
										)
									end


								elseif Part.Name == "Breasts Shirt" or Part.Name == "Breasts Pants" then
									local frame = Base.CFrame
									Weld.C1 = CF1 * CFrame.Angles(
										frame.RightVector.Y,
										0,
										math.abs(OriginLookVector.Y)*-math.clamp(frame.LookVector.Y,-math.huge,.42)
									)
								end

							elseif Part:HasTag("AppliedPhysics") then

								if Part.Name == "Left Breast" 
									or Part.Name == "Right Breast" 
									or Part.Name == "Breasts Shirt" or Part.Name == "Breasts Pants" then
									Weld.C1 = CF1
									Part:RemoveTag("AppliedPhysics")
								end

							end
						--[[else
							warn("IT WENT ABOVE")]]
						end

						PlayerData[PlayerName].CurrentPartList.BodyPartPhysics[Part].OriginCFrame = CurrentCFrame
					end
				end)
			end
		end
	end)

	local tailPhysicsConnect = RS.PreRender:Connect(function(deltaTime)
		for PlayerName, DataList in pairs(PlayerData) do
			task.spawn(function()
				if DataList.tailSettings.isTailCurrentlyEnabled ~= DataList.tailSettings.tailPhysicsEnabled then
					DataList.tailSettings.isTailCurrentlyEnabled = DataList.tailSettings.tailPhysicsEnabled

					if not DataList.tailSettings.tailPhysicsEnabled then

						-- Make tails static.
						for _, physicsTail in DataList.CurrentPartList.physicsTails do
							if physicsTail.renderingPhysics then
								physicsTail.renderingPhysics = false
								updatePhysicsTailToStatic(physicsTail)
							end
						end
					end
				end

				-- Not enabled so don't render tail physics.
				if not DataList.tailSettings.tailPhysicsEnabled then
					return
				end

				-- DeltaTime is maxed incase of spontaneous "frame jumps".
				local deltaTime = math.min(deltaTime, 0.1) * DataList.tailSettings.timeScale

				if not tailVariables[PlayerName] then
					tailVariables[PlayerName] = {}
					for i, v in pairs(tailVariables.Default)  do
						tailVariables[PlayerName][i] = v
					end
				end
				tailVariables[PlayerName].tailScaledAnimationTime += deltaTime * DataList.tailSettings.wagAnimationSpeed
				tailVariables[PlayerName].tailScaledTime += deltaTime
				tailVariables[PlayerName].accumulator += deltaTime

				-- Get stepCount.
				local stepCount = 0 -- ~ 1 to 2 at 60fps.
				while tailVariables[PlayerName].accumulator >= timeStep do
					tailVariables[PlayerName].accumulator -= timeStep
					stepCount += 1
				end

				-- Caching camera position.
				local cameraPosition = workspace.CurrentCamera:GetRenderCFrame().Position

				-- Tails where their physics will be rendered and not be static
				local tailsCurrentlyRenderingPhysics:{physicsTail} = {}

				-- Pre-compute camera distance.
				for _, physicsTail in DataList.CurrentPartList.physicsTails do
					local distanceToCamera = (physicsTail.root.CFrame.Position - cameraPosition).Magnitude

					if distanceToCamera <= 300 then
						-- We don't do anything with distanceToCamera if the tail is static.
						-- So we'll only use resources setting physicsTail.distanceToCamera if it's within distance.
						physicsTail.distanceToCamera = distanceToCamera

						table.insert(tailsCurrentlyRenderingPhysics, physicsTail)
					elseif physicsTail.renderingPhysics then
						physicsTail.renderingPhysics = false
						updatePhysicsTailToStatic(physicsTail)
					end
				end

				-- Sort physics tails by camera distance.
				table.sort(tailsCurrentlyRenderingPhysics, physicsTailsDistanceToCameraComparer)

				-- Pre-compute the time used in wag animation and wind.
				local unixTime = DateTime.now().UnixTimestampMillis * 0.001 * DataList.tailSettings.timeScale

				local interpolate = stepCount == 0 -- No physics being computed this frame (ahead of physics step schedule).
				local interpolationAlpha = tailVariables[PlayerName].accumulator * inverseTimeStep -- Used in interpolation.

				-- Update tails.
				local tailsUpdated = 0
				for _, physicsTail in tailsCurrentlyRenderingPhysics do
					if tailsUpdated > 100 then
						if physicsTail.renderingPhysics then
							physicsTail.renderingPhysics = false
							updatePhysicsTailToStatic(physicsTail)
						end
					else
						if interpolate then
							-- Interpolation will be too inaccurate if it has been static.
							-- Instead we will wait until it can actually compute a frame (leave it static for longer).
							if not physicsTail.renderingPhysics then continue end

							-- Interpolate.
							updatePhysicsTailToInterpolation(physicsTail, interpolationAlpha, PlayerName)
						else

							-- Reset tails that were previously static.
							if not physicsTail.renderingPhysics then
								-- Reset cframes.
								physicsTail.rootPreviousCFrame = physicsTail.root.CFrame
								physicsTail.rootPreviousDeltaCFrame = CFrame.identity

								local weldOriginalCFrame = physicsTail.weldOriginalCFrame

								-- Reset cframes.
								physicsTail.weldPreviousCFrame = weldOriginalCFrame
								physicsTail.weldCurrentCFrame = weldOriginalCFrame

								-- Reset angle.
								physicsTail.currentAngle = Vector3.zero

								-- Clear velocity.
								physicsTail.angularVelocity = Vector3.zero

								-- Reset wag.
								physicsTail.wagAnimationBlendAlpha = 0

								-- Now rendering physics.
								physicsTail.renderingPhysics = true
							end

							-- Update physics tails to be up to date.
							-- "stepCount == i" being false tells updatePhysicsTail it's only calculating physics.
							-- The last step will compute physics and the visual aspects (animation, weld.C0).
							for i=1, stepCount do
								updatePhysicsTail(physicsTail, stepCount == i, interpolationAlpha, PlayerName)
							end
						end

						-- For limiting amount of tails that can be updated.
						tailsUpdated += 1
					end
				end
			end)
		end
	end)

	local FrameEnterConnect = GUIObject.MainFrame.MouseEnter:Connect(function()
		IsEnterFrame = true
	end)

	local FrameLeaveConnect = GUIObject.MainFrame.MouseLeave:Connect(function()
		if IsMouseDown == false then
			IsEnterFrame = false
		end
	end)
	local cooldown = false
	local blackListSet
	local MouseDown = Mouse.Button1Down:Connect(function()
		IsMouseDown = true
		MouseDownStart = UIS:GetMouseLocation()
		GuiPositionStart = GUIObject.MainFrame.Position

		if ClickExecute == true and cooldown == false then
			cooldown = true
			local Part = Mouse.Target
			if Part and Part.Transparency > 0 and 
				(not Part:FindFirstAncestorOfClass("Model") or not Function.IsCharacter(Part:FindFirstAncestorOfClass("Model"))) then
				local ray = workspace.CurrentCamera:ViewportPointToRay(MouseDownStart.X, MouseDownStart.Y)
				local function findAllInvisOnRay()
					local targets = {}
					repeat
						local blacklist = {blackListSet}
						for i, v in pairs(targets) do
							blacklist[i] = v
						end
						local target = workspace:FindPartOnRayWithIgnoreList(Ray.new(ray.Origin,ray.Direction*999), blacklist)
						if target then
							table.insert(targets, target)
						end
					until not target
					for i, v in pairs(targets) do
						if v.Transparency <= 0 then
							table.remove(targets,i)
						end
					end
					return targets
				end
				local p = RaycastParams.new()
				p.RespectCanCollide = true
				p.FilterDescendantsInstances = {Part,findAllInvisOnRay()}
				p.FilterType = Enum.RaycastFilterType.Exclude
				local r = workspace:Raycast(ray.Origin,ray.Direction*999,p)
				if r and r.Instance:FindFirstAncestorOfClass("Model") ~= game:GetService("Players").LocalPlayer.Character then
					Part = r.Instance
				end
			end

			if Part and Part:FindFirstAncestorOfClass("Model") ~= nil then
				if Function.IsCharacter(Part:FindFirstAncestorOfClass("Model")) then
					Function.CharacterReset(Part:FindFirstAncestorOfClass("Model"))
					if PS:FindFirstChild(Part:FindFirstAncestorOfClass("Model").Name) == nil and PlayerData[SelectPlayer] ~= nil then
						local NPCData = math.random(0, 999999999).. Part:FindFirstAncestorOfClass("Model").Name
						if Function.TableFind(NPCs, Part:FindFirstAncestorOfClass("Model")) == nil then
							NPCs[NPCData] = Part:FindFirstAncestorOfClass("Model")
						else
							NPCData = Function.TableFind(NPCs, Part:FindFirstAncestorOfClass("Model"))
						end
						local cDataTable = Function.TableClone(PlayerData[SelectPlayer])
						cDataTable.CurrentPartList = Function.PlayerDataDefault().CurrentPartList
						PlayerData[NPCData] = cDataTable
						Function.CharacterExecute(Part:FindFirstAncestorOfClass("Model"), NPCData)
					else
						Function.CharacterReset(Part:FindFirstAncestorOfClass("Model").Name)
						Function.CharacterExecute(Part:FindFirstAncestorOfClass("Model"), Part:FindFirstAncestorOfClass("Model").Name)
					end
				end
			end
			cooldown = false
		end
	end)
	local double = false
	local MouseDown2 = Mouse.Button2Down:Connect(function()
		MouseDownStart = UIS:GetMouseLocation()

		if ClickExecute == true and cooldown == false then
			cooldown = true
			local Part = Mouse.Target
			if Part and Part.Transparency > 0 and 
				(not Part:FindFirstAncestorOfClass("Model") or not Function.IsCharacter(Part:FindFirstAncestorOfClass("Model"))) then
				local ray = workspace.CurrentCamera:ViewportPointToRay(MouseDownStart.X, MouseDownStart.Y)
				local function findAllInvisOnRay()
					local targets = {}
					repeat
						local blacklist = {blackListSet}
						for i, v in pairs(targets) do
							blacklist[i] = v
						end
						local target = workspace:FindPartOnRayWithIgnoreList(Ray.new(ray.Origin,ray.Direction*999), blacklist)
						if target then
							table.insert(targets, target)
						end
					until not target
					for i, v in pairs(targets) do
						if v.Transparency <= 0 then
							table.remove(targets,i)
						end
					end
					return targets
				end
				local p = RaycastParams.new()
				p.RespectCanCollide = true
				p.FilterDescendantsInstances = {Part,findAllInvisOnRay()}
				p.FilterType = Enum.RaycastFilterType.Exclude
				local r = workspace:Raycast(ray.Origin,ray.Direction*999,p)
				if r and r.Instance:FindFirstAncestorOfClass("Model") ~= game:GetService("Players").LocalPlayer.Character then
					Part = r.Instance
				end
			end

			if Part and Part:FindFirstAncestorOfClass("Model") ~= nil then
				if Function.IsCharacter(Part:FindFirstAncestorOfClass("Model")) then
					if PS:GetPlayerFromCharacter(Part:FindFirstAncestorOfClass("Model")) then
						Function.CharacterReset(Part:FindFirstAncestorOfClass("Model").Name,true)
					else
						Function.CharacterReset(Part:FindFirstAncestorOfClass("Model"),true)
					end
				end
			end

			if double == false then
				double = true
				task.delay(.15,function()
					double = false
				end)
			else
				double = false
				blackListSet = Part
				Mouse.TargetFilter = Part

				if Part then
					local visual = Part:Clone()
					visual:BreakJoints()
					for i, v in pairs(visual:GetChildren()) do
						v:Destroy()
					end
					visual.Parent = workspace
					visual.Archivable = not hidden
					visual.Anchored = true
					visual.CanCollide = false
					visual.CanQuery = false
					visual.CanTouch = false
					visual.CastShadow = false
					visual.Transparency = .5
					visual.Material = Enum.Material.Neon
					visual.Size = visual.Size + Vector3.new(.05,.05,.05)
					TS:Create(visual,TweenInfo.new(.25,Enum.EasingStyle.Quad,Enum.EasingDirection.Out),{Transparency = 1,Size = visual.Size + Vector3.new(2,2,2)}):Play()
					game:GetService("Debris"):AddItem(visual,.25)
				end
			end

			cooldown = false
		end
	end)

	local MouseUp = Mouse.Button1Up:Connect(function()
		IsMouseDown = false
		IsEnterFrame = false
		MouseDownStart = nil
		GuiPositionStart = nil
	end)

	local MouseMoveConnect = Mouse.Move:Connect(Function.DragUpdate)

	table.insert(AllConnect, FrameEnterConnect)
	table.insert(AllConnect, FrameLeaveConnect)
	table.insert(AllConnect, MouseDown)
	table.insert(AllConnect, MouseDown2)
	table.insert(AllConnect, MouseUp)
	table.insert(AllConnect, MouseMoveConnect)
	table.insert(AllConnect, camUpdater)
	table.insert(AllConnect, RunConnect)
	table.insert(AllConnect, PhysicsConnect)
	table.insert(AllConnect, tailPhysicsConnect)

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

       ██╗░░░██╗░██████╗███████╗██████╗░  ██╗███╗░░██╗████████╗███████╗██████╗░███████╗░█████╗░░█████╗░███████╗
       ██║░░░██║██╔════╝██╔════╝██╔══██╗  ██║████╗░██║╚══██╔══╝██╔════╝██╔══██╗██╔════╝██╔══██╗██╔══██╗██╔════╝
       ██║░░░██║╚█████╗░█████╗░░██████╔╝  ██║██╔██╗██║░░░██║░░░█████╗░░██████╔╝█████╗░░███████║██║░░╚═╝█████╗░░
       ██║░░░██║░╚═══██╗██╔══╝░░██╔══██╗  ██║██║╚████║░░░██║░░░██╔══╝░░██╔══██╗██╔══╝░░██╔══██║██║░░██╗██╔══╝░░
       ╚██████╔╝██████╔╝███████╗██║░░██║  ██║██║░╚███║░░░██║░░░███████╗██║░░██║██║░░░░░██║░░██║╚█████╔╝███████╗
       ░╚═════╝░╚═════╝░╚══════╝╚═╝░░╚═╝  ╚═╝╚═╝░░╚══╝░░░╚═╝░░░╚══════╝╚═╝░░╚═╝╚═╝░░░░░╚═╝░░╚═╝░╚════╝░╚══════╝
                                  
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
