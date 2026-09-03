--[[	

	/ ＲＯＣＬＯＴＨＥＳ I M P R O V E D BY PURRW
	Version - 0.7.9 Improved
	The real Mod's Discord - discord.gg/k2HbJMY6Fr
	Unknowing's Discord - discord.gg/HBzvWE6Rp3
	
	| This script require the installation of RClothesContent which can be pulled from this repository or just downloaded inside of the script itself
	
	| RoClothes is a Client-Sided Exploiting Script, that allows the player to have nude BodyParts/Clothes
	Can be used on any executor
	
	| This script WILL cause FPS drops, because of BodyParts/Clothes meshes inside the Player model
	
	| 𝐔𝐒𝐄 𝐀𝐓 𝐘𝐎𝐔𝐑 𝐎𝐖𝐍 𝐑𝐈𝐒𝐊
	| 𝐖𝐎𝐑𝐊 𝐈𝐍 𝐏𝐑𝐎𝐆𝐑𝐄𝐒𝐒
	
	The original developer of RoClothes is no longer working on this script.
	This is a MODDED version of this script that might or might not be updated.
	If you know who the creator of this mod is, feel free to make requests or suggest some things.
	
	
	
	original version 0.7
	current version 0.7.9 Improved
		














	
	














]]



























local PS = game:GetService("Players")
local RS = game:GetService("RunService")
local HS = game:GetService("HttpService")

local AssetSource = nil -- Shared across RoClothes and selector prompt

