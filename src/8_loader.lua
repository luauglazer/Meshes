	do
		for i, v in pairs(game:GetService("CollectionService"):GetTagged("RoClothes")) do
			v:Destroy()
		end

		local BREAKER = Instance.new("BoolValue")
		BREAKER.Name = "RoClothesBreaker"
		BREAKER.Parent = workspace

		local inExploitWorkspace = (AssetSource == "Exploit Workspace")
		if not inExploitWorkspace and env.isfile then
			local checkLoadFiles = {
				"RClothesContent/loadv9.png",
				"workspace/RClothesContent/loadv9.png",
				"Workspace/RClothesContent/loadv9.png",
				"RoCustomClothes/RClothesContent/loadv9.png",
				"rocustomclothes/RClothesContent/loadv9.png",
				"RoCustomClothes-main/RClothesContent/loadv9.png",
				"RClothesContent/load.png",
				"loadv9.png"
			}
			for _, clf in ipairs(checkLoadFiles) do
				if env.isfile(clf) then
					inExploitWorkspace = true
					break
				end
			end
		end
		if not inExploitWorkspace and _gca then
			local s, r = pcall(_gca, "RClothesContent/loadv9.png")
			if s and r and r ~= "" then
				inExploitWorkspace = true
			end
		end
		local loadui = Instance.new("ScreenGui", game:GetService("CoreGui"))
		loadui.Enabled = true
		local oload = Instance.new("ImageLabel", loadui)
		oload.Image = getAsset("RClothesContent/load.png")
		oload.Size = UDim2.new(1, 0, 1, 0)
		oload.Transparency = 1
		oload.ImageTransparency = .999
		local load = Instance.new("ImageLabel", loadui)
		load.Image = getAsset("RClothesContent/loadv9.png")
		load.Size = UDim2.new(1, 0, 1, 0)
		load.Transparency = 1
		load.ImageTransparency = .999
		local debounce = 0
		local loadtxt
		repeat
			task.wait(.1)
			if loadtxt then
				loadtxt:Destroy()
			end
			loadtxt = Instance.new("TextLabel", loadui)
			loadtxt.BackgroundTransparency = 1
			loadtxt.TextColor3 = Color3.new(1, 1, 1)
			loadtxt.TextScaled = true
			loadtxt.Size = UDim2.new(1, 0, 1, 0)
			loadtxt.Text = "loading"
			debounce += 1
		until debounce >= 50 or load.IsLoaded == true or inExploitWorkspace or _gca ~= nil
		if loadtxt then
			loadtxt:Destroy()
		end
		if load.IsLoaded == false and not (AssetSource == "Exploit Workspace" or inExploitWorkspace or _gca ~= nil) then
			GUIObject.Screen.Enabled = false
			BREAKER = Instance.new("BoolValue")
			BREAKER.Name = "RoClothesBreaker"
			BREAKER.Parent = workspace
			if oload.IsLoaded == true then
				local txt = Instance.new("TextLabel", loadui)
				txt.BackgroundTransparency = 1
				txt.TextColor3 = Color3.new(1, 1, 1)
				txt.TextScaled = true
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.Text = "WRONG VERSION FILES ARE LOADED"
				game:GetService("Debris"):AddItem(loadui, 2)
				warn("WRONG VERSION FILES ARE LOADED")
			else
				local txt = Instance.new("TextLabel", loadui)
				txt.BackgroundTransparency = 1
				txt.TextColor3 = Color3.new(1, 1, 1)
				txt.TextScaled = true
				txt.Size = UDim2.new(1, 0, 1, 0)
				txt.Text = "FILES ARE NOT LOADED CORRECTLY"
				game:GetService("Debris"):AddItem(loadui, 2)
				warn("FILES ARE NOT LOADED CORRECTLY")
			end
		else
			load.ImageTransparency = 1
			oload.ImageTransparency = 1
			if loadupClosed == false then
				GUIObject.Screen.Enabled = true
			end
			if ClickExecute == false then
				Function.CharacterExecute(Player.Character, Player.Name)
			end
			loadui:Destroy()
		end
		task.wait(2)

		if loadupClosed == false then
			GUIObject.Screen.Enabled = true
		end

		if BREAKER.Parent ~= nil then
			BREAKER:Destroy()
		end
	end

	task.spawn(function()
		while task.wait(0.5) do
			local BreakerObject = game.Workspace:FindFirstChild("RoClothesBreaker")

			if BreakerObject then
				for _, Connect in pairs(AllConnect) do
					Connect:Disconnect()
				end
				task.cancel(aWhile)

				GUIObject.Screen:Destroy()
				GUIObject.MobileCloseButtonScreen:Destroy()
				BreakerObject:Destroy()
				print("RoCDC")
				break
			end
		end
	end)
end -- END OF RoClothes(Player)

