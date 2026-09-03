	function Function.PartListDefault()
		return {
			-- BODY PARTS
			["Torso"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = getAsset("RClothesContent/13181228593.mesh"),
				["Size"] = Vector3.new(2.04, 2.06, 1.06),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Left Leg"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/7332360863.mesh"),
				["Size"] = Vector3.new(1.213, 2.18, 1.201),
				["CFrame"] = CFrame.new(-0.0359992981, 0.0627000332, 0.0440006256, -4.37113883e-08, 0, -1, 0, 0.999999881, 0, 1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Leg"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/7332415457.mesh"),
				["Size"] = Vector3.new(1.213, 2.18, 1.201),
				["CFrame"] = CFrame.new(0.0359992981, 0.0627000332, 0.0440006256, -4.37113883e-08, 0, -1, 0, 0.999999881, 0, 1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Mesh",
				["MeshId"] = getAsset("RClothesContent/11617989163.mesh"),
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0.0349998474, 0, 0, -1, 0, -8.74227766e-08, 0, 0.999999881, 0, 8.74227766e-08, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			},
			["Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Mesh",
				["MeshId"] = getAsset("RClothesContent/11617988681.mesh"),
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(-0.0349998474, 0, 0, -1, 0, -8.74227766e-08, 0, 0.999999881, 0, 8.74227766e-08, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			},
			["Left Butt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt",
				["MeshId"] = getAsset("RClothesContent/13181475662.mesh"),
				["Size"] = Vector3.new(1.252, 1.239, 1.263),
				["CFrame"] = CFrame.new(-0.532000542, -0.961999893, 0.328999966, -1, 3.52998995e-06, -5.08968776e-07, 3.69696932e-06, 1, -1.92065613e-06, 5.08962978e-07, -1.92066227e-06, -1),
				["CFrame1"] = CFrame.new(-0.0004, 0, 0.001),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=800}
			},
			["Right Butt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt",
				["MeshId"] = getAsset("RClothesContent/13181475663.mesh"),
				["Size"] = Vector3.new(1.252, 1.239, 1.263),
				["CFrame"] = CFrame.new(0.532000542, -0.961999893, 0.328999966, -1, 3.52998995e-06, -6.08968776e-07, 3.69696932e-06, 1, -1.92065613e-06, 6.08962978e-07, -1.92066227e-06, -1),
				["CFrame1"] = CFrame.new(0.0004, 0, 0.001),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=800}
			},
			["Left Breast"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast",
				["MeshId"] = getAsset("RClothesContent/17645666081.mesh"),
				["Size"] = Vector3.new(1.15, 1.403, 0.98),
				["CFrame"] = CFrame.new(-0.24647522, 0.635471106, -0.450698853, 0.320868134, 0.223423854, -0.920394123, -0.184720367, 0.967879057, 0.170553446, 0.928935945, 0.115290381, 0.351832479),
				["CFrame1"] = CFrame.new(0.200012207, 0.400005341, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "AreolaDecalCreate",
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Right Breast"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast",
				["MeshId"] = getAsset("RClothesContent/17645666081.mesh"),
				["Size"] = Vector3.new(1.15, 1.403, 0.98),
				["CFrame"] = CFrame.new(0.24647522, 0.635471106, -0.450698853, -0.320868134, -0.223423854, -0.920394123, -0.184720367, 0.967879057, -0.170553446, 0.928935945, 0.115290381, -0.351832479),
				["CFrame1"] = CFrame.new(0.200012207, 0.400005341, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "AreolaDecalCreate",
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Left Nipple"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["MeshId"] = getAsset("RClothesContent/17645756055.mesh"),
				["Size"] = Vector3.new(0.129, 0.067, 0.129),
				["CFrame"] = CFrame.new(-0.572320938, -0.203234434, 0.00150489807, 0.000296547514, 0.999854326, -0.0170696471, -0.982211947, 0.0029140336, -0.18775323, -0.187775597, 0.0168216899, 0.982067883),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			},
			["Right Nipple"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["MeshId"] = getAsset("RClothesContent/17645756055.mesh"),
				["Size"] = Vector3.new(0.129, 0.067, 0.129),
				["CFrame"] = CFrame.new(-0.572320938, -0.203234434, 0.00150489807, -0.000296547514, 0.999854326, -0.0170696471, -0.982211947, 0.0029140336, 0.18775323, 0.187775597, 0.0168216899, 0.982067883),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			},
			["BBC Rod"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Rod",
				["MeshId"] = "rbxassetid://14437003062",
				["Size"] = Vector3.new(0.565, 0.802, 1.98),
				["CFrame"] = CFrame.new(-0.077, -0.982, -0.233, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["CFrame1"] = CFrame.new(0, -0.2, 0.9, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "RodPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}

			},
			["BBC Tip"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Tip",
				["MeshId"] = "rbxassetid://14437018423",
				["Size"] = Vector3.new(0.444, 0.313, 0.481),
				["CFrame"] = CFrame.new(0.017, 0.283, -0.838, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "BBC Rod",

				},
				["Function"] = "DarkPart",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame"}
			},
			["BBC Balls"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Balls",
				["MeshId"] = "rbxassetid://14436718311",
				["Size"] = Vector3.new(1.036, 0.976, 0.592),
				["CFrame"] = CFrame.new(0.002, -0.441, 0.652, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "BBC Rod",

				},
				["Function"] = "BBCBallPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame"}
			},
			["EasterSack"] = {
				["Instance"] = "Mesh",
				["Name"] = "BBC Balls",
				["MeshId"] = getAsset("RClothesContent/74969809748782.mesh"),
				["Size"] = Vector3.new(1.036, 0.976, 0.592),
				["CFrame"] = CFrame.new(0.002, -0.441, 0.652, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["TextureId"] = getAsset("RClothesContent/easter_balls_better.png"),
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "BBC Rod",

				},
				["Function"] = "BBCBallPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame"}
			},
			["Cock"] = {
				["Instance"] = "Mesh",
				["Name"] = "Rod",
				["Size"] = Vector3.new(1.2970000505447388, 0.46000000834465027, 0.47099998593330383),
				["CFrame"] = CFrame.new(-0.0308074951, -0.971994877, -0.571624756, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(0.5, -0, 0.0379999988, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/RoCat Cock.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "RodPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Balls"] = {
				["Instance"] = "Mesh",
				["Name"] = "Balls",
				["Size"] = Vector3.new(0.4475859999656677, 0.8527889847755432, 0.7235980033874512),
				["CFrame"] = CFrame.new(-0.0351104736, -0.967835665, -0.569778442, -6.90403394e-05, 1.09312105e-05, -1, 0.156382754, 0.987696528, 0, 0.987696528, -0.156382754, -6.99003576e-05),
				["CFrame1"] = CFrame.new(-1.52587927e-05, 0.299999237, 0.0345458984, 1.00000429, 1.04308157e-07, 4.76063741e-13, 3.27825546e-07, 1.00000226, 1.43209888e-11, -6.2847505e-12, -1.91024085e-10, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/RoCat Balls.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "BBCBallPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Tip"] = {
				["Instance"] = "Mesh",
				["Name"] = "Tip",
				["Size"] = Vector3.new(0.37700000405311584, 0.328000009059906, 0.37400001287460327),
				["CFrame"] = CFrame.new(-0.621873856, 0.0263288021, 0.00502586365, -1, 3.88713488e-08, 2.91103174e-06, -1.36291813e-08, 0.999996185, -3.10204257e-07, -2.91137076e-06, -3.12861516e-07, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/RoCat Cocktip.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Rod",
				},
				["Function"] = "DarkPart",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame"}
			},
			["Left Breast Type 2"] = {
				["Instance"] = "Part",
				["Name"] = "Left Breast",
				["Size"] = Vector3.new(0.8140669465065002, 0.8140669465065002, 0.8140669465065002),
				["CFrame"] = CFrame.new(0, 0.883000016, -0.344000012, -1, 0, 8.74227766e-08, 0, 1, 0, -8.74227766e-08, 0, -1),
				["CFrame1"] = CFrame.new(0.400000006, 0.600000024, -0.300000012, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType2Mesh", "AreolaDecalType2Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Right Breast Type 2"] = {
				["Instance"] = "Part",
				["Name"] = "Right Breast",
				["Size"] = Vector3.new(0.8140669465065002, 0.8140669465065002, 0.8140669465065002),
				["CFrame"] = CFrame.new(0, 0.883000016, -0.344000012, -1, 0, 8.74227766e-08, 0, 1, 0, -8.74227766e-08, 0, -1),
				["CFrame1"] = CFrame.new(-0.400024414, 0.600001335, -0.299987793, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType2Mesh", "AreolaDecalType2Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Right Breast Type 3"] = {
				["Instance"] = "Part",
				["Name"] = "Right Breast",
				["Size"] = Vector3.new(1.4028211832046509, 1.4687727689743042, 1.24605131149292),
				["CFrame"] = CFrame.new(0.215000004, 0.758000016, -0.268999994, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(-0.299987793, 0.5, -0.200012207, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Breast Type 3"] = {
				["Instance"] = "Part",
				["Name"] = "Left Breast",
				["Size"] = Vector3.new(1.4028211832046509, 1.4687727689743042, 1.24605131149292),
				["CFrame"] = CFrame.new(-0.215000004, 0.758000016, -0.268999994, -4.37113883e-08, 5.22728624e-06, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["CFrame1"] = CFrame.new(-0.299987793, 0.5, 0.200012207, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Nipple Type 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.10870949923992157, 0.14377030730247498, 0.11643027514219284),
				["CFrame"] = CFrame.new(0.698000014, -0.256999999, -0.367000014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/5270413936.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167.00000524520874, 169.00000512599945),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["Right Nipple Type 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.10870949923992157, 0.14377030730247498, 0.11643027514219284),
				["CFrame"] = CFrame.new(0.698000014, -0.256999999, 0.367000014, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/5270413632.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167.00000524520874, 169.00000512599945),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			},
			["Right Breast Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast",
				["Size"] = Vector3.new(1.309288501739502, 1.3237565755844116, 1.0778127908706665),
				["CFrame"] = CFrame.new(0.2, 0.67, -0.435, -0.303515047, 0.0131401122, -0.95273608, 0.386091501, 0.915834308, -0.110366784, 0.871098161, -0.401341259, -0.283042789),
				["CFrame1"] = CFrame.new(0.400146484, 0.399963379, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7220038121.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Breast Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast",
				["Size"] = Vector3.new(1.309288501739502, 1.3237565755844116, 1.0778127908706665),
				["CFrame"] = CFrame.new(-0.2, 0.67, -0.435, 0.373207688, -0.0456757545, -0.926622808, 0.386091858, 0.915835142, 0.110358819, 0.843593001, -0.398948252, 0.359431773),
				["CFrame1"] = CFrame.new(0.400146484, 0.399963379, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7220038121.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = {"BreastsType3Mesh", "AreolaDecalType3Create"},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["Left Areola Type 4"] = {
				["Instance"] = "Part",
				["Name"] = "Areola",
				["Size"] = Vector3.new(0.4839892089366913, 0.48398923873901367, 0.17859317362308502),
				["CFrame"] = CFrame.new(-0.559692383, 0.0360107422, 0.0500183105, -0.115508914, 0.290242553, 0.949961782, -0.0913974494, 0.949200869, -0.301123828, -0.989094198, -0.121604398, -0.0831084549),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = {"DarkPart", "AreolaType4Mesh"},
				["Scale"] = "BreastsScale"
			}, 
			["Right Areola Type 4"] = {
				["Instance"] = "Part",
				["Name"] = "Areola",
				["Size"] = Vector3.new(0.48398923873901367, 0.48398929834365845, 0.17859318852424622),
				["CFrame"] = CFrame.new(-0.559631348, 0.0362243652, -0.0501708984, 0.0580038428, 0.306949109, 0.949959099, -0.0913976729, 0.949200273, -0.301123589, -0.994123936, -0.0693574548, 0.0831099451),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = {"DarkPart", "AreolaType4Mesh"},
				["Scale"] = "BreastsScale"
			}, 
			["Left Nipple Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.11428011208772659, 0.163490429520607, 0.154353529214859),
				["CFrame"] = CFrame.new(-3.05175781e-05, 0, -0.0799560547, 0.468626767, -0.125764415, 0.87440002, 0.0493227318, -0.984550238, -0.16804342, 0.882020473, 0.12187916, -0.455186784),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7223274409.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Areola",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["Right Nipple Type 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Nipple",
				["Size"] = Vector3.new(0.11428012698888779, 0.1634904444217682, 0.1543535441160202),
				["CFrame"] = CFrame.new(0.000122070312, -7.62939453e-06, -0.0800170898, 0.468629152, -0.125764504, 0.874397278, 0.0493227914, -0.984549701, -0.168042675, 0.882019937, 0.121878669, -0.455182761),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7223274409.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Areola",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["Pussy Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy",
				["MeshId"] = getAsset("RClothesContent/17633723189.mesh"),
				["Size"] = Vector3.new(0.82, 0.876, 0.825),
				["CFrame"] = CFrame.new(0, -0.925573111, -0.0344238281, -1, 0, 0, 1.1765762e-13, 1, 0, 0, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Clitoris Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Clitoris",
				["MeshId"] = getAsset("RClothesContent/17633756976.mesh"),
				["Size"] = Vector3.new(0.016, 0.032, 0.013),
				["CFrame"] = CFrame.new(0, -0.0782728195, 0.396118164, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			},
			["Vulva Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vulva",
				["MeshId"] = getAsset("RClothesContent/17633771118.mesh"),
				["Size"] = Vector3.new(0.049, 0.339, 0.569),
				["CFrame"] = CFrame.new(0, -0.231252432, 0.116136551, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			},
			["Vagina Closed"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vagina",
				["MeshId"] = getAsset("RClothesContent/17633784085.mesh"),
				["Size"] = Vector3.new(0.048, 0.357, 0.555),
				["CFrame"] = CFrame.new(0, -0.218520164, 0.12276268, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 89, 89)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "Dark2Part"
			},
			["Pussy Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy",
				["Size"] = Vector3.new(0.8848919868469238, 0.8711600303649902, 0.8346620202064514),
				["CFrame"] = CFrame.new(-0.00100517273, -0.964430332, -0.0420532227, -0.999993682, 7.40205633e-06, -4.17192183e-07, 9.17161924e-06, 0.999999881, -1.33617547e-07, -4.1726986e-07, 1.33675684e-07, -1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17108921573.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Clitoris Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Clitoris",
				["Size"] = Vector3.new(0.016096899285912514, 0.03247833997011185, 0.01232868805527687),
				["CFrame"] = CFrame.new(3.05175781e-05, -0.0711487532, 0.40284729, 0.999993682, 8.84806468e-07, 4.17230467e-07, 8.84806468e-07, 0.999999881, -1.33648342e-07, 4.17230467e-07, -1.33648342e-07, 1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17108921543.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			}, 
			["Vulva Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vulva",
				["Size"] = Vector3.new(0.5450000166893005, 0.375, 0.6100000143051147),
				["CFrame"] = CFrame.new(0.000427246094, -0.242344975, 0.102287292, 0.999993682, 8.84806468e-07, 4.17230467e-07, 8.84806468e-07, 0.999999881, -1.33648342e-07, 4.17230467e-07, -1.33648342e-07, 1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17108921578.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "DarkPart"
			}, 
			["Vagina Open"] = {
				["Instance"] = "Mesh",
				["Name"] = "Vagina",
				["Size"] = Vector3.new(0.5199980139732361, 0.4561500549316406, 0.6124080419540405),
				["CFrame"] = CFrame.new(0.000490188599, -0.203095198, 0.101016998, 0.999993682, 8.84806468e-07, 4.17230467e-07, 8.84806468e-07, 0.999999881, -1.33648342e-07, 4.17230467e-07, -1.33648342e-07, 1.00000024),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17108921539.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 89, 89)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Pussy",
				},
				["Function"] = "Dark2Part"
			}, 
			["Torso2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = getAsset("RClothesContent/137558328898044.mesh"),
				["Size"] = Vector3.new(2.009, 2, 1.127),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Arm2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Mesh",
				["Size"] = Vector3.new(1.229590654373169, 2.055715322494507, 1.0100106000900269),
				["CFrame"] = CFrame.new(-0.0845117569, -0.000298976898, 0.000483512878, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17873855289.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 
			["Left Arm2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Mesh",
				["Size"] = Vector3.new(1.229590654373169, 2.055715322494507, 1.0100106000900269),
				["CFrame"] = CFrame.new(0.0504875183, -0.000301837921, 0.000484466553, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17873855280.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 
			["Torso3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["Size"] = Vector3.new(2.262770891189575, 2.165092706680298, 1.2769441604614258),
				["CFrame"] = CFrame.new(0.00048828125, -0.0753002167, 0.000483989716, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17873855318.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Right Leg3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["Size"] = Vector3.new(1.4192306995391846, 2.530543327331543, 1.411695957183838),
				["CFrame"] = CFrame.new(0.0505523682, 0.149428248, 0.050807476, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/117979897155395.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Left Leg3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["Size"] = Vector3.new(1.4192306995391846, 2.530543327331543, 1.411695957183838),
				["CFrame"] = CFrame.new(-0.049446106, 0.149427295, 0.0508079529, 1, -8.84762244e-07, 4.17234219e-07, 8.84762244e-07, 1, 1.33645642e-07, -4.17234361e-07, -1.33645287e-07, 1),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/71484235609105.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Torso4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = getAsset("RClothesContent/133621335195542.mesh"),
				["Size"] = Vector3.new(2.009, 2, 1.127),
				["CFrame"] = CFrame.new(0, 0, 0, -1, 0, -8.74227766e-08, 0, 1, -0, 8.74227766e-08, -0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Left Leg2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/9067190251.mesh"),
				["Size"] = Vector3.new(1.402345895767212, 2.247053861618042, 1.5714069604873657),
				["CFrame"] = CFrame.new(-0.0995101929, 0.0462403297, 0.000484466553, -1, -8.84762244e-07, -4.17234219e-07, -8.84762244e-07, 1, -1.33645642e-07, 4.17234361e-07, -1.33645287e-07, -1),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Leg2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/9067191575.mesh"),
				["Size"] = Vector3.new(1.399999976158142, 2.2464888095855713, 1.5719980001449585),
				["CFrame"] = CFrame.new(0.10049057, 0.0462414026, 0.000483989716, -1, -8.84762244e-07, -4.17234219e-07, -8.84762244e-07, 1, -1.33645642e-07, 4.17234361e-07, -1.33645287e-07, -1),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},

			["Torso5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["Size"] = Vector3.new(2, 2, 1),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://489667862",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Left Leg4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = "rbxassetid://488154609",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0,0,0),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Leg4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = "rbxassetid://488154808",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0,0,0),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Arm3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Mesh",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://488154808",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 
			["Left Arm3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Mesh",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://488154609",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 

			["Torso6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["Size"] = Vector3.new(2.035, 2.036, 1.125),
				["CFrame"] = CFrame.new(0, 0, -0.0405553579, -1, 0, 0, 0, 1, 0, 0, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9329354422.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},
			["Right Arm4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Mesh",
				["Size"] = Vector3.new(1, 2.013, 1.114),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6143439194.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 
			["Left Arm4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Mesh",
				["Size"] = Vector3.new(1, 2.013, 1.114),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6143427747.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "ShirtTexture"
			}, 

			["Torso7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["Size"] = Vector3.new(2.077857255935669, 1.998084545135498, 0.966502845287323),
				["CFrame"] = CFrame.new(0, 0.0520000458, 0, -1, -1.63851337e-06, 1.50995803e-07, -1.63851337e-06, 1, -1.11045296e-11, -1.50995803e-07, -1.13519385e-11, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/13755434958.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent",
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			},

			["Left Butt2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt",
				["MeshId"] = getAsset("RClothesContent/9067214532.mesh"),
				["Size"] = Vector3.new(1.2358614206314087, 1.3677444458007812, 1.3591549396514893),
				["CFrame"] = CFrame.new(-0.48058036, -0.935174763, 0.246622816, -0.939691007, 0.342023283, -0.000989110908, 0.340629935, 0.936115921, 0.087511301, 0.0308568217, 0.0818966553, -0.996163011),
				["CFrame1"] = CFrame.new(-0.0004, 0, 0.001),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=800}
			},
			["Right Butt2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt",
				["MeshId"] = getAsset("RClothesContent/9067214532.mesh"),
				["Size"] = Vector3.new(1.2358601093292236, 1.3675915002822876, 1.359156847000122),
				["CFrame"] = CFrame.new(0.484511584, -0.935167909, 0.228578746, -0.939691842, -0.342021823, -0.000567939656, -0.340772927, 0.936116099, 0.0869510695, -0.0292075071, 0.0819007531, -0.996212423),
				["CFrame1"] = CFrame.new(0.0004, 0, 0.001),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=800}
			},
			["Left Butt3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt",
				["MeshId"] = getAsset("RClothesContent/15333488402.mesh"),
				["Size"] = Vector3.new(1.292526125907898, 1.421129584312439, 1.2406930923461914),
				["CFrame"] = CFrame.new(-0.5449543, -1.01682138, 0.493936539, -0.999996841, -4.42379047e-07, -2.08616072e-07, 4.42379076e-07, 0.99999994, -6.68224871e-08, -2.08616157e-07, 6.68224942e-08, -1.00000012),
				["CFrame1"] = CFrame.new(-0.0004, 0, 0.001),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=800}
			},
			["Right Butt3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt",
				["MeshId"] = getAsset("RClothesContent/15333488459.mesh"),
				["Size"] = Vector3.new(1.292526125907898, 1.4211293458938599, 1.2406928539276123),
				["CFrame"] = CFrame.new(0.544282913, -1.01682186, 0.493938446, -0.999996841, -4.42379047e-07, -2.08616072e-07, 4.42379076e-07, 0.99999994, -6.68224871e-08, -2.08616157e-07, 6.68224942e-08, -1.00000012),
				["CFrame1"] = CFrame.new(0.0004, 0, 0.001),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "ButtsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=800}
			},

			["Right Leg5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/15689547573.mesh"),
				["Size"] = Vector3.new(1.8530000448226929, 2.299999952316284, 1.8250000476837158),
				["CFrame"] = CFrame.new(0.101165771, 0.120700002, -0.0378417969, 0.0227066502, -8.84762244e-07, -0.999742389, 1.53700825e-07, 1, -8.81499716e-07, 0.999742389, -1.33645287e-07, 0.0227066502),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Left Leg5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/15689547567.mesh"),
				["Size"] = Vector3.new(1.8530000448226929, 2.299999952316284, 1.8250000476837158),
				["CFrame"] = CFrame.new(-0.020614624, 0.120699167, -0.0112304688, 0.0227067191, -8.84762244e-07, -0.99974215, 1.53700853e-07, 1, -8.81499545e-07, 0.99974215, -1.33645287e-07, 0.0227067191),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Torso8"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Mesh",
				["MeshId"] = getAsset("RClothesContent/13085030579.mesh"),
				["Size"] = Vector3.new(1.0990766286849976, 2.240330934524536, 2.252163887023926),
				["CFrame"] = CFrame.new(0.0160980225, -0.10021019, -0.0673675537, 0.00548222661, -7.65554717e-07, -0.999985158, 1.38493746e-07, 1, -7.64807226e-07, 0.999985158, -1.34298816e-07, 0.00548222661),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Right Leg6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/11725817042.mesh"),
				["Size"] = Vector3.new(1.0757273435592651, 2.028697967529297, 1.120668649673462),
				["CFrame"] = CFrame.new(-9.87611711e-05, 0.000455433503, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
				["Function"] = "PantsTexture"
			}, 
			["Left Leg6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Mesh",
				["MeshId"] = getAsset("RClothesContent/11725817051.mesh"),
				["Size"] = Vector3.new(1.0757273435592651, 2.0286977291107178, 1.120668649673462),
				["CFrame"] = CFrame.new(0.000105079263, 0.000455433503, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["CFrame1"] = CFrame.new(0, -0.001, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["Scale"] = "LegsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=300},
				["ParentTransparency"] = 1,
			}, 



			["sheathKnot"] = {
				["Instance"] = "Mesh",
				["Name"] = "Sheath",
				["Size"] = Vector3.new(0.6069548726081848, 0.4187641739845276, 0.30235612392425537),
				["CFrame"] = CFrame.new(0, 0.0739526749, -0.0534248352, 1, 0, 0, 0, 0.999995112, 0, 0, 0, 0.999995112),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/12921743140.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["mainKnot"] = {
				["Instance"] = "Mesh",
				["Name"] = "Main",
				["Size"] = Vector3.new(0.6015185117721558, 0.6395909190177917, 0.39970552921295166),
				["CFrame"] = CFrame.new(0.00248718262, -0.962300539, -0.504486084, 1, -7.98868768e-07, 5.64532854e-07, 8.84762244e-07, 0.98480773, -0.173648059, -4.17234361e-07, 0.173648059, 0.98480773),
				["CFrame1"] = CFrame.new(0.00201797485, 0.00545811653, 0.0592346191, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/12921742575.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "RodPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["ballsKnot"] = {
				["Instance"] = "Mesh",
				["Name"] = "ballsKnot",
				["Size"] = Vector3.new(0.6290000081062317, 1.159999966621399, 1.0369999408721924),
				["CFrame"] = CFrame.new(0.000469207764, -0.967758656, -0.563720703, 1, -7.98866836e-07, 5.6453149e-07, 8.84762244e-07, 0.984805346, -0.173647627, -4.17234361e-07, 0.173647627, 0.984805346),
				["CFrame1"] = CFrame.new(-0.0200748444, 0.388033152, 0.00170898438, 0, -0.173647761, -0.984805346, 0, 0.984805346, -0.173647761, 1, 0, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/RoCat Balls.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "BBCBallPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 

			["tipKnot"] = {
				["Instance"] = "Mesh",
				["Name"] = "tipKnot",
				["Size"] = Vector3.new(0.35600000619888306, 0.30399999022483826, 0.20200000703334808),
				["CFrame"] = CFrame.new(-0.0242080688, 0.0334939957, -1.71375084, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/104258503222570.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["trShaft"] = {
				["Instance"] = "Mesh",
				["Name"] = "TopRight Shaft",
				["Size"] = Vector3.new(0.2680000066757202, 0.5479999780654907, 0.734000027179718),
				["CFrame"] = CFrame.new(0.109142303, -0.0321941376, -1.34951591, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/93314074748372.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["tlShaft"] = {
				["Instance"] = "Mesh",
				["Name"] = "TopLeft Shaft",
				["Size"] = Vector3.new(0.26899999380111694, 0.546999990940094, 0.734000027179718),
				["CFrame"] = CFrame.new(-0.155548096, -0.0327558517, -1.34943771, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/139687389487082.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["brShaft"] = {
				["Instance"] = "Mesh",
				["Name"] = "BottomRight Shaft",
				["Size"] = Vector3.new(0.26100000739097595, 0.4950000047683716, 0.4729999899864197),
				["CFrame"] = CFrame.new(0.10603714, 0.0299324989, -0.834030151, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/140686130941738.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["blShaft"] = {
				["Instance"] = "Mesh",
				["Name"] = "BottomLeft Shaft",
				["Size"] = Vector3.new(0.2619999945163727, 0.49399998784065247, 0.4729999899864197),
				["CFrame"] = CFrame.new(-0.151844025, 0.0292406082, -0.833906174, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/137906463544311.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["knotSide"] = {
				["Instance"] = "Mesh",
				["Name"] = "Side",
				["Size"] = Vector3.new(0.7229999899864197, 0.4320000112056732, 0.5139999985694885),
				["CFrame"] = CFrame.new(-0.0216178894, -0.000931739807, -0.36333847, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/132249088742638.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["knotBall"] = {
				["Instance"] = "Mesh",
				["Name"] = "Knot",
				["Size"] = Vector3.new(0.39100000262260437, 0.5979999899864197, 0.5450000166893005),
				["CFrame"] = CFrame.new(-0.0220375061, 0.0070643425, -0.374809265, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/114358631982055.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 

			["sheathKnotRetracted"] = {
				["Instance"] = "Mesh",
				["Name"] = "SheathR",
				["Size"] = Vector3.new(0.6069548726081848, 0.4187641739845276, 0.30235612392425537),
				["CFrame"] = CFrame.new(0, 0.0739526749, -0.0534248352, 1, 0, 0, 0, 0.999995112, 0, 0, 0, 0.999995112),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/12921743140.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "MainR",
				},
				["Scale"] = "CockScale",
			}, 
			["mainKnotRetracted"] = {
				["Instance"] = "Mesh",
				["Name"] = "MainR",
				["Size"] = Vector3.new(0.6015185117721558, 0.6395909190177917, 0.39970552921295166),
				["CFrame"] = CFrame.new(0.00248718262, -0.962300539, -0.504486084, 1, -7.98868768e-07, 5.64532854e-07, 8.84762244e-07, 0.98480773, -0.173648059, -4.17234361e-07, 0.173648059, 0.98480773),
				["CFrame1"] = CFrame.new(0.00201797485, 0.00545811653, 0.0592346191, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/12921742575.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "RodPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["ballsKnotRetracted"] = {
				["Instance"] = "Mesh",
				["Name"] = "ballsKnotR",
				["Size"] = Vector3.new(0.6290000081062317, 1.159999966621399, 1.0369999408721924),
				["CFrame"] = CFrame.new(0.000469207764, -0.967758656, -0.563720703, 1, -7.98866836e-07, 5.6453149e-07, 8.84762244e-07, 0.984805346, -0.173647627, -4.17234361e-07, 0.173647627, 0.984805346),
				["CFrame1"] = CFrame.new(-0.0200748444, 0.388033152, 0.00170898438, 0, -0.173647761, -0.984805346, 0, 0.984805346, -0.173647761, 1, 0, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/RoCat Balls.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "BBCBallPhysics",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			}, 
			["retracted"] = {
				["Instance"] = "Mesh",
				["Name"] = "retracted",
				["Size"] = Vector3.new(0.22534088790416718, 0.3669687509536743, 0.21270540356636047),
				["CFrame"] = CFrame.new(-0.00340652466, -0.00379276276, -0.0537834167, 1, 0, 0, 0, 0.342018485, 0.939688206, 0, -0.939688087, 0.342018545),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://15902061210",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "MainR",
				},
				["Scale"] = "CockScale",
			}, 

			["retractedN"] = {
				["Instance"] = "Mesh",
				["Name"] = "retracted",
				["Size"] = Vector3.new(0.22534088790416718, 0.3669687509536743, 0.21270540356636047),
				["CFrame"] = CFrame.new(-0.00340652466, -0.00379276276, -0.0537834167, 1, 0, 0, 0, 0.342018485, 0.939688206, 0, -0.939688087, 0.342018545),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = "rbxassetid://15902061210",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "MainR",
				},
				["Scale"] = "CockScale",
			}, 
			["tipKnotN"] = {
				["Instance"] = "Mesh",
				["Name"] = "tipKnot",
				["Size"] = Vector3.new(0.35600000619888306, 0.30399999022483826, 0.20200000703334808),
				["CFrame"] = CFrame.new(-0.0242080688, 0.0334939957, -1.71375084, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/104258503222570.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["trShaftN"] = {
				["Instance"] = "Mesh",
				["Name"] = "TopRight Shaft",
				["Size"] = Vector3.new(0.2680000066757202, 0.5479999780654907, 0.734000027179718),
				["CFrame"] = CFrame.new(0.109142303, -0.0321941376, -1.34951591, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/93314074748372.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["tlShaftN"] = {
				["Instance"] = "Mesh",
				["Name"] = "TopLeft Shaft",
				["Size"] = Vector3.new(0.26899999380111694, 0.546999990940094, 0.734000027179718),
				["CFrame"] = CFrame.new(-0.155548096, -0.0327558517, -1.34943771, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/139687389487082.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["brShaftN"] = {
				["Instance"] = "Mesh",
				["Name"] = "BottomRight Shaft",
				["Size"] = Vector3.new(0.26100000739097595, 0.4950000047683716, 0.4729999899864197),
				["CFrame"] = CFrame.new(0.10603714, 0.0299324989, -0.834030151, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/140686130941738.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["blShaftN"] = {
				["Instance"] = "Mesh",
				["Name"] = "BottomLeft Shaft",
				["Size"] = Vector3.new(0.2619999945163727, 0.49399998784065247, 0.4729999899864197),
				["CFrame"] = CFrame.new(-0.151844025, 0.0292406082, -0.833906174, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/137906463544311.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["knotSideN"] = {
				["Instance"] = "Mesh",
				["Name"] = "Side",
				["Size"] = Vector3.new(0.7229999899864197, 0.4320000112056732, 0.5139999985694885),
				["CFrame"] = CFrame.new(-0.0216178894, -0.000931739807, -0.36333847, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/132249088742638.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 
			["knotBallN"] = {
				["Instance"] = "Mesh",
				["Name"] = "Knot",
				["Size"] = Vector3.new(0.39100000262260437, 0.5979999899864197, 0.5450000166893005),
				["CFrame"] = CFrame.new(-0.0220375061, 0.0070643425, -0.374809265, -1, 0, 0, 0, 0.984805346, -0.173647761, 0, -0.173647761, -0.984805346),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/114358631982055.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(181.0000044107437, 94.0000019967556, 88.00000235438347),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Main",
				},
				["Scale"] = "CockScale",
			}, 

			["Left Breast Type 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast",
				["MeshId"] = getAsset("RClothesContent/13779805157.mesh"),
				["Size"] = Vector3.new(1.0733778476715088, 1.3004062175750732, 1.0728654861450195),
				["CFrame"] = CFrame.new(-0.30033493, 0.72069788, -0.438274384, 0.999996841, -4.42379047e-07, 2.08616072e-07, -4.42379076e-07, 0.99999994, 6.68224871e-08, 2.08616157e-07, 6.68224942e-08, 1.00000012),
				["CFrame1"] = CFrame.new(0.178162053, -0.44884184, -0.306866258, 0.999048233, 0.0436193869, 2.84217094e-14, 0.0436193869, -0.999048233, 6.39498383e-13, 5.62891883e-14, -6.37649981e-13, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Right Breast Type 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast",
				["MeshId"] = getAsset("RClothesContent/13779805168.mesh"),
				["Size"] = Vector3.new(1.0733778476715088, 1.3004069328308105, 1.0728652477264404),
				["CFrame"] = CFrame.new(0.299663544, 0.720697641, -0.438274384, 0.999996841, -4.42379047e-07, 2.08616072e-07, -4.42379076e-07, 0.99999994, 6.68224871e-08, 2.08616157e-07, 6.68224942e-08, 1.00000012),
				["CFrame1"] = CFrame.new(-0.158737123, -0.448922306, -0.306866258, 0.999048233, -0.0436193869, 2.84217094e-14, -0.0436193869, -0.999048233, 6.39498383e-13, 5.00130604e-16, -6.40129443e-13, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame1"}
			},
			["Left Nipple Type 5"] = {
				["Instance"] = "Part",
				["Name"] = "Nipple",
				--["MeshId"] = getAsset("RClothesContent/13779756984.mesh"),
				--["DoubleSided"] = true,
				["Size"] = Vector3.new(0.6644159555435181, 0.6212737560272217, 0.7335218191146851),
				["CFrame"] = CFrame.new(-0.180159852, 0.113487557, 0.296119392, -1, -2.84217094e-14, 4.63045084e-21, 0, 1.62918866e-07, 1, -2.84217162e-14, 1, -1.62918866e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
				["Function"] = {"NippleType5Mesh", "AreolaDecalType5Create"},
				["Scale"] = "BreastsScale"
			},
			["Right Nipple Type 5"] = {
				["Instance"] = "Part",
				["Name"] = "Nipple",
				--["MeshId"] = getAsset("RClothesContent/13779756939.mesh"),
				--["DoubleSided"] = true,
				["Size"] = Vector3.new(0.6639117002487183, 0.620802104473114, 0.7329651117324829),
				["CFrame"] = CFrame.new(0.181330398, 0.113331951, 0.298346341, -1, -8.7422805e-08, 1.24234289e-21, 5.59067207e-20, 4.37104184e-08, 1, -8.74227979e-08, 1, -4.37104148e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Shape"] = Enum.PartType.Block,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
				["Function"] = {"NippleType5Mesh", "AreolaDecalType5Create"},
				["Scale"] = "BreastsScale"
			},
			-- CLOTHES PARTS
			["School Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "School Shirt",
				["MeshId"] = getAsset("RClothesContent/8708773284.mesh"),
				["Size"] = Vector3.new(1.95, 1.237, 2.063),
				["CFrame"] = CFrame.new(0., 0.395723343, -0.401777267, -4.4567679e-07, 4.7127628e-06, -1, 1.06013331e-05, 1, 4.71275825e-06, 1, -1.06013313e-05, -4.4572667e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["School Collor"] = {
				["Instance"] = "Mesh",
				["Name"] = "Collor",
				["MeshId"] = getAsset("RClothesContent/8708773488.mesh"),
				["Size"] = Vector3.new(1.833, 0.681, 2.05),
				["CFrame"] = CFrame.new(0.0488710403, 0.292836428, -0.00204086304, 1, -7.24058646e-06, -2.78201196e-06, 8.68098778e-06, 0.999997139, -1.66889549e-06, 2.3908276e-06, -1.04128333e-06, 1.00000143),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Recolor"] = "Tertiary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "School Shirt",
				},
			},
			["School Bow"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bow",
				["MeshId"] = getAsset("RClothesContent/8708773674.mesh"),
				["Size"] = Vector3.new(0.87, 1.255, 1.917),
				["CFrame"] = CFrame.new(-0.598809242, -0.0214169025, -0.00198173523, 1, -7.24058646e-06, -2.78201196e-06, 8.68098778e-06, 0.999997139, -1.66889549e-06, 2.3908276e-06, -1.04128333e-06, 1.00000143),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(117, 0, 0)
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "School Shirt",
				},
			},
			["Skirt 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt",
				["MeshId"] = getAsset("RClothesContent/8609086938.mesh"),
				["Size"] = Vector3.new(1.85, 1.405, 2.619),
				["CFrame"] = CFrame.new(-0.0003657341, -0.680291414, 0.209050179, -2.56359476e-06, -2.94868323e-06, -1.00000048, -2.50712965e-05, 0.999999046, -3.85198973e-06, 1, 2.55514824e-05, 1.07363007e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Skirt 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt",
				["MeshId"] = getAsset("RClothesContent/11389496406.mesh"),
				["Size"] = Vector3.new(2.666, 1.507, 2.062),
				["CFrame"] = CFrame.new(0.0089969635, -0.731234312, 0.254065514, -1.00000048, 2.71013369e-06, 3.48198853e-07, 1.80675625e-06, 0.999999046, 9.60324201e-07, -4.78581001e-07, 1.44048965e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17, 17, 17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["School Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Clothes",
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["Size"] = Vector3.new(1.089, 0.983, 1.051),
				["CFrame"] = CFrame.new(0.038, 0.517, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			},
			["School Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Clothes",
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["Size"] = Vector3.new(1.089, 0.983, 1.051),
				["CFrame"] = CFrame.new(-0.038, 0.517, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			},
			["Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra",
				["MeshId"] = getAsset("RClothesContent/11381019021.mesh"),
				["Size"] = Vector3.new(1.86, 1.101, 1.868),
				["CFrame"] = CFrame.new(0.00900268555, 0.499922037, -0.390037537, -1, 5.42022599e-06, -8.69745577e-07, 5.42022826e-06, 1, -2.88098545e-06, 8.69729888e-07, -2.88098977e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Panty"] = {
				["Instance"] = "Mesh",
				["Name"] = "Panty",
				["MeshId"] = getAsset("RClothesContent/11377850676.mesh"),
				["Size"] = Vector3.new(1.783, 1.12, 1.484),
				["CFrame"] = CFrame.new(-1.90734863e-06, -0.912999868, 0.160000801, -1, 5.42022508e-06, -1.01899627e-06, 5.42022826e-06, 1, -2.88098499e-06, 1.01898058e-06, -2.88099e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248, 248, 248)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Apron 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Apron",
				["MeshId"] = getAsset("RClothesContent/6491183076.mesh"),
				["Size"] = Vector3.new(1.893, 2.61, 1.989),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.251567364, -0.391598701, -1.83562111e-06, 1.28747515e-05, 1, -6.72226906e-06, 1, -1.28747643e-05, -1, -6.72229271e-06, -1.83553448e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(231, 231, 236)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Apron 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Apron",
				["MeshId"] = getAsset("RClothesContent/11405661031.mesh"),
				["Size"] = Vector3.new(2.001, 3.588, 1.835),
				["CFrame"] = CFrame.new(0, -0.756999969, -0.472000122, -1, -3.24366835e-12, 1.50995803e-07, 3.24366835e-12, 1, -4.8978031e-19, -1.50995803e-07, 0, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(117, 0, 0)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Bodyless Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Shirt",
				["MeshId"] = getAsset("RClothesContent/9867233353.mesh"),
				["Size"] = Vector3.new(2.121, 0.538, 1.158),
				["CFrame"] = CFrame.new(1.71661377e-05, 0.797148228, 0.00380325317, 1, 6.32340789e-06, -1.3013792e-07, -6.32385991e-06, 1, -4.80156132e-07, 1.3065187e-07, 4.80156814e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			},
			["Bodyless Neck"] = {
				["Instance"] = "Mesh",
				["Name"] = "Neck",
				["MeshId"] = getAsset("RClothesContent/4342469442.mesh"),
				["Size"] = Vector3.new(1.312, 0.301, 1.354),
				["CFrame"] = CFrame.new(0.00418663025, 1.09489012, 0.00360298157, 1, -5.37213937e-12, 6.13908924e-12, -5.37213937e-12, 1, -1.63373362e-23, 6.13908924e-12, -1.63373346e-23, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			},
			["Bodyless Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve",
				["MeshId"] = getAsset("RClothesContent/9867233367.mesh"),
				["Size"] = Vector3.new(1.175, 1.87, 1.133),
				["CFrame"] = CFrame.new(-0.0374875069, 0.0970358849, 0, 1, 6.3234088e-06, -1.30139284e-07, -6.32385809e-06, 0.999999881, -4.80156075e-07, 1.30650506e-07, 4.80156814e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Bodyless Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve",
				["MeshId"] = getAsset("RClothesContent/9867233360.mesh"),
				["Size"] = Vector3.new(1.175, 1.87, 1.133),
				["CFrame"] = CFrame.new(0.0415430069, 0.0967195034, 0.0065574646, 1, 6.3234138e-06, -1.30144741e-07, -6.32385309e-06, 0.999999881, -4.80156075e-07, 1.30645049e-07, 4.80156814e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17,17,17)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Dress Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra",
				["MeshId"] = getAsset("RClothesContent/8811986211.mesh"),
				["TextureId"] = getAsset("RClothesContent/395191839.png"),
				["Size"] = Vector3.new(2.054, 1.488, 2),
				["CFrame"] = CFrame.new(1.90734863e-05, 0.295036316, -0.409999847, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163, 162, 165)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Dress Rope"] = {
				["Instance"] = "Mesh",
				["Name"] = "Rope",
				["MeshId"] = getAsset("RClothesContent/8811988447.mesh"),
				["Size"] = Vector3.new(1.463, 0.492, 1.826),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.292956591, -0.172002792, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(204, 187, 198)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Dress Skirt In"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt In",
				["MeshId"] = getAsset("RClothesContent/8811988165.mesh"),
				["Size"] = Vector3.new(2.052, 1.423, 2.684),
				["CFrame"] = CFrame.new(3.81469727e-06, -0.948948383, 0.077996254, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(204, 187, 198)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Dress Skirt Out"] = {
				["Instance"] = "Mesh",
				["Name"] = "Skirt Out",
				["MeshId"] = getAsset("RClothesContent/8811987828.mesh"),
				["TextureId"] = getAsset("RClothesContent/395191839.png"),
				["Size"] = Vector3.new(2.139, 1.438, 2.702),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.83894968, 0.0949964523, 6.08214521e-07, 1.17440368e-05, -1, 2.40081545e-06, 1, 1.17440377e-05, 1, -2.4008225e-06, 6.08186326e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163, 162, 165)
				},
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress"] = {
				["Instance"] = "Mesh",
				["Name"] = "Dress",
				["MeshId"] = getAsset("RClothesContent/8533956808.mesh"),
				["Size"] = Vector3.new(2.55, 2.649, 2.777),
				["CFrame"] = CFrame.new(7.62939453e-06, -0.255959034, -0.136188507, -5.48989405e-08, -1.88403271e-09, -1, -4.65476489e-07, 1, -1.88494753e-09, 1, 4.65473931e-07, -5.48980879e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Bottom"] = {
				["Instance"] = "Mesh",
				["Name"] = "Dress Bottom",
				["MeshId"] = getAsset("RClothesContent/8533957053.mesh"),
				["Size"] = Vector3.new(2.253, 1.889, 3.177),
				["CFrame"] = CFrame.new(0.0135879517, -0.964025736, 0.237159729, -5.42543361e-08, 1.51019786e-09, -1, -4.65476489e-07, 1, -1.88494731e-09, 1, 4.92539243e-07, -5.55426922e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(219, 219, 219)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			},
			["Birdly Dress Sling"] = {
				["Instance"] = "Mesh",
				["Name"] = "Sling",
				["MeshId"] = getAsset("RClothesContent/8533957545.mesh"),
				["Size"] = Vector3.new(2.003, 1.454, 1.783),
				["CFrame"] = CFrame.new(-0.0349998474, 0.305000067, -0.469562531, -4.3711843e-08, -1.44881884e-09, -1, -4.69112194e-07, 1, -1.44980017e-09, 1, 4.69109466e-07, -4.37109335e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202, 203, 209)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Mail 1"] = {
				["Instance"] = "Part",
				["Name"] = "Mail 1",
				["Shape"] = Enum.PartType.Cylinder,
				["Size"] = Vector3.new(0.313, 0.762, 0.704),
				["CFrame"] = CFrame.new(0.0663223267, -0.0400261879, 0.839624405, 0.57357651, -7.94940647e-08, 0.819150627, 0.819151998, -5.04924913e-07, -0.573575318, 4.75954096e-07, 1, -2.35058806e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202, 203, 209)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Mail 2"] = {
				["Instance"] = "Part",
				["Name"] = "Mail 2",
				["Shape"] = Enum.PartType.Cylinder,
				["Size"] = Vector3.new(0.308, 0.727, 0.693),
				["CFrame"] = CFrame.new(0.653236389, 0.786733389, 0.835962296, 0.57357651, -7.94940647e-08, 0.819150627, 0.819151998, -5.04924913e-07, -0.573575318, 4.75954096e-07, 1, -2.35058806e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202, 203, 209)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Mail 3"] = {
				["Instance"] = "Part",
				["Name"] = "Mail 3",
				["Shape"] = Enum.PartType.Cylinder,
				["Size"] = Vector3.new(2.126, 0.704, 0.681),
				["CFrame"] = CFrame.new(0.355201721, 0.356162071, 0.838983536, 0.57357651, -7.94940647e-08, 0.819150627, 0.819151998, -5.04924913e-07, -0.573575318, 4.75954096e-07, 1, -2.35058806e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Birdly Dress Right Sleeve"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve",
				["MeshId"] = getAsset("RClothesContent/8477756263.mesh"),
				["Size"] = Vector3.new(1.068, 1.202, 1.052),
				["CFrame"] = CFrame.new(-0.0390014648, -0.245999813, 0.00850009918, 1.13686838e-13, 3.7566391e-13, 1, 3.41060459e-13, 0.999999881, 1.25221285e-13, -1, -1.02318154e-12, -3.41060513e-13),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(219, 219, 219)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Birdly Dress Right Sleeve 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve 2",
				["MeshId"] = getAsset("RClothesContent/8533957322.mesh"),
				["Size"] = Vector3.new(1.059, 0.947, 1.152),
				["CFrame"] = CFrame.new(-0.0125274658, -0.134218693, 0.00903892517, -4.9860995e-07, -1.62974948e-06, -0.999995708, -9.83640348e-06, 0.99999845, -2.19345497e-06, 1.00000191, 1.45387166e-05, -7.21604636e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			},
			["Birdly Dress Left Sleeve"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve",
				["MeshId"] = getAsset("RClothesContent/8477756263.mesh"),
				["Size"] = Vector3.new(1.068, 1.202, 1.052),
				["CFrame"] = CFrame.new(0.0390014648, -0.250999689, 0.00899982452, -4.37112746e-08, -3.23716395e-13, 1, -1.59999963e-05, 0.999999881, 1.25221299e-13, -1, -1.6e-05, -4.37117293e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(219, 219, 219)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Birdly Dress Left Sleeve 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve 2",
				["MeshId"] = getAsset("RClothesContent/8533957322.mesh"),
				["Size"] = Vector3.new(1.059, 0.947, 1.152),
				["CFrame"] = CFrame.new(0.0060005188, -0.133999825, 0.00899982452, -4.37106387e-08, 2.26175061e-07, 1, 2.81108601e-06, 0.999999881, -2.26174407e-07, -1, 2.81108487e-06, -4.37117293e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			},
			["Right Shoe"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe",
				["MeshId"] = getAsset("RClothesContent/6860788547.mesh"),
				["Size"] = Vector3.new(1.108, 0.771, 1.15),
				["CFrame"] = CFrame.new(-7.62939453e-06, -0.689962208, 0.0800008774, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
				},
			},
			["Left Shoe"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe",
				["MeshId"] = getAsset("RClothesContent/6860787685.mesh"),
				["Size"] = Vector3.new(1.108, 0.771, 1.15),
				["CFrame"] = CFrame.new(-7.62939453e-06, -0.689962208, 0.0800008774, -4.37113883e-08, 0, -1, 0, 1, 0, 1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(34, 34, 34)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
				},
			},
			["Right Sock"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sock",
				["MeshId"] = getAsset("RClothesContent/6721517477.mesh"),
				["Size"] = Vector3.new(1.296, 1.524, 1.189),
				["CFrame"] = CFrame.new(0.0279846191, -0.307503283, 0.0619983673, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237, 234, 234)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
				},
				["Function"] = "TurtleTexture"
			},
			["Left Sock"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sock",
				["MeshId"] = getAsset("RClothesContent/6721513769.mesh"),
				["Size"] = Vector3.new(1.296, 1.524, 1.189),
				["CFrame"] = CFrame.new(-0.0279998779, -0.307499111, 0.0620002747, -4.37113883e-08, 0, 1, 0, 1, 0, -1, 0, -4.37113883e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237, 234, 234)
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
				},
				["Function"] = "TurtleTexture"
			},
			["Killer Sweater"] = {
				["Instance"] = "Mesh",
				["CFrame"] = CFrame.new(1.14440918e-05, -0.0547757149, -0.143913269, -1.00000191, 8.13039424e-06, -2.1779843e-07, 4.51686174e-06, 0.999996185, -4.80170343e-07, -3.03737522e-07, 1.44048386e-06, -1),
				["Color"] = {
					["Color"] = Color3.fromRGB(215, 215, 215),
					["Tone"] = "Base"
				},
				["Recolor"] = "Primary",
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10080455422.mesh"),
				["Name"] = "Sweater",
				["Parent"] = {
					[1] = "Torso"
				},
				["Size"] = Vector3.new(2.621, 2.224, 2.378),
				["Transparency"] = 0,
				["Function"] = "TurtleTexture"
			},
			["Killer Sweater Tie"] = {
				["Instance"] = "Mesh",
				["CFrame"] = CFrame.new(-6.48498535e-05, 0.589792967, -0.781671524, -1, 3.46809134e-06, 1.14109309e-06, 3.61355137e-06, 0.984807909, 0.173647463, -5.21532229e-07, 0.173647463, -0.984807909),
				["Color"] = {
					["Color"] = Color3.fromRGB(215, 215, 215),
					["Tone"] = "Base"
				},
				["Recolor"] = "Primary",
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/4729777667.mesh"),
				["Name"] = "Tie",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Sweater"
				},
				["Size"] = Vector3.new(0.645, 1.120, 0.144),
				["Transparency"] = 0
			},
			["Killer Sweater Neck"] = {
				["Instance"] = "Mesh",
				["CFrame"] = CFrame.new(-7.62939453e-06, 1.13563347, -0.154616356, -1, 3.61355274e-06, 6.08947687e-07, 3.6135516e-06, 1, -1.92066636e-06, -6.08954679e-07, -1.92066432e-06, -1),
				["Color"] = {
					["Color"] = Color3.fromRGB(163, 162, 165),
					["Tone"] = "Base"
				},
				["Recolor"] = "Secondary",
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/4342469442.mesh"),
				["Name"] = "Neck",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Sweater"
				},
				["Size"] = Vector3.new(1.209999918937683, 0.18462184071540833, 1.2289236783981323),
				["Transparency"] = 0
			},
			["Cow Bra"] = {
				["CFrame"] = CFrame.new(-0.00286865234, 0.475341082, -0.362598419, -6.51926314e-07, 1.17439922e-05, 1.00000191, -2.4008159e-06, 0.999996185, -8.13043971e-06, -1, -4.80170684e-07, -1.30372001e-07),
				["Color"] = {
					["Color"] = Color3.fromRGB(248, 248, 248),
					["Tone"] = "Base"
				},
				["Instance"] = "Mesh",
				["Material"] = Enum.Material.Fabric,
				["MeshId"] = getAsset("RClothesContent/6297176322.mesh"),
				["Name"] = "Bra",
				["Parent"] = {
					[1] = "Torso"
				},
				["Size"] = Vector3.new(1.8829039335250854, 1.1392192840576172, 1.8722314834594727),
				["TextureId"] = getAsset("RClothesContent/12038926049.png"),
				["Transparency"] = 0
			},
			["Cow Panty"] = {
				["CFrame"] = CFrame.new(5.7220459e-06, -0.986361265, 0.0423326492, -1.30375597e-07, 8.13039424e-06, 1.00000191, -4.80171025e-07, 0.999996185, -4.51686174e-06, -1, 1.44048408e-06, 3.91160427e-07),
				["Color"] = {
					["Color"] = Color3.fromRGB(248, 248, 248),
					["Tone"] = "Base"
				},
				["Instance"] = "Mesh",
				["Material"] = Enum.Material.Fabric,
				["MeshId"] = getAsset("RClothesContent/6297229742.mesh"),
				["Name"] = "Panty",
				["Parent"] = {
					[1] = "Torso"
				},
				["Size"] = Vector3.new(1.1498957872390747, 0.9570162296295166, 1.8741321563720703),
				["TextureId"] = getAsset("RClothesContent/12038931250.png"),
				["Transparency"] = 0
			},
			["Right Bunny Band"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Bunny Band",
				["Size"] = Vector3.new(1.0540573596954346, 0.4127587676048279, 1.6175404787063599),
				["CFrame"] = CFrame.new(0.249682188, -0.632135391, -0.000693321228, -1.30402327e-07, 9.93718913e-06, -1.00000191, -4.80150504e-07, 0.999996066, 6.32364572e-06, 1, 2.40081181e-06, -6.51925802e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6861074681.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Arm"
				},
				["Function"] = "BunnyBandPin"
			}, 
			["Bow"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bow",
				["Size"] = Vector3.new(0.4615969657897949, 0.24014821648597717, 0.14512182772159576),
				["CFrame"] = CFrame.new(-0.00239944458, 0.94911027, -0.584125519, 1.00000191, 7.52851292e-06, -6.48738978e-06, -6.32364663e-06, 0.766041756, -0.642784894, 6.51925802e-07, 0.642788827, 0.766043425),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/4596067364.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(25.000000409781933, 25.000000409781933, 25.000000409781933),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Left Bunny Band"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Bunny Band",
				["Size"] = Vector3.new(1.0540573596954346, 0.4127587676048279, 1.6175404787063599),
				["CFrame"] = CFrame.new(-0.250300884, -0.632102489, -0.000693321228, 1.30402327e-07, 9.93718913e-06, 1.00000191, 4.80150504e-07, 0.999996066, -6.32364572e-06, -1, 2.40081181e-06, 6.51925802e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6861074681.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Arm"
				},
				["Function"] = "BunnyBandPin"
			}, 
			["Bunny Tail"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bunny Tail",
				["Size"] = Vector3.new(0.4436146914958954, 0.38189801573753357, 0.4354999363422394),
				["CFrame"] = CFrame.new(-0.000400066376, -0.507106781, 0.837873459, -1.30402327e-07, 9.93718913e-06, -1.00000191, -4.80150561e-07, 0.999996185, 6.32364663e-06, 1, 2.40081181e-06, -6.51925802e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/5620377615.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Tertiary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Torso String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso String",
				["Size"] = Vector3.new(1.0775585174560547, 0.7826404571533203, 2.07892107963562),
				["CFrame"] = CFrame.new(-0.00040102005, -0.65, -0.00508785248, -1.30402327e-07, 9.93718913e-06, -1.00000191, -4.80150561e-07, 0.999996185, 6.32364663e-06, 1, 2.40081181e-06, -6.51925802e-07),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6859161870.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0,0,0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "StringTexture"
			}, 
			["Bunny Suit"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bunny Suit",
				["Size"] = Vector3.new(2.4018478393554688, 1.802707552909851, 1.9974936246871948),
				["CFrame"] = CFrame.new(-0.000400781631, -0.583568573, -0.142845154, -1.30402327e-07, 9.93718913e-06, -1.00000191, -4.80150561e-07, 0.999996185, 6.32364663e-06, 1, 2.40081181e-06, -6.51925802e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6858823726.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "ToarBreastsOffset"
			}, 
			["Bunny Ears"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bunny Ears",
				["Size"] = Vector3.new(1.9797463417053223, 1.5675334930419922, 0.9315749406814575),
				["CFrame"] = CFrame.new(-0.0499756336, 1.00000286, -0.400989532, 1.00000191, 9.93718913e-06, -1.30402327e-07, -6.32364663e-06, 0.999996185, -4.80150561e-07, 6.51925802e-07, 2.40081181e-06, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/227430350.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/709231552.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Right Leg String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg String",
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				["CFrame"] = CFrame.new(-0.000350952148, -2.38418579e-07, 0.000198364258, 1, -6.42401909e-10, 5.82085699e-11, 6.44266418e-10, 1, 3.74475617e-20, -5.82085699e-11, -5.42651863e-23, 1),
				--["Size"] = Vector3.new(1.2139999866485596, 2.180999994277954, 1.2020000219345093),
				--["CFrame"] = CFrame.new(0.036002636, 0.0627008677, 0.0440006256, 5.10434063e-07, 3.83933411e-06, -1.00000405, 2.04068738e-06, 0.999991536, -3.83933548e-06, 1, 2.0406876e-06, -5.97857024e-07),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				--["MeshId"] = getAsset("RClothesContent/7332415457.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0,0,0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Leg Mesh"
				},
				["Function"] = "StringTexture"
			}, 
			["Left Leg String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg String",
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				["CFrame"] = CFrame.new(-0.000350952148, -2.38418579e-07, 0.000198364258, 1, -6.42401909e-10, 5.82085699e-11, 6.44266418e-10, 1, 3.74475617e-20, -5.82085699e-11, -5.42651863e-23, 1),
				--["Size"] = Vector3.new(1.2139999866485596, 2.180999994277954, 1.2020000219345093),
				--["CFrame"] = CFrame.new(-0.0349985957, 0.0630007982, 0.0440015793, 5.10434063e-07, 3.83933411e-06, -1.00000405, 2.04068738e-06, 0.999991536, -3.83933548e-06, 1, 2.0406876e-06, -5.97857024e-07),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				--["MeshId"] = getAsset("RClothesContent/7332360863.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0,0,0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Leg Mesh"
				},
				["Function"] = "StringTexture"
			}, 
			["Left Butt String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt String",
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				--["Size"] = Vector3.new(1.253000020980835, 1.2400000095367432, 1.2640000581741333),
				["CFrame"] = CFrame.new(0,0,0),
				--["CFrame"] = CFrame.new(-0.531559527, -0.961991549, 0.329221725, -1.00000381, 3.73439707e-06, -5.2154769e-07, -3.73439661e-06, 0.999992371, -1.9206509e-06, -5.21547918e-07, 1.9206509e-06, -1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				--["MeshId"] = getAsset("RClothesContent/11617724988.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Function"] = "StringTexture"
			}, 
			["Right Butt String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt String",
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				--["Size"] = Vector3.new(1.253000020980835, 1.2400000095367432, 1.2640000581741333),
				["CFrame"] = CFrame.new(0,0,0),
				--["CFrame"] = CFrame.new(0.531559527, -0.961991549, 0.329221725, 1.00000381, 3.73836701e-06, 5.21722257e-07, 3.73908415e-06, 0.999992371, 1.92064363e-06, 5.21373238e-07, 1.92065818e-06, 1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				--["MeshId"] = getAsset("RClothesContent/11617724536.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Function"] = "StringTexture"
			}, 
			["Pussy String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy String",
				["MeshId"] = getAsset("RClothesContent/17633723189.mesh"),
				["Size"] = Vector3.new(0.825, 0.881, 0.83),
				["CFrame"] = CFrame.new(-0.00103759766, -0.925573111, -0.0344238281, -1, 0, 0, 1.1765762e-13, 1, 0, 0, 0, -1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "StringTexture"
			},
			["Kitty Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Bra",
				["Size"] = Vector3.new(1.9721193313598633, 1.0569336414337158, 2.2100000381469727),
				["CFrame"] = CFrame.new(-0.0158348083, 0.137589216, -0.375313759, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755484302.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Ears"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Ears",
				["Size"] = Vector3.new(1.2489010095596313, 0.5518813133239746, 0.04031287133693695),
				["CFrame"] = CFrame.new(9.53674316e-06, 0.838002682, -0.133995056, 1.00000191, 6.32366346e-06, -3.91171568e-07, -2.71014164e-06, 0.999996185, -1.44047965e-06, 9.12697146e-07, 3.36114272e-06, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6552973009.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6552973038.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Right Kitty Band Black"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Kitty Band Black",
				["Size"] = Vector3.new(1.22230064868927, 0.24095074832439423, 1.1991701126098633),
				["CFrame"] = CFrame.new(0.0173130035, 0.400683284, 0.0307683945, 3.91171568e-07, 0.140735254, 0.990049183, 1.44047942e-06, 0.990043938, -0.140730858, -1, 3.4561358e-06, 4.30604814e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755489604.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Right Kitty Band Pink"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Kitty Band Pink",
				["Size"] = Vector3.new(1.2141307592391968, 0.14765559136867523, 1.189651608467102),
				["CFrame"] = CFrame.new(0.0169596672, 0.398624897, 0.0307683945, 3.91171568e-07, 0.140735254, 0.990049183, 1.44047942e-06, 0.990043938, -0.140730858, -1, 3.4561358e-06, 4.30604814e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755488785.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 145.00000655651093, 187.00000405311584),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Kitty Panty"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Panty",
				["Size"] = Vector3.new(1.4091557264328003, 1.1474609375, 1.8525354862213135),
				["CFrame"] = CFrame.new(-6.19888306e-06, -0.942862988, 0.134953499, 3.47460087e-07, 6.32366346e-06, 1.00000191, 1.44047976e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 8.68985751e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755486346.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Left Kitty Panty Paw"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Kitty Panty Paw",
				["Size"] = Vector3.new(0.2164660096168518, 0.17595499753952026, 0.17607498168945312),
				["CFrame"] = CFrame.new(-1.10927677, -0.976359367, -0.527161598, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755510910.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6755510955.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Left Kitty Panty String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Kitty Panty String",
				["Size"] = Vector3.new(0.24030999839305878, 0.4237639904022217, 0.22017496824264526),
				["CFrame"] = CFrame.new(-0.939169407, -0.702218771, -0.459594727, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755513230.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Right Kitty Panty Paw"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Kitty Panty Paw",
				["Size"] = Vector3.new(0.23073700070381165, 0.19345200061798096, 0.11431992053985596),
				["CFrame"] = CFrame.new(1.09738016, -0.995746374, -0.421038628, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755512558.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6755512610.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Right Kitty Panty String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Kitty Panty String",
				["Size"] = Vector3.new(0.19103001058101654, 0.4363189935684204, 0.2340969443321228),
				["CFrame"] = CFrame.new(0.958770752, -0.695994139, -0.425095558, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755511825.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Tail"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Tail",
				["Size"] = Vector3.new(1.6323256492614746, 2.419999837875366, 0.39649876952171326),
				["CFrame"] = CFrame.new(-0.0492196083, 0.450606108, 1.06449509, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/6747382163.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Black Collar"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Black Collar",
				["Size"] = Vector3.new(1.2043366432189941, 0.4051337242126465, 1.3428915739059448),
				["CFrame"] = CFrame.new(5.7220459e-06, 0.895759344, -0.0647373199, 1.00000191, 6.32366346e-06, -3.91171568e-07, -2.71014164e-06, 0.999996185, -1.44047965e-06, 9.12697146e-07, 3.36114272e-06, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/4487737814.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/4503276365.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Left Kitty Bra String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Kitty Bra String",
				["Size"] = Vector3.new(1.5687050819396973, 0.4173647165298462, 0.10608401894569397),
				["CFrame"] = CFrame.new(-0.600448608, 0.825362921, -0.182882309, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755487966.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Right Kitty Bra String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Kitty Bra String",
				["Size"] = Vector3.new(1.561113715171814, 0.4175761640071869, 0.10608401894569397),
				["CFrame"] = CFrame.new(0.568787098, 0.825255632, -0.179076195, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755487288.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Bra Top Whiskers"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Bra Top Whiskers",
				["Size"] = Vector3.new(0.05027654394507408, 0.09344801306724548, 0.8574493527412415),
				["CFrame"] = CFrame.new(-0.0150403976, 0.318082809, -1.26292038, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/6764807950.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 145.00000655651093, 187.00000405311584),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Bra Middle Whiskers"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Bra Middle Whiskers",
				["Size"] = Vector3.new(0.05217599868774414, 0.026417016983032227, 0.9154670238494873),
				["CFrame"] = CFrame.new(-0.0169978142, 0.197001457, -1.33299923, 3.47460087e-07, 6.32366346e-06, 1.00000191, 1.44047976e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 8.68985751e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/6764749054.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 145.00000655651093, 187.00000405311584),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Bra Bottom Whiskers"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Bra Bottom Whiskers",
				["Size"] = Vector3.new(0.05000000074505806, 0.10528962314128876, 0.7846659421920776),
				["CFrame"] = CFrame.new(-0.0162010193, 0.0697808266, -1.3160944, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755508155.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 145.00000655651093, 187.00000405311584),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Kitty Bra Cat"] = {
				["Instance"] = "Mesh",
				["Name"] = "Kitty Bra Cat",
				["Size"] = Vector3.new(0.23005041480064392, 0.5448338389396667, 0.5179228186607361),
				["CFrame"] = CFrame.new(-0.0158338547, 0.233896255, -1.20333481, 3.91171568e-07, 6.32366346e-06, 1.00000191, 1.44047965e-06, 0.999996185, -2.71014164e-06, -1, 3.36114272e-06, 9.12697146e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6755507454.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 145.00000655651093, 187.00000405311584),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Side Skirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Side Skirt",
				["Size"] = Vector3.new(2.3988521099090576, 1.9694759845733643, 1.7265270948410034),
				["CFrame"] = CFrame.new(-0.00039768219, -1.25011444, 0.194470406, -1.00000381, 5.42021326e-06, -1.30387627e-06, -1.80679251e-06, 0.999992371, -4.80162407e-06, 2.60781945e-07, -9.60322382e-07, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/5971239783.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Workwear Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Workwear Shirt",
				["Size"] = Vector3.new(2.166167736053467, 1.366474986076355, 1.8761940002441406),
				["CFrame"] = CFrame.new(1.90734863e-06, 0.343997478, -0.375999451, 1.00000191, 5.42023372e-06, 7.82324321e-07, -1.80671861e-06, 0.999996185, 2.88097726e-06, -2.60770037e-07, -9.60333523e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6671745090.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(63.000000044703484, 63.000000044703484, 63.000000044703484),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "FabricTexture"
			}, 
			["Left Workwear Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Workwear Arm",
				["Size"] = Vector3.new(1.1083070039749146, 1.8436574935913086, 1.108305811882019),
				["CFrame"] = CFrame.new(0.0396080017, 0.0808815956, -0.000538825989, -1.00000191, 5.42023372e-06, -7.82324321e-07, 1.80671839e-06, 0.999996066, -2.88097681e-06, 2.60770037e-07, -9.60333523e-07, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(63.000000044703484, 63.000000044703484, 63.000000044703484),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm"
				},
				["Function"] = "FabricTexture"
			}, 
			["Right Workwear Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Workwear Arm",
				["Size"] = Vector3.new(1.1083039045333862, 1.8441107273101807, 1.1083028316497803),
				["CFrame"] = CFrame.new(-0.040397644, 0.081091404, -0.000540733337, 1.00000191, 5.42023372e-06, 7.82324321e-07, -1.80671839e-06, 0.999996066, 2.88097681e-06, -2.60770037e-07, -9.60333523e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(63.000000044703484, 63.000000044703484, 63.000000044703484),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm"
				},
				["Function"] = "FabricTexture"
			},
			["Bodysuit"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bodysuit",
				["Size"] = Vector3.new(2.102139949798584, 2.4996907711029053, 2.250253915786743),
				["CFrame"] = CFrame.new(-0.00216674805, -0.184390783, -0.217723846, 1.00000191, 5.42023372e-06, 7.82324321e-07, -1.80671861e-06, 0.999996185, 2.88097726e-06, -2.60770037e-07, -9.60333523e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6671818838.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			},
			["String Bikini"] = {
				["Instance"] = "Mesh",
				["Name"] = "String Bikini",
				["Size"] = Vector3.new(1.3721306324005127, 2.5299999713897705, 2.2300000190734863),
				["CFrame"] = CFrame.new(-1.90734863e-06, -0.212999821, -0.229743958, 1, 1.35507053e-05, -1.30411507e-07, -1.35507053e-05, 1, -4.80143228e-07, 1.30405496e-07, 4.80145786e-07, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6745689310.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "ToarBreastsOffset"
			}, 
			["Left Cross Tape"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Cross Tape",
				["Size"] = Vector3.new(0.48899999260902405, 0.3409999907016754, 0.5080000162124634),
				["CFrame"] = CFrame.new(-0.492490768, -0.214658141, 0.00777053833, -0.147934914, -0.964880586, 0.217073083, -0.953003764, 0.197749659, 0.229518548, -0.264384061, -0.172917604, -0.94878912),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6567309030.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast"
				},
			}, 
			["Right Cross Tape"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Cross Tape",
				["Size"] = Vector3.new(0.48865801095962524, 0.34089401364326477, 0.5081570148468018),
				["CFrame"] = CFrame.new(-0.491999626, -0.215000153, -0.00799942017, 0.151539236, -0.967152357, 0.204088852, 0.95300144, 0.197756082, 0.229523182, -0.262343675, 0.159715176, 0.951665103),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6567308335.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast"
				},
			},
			["Bra 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra 2",
				["Size"] = Vector3.new(1.8899999856948853, 1.4352024793624878, 2.078070640563965),
				["CFrame"] = CFrame.new(0, 0.343346596, -0.393656731, 1.26016982e-06, 9.03369892e-06, -1.00000191, 4.80163362e-06, 0.999996185, 5.42016687e-06, 1, -2.88100068e-06, 7.38593769e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6697964510.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Panty 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Panty 2",
				["Size"] = Vector3.new(1.789075255393982, 1.1999999284744263, 1.5199999809265137),
				["CFrame"] = CFrame.new(-9.53674316e-06, -0.942420244, 0.204673767, 1.00000191, 9.12287305e-06, -2.84610906e-07, -5.42016687e-06, 0.984804869, -0.173642576, -7.82305165e-07, 0.173645124, 0.984808266),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6668707772.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			},
			["Collar"] = {
				["Instance"] = "Mesh",
				["Name"] = "Collar",
				["Size"] = Vector3.new(1.5257108211517334, 0.3845224380493164, 1.297229528427124),
				["CFrame"] = CFrame.new(9.89437103e-06, 0.999995947, 1.90734863e-06, 1.00000191, 9.93718913e-06, -1.30402327e-07, -6.32364663e-06, 0.999996185, -4.80150561e-07, 6.51925802e-07, 2.40081181e-06, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/4857299880.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = "",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Breasts Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Shirt",
				["Size"] = Vector3.new(1.24, 1.385, 1.89),
				["CFrame"] = CFrame.new(0, 0.689, -0.419) * CFrame.Angles(0, math.rad(-90.75), math.rad(-10)),
				["CFrame1"] = CFrame.new(0, 0.3, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7606070501.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame", ["CFrame1"] = 4.5},
				["Function"] = {"TorsoShirtTexture", "BreastPhysics"},
			}, 
			["Breasts Pants"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Pants",
				["Size"] = Vector3.new(1.239, 1.384, 1.889),
				["CFrame"] = CFrame.new(0, 0.689, -0.419) * CFrame.Angles(0, math.rad(-90.75), math.rad(-10)),
				["CFrame1"] = CFrame.new(0, 0.3, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7606070501.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", "CFrame", ["CFrame1"] = 4.5},
				["Function"] = {"TorsoPantsTexture", "BreastPhysics"},
			},
			["Torso Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Shirt",
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				["CFrame"] = CFrame.new(-0.000350952148, -2.38418579e-07, 0.000198364258, 1, -6.42401909e-10, 5.82085699e-11, 6.44266418e-10, 1, 3.74475617e-20, -5.82085699e-11, -5.42651863e-23, 1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Torso Mesh"
				},
				["MeshBasePartTransparency"] = 1,
				["Function"] = "TorsoShirtTexture",
			},
			["Right Butt Shirt Type1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Shirt",
				["MeshId"] = getAsset("RClothesContent/13181475636.mesh"),
				["Size"] = Vector3.new(1.248, 0.563, 1.259),
				["CFrame"] = CFrame.new(0, 0.339, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Scale"] = "ButtsScale",
				["Function"] = "TorsoShirtTexture"
			},
			["Left Butt Shirt Type1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Shirt",
				["MeshId"] = getAsset("RClothesContent/13181475635.mesh"),
				["Size"] = Vector3.new(1.248, 0.563, 1.259),
				["CFrame"] = CFrame.new(0, 0.339, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Scale"] = "ButtsScale",
				["Function"] = "TorsoShirtTexture"
			},
			["Right Butt Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Shirt",
				--[[
				["MeshId"] = getAsset("RClothesContent/13181475636.mesh"),
				["Size"] = Vector3.new(1.248, 0.563, 1.259),
				["CFrame"] = CFrame.new(0, 0.339, 0),
				["Scale"] = "ButtsScale",
				]]
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				["CFrame"] = CFrame.new(0, 0.01, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Function"] = "TorsoShirtTexture",
			},
			["Left Butt Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Shirt",
				--[[
				["MeshId"] = getAsset("RClothesContent/13181475635.mesh"),
				["Size"] = Vector3.new(1.248, 0.563, 1.259),
				["CFrame"] = CFrame.new(0, 0.339, 0),
				["Scale"] = "ButtsScale",
				]]
				["MeshId"] = "Parent",
				["Size"] = "Overlay",
				["CFrame"] = CFrame.new(0, 0.01, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Function"] = "TorsoShirtTexture",
			},
			["Right Butt Shirt Method2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Shirt",
				--[[
				["MeshId"] = getAsset("RClothesContent/13181475636.mesh"),
				["Size"] = Vector3.new(1.248, 0.563, 1.259),
				["CFrame"] = CFrame.new(0, 0.339, 0),
				["Scale"] = "ButtsScale",
				]]
				["MeshId"] = "Parent",
				["Size"] = "Underlay",
				["CFrame"] = CFrame.new(0, 0.01, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Function"] = "TorsoShirtTexture",
			},
			["Left Butt Shirt Method2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Shirt",
				--[[
				["MeshId"] = getAsset("RClothesContent/13181475635.mesh"),
				["Size"] = Vector3.new(1.248, 0.563, 1.259),
				["CFrame"] = CFrame.new(0, 0.339, 0),
				["Scale"] = "ButtsScale",
				]]
				["MeshId"] = "Parent",
				["Size"] = "Underlay",
				["CFrame"] = CFrame.new(0, 0.01, 0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Function"] = "TorsoShirtTexture",
			},
			["Left Breast 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast 2",
				["Size"] = Vector3.new(1.242, 1.252, 0.993),
				["CFrame"] = CFrame.new(-0.00666618347, -0.00726795197, 0.34, 0.922279179, -0.191880912, 0.335533708, 0.0711436272, 0.937517881, 0.340585262, -0.379920751, -0.290244073, 0.878304482),
				--["CFrame"] = CFrame.new(-0.360874176, 0.38800168, -0.483547688, 0.36783731, 0.290563017, -0.883328319, -0.0900876448, 0.956592739, 0.27714473, 0.925514758, -0.0223651696, 0.378048182),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7220038121.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt"
				},
				["Scale"] = "BreastsScale",
				["Function"] = "AreolaDecalCreate",
			},
			["Right Breast 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast 2",
				["Size"] = Vector3.new(1.242, 1.252, 0.993),
				["CFrame"] = CFrame.new(-0.00666618347, -0.00726795197, -0.34, 0.922279179, -0.191880912, -0.335533708, 0.0711436272, 0.937517881, -0.340585262, 0.379920751, 0.290244073, 0.878304482),
				--["CFrame"] = CFrame.new(0.360874176, 0.38800168, -0.483547688, -0.36783731, -0.290563017, -0.883328319, -0.0900876448, 0.956592739, -0.27714473, 0.925514758, -0.0223651696, -0.378048182),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7220038121.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt"
				},
				["Scale"] = "BreastsScale",
				["Function"] = "AreolaDecalCreate",
			},
			["Left Sweater Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sweater Arm",
				["Size"] = Vector3.new(1.1462839841842651, 1.9422149658203125, 1.1462829113006592),
				["CFrame"] = CFrame.new(0.0349998474, 0.0500049591, 6.68022949e-07, 1, 3.61347907e-06, 5.2154661e-07, -3.61347952e-06, 0.999999881, 1.92065818e-06, -5.21539732e-07, -1.92066045e-06, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm"
				},
				["Function"] = "TurtleTexture"
			},
			["Sweater Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Sweater Shirt",
				["Size"] = Vector3.new(2.72, 2.401642084121704, 2.58),
				["CFrame"] = CFrame.new(-5.7220459e-06, -0.150007486, -0.0499997325, 4.77835215e-07, 3.61347907e-06, -1, 1.92065863e-06, 1, 3.61347998e-06, 1, -1.92066045e-06, 4.77828337e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8279606564.mesh"),
				["TextureId"] = getAsset("RClothesContent/187645444.png"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "SurfaceTexture"
			},
			["Right Sweater Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sweater Arm",
				["Size"] = Vector3.new(1.1462839841842651, 1.9422149658203125, 1.1462829113006592),
				["CFrame"] = CFrame.new(-0.0349988937, 0.0499947071, -8.60088221e-07, 1, 3.61347907e-06, 5.2154661e-07, -3.61347952e-06, 0.999999881, 1.92065818e-06, -5.21539732e-07, -1.92066045e-06, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://6866262171",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm"
				},
				["Function"] = "TurtleTexture"
			},
			["Left Nipple Piercing 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.119, 0.234, 0.131),
				["CFrame"] = CFrame.new(-0.000124454498, 6.77108765e-05, 5.24520874e-05, -0.843650639, 0.0103908479, 0.536791861, -0.46789664, 0.476090997, -0.744587123, -0.26329869, -0.879334688, -0.39679274),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/8745487512.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.119, 0.234, 0.131),
				["CFrame"] = CFrame.new(-9.15527344e-05, -6.10351562e-05, 0.000244140625, 0.897830784, -0.402056038, -0.179584816, 0.0126717985, -0.384072006, 0.923216105, -0.440158159, -0.831167638, -0.339736879),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/8745487512.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.133, 0.102, 0.096),
				["CFrame"] = CFrame.new(0.0437135696, -0.0103340149, -0.00108528137, -0.0263926424, -0.725746155, -0.687458217, -0.00533926487, -0.687584579, 0.726083398, -0.99964118, 0.0228355527, 0.0142710507),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/4932869451.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.133, 0.102, 0.096),
				["CFrame"] = CFrame.new(0.0437135696, -0.0103340149, -0.00108528137, -0.0263926424, -0.725746155, -0.687458217, -0.00533926487, -0.687584579, 0.726083398, -0.99964118, 0.0228355527, 0.0142710507),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/4932869451.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.135, 0.12, 0.11),
				["CFrame"] = CFrame.new(0.0435810089, -0.0102119446, -0.000776290894, -0.0263970345, -0.725711107, -0.687493086, -0.00526610017, -0.687622249, 0.726049662, -0.999637723, 0.0227859654, 0.014329521),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/6773710025.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.135, 0.12, 0.11),
				["CFrame"] = CFrame.new(0.0435810089, -0.0102119446, -0.000776290894, -0.0263970345, -0.725711107, -0.687493086, -0.00526610017, -0.687622249, 0.726049662, -0.999637723, 0.0227859654, 0.014329521),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/6773710025.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.137, 0.135, 0.014),
				["CFrame"] = CFrame.new(0.0250000004, -0.00749999983, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12625658678.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.137, 0.135, 0.014),
				["CFrame"] = CFrame.new(0.0250000004, -0.00749999983, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12625658678.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.05, 0.135, 0.086),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/7791686946.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.05, 0.135, 0.086),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/7791686946.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.124, 0.125, 0.033),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/11394330816.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.124, 0.125, 0.033),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/11394330816.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.137, 0.091, 0.094),
				["CFrame"] = CFrame.new(0.0250000004, -0.00700000022, 0, 1.5048154e-07, -0.707106769, -0.707106829, 1.06770166e-07, -0.707106829, 0.707106769, -1, -1.81904426e-07, -3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/13050350514.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.137, 0.091, 0.094),
				["CFrame"] = CFrame.new(0.0250000004, -0.00700000022, 0, 1.5048154e-07, -0.707106769, -0.707106829, 1.06770166e-07, -0.707106829, 0.707106769, -1, -1.81904426e-07, -3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/13050350514.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 8"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.092, 0.19, 0.107),
				["CFrame"] = CFrame.new(0.0253143311, -0.00280761719, -0.0009765625, -0.517758846, 0.0350331329, -0.854810536, 0.845839381, -0.128981292, -0.517609715, -0.128386974, -0.991031468, 0.037148416),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/7063311226.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 8"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.092, 0.19, 0.107),
				["CFrame"] = CFrame.new(0.0253143311, -0.00280761719, -0.0009765625, -0.517758846, 0.0350331329, -0.854810536, 0.845839381, -0.128981292, -0.517609715, -0.128386974, -0.991031468, 0.037148416),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/7063311226.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 9"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.131, 0.162, 0.114),
				["CFrame"] = CFrame.new(0.0500000007, 0.00249999994, 0, -6.30587635e-08, -0.707106769, -0.707106829, -1.06770166e-07, -0.707106829, 0.707106769, -1, 1.20087179e-07, -3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12488261246.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 9"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.131, 0.162, 0.114),
				["CFrame"] = CFrame.new(0.0500000007, 0.00249999994, 0, -6.30587635e-08, -0.707106769, -0.707106829, -1.06770166e-07, -0.707106829, 0.707106769, -1, 1.20087179e-07, -3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12488261246.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 10"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.147, 0.095, 0.102),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, -0.707106769, 0, -0.707106769, 0.707106769, -1, 3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/13076200715.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 10"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.147, 0.095, 0.102),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, -0.707106769, 0, -0.707106769, 0.707106769, -1, 3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/13076200715.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 11"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.101, 0.182, 0.074),
				["CFrame"] = CFrame.new(0.0850000009, -0.0149999997, 0, -2.24199738e-07, -0.98480773, -0.173648342, -2.62201709e-08, -0.173648342, 0.98480773, -1, 2.25346724e-07, 1.31100855e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/8184647568.mesh"),
				["TextureId"] = getAsset("RClothesContent/8184767343.png"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 11"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.101, 0.182, 0.074),
				["CFrame"] = CFrame.new(0.0850000009, -0.0149999997, 0, -2.24199738e-07, -0.98480773, -0.173648342, -2.62201709e-08, -0.173648342, 0.98480773, -1, 2.25346724e-07, 1.31100855e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/8184647568.mesh"),
				["TextureId"] = getAsset("RClothesContent/8184767343.png"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 12"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.148, 0.102, 0.094),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, 0.707106769, 0, -0.707106769, -0.707106769, 1, -3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12755883933.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 12"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.148, 0.102, 0.094),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, 0.707106769, 0, -0.707106769, -0.707106769, 1, -3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12755883933.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 13"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.153, 0.136, 0.128),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, -0.707106769, 0, 0.707106769, -0.707106769, 1, -3.09086197e-08, -3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12005265476.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 13"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.153, 0.136, 0.128),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, -0.707106769, 0, 0.707106769, -0.707106769, 1, -3.09086197e-08, -3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12005265476.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 14"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.148, 0.138, 0.113),
				["CFrame"] = CFrame.new(0.0500000007, 0, 0, -1.82268053e-07, -0.707106769, 0.707106829, -1.06770166e-07, -0.707106829, -0.707106769, 1, -2.04380882e-07, 5.3385083e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12576150000.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 14"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.148, 0.138, 0.113),
				["CFrame"] = CFrame.new(0.0500000007, 0, 0, -1.82268053e-07, -0.707106769, 0.707106829, -1.06770166e-07, -0.707106829, -0.707106769, 1, -2.04380882e-07, 5.3385083e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12576150000.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 15"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.174, 0.12, 0.112),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, 0.707106769, 0, -0.707106769, -0.707106769, 1, -3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12157209535.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 15"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.174, 0.12, 0.112),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, 0.707106769, 0, -0.707106769, -0.707106769, 1, -3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12157209535.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 16"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.144, 0.101, 0.108),
				["CFrame"] = CFrame.new(0.0250000004, -0.00700000022, 0, 1.36806619e-08, -0.707106769, -0.707106829, 6.18172393e-08, 0.707106829, -0.707106769, 1, -3.40377007e-08, 5.3385083e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12720313083.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 16"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.144, 0.101, 0.108),
				["CFrame"] = CFrame.new(0.0250000004, -0.00700000022, 0, 1.36806619e-08, -0.707106769, -0.707106829, 6.18172393e-08, 0.707106829, -0.707106769, 1, -3.40377007e-08, 5.3385083e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12720313083.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 17"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.165, 0.121, 0.111),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, 0.707106769, 0, -0.707106769, -0.707106769, 1, -3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/5385291202.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 17"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.165, 0.121, 0.111),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -4.37113883e-08, -0.707106769, 0.707106769, 0, -0.707106769, -0.707106769, 1, -3.09086197e-08, 3.09086197e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/5385291202.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 18"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.144, 0.128, 0.115),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -1.82268053e-07, -0.707106769, 0.707106829, -1.06770166e-07, -0.707106829, -0.707106769, 1, -2.04380882e-07, 5.3385083e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/7601850077.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 18"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.144, 0.128, 0.115),
				["CFrame"] = CFrame.new(0.0500000007, -0.00700000022, 0, -1.82268053e-07, -0.707106769, 0.707106829, -1.06770166e-07, -0.707106829, -0.707106769, 1, -2.04380882e-07, 5.3385083e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/7601850077.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 19"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.145, 0.214, 0.119),
				["CFrame"] = CFrame.new(0.075000003, -0.00700000022, 0, -4.37113883e-08, -0.866025448, -0.49999997, 0, 0.49999997, -0.866025448, 1, -3.78551732e-08, -2.18556924e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/11486064816.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 19"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.145, 0.214, 0.119),
				["CFrame"] = CFrame.new(0.075000003, -0.00700000022, 0, -4.37113883e-08, -0.866025448, -0.49999997, 0, 0.49999997, -0.866025448, 1, -3.78551732e-08, -2.18556924e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/11486064816.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Left Nipple Piercing 20"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.123, 0.294, 0.096),
				["CFrame"] = CFrame.new(0.0700000003, -0.00700000022, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12662159629.mesh"),
				["TextureId"] = getAsset("RClothesContent/12662175794.png"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple"
				},
			},
			["Right Nipple Piercing 20"] = {
				["Instance"] = "Mesh",
				["Name"] = "Piercing",
				["Size"] = Vector3.new(0.123, 0.294, 0.096),
				["CFrame"] = CFrame.new(0.0700000003, -0.00700000022, 0, -4.37113883e-08, -1, 4.37113883e-08, 0, -4.37113883e-08, -1, 1, -4.37113883e-08, 1.91068547e-15),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/12662159629.mesh"),
				["TextureId"] = getAsset("RClothesContent/12662175794.png"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple"
				},
			},
			["Armor"] = {
				["Instance"] = "Mesh",
				["Name"] = "Armor",
				["Size"] = Vector3.new(2.2660112380981445, 1.833153247833252, 2.1519999504089355),
				["CFrame"] = CFrame.new(0, 0.200000048, -0.412475586, -4.37121699e-08, 1.87848313e-13, -1, -1.25055521e-12, 1, 6.26161585e-14, 1, 3.75166564e-12, -4.37137331e-08),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6866883591.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6866883603.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "ToarBreastsOffset"
			},
			["Maid Left Arm Band"] = {
				["Instance"] = "Mesh",
				["Name"] = "Maid Left Arm Band",
				["Size"] = Vector3.new(1.080613136291504, 0.21970787644386292, 1.0806132555007935),
				["CFrame"] = CFrame.new(0.0307617188, 0.412641048, 0.00299072266, 1.09897246e-06, 1.28800411e-05, 0.999997139, -1.31012484e-06, 0.999996185, -1.06076859e-05, -0.999998212, 3.49747182e-07, -1.35971584e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6771341341.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm"
				},
			}, 
			["Maid Left Arm Band 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Maid Left Arm Band 2",
				["Size"] = Vector3.new(1.0597753524780273, 0.4851457476615906, 1.0597742795944214),
				["CFrame"] = CFrame.new(0.0307617188, 0.415190697, 0.00299072266, 1.09897246e-06, 1.28800411e-05, 0.999997139, -1.31012484e-06, 0.999996185, -1.06076859e-05, -0.999998212, 3.49747182e-07, -1.35971584e-06),
				["Transparency"] = 0.3499999940395355,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6771345897.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Arm"
				},
			}, 
			["Maid Leg Band"] = {
				["Instance"] = "Mesh",
				["Name"] = "Maid Leg Band",
				["Size"] = Vector3.new(1.2040982246398926, 0.2598014175891876, 1.1960158348083496),
				["CFrame"] = CFrame.new(0.020690918, 0.338274598, 0.0269775391, 1.09897246e-06, 1.28800411e-05, 0.999997139, -1.31012484e-06, 0.999996185, -1.06076859e-05, -0.999998212, 3.49747182e-07, -1.35971584e-06),
				["Transparency"] = 0.3499999940395355,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6771356972.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Maid Leg Band Bow"] = {
				["Instance"] = "Mesh",
				["Name"] = "Maid Leg Band Bow",
				["Size"] = Vector3.new(0.46772417426109314, 0.39912867546081543, 0.11819032579660416),
				["CFrame"] = CFrame.new(0.0297241211, 0.189261675, -0.575317383, 0.999997139, 1.2926811e-05, 2.77690333e-08, -1.06076859e-05, 0.996190906, 0.0871559456, -1.35971584e-06, -0.0871544704, 0.996193111),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/6237876025.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6237701996.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Maid Right Arm Band 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Maid Right Arm Band 2",
				["Size"] = Vector3.new(1.0597753524780273, 0.4851457476615906, 1.0597742795944214),
				["CFrame"] = CFrame.new(-0.0392456055, 0.415163279, 0.00299072266, 1.09897246e-06, 1.28800411e-05, 0.999997139, -1.31012484e-06, 0.999996185, -1.06076859e-05, -0.999998212, 3.49747182e-07, -1.35971584e-06),
				["Transparency"] = 0.3499999940395355,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6771345897.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Arm"
				},
			}, 
			["Maid Right Arm Band"] = {
				["Instance"] = "Mesh",
				["Name"] = "Maid Right Arm Band",
				["Size"] = Vector3.new(1.080613136291504, 0.21970787644386292, 1.0806132555007935),
				["CFrame"] = CFrame.new(-0.0392456055, 0.41261363, 0.00299072266, 1.09897246e-06, 1.28800411e-05, 0.999997139, -1.31012484e-06, 0.999996185, -1.06076859e-05, -0.999998212, 3.49747182e-07, -1.35971584e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6771341341.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm"
				},
			},
			["PussyCumAttacher"] = {
				["Instance"] = "Mesh",
				["Name"] = "PussyC",
				["Size"] = Vector3.new(0.8848919868469238, 0.8711600303649902, 0.8346620202064514),
				["CFrame"] = CFrame.new(-0.00100517273, -0.964430332, -0.0420532227, -0.999993682, 7.40205633e-06, -4.17192183e-07, 9.17161924e-06, 0.999999881, -1.33617547e-07, -4.1726986e-07, 1.33675684e-07, -1.00000024),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/17108921573.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Pussy Cum"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy Cum",
				["Size"] = Vector3.new(0.5803003311157227, 1.487269401550293, 0.653281033039093),
				["CFrame"] = CFrame.new(-0.00202941895, -0.538755774, 0.0320339203, -1, 8.29489272e-06, -3.93924893e-11, 8.27883741e-06, 1, 2.73453864e-11, 3.93924893e-11, 2.73450602e-11, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/93789077116999.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "PussyC"
				},
				["Function"] = "CumDripDisplay"
			}, 
			["Pussy Cum Trailless"] = {
				["Instance"] = "Mesh",
				["Name"] = "Pussy Cum",
				["Size"] = Vector3.new(0.5803003311157227, 1.487269401550293, 0.653281033039093),
				["CFrame"] = CFrame.new(-0.00202941895, -0.538755774, 0.0320339203, -1, 8.29489272e-06, -3.93924893e-11, 8.27883741e-06, 1, 2.73453864e-11, 3.93924893e-11, 2.73450602e-11, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/93789077116999.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "PussyC"
				}
			}, 
			["Torso Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Cum 1",
				["Size"] = Vector3.new(1.897, 1.963, 1.21),
				["CFrame"] = CFrame.new(-0.106853485, 0.0230622292, -0.000331878662, 1, 5.76812259e-26, 0, 5.76812259e-26, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/116742308897287.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Torso Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso Cum 2",
				["Size"] = Vector3.new(2.168, 2.006, 1.204),
				["CFrame"] = CFrame.new(-0.00250244141, 0.019197464, -0.00451469421, 1, 2.88406129e-26, 0, 2.88406129e-26, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/134989273944289.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso"
				},
			}, 
			["Right Butt Cum2 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Cum2 1",
				["Size"] = Vector3.new(1.3999004364013672, 1.1739400625228882, 0.8418998718261719),
				["CFrame"] = CFrame.new(0.00823974609, 0.0469186306, -0.0775756836, -1, -1.37563238e-05, 6.08962978e-07, -1.39233034e-05, 1, -1.92066227e-06, -6.08935238e-07, -1.92066705e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/124409748030346.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
			}, 
			["Right Butt Cum2 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Cum2 2",
				["Size"] = Vector3.new(1.0894012451171875, 0.8902299404144287, 0.7180004119873047),
				["CFrame"] = CFrame.new(-0.10760498, 0.101624727, -0.373779297, -1, 4.05314222e-06, 6.08964342e-07, 3.1738175e-06, 1, -1.92067114e-06, -6.08966729e-07, -1.92064749e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/97919823001964.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
			}, 
			["Left Butt Cum2 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Cum2 1",
				["Size"] = Vector3.new(1.3999004364013672, 1.1739400625228882, 0.8418998718261719),
				["CFrame"] = CFrame.new(0.00823974609, 0.0469186306, -0.0775756836, -1, -1.37563238e-05, 6.08962978e-07, -1.39233034e-05, 1, -1.92066227e-06, -6.08935238e-07, -1.92066705e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/124409748030346.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
			}, 
			["Left Butt Cum2 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Cum2 2",
				["Size"] = Vector3.new(1.0894012451171875, 0.8902299404144287, 0.7180004119873047),
				["CFrame"] = CFrame.new(-0.10760498, 0.101624727, -0.373779297, -1, 4.05314222e-06, 6.08964342e-07, 3.1738175e-06, 1, -1.92067114e-06, -6.08966729e-07, -1.92064749e-06, -1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/97919823001964.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
			}, 
			["Left Leg Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Cum 1",
				["Size"] = Vector3.new(1.3149986267089844, 2.0903515815734863, 1.3302993774414062),
				["CFrame"] = CFrame.new(-0.0576171875, 0.0808916092, 0.0733642578, 1, 9.61663045e-06, -3.68424423e-11, -3.91788808e-06, 1, 2.41017956e-10, 1.50158809e-11, -1.02547082e-10, 1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/92395350432537.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg"
				},
			}, 
			["Left Leg Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Cum 2",
				["Size"] = Vector3.new(1.2453994750976562, 2.010192394256592, 1.0966987609863281),
				["CFrame"] = CFrame.new(0.0411376953, 0.0286072493, 0.0229492188, 1, 8.90428691e-06, -3.41141143e-11, -3.20554523e-06, 1, 2.23737515e-10, 1.22873265e-11, -8.52666895e-11, 1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/79202531181173.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg"
				},
			}, 
			["Left Leg Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Cum 3",
				["Size"] = Vector3.new(1.3429012298583984, 1.8412518501281738, 1.363698959350586),
				["CFrame"] = CFrame.new(-0.0220947266, 0.229360819, 0.0676269531, -1, 6.76725767e-06, 2.5929061e-11, -8.19194156e-06, 0.999999881, -1.71896053e-10, 3.14262331e-11, 1.90652966e-10, -1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/83679944172074.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg"
				},
			}, 
			["Left Leg Cum 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Leg Cum 4",
				["Size"] = Vector3.new(0.9825992584228516, 2.062309503555298, 1.1525993347167969),
				["CFrame"] = CFrame.new(0.173706055, 0.0612518787, -0.0537109375, 1, 9.97280131e-06, -3.8256058e-11, -4.27405939e-06, 1, 2.41472425e-10, 1.64295366e-11, -1.03001552e-10, 1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/90596906849364.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg"
				},
			}, 
			["Right Leg Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Cum 1",
				["Size"] = Vector3.new(1.2238998413085938, 2.049046039581299, 0.4566001892089844),
				["CFrame"] = CFrame.new(-0.0194091797, 0.0417599678, 0.48638916, -1, 0.000171318519, -4.36796235e-08, 0.000181291311, 1, 2.047435e-10, 4.37178507e-08, -4.48728277e-11, -1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/105937959636862.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Right Leg Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Cum 2",
				["Size"] = Vector3.new(1.344400405883789, 2.0599472522735596, 1.3069992065429688),
				["CFrame"] = CFrame.new(0.0360717773, 0.027289629, 0.0775756836, 1, 0.000186990059, 4.37397176e-08, -0.000186990059, 1, 1.75166048e-10, -4.37396857e-08, -1.83117535e-10, 1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/75884203722318.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Right Leg Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Leg Cum 3",
				["Size"] = Vector3.new(1.2632999420166016, 2.0255203247070312, 0.9050998687744141),
				["CFrame"] = CFrame.new(0.0109863281, -0.0138293505, -0.188842773, 1, 0.000182003656, 4.37205969e-08, -0.000191976447, 1, 5.39888828e-11, -4.37587815e-08, -3.04080205e-10, 1),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/118417825061565.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Right Leg"
				},
			}, 
			["Right Arm Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Cum 1",
				["Size"] = Vector3.new(1.1801013946533203, 2.184769868850708, 1.213399887084961),
				["CFrame"] = CFrame.new(-0.0297241211, -0.00793719292, -0.0162353516, 1, -5.48508253e-11, -3.41060513e-13, 5.24692442e-11, 1, 7.14060565e-14, 3.41060513e-13, 1.55967619e-13, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/125202318335961.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm"
				},
			}, 
			["Right Arm Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Cum 2",
				["Size"] = Vector3.new(1.1706008911132812, 1.9911398887634277, 1.2106990814208984),
				["CFrame"] = CFrame.new(-0.0294799805, 0.0965681076, -0.00408935547, 1, -5.48508253e-11, -3.41060513e-13, 5.24692442e-11, 1, 7.14060565e-14, 3.41060513e-13, 1.55967619e-13, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/83504910801572.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm"
				},
			}, 
			["Left Arm Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Cum 1",
				["Size"] = Vector3.new(1.159200668334961, 2.019089698791504, 1.202301025390625),
				["CFrame"] = CFrame.new(0.0450439453, 0.082224369, 0.0104980469, 1, -5.48508253e-11, -3.41060513e-13, 5.24692442e-11, 1, 7.14060565e-14, 3.41060513e-13, 1.55967619e-13, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/95320080609346.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm"
				},
			}, 
			["Left Arm Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Cum 2",
				["Size"] = Vector3.new(1.1226997375488281, 2.184769868850708, 1.1623001098632812),
				["CFrame"] = CFrame.new(0.0413818359, -0.00853848457, -0.00238037109, 1, -5.48508253e-11, -3.41060513e-13, 5.24692442e-11, 1, 7.14060565e-14, 3.41060513e-13, 1.55967619e-13, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/119168308079386.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm"
				},
			}, 
			["Face Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 2",
				["Size"] = Vector3.new(0.16119936108589172, 0.6649244427680969, 0.2429739236831665),
				["CFrame"] = CFrame.new(-0.422241211, 0.163582802, -0.427978516, -0.496243387, 0.165055707, 0.852343678, -0.0562241822, 0.973587394, -0.221271366, -0.866356492, -0.157726616, -0.473860145),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Face Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 3",
				["Size"] = Vector3.new(0.17822431027889252, 0.4747651219367981, 0.17150172591209412),
				["CFrame"] = CFrame.new(-0.177307129, 0.401250362, -0.555358887, -0.355953306, 0.934499025, -1.0984179e-06, 9.28247482e-06, 5.56737234e-09, -0.999998927, -0.934500456, -0.355956137, -9.1735601e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Face Cum 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 4",
				["Size"] = Vector3.new(0.07113267481327057, 0.16356100142002106, 0.08625094592571259),
				["CFrame"] = CFrame.new(0.0985107422, -0.38054657, -0.576965332, 0.965921223, -5.12373163e-07, -0.258819193, 0.0268451702, 0.994606495, 0.100190066, 0.257421494, -0.103724286, 0.960714638),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Face Cum 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 5",
				["Size"] = Vector3.new(0.09613265842199326, 0.4885610044002533, 0.13625092804431915),
				["CFrame"] = CFrame.new(0.43737793, -0.163431168, -0.373474121, 2.88029014e-07, 1.26513214e-06, 0.99999547, -0.0705631599, 0.997506678, -3.15570605e-06, -0.997505426, -0.0705628172, -2.0076036e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Face Cum 6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 6",
				["Size"] = Vector3.new(0.16119936108589172, 0.37851041555404663, 0.14999999105930328),
				["CFrame"] = CFrame.new(0.352539062, -0.0939350128, -0.450317383, 0.666839063, 0.48791337, -0.563255787, -0.372748435, 0.872888863, 0.314836085, 0.645273268, 7.02903571e-06, 0.763949275),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Face Cum 7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 7",
				["Size"] = Vector3.new(0.16119936108589172, 0.464013934135437, 0.2429739236831665),
				["CFrame"] = CFrame.new(0.44128418, 0.244832039, -0.364379883, -2.02121782e-07, 0.288140208, -0.957583427, -8.72514192e-06, 0.957586229, 0.288143337, 0.999998033, 8.19637535e-06, 4.37895324e-06),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			}, 
			["Face Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum 1",
				["Size"] = Vector3.new(0.16119936108589172, 0.4367606043815613, 0.2429739236831665),
				["CFrame"] = CFrame.new(-0.251525879, -0.239318848, -0.54888916, 0.717032015, 0.345024675, -0.605651677, -0.137268469, 0.92177707, 0.362604737, 0.683384418, -0.176863149, 0.708308637),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			},
			["Left Breast Cum"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast Cum",
				["Size"] = Vector3.new(0.9000000357627869, 1.0029999017715454, 0.9050000905990601),
				["CFrame"] = CFrame.new(-0.168945312, -0.0475158691, -0.0146484375, -0.903787792, -0.421040893, 0.0767331123, -0.40288651, 0.897506237, 0.179342642, -0.144383878, 0.131173998, -0.980785906),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/7660134717.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "BreastsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast"
				},
				["Function"] = "CumBreastTypeSupport"
			}, 
			["Right Breast Cum"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast Cum",
				["Size"] = Vector3.new(0.9000000357627869, 1.1029999256134033, 0.9300000667572021),
				["CFrame"] = CFrame.new(-0.136535645, -0.0603485107, 0.0240478516, -0.894259214, -0.415139675, -0.167196825, -0.399148285, 0.90878731, -0.121600553, 0.202425659, -0.0420068502, -0.978384972),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/7660134717.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "BreastsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast"
				},
				["Function"] = "CumBreastTypeSupport"
			},
			["Left Breast Cum Type2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Breast Cum Type2",
				["Size"] = Vector3.new(1.1121561527252197, 1.180999755859375, 0.9050717949867249),
				["CFrame"] = CFrame.new(-0.0822753906, -0.077545166, -0.00912475586, -0.866024375, -0.481984288, 0.133011624, -0.500000715, 0.834820151, -0.230378717, -4.529953e-06, -0.266019404, -0.963965297),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/OX_7115693161.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "BreastsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast"
				},
				["Function"] = "CumBreastTypeSupport2"
			}, 
			["Right Breast Cum Type2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Breast Cum Type2",
				["Size"] = Vector3.new(1.076904296875, 1.1731266975402832, 0.9200000166893005),
				["CFrame"] = CFrame.new(-0.0802612305, -0.0796127319, 0.00048828125, -0.866026342, -0.499999702, 1.34110451e-06, -0.500000477, 0.866024554, 1.8812716e-06, 1.93715096e-06, -9.983778e-07, -0.999993801),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/OX_7115703261.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "BreastsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast"
				},
				["Function"] = "CumBreastTypeSupport2"
			}, 
			["Face Cum Type2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Face Cum Type2",
				["Size"] = Vector3.new(0.8184931874275208, 0.23144881427288055, 1.1218310594558716),
				["CFrame"] = CFrame.new(0.0479736328, -0.0687346458, -0.523132324, 0.999995232, 1.49011169e-06, -6.70550605e-07, -6.70550605e-07, 1.30384535e-07, 1, -1.49011169e-06, -0.999998212, -1.30384535e-07),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6720355129.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Head"
				},
			},
			["Left Butt Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Cum 1",
				["Size"] = Vector3.new(0.5180783271789551, 0.3023378252983093, 0.4937683343887329),
				["CFrame"] = CFrame.new(-0.0766601562, 0.514653921, -0.24230957, 0.787097275, -0.498641491, 0.363077641, 0.451583117, 0.866802633, 0.211485073, -0.420175463, -0.00249786698, 0.907437563),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/7004864019.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
			}, 
			["Left Butt Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Cum 2",
				["Size"] = Vector3.new(0.11107902973890305, 0.28349998593330383, 0.1674281358718872),
				["CFrame"] = CFrame.new(0.120727539, 0.514345884, -0.31817627, 0.999995232, 1.59744775e-06, -2.7102883e-06, -1.44849582e-06, 0.771619797, -0.63608402, -1.90503056e-06, 0.636083126, 0.771618247),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
			}, 
			["Left Butt Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Cum 3",
				["Size"] = Vector3.new(0.5300646424293518, 0.26003220677375793, 0.37633076310157776),
				["CFrame"] = CFrame.new(0.102844238, 0.38935113, -0.46282959, -0.938311875, 0.179826811, 0.295336485, -0.0692516118, 0.739090443, -0.670036972, -0.338769197, -0.649158537, -0.681047142),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/7004863745.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
			}, 
			["Left Butt Cum 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Butt Cum 4",
				["Size"] = Vector3.new(0.0997346043586731, 0.5813705325126648, 0.15032881498336792),
				["CFrame"] = CFrame.new(0.0443115234, 0.255191326, -0.58782959, 0.999995232, 2.68465783e-06, -1.64015682e-06, -1.44849582e-06, 0.980140269, -0.198305607, -1.90503056e-06, 0.198305503, 0.980138481),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
			}, 
			["Right Butt Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Cum 2",
				["Size"] = Vector3.new(0.0997346043586731, 0.5117958188056946, 0.15032881498336792),
				["CFrame"] = CFrame.new(0.237976074, 0.271583557, -0.505615234, 0.999995232, 2.44005037e-06, -2.04078469e-06, -1.4637908e-06, 0.94541508, -0.325868547, -1.845979e-06, 0.325868189, 0.945413351),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
			}, 
			["Right Butt Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Cum 3",
				["Size"] = Vector3.new(0.5180783271789551, 0.3023378252983093, 0.4937683343887329),
				["CFrame"] = CFrame.new(0.0971069336, 0.504099846, -0.206848145, 0.0925252661, 0.0484154634, 0.994527757, 0.202760041, 0.976973116, -0.0664230064, -0.974845827, 0.20779705, 0.0805752203),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/7004864019.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
			}, 
			["Right Butt Cum 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Cum 4",
				["Size"] = Vector3.new(0.0997346043586731, 0.37853536009788513, 0.15032881498336792),
				["CFrame"] = CFrame.new(-0.178894043, 0.144503593, -0.581176758, 0.999995232, 2.59762965e-06, -1.84204657e-06, -1.46700393e-06, 0.968367994, -0.24952662, -1.84463056e-06, 0.249526426, 0.968366146),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/6976475976.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
			}, 
			["Right Butt Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Butt Cum 1",
				["Size"] = Vector3.new(0.5300646424293518, 0.26003220677375793, 0.37633076310157776),
				["CFrame"] = CFrame.new(-0.123840332, 0.291390419, -0.522583008, 0.0280825775, -0.340392381, 0.939859033, -0.710923135, 0.654169858, 0.258166909, -0.702707767, -0.675418377, -0.223625451),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/7004863745.mesh"),
				["DoubleSided"] = false,
				["Scale"] = "ButtsScale",
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
			},
			["RightArm2 Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "RightArm2 Cum 1",
				["Size"] = Vector3.new(1.252504587173462, 2.2361180782318115, 1.213399887084961),
				["CFrame"] = CFrame.new(-0.0823383331, -0.0102884769, -0.0162353516, 0.994650841, -0.103276134, 0, 0.103276335, 0.994652808, 0, 0, 0, 0.999998033),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/125202318335961.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			}, 
			["RightArm2 Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "RightArm2 Cum 2",
				["Size"] = Vector3.new(1.2119125127792358, 1.9911398887634277, 1.2106990814208984),
				["CFrame"] = CFrame.new(-0.119886398, 0.0890517235, -0.00408935547, 0.996276021, -0.0862001404, 0, 0.0862003118, 0.996277988, 0, 0, 0, 0.999998033),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/83504910801572.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			}, 
			["Torso3 Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso3 Cum 2",
				["Size"] = Vector3.new(1.884933352470398, 1.9555860757827759, 1.2296398878097534),
				["CFrame"] = CFrame.new(-0.000686645508, -0.0060095787, -0.0635070801, 0.999998689, 2.8840576e-26, 0, 2.88406129e-26, 1, 0, 0, 0, 0.999998689),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/134989273944289.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Torso3 Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Torso3 Cum 1",
				["Size"] = Vector3.new(1.7728790044784546, 1.916404128074646, 1.3221521377563477),
				["CFrame"] = CFrame.new(0.0676631927, 6.31809235e-05, -0.0373191833, 0.999999344, 0, 0, 0, 0.999234259, -0.0391268283, 0, 0.0391268283, 0.999231637),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/116742308897287.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["LeftLeg3 Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "LeftLeg3 Cum 1",
				["Size"] = Vector3.new(1.5047883987426758, 2.392045736312866, 1.5222975015640259),
				["CFrame"] = CFrame.new(-0.0354804993, 0.111342311, 0.0753307343, 0.995205522, -0.0977662057, 0, 0.0977665931, 0.995209396, 0, 0, 0, 0.999996066),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/92395350432537.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["LeftLeg3 Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "LeftLeg3 Cum 2",
				["Size"] = Vector3.new(1.4104979038238525, 2.215325355529785, 1.2549819946289062),
				["CFrame"] = CFrame.new(0.0781288147, 0.035821557, 0.0176429749, 0.995205462, -0.0977669209, 0, 0.0977673158, 0.995209336, 0, 0, 0, 0.999996066),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/79202531181173.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["LeftLeg3 Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "LeftLeg3 Cum 3",
				["Size"] = Vector3.new(1.5367182493209839, 2.1069939136505127, 1.5605175495147705),
				["CFrame"] = CFrame.new(-0.0466079712, 0.283895731, 0.0687656403, -0.999892235, -0.0144098504, 0, -0.0144099072, 0.999896169, 0, 0, 0, -0.999996066),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/83679944172074.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["LeftLeg3 Cum 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "LeftLeg3 Cum 4",
				["Size"] = Vector3.new(1.3470991849899292, 2.2558815479278564, 1.297986388206482),
				["CFrame"] = CFrame.new(0.170196533, 0.0613889694, -0.0805625916, 0.998748839, -0.0499298647, 0, 0.0499300621, 0.998752773, 0, 0, 0, 0.999996066),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/90596906849364.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["RightLeg3 Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "RightLeg3 Cum 1",
				["Size"] = Vector3.new(1.369568109512329, 2.2929229736328125, 0.5757184028625488),
				["CFrame"] = CFrame.new(-0.0164585114, 0.0817826986, 0.509117126, -0.989584684, 0.143492222, 0.0113353021, 0.143936574, 0.986997843, 0.0715413019, -0.000922298874, 0.0724277273, -0.997371435),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/105937959636862.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Right Leg",
				},
			}, 
			["RightLeg3 Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "RightLeg3 Cum 2",
				["Size"] = Vector3.new(1.6039903163909912, 2.305121660232544, 1.4935210943222046),
				["CFrame"] = CFrame.new(0.046672821, 0.0744107962, 0.0671405792, 0.999674022, -0.0251320247, -0.00422650203, 0.0250301491, 0.999429941, -0.0226508547, 0.0047933613, 0.0225376748, 0.999732614),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/75884203722318.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Right Leg",
				},
			}, 
			["RightLeg3 Cum 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "RightLeg3 Cum 3",
				["Size"] = Vector3.new(1.413657546043396, 2.266597270965576, 1.0128246545791626),
				["CFrame"] = CFrame.new(0.0114574432, 0.0324647427, -0.247650146, 0.989580512, 0.143886238, -0.00422657933, -0.143946007, 0.989326298, -0.0226510186, 0.000922296196, 0.023023406, 0.999729991),
				["CFrame1"] = CFrame.new(0,-0.001,0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/118417825061565.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Scale"] = "LegsScale",
				["AdjustScale"] = {["Size"]=1.4, ["CFrame1"]=300},
				["Parent"] = {
					[1] = "Right Leg",
				},
			}, 
			["LeftArm2 Cum 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "LeftArm2 Cum 2",
				["Size"] = Vector3.new(1.1597402095794678, 2.192622184753418, 1.1958216428756714),
				["CFrame"] = CFrame.new(0.0616283417, -0.0131552219, -0.0191383362, 0.994674206, 0.10305576, 0, -0.103055961, 0.994676173, 0, 0, 0, 0.999998033),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/119168308079386.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			}, 
			["LeftArm2 Cum 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "LeftArm2 Cum 1",
				["Size"] = Vector3.new(1.2493823766708374, 2.0285511016845703, 1.2473194599151611),
				["CFrame"] = CFrame.new(0.07771492, 0.0861301422, 0.00582313538, 0.993857265, 0.110640615, 0, -0.110640831, 0.993859231, 0, 0, 0, 0.999998033),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Glass,
				["MeshId"] = getAsset("RClothesContent/95320080609346.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			}, 
			["Right Round Cross Tape"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Round Cross Tape",
				["Size"] = Vector3.new(0.4668737053871155, 0.46883949637413025, 0.31550830602645874),
				["CFrame"] = CFrame.new(-0.437194824, -0.205078125, 0.0119628906, -0.320861846, -0.184718683, 0.928938448, -0.223419741, 0.967879891, 0.115291417, -0.920397341, -0.170550585, -0.351825505),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8447877878.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
				},
			}, 
			["Left Round Cross Tape"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Round Cross Tape",
				["Size"] = Vector3.new(0.4668915867805481, 0.46835005283355713, 0.31574997305870056),
				["CFrame"] = CFrame.new(-0.436035156, -0.207580566, 0.00335693359, 0.320874423, -0.184720829, 0.92893368, 0.223427966, 0.967878342, 0.115288086, -0.920390904, 0.170556754, 0.351839215),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8447851356.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
				},
			}, 
			["Jacket Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Jacket Shirt",
				["Size"] = Vector3.new(2.1246931552886963, 1.2849375009536743, 1.8374121189117432),
				["CFrame"] = CFrame.new(6.10351562e-05, 0.394865274, -0.360229492, 1, -3.35278219e-06, -7.45061106e-06, 3.35277741e-06, 1, -6.5194979e-07, 7.45061334e-06, 6.51924836e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/6885999097.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Right Jacket Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Jacket Arm",
				["Size"] = Vector3.new(1.0490915775299072, 1.0586410760879517, 0.9782295823097229),
				["CFrame"] = CFrame.new(-0.0333251953, 0.504268646, 0, -1, 3.50377809e-06, -7.45061106e-06, -3.50377331e-06, -1, -6.5194979e-07, -7.45061334e-06, -6.51923699e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/4803707231.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Left Jacket Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Jacket Arm",
				["Size"] = Vector3.new(1.0490915775299072, 1.0586410760879517, 0.9782295823097229),
				["CFrame"] = CFrame.new(0.0321044922, 0.504693747, 0, 1, 3.20178628e-06, 7.29961539e-06, 3.20178151e-06, -1, 6.51949222e-07, 7.29961766e-06, -6.5192603e-07, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/4803707231.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Left Jacket Arm 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Jacket Arm 2",
				["Size"] = Vector3.new(1.0604690313339233, 0.2345172017812729, 1.0229588747024536),
				["CFrame"] = CFrame.new(-6.10351562e-05, 0.41206646, -6.10351562e-05, 1.00000012, -1.16486223e-10, 0, -1.16486376e-10, 1, 1.00058062e-09, 0, 1.00058073e-09, 1.00000012),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/4803707231.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
					[2] = "Left Jacket Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Right Jacket Arm 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Jacket Arm 2",
				["Size"] = Vector3.new(1.0604690313339233, 0.2345172017812729, 1.0229588747024536),
				["CFrame"] = CFrame.new(-6.10351562e-05, 0.41206646, -6.10351562e-05, 1.00000012, -1.16244792e-10, 0, -1.16244792e-10, 1, 1.00044417e-09, 0, 1.00044417e-09, 1.00000012),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/4803707231.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
					[2] = "Right Jacket Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Dress 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Dress 2",
				["Size"] = Vector3.new(2.7847559452056885, 2.5671539306640625, 3.031595468521118),
				["CFrame"] = CFrame.new(0, -0.208409309, -0.0530395508, -7.49432184e-06, -3.35279583e-06, -1, -6.51851735e-07, 1, -3.35279105e-06, 1, 6.5182661e-07, -7.49432411e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8313398285.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Off Shoulder Hoodie Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Off Shoulder Hoodie Shirt",
				["Size"] = Vector3.new(2.699094772338867, 1.7776050567626953, 3.248256206512451),
				["CFrame"] = CFrame.new(0, -0.82975769, 0.0211181641, -7.49432184e-06, -3.35279469e-06, -1, -6.51860375e-07, 1, -3.35278992e-06, 1, 6.51835251e-07, -7.49432411e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8313398067.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Scarf"] = {
				["Instance"] = "Mesh",
				["Name"] = "Scarf",
				["Size"] = Vector3.new(1.4015450477600098, 0.787646472454071, 1.8566548824310303),
				["CFrame"] = CFrame.new(0, 0.971000195, -0.0109863281, -7.49432184e-06, -3.35279401e-06, -1, -6.48123716e-07, 1, -3.35278924e-06, 1, 6.48098592e-07, -7.49432411e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8371312822.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Left Off Shoulder Hoodie Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Off Shoulder Hoodie Arm",
				["Size"] = Vector3.new(1.12151038646698, 1.0230109691619873, 1.1215095520019531),
				["CFrame"] = CFrame.new(0.0349731445, -0.460499525, 0, 0.999995649, -3.20382128e-06, -7.70616225e-06, 3.23355698e-06, 1, -7.99406826e-06, 7.70619681e-06, 7.99412464e-06, 0.999995708),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Right Off Shoulder Hoodie Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Off Shoulder Hoodie Arm",
				["Size"] = Vector3.new(1.12151038646698, 1.0230109691619873, 1.1215095520019531),
				["CFrame"] = CFrame.new(-0.049987793, -0.460489511, 0, -0.999995708, -8.16582087e-06, 9.80021741e-06, -8.15093154e-06, 0.99999994, -6.73443901e-06, -9.80017194e-06, -6.73459681e-06, -0.999995708),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Left Off Shoulder Hoodie Arm 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Off Shoulder Hoodie Arm 2",
				["Size"] = Vector3.new(1.3092328310012817, 0.48147743940353394, 1.2631609439849854),
				["CFrame"] = CFrame.new(-0.00897216797, 0.425494671, 0, 0.984803438, 0.173647508, -2.55073701e-07, -0.173648238, 0.98480773, -7.38557173e-06, -1.03128741e-06, 7.31767796e-06, 0.999995708),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7980629618.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
					[2] = "Left Off Shoulder Hoodie Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Right Off Shoulder Hoodie Arm 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Off Shoulder Hoodie Arm 2",
				["Size"] = Vector3.new(1.3092328310012817, 0.48147743940353394, 1.2631609439849854),
				["CFrame"] = CFrame.new(-0.00897216797, 0.425494671, 0, 0.984803557, 0.173647508, -2.55073246e-07, -0.173648223, 0.98480767, -7.38556992e-06, -1.0312873e-06, 7.31767977e-06, 0.999995708),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7980629618.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
					[2] = "Right Off Shoulder Hoodie Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Right Shoe 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe",
				["Size"] = Vector3.new(1.2970000505447388, 0.9210000038146973, 1.281999945640564),
				["CFrame"] = CFrame.new(0, -0.586998343, 0.0999755859, -7.4943232e-06, -3.41061286e-06, -1, -1.69796408e-07, 1, -3.41061173e-06, 1, 1.69770829e-07, -7.49432365e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/8915312843.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6888586040.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
				},
			}, 
			["Left Shoe 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe",
				["Size"] = Vector3.new(1.2969107627868652, 0.9213905334472656, 1.2823134660720825),
				["CFrame"] = CFrame.new(0, -0.587000251, 0.0999755859, -6.65991229e-06, -3.65386131e-06, -1, 1.46066986e-05, 1, -3.65395863e-06, 1, -1.46067232e-05, -6.65985863e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/8915312502.mesh"),
				["DoubleSided"] = false,
				["TextureId"] = getAsset("RClothesContent/6888586040.png"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["Short Hoodie"] = {
				["Instance"] = "Mesh",
				["Name"] = "Short Hoodie",
				["Size"] = Vector3.new(1.9278204441070557, 1.3146330118179321, 2.0916900634765625),
				["CFrame"] = CFrame.new(0, 0.419000626, -0.414001465, -7.49432866e-06, -3.58408306e-06, -1, 1.2767174e-06, 1, -3.58409261e-06, 1, -1.27674434e-06, -7.49432365e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8592346019.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Hood"] = {
				["Instance"] = "Mesh",
				["Name"] = "Hood",
				["Size"] = Vector3.new(1.8383543491363525, 0.9809532165527344, 1.5533300638198853),
				["CFrame"] = CFrame.new(0.321289062, 0.307279825, 0, 0.999998569, 3.3752076e-06, -2.47072336e-08, 2.95585778e-12, 1, -2.94368994e-13, -1.34934993e-07, -4.04803927e-07, 0.999998569),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8592346452.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(225.00000178813934, 162.00000554323196, 181.0000044107437),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Short Hoodie",
				},
			},
			["Left Shoe 3 Lower"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Lower",
				["Size"] = Vector3.new(1.2799999713897705, 0.3240000009536743, 1.156000018119812),
				["CFrame"] = CFrame.new(0.0310058594, 0.266000003, 0.0369873047, 1, 8.74227766e-08, 8.74227766e-08, 8.74227766e-08, -1, 0, 8.74227766e-08, 7.63972219e-15, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033680123.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(229.00000154972076, 229.00000154972076, 229.00000154972076),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Right Shoe 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3",
				["Size"] = Vector3.new(1.3413711786270142, 0.6485494375228882, 1.1897692680358887),
				["CFrame"] = CFrame.new(0, -0.783998132, 0, 1, -3.35278173e-06, -7.45059606e-06, 3.35277696e-06, 1, -6.5194979e-07, 7.45062653e-06, 6.51924836e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033692280.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
				},
			}, 
			["Left Shoe 3 Line"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Line",
				["Size"] = Vector3.new(1.3580000400543213, 0.25600001215934753, 1.2070000171661377),
				["CFrame"] = CFrame.new(0, -0.229000017, 0, 1, 5.08943965e-18, 0, 5.08943965e-18, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033858168.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3",
				["Size"] = Vector3.new(1.340999960899353, 0.6489999890327454, 1.190000057220459),
				["CFrame"] = CFrame.new(0, -0.783685327, 0.00378417969, 1, 3.44020441e-06, 7.53803306e-06, 3.44019963e-06, -1, 6.51891867e-07, 7.53803533e-06, -6.51866003e-07, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033822343.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["Left Shoe 3 Nurbs Path 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 1",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0299072266, -0.224247113, 0.547058105, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.76637888, 0.64238894, 0, 0.64238894, -0.76637888),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Tongue"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Tongue",
				["Size"] = Vector3.new(0.5189999938011169, 0.7070000171661377, 0.3840000033378601),
				["CFrame"] = CFrame.new(0.020690918, -0.0267600566, 0.366149902, 1, 5.08943965e-18, 0, 5.08943965e-18, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8965126164.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(230.00000149011612, 230.00000149011612, 230.00000149011612),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Right Shoe 3 Line"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Line",
				["Size"] = Vector3.new(1.3583815097808838, 0.25575077533721924, 1.206850528717041),
				["CFrame"] = CFrame.new(0, 0.229000002, 0, 1, 3.53166015e-21, 2.85549293e-11, 3.53166015e-21, 1, 2.52115767e-32, 2.85549293e-11, 2.52115767e-32, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033714666.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Lower"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Lower",
				["Size"] = Vector3.new(1.2799372673034668, 0.3243541717529297, 1.155938744544983),
				["CFrame"] = CFrame.new(-0.03125, -0.266092539, -0.0369873047, 1.00000429, 3.53166015e-21, 2.85550524e-11, 3.53167549e-21, 1, 2.52116855e-32, 2.85550524e-11, -2.77555756e-17, 1.00000429),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033680123.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 1",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.0308837891, -0.205637783, -0.558898926, -1.00000429, -1.92592157e-11, 2.10825402e-11, -3.53167549e-21, -0.738312185, -0.674459159, -2.85550524e-11, -0.67446202, 0.738315344),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 10"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 10",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.032409668, 0.0162534714, -0.558898926, -1.00000429, -1.82962239e-11, 2.19234873e-11, -3.53167549e-21, -0.767762125, -0.64073503, -2.85550524e-11, -0.640737832, 0.767765403),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 11"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 11",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.032409668, 0.241619349, -0.5546875, -1.00000429, -2.11587241e-11, 1.91754893e-11, -3.53167549e-21, -0.671527088, -0.740980089, -2.85550524e-11, -0.740983248, 0.671529949),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 12"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 12",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.032409668, 0.236827761, -0.556640625, -1.00000429, -1.83433581e-11, 2.18840675e-11, -3.53167549e-21, -0.766381621, -0.642385721, -2.85550524e-11, -0.642388523, 0.7663849),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 13"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 13",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.0308837891, -0.097597301, -0.556762695, -1.00000429, -2.19566275e-11, 1.82564398e-11, -3.53167549e-21, -0.639341772, -0.768922687, -2.85550524e-11, -0.768926024, 0.639344573),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 14"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 14",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.0308837891, -0.102301925, -0.558898926, -1.00000429, -1.92592157e-11, 2.10825402e-11, -3.53167549e-21, -0.738312185, -0.674459159, -2.85550524e-11, -0.67446202, 0.738315344),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 15"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 15",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.0308837891, -0.200933158, -0.556762695, -1.00000429, -2.19566275e-11, 1.82564398e-11, -3.53167549e-21, -0.639341772, -0.768922687, -2.85550524e-11, -0.768926024, 0.639344573),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 16"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 16",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.0308837891, -0.146044254, -0.556762695, -1.00000429, -2.19566275e-11, 1.82564398e-11, -3.53167549e-21, -0.639341772, -0.768922687, -2.85550524e-11, -0.768926024, 0.639344573),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 2",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.032409668, -0.0350132585, -0.556762695, -1.00000429, -2.19566275e-11, 1.82564398e-11, -3.53167549e-21, -0.639341772, -0.768922687, -2.85550524e-11, -0.768926024, 0.639344573),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 3",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.032409668, -0.039717868, -0.558898926, -1.00000429, -1.92592157e-11, 2.10825402e-11, -3.53167549e-21, -0.738312185, -0.674459159, -2.85550524e-11, -0.67446202, 0.738315344),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 4",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.032409668, 0.0837644339, -0.557006836, -1.00000429, -2.07467082e-11, 1.96205222e-11, -3.53167549e-21, -0.687112212, -0.726551235, -2.85550524e-11, -0.726554334, 0.687115133),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 5",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.032409668, 0.0789314806, -0.558898926, -1.00000429, -1.78744328e-11, 2.22687129e-11, -3.53167549e-21, -0.779851973, -0.625963986, -2.85550524e-11, -0.625966668, 0.779855311),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 6",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.032409668, 0.150958091, -0.548278809, -1.00000429, -2.19566275e-11, 1.82564398e-11, -3.53167549e-21, -0.639341772, -0.768922687, -2.85550524e-11, -0.768926024, 0.639344573),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 7",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.032409668, 0.14625451, -0.550476074, -1.00000429, -1.92592157e-11, 2.10825402e-11, -3.53167549e-21, -0.738312185, -0.674459159, -2.85550524e-11, -0.67446202, 0.738315344),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 8"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 8",
				["Size"] = Vector3.new(0.45041221380233765, 0.10332677513360977, 0.0839836597442627),
				["CFrame"] = CFrame.new(-0.0308837891, -0.150748864, -0.558898926, -1.00000429, -1.92592157e-11, 2.10825402e-11, -3.53167549e-21, -0.738312185, -0.674459159, -2.85550524e-11, -0.67446202, 0.738315344),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Nurbs Path 9"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Nurbs Path 9",
				["Size"] = Vector3.new(0.45041221380233765, 0.09745233505964279, 0.09584693610668182),
				["CFrame"] = CFrame.new(-0.032409668, 0.021050036, -0.556945801, -1.00000429, -2.11174342e-11, 1.92209512e-11, -3.53167549e-21, -0.673119068, -0.73953408, -2.85550524e-11, -0.739537239, 0.673121929),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Right Shoe 3 Tongue"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Shoe 3 Tongue",
				["Size"] = Vector3.new(0.5186595320701599, 0.7065155506134033, 0.3840503990650177),
				["CFrame"] = CFrame.new(-0.0209960938, 0.02700001, -0.366027832, 1, 3.53166015e-21, 2.85549293e-11, 3.53166015e-21, 1, 2.52115767e-32, 2.85549293e-11, 2.52115767e-32, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8964755042.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 10"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 10",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0299072266, -0.13410075, 0.538330078, -1, -7.10542736e-15, 0, -5.08943965e-18, 0.639338553, 0.768925428, 0, 0.768925428, -0.639338553),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 11"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 11",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0299072266, -0.229278401, 0.545043945, -1, 7.10542736e-15, 0, -5.08943965e-18, 0.671523869, 0.74098289, 0, 0.74098289, -0.671523869),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 12"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 12",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0314941406, 0.240260854, 0.549438477, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.738309264, 0.674462318, 0, 0.674462259, -0.738309324),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 13"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 13",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0299072266, 0.0611363053, 0.547180176, -1, -7.10542736e-15, 0, -5.08943965e-18, 0.639338553, 0.768925428, 0, 0.768925428, -0.639338553),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 14"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 14",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0314941406, 0.235321864, 0.547180176, -1, -7.10542736e-15, 0, -5.08943965e-18, 0.639338553, 0.768925428, 0, 0.768925428, -0.639338553),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 15"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 15",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0299072266, 0.0660752952, 0.549438477, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.738309264, 0.674462318, 0, 0.674462259, -0.738309324),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 16"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 16",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0299072266, -0.0584848672, 0.549438477, -1, -3.55271368e-15, 0, -5.08943965e-18, 0.77984935, 0.625967264, 0, 0.625967264, -0.779849291),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 2",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0314941406, 0.131777063, 0.549438477, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.738309264, 0.674462318, 0, 0.674462259, -0.738309324),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 3",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0299072266, 0.00731565058, 0.549438477, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.767759383, 0.640738249, 0, 0.640738308, -0.767759383),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 4",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0299072266, -0.12916173, 0.540588379, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.738309264, 0.674462318, 0, 0.674462259, -0.738309324),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 5",
				["Size"] = Vector3.new(0.47285038232803345, 0.10847420245409012, 0.0881674736738205),
				["CFrame"] = CFrame.new(0.0314941406, 0.182637557, 0.549438477, -1, 3.55271368e-15, 0, -5.08943965e-18, 0.738309264, 0.674462318, 0, 0.674462259, -0.738309324),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769902.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 6",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0299072266, 0.00228008628, 0.547424316, -1, 7.10542736e-15, 0, -5.08943965e-18, 0.673115909, 0.739537001, 0, 0.739536941, -0.673115969),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 7",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0314941406, 0.177698568, 0.547180176, -1, -7.10542736e-15, 0, -5.08943965e-18, 0.639338553, 0.768925428, 0, 0.768925428, -0.639338553),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 8"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 8",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0299072266, -0.0635585934, 0.547485352, -1, 0, 0, -5.08943965e-18, 0.687109172, 0.726554215, 0, 0.726554215, -0.687109172),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Shoe 3 Nurbs Path 9"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Shoe 3 Nurbs Path 9",
				["Size"] = Vector3.new(0.47285038232803345, 0.10230711847543716, 0.10062173753976822),
				["CFrame"] = CFrame.new(0.0314941406, 0.126838088, 0.547180176, -1, -7.10542736e-15, 0, -5.08943965e-18, 0.639338553, 0.768925428, 0, 0.768925428, -0.639338553),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Sand,
				["MeshId"] = getAsset("RClothesContent/8964769904.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Shoe 3",
				},
			}, 
			["Left Sock 2 Line"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sock 2 Line",
				["Size"] = Vector3.new(1.2200000286102295, 0.2630000114440918, 1.1399999856948853),
				["CFrame"] = CFrame.new(0.0109863281, -0.134000003, 0, 1, 5.08944089e-18, 0, 5.08944089e-18, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033508047.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Sock 2",
				},
			}, 
			["Right Sock 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sock 2",
				["Size"] = Vector3.new(1.248340129852295, 1.6054649353027344, 1.1879241466522217),
				["CFrame"] = CFrame.new(0.0399780273, -0.379998088, 0.0289916992, 1, -3.34590186e-06, -7.45066836e-06, 3.34589708e-06, 1, -6.52313588e-07, 7.45067064e-06, 6.52288691e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033874623.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
				},
			}, 
			["Right Sock 2 Line"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sock 2 Line",
				["Size"] = Vector3.new(1.2200000286102295, 0.2627984881401062, 1.1399999856948853),
				["CFrame"] = CFrame.new(-0.0109863281, 0.134000003, 0, 1, 2.11755555e-20, 0, 2.11755555e-20, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033906005.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(237.0000010728836, 234.00000125169754, 234.00000125169754),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Sock 2",
				},
			}, 
			["Left Sock 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sock 2",
				["Size"] = Vector3.new(1.2480000257492065, 1.6050000190734863, 1.187999963760376),
				["CFrame"] = CFrame.new(-0.0396118164, -0.379751742, 0.0290527344, 1, 3.44020441e-06, 7.53803306e-06, 3.44019963e-06, -1, 6.51891867e-07, 7.53803533e-06, -6.51866003e-07, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9033511985.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
				},
			}, 
			["Right Glove"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Glove",
				["Size"] = Vector3.new(1.1095958948135376, 0.5799999833106995, 1.1239572763442993),
				["CFrame"] = CFrame.new(-0.0235595703, -0.753230095, 0, 2.62359708e-06, 0.132776141, -0.991146207, 2.91995934e-06, 0.991146088, 0.132776126, 1, -3.24245821e-06, 2.21266691e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8914802954.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Left Glove"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Glove",
				["Size"] = Vector3.new(1.1100000143051147, 0.5799999833106995, 1.1236982345581055),
				["CFrame"] = CFrame.new(0.0233764648, -0.753238678, 0, 1.58050398e-06, -0.132768989, 0.991147161, -9.21357014e-07, 0.991147041, 0.132768974, -1, -5.64854076e-07, -2.72268881e-06),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8914802954.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Tanktop"] = {
				["Instance"] = "Mesh",
				["Name"] = "Tanktop",
				["Size"] = Vector3.new(2.1060984134674072, 1.2894705533981323, 1.8871744871139526),
				["CFrame"] = CFrame.new(-6.10351562e-05, 0.425208092, -0.37512207, 1, 3.61347907e-06, 5.2154661e-07, -3.61347998e-06, 1, 1.92065841e-06, -5.21539732e-07, -1.92066045e-06, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9020948490.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(14.000000115484, 12.000000234693289, 25.000000409781933),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Uncover Hoodie Breasts Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Shirt",
				["Size"] = Vector3.new(1.5199998617172241, 1.2713755369186401, 1.878353238105774),
				["CFrame"] = CFrame.new(-0.00048828125, 0.526566029, -0.476257324, 0, 1.15608044e-12, -1, 0, 1, -4.95463046e-13, 1, 0, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8896526740.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(159.0000057220459, 161.0000056028366, 172.00000494718552),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Uncover Hoodie Hoodie"] = {
				["Instance"] = "Mesh",
				["Name"] = "Hoodie",
				["Size"] = Vector3.new(1.7240039110183716, 0.9828771352767944, 1.639330506324768),
				["CFrame"] = CFrame.new(-0.00250244141, 0.815545082, 0.165344238, 0, 1.15608044e-12, -1, 0, 1, -4.95463046e-13, 1, 0, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8896528338.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(159.0000057220459, 161.0000056028366, 172.00000494718552),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Uncover Hoodie Ropes"] = {
				["Instance"] = "Mesh",
				["Name"] = "Ropes",
				["Size"] = Vector3.new(0.5868240594863892, 0.4892089068889618, 1.0775095224380493),
				["CFrame"] = CFrame.new(-0.00250244141, 0.864024162, -0.844543457, -2.35031166e-15, 1.15607805e-12, -1, -0.00203300011, 0.999997973, -4.95463046e-13, 0.999997973, 0.00203300011, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8896528503.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(202.00000315904617, 203.00000309944153, 209.00000274181366),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Uncover Hoodie Shirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "Shirt",
				["Size"] = Vector3.new(1.2195119857788086, 0.9750000238418579, 2.0747084617614746),
				["CFrame"] = CFrame.new(0.00152587891, 0.603111982, -0.0159301758, 0, 1.15608044e-12, 1, 0, 1, 4.95463046e-13, -1, 0, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/8896526539.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(159.0000057220459, 161.0000056028366, 172.00000494718552),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Uncover Hoodie Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Sleeve",
				["Size"] = Vector3.new(1.1956502199172974, 1.696764349937439, 1.1899999380111694),
				["CFrame"] = CFrame.new(-0.0390625, 0.234402895, 0.00048828125, 1, 1.15608044e-12, 0, 4.95463046e-13, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9867233367.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(159.0000057220459, 161.0000056028366, 172.00000494718552),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Uncover Hoodie Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Sleeve",
				["Size"] = Vector3.new(1.1897786855697632, 1.701037049293518, 1.209999918937683),
				["CFrame"] = CFrame.new(0.0385742188, 0.231792927, -0.0110473633, 1, 1.15608044e-12, 0, 4.95463046e-13, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/9867233360.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(159.0000057220459, 161.0000056028366, 172.00000494718552),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
				["Function"] = "TurtleTexture"
			},
			["Yoru Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bra",
				["Size"] = Vector3.new(2.051358699798584, 0.5040243268013, 1.8845497369766235),
				["CFrame"] = CFrame.new(0, 0.138999701, -0.375, 1, 1.81669783e-12, 0, 1.65154457e-13, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10858752208.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Yoru Middle String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Middle String",
				["Size"] = Vector3.new(1.709999918937683, 0.07728225737810135, 1.1152044534683228),
				["CFrame"] = CFrame.new(0, -0.374747038, 0.0178222656, -1, 1.81669783e-12, 0, -1.65154457e-13, 1, 0, 0, 0, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10858752190.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Yoru Left String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left String",
				["Size"] = Vector3.new(1.2910000085830688, 1.5080000162124634, 1.8939999341964722),
				["CFrame"] = CFrame.new(-0.0778808594, 0.313557863, -0.348876953, 1, 1.81694276e-12, -2.95997612e-19, 1.64909536e-13, 1, -1.62920685e-07, -1.99520294e-23, 1.62920685e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10859058245.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Yoru Right String"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right String",
				["Size"] = Vector3.new(1.2899999618530273, 1.5084857940673828, 1.8938651084899902),
				["CFrame"] = CFrame.new(0.0780029297, 0.313999891, -0.348999023, 1, 1.81694276e-12, -2.95997587e-19, 1.64909536e-13, 1, -1.62920671e-07, -1.99518511e-23, 1.62920671e-07, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10859058249.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Yoru Ring"] = {
				["Instance"] = "Mesh",
				["Name"] = "Ring",
				["Size"] = Vector3.new(0.29135453701019287, 0.29135429859161377, 0.0546705536544323),
				["CFrame"] = CFrame.new(0, 0.134058237, -1.13592529, 1, 1.81669783e-12, 0, 1.65154457e-13, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Metal,
				["MeshId"] = getAsset("RClothesContent/10858752173.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(248.0000004172325, 248.0000004172325, 248.0000004172325),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Right Glove 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Glove",
				["Size"] = Vector3.new(1.121999979019165, 0.5379999876022339, 1.027999997138977),
				["CFrame"] = CFrame.new(-0.0250244141, -0.825000048, 0, 0.990581274, 0.136925936, 0, -0.136925936, 0.990581274, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/10858752241.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			}, 
			["Left Glove 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Glove",
				["Size"] = Vector3.new(1.1215732097625732, 0.5384082794189453, 1.028199315071106),
				["CFrame"] = CFrame.new(0.0250854492, -0.824991465, 0, 0.990580142, -0.136934355, 0, 0.136934355, 0.990580142, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/10858752221.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			},

			["Cumdiction"] = {
				["Instance"] = "Mesh",
				["Name"] = "Cumdiction",
				["Size"] = Vector3.new(0.6470000147819519, 0.004000000189989805, 0.5299999713897705),
				["CFrame"] = CFrame.new(-0.000549316406, -0.650450706, -0.495361328, 1, -2.22728073e-22, 6.54676313e-12, 6.54676313e-12, 1.47310792e-32, 1, -2.57267065e-21, -1, -2.11156236e-33),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9534436982.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Deep Focus"] = {
				["Instance"] = "Mesh",
				["Name"] = "Deep Focus",
				["Size"] = Vector3.new(0.6470000147819519, 0.004000000189989805, 0.5299999713897705),
				["CFrame"] = CFrame.new(-0.000610351562, -0.650450706, -0.495361328, 1, -3.01812679e-21, -9.02877773e-12, 2.2122304e-11, 4.89692197e-32, 1, -5.36806936e-21, -1, 7.2499913e-32),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9533965499.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Diction"] = {
				["Instance"] = "Mesh",
				["Name"] = "Diction",
				["Size"] = Vector3.new(0.022204026579856873, 0.5899999737739563, 0.578689694404602),
				["CFrame"] = CFrame.new(0.00494384766, -0.626008272, -0.494689941, 0, 0, 1, 0.0814488083, 0.996677518, 0, -0.996677518, 0.0814488083, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9739471829.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Gaze"] = {
				["Instance"] = "Mesh",
				["Name"] = "Gaze",
				["Size"] = Vector3.new(0.025125805288553238, 0.6972464323043823, 0.7196773290634155),
				["CFrame"] = CFrame.new(0.0112304688, -0.655378103, -0.479370117, 0, 0, 1, 0.114882283, 0.993379116, 0, -0.993379116, 0.114882283, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9752288922.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Glow"] = {
				["Instance"] = "Mesh",
				["Name"] = "Glow",
				["Size"] = Vector3.new(1.214523196220398, 0.010409533977508545, 0.4721943140029907),
				["CFrame"] = CFrame.new(6.10351562e-05, -0.650449991, -0.494995117, 1, 1.19433894e-21, 1.44424472e-11, -1.13309362e-12, -5.32728015e-33, 1, -1.19433894e-21, -1, -3.97395702e-33),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9513009034.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Libido"] = {
				["Instance"] = "Mesh",
				["Name"] = "Libido",
				["Size"] = Vector3.new(0.027331100776791573, 0.5099999904632568, 1.2347478866577148),
				["CFrame"] = CFrame.new(-0.0115356445, -0.638379812, -0.477233887, 0, 0, 1, 0.0682274997, 0.997669876, 0, -0.997669876, 0.0682274997, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9738589498.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Phermone"] = {
				["Instance"] = "Mesh",
				["Name"] = "Phermone",
				["Size"] = Vector3.new(0.9368154406547546, 0.004757822956889868, 0.6051806211471558),
				["CFrame"] = CFrame.new(-0.000183105469, -0.650450706, -0.495361328, 1, 3.78349629e-10, -1.2410125e-12, 1.43345336e-11, 1.32422073e-09, 1.00000393, 3.78348158e-10, -1.00000393, 1.32422073e-09),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9522843947.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["TorsoMesh"] = {
				["Instance"] = "Mesh",
				["Name"] = "TorsoMesh",
				["Size"] = Vector3.new(2.0399999618530273, 2.059999942779541, 1.059999942779541),
				["CFrame"] = CFrame.new(-0.000366210938, -2.38418579e-07, 0.000183105469, 1, -6.42401909e-10, 5.82085699e-11, 6.44266418e-10, 1, 3.74475617e-20, -5.82085699e-11, -5.42651863e-23, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/6867647037.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(163.00000548362732, 162.00000554323196, 165.00000536441803),
				},
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Triggered"] = {
				["Instance"] = "Mesh",
				["Name"] = "Triggered",
				["Size"] = Vector3.new(0.019866948947310448, 0.5014975666999817, 0.9317648410797119),
				["CFrame"] = CFrame.new(0, -0.663594007, -0.494995117, 0, 0, 1, -5.32728015e-33, 1, 0, -1, -5.32728015e-33, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/9730141165.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Animalistic"] = {
				["Instance"] = "Mesh",
				["Name"] = "Animalistic",
				["Size"] = Vector3.new(0.019999999552965164, 0.5999999642372131, 0.9918341636657715),
				["CFrame"] = CFrame.new(0.00152587891, -0.653445959, -0.492126465, 0, 0, 1, 0.136425257, 0.990650415, 0, -0.990650415, 0.136425257, 0),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/10399620886.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			},
			["Womb Tattoo 4"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 4",
				["Size"] = Vector3.new(0.27947998046875, 0.03008289635181427, 0.37007877230644226),
				["CFrame"] = CFrame.new(0.00140380859, -0.748365164, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863982580.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 5"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 5",
				["Size"] = Vector3.new(0.6513441801071167, 0.030082978308200836, 0.3700510859489441),
				["CFrame"] = CFrame.new(0.016418457, -0.585365534, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863945719.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 3",
				["Size"] = Vector3.new(0.22565507888793945, 0.030082952231168747, 0.09696586430072784),
				["CFrame"] = CFrame.new(-0.170593262, -0.516367435, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863959589.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 2",
				["Size"] = Vector3.new(0.3088366389274597, 0.03008296899497509, 0.26607292890548706),
				["CFrame"] = CFrame.new(-0.212585449, -0.601366282, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863962668.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 6"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 6",
				["Size"] = Vector3.new(0.2736760079860687, 0.030082950368523598, 0.2558222711086273),
				["CFrame"] = CFrame.new(0.00140380859, -0.689365387, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863964841.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 7"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 7",
				["Size"] = Vector3.new(0.3318948745727539, 0.030082905665040016, 0.1173192709684372),
				["CFrame"] = CFrame.new(0.000427246094, -0.671365738, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863985603.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 8"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 8",
				["Size"] = Vector3.new(0.5496751666069031, 0.030082983896136284, 0.3700457513332367),
				["CFrame"] = CFrame.new(0.0934448242, -0.585365534, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863941262.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Womb Tattoo 1"] = {
				["Instance"] = "Mesh",
				["Name"] = "Womb Tattoo 1",
				["Size"] = Vector3.new(0.29123565554618835, 0.03008296899497509, 0.19048599898815155),
				["CFrame"] = CFrame.new(-0.221557617, -0.63936615, -0.475158691, 1, 1.8544597e-09, 4.01560417e-11, 8.76780593e-11, -2.6284539e-09, -0.999997139, -9.26775101e-09, 1, -1.25223751e-08),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = getAsset("RClothesContent/8863966579.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["SuspensionBikini1"] = {
				["Instance"] = "Mesh",
				["Name"] = "SuspensionBikini1",
				["Size"] = Vector3.new(1.5101003646850586, 0.25635242462158203, 0.17945683002471924),
				["CFrame"] = CFrame.new(-9.31862928e-07, 0.194564581, -1.2371527, -1, 0, -1.50995803e-07, 0, 1, 0, 1.50995803e-07, 0, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://17657009853",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Buttplug"] = {
				["Instance"] = "Mesh",
				["Name"] = "Buttplug",
				["Size"] = Vector3.new(0.35049957036972046, 0.3662424087524414, 0.4094148874282837),
				["CFrame"] = CFrame.new(-6.41732356e-07, -1.12597048, 0.684295177, -1, 0, -1.50995803e-07, 0, 1, 0, 1.50995803e-07, 0, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://17657009757",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(159.0000057220459, 161.0000056028366, 172.00000494718552),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["ButtplugGem"] = {
				["Instance"] = "Mesh",
				["Name"] = "ButtplugGem",
				["Size"] = Vector3.new(0.21904124319553375, 0.1938542127609253, 0.1314373016357422),
				["CFrame"] = CFrame.new(-6.20070068e-07, -1.19932258, 0.827758193, -1, 0, -1.50995803e-07, 0, 1, 0, 1.50995803e-07, 0, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Neon,
				["MeshId"] = "rbxassetid://17657009721",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(167.00000524520874, 94.0000019967556, 155.00000596046448),
				},
				["Recolor"] = "Tertiary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["SuspensionBikini"] = {
				["Instance"] = "Mesh",
				["Name"] = "SuspensionBikini",
				["Size"] = Vector3.new(1.4737727642059326, 1.638237714767456, 2.0904557704925537),
				["CFrame"] = CFrame.new(-7.8531383e-07, -0.666520596, -0.266601741, -1, 0, -1.50995803e-07, 0, 1, 0, 1.50995803e-07, 0, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = "rbxassetid://17657009742",
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["NewWomanTorsoShirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "New Woman Torso Shirt Mesh",
				["MeshId"] = "rbxassetid://5679232242",
				["Size"] = Vector3.new(1.4, 2.313, 0.907),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanTorsoShirtClothing"
			},
			["NewWomanTorsoPants"] = {
				["Instance"] = "Mesh",
				["Name"] = "New Woman Torso Pants Mesh",
				["MeshId"] = "rbxassetid://5679232242",
				["Size"] = Vector3.new(1.399, 2.312, 0.906),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanTorsoPantsClothing"
			},
			["NewWomanLeftLeg"] = {
				["Instance"] = "Mesh",
				["Name"] = "New Woman Left Leg Mesh",
				["MeshId"] = "rbxassetid://14069694330",
				["Size"] = Vector3.new(0.976, 2.394, 1.315),
				["CFrame"] = CFrame.new(0, 0.2, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanPantsClothing"
			},
			["NewWomanRightLeg"] = {
				["Instance"] = "Mesh",
				["Name"] = "New Woman Right Leg Mesh",
				["MeshId"] = "rbxassetid://14069694284",
				["Size"] = Vector3.new(0.976, 2.394, 1.315),
				["CFrame"] = CFrame.new(0, 0.2, -0.1, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Leg"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanPantsClothing"
			},
			["NewWomanRightArm"] = {
				["Instance"] = "Part",
				["Name"] = "New Woman Right Arm Mesh",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Right Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanShirtClothing"
			},
			["NewWomanLeftArm"] = {
				["Instance"] = "Part",
				["Name"] = "New Woman Left Arm Mesh",
				["Size"] = Vector3.new(1, 2, 1),
				["CFrame"] = CFrame.new(0, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Left Arm"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanShirtClothing"
			},
			["NewWomanBreastShirt"] = {
				["Instance"] = "Mesh",
				["Name"] = "New Woman Breast Mesh",
				["MeshId"] = "rbxassetid://7606070501",
				["Size"] = Vector3.new(1.143, 1.222, 1.375),
				["CFrame"] = CFrame.new(0.001, 0.23, -0.401, 0, 0, -1, -0.26, 1, 0, 1, 0.25, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanBreastShirtClothing"
			},
			["NewWomanBreastPants"] = {
				["Instance"] = "Mesh",
				["Name"] = "New Woman Breast Mesh",
				["MeshId"] = "rbxassetid://7606070501",
				["Size"] = Vector3.new(1.143, 1.222, 1.375),
				["CFrame"] = CFrame.new(0.001, 0.23, -0.401, 0, 0, -1, -0.26, 1, 0, 1, 0.25, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["ParentTransparency"] = 1,
				["Function"] = "NewWomanBreastPantsClothing"
			},
			["Croptop Neck"] = {
				["Instance"] = "Mesh",
				["Name"] = "Croptop Neck",
				["Size"] = Vector3.new(1.293561577796936, 0.4219806492328644, 1.3588359355926514),
				["CFrame"] = CFrame.new(0.00418663025, 1.09489012, 0.00360298157, 1, -5.37213937e-12, 6.13908924e-12, -5.37213937e-12, 1, -1.63373362e-23, 6.13908924e-12, -1.63373346e-23, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/4342469442.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Croptop"] = {
				["Instance"] = "Mesh",
				["Name"] = "Croptop",
				["Size"] = Vector3.new(1.924189567565918, 1.3496313095092773, 2.021623373031616),
				["CFrame"] = CFrame.new(-0.00561904907, 0.359501839, -0.399815559, -0.00869339053, 5.57615342e-14, -0.999962211, -1.46950747e-14, 1, -5.56358853e-14, 0.999962211, -1.42108547e-14, -0.00869339053),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/8609087425.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Lift Croptop"] = {
				["Instance"] = "Mesh",
				["Name"] = "Croptop",
				["Size"] = Vector3.new(1.600000023841858, 1.1349999904632568, 1.9170000553131104),
				["CFrame"] = CFrame.new(0.00980949402, 0.488786697, -0.226898193, -0.00869352184, -8.84762244e-07, -0.999962211, 1.25948532e-07, 1, -8.85890699e-07, 0.999962211, -1.33645287e-07, -0.00869352184),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/9286995426.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "TurtleTexture"
			}, 
			["Cloth Bra"] = {
				["Instance"] = "Mesh",
				["Name"] = "Cloth",
				["Size"] = Vector3.new(1.7875815629959106, 0.468290239572525, 1.9307326078414917),
				["CFrame"] = CFrame.new(-0.00817108154, 0.188874245, -0.374444962, -2.84217094e-14, 5.57615342e-14, -1, -1.42108547e-14, 1, -5.57615342e-14, 1, -1.42108547e-14, 2.84217094e-14),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/12776336375.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(17.00000088661909, 17.00000088661909, 17.00000088661909),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Crop Sweater"] = {
				["Instance"] = "Mesh",
				["Name"] = "Crop Sweater",
				["Size"] = Vector3.new(2.0879037380218506, 1.4744689464569092, 1.8795204162597656),
				["CFrame"] = CFrame.new(-0.00158691406, 0.315901041, -0.376700401, -1, 1.11645536e-13, 5.67209548e-14, -1.11400601e-13, 1, 2.85441735e-14, 5.69658863e-14, -2.82992454e-14, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/15649620886.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(182, 174, 151),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Uncovered Crop Sweater"] = {
				["Instance"] = "Mesh",
				["Name"] = "Uncovered Crop",
				["Size"] = Vector3.new(2.399881601333618, 2.161713123321533, 2.1647732257843018),
				["CFrame"] = CFrame.new(0.00048828125, -0.000299930573, -0.0355734825, -1, 2.23046137e-13, 1.13686838e-13, -2.23046137e-13, 1, 5.68434189e-14, 1.13686838e-13, -5.68434189e-14, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/15640279907.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(182, 174, 151),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Crop Sweater 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Crop Sweater2",
				["Size"] = Vector3.new(2.162240505218506, 1.1933902502059937, 1.8561198711395264),
				["CFrame"] = CFrame.new(-0.00385284424, 0.470192909, -0.365337133, -1, 4.46092273e-13, 2.27373675e-13, -4.46092273e-13, 1, 1.13686838e-13, 2.27373675e-13, -1.13686838e-13, -1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/15640502788.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(182, 174, 151),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
			}, 
			["Sweater Left Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Arm Clothes",
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["Size"] = Vector3.new(1.1328604221343994, 1.823657512664795, 1.1202536821365356),
				["CFrame"] = CFrame.new(0.0394668579, 0.137500286, -0.000893115997, 1, 1.11645536e-13, -5.67209548e-14, 1.11400601e-13, 1, -2.85441735e-14, -5.69658863e-14, -2.82992454e-14, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(182, 174, 151),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Arm",
				},
			},
			["Sweater Right Arm"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Arm Clothes",
				["MeshId"] = getAsset("RClothesContent/6866262171.mesh"),
				["Size"] = Vector3.new(1.1236231327056885, 1.824110746383667, 1.1236631870269775),
				["CFrame"] = CFrame.new(-0.0385055542, 0.137500286, -0.000893115997, 1, 1.11645536e-13, -5.67209548e-14, 1.11400601e-13, 1, -2.85441735e-14, -5.69658863e-14, -2.82992454e-14, 1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.Plastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(182, 174, 151),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Arm",
				},
			},
			["Vibrator Buttons"] = {
				["Instance"] = "Mesh",
				["Name"] = "Buttons",
				["Size"] = Vector3.new(1.2282028198242188, 0.33578991889953613, 0.11236000061035156),
				["CFrame"] = CFrame.new(0.00048828125, -0.665299892, -0.479880333, 1, 5.57615342e-14, -2.84217094e-14, 5.57615342e-14, 1, -1.42108547e-14, -2.84217094e-14, -1.42108547e-14, 1),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/77284727360409.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Function"] = "VibratorStrings"
			}, 
			["Left Vibrator Bullet"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bullet",
				["Size"] = Vector3.new(0.19999957084655762, 0.10001015663146973, 0.23160171508789062),
				["CFrame"] = CFrame.new(-2.88486481e-05, 0.0206165314, 0.00458526611, 1, -6.88433647e-06, -2.46614218e-06, 6.88433647e-06, 1.00000012, 3.9935112e-06, 2.48476863e-06, -4.02331352e-06, 0.99999994),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/101087111632562.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple",
				},
			}, 
			["Right Vibrator Bullet"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bullet",
				["Size"] = Vector3.new(0.19999957084655762, 0.10001015663146973, 0.23160171508789062),
				["CFrame"] = CFrame.new(-2.88486481e-05, 0.0206165314, 0.00458526611, 1, -6.88433647e-06, -2.46614218e-06, 6.88433647e-06, 1.00000012, 3.9935112e-06, 2.48476863e-06, -4.02331352e-06, 0.99999994),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Plastic,
				["MeshId"] = getAsset("RClothesContent/101087111632562.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 152.0000061392784, 220.00000208616257),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple",
				},
			}, 
			["Vibrator Tape"] = {
				["Instance"] = "Mesh",
				["Name"] = "Tape",
				["Size"] = Vector3.new(1.4522018432617188, 0.1102597713470459, 0.13035011291503906),
				["CFrame"] = CFrame.new(0, -0.000999927521, 0.00539565086, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["Transparency"] = 0.6499999761581421,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.Wood,
				["MeshId"] = getAsset("RClothesContent/76388853104288.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(226.0000017285347, 220.00000208616257, 188.0000039935112),
				},
				["Recolor"] = "Secondary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Buttons",
				},
			}, 
			["Left Nipple Lactation"] = {
				["Instance"] = "Part",
				["Name"] = "Lactation",
				["Size"] = Vector3.new(0.025, 0.025, 0.025),
				["CFrame"] = CFrame.new(0.000348567963, -0.000116348267, 0.000267028809, 0.99999994, 5.09619713e-06, -1.43423676e-06, -5.11109829e-06, 1, -4.05311584e-06, 1.39325857e-06, 4.11272049e-06, 1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast",
					[3] = "Nipple",
				},
				["Function"] = "Lactation",
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"CFrame"}
			}, 
			["Right Nipple Lactation"] = {
				["Instance"] = "Part",
				["Name"] = "Lactation",
				["Size"] = Vector3.new(0.025, 0.025, 0.025),
				["CFrame"] = CFrame.new(0.000348567963, -0.000116348267, 0.000267028809, 0.99999994, 5.09619713e-06, -1.43423676e-06, -5.11109829e-06, 1, -4.05311584e-06, 1.39325857e-06, 4.11272049e-06, 1),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast",
					[3] = "Nipple",
				},
				["Function"] = "Lactation",
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"CFrame"}
			}, 
			["theOilerFunction"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "OilUp"
			}, 
			["theOilerFunction2"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "OilUp2"
			}, 
			["theOilerFunction3"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "OilUp3"
			}, 
			["theOilerFunctionOld"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "OilUpOld"
			}, 
			["RBreastFreckles"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast"
				},
				["Function"] = "addFreckles"
			},
			["LBreastFreckles"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast"
				},
				["Function"] = "addFreckles"
			},
			["RButtFreckles"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Function"] = "addFreckles"
			},
			["LButtFreckles"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Function"] = "addFreckles"
			},
			["RBreastFreckles2"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast"
				},
				["Function"] = "addFreckles2"
			},
			["LBreastFreckles2"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast"
				},
				["Function"] = "addFreckles2"
			},
			["RButtFreckles2"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Function"] = "addFreckles2"
			},
			["LButtFreckles2"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Function"] = "addFreckles2"
			},
			["RBreastFrecklesC"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = .55,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Breast"
				},
				["Function"] = "addFrecklesC"
			},
			["LBreastFrecklesC"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = .55,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Breast"
				},
				["Function"] = "addFrecklesC"
			},
			["RButtFrecklesC"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = .55,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Right Butt"
				},
				["Function"] = "addFrecklesC"
			},
			["LButtFrecklesC"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = .55,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 255, 255),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
					[2] = "Left Butt"
				},
				["Function"] = "addFrecklesC"
			},
			["nippleCensorBar"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "nippleCensor"
			}, 
			["leftheel"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Heel",
				["MeshId"] = getAsset("RClothesContent/92232607522801.mesh"),
				["TextureId"] = getAsset("RClothesContent/11725818007.png"),
				["Size"] = Vector3.new(0.9121015667915344, 0.6203000545501709, 1.0545639991760254),
				["CFrame"] = CFrame.new(0.099708885, -0.742674768, 0.0119909737, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["DoubleSided"] = true,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Leg Mesh",
				},
				["Scale"] = "LegsScale",
			},
			["leftheelstrap"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Heel Strap",
				["MeshId"] = getAsset("RClothesContent/135377483286145.mesh"),
				["TextureId"] = getAsset("RClothesContent/11725818007.png"),
				["Size"] = Vector3.new(0.9195975661277771, 0.7609500885009766, 1.039093017578125),
				["CFrame"] = CFrame.new(0.0821268857, -0.485189617, 0.009004483, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["DoubleSided"] = true,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Leg Mesh",
				},
				["Scale"] = "LegsScale",
			},
			["rightheel"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Heel",
				["MeshId"] = getAsset("RClothesContent/74679705510743.mesh"),
				["TextureId"] = getAsset("RClothesContent/11725818007.png"),
				["Size"] = Vector3.new(0.9121012091636658, 0.6203000545501709, 1.0545639991760254),
				["CFrame"] = CFrame.new(-0.0997143686, -0.742674768, 0.0120139811, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["DoubleSided"] = true,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Leg Mesh",
				},
				["Scale"] = "LegsScale",
			},
			["rightheelstrap"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Heel Strap",
				["MeshId"] = getAsset("RClothesContent/85233396977100.mesh"),
				["TextureId"] = getAsset("RClothesContent/11725818007.png"),
				["Size"] = Vector3.new(0.9195974469184875, 0.7609500885009766, 1.039093017578125),
				["CFrame"] = CFrame.new(-0.082120508, -0.48519963, 0.00900349952, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["DoubleSided"] = true,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Leg Mesh",
				},
				["Scale"] = "LegsScale",
			},
			["leftheelcolors"] = {
				["Instance"] = "Mesh",
				["Name"] = "Left Heel",
				["MeshId"] = getAsset("RClothesContent/92232607522801.mesh"),
				["Size"] = Vector3.new(0.9121015667915344, 0.6203000545501709, 1.0545639991760254),
				["CFrame"] = CFrame.new(0.099708885, -0.742674768, 0.0119909737, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["DoubleSided"] = true,
				["Material"] = Enum.Material.Glass,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(193, 0, 0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Left Leg",
					[2] = "Left Leg Mesh",
				},
				["Scale"] = "LegsScale",
			},
			["rightheelcolors"] = {
				["Instance"] = "Mesh",
				["Name"] = "Right Heel",
				["MeshId"] = getAsset("RClothesContent/74679705510743.mesh"),
				["Size"] = Vector3.new(0.9121012091636658, 0.6203000545501709, 1.0545639991760254),
				["CFrame"] = CFrame.new(-0.0997143686, -0.742674768, 0.0120139811, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["DoubleSided"] = true,
				["Material"] = Enum.Material.Glass,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(193, 0, 0),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Right Leg",
					[2] = "Right Leg Mesh",
				},
				["Scale"] = "LegsScale",
			},
			["HideBreastPantsFunction"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "HideBreastPants"
			},
			["HideBreastShirtFunction"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "HideBreastShirt"
			},
			["Bulge"] = {
				["Instance"] = "Mesh",
				["Name"] = "Bulge",
				["MeshId"] = getAsset("RClothesContent/78553849357163.mesh"),
				["Size"] = Vector3.new(1.0286178588867188, 0.8894359469413757, 0.7855360507965088),
				["CFrame"] = CFrame.new(0, -1.0007814, -0.434062207, 1, 0, 0, 0, 1, 0, 0, 0, 1),
				["CFrame1"] = CFrame.new(0,.2,.1),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "PantsTexture",
				["Scale"] = "CockScale",
				["AdjustScale"] = {"Size", "CFrame1"},
			},

			["Breasts Shirt 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Shirt",
				["Size"] = Vector3.new(1.3654316663742065, 1.3328232765197754, 1.768772006034851),
				["CFrame"] = CFrame.new(0.000495910645, 0.716034412, -0.43179512, -0.000712977082, -0.000314813573, -0.999999702, 0.177445441, 0.984130502, -0.000436332339, 0.984130383, -0.17744571, -0.000645800319),
				["CFrame1"] = CFrame.new(0.225398868, 0.376000375, 0.0100766923, 0.991445065, -0.130525291, 4.87403595e-05, 0.130525261, 0.991445005, -8.54662358e-05, -3.7167978e-05, 9.10969538e-05, 1.00000012),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7606070501.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=2},
				["Function"] = {"TorsoShirtTexture", "BreastPhysics"},
			}, 
			["Breasts Pants 2"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Pants",
				--["Size"] = Vector3.new(1.4045316663742065, 1.2318232526779175, 1.767772006034851),
				["Size"] = Vector3.new(1.3653316663742065, 1.3308232765197754, 1.767772006034851),
				["CFrame"] = CFrame.new(0.000495910645, 0.716034412, -0.43179512, -0.000712977082, -0.000314813573, -0.999999702, 0.177445441, 0.984130502, -0.000436332339, 0.984130383, -0.17744571, -0.000645800319),
				--["CFrame1"] = CFrame.new(0.270049423, 0.34288457, 0.0100687128, 1, 8.94069672e-07, 1.54948793e-06, -8.34465027e-07, 0.999999881, 4.90272942e-06, -1.55193266e-06, -4.90302045e-06, 1.00000119),
				["CFrame1"] = CFrame.new(0.225398868, 0.376000375, 0.0100766923, 0.991445065, -0.130525291, 4.87403595e-05, 0.130525261, 0.991445005, -8.54662358e-05, -3.7167978e-05, 9.10969538e-05, 1.00000012),
				["Transparency"] = 1,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/7606070501.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=2},
				["Function"] = {"TorsoPantsTexture", "BreastPhysics"},
			}, 
			["LBreastUV"] = {
				["Instance"] = "Mesh",
				["Name"] = "LBreastUV",
				["Size"] = Vector3.new(1.082619969491958,1.258179944343567,1.1747189343390474),
				--["CFrame"] = CFrame.new(0.0621137619, 0.0236569643, 0.329284668, 1.89030543e-05, 0.305462778, -0.952204227, -8.46157564e-05, 0.952203989, 0.30546242, 1.0000031, 7.47950908e-05, 4.38525458e-05),
				["CFrame"] = CFrame.new(0.06092453, 0.0323336124, 0.329265594, 7.76301604e-05, 0.178561956, -0.983928919, -0.000171953987, 0.9839288, 0.178561717, 1.00000215, 0.00015532723, 0.000107090571),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/85193503766229.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt",
				},
				["Scale"] = "BreastsScale",
				["Function"] = "AreolaDecalUVCreate"
			}, 
			["RBreastUV"] = {
				["Instance"] = "Mesh",
				["Name"] = "RBreastUV",
				["Size"] = Vector3.new(1.082619969491958,1.258179944343567,1.1747189343390474),
				--["CFrame"] = CFrame.new(0.0620231628, 0.0240840912, -0.33354187, 1.11979316e-05, 0.305389315, -0.952227712, -0.000100573205, 0.952227473, 0.305389106, 1.00000226, 9.23470216e-05, 4.13813978e-05),
				["CFrame"] = CFrame.new(0.060749054, 0.0328052044, -0.333564758, 7.2044204e-05, 0.178487211, -0.983942688, -0.00018877878, 0.983942688, 0.178487182, 1.00000036, 0.000172888438, 0.000104581821),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/132922517258698.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt",
				},
				["Scale"] = "BreastsScale",
				["Function"] = "AreolaDecalUVCreate"
			}, 
			["UVNippleL"] = {
				["Instance"] = "Mesh",
				["Name"] = "NippleL",
				["Size"] = Vector3.new(0.09469123184680939, 0.12523089349269867, 0.10141640156507492),
				["CFrame"] = CFrame.new(0.299869537, -0.223185062, 0.557528496, -5.16418368e-07, -5.77780156e-06, -1.00000393, -3.87877226e-05, 1.00000012, -5.7754587e-06, 1.00000012, 3.83406878e-05, -5.24451025e-07),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/5270413936.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt",
					[3] = "LBreastUV",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 
			["UVNippleR"] = {
				["Instance"] = "Mesh",
				["Name"] = "NippleR",
				["Size"] = Vector3.new(0.09469123184680939, 0.12523089349269867, 0.10141640156507492),
				["CFrame"] = CFrame.new(-0.299858093, -0.223178387, 0.55751133, -6.37315679e-07, -6.73134491e-06, -1.00000226, -3.55243683e-05, 0.999999821, -6.72968599e-06, 1, 3.5315752e-05, -6.41972292e-07),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/5270413632.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(255, 167, 169)
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt",
					[3] = "RBreastUV",
				},
				["Function"] = "DarkPart",
				["Scale"] = "BreastsScale"
			}, 

			["Breasts Shirt 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Shirt",
				["Size"] = Vector3.new(1.8300000429153442, 1.3309999704360962, 1.319000005722046),
				["CFrame"] = CFrame.new(0.000495910645, 0.878843546, -0.43179512, -1.70530257e-13, 3.34569205e-13, -1, -8.52651283e-14, 1, -3.34569205e-13, 1, -8.52651283e-14, 1.70530257e-13),
				["CFrame1"] = CFrame.new(0.000495910645, 0.513843536, 0.171203613, 0, 0, -1, 0, 1, 0, 1, 0, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10967484907.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=1.2},
				["Function"] = {"TorsoShirtTexture", "BreastPhysics"},
			}, 
			["Breasts Pants 3"] = {
				["Instance"] = "Mesh",
				["Name"] = "Breasts Pants",
				["Size"] = Vector3.new(1.8290000429153442, 1.3299999704360962, 1.318000005722046),
				["CFrame"] = CFrame.new(0.000495910645, 0.878843546, -0.43179512, -1.70530257e-13, 3.34569205e-13, -1, -8.52651283e-14, 1, -3.34569205e-13, 1, -8.52651283e-14, 1.70530257e-13),
				["CFrame1"] = CFrame.new(0.000495910645, 0.513843536, 0.171203613, 0, 0, -1, 0, 1, 0, 1, 0, 0),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/10967484907.mesh"),
				["DoubleSided"] = true,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Scale"] = "BreastsScale",
				["AdjustScale"] = {"Size", ["CFrame1"]=1.2},
				["Function"] = {"TorsoPantsTexture", "BreastPhysics"},
			}, 
			["LBreastUV3"] = {
				["Instance"] = "Mesh",
				["Name"] = "LBreastUV",
				["Size"] = Vector3.new(1.082619969491958,1.258179944343567,1.1747189343390474),
				["CFrame"] = CFrame.new(-0.318508148, -0.000299930573, 0.0225143433, -0.999999702, -0.000594838057, 0.000536412932, -0.000519041496, 0.991296053, 0.13165088, -0.000610054936, 0.131650567, -0.991296053),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/85193503766229.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt",
				},
				["Scale"] = "BreastsScale",
				["Function"] = "AreolaDecalUVCreate"
			}, 
			["RBreastUV3"] = {
				["Instance"] = "Mesh",
				["Name"] = "RBreastUV",
				["Size"] = Vector3.new(1.082619969491958,1.258179944343567,1.1747189343390474),
				["CFrame"] = CFrame.new(0.344493866, 0.000699996948, 0.0235137939, -0.999999702, -0.000612253847, 0.00053641788, -0.000536347798, 0.991305232, 0.131581664, -0.000612315198, 0.131581336, -0.991305232),
				["Transparency"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/132922517258698.mesh"),
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
					[2] = "Breasts Shirt",
				},
				["Scale"] = "BreastsScale",
				["Function"] = "AreolaDecalUVCreate"
			}, 

			["HorseBall"] = {
				["Instance"] = "Mesh",
				["Name"] = "HorseBall",
				["Size"] = Vector3.new(0.9169448018074036, 1.6580206155776978, 0.9004851579666138),
				["CFrame"] = CFrame.new(-0.00899887085, -0.91430068, -0.5, -1, -8.84762244e-07, -4.17234219e-07, -8.84762244e-07, 1, -1.33645642e-07, 4.17234361e-07, -1.33645287e-07, -1),
				["CFrame1"] = CFrame.new(-0.00592725258, 0.47129786, 0.0233262144, 0.999836028, -0.001320943, 0.0180610344, 0.00322549557, 0.994378865, -0.105832756, -0.0178197082, 0.105873704, 0.994219899),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/18890901224.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = "Parent"
				},
				["Parent"] = {
					[1] = "Torso",
				},
				["Scale"] = "CockScale",
				["Function"] = "BBCBallPhysics",
			}, 
			["HorseRod"] = {
				["Instance"] = "Mesh",
				["Name"] = "HorseRod",
				["Size"] = Vector3.new(0.6836444139480591, 0.7754577398300171, 2.391892671585083),
				["CFrame"] = CFrame.new(-0.00899887085, -0.91430068, -0.5, -1, -8.84762244e-07, -4.17234219e-07, -8.84762244e-07, 1, -1.33645642e-07, 4.17234361e-07, -1.33645287e-07, -1),
				["CFrame1"] = CFrame.new(-0.00032802482, 7.78788308e-05, -0.999631822, 1, 2.46684067e-07, -3.91155481e-08, -2.46800482e-07, 1.00000024, -8.6984619e-07, 3.7252903e-08, 8.93192919e-07, 0.99999994),
				["Transparency"] = 0,
				["Reflectance"] = 0,
				["Material"] = Enum.Material.SmoothPlastic,
				["MeshId"] = getAsset("RClothesContent/118273968520530.mesh"),
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(200,110,110),
				},
				["Recolor"] = "Primary",
				["Parent"] = {
					[1] = "Torso",
				},
				["Scale"] = "CockScale",
				["Function"] = "RodPhysics",
			},
			["TwitchEffect"] = {
				["Instance"] = "Part",
				["Name"] = "UnnecessaryPart",
				["Size"] = Vector3.new(0,0,0),
				["CFrame"] = CFrame.new(0,0,0),
				["Transparency"] = 1,
				["Material"] = Enum.Material.Plastic,
				["DoubleSided"] = false,
				["Color"] = {
					["Tone"] = "Base",
					["Color"] = Color3.fromRGB(0, 0, 0),
				},
				["Parent"] = {
					[1] = "Torso"
				},
				["Function"] = "twitchEffect"
			}, 
		}
	end

	local PlayerData = {
		[Player.Name] = Function.PlayerDataDefault()
	}

	local DummyMesh = {
		["Head"] = {
			Size = Vector3.new(2, 1, 1),
			Offset = CFrame.new(0, 1.5, 0)
		},
		["Torso"] = {
			Size = Vector3.new(2, 2, 1),
			Offset = CFrame.new(0,0,0)
		},
		["Right Arm"] = {
			Size = Vector3.new(1, 2, 1),
			Offset = CFrame.new(1.5, 0, 0)
		},
		["Left Arm"] = {
			Size = Vector3.new(1, 2, 1),
			Offset = CFrame.new(-1.5, 0, 0)
		},
		["Right Leg"] = {
			Size = Vector3.new(1, 2, 1),
			Offset = CFrame.new(0.5, -2, 0)
		},
		["Left Leg"] = {
			Size = Vector3.new(1, 2, 1),
			Offset = CFrame.new(-0.5, -2, 0)
		}
	}

	local EditableProperty = {
		"TextureId",
		"Offset",
		"Rotation",
		"Size",
		"Transparency",
		"MeshBasePartTransparency",
		"Color",
		"Reflectance",
	}

	local Method2BodyPart = {
		"Torso",
		"Left Arm",
		"Right Arm",
		"Left Leg",
		"Right Leg",
		"Head",
	}

	local BodyColorPart = {
		["HeadColor3"] = "Head",
		["LeftArmColor3"] = "Left Arm",
		["RightArmColor3"] = "Right Arm",
		["LeftLegColor3"] ="Left Leg",
		["RightLegColor3"] = "Right Leg",
		["TorsoColor3"] = "Torso"
	}

	local BodyPartSize = {
		["Head"] = Vector3.new(2, 1, 1),
		["HeadScale"] = Vector3.new(1, 1, 1),
		["HeadMeshFix"] = Vector3.new(1.198, 1.202, 1.198),
		["Torso"] = Vector3.new(2, 2, 1),
		["Left Arm"] = Vector3.new(1, 2, 1),
		["Left Leg"] = Vector3.new(1, 2, 1),
		["Right Arm"] = Vector3.new(1, 2, 1),
		["Right Leg"] = Vector3.new(1, 2, 1),
		["HumanoidRootPart"] = Vector3.new(2, 2, 1),
	}

	local AttachmentCFrame = {
		["RootAttachment"] = CFrame.new(0,0,0),

		["FaceCenterAttachment"] = CFrame.new(0,0,0),
		["FaceFrontAttachment"] = CFrame.new(0, 0, -0.6),
		["HairAttachment"] = CFrame.new(0,0.6,0),
		["HatAttachment"] = CFrame.new(0,0.6,0),

		["LeftGripAttachment"] = CFrame.new(0, -1, 0),
		["LeftShoulderAttachment"] = CFrame.new(0,1,0),

		["LeftFootAttachment"] = CFrame.new(0, -1, 0),

		["RightGripAttachment"] = CFrame.new(0, -1, 0),
		["RightShoulderAttachment"] = CFrame.new(0,1,0),

		["RightFootAttachment"] = CFrame.new(0, -1, 0),

		["BodyBackAttachment"] = CFrame.new(0, 0, 0.5),
		["BodyFrontAttachment"] = CFrame.new(0, 0, -0.5),
		["LeftCollarAttachment"] = CFrame.new(-1, 1, 0),
		["NeckAttachment"] = CFrame.new(0, 1, 0),
		["RightCollarAttachment"] = CFrame.new(1, 1, 0),
		["WaistBackAttachment"] = CFrame.new(0, -1, 0.5),
		["WaistCenterAttachment"] = CFrame.new(0, -1, 0),
		["WaistFrontAttachment"] = CFrame.new(0, -1, -0.5),
	}

	local AttachmentParent = {
		["RootAttachment"] = "HumanoidRootPart",

		["FaceCenterAttachment"] = "Head",
		["FaceFrontAttachment"] = "Head",
		["HairAttachment"] = "Head",
		["HatAttachment"] = "Head",

		["LeftGripAttachment"] = "Left Arm",
		["LeftShoulderAttachment"] = "Left Arm",

		["LeftFootAttachment"] = "Left Leg",

		["RightGripAttachment"] = "Right Arm",
		["RightShoulderAttachment"] = "Right Arm",

		["RightFootAttachment"] = "Right Leg",

		["BodyBackAttachment"] = "Torso",
		["BodyFrontAttachment"] = "Torso",
		["LeftCollarAttachment"] = "Torso",
		["NeckAttachment"] = "Torso",
		["RightCollarAttachment"] = "Torso",
		["WaistBackAttachment"] = "Torso",
		["WaistCenterAttachment"] = "Torso",
		["WaistFrontAttachment"] = "Torso",
	}

	local HumanoidAccessoryName = {
		"HairAccessory",
		"BackAccessory",
		"FaceAccessory",
		"FrontAccessory",
		"HatAccessory",
		"NeckAccessory",
		"ShouldersAccessory",
		"WaistAccessory",
	}

	local AccessoryType = {
		[8] = "HatAccessory",
		[41] = "HairAccessory",
		[42] = "FaceAccessory",
		[43] = "NeckAccessory",
		[44] = "ShouldersAccessory",
		[45] = "FrontAccessory",
		[46] = "BackAccessory",
		[47] = "WaistAccessory",
	}

	local Bundle = {
		["nil"] = "nil",
		["Bald"] = {},
		["Default"] = {
			["ClothingBundle"] = true,
			["Clothing"] = {
				"Roblox Shirt",
				"Roblox Butt Shirt",
				"Roblox Pants",
				"Nipple Piercing 20",
				"Womb Mark Animalistic",
			},
			["Recolor"] = {
				["Womb Mark Animalistic"] = {
					["Primary"] = "nil",
				},
			},
			["HPClothes"] = {
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
			["Preset"] = {
				["PhysicsObeyGravity"] = true,
				["ArmType"] = 1,
				["TorsoType"] = 1,
				["BodyPartPhysics"] = true,
				["LegsType"] = 1,
				["CockScale"] = 1,
				["ButtsScale"] = 1,
				["MeshBasePartInvisible"] = false,
				["MeshSizeLock"] = false,
				["Face"] = false,
				["RealtimeBodyTransparency"] = true,
				["Tone"] = "Base",
				["AccessorySizeLock"] = false,
				["BreastsType"] = 1,
				["LegsScale"] = 1,
				["ButtType"] = 1,
				["BreastsScale"] = 1,
			},
			["BundleName"] = "Default",
		},
		["Sportsy"] = {
			["Body Color"] = {
				["HeadColor3"] = Color3.fromRGB(255, 204, 153),
				["LeftArmColor3"] = Color3.fromRGB(255, 204, 153),
				["RightArmColor3"] = Color3.fromRGB(255, 204, 153),
				["LeftLegColor3"] = Color3.fromRGB(255, 204, 153),
				["RightLegColor3"] = Color3.fromRGB(255, 204, 153),
				["TorsoColor3"] = Color3.fromRGB(255, 204, 153),
			},
			["Accessory"] = {
				7097787052,
				7335390462,
				8923597159,
				6310032618
			},
			["Clothing"] = {
				"Croptop",
				"Pussy Closed",
				"Panty 2",
				"Shoe 3",
				"Sock 2",
				"Skirt 2",
				"Glove"
			}
		},
		["Mimi"] = {
			["Body Color"] = {
				["HeadColor3"] = Color3.fromRGB(233, 184, 145),
				["LeftArmColor3"] = Color3.fromRGB(233, 184, 145),
				["RightArmColor3"] = Color3.fromRGB(233, 184, 145),
				["LeftLegColor3"] = Color3.fromRGB(233, 184, 145),
				["RightLegColor3"] = Color3.fromRGB(233, 184, 145),
				["TorsoColor3"] = Color3.fromRGB(233, 184, 145),
			},
			["Accessory"] = {
				82879052599298,
				109188815319909,
				17590602534
			},
			["TailAccessory"] = {73567120581664},
			["Clothes"] = {
				["Shirt"] = 121936175724069,
				["Pants"] = 107910834770771,
			},
			["Clothing"] = {
				"Roblox Breasts Clothing",
				"Roblox Shirt",
				"Roblox Butt Shirt",
				"Roblox Pants",
			},
		},
		["Datax"] = {
			["NippleColor"] = Color3.fromRGB(0, 255, 0),
			["Body Color"] = {
				["HeadColor3"] = Color3.fromRGB(0, 0, 0),
				["LeftArmColor3"] = Color3.fromRGB(0, 0, 0),
				["RightArmColor3"] = Color3.fromRGB(0, 0, 0),
				["LeftLegColor3"] = Color3.fromRGB(0, 0, 0),
				["RightLegColor3"] = Color3.fromRGB(0, 0, 0),
				["TorsoColor3"] = Color3.fromRGB(0, 0, 0),
			},
			["Accessory"] = {
				119345726722178,
				17225320544,
				6839523948,
				140493354533597,
				7491680980,
				106067586439689,
				83144929901095
			},
			["Clothes"] = {
				["Shirt"] = 6352152945,
				["Pants"] = 6352162936,
			},
			["Clothing"] = {
				"Roblox Shirt",
				"Roblox Butt Shirt",
				"Roblox Pants",
				"Sock 2",
				"Bodyless Clothes"
			},
			["Recolor"] = {
				["Sock 2"] = {
					["Primary"] = Color3.fromRGB(0, 50, 0),
					["Secondary"] = Color3.fromRGB(0, 255, 0)
				},
				["Bodyless Clothes"] = {
					["Primary"] = Color3.fromRGB(0, 50, 0)
				}
			},
			["MeshEdit"] = {
				["Left Sock 2"] = {
					Size = Vector3.new(1.3580000257492065, 1.6050000190734863, 1.367999963760376),
					Offset = Vector3.new(0,0,-.035),
					Rotation = Vector3.new(2, 0, 0)
				},
				["Left Sock 2 Line"] = {
					Size = Vector3.new(1.3300000286102295, 0.2630000114440918, 1.3399999856948853)
				},
				["Right Sock 2"] = {
					Size = Vector3.new(1.3580000257492065, 1.6050000190734863, 1.367999963760376),
					Offset = Vector3.new(0,0,-.035),
					Rotation = Vector3.new(2, 0, 0)
				},
				["Right Sock 2 Line"] = {
					Size = Vector3.new(1.3300000286102295, 0.2630000114440918, 1.3399999856948853)
				},
				["Bodyless Right Arm"] = {
					Offset = Vector3.new(-0.06, 0.06, 0),
					Rotation = Vector3.new(0, 0, 6)
				},
				["Bodyless Left Arm"] = {
					Offset = Vector3.new(0.05, 0.06, 0),
					Rotation = Vector3.new(0, 0, -7)
				},
				["Bodyless Neck"] = {
					Size = Vector3.new(0,0,0),
				},
				["Bodyless Shirt"] = {
					Size = Vector3.new(0,0,0),
				},
			},
			["Preset"] = {
				Tone = "Use NippleColor",
				TorsoType = 3,
				ArmType = 2,
				LegsType = 3
			},
		},
		-- Clothing Bundles --
		["Roblox Clothing"] = {
			["Clothing"] = {
				"Roblox Breasts Clothing",
				"Roblox Shirt",
				"Roblox Butt Shirt",
				"Roblox Pants",
			},
			["ClothingBundle"] = true
		},
		["Roblox Clothing w/o Breasts"] = {
			["Clothing"] = {
				"Roblox Shirt",
				"Roblox Butt Shirt",
				"Roblox Pants",
			},
			["ClothingBundle"] = true
		},
		["Birdly Outfit"] = {
			["Clothing"] = {
				"Birdly Dress",
				"Birdly Backpack",
				"Birdly Bottom Dress",
				"Birdly Sleeves"
			},
			["ClothingBundle"] = true
		},
		["Cow Bikini"] = {
			["Clothing"] = {
				"Cow Bra",
				"Cow Panty"
			},
			["Preset"] = {
				BreastsScale = 1
			},
			["ClothingBundle"] = true
		},
		["Kitty Outfit"] = {
			["Clothing"] = {
				"Kitty Bra",
				"Kitty Panty",
				"Kitty Band",
				"Kitty Aspects"
			},
			["Preset"] = {
				BreastsScale = 1
			},
			["ClothingBundle"] = true
		},
		["Bunny Suit"] = {
			["Clothing"] = {
				"Bunny Suit",
				"Collar w/ Bow",
				"Bunny Bands",
				"Bunny Aspects",
				"Fishnet Stockings"
			},
			["Preset"] = {
				BreastsScale = 1,
				ButtsScale = 1
			},
			["ClothingBundle"] = true
		},
		["Messy"] = {
			["Clothing"] = {
				"Torso Cum",
				"Leg Cum",
				"Arm Cum",
				"Butts Cum",
				"Butts Cum 2",
				"Breasts Cum",
				"Breasts Cum Type2",
				"Face Cum",
				"Face Cum 2",
				"Pussy Cum",
			},
			["ClothingBundle"] = true
		},
		["Freckles"] = {
			["Clothing"] = {
				"Breast Freckles",
				"Butt Freckles",
			},
			["ClothingBundle"] = true
		},
		["Freckles+"] = {
			["Clothing"] = {
				"Breast Freckles+",
				"Butt Freckles+",
			},
			["ClothingBundle"] = true
		},
		-- Presets --
		["[PRESET] Dance Physics"] = {
			["Preset"] = {
				BodyPartPhysics = true,
				PositionPhysicsMultiply = 8,
				RotationPhysicsMultiply = 12
			},
			["IsPreset"] = true
		},
		["[PRESET] First Person Compatibility"] = {
			["Preset"] = {
				Method = 3,
				LocalTransparency = {
					["Head"] = false,
					["Right Arm"] = true,
					["Left Arm"] = true,
					["Torso"] = true,
					["Right Leg"] = true,
					["Left Leg"] = true,
					["Hat"] = true
				}
			},
			["IsPreset"] = true
		},
		["[PRESET] First Person"] = {
			["Preset"] = {
				FPerson = true,
				Method = 3,
				LocalTransparency = {
					["Head"] = false,
					["Right Arm"] = true,
					["Left Arm"] = true,
					["Torso"] = true,
					["Right Leg"] = true,
					["Left Leg"] = true,
					["Hat"] = true
				}
			},
			["IsPreset"] = true
		},
		["[PRESET] First Person Body"] = {
			["Preset"] = {
				LocalTransparency = {
					["Head"] = false,
					["Right Arm"] = true,
					["Left Arm"] = true,
					["Torso"] = true,
					["Right Leg"] = true,
					["Left Leg"] = true,
					["Hat"] = true
				}
			},
			["IsPreset"] = true
		},
		["[PRESET] FPerson Snap"] = {
			["Preset"] = {
				FPerson = true,
				FPsnap = true,
			},
			["IsPreset"] = true
		},
		["[PRESET] FPerson SnapOff"] = {
			["Preset"] = {
				FPerson = true,
				FPsnap = false,
			},
			["IsPreset"] = true
		},
		["[PRESET] Rudolph's Body Type"] = {
			["Preset"] = {
				TorsoType = 3,
				ArmType = 2,
				LegsType = 3
			},
			["IsPreset"] = true
		},
		["[PRESET] ROBLOX Body Type"] = {
			["Preset"] = {
				TorsoType = 5,
				ArmType = 3,
				LegsType = 4
			},
			["IsPreset"] = true
		},
		["[PRESET] Buff Body Type"] = {
			["Preset"] = {
				TorsoType = 6,
				ArmType = 4
			},
			["IsPreset"] = true
		},
		["[PRESET] Male"] = {
			["Preset"] = {
				TorsoType = 5,
				ArmType = 3,
				LegsType = 4
			},
			["Clothing"] = {
				"Cock",
				"Remove Breasts",
			},
			["IsPreset"] = true
		},
		["[PRESET] Thicc"] = {
			["Preset"] = {
				ButtsScale = 1.3,
				LegsScale = 1.2,
				ButtType = 3,
				LegsType = 2
			},
			["IsPreset"] = true
		},
	}

	local Clothes = {
		["School Shirt"] = {
			["Weld"] = {
				[1] = "School Shirt",
				[2] = "School Collor",
				[3] = "School Bow",
				[5] = "School Left Arm",
				[6] = "School Right Arm",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Skirt 1"] = {
			["Weld"] = {
				[1] = "Skirt 1",
			}
		},
		["Skirt 2"] = {
			["Weld"] = {
				[1] = "Skirt 2",
			}
		},
		["Bra"] = {
			["Weld"] = {
				[1] = "Bra",
			}
		},
		["Panty"] = {
			["Weld"] = {
				[1] = "Panty"
			}
		},
		["Bodyless Clothes"] = {
			["Weld"] = {
				[1] = "Bodyless Shirt",
				[2] = "Bodyless Neck",
				[3] = "Bodyless Right Arm",
				[4] = "Bodyless Left Arm"
			}
		},
		["Dress"] = {
			["Weld"] = {
				[1] = "Dress Bra",
				[2] = "Dress Rope",
				[3] = "Dress Skirt In",
				[4] = "Dress Skirt Out",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Birdly Dress"] = {
			["Weld"] = {
				[1] = "Birdly Dress",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Birdly Backpack"] = {
			["Weld"] = {
				[1] = "Birdly Dress Sling",
				[2] = "Birdly Dress Mail 1",
				[3] = "Birdly Dress Mail 2",
				[4] = "Birdly Dress Mail 3",
			},
		},
		["Birdly Sleeves"] = {
			["Weld"] = {
				[1] = "Birdly Dress Right Sleeve",
				[2] = "Birdly Dress Right Sleeve 2",
				[3] = "Birdly Dress Left Sleeve",
				[4] = "Birdly Dress Left Sleeve 2",
			},
		},
		["Birdly Bottom Dress"] = {
			["Weld"] = {
				[1] = "Birdly Dress Bottom",
			},
		},
		["Suspension bikini"] = {
			["Weld"] = {
				[1] = "SuspensionBikini1",
				[2] = "Buttplug",
				[3] = "ButtplugGem",
				[4] = "SuspensionBikini",
			}
		},
		["Apron"] = {
			["Weld"] = {
				[1] = "Apron 1"
			}
		},
		["Apron 2"] = {
			["Weld"] = {
				[1] = "Apron 2"
			}
		},
		["Killer Sweater"] = {
			["Weld"] = {
				[1] = "Killer Sweater",
				[2] = "Killer Sweater Tie",
				[3] = "Killer Sweater Neck",
			}
		},
		["Cow Bra"] = {
			["Weld"] = {
				[1] = "Cow Bra",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Cow Panty"] = {
			["Weld"] = {
				[1] = "Cow Panty",
			},
		},
		["Bunny Aspects"] = {
			["Weld"] = {
				[1] = "Bunny Tail",
				[2] = "Bunny Ears",
			}
		},
		["Bunny Suit"] = {
			["Weld"] = {
				[1] = "Bunny Suit",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Bunny Bands"] = {
			["Weld"] = {
				[1] = "Right Bunny Band",
				[2] = "Left Bunny Band",
			}
		},
		["Collar w/ Bow"] = {
			["Weld"] = {
				[1] = "Collar",
				[2] = "Bow",
			}
		},
		["Kitty Bra"] = {
			["Weld"] = {
				[1] = "Kitty Bra",
				[2] = "Kitty Black Collar",
				[3] = "Left Kitty Bra String",
				[4] = "Right Kitty Bra String",
				[5] = "Kitty Bra Top Whiskers",
				[6] = "Kitty Bra Middle Whiskers",
				[7] = "Kitty Bra Bottom Whiskers",
				[8] = "Kitty Bra Cat",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Kitty Aspects"] = {
			["Weld"] = {
				[1] = "Kitty Ears",
				[2] = "Kitty Tail",
			}
		},
		["Kitty Panty"] = {
			["Weld"] = {
				[1] = "Kitty Panty",
				[2] = "Left Kitty Panty Paw",
				[3] = "Left Kitty Panty String",
				[4] = "Right Kitty Panty Paw",
				[5] = "Right Kitty Panty String"
			},
		},
		["Kitty Band"] = {
			["Weld"] = {
				[1] = "Right Kitty Band Black",
				[2] = "Right Kitty Band Pink",
			},
		},
		["Workwear Shirt"] = {
			["Weld"] = {
				[1] = "Workwear Shirt",
				[2] = "Left Workwear Arm",
				[3] = "Right Workwear Arm",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			},
		},
		["Side Skirt"] = {
			["Weld"] = {
				[1] = "Side Skirt",
			},
		},
		["Bodysuit"] = {
			["Weld"] = {
				[1] = "Bodysuit",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			},
		},
		["String Bikini"] = {
			["Weld"] = {
				[1] = "String Bikini",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Bra 2"] = {
			["Weld"] = {
				[1] = "Bra 2",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Panty 2"] = {
			["Weld"] = {
				[1] = "Panty 2",
			},
		},
		["Roblox Breasts Clothing"] = {
			["Weld"] = {
				[1] = "Breasts Pants",
				[2] = "Breasts Shirt",
				[3] = "Left Breast 2",
				[4] = "Right Breast 2"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
				"Left Breast",
				"Right Breast",
			},
			["Blacklist"] = {"Roblox Breasts Clothing Type 2","Roblox Breasts Clothing Type 3"},
			["HP"] = 1
		},
		["Roblox Breasts Clothing Type 2"] = {
			["Weld"] = {
				[1] = "Breasts Pants 2",
				[2] = "Breasts Shirt 2",
				[3] = "LBreastUV",
				[4] = "RBreastUV",
				[5] = "UVNippleL",
				[6] = "UVNippleR"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
				"Left Breast",
				"Right Breast",
			},
			["Blacklist"] = {"Roblox Breasts Clothing","Roblox Breasts Clothing Type 3"},
			["HP"] = 1
		},
		["Roblox Breasts Clothing Type 3"] = {
			["Weld"] = {
				[1] = "Breasts Pants 3",
				[2] = "Breasts Shirt 3",
				[3] = "LBreastUV3",
				[4] = "RBreastUV3",
				[5] = "UVNippleL",
				[6] = "UVNippleR"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
				"Left Breast",
				"Right Breast",
			},
			["Blacklist"] = {"Roblox Breasts Clothing","Roblox Breasts Clothing Type 2"},
			["HP"] = 1
		},
		["Hide Breast Pants"] = {
			["Weld"] = {
				[1] = "HideBreastPantsFunction"
			},
		},
		["Hide Breast Shirt"] = {
			["Weld"] = {
				[1] = "HideBreastShirtFunction"
			},
		},
		["Roblox Shirt"] = {
			["Weld"] = {
				[1] = "Torso Shirt",
			},
			["HP"] = 1,
			["HPFunction"] = "TopLayer"
		},
		["Roblox Butt Shirt"] = {
			["Weld"] = {
				[1] = "Left Butt Shirt",
				[2] = "Right Butt Shirt",
			},
			["Alternative"] = {
				["Condition"] = "ButtType1",
				["Weld"] = {
					[1] = "Left Butt Shirt Type1",
					[2] = "Right Butt Shirt Type1",
				}
			},
			["HP"] = 1
		},
		["Roblox Butt Shirt Method2"] = {
			["Weld"] = {
				[1] = "Left Butt Shirt Method2",
				[2] = "Right Butt Shirt Method2",
			},
			["HP"] = 1
		},
		["Roblox Pants"] = {
			["Weld"] = {
			},
			["HP"] = 2,
			["HPFunction"] = "BottomLayer"
		},
		["Sweater"] = {
			["Weld"] = {
				[1] = "Sweater Shirt",
				[2] = "Left Sweater Arm",
				[3] = "Right Sweater Arm"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
			}
		},
		["Nipple Piercing 1"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 1",
				[2] = "Right Nipple Piercing 1",
			}
		},
		["Nipple Piercing 2"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 2",
				[2] = "Right Nipple Piercing 2",
			}
		},
		["Nipple Piercing 3"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 3",
				[2] = "Right Nipple Piercing 3",
			}
		},
		["Nipple Piercing 4"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 4",
				[2] = "Right Nipple Piercing 4",
			}
		},
		["Nipple Piercing 5"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 5",
				[2] = "Right Nipple Piercing 5",
			}
		},
		["Nipple Piercing 6"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 6",
				[2] = "Right Nipple Piercing 6",
			}
		},
		["Nipple Piercing 7"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 7",
				[2] = "Right Nipple Piercing 7",
			}
		},
		["Nipple Piercing 8"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 8",
				[2] = "Right Nipple Piercing 8",
			}
		},
		["Nipple Piercing 9"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 9",
				[2] = "Right Nipple Piercing 9",
			}
		},
		["Nipple Piercing 10"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 10",
				[2] = "Right Nipple Piercing 10",
			}
		},
		["Nipple Piercing 11"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 11",
				[2] = "Right Nipple Piercing 11",
			}
		},
		["Nipple Piercing 12"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 12",
				[2] = "Right Nipple Piercing 12",
			}
		},
		["Nipple Piercing 13"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 13",
				[2] = "Right Nipple Piercing 13",
			}
		},
		["Nipple Piercing 14"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 14",
				[2] = "Right Nipple Piercing 14",
			}
		},
		["Nipple Piercing 15"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 15",
				[2] = "Right Nipple Piercing 15",
			}
		},
		["Nipple Piercing 16"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 16",
				[2] = "Right Nipple Piercing 16",
			}
		},
		["Nipple Piercing 17"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 17",
				[2] = "Right Nipple Piercing 17",
			}
		},
		["Nipple Piercing 18"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 18",
				[2] = "Right Nipple Piercing 18",
			}
		},
		["Nipple Piercing 19"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 19",
				[2] = "Right Nipple Piercing 19",
			}
		},
		["Nipple Piercing 20"] = {
			["Weld"] = {
				[1] = "Left Nipple Piercing 20",
				[2] = "Right Nipple Piercing 20",
			}
		},
		["Nipple Cross Tape"] = {
			["Weld"] = {
				[1] = "Right Cross Tape",
				[2] = "Left Cross Tape",
			}
		},
		["Sock 1"] = {
			["Weld"] = {
				[1] = "Left Sock",
				[2] = "Right Sock",
			}
		},
		["Shoe 1"] = {
			["Weld"] = {
				[1] = "Right Shoe",
				[2] = "Left Shoe",
			}
		},
		["Vest"] = {
			["Weld"] = {
				[1] = "Armor",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
			}
		},
		["Maid Arm Band"] = {
			["Weld"] = {
				[1] = "Maid Left Arm Band",
				[2] = "Maid Left Arm Band 2",
				[3] = "Maid Right Arm Band",
				[4] = "Maid Right Arm Band 2",
			}
		},
		["Maid Leg Band"] = {
			["Weld"] = {
				[1] = "Maid Leg Band",
				[2] = "Maid Leg Band Bow",
			}
		},
		["Face Cum"] = {
			["Weld"] = {
				[1] = "Face Cum 2",
				[2] = "Face Cum 3",
				[3] = "Face Cum 4",
				[4] = "Face Cum 5",
				[5] = "Face Cum 6",
				[6] = "Face Cum 7",
				[7] = "Face Cum 1",
			}
		},
		["Breasts Cum"] = {
			["Weld"] = {
				[1] = "Left Breast Cum",
				[2] = "Right Breast Cum",
			},
			["HP"] = 3,
		},
		["Breasts Cum Type2"] = {
			["Weld"] = {
				[1] = "Left Breast Cum Type2",
				[2] = "Right Breast Cum Type2",
			},
			["HP"] = 3,
		},
		["Face Cum 2"] = {
			["Weld"] = {
				[1] = "Face Cum Type2",
			}
		},
		["Butts Cum"] = {
			["Weld"] = {
				[1] = "Right Butt Cum 1",
				[2] = "Right Butt Cum 2",
				[3] = "Right Butt Cum 3",
				[4] = "Right Butt Cum 4",
				[5] = "Left Butt Cum 2",
				[6] = "Left Butt Cum 3",
				[7] = "Left Butt Cum 4",
				[8] = "Left Butt Cum 1",
			}
		},
		["Butts Cum 2"] = {
			["Weld"] = {
				[1] = "Right Butt Cum2 1",
				[2] = "Right Butt Cum2 2",
				[3] = "Left Butt Cum2 1",
				[4] = "Left Butt Cum2 2",
			}
		},
		["Torso Cum"] = {
			["Weld"] = {
				[1] = "Torso Cum 1",
				[2] = "Torso Cum 2",
			},
			["Alternative"] = {
				["Condition"] = "RudolphTorso",
				["Weld"] = {
					[1] = "Torso3 Cum 2",
					[2] = "Torso3 Cum 1",
				}
			}
		},
		["Leg Cum"] = {
			["Weld"] = {
				[1] = "Left Leg Cum 1",
				[2] = "Left Leg Cum 2",
				[3] = "Left Leg Cum 3",
				[4] = "Left Leg Cum 4",
				[5] = "Right Leg Cum 1",
				[6] = "Right Leg Cum 2",
				[7] = "Right Leg Cum 3",
			},
			["Alternative"] = {
				["Condition"] = "RudolphLegs",
				["Weld"] = {
					[1] = "LeftLeg3 Cum 1",
					[2] = "LeftLeg3 Cum 2",
					[3] = "LeftLeg3 Cum 3",
					[4] = "LeftLeg3 Cum 4",
					[5] = "RightLeg3 Cum 1",
					[6] = "RightLeg3 Cum 2",
					[7] = "RightLeg3 Cum 3",
				}
			}
		},
		["Arm Cum"] = {
			["Weld"] = {
				[1] = "Left Arm Cum 1",
				[2] = "Left Arm Cum 2",
				[3] = "Right Arm Cum 1",
				[4] = "Right Arm Cum 2",
			},
			["Alternative"] = {
				["Condition"] = "RudolphArms",
				["Weld"] = {
					[1] = "RightArm2 Cum 1",
					[2] = "RightArm2 Cum 2",
					[3] = "LeftArm2 Cum 2",
					[4] = "LeftArm2 Cum 1",
				}
			}
		},
		["Nipple Round Cross Tape"] = {
			["Weld"] = {
				[1] = "Right Round Cross Tape",
				[2] = "Left Round Cross Tape",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
			}
		},
		["Jacket"] = {
			["Weld"] = {
				[1] = "Jacket Shirt",
				[2] = "Right Jacket Arm",
				[3] = "Left Jacket Arm",
				[4] = "Left Jacket Arm 2",
				[5] = "Right Jacket Arm 2",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
			}
		},
		["Dress 2"] = {
			["Weld"] = {
				[1] = "Dress 2",
			}
		},
		["Scarf"] = {
			["Weld"] = {
				[1] = "Scarf"
			}
		},
		["Off Shoulder Hoodie"] = {
			["Weld"] = {
				[1] = "Off Shoulder Hoodie Shirt",
				[2] = "Left Off Shoulder Hoodie Arm",
				[3] = "Right Off Shoulder Hoodie Arm",
				[4] = "Left Off Shoulder Hoodie Arm 2",
				[5] = "Right Off Shoulder Hoodie Arm 2",
			}
		},
		["Short Hoodie"] = {
			["Weld"] = {
				[1] = "Short Hoodie",
				[2] = "Hood",
				[3] = "School Left Arm",
				[4] = "School Right Arm",
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
			}
		},
		["Shoe 2"] = {
			["Weld"] = {
				[1] = "Right Shoe 2",
				[2] = "Left Shoe 2",
			}
		},
		["Shoe 3"] = {
			["Weld"] = {
				[1] = "Right Shoe 3",
				[2] = "Left Shoe 3",
				[3] = "Left Shoe 3 Lower",
				[4] = "Left Shoe 3 Line",
				[5] = "Left Shoe 3 Nurbs Path 1",
				[6] = "Left Shoe 3 Tongue",
				[7] = "Right Shoe 3 Line",
				[8] = "Right Shoe 3 Lower",
				[9] = "Right Shoe 3 Nurbs Path 1",
				[10] = "Right Shoe 3 Nurbs Path 10",
				[11] = "Right Shoe 3 Nurbs Path 11",
				[12] = "Right Shoe 3 Nurbs Path 12",
				[13] = "Right Shoe 3 Nurbs Path 13",
				[14] = "Right Shoe 3 Nurbs Path 14",
				[15] = "Right Shoe 3 Nurbs Path 15",
				[16] = "Right Shoe 3 Nurbs Path 16",
				[17] = "Right Shoe 3 Nurbs Path 2",
				[18] = "Right Shoe 3 Nurbs Path 3",
				[19] = "Right Shoe 3 Nurbs Path 4",
				[20] = "Right Shoe 3 Nurbs Path 5",
				[21] = "Right Shoe 3 Nurbs Path 6",
				[22] = "Right Shoe 3 Nurbs Path 7",
				[23] = "Right Shoe 3 Nurbs Path 8",
				[24] = "Right Shoe 3 Nurbs Path 9",
				[25] = "Right Shoe 3 Tongue",
				[26] = "Left Shoe 3 Nurbs Path 10",
				[27] = "Left Shoe 3 Nurbs Path 11",
				[28] = "Left Shoe 3 Nurbs Path 12",
				[29] = "Left Shoe 3 Nurbs Path 13",
				[30] = "Left Shoe 3 Nurbs Path 14",
				[31] = "Left Shoe 3 Nurbs Path 15",
				[32] = "Left Shoe 3 Nurbs Path 16",
				[33] = "Left Shoe 3 Nurbs Path 2",
				[34] = "Left Shoe 3 Nurbs Path 3",
				[35] = "Left Shoe 3 Nurbs Path 4",
				[36] = "Left Shoe 3 Nurbs Path 5",
				[37] = "Left Shoe 3 Nurbs Path 6",
				[38] = "Left Shoe 3 Nurbs Path 7",
				[39] = "Left Shoe 3 Nurbs Path 8",
				[40] = "Left Shoe 3 Nurbs Path 9",
			}
		},
		["Sock 2"] = {
			["Weld"] = {
				[1] = "Right Sock 2",
				[2] = "Left Sock 2",
				[3] = "Left Sock 2 Line",
				[4] = "Right Sock 2 Line",
			}
		},
		["Glove"] = {
			["Weld"] = {
				[1] = "Right Glove",
				[2] = "Left Glove",
			}
		},
		["Tanktop"] = {
			["Weld"] = {
				[1] = "Tanktop",
			}
		},
		["Uncover Hoodie"] = {
			["Weld"] = {
				[1] = "Uncover Hoodie Breasts Shirt",
				[2] = "Uncover Hoodie Hoodie",
				[3] = "Uncover Hoodie Ropes",
				[4] = "Uncover Hoodie Shirt",
				[5] = "Uncover Hoodie Right Arm",
				[6] = "Uncover Hoodie Left Arm",
			}
		},
		["Yoru Bra"] = {
			["Weld"] = {
				[1] = "Yoru Bra",
				[5] = "Yoru Ring",
			}
		},
		["Yoru String"] = {
			["Weld"] = {
				[2] = "Yoru Middle String",
				[3] = "Yoru Left String",
				[4] = "Yoru Right String",
			}
		},
		["Glove 2"] = {
			["Weld"] = {
				[1] = "Right Glove 2",
				[2] = "Left Glove 2",
			}
		},
		["Womb Mark Cumdiction"] = {
			["Weld"] = {
				[1] = "Cumdiction",
			}
		},
		["Womb Mark Deep Focus"] = {
			["Weld"] = {
				[1] = "Deep Focus",
			}
		},
		["Womb Mark Diction"] = {
			["Weld"] = {
				[1] = "Diction",
			}
		},
		["Womb Mark Gaze"] = {
			["Weld"] = {
				[1] = "Gaze",
			}
		},
		["Womb Mark Glow"] = {
			["Weld"] = {
				[1] = "Glow",
			}
		},
		["Womb Mark Libido"] = {
			["Weld"] = {
				[1] = "Libido",
			}
		},
		["Womb Mark Phermone"] = {
			["Weld"] = {
				[1] = "Phermone",
			}
		},
		["Womb Mark Triggered"] = {
			["Weld"] = {
				[1] = "Triggered",
			}
		},
		["Womb Mark Animalistic"] = {
			["Weld"] = {
				[1] = "Animalistic",
			}
		},
		["Womb Tattoo"] = {
			["Weld"] = {
				[1] = "Womb Tattoo 4",
				[2] = "Womb Tattoo 5",
				[3] = "Womb Tattoo 3",
				[4] = "Womb Tattoo 2",
				[5] = "Womb Tattoo 6",
				[6] = "Womb Tattoo 7",
				[7] = "Womb Tattoo 8",
				[8] = "Womb Tattoo 1",
			}
		},
		["BBC Cock"] = {
			["Weld"] = {
				[1] = "BBC Rod",
				[2] = "BBC Tip",
				[3] = "BBC Balls",
			},
			["HP"] = 4,
		},
		["BBC Cock w/ Easter Ball Paint"] = {
			["Weld"] = {
				[1] = "BBC Rod",
				[2] = "BBC Tip",
				[3] = "EasterSack",
			},
			["HP"] = 4,
		},
		["Cock"] = {
			["Weld"] = {
				[1] = "Cock",
				[2] = "Tip",
				[3] = "Balls",
			},
			["HP"] = 4,
		},
		["Remove Breasts"] = {
			["Unvisible"] = {
				"Left Breast",
				"Right Breast",
				"Left Nipple",
				"Right Nipple",
				"Left Areola",
				"Right Areola",
			}
		},
		["New Woman"] = {
			["Weld"] = {
				[1] = "NewWomanTorsoShirt",
				[2] = "NewWomanLeftArm",
				[3] = "NewWomanRightArm",
				[4] = "NewWomanRightLeg",
				[5] = "NewWomanLeftLeg",
				[6] = "NewWomanTorsoPants",
				[7] = "Left Butt Shirt",
				[8] = "Right Butt Shirt",
			},
		},
		["New Woman Breast"] = {
			["Weld"] = {
				[1] = "NewWomanBreastShirt",
				[2] = "NewWomanBreastPants"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple",
				"Left Breast",
				"Right Breast",
			}
		},
		["Pussy Closed"] = {
			["Weld"] = {
				[1] = "Pussy Closed",
				[2] = "Clitoris Closed",
				[3] = "Vulva Closed",
				[4] = "Vagina Closed",
			},
			["HP"] = 4,
		},
		["Pussy Open"] = {
			["Weld"] = {
				[1] = "Pussy Open",
				[2] = "Clitoris Open",
				[3] = "Vulva Open",
				[4] = "Vagina Open",
			},
			["HP"] = 4,
		},
		["Pussy Cum"] = {
			["Weld"] = {
				[1] = "PussyCumAttacher",
				[2] = "Pussy Cum"
			},
			["HPFunction"] = "HPPussyCum",
			["HP"] = 4,
		},
		["Pussy Cum w/o Trail"] = {
			["Weld"] = {
				[1] = "PussyCumAttacher",
				[2] = "Pussy Cum Trailless"
			},
			["HP"] = 4,
		},
		["Buttplug"] = {
			["Weld"] = {
				[1] = "Buttplug",
				[2] = "ButtplugGem"
			}
		},
		["Croptop"] = {
			["Weld"] = {
				[1] = "Croptop",
				[2] = "Croptop Neck"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Uncover Croptop"] = {
			["Weld"] = {
				[1] = "Lift Croptop",
				[2] = "Croptop Neck"
			}
		},
		["Croptop w/o Neck"] = {
			["Weld"] = {
				[1] = "Croptop"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Uncover Croptop w/o Neck"] = {
			["Weld"] = {
				[1] = "Lift Croptop"
			}
		},
		["Cloth Bra"] = {
			["Weld"] = {
				[1] = "Cloth Bra"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Cropped Sweater"] = {
			["Weld"] = {
				[1] = "Crop Sweater",
				[2] = "Sweater Left Arm",
				[3] = "Sweater Right Arm"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Cropped Sweater 2"] = {
			["Weld"] = {
				[1] = "Crop Sweater 2",
				[2] = "Sweater Left Arm",
				[3] = "Sweater Right Arm"
			},
			["Unvisible"] = {
				"Left Nipple",
				"Right Nipple"
			}
		},
		["Cropped Uncover Sweater"] = {
			["Weld"] = {
				[1] = "Uncovered Crop Sweater",
				[2] = "Sweater Left Arm",
				[3] = "Sweater Right Arm"
			}
		},
		["Nipple Vibrators"] = {
			["Weld"] = {
				[1] = "Left Vibrator Bullet",
				[2] = "Right Vibrator Bullet",
				[3] = "Vibrator Buttons",
				[4] = "Vibrator Tape"
			},
			["HP"] = 3,
		},
		["Lactation"] = {
			["Weld"] = {
				[1] = "Left Nipple Lactation",
				[2] = "Right Nipple Lactation"
			},
			["HP"] = 3,
			["HPFunction"] = "HPLactation"
		},
		["Fishnet Stockings"] = {
			["Weld"] = {
				[1] = "Torso String",
				[2] = "Right Leg String",
				[3] = "Left Leg String",
				[4] = "Left Butt String",
				[5] = "Right Butt String",
				[6] = "Pussy String",
			}
		},
		["Oiled"] = {
			["Weld"] = {
				[1] = "theOilerFunction",
			},
			["Blacklist"] = {"Oiled [ALT]", "Oiled [OLDMETHOD]", "Oiled [SKINONLY]"},
		},
		["Oiled [ALT]"] = {
			["Weld"] = {
				[1] = "theOilerFunction2",
			},
			["Blacklist"] = {"Oiled", "Oiled [OLDMETHOD]", "Oiled [SKINONLY]"},
		},
		["Oiled [OLDMETHOD]"] = {
			["Weld"] = {
				[1] = "theOilerFunctionOld",
			},
			["Blacklist"] = {"Oiled", "Oiled [ALT]", "Oiled [SKINONLY]"},
		},
		["Oiled [SKINONLY]"] = {
			["Weld"] = {
				[1] = "theOilerFunction3",
			},
			["Blacklist"] = {"Oiled", "Oiled [ALT]", "Oiled [OLDMETHOD]"},
		},
		["Breast Freckles"] = {
			["Weld"] = {
				[1] = "RBreastFreckles",
				[2] = "LBreastFreckles",
			}
		},
		["Butt Freckles"] = {
			["Weld"] = {
				[1] = "RButtFreckles",
				[2] = "LButtFreckles",
			}
		},
		["Breast Freckles+"] = {
			["Weld"] = {
				[1] = "RBreastFreckles2",
				[2] = "LBreastFreckles2",
			}
		},
		["Butt Freckles+"] = {
			["Weld"] = {
				[1] = "RButtFreckles2",
				[2] = "LButtFreckles2",
			}
		},
		["Breast Freckles [Editable]"] = {
			["Weld"] = {
				[1] = "RBreastFrecklesC",
				[2] = "LBreastFrecklesC",
			}
		},
		["Butt Freckles [Editable]"] = {
			["Weld"] = {
				[1] = "RButtFrecklesC",
				[2] = "LButtFrecklesC",
			}
		},
		["Nipple Censor Bar"] = {
			["Weld"] = {
				[1] = "nippleCensorBar"
			}
		},
		["Heels [Legs6]"] = {
			["Weld"] = {
				[1] = "rightheel",
				[2] = "rightheelstrap",
				[3] = "leftheel",
				[4] = "leftheelstrap",
			},
		},
		["Colorable Heels [Legs6]"] = {
			["Weld"] = {
				[1] = "rightheelcolors",
				[2] = "rightheelstrap",
				[3] = "leftheelcolors",
				[4] = "leftheelstrap",
			},
		},
		["Furry Knot"] = {
			["Weld"] = {
				[1] = "mainKnot",
				[2] = "ballsKnot",
				[3] = "sheathKnot",
				[4] = "knotBall",
				[5] = "knotSide",
				[6] = "brShaft",
				[7] = "blShaft",
				[8] = "trShaft",
				[9] = "tlShaft",
				[10] = "tipKnot"
			},
			["HP"] = 4,
		},
		["Retracted Knot"] = {
			["Weld"] = {
				[1] = "mainKnotRetracted",
				[2] = "ballsKnotRetracted",
				[3] = "sheathKnotRetracted",
				[4] = "retracted",
			},
			["HP"] = 4,
		},
		["Furry Knot [NEON]"] = {
			["Weld"] = {
				[1] = "mainKnot",
				[2] = "ballsKnot",
				[3] = "sheathKnot",
				[4] = "knotBallN",
				[5] = "knotSideN",
				[6] = "brShaftN",
				[7] = "blShaftN",
				[8] = "trShaftN",
				[9] = "tlShaftN",
				[10] = "tipKnotN"
			},
			["HP"] = 4,
		},
		["Retracted Knot [NEON]"] = {
			["Weld"] = {
				[1] = "mainKnotRetracted",
				[2] = "ballsKnotRetracted",
				[3] = "sheathKnotRetracted",
				[4] = "retractedN",
			},
			["HP"] = 4,
		},
		["Bulge"] = {
			["Weld"] = {
				[1] = "Bulge"
			},
			["HP"] = 2,
		},
		["Horse Cock"] = {
			["Weld"] = {
				[1] = "HorseRod",
				[2] = "HorseBall",
			},
			["HP"] = 4,
		},
		["Cock Twitching"] = {
			["Weld"] = {
				[1] = "TwitchEffect",
			}
		},
	}

	local PartList = Function.PartListDefault()

	local MetaClothes = {
		__index = {
			["Name"] = "Clothes",
			["TextureId"] = "",
			["DoubleSided"] = false,
			["Size"] = Vector3.new(1,1,1),
			["CFrame"] = CFrame.new(0,0,0),
			["CFrame1"] = CFrame.new(0,0,0),
			["Offset"] = Vector3.new(0,0,0),
			["Rotation"] = Vector3.new(0,0,0),
			["Transparency"] = 0,
			["Reflectance"] = 0,
			["MeshBasePartTransparency"] = 0,
			["Material"] = Enum.Material.SmoothPlastic,
			["Shape"] = Enum.PartType.Block,
			["Color"] = {
				["Tone"] = "Base",
				["Color"] = Color3.fromRGB(163, 162, 165)
			},
			["Parent"] = {
				[1] = "Torso",
			},
			["Function"] = "",
			["Scale"] = nil,
			["AdjustScale"] = {"Size", "CFrame", "CFrame1"},
			["HP"] = "",
			["Blacklist"] = {},
		}
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
	
                      ███████╗██╗░░░██╗███╗░░██╗░█████╗░████████╗██╗░█████╗░███╗░░██╗░██████╗
                      ██╔════╝██║░░░██║████╗░██║██╔══██╗╚══██╔══╝██║██╔══██╗████╗░██║██╔════╝
                      █████╗░░██║░░░██║██╔██╗██║██║░░╚═╝░░░██║░░░██║██║░░██║██╔██╗██║╚█████╗░
                      ██╔══╝░░██║░░░██║██║╚████║██║░░██╗░░░██║░░░██║██║░░██║██║╚████║░╚═══██╗
                      ██║░░░░░╚██████╔╝██║░╚███║╚█████╔╝░░░██║░░░██║╚█████╔╝██║░╚███║██████╔╝
                      ╚═╝░░░░░░╚═════╝░╚═╝░░╚══╝░╚════╝░░░░╚═╝░░░╚═╝░╚════╝░╚═╝░░╚══╝╚═════╝░
                                  
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