function RoClothes(Player)
	print("RoC")

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

                                      ██╗░░░░░░█████╗░░█████╗░░█████╗░██╗░░░░░
                                      ██║░░░░░██╔══██╗██╔══██╗██╔══██╗██║░░░░░
                                      ██║░░░░░██║░░██║██║░░╚═╝███████║██║░░░░░
                                      ██║░░░░░██║░░██║██║░░██╗██╔══██║██║░░░░░
                                      ███████╗╚█████╔╝╚█████╔╝██║░░██║███████╗
                                      ╚══════╝░╚════╝░░╚════╝░╚═╝░░╚═╝╚══════╝
                                  
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

	local GUIObject = {}

	GUIObject.Screen = Instance.new("ScreenGui")
	GUIObject.MainFrame = Instance.new("TextButton")
	GUIObject.Dragger = Instance.new("UIDragDetector")
	GUIObject.PageFrame = Instance.new("Frame")
	GUIObject.UIGradient = Instance.new("UIGradient")
	GUIObject.UICorner = Instance.new("UICorner")
	GUIObject.Clothes_3 = Instance.new("Frame")
	GUIObject.ClothesSearch = Instance.new("TextBox")
	GUIObject.UIGradient_34 = Instance.new("UIGradient")
	GUIObject.UICorner_35 = Instance.new("UICorner")
	GUIObject.ClothesButtonFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout = Instance.new("UIGridLayout")
	GUIObject.Menu = Instance.new("Frame")
	GUIObject.DestroyFrame = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_2 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UIGradient_3 = Instance.new("UIGradient")
	GUIObject.UICorner_3 = Instance.new("UICorner")
	GUIObject.DestroyButton = Instance.new("TextButton")
	GUIObject.PlayerFrame = Instance.new("Frame")
	GUIObject.UIGradient_4 = Instance.new("UIGradient")
	GUIObject.UICorner_4 = Instance.new("UICorner")
	GUIObject.PlayerExecute = Instance.new("TextBox")
	GUIObject.BreastsTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_5 = Instance.new("UIGradient")
	GUIObject.UICorner_5 = Instance.new("UICorner")
	GUIObject.BreastsTypeButton = Instance.new("TextButton")
	GUIObject.BundleFrame = Instance.new("Frame")
	GUIObject.UIGradient_6 = Instance.new("UIGradient")
	GUIObject.UICorner_6 = Instance.new("UICorner")
	GUIObject.BundleText = Instance.new("TextLabel")
	GUIObject.BundleSearch = Instance.new("TextBox")
	GUIObject.UIGradient_A17 = Instance.new("UIGradient")
	GUIObject.UICorner_A17 = Instance.new("UICorner")
	GUIObject.DelayFrame = Instance.new("Frame")
	GUIObject.UIGradient_7 = Instance.new("UIGradient")
	GUIObject.UICorner_7 = Instance.new("UICorner")
	GUIObject.DelayTimeText = Instance.new("TextBox")
	GUIObject.AutoExecuteFrame = Instance.new("Frame")
	GUIObject.UICorner_8 = Instance.new("UICorner")
	GUIObject.UIGradient_8 = Instance.new("UIGradient")
	GUIObject.AutoExecuteButton = Instance.new("TextButton")
	GUIObject.BundleBodyColorFrame = Instance.new("Frame")
	GUIObject.UIGradient_15 = Instance.new("UIGradient")
	GUIObject.UICorner_15 = Instance.new("UICorner")
	GUIObject.BundleBodyColorButton = Instance.new("TextButton")
	GUIObject.ResetFrame = Instance.new("Frame")
	GUIObject.UICorner_9 = Instance.new("UICorner")
	GUIObject.UIGradient_9 = Instance.new("UIGradient")
	GUIObject.ResetButton = Instance.new("TextButton")
	GUIObject.ExecuteFrame = Instance.new("Frame")
	GUIObject.UICorner_10 = Instance.new("UICorner")
	GUIObject.UIGradient_10 = Instance.new("UIGradient")
	GUIObject.ExecuteButton = Instance.new("TextButton")
	GUIObject.ToneFrame = Instance.new("Frame")
	GUIObject.UIGradient_11 = Instance.new("UIGradient")
	GUIObject.UICorner_11 = Instance.new("UICorner")
	GUIObject.ToneButton = Instance.new("TextButton")
	GUIObject.Bundles = Instance.new("Frame")
	GUIObject.BundlesButtonFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout_2 = Instance.new("UIGridLayout")
	GUIObject.ButtonFrame = Instance.new("Frame")
	GUIObject.UIListLayout = Instance.new("UIListLayout")
	GUIObject.FaceFrame = Instance.new("Frame")
	GUIObject.UIGradient_17 = Instance.new("UIGradient")
	GUIObject.UICorner_17 = Instance.new("UICorner")
	GUIObject.FaceButton = Instance.new("TextButton")
	GUIObject.Menu_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_3 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_12 = Instance.new("UICorner")
	GUIObject.MenuButton = Instance.new("TextButton")
	GUIObject.UIGradient_12 = Instance.new("UIGradient")
	GUIObject.Clothes_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_4 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_13 = Instance.new("UICorner")
	GUIObject.ClothesButton = Instance.new("TextButton")
	GUIObject.UIGradient_13 = Instance.new("UIGradient")
	GUIObject.Bundles_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_5 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_14 = Instance.new("UICorner")
	GUIObject.BundlesButton = Instance.new("TextButton")
	GUIObject.UIGradient_14 = Instance.new("UIGradient")
	GUIObject.NameFrame = Instance.new("Frame")
	GUIObject.NameText = Instance.new("TextLabel")
	GUIObject.VersionText = Instance.new("TextLabel")
	GUIObject.KeybindFrame = Instance.new("Frame")
	GUIObject.UIGradient_16 = Instance.new("UIGradient")
	GUIObject.UICorner_16 = Instance.new("UICorner")
	GUIObject.KeybindButton = Instance.new("TextButton")
	GUIObject.RoClothes = Instance.new("ScreenGui")
	GUIObject.Menu2 = Instance.new("Frame")
	GUIObject.LocalTransparencyFrame = Instance.new("Frame")
	GUIObject.UIGradient_18 = Instance.new("UIGradient")
	GUIObject.UICorner_18 = Instance.new("UICorner")
	GUIObject.LocalTransparencyButton = Instance.new("TextBox")
	GUIObject.CharacterFrame = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_6 = Instance.new("UIAspectRatioConstraint")
	GUIObject.LeftArmButton = Instance.new("ImageButton")
	GUIObject.TorsoButton = Instance.new("ImageButton")
	GUIObject.RightArmButton = Instance.new("ImageButton")
	GUIObject.RightLegButton = Instance.new("ImageButton")
	GUIObject.LeftLegButton = Instance.new("ImageButton")
	GUIObject.HeadButton = Instance.new("ImageButton")
	GUIObject.UICorner_19 = Instance.new("UICorner")
	GUIObject.Menu2_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_7 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_20 = Instance.new("UICorner")
	GUIObject.Menu2Button = Instance.new("TextButton")
	GUIObject.UIGradient_19 = Instance.new("UIGradient")
	GUIObject.MeshSizeLockFrame = Instance.new("Frame")
	GUIObject.UIGradient_20 = Instance.new("UIGradient")
	GUIObject.UICorner_21 = Instance.new("UICorner")
	GUIObject.MeshSizeLockButton = Instance.new("TextButton")
	GUIObject.AccessorySizeLockFrame = Instance.new("Frame")
	GUIObject.UIGradient_21 = Instance.new("UIGradient")
	GUIObject.UICorner_22 = Instance.new("UICorner")
	GUIObject.AccessorySizeLockButton = Instance.new("TextButton")
	GUIObject.MeshBasePartInvisibleFrame = Instance.new("Frame")
	GUIObject.UIGradient_22 = Instance.new("UIGradient")
	GUIObject.UICorner_23 = Instance.new("UICorner")
	GUIObject.MeshBasePartInvisibleButton = Instance.new("TextButton")
	GUIObject.BodyPartPhysicsFrame = Instance.new("Frame")
	GUIObject.UIGradient_23 = Instance.new("UIGradient")
	GUIObject.UICorner_24 = Instance.new("UICorner")
	GUIObject.BodyPartPhysicsButton = Instance.new("TextButton")
	GUIObject.MethodFrame = Instance.new("Frame")
	GUIObject.UIGradient_24 = Instance.new("UIGradient")
	GUIObject.UICorner_25 = Instance.new("UICorner")
	GUIObject.MethodButton = Instance.new("TextButton")
	GUIObject.Edit_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_9 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_33 = Instance.new("UICorner")
	GUIObject.EditButton = Instance.new("TextButton")
	GUIObject.UIGradient_32 = Instance.new("UIGradient")
	GUIObject.Catalog_2 = Instance.new("Frame")
	GUIObject.UIAspectRatioConstraint_8 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_34 = Instance.new("UICorner")
	GUIObject.CatalogButton = Instance.new("TextButton")
	GUIObject.UIGradient_33 = Instance.new("UIGradient")
	GUIObject.Catalog_3 = Instance.new("Frame")
	GUIObject.UsernameFrame = Instance.new("Frame")
	GUIObject.UICorner_27 = Instance.new("UICorner")
	GUIObject.UsernameTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_26 = Instance.new("UIGradient")
	GUIObject.AccessoryFrame = Instance.new("Frame")
	GUIObject.UICorner_28 = Instance.new("UICorner")
	GUIObject.AccessoryTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_27 = Instance.new("UIGradient")
	GUIObject.ShirtFrame = Instance.new("Frame")
	GUIObject.UICorner_29 = Instance.new("UICorner")
	GUIObject.ShirtTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_28 = Instance.new("UIGradient")
	GUIObject.PantsFrame = Instance.new("Frame")
	GUIObject.UICorner_30 = Instance.new("UICorner")
	GUIObject.PantsTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_29 = Instance.new("UIGradient")
	GUIObject.ShirtGraphicFrame = Instance.new("Frame")
	GUIObject.UICorner_31 = Instance.new("UICorner")
	GUIObject.ShirtGraphicTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_30 = Instance.new("UIGradient")
	GUIObject.Edit = Instance.new("Frame")
	GUIObject.MeshNameFrame = Instance.new("Frame")
	GUIObject.UICorner_32 = Instance.new("UICorner")
	GUIObject.MeshNameTextbox = Instance.new("TextBox")
	GUIObject.UIGradient_31 = Instance.new("UIGradient")
	GUIObject.PropertyListFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout_4 = Instance.new("UIGridLayout")
	GUIObject.EditNote = Instance.new("TextLabel")
	GUIObject.CharacterPreviewFrame = Instance.new("Frame")
	GUIObject.ViewportFrame = Instance.new("ViewportFrame")
	GUIObject.ViewportCamera = Instance.new("Camera")
	GUIObject.PreviewUIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	GUIObject.PreviewButton = Instance.new("TextButton")
	GUIObject.ClickExecuteFrame = Instance.new("Frame")
	GUIObject.UIGradientCE = Instance.new("UIGradient")
	GUIObject.UICornerCE = Instance.new("UICorner")
	GUIObject.ClickExecuteButton = Instance.new("TextButton")
	GUIObject.PositionPhysicsMultiplyFrame = Instance.new("Frame")
	GUIObject.UICornerPPM = Instance.new("UICorner")
	GUIObject.PositionPhysicsMultiplyText = Instance.new("TextBox")
	GUIObject.UIGradientPPM = Instance.new("UIGradient")
	GUIObject.RotationPhysicsMultiplyFrame = Instance.new("Frame")
	GUIObject.UICornerRPM = Instance.new("UICorner")
	GUIObject.RotationPhysicsMultiplyText = Instance.new("TextBox")
	GUIObject.UIGradientRPM = Instance.new("UIGradient")
	GUIObject.MobileCloseButtonScreen = Instance.new("ScreenGui")
	GUIObject.MobileCloseButton = Instance.new("ImageButton")
	GUIObject.MCBUIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	GUIObject.SkinToneFrame = Instance.new("Frame")
	GUIObject.STUICorner = Instance.new("UICorner")
	GUIObject.SkinToneText = Instance.new("TextBox")
	GUIObject.STUIGradient = Instance.new("UIGradient")
	GUIObject.NippleColorFrame = Instance.new("Frame")
	GUIObject.NTUICorner = Instance.new("UICorner")
	GUIObject.NippleColorText = Instance.new("TextBox")
	GUIObject.NTUIGradient = Instance.new("UIGradient")

	GUIObject.Menu3_3 = Instance.new("Frame")
	GUIObject.M3UIAspectRatioConstraint = Instance.new("UIAspectRatioConstraint")
	GUIObject.M3UICorner = Instance.new("UICorner")
	GUIObject.M3UIGradient = Instance.new("UIGradient")
	GUIObject.Menu3Button = Instance.new("TextButton")

	GUIObject.Menu3 = Instance.new("Frame")
	GUIObject.BreastsScaleFrame = Instance.new("Frame")
	GUIObject.BS1UICorner = Instance.new("UICorner")
	GUIObject.BreastsScaleText = Instance.new("TextBox")
	GUIObject.BS1UIGradient = Instance.new("UIGradient")
	GUIObject.ButtsScaleFrame = Instance.new("Frame")
	GUIObject.BS2UICorner = Instance.new("UICorner")
	GUIObject.BS2UIGradient = Instance.new("UIGradient")
	GUIObject.ButtsScaleText = Instance.new("TextBox")
	GUIObject.LegsScaleFrame = Instance.new("Frame")
	GUIObject.BS3UICorner = Instance.new("UICorner")
	GUIObject.BS3UIGradient = Instance.new("UIGradient")
	GUIObject.LegsScaleText = Instance.new("TextBox")

	GUIObject.OutfitIdFrame = Instance.new("Frame")
	GUIObject.UICornerUI = Instance.new("UICorner")
	GUIObject.OutfitIdTextbox = Instance.new("TextBox")
	GUIObject.UIGradientUI = Instance.new("UIGradient")

	GUIObject.TorsoTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A1 = Instance.new("UIGradient")
	GUIObject.UICorner_A1 = Instance.new("UICorner")
	GUIObject.TorsoTypeButton = Instance.new("TextButton")
	GUIObject.ArmTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A11 = Instance.new("UIGradient")
	GUIObject.UICorner_A11 = Instance.new("UICorner")
	GUIObject.ArmTypeButton = Instance.new("TextButton")
	GUIObject.LegsTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A2 = Instance.new("UIGradient")
	GUIObject.UICorner_A2 = Instance.new("UICorner")
	GUIObject.LegsTypeButton = Instance.new("TextButton")
	GUIObject.ButtTypeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A16 = Instance.new("UIGradient")
	GUIObject.UICorner_A16 = Instance.new("UICorner")
	GUIObject.ButtTypeButton = Instance.new("TextButton")

	GUIObject.HP = Instance.new("Frame")
	GUIObject.HPButton = Instance.new("TextButton")
	GUIObject.UIGradient_A3 = Instance.new("UIGradient")
	GUIObject.UIAspectRatioConstraint_A1 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_A3 = Instance.new("UICorner")
	GUIObject.HPFrame = Instance.new("Frame")

	GUIObject.FPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A4 = Instance.new("UIGradient")
	GUIObject.UICorner_A4 = Instance.new("UICorner")
	GUIObject.FPExecute = Instance.new("TextButton")

	GUIObject.TopHPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A5 = Instance.new("UIGradient")
	GUIObject.UICorner_A5 = Instance.new("UICorner")
	GUIObject.TopHPText = Instance.new("TextBox")

	GUIObject.BottomHPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A6 = Instance.new("UIGradient")
	GUIObject.UICorner_A6 = Instance.new("UICorner")
	GUIObject.BottomHPText = Instance.new("TextBox")

	GUIObject.TopClothesFrame = Instance.new("Frame")
	GUIObject.UIGradient_A7 = Instance.new("UIGradient")
	GUIObject.UICorner_A7 = Instance.new("UICorner")
	GUIObject.TopClothesText = Instance.new("TextBox")

	GUIObject.BottomClothesFrame = Instance.new("Frame")
	GUIObject.UIGradient_A8 = Instance.new("UIGradient")
	GUIObject.UICorner_A8 = Instance.new("UICorner")
	GUIObject.BottomClothesText = Instance.new("TextBox")

	GUIObject.DamageFrame = Instance.new("Frame")
	GUIObject.UIGradient_A9 = Instance.new("UIGradient")
	GUIObject.UICorner_A9 = Instance.new("UICorner")
	GUIObject.DamageSFX = Instance.new("TextBox")

	GUIObject.VolumeFrame = Instance.new("Frame")
	GUIObject.UIGradient_A10 = Instance.new("UIGradient")
	GUIObject.UICorner_A10 = Instance.new("UICorner")
	GUIObject.VolumeText = Instance.new("TextBox")

	GUIObject.TPFrame = Instance.new("Frame")
	GUIObject.UIGradient_A12 = Instance.new("UIGradient")
	GUIObject.UICorner_A12 = Instance.new("UICorner")
	GUIObject.TPToggle = Instance.new("TextButton")
	GUIObject.PHFrame = Instance.new("Frame")
	GUIObject.UIGradient_A13 = Instance.new("UIGradient")
	GUIObject.UICorner_A13 = Instance.new("UICorner")
	GUIObject.PHToggle = Instance.new("TextButton")

	GUIObject.Recolor = Instance.new("Frame")
	GUIObject.RecolorButton = Instance.new("TextButton")
	GUIObject.UIGradient_A14 = Instance.new("UIGradient")
	GUIObject.UIAspectRatioConstraint_A2 = Instance.new("UIAspectRatioConstraint")
	GUIObject.UICorner_A14 = Instance.new("UICorner")
	GUIObject.RecolorFrame = Instance.new("Frame")
	GUIObject.RecolorListFrame = Instance.new("ScrollingFrame")
	GUIObject.UIGridLayout_A1 = Instance.new("UIGridLayout")

	GUIObject.GravityFrame = Instance.new("Frame")
	GUIObject.UIGradient_A15 = Instance.new("UIGradient")
	GUIObject.UICorner_A15 = Instance.new("UICorner")
	GUIObject.GravityButton = Instance.new("TextButton")

	GUIObject.BodyTransparencyFrame = Instance.new("Frame")
	GUIObject.UIGradient_A18 = Instance.new("UIGradient")
	GUIObject.UICorner_A18 = Instance.new("UICorner")
	GUIObject.BodyTransparencyButton = Instance.new("TextButton")

	GUIObject.HardcoreFrame = Instance.new("Frame")
	GUIObject.UIGradient_A19 = Instance.new("UIGradient")
	GUIObject.UICorner_A19 = Instance.new("UICorner")
	GUIObject.HardcoreToggle = Instance.new("TextButton")

	GUIObject.hardcoreUI = Instance.new("ScreenGui")
	GUIObject.hardcoreGroup = Instance.new("CanvasGroup")
	GUIObject.repairBar = Instance.new("ImageLabel")
	GUIObject.repairDisplay = Instance.new("UIGradient")
	GUIObject.topHPDisplay = Instance.new("TextLabel")
	GUIObject.bottomHPDisplay = Instance.new("TextLabel")


	GUIObject.HatButton = Instance.new("ImageButton")


	GUIObject.TailButton = Instance.new("ImageButton")
	GUIObject.TailFrame = Instance.new("Frame")

	GUIObject.tailToggleFrame = Instance.new("Frame")
	GUIObject.UIGradient_A20 = Instance.new("UIGradient")
	GUIObject.UICorner_A20 = Instance.new("UICorner")
	GUIObject.tailToggleButton = Instance.new("TextButton")


	GUIObject.optionsframeButton = Instance.new("ImageButton")
	GUIObject.optionsButton = Instance.new("TextButton")
	GUIObject.optionsFrame = Instance.new("Frame")
	GUIObject.saveFrame = Instance.new("Frame")
	GUIObject.saveButton = Instance.new("TextButton")
	GUIObject.closeOption = Instance.new("Frame")
	GUIObject.closeOptionButton = Instance.new("TextButton")
	GUIObject.executeOption = Instance.new("Frame")
	GUIObject.executeOptionButton = Instance.new("TextButton")
	GUIObject.bundleLoad = Instance.new("Frame")
	GUIObject.bundleLoadButton = Instance.new("TextButton")
	GUIObject.FPersonLoadup = Instance.new("Frame")
	GUIObject.FPersonLoadupButton = Instance.new("TextButton")
	GUIObject.outfitName = Instance.new("Frame")
	GUIObject.outfitNameBox = Instance.new("TextBox")
	GUIObject.importBundle = Instance.new("Frame")
	GUIObject.importBundleBox = Instance.new("TextBox")
	GUIObject.exportBox = Instance.new("Frame")
	GUIObject.exportButton = Instance.new("TextButton")
	GUIObject.saveOutfitBox = Instance.new("Frame")
	GUIObject.saveOutfitButton = Instance.new("TextButton")
	GUIObject.saveFullOutfitBox = Instance.new("Frame")
	GUIObject.saveFullOutfitButton = Instance.new("TextButton")
	GUIObject.saveClothesOption = Instance.new("Frame")
	GUIObject.saveClothesOptionButton = Instance.new("TextButton")
	GUIObject.delFrame = Instance.new("Frame")
	GUIObject.delButton = Instance.new("TextButton")

	GUIObject.HPListFrame = Instance.new("ScrollingFrame")
	GUIObject.HealButton = Instance.new("TextButton")
	GUIObject.ImageHeal = Instance.new("ImageLabel")
	GUIObject.TearButton = Instance.new("TextButton")
	GUIObject.ImageTear = Instance.new("ImageLabel")

	local env = {}
	local function missing(t, f, fallback)
		if type(f) == t then return f end
		return fallback
	end

	env.copy = (type(setclipboard) == "function" and setclipboard)
		or (type(toclipboard) == "function" and toclipboard)
		or (syn and type(syn.setclipboard) == "function" and syn.setclipboard)
		or (fluxus and type(fluxus.setclipboard) == "function" and fluxus.setclipboard)

	local g = (type(getgenv) == "function" and getgenv()) or {}

	env.gca = (type(getcustomasset) == "function" and getcustomasset)
		or (type(getsynasset) == "function" and getsynasset)
		or (syn and type(syn.getcustomasset) == "function" and syn.getcustomasset)
		or (fluxus and type(fluxus.getcustomasset) == "function" and fluxus.getcustomasset)
		or (type(g.getcustomasset) == "function" and g.getcustomasset)
		or (type(g.getsynasset) == "function" and g.getsynasset)

	env.request = (type(request) == "function" and request)
		or (type(http_request) == "function" and http_request)
		or (syn and type(syn.request) == "function" and syn.request)
		or (fluxus and type(fluxus.request) == "function" and fluxus.request)
		or (http and type(http.request) == "function" and http.request)
		or (type(g.request) == "function" and g.request)

	if RS:IsClient() and not RS:IsStudio() then
		env.readfile = missing("function", readfile, missing("function", g.readfile, (syn and syn.readfile)))
		env.loadfile = missing("function", loadfile, missing("function", g.loadfile, (syn and syn.loadfile)))
		env.writefile = missing("function", writefile, missing("function", g.writefile, (syn and syn.writefile)))
		env.delfile = missing("function", delfile, missing("function", g.delfile, (syn and syn.delfile)))
		env.listfiles = missing("function", listfiles, missing("function", g.listfiles, (syn and syn.listfiles)))
		env.isfile = missing("function", isfile, missing("function", g.isfile, (syn and syn.isfile)))
		env.makefolder = missing("function", makefolder, missing("function", g.makefolder, (syn and syn.makefolder)))
		env.isfolder = missing("function", isfolder, missing("function", g.isfolder, (syn and syn.isfolder)))
	end

	local _gca = (type(getcustomasset) == "function" and getcustomasset)
		or (type(getsynasset) == "function" and getsynasset)
		or (syn and type(syn.getcustomasset) == "function" and syn.getcustomasset)
		or (fluxus and type(fluxus.getcustomasset) == "function" and fluxus.getcustomasset)
		or (type(g.getcustomasset) == "function" and g.getcustomasset)
		or (type(g.getsynasset) == "function" and g.getsynasset)
		or (env and env.gca)

	local assetCache = {}
	local function getAsset(id)
		if typeof(id) ~= "string" or id == "" or id == "Parent" or id == "rbxasset0" or id:sub(1, 12) == "rbxassetid://" or id:sub(1, 4) == "http" then
			return id
		end

		if assetCache[id] then
			return assetCache[id]
		end

		local cleanPath = id
		if cleanPath:sub(1, 10) == "rbxasset://" then
			cleanPath = cleanPath:sub(11)
		end

		local chosenSource = AssetSource or (Function and Function.AssetSource)
		if chosenSource == "Roblox Folder" then
			local rbxResult = "rbxasset://" .. cleanPath
			assetCache[id] = rbxResult
			return rbxResult
		end

		local customAsset = _gca or env.gca
		if customAsset then
			-- 1. Direct path attempt as in OLDRC.lua:
			local s, res = pcall(customAsset, cleanPath)
			if s and res and res ~= "" then
				assetCache[id] = res
				return res
			end

			-- 2. Multi-path candidate checks for various executor workspace structures:
			local noPrefix = cleanPath:gsub("^RClothesContent/", "")
			local candidates = {
				"workspace/" .. cleanPath,
				"Workspace/" .. cleanPath,
				"RoCustomClothes/" .. cleanPath,
				"rocustomclothes/" .. cleanPath,
				"RoCustomClothes-main/" .. cleanPath,
				"RClothesContent/" .. noPrefix,
				noPrefix,
				"workspace/" .. noPrefix,
				"Workspace/" .. noPrefix,
				"RoCustomClothes/RClothesContent/" .. noPrefix,
				"rocustomclothes/RClothesContent/" .. noPrefix,
				"RoCustomClothes-main/RClothesContent/" .. noPrefix,
			}
			for _, cand in ipairs(candidates) do
				local s2, res2 = pcall(customAsset, cand)
				if s2 and res2 and res2 ~= "" then
					assetCache[id] = res2
					return res2
				end
			end
		end

		local fallback = "rbxasset://" .. cleanPath
		assetCache[id] = fallback
		return fallback
	end
	-- variables --
	local hidden = true
	
	local Mouse = Player:GetMouse()

	local Method2CharacterFolder = game.Workspace:FindFirstChild("Method2CharacterFolder")

	if not Method2CharacterFolder then
		Method2CharacterFolder = Instance.new("Folder", game.Workspace)
		Method2CharacterFolder.Name = "Method2CharacterFolder"
		Method2CharacterFolder.Archivable = not hidden
	end

	local IS = game:GetService("InsertService")
	local UIS = game:GetService("UserInputService")
	local TS = game:GetService("TweenService")
	local MPS = game:GetService("MarketplaceService")

	local CVersion = "0.7.9 Improved"

	-- these settings are saved and loaded --
	local loadupBundle = "Default"
	local loadupExecute = false
	local loadupClosed = false
	local loadupFPerson = 0
	local saveClothesOption = "Boob Naked"
	local KEYBIND = Enum.KeyCode.Insert
	local hpKEYBIND = Enum.KeyCode.Equals
	local dpKEYBIND = Enum.KeyCode.Minus
	-- you probably shouldnt edit these --
	
	local maxFPersonMethod = 6
	local KeybindDetect = false
	local hpKeybindDetect = false
	local dpKeybindDetect = false

	local Method = 2
	local MaxMethod = 3

	local MaxBreastsType = 5
	local MaxTorsoType = 8
	local MaxArmType = 4
	local MaxLegsType = 6
	local MaxButtType = 3

	local ClickExecute = false

	local DetectingBundle = false
	local IsEnterFrame = false
	local IsMouseDown = false

	local GuiPositionStart = nil
	local MouseDownStart = nil

	local AllConnect = {}
	local MeshEditConnect = {}
	local Debug = false

	local SelectPlayer = Player.Name

	local DarkerColorPercentage = 17.75
	local Darker2ColorPercentage = 32.75

	local Circle = 2*math.pi
	local PreviewRotate = 0
	local PreviewRadius = 5
	local PreviewRotateSpeed = 200
	local CharacterPreviewLoading = false

	local NPCs = {}

	local PositionPhysicsMultiply = 1
	local RotationPhysicsMultiply = 4

	-- tail stuff --
	local includedAccessoryNames = {} -- if ur tail isnt recognized as one, put its name here
	local excludeAccessoryNames = {} -- if ur accessory is recognized as a tail but it isnt, put its name here
	local timeStep = 1 / 60
	local inverseTimeStep = 1 / timeStep

	local wagAnimationDropAmplitude = 0.2 -- Default: 0.2. How far in radians the tail will rotate down (90% of this value is rotating down and 10% is up)
	local wagAnimationSwayAmplitude = 0.4 -- Default: 0.4. How far in radians the tail will rotate left and right.
	local wagAnimationRollAmplitude = 0.5 -- Default: 0.5. How far in radians the tail will roll/twist.

	local wagAnimationBlendInAlpha = 0.008
	local wagAnimationBlendOutAlpha = 0.02

	local movementDistanceThreshold = 15 -- The physics tail interprets a teleporting player as moving fast. Movements beyond this radius are ignored.

	local tailVariables = { -- DO NOT CHANGE, THIS IS FOR PHYSIC CALCULATIONS
		["Default"] = {
			tailScaledAnimationTime = 0,
			tailScaledTime = 0,
			accumulator = 0,
		}
	}

	-- advanced --
	local globalWindEnabled = false -- A global force from workspace.GlobalWind. Default: false
	local gravityEnabled = false -- A global force from workspace.Gravity. Default: false

	-- A force (with wind fluctuation) applied to the tail every physics step.
	local customPersistantWindForce = Vector3.new(0, 0, 0) -- Default: Vector3.new(0, 0, 0)
	-- A force applied to the tail every physics step.
	local customPersistantLinearForce = Vector3.new(0, 0, 0) -- Default: Vector3.new(0, 0, 0)

	-- end tail stuff --

	local Function = {Spring = {}}
	Function.getAsset = getAsset
	Function.AssetSource = AssetSource
	Function.ClearAssetCache = function()
		assetCache = {}
	end

	function Function.PlayerDataDefault()
		return {
			Character = nil,

			isTailCurrentlyEnabled = true,
			tailSettings = {
				tailPhysicsEnabled = true,

				stiffness = 96, -- More stiffness is less flexible. Default: 96
				damping = 9, -- Resistance due to drag (slow down). Default: 9
				linearAmplitude = Vector3.new(13, 11, 13), -- Default: Vector3.new(48, 19, 48)
				angularAmplitude = Vector3.new(0, 25, 0), -- Default: Vector3.new(0, 18, 0)
				timeScale = 1, -- Creates a floaty feel if slowed down (e.g. 0.3). This also affects the animation. Default: 1

				wagAnimationEnabled = true,
				wagAnimationSpeed = 1, -- Default: 1
			},

			CurrentClothes = {
				"Roblox Shirt",
				"Roblox Butt Shirt",
				"Roblox Pants",
				"Nipple Piercing 20",
				"Womb Mark Animalistic",
			},
			ClothesRecolor = {
				["Womb Mark Animalistic"] = {
					["Primary"] = "nil",
				},
			},
			CurrentBundle = "Default",
			AutoExecute = true,
			DelayTime = 1,
			Tone = "Base",
			BundleBodyColor = true,
			Face = false,
			MeshSizeLock = false,
			AccessorySizeLock = false,
			MeshBasePartInvisible = false,
			BodyPartPhysics = true,
			PhysicsObeyGravity = true,
			CatalogUsername = "",
			CatalogOutfitId = "",
			CatalogClothes = {
				Shirt = "",
				Pants = "",
				ShirtGraphic = "",
			},
			PlayerOwnClothes = {
				Shirt = nil,
				Pants = nil,
			},
			PlayerOwnAvatar = nil,
			OldestClothings = {
				Shirt = nil,
				Pants = nil,
				ShirtGraphic = nil,
			},
			CatalogTail = {},
			CatalogAccessory = {},
			CatalogRemove = {},
			SkinTone = nil,
			NippleColor = nil,
			CockScale = 1,
			BreastsScale = 1,
			ButtsScale = 1,
			LegsScale = 1,
			BreastsType = 1,
			TorsoType = 1,
			ArmType = 1,
			LegsType = 1,
			ButtType = 1,
			ToggleBBC = false,
			Cooldown = false,
			updateCooldown = false,
			FPsnap = false,
			FPerson = false,
			HeadTracking = true,
			RealtimeBodyTransparency = true,
			OldTransparency = {},

			TopRipped = false,
			BottomRipped = false,
			SavedPreviousHP = 0,
			SavedTopHP = 0,
			SavedBottomHP = 0,
			Healing = false,
			HealProgress = 0,
			HardcoreHP = false,
			TopHP = "",
			BottomHP = "",
			HPClothes = {
				Shirt = "",
				Pants = ""
			},
			ClothesHP = {
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
			},
			DamageSFX = "",
			Volume = 1,
			TearParticles = true,
			HealParticles = true,
			ClothesHP = {},

			PartList = Function.PartListDefault(),

			LocalTransparency = {
				["Head"] = false,
				["Right Arm"] = false,
				["Left Arm"] = false,
				["Torso"] = false,
				["Right Leg"] = false,
				["Left Leg"] = false,
				["Hat"] = true
			},

			CurrentPartList = {
				Organ = {},
				Clothes = {},
				Accessory = {},
				TransparencyLink = {},
				ParentTransparency = {},
				RealtimeUpdateList = {
					["Mesh"] = {},
					["Accessory"] = {},
					["Special"] = {},
					["SpecialMesh"] = {}
				},
				PartParent = {},
				BodyPartPhysics = {},
				physicsTails = {},
				AreolaDecal = {},
				OriginalTransparency = {},
			},
			ConvertedPart = {}
		}
	end

	local R15Size = {
		["UpperTorso"] = Vector3.new(2.043, 1.796, 1.01),
		["UpperTorsoFemale"] = Vector3.new(2.043, 1.796, 1.01),
		["RightLowerArm"] = Vector3.new(1, 0.78, 1),
		["LeftLowerArm"] = Vector3.new(1, 0.78, 1),
		["RightLowerLeg"] = Vector3.new(1, 1.231, 1.335),
		["LeftLowerLeg"] = Vector3.new(1, 1.231, 1.335),
	}

	local R15Transparency = {
		"UpperTorso",
		"LowerTorso",
		"RightUpperArm",
		"RightLowerArm",
		"RightHand",
		"LeftUpperArm",
		"LeftLowerArm",
		"LeftHand",
		"RightUpperLeg",
		"RightLowerLeg",
		"RightFoot",
		"LeftUpperLeg",
		"LeftLowerLeg",
		"LeftFoot",
	}

	local R6Size = {
		["Head"] = Vector3.new(2, 1, 1),
		["Torso"] = Vector3.new(2, 2, 1),
		["Left Arm"] = Vector3.new(1, 2, 1),
		["Left Leg"] = Vector3.new(1, 2, 1),
		["Right Arm"] = Vector3.new(1, 2, 1),
		["Right Leg"] = Vector3.new(1, 2, 1),
	}

	local WeldCFrame = {
		["Torso"] = CFrame.new(0, -0.2, 0),
		["Right Arm"] = CFrame.new(0, 0.2, 0),
		["Left Arm"] = CFrame.new(0, 0.2, 0),
		["Right Leg"] = CFrame.new(0, 0.2, 0),
		["Left Leg"] = CFrame.new(0, 0.2, 0)
	}

	local ConvertPart = {
		["Torso"] = "UpperTorso",
		["Right Arm"] = "RightLowerArm",
		["Left Arm"] = "LeftLowerArm",
		["Right Leg"] = "RightLowerLeg",
		["Left Leg"] = "LeftLowerLeg"
	}

	local R6Mesh = {
		["TorsoMale"] = "rbxassetid://456901040",
		["TorsoFemale"] = "rbxassetid://9747912904",
		["Right Arm"] = "rbxassetid://5062992824",
		["Left Arm"] = "rbxassetid://5062992824",
		["Right Leg"] = "rbxassetid://5062992824",
		["Left Leg"] = "rbxassetid://5062992824"
	}

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

                                      ████████╗░█████╗░██████╗░██╗░░░░░███████╗
                                      ╚══██╔══╝██╔══██╗██╔══██╗██║░░░░░██╔════╝
                                      ░░░██║░░░███████║██████╦╝██║░░░░░█████╗░░
                                      ░░░██║░░░██╔══██║██╔══██╗██║░░░░░██╔══╝░░
                                      ░░░██║░░░██║░░██║██████╦╝███████╗███████╗
                                      ░░░╚═╝░░░╚═╝░░╚═╝╚═════╝░╚══════╝╚══════╝
                                  
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