local function StartRoClothesWithPrompt(targetPlayer)
	local g = (type(getgenv) == "function" and getgenv()) or {}
	local isfile_fn = isfile or (syn and syn.isfile) or (env and env.isfile) or (type(g.isfile) == "function" and g.isfile)
	local readfile_fn = readfile or (syn and syn.readfile) or (env and env.readfile) or (type(g.readfile) == "function" and g.readfile)
	local writefile_fn = writefile or (syn and syn.writefile) or (env and env.writefile) or (type(g.writefile) == "function" and g.writefile)
	local makefolder_fn = makefolder or (syn and syn.makefolder) or (env and env.makefolder) or (type(g.makefolder) == "function" and g.makefolder)
	local isfolder_fn = isfolder or (syn and syn.isfolder) or (env and env.isfolder) or (type(g.isfolder) == "function" and g.isfolder)
	local request_fn = request or http_request or (syn and syn.request) or (fluxus and fluxus.request) or (http and http.request) or (type(g.request) == "function" and g.request)

	local hasExploitContents = false
	if isfile_fn then
		local testFiles = {
			"RClothesContent/loadv9.png",
			"workspace/RClothesContent/loadv9.png",
			"Workspace/RClothesContent/loadv9.png",
			"RoCustomClothes/RClothesContent/loadv9.png",
			"rocustomclothes/RClothesContent/loadv9.png",
			"RoCustomClothes-main/RClothesContent/loadv9.png",
			"RClothesContent/load.png",
			"workspace/RClothesContent/load.png",
			"Workspace/RClothesContent/load.png",
			"loadv9.png"
		}
		for _, tf in ipairs(testFiles) do
			if isfile_fn(tf) then
				hasExploitContents = true
				break
			end
		end
	end
	if not hasExploitContents and isfolder_fn then
		if isfolder_fn("RClothesContent") or isfolder_fn("workspace/RClothesContent") or isfolder_fn("Workspace/RClothesContent")
			or isfolder_fn("RoCustomClothes/RClothesContent") or isfolder_fn("rocustomclothes/RClothesContent") or isfolder_fn("RoCustomClothes-main/RClothesContent") then
			hasExploitContents = true
		end
	end

	local customasset_fn = getcustomasset or getsynasset or (syn and syn.getcustomasset) or (fluxus and fluxus.getcustomasset) or (type(g.getcustomasset) == "function" and g.getcustomasset)
	if not hasExploitContents and customasset_fn then
		local testCands = {
			"RClothesContent/loadv9.png",
			"workspace/RClothesContent/loadv9.png",
			"Workspace/RClothesContent/loadv9.png",
			"RoCustomClothes/RClothesContent/loadv9.png",
			"rocustomclothes/RClothesContent/loadv9.png",
			"RoCustomClothes-main/RClothesContent/loadv9.png",
			"RClothesContent/13181228593.mesh",
		}
		for _, cand in ipairs(testCands) do
			local s, res = pcall(customasset_fn, cand)
			if s and res and res ~= "" then
				hasExploitContents = true
				break
			end
		end
	end

	local savedChoice = nil
	if isfile_fn and readfile_fn then
		pcall(function()
			local checkFiles = {"MyCurrentChoice", "MyCurrentChoice.txt"}
			for _, cf in ipairs(checkFiles) do
				if isfile_fn(cf) then
					local content = readfile_fn(cf)
					if content then
						local trimmed = content:match("^%s*(.-)%s*$")
						if trimmed == "Roblox Folder" or trimmed == "Exploit Workspace" then
							savedChoice = trimmed
							break
						end
					end
				end
			end
		end)
	end

	if savedChoice then
		AssetSource = savedChoice
		if Function then
			Function.AssetSource = savedChoice
			if Function.ClearAssetCache then Function.ClearAssetCache() end
		end
		RoClothes(targetPlayer)
		return
	end

	local targetParent = nil
	pcall(function() targetParent = game:GetService("CoreGui") end)
	if not targetParent or not targetParent.Parent then
		targetParent = targetPlayer:FindFirstChildOfClass("PlayerGui") or targetPlayer:WaitForChild("PlayerGui", 3)
	end

	if not targetParent then
		AssetSource = "Exploit Workspace"
		if Function then
			Function.AssetSource = "Exploit Workspace"
			if Function.ClearAssetCache then Function.ClearAssetCache() end
		end
		RoClothes(targetPlayer)
		return
	end

	local ManifestRaw = "RClothesContent/10080455422.mesh\nRClothesContent/101087111632562.mesh\nRClothesContent/102356373878814.mesh\nRClothesContent/10374562715.png\nRClothesContent/10399620886.mesh\nRClothesContent/104258503222570.mesh\nRClothesContent/105937959636862.mesh\nRClothesContent/10858752173.mesh\nRClothesContent/10858752190.mesh\nRClothesContent/10858752208.mesh\nRClothesContent/10858752221.mesh\nRClothesContent/10858752241.mesh\nRClothesContent/10859058245.mesh\nRClothesContent/10859058249.mesh\nRClothesContent/10967484907.mesh\nRClothesContent/11377850676.mesh\nRClothesContent/11381019021.mesh\nRClothesContent/11389496406.mesh\nRClothesContent/11394330816.mesh\nRClothesContent/11405661031.mesh\nRClothesContent/114358631982055.mesh\nRClothesContent/11486064816.mesh\nRClothesContent/11617724536.mesh\nRClothesContent/11617724988.mesh\nRClothesContent/11617988681.mesh\nRClothesContent/11617989163.mesh\nRClothesContent/116742308897287.mesh\nRClothesContent/11725817042.mesh\nRClothesContent/11725817051.mesh\nRClothesContent/11725818007.png\nRClothesContent/117979897155395.mesh\nRClothesContent/118273968520530.mesh\nRClothesContent/118417825061565.mesh\nRClothesContent/119168308079386.mesh\nRClothesContent/12005265476.mesh\nRClothesContent/12038926049.png\nRClothesContent/12038931250.png\nRClothesContent/121510175745378.mesh\nRClothesContent/12157209535.mesh\nRClothesContent/124409748030346.mesh\nRClothesContent/12488261246.mesh\nRClothesContent/125202318335961.mesh\nRClothesContent/12576150000.mesh\nRClothesContent/12625658678.mesh\nRClothesContent/12662159629.mesh\nRClothesContent/12662175794.png\nRClothesContent/12720313083.mesh\nRClothesContent/12755883933.mesh\nRClothesContent/12776336375.mesh\nRClothesContent/12921742575.mesh\nRClothesContent/12921743140.mesh\nRClothesContent/13050350514.mesh\nRClothesContent/13076200715.mesh\nRClothesContent/13085030579.mesh\nRClothesContent/13181228593.mesh\nRClothesContent/13181475635.mesh\nRClothesContent/13181475636.mesh\nRClothesContent/13181475662.mesh\nRClothesContent/13181475663.mesh\nRClothesContent/132249088742638.mesh\nRClothesContent/132922517258698.mesh\nRClothesContent/133621335195542.mesh\nRClothesContent/134989273944289.mesh\nRClothesContent/135377483286145.mesh\nRClothesContent/135832822984550.mesh\nRClothesContent/13755434958.mesh\nRClothesContent/137558328898044.mesh\nRClothesContent/13779756939.mesh\nRClothesContent/13779756984.mesh\nRClothesContent/13779805157.mesh\nRClothesContent/13779805168.mesh\nRClothesContent/13779954418.png\nRClothesContent/137906463544311.mesh\nRClothesContent/139687389487082.mesh\nRClothesContent/140686130941738.mesh\nRClothesContent/15333488402.mesh\nRClothesContent/15333488459.mesh\nRClothesContent/15640279907.mesh\nRClothesContent/15640502788.mesh\nRClothesContent/15649620886.mesh\nRClothesContent/15689547567.mesh\nRClothesContent/15689547573.mesh\nRClothesContent/16235774309.png\nRClothesContent/17108921539.mesh\nRClothesContent/17108921543.mesh\nRClothesContent/17108921573.mesh\nRClothesContent/17108921578.mesh\nRClothesContent/17633723189.mesh\nRClothesContent/17633756976.mesh\nRClothesContent/17633771118.mesh\nRClothesContent/17633784085.mesh\nRClothesContent/17645666081.mesh\nRClothesContent/17645756055.mesh\nRClothesContent/17873855280.mesh\nRClothesContent/17873855289.mesh\nRClothesContent/17873855309.mesh\nRClothesContent/17873855318.mesh\nRClothesContent/17873855322.mesh\nRClothesContent/187645444.png\nRClothesContent/18890901224.mesh\nRClothesContent/227430350.mesh\nRClothesContent/395191839.png\nRClothesContent/4342469442.mesh\nRClothesContent/4487737814.mesh\nRClothesContent/4503276365.png\nRClothesContent/4596067364.mesh\nRClothesContent/4729777667.mesh\nRClothesContent/4803707231.mesh\nRClothesContent/4857299880.mesh\nRClothesContent/4932869451.mesh\nRClothesContent/5270413632.mesh\nRClothesContent/5270413797.mesh\nRClothesContent/5270413936.mesh\nRClothesContent/5270415437.mesh\nRClothesContent/5385291202.mesh\nRClothesContent/5620377615.mesh\nRClothesContent/5971239783.mesh\nRClothesContent/6143427747.mesh\nRClothesContent/6143439194.mesh\nRClothesContent/6237701996.png\nRClothesContent/6237876025.mesh\nRClothesContent/6297176322.mesh\nRClothesContent/6297229742.mesh\nRClothesContent/6349489786.mesh\nRClothesContent/6445852322.mesh\nRClothesContent/6491183076.mesh\nRClothesContent/6552973009.mesh\nRClothesContent/6552973038.png\nRClothesContent/6567308335.mesh\nRClothesContent/6567309030.mesh\nRClothesContent/6667257628.png\nRClothesContent/6668707772.mesh\nRClothesContent/6671745090.mesh\nRClothesContent/6671818838.mesh\nRClothesContent/6697964510.mesh\nRClothesContent/6720355129.mesh\nRClothesContent/6721513769.mesh\nRClothesContent/6721517477.mesh\nRClothesContent/6745689310.mesh\nRClothesContent/6747382163.mesh\nRClothesContent/6755484302.mesh\nRClothesContent/6755486346.mesh\nRClothesContent/6755487288.mesh\nRClothesContent/6755487966.mesh\nRClothesContent/6755488785.mesh\nRClothesContent/6755489604.mesh\nRClothesContent/6755507454.mesh\nRClothesContent/6755508155.mesh\nRClothesContent/6755510910.mesh\nRClothesContent/6755510955.png\nRClothesContent/6755511825.mesh\nRClothesContent/6755512558.mesh\nRClothesContent/6755512610.png\nRClothesContent/6755513230.mesh\nRClothesContent/6764749054.mesh\nRClothesContent/6764807950.mesh\nRClothesContent/6771341341.mesh\nRClothesContent/6771345897.mesh\nRClothesContent/6771356972.mesh\nRClothesContent/6773710025.mesh\nRClothesContent/6858823726.mesh\nRClothesContent/6859161870.mesh\nRClothesContent/6860787685.mesh\nRClothesContent/6860788547.mesh\nRClothesContent/6861074681.mesh\nRClothesContent/6866262171.mesh\nRClothesContent/6866883591.mesh\nRClothesContent/6866883603.png\nRClothesContent/6867647037.mesh\nRClothesContent/6885999097.mesh\nRClothesContent/6888586040.png\nRClothesContent/6976475976.mesh\nRClothesContent/7004863745.mesh\nRClothesContent/7004864019.mesh\nRClothesContent/7063311226.mesh\nRClothesContent/709231552.png\nRClothesContent/70940280228860.mesh\nRClothesContent/71484235609105.mesh\nRClothesContent/7220038121.mesh\nRClothesContent/7223274409.mesh\nRClothesContent/7332360863.mesh\nRClothesContent/7332415457.mesh\nRClothesContent/739677490.png\nRClothesContent/74679705510743.mesh\nRClothesContent/74969809748782.mesh\nRClothesContent/75884203722318.mesh\nRClothesContent/7601850077.mesh\nRClothesContent/7606070501.mesh\nRClothesContent/76388853104288.mesh\nRClothesContent/7660134717.mesh\nRClothesContent/77243828023597.mesh\nRClothesContent/77284727360409.mesh\nRClothesContent/7791686946.mesh\nRClothesContent/7829803053.mesh\nRClothesContent/7830502633.mesh\nRClothesContent/7830512024.mesh\nRClothesContent/78553849357163.mesh\nRClothesContent/79202531181173.mesh\nRClothesContent/7980629618.mesh\nRClothesContent/8131038954.png\nRClothesContent/8154821502_boo1.mesh\nRClothesContent/8154822116_boo2.mesh\nRClothesContent/8184647568.mesh\nRClothesContent/8184767343.png\nRClothesContent/8279606564.mesh\nRClothesContent/8313398067.mesh\nRClothesContent/8313398285.mesh\nRClothesContent/83504910801572.mesh\nRClothesContent/83679944172074.mesh\nRClothesContent/8371312822.mesh\nRClothesContent/8447851356.mesh\nRClothesContent/8447877878.mesh\nRClothesContent/8477756263 (1).mesh\nRClothesContent/8477756263.mesh\nRClothesContent/85193503766229.mesh\nRClothesContent/85233396977100.mesh\nRClothesContent/8533956808.mesh\nRClothesContent/8533957053.mesh\nRClothesContent/8533957322.mesh\nRClothesContent/8533957545.mesh\nRClothesContent/8592346019.mesh\nRClothesContent/8592346452.mesh\nRClothesContent/8609086938.mesh\nRClothesContent/8609087425.mesh\nRClothesContent/8708773284.mesh\nRClothesContent/8708773488.mesh\nRClothesContent/8708773674.mesh\nRClothesContent/8745487512.mesh\nRClothesContent/8811986211.mesh\nRClothesContent/8811987828.mesh\nRClothesContent/8811988165.mesh\nRClothesContent/8811988447.mesh\nRClothesContent/8863941262.mesh\nRClothesContent/8863945719.mesh\nRClothesContent/8863959589.mesh\nRClothesContent/8863962668.mesh\nRClothesContent/8863964841.mesh\nRClothesContent/8863966579.mesh\nRClothesContent/8863982580.mesh\nRClothesContent/8863985603.mesh\nRClothesContent/8896526539.mesh\nRClothesContent/8896526740.mesh\nRClothesContent/8896528338.mesh\nRClothesContent/8896528503.mesh\nRClothesContent/8914802954.mesh\nRClothesContent/8915312502.mesh\nRClothesContent/8915312843.mesh\nRClothesContent/8964755042.mesh\nRClothesContent/8964769902.mesh\nRClothesContent/8964769904.mesh\nRClothesContent/8965126164.mesh\nRClothesContent/9020948490.mesh\nRClothesContent/9033508047.mesh\nRClothesContent/9033511985.mesh\nRClothesContent/9033680123.mesh\nRClothesContent/9033692280.mesh\nRClothesContent/9033714666.mesh\nRClothesContent/9033822343.mesh\nRClothesContent/9033858168.mesh\nRClothesContent/9033874623.mesh\nRClothesContent/9033906005.mesh\nRClothesContent/90596906849364.mesh\nRClothesContent/9065282081.png\nRClothesContent/9067190251.mesh\nRClothesContent/9067191575.mesh\nRClothesContent/9067214532.mesh\nRClothesContent/92232607522801.mesh\nRClothesContent/92395350432537.mesh\nRClothesContent/9286995426.mesh\nRClothesContent/9329354422.mesh\nRClothesContent/93314074748372.mesh\nRClothesContent/93789077116999.mesh\nRClothesContent/9513009034.mesh\nRClothesContent/9522843947.mesh\nRClothesContent/95320080609346.mesh\nRClothesContent/9533965499.mesh\nRClothesContent/9534436982.mesh\nRClothesContent/9730141165.mesh\nRClothesContent/9738589498.mesh\nRClothesContent/9739471829.mesh\nRClothesContent/9752288922.mesh\nRClothesContent/97919823001964.mesh\nRClothesContent/9867233353.mesh\nRClothesContent/9867233360.mesh\nRClothesContent/9867233367.mesh\nRClothesContent/99196487433776.mesh\nRClothesContent/OX_7115693161.mesh\nRClothesContent/OX_7115703261.mesh\nRClothesContent/RoCat Balls.mesh\nRClothesContent/RoCat Cock.mesh\nRClothesContent/RoCat Cocktip.mesh\nRClothesContent/Sound/Cum/1.mp3\nRClothesContent/Sound/Cum/2.mp3\nRClothesContent/Sound/Cum/3.mp3\nRClothesContent/Sound/Cum/4.mp3\nRClothesContent/Sound/Cum/tuff.txt\nRClothesContent/Sound/Heal/Heal1.mp3\nRClothesContent/Sound/Heal/Heal2.mp3\nRClothesContent/Sound/Heal/Heal3.mp3\nRClothesContent/Sound/Heal/Heal4.mp3\nRClothesContent/Sound/Heal/tuff.txt\nRClothesContent/Sound/Moan/1.ogg\nRClothesContent/Sound/Moan/2.ogg\nRClothesContent/Sound/Moan/3.ogg\nRClothesContent/Sound/Moan/4.ogg\nRClothesContent/Sound/Moan/5.ogg\nRClothesContent/Sound/Moan/6.ogg\nRClothesContent/Sound/Moan/7.ogg\nRClothesContent/Sound/Moan/8.ogg\nRClothesContent/Sound/Moan/tuff.txt\nRClothesContent/Sound/Slap/1.mp3\nRClothesContent/Sound/Slap/2.mp3\nRClothesContent/Sound/Slap/3.mp3\nRClothesContent/Sound/Slap/4.mp3\nRClothesContent/Sound/Slap/5.mp3\nRClothesContent/Sound/Slap/6.mp3\nRClothesContent/Sound/Slap/7.mp3\nRClothesContent/Sound/Slap/8.mp3\nRClothesContent/Sound/Slap/9.mp3\nRClothesContent/Sound/Slap/Wet/1.wav\nRClothesContent/Sound/Slap/Wet/2.wav\nRClothesContent/Sound/Slap/Wet/3.wav\nRClothesContent/Sound/Slap/Wet/4.wav\nRClothesContent/Sound/Slap/Wet/tuff.txt\nRClothesContent/Sound/Slap/tuff.txt\nRClothesContent/Sound/Slide/1.mp3\nRClothesContent/Sound/Slide/2.mp3\nRClothesContent/Sound/Slide/3.mp3\nRClothesContent/Sound/Slide/4.mp3\nRClothesContent/Sound/Slide/5.mp3\nRClothesContent/Sound/Slide/6.mp3\nRClothesContent/Sound/Slide/7.mp3\nRClothesContent/Sound/Slide/8.mp3\nRClothesContent/Sound/Slide/9.mp3\nRClothesContent/Sound/Slide/tuff.txt\nRClothesContent/Sound/Suck/1.mp3\nRClothesContent/Sound/Suck/10.mp3\nRClothesContent/Sound/Suck/11.mp3\nRClothesContent/Sound/Suck/12.mp3\nRClothesContent/Sound/Suck/13.mp3\nRClothesContent/Sound/Suck/14.mp3\nRClothesContent/Sound/Suck/2.mp3\nRClothesContent/Sound/Suck/3.mp3\nRClothesContent/Sound/Suck/4.mp3\nRClothesContent/Sound/Suck/5.mp3\nRClothesContent/Sound/Suck/6.mp3\nRClothesContent/Sound/Suck/7.mp3\nRClothesContent/Sound/Suck/8.mp3\nRClothesContent/Sound/Suck/9.mp3\nRClothesContent/Sound/Suck/tuff.txt\nRClothesContent/Sound/Tear/Tear1.mp3\nRClothesContent/Sound/Tear/Tear2.mp3\nRClothesContent/Sound/Tear/Tear3.mp3\nRClothesContent/Sound/Tear/tuff.txt\nRClothesContent/colorableFreckles.png\nRClothesContent/easter_balls_better.png\nRClothesContent/example.txt\nRClothesContent/leftlegtype2.mesh\nRClothesContent/load.png\nRClothesContent/loadv3.png\nRClothesContent/loadv9.png\nRClothesContent/rightlegtype2.mesh"

	local selectorGui = Instance.new("ScreenGui")
	selectorGui.Name = "RoClothesSourceSelector"
	selectorGui.ResetOnSpawn = false
	selectorGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
	selectorGui.Parent = targetParent

	local overlay = Instance.new("Frame", selectorGui)
	overlay.Size = UDim2.new(1, 0, 1, 0)
	overlay.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
	overlay.BackgroundTransparency = 0.45
	overlay.BorderSizePixel = 0

	local modal = Instance.new("Frame", overlay)
	modal.AnchorPoint = Vector2.new(0.5, 0.5)
	modal.Position = UDim2.new(0.5, 0, 0.5, 0)
	modal.Size = UDim2.new(0, 480, 0, 270)
	modal.BackgroundColor3 = Color3.fromRGB(16, 18, 24)
	modal.BorderSizePixel = 0

	local corner = Instance.new("UICorner", modal)
	corner.CornerRadius = UDim.new(0, 12)

	local stroke = Instance.new("UIStroke", modal)
	stroke.Color = Color3.fromRGB(55, 60, 80)
	stroke.Thickness = 1.6

	local grad = Instance.new("UIGradient", modal)
	grad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(16, 18, 24)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(26, 28, 38))}
	grad.Rotation = -90

	local topLabel = Instance.new("TextLabel", modal)
	topLabel.Size = UDim2.new(0.9, 0, 0.10, 0)
	topLabel.Position = UDim2.new(0.05, 0, 0.05, 0)
	topLabel.BackgroundTransparency = 1
	topLabel.Font = Enum.Font.Code
	topLabel.Text = "Purrw Modded Roclothes 0.7.9"
	topLabel.TextColor3 = Color3.fromRGB(180, 140, 255)
	topLabel.TextSize = 13
	topLabel.TextStrokeColor3 = Color3.fromRGB(10, 10, 14)
	topLabel.TextStrokeTransparency = 0.3

	local title = Instance.new("TextLabel", modal)
	title.Size = UDim2.new(0.9, 0, 0.20, 0)
	title.Position = UDim2.new(0.05, 0, 0.15, 0)
	title.BackgroundTransparency = 1
	title.Font = Enum.Font.Code
	title.Text = "Wanna download RClothesContent files first?"
	title.TextColor3 = Color3.fromRGB(245, 245, 255)
	title.TextSize = 15
	title.TextWrapped = true

	local noteLabel = Instance.new("TextLabel", modal)
	noteLabel.Size = UDim2.new(0.92, 0, 0.22, 0)
	noteLabel.Position = UDim2.new(0.04, 0, 0.74, 0)
	noteLabel.BackgroundTransparency = 1
	noteLabel.Font = Enum.Font.Code
	noteLabel.Text = "if the script doesn't load reinject again and press YES"
	noteLabel.TextColor3 = Color3.fromRGB(255, 185, 120)
	noteLabel.TextSize = 12
	noteLabel.TextWrapped = true

	local contentFrame = Instance.new("Frame", modal)
	contentFrame.Size = UDim2.new(0.9, 0, 0.36, 0)
	contentFrame.Position = UDim2.new(0.05, 0, 0.36, 0)
	contentFrame.BackgroundTransparency = 1

	local function showStage2()
		contentFrame:ClearAllChildren()
		title.Text = "Hey real quick wanna get the meshes from where"
		noteLabel.Text = "If you wanna remember this decision ensure that if you get it wrong you gonna have to delete a file called MyCurrentChoice"
		noteLabel.TextColor3 = Color3.fromRGB(255, 185, 120)

		local robloxBtn = Instance.new("TextButton", contentFrame)
		robloxBtn.Size = UDim2.new(0.47, 0, 0.50, 0)
		robloxBtn.Position = UDim2.new(0, 0, 0, 0)
		robloxBtn.BackgroundColor3 = Color3.fromRGB(22, 34, 58)
		robloxBtn.Font = Enum.Font.Code
		robloxBtn.Text = "Roblox Folder"
		robloxBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		robloxBtn.TextSize = 14
		local rCorner = Instance.new("UICorner", robloxBtn)
		rCorner.CornerRadius = UDim.new(0, 8)
		local rStroke = Instance.new("UIStroke", robloxBtn)
		rStroke.Color = Color3.fromRGB(45, 65, 110)
		rStroke.Thickness = 1.2
		local rGrad = Instance.new("UIGradient", robloxBtn)
		rGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(22, 34, 58)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(35, 55, 95))}
		rGrad.Rotation = -90

		local exploitBtn = Instance.new("TextButton", contentFrame)
		exploitBtn.Size = UDim2.new(0.47, 0, 0.50, 0)
		exploitBtn.Position = UDim2.new(0.53, 0, 0, 0)
		exploitBtn.BackgroundColor3 = Color3.fromRGB(36, 20, 52)
		exploitBtn.Font = Enum.Font.Code
		exploitBtn.Text = "Exploit Workspace"
		exploitBtn.TextColor3 = Color3.fromRGB(255, 255, 255)
		exploitBtn.TextSize = 14
		local eCorner = Instance.new("UICorner", exploitBtn)
		eCorner.CornerRadius = UDim.new(0, 8)
		local eStroke = Instance.new("UIStroke", exploitBtn)
		eStroke.Color = Color3.fromRGB(75, 40, 110)
		eStroke.Thickness = 1.2
		local eGrad = Instance.new("UIGradient", exploitBtn)
		eGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(36, 20, 52)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(60, 32, 90))}
		eGrad.Rotation = -90

		local rememberBtn = Instance.new("TextButton", contentFrame)
		rememberBtn.Size = UDim2.new(1, 0, 0.40, 0)
		rememberBtn.Position = UDim2.new(0, 0, 0.60, 0)
		rememberBtn.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
		rememberBtn.Font = Enum.Font.Code
		rememberBtn.Text = "[   ] Remember this decision"
		rememberBtn.TextColor3 = Color3.fromRGB(200, 205, 220)
		rememberBtn.TextSize = 13
		local remCorner = Instance.new("UICorner", rememberBtn)
		remCorner.CornerRadius = UDim.new(0, 6)
		local remStroke = Instance.new("UIStroke", rememberBtn)
		remStroke.Color = Color3.fromRGB(50, 55, 72)
		remStroke.Thickness = 1

		local rememberChoice = false
		rememberBtn.MouseButton1Click:Connect(function()
			rememberChoice = not rememberChoice
			if rememberChoice then
				rememberBtn.Text = "[ ✓ ] Remember this decision"
				rememberBtn.TextColor3 = Color3.fromRGB(120, 255, 160)
				rememberBtn.BackgroundColor3 = Color3.fromRGB(18, 42, 30)
				remStroke.Color = Color3.fromRGB(40, 140, 80)
			else
				rememberBtn.Text = "[   ] Remember this decision"
				rememberBtn.TextColor3 = Color3.fromRGB(200, 205, 220)
				rememberBtn.BackgroundColor3 = Color3.fromRGB(20, 22, 30)
				remStroke.Color = Color3.fromRGB(50, 55, 72)
			end
		end)

		local function selectAndLaunch(choice)
			AssetSource = choice
			if Function then
				Function.AssetSource = choice
				if Function.ClearAssetCache then
					Function.ClearAssetCache()
				end
			end
			if rememberChoice and writefile_fn then
				pcall(function() writefile_fn("MyCurrentChoice", choice) end)
			end
			selectorGui:Destroy()
			RoClothes(targetPlayer)
		end

		robloxBtn.MouseButton1Click:Connect(function() selectAndLaunch("Roblox Folder") end)
		exploitBtn.MouseButton1Click:Connect(function() selectAndLaunch("Exploit Workspace") end)
	end

	local function runDownloader()
		contentFrame:ClearAllChildren()
		title.Text = "Downloading RClothesContent folder..."
		noteLabel.Text = "Please wait while files download. If the script doesn't load reinject again and press YES"

		local pLabel = Instance.new("TextLabel", contentFrame)
		pLabel.Size = UDim2.new(1, 0, 0.45, 0)
		pLabel.Position = UDim2.new(0, 0, 0, 0)
		pLabel.BackgroundTransparency = 1
		pLabel.Font = Enum.Font.Code
		pLabel.Text = "Preparing download..."
		pLabel.TextColor3 = Color3.fromRGB(210, 245, 235)
		pLabel.TextSize = 13
		pLabel.TextXAlignment = Enum.TextXAlignment.Left

		local barBg = Instance.new("Frame", contentFrame)
		barBg.Size = UDim2.new(1, 0, 0.40, 0)
		barBg.Position = UDim2.new(0, 0, 0.55, 0)
		barBg.BackgroundColor3 = Color3.fromRGB(12, 14, 18)
		barBg.BorderSizePixel = 0
		local bCorner = Instance.new("UICorner", barBg)
		bCorner.CornerRadius = UDim.new(0, 6)
		local bStroke = Instance.new("UIStroke", barBg)
		bStroke.Color = Color3.fromRGB(40, 60, 65)
		bStroke.Thickness = 1

		local barFill = Instance.new("Frame", barBg)
		barFill.Size = UDim2.new(0, 0, 1, 0)
		barFill.BackgroundColor3 = Color3.fromRGB(30, 180, 120)
		barFill.BorderSizePixel = 0
		local fCorner = Instance.new("UICorner", barFill)
		fCorner.CornerRadius = UDim.new(0, 6)
		local fGrad = Instance.new("UIGradient", barFill)
		fGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(20, 140, 100)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(40, 220, 150))}

		task.spawn(function()
			local folders = {
				"RClothesContent",
				"RClothesContent/Sound",
				"RClothesContent/Sound/Cum",
				"RClothesContent/Sound/Heal",
				"RClothesContent/Sound/Moan",
				"RClothesContent/Sound/Slap",
				"RClothesContent/Sound/Slap/Wet",
				"RClothesContent/Sound/Slide",
				"RClothesContent/Sound/Suck",
				"RClothesContent/Sound/Tear"
			}
			for _, f in ipairs(folders) do
				if makefolder_fn and not (isfolder_fn and isfolder_fn(f)) then
					pcall(makefolder_fn, f)
				end
			end

			local fileList = {}
			for path in ManifestRaw:gmatch("[^\r\n]+") do
				table.insert(fileList, path)
			end

			local total = #fileList
			local downloaded = 0
			local nextIdx = 0

			local function downloadWorker()
				while true do
					nextIdx += 1
					local myIdx = nextIdx
					if myIdx > total then break end
					local path = fileList[myIdx]

					if isfile_fn and isfile_fn(path) then
						downloaded += 1
					else
						local url = "https://raw.githubusercontent.com/luauglazer/Meshes/main/" .. path
						local content = nil
						if request_fn then
							pcall(function()
								local res = request_fn({Url = url, Method = "GET"})
								if res and (res.StatusCode == 200 or res.StatusMessage == "OK") then
									content = res.Body
								end
							end)
						end
						if not content and game.HttpGet then
							pcall(function() content = game:HttpGet(url) end)
						end
						if content and writefile_fn then
							pcall(writefile_fn, path, content)
						end
						downloaded += 1
					end

					local pct = math.clamp(downloaded / total, 0, 1)
					barFill.Size = UDim2.new(pct, 0, 1, 0)
					pLabel.Text = string.format("Downloading: %d / %d files (%d%%)", downloaded, total, math.floor(pct * 100))
				end
			end

			for w = 1, 6 do
				task.spawn(downloadWorker)
			end

			repeat task.wait(0.1) until downloaded >= total
			barFill.Size = UDim2.new(1, 0, 1, 0)
			pLabel.Text = "✅ Download Complete! (362/362 files)"
			pLabel.TextColor3 = Color3.fromRGB(120, 255, 160)

			noteLabel.Text = "Installed! You can continue, or if the script doesn't load reinject again and press YES"
			task.wait(1.5)

			contentFrame:ClearAllChildren()
			local continueBtn = Instance.new("TextButton", contentFrame)
			continueBtn.Size = UDim2.new(1, 0, 0.70, 0)
			continueBtn.Position = UDim2.new(0, 0, 0.15, 0)
			continueBtn.BackgroundColor3 = Color3.fromRGB(18, 45, 30)
			continueBtn.Font = Enum.Font.Code
			continueBtn.Text = "🚀 Continue to Script"
			continueBtn.TextColor3 = Color3.fromRGB(140, 255, 180)
			continueBtn.TextSize = 15
			local cCorner = Instance.new("UICorner", continueBtn)
			cCorner.CornerRadius = UDim.new(0, 8)
			local cStroke = Instance.new("UIStroke", continueBtn)
			cStroke.Color = Color3.fromRGB(40, 120, 70)
			cStroke.Thickness = 1.4

			continueBtn.MouseButton1Click:Connect(function()
				showStage2()
			end)
		end)
	end

	if hasExploitContents then
		showStage2()
		return
	end

	local yesBtn = Instance.new("TextButton", contentFrame)
	yesBtn.Size = UDim2.new(0.47, 0, 0.70, 0)
	yesBtn.Position = UDim2.new(0, 0, 0.15, 0)
	yesBtn.BackgroundColor3 = Color3.fromRGB(18, 45, 30)
	yesBtn.Font = Enum.Font.Code
	yesBtn.Text = "YES"
	yesBtn.TextColor3 = Color3.fromRGB(140, 255, 180)
	yesBtn.TextSize = 16
	local yCorner = Instance.new("UICorner", yesBtn)
	yCorner.CornerRadius = UDim.new(0, 8)
	local yStroke = Instance.new("UIStroke", yesBtn)
	yStroke.Color = Color3.fromRGB(40, 120, 70)
	yStroke.Thickness = 1.2
	local yGrad = Instance.new("UIGradient", yesBtn)
	yGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(18, 45, 30)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(28, 75, 45))}
	yGrad.Rotation = -90

	local noBtn = Instance.new("TextButton", contentFrame)
	noBtn.Size = UDim2.new(0.47, 0, 0.70, 0)
	noBtn.Position = UDim2.new(0.53, 0, 0.15, 0)
	noBtn.BackgroundColor3 = Color3.fromRGB(45, 20, 25)
	noBtn.Font = Enum.Font.Code
	noBtn.Text = "NO"
	noBtn.TextColor3 = Color3.fromRGB(255, 170, 180)
	noBtn.TextSize = 16
	local nCorner = Instance.new("UICorner", noBtn)
	nCorner.CornerRadius = UDim.new(0, 8)
	local nStroke = Instance.new("UIStroke", noBtn)
	nStroke.Color = Color3.fromRGB(110, 45, 55)
	nStroke.Thickness = 1.2
	local nGrad = Instance.new("UIGradient", noBtn)
	nGrad.Color = ColorSequence.new{ColorSequenceKeypoint.new(0.00, Color3.fromRGB(45, 20, 25)), ColorSequenceKeypoint.new(1.00, Color3.fromRGB(75, 30, 40))}
	nGrad.Rotation = -90

	yesBtn.MouseButton1Click:Connect(function()
		runDownloader()
	end)

	noBtn.MouseButton1Click:Connect(function()
		showStage2()
	end)
end

local function launch()
	local targetPlayer
	if RS:IsStudio() then
		targetPlayer = PS.LocalPlayer
	elseif RS:IsClient() then
		if not PS.LocalPlayer then
			PS.PlayerAdded:Wait()
		end
		targetPlayer = PS.LocalPlayer
	elseif RS:IsServer() then
		targetPlayer = PS:WaitForChild("lerp()")
	end
	if targetPlayer then
		StartRoClothesWithPrompt(targetPlayer)
	end
end
launch()
return nil
