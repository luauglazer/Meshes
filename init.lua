--[[
    RoCustomClothes Master Entrypoint (init.lua)

    Strictly requires and loads the modular 'src' folder from the executor workspace.
]]

local g = (type(getgenv) == "function" and getgenv()) or {}
local readfile = readfile or (syn and syn.readfile) or g.readfile
local isfile = isfile or (syn and syn.isfile) or g.isfile
local isfolder = isfolder or (syn and syn.isfolder) or g.isfolder
local loadstring = loadstring or (syn and syn.loadstring) or g.loadstring

local customasset_fn = getcustomasset or (syn and syn.getcustomasset) or (fluxus and fluxus.getcustomasset) or g.getcustomasset
if customasset_fn and type(g) == "table" and not g.getcustomasset then
    g.getcustomasset = customasset_fn
end
local synasset_fn = getsynasset or (syn and syn.getsynasset) or g.getsynasset
if synasset_fn and type(g) == "table" and not g.getsynasset then
    g.getsynasset = synasset_fn
end

if not (readfile and isfile) then
    error("[RoCC Error] Your executor does not support workspace file reading (readfile/isfile).", 2)
end

local sectionFiles = {
    "1_header.lua",
    "2_data.lua",
    "3_partlist.lua",
    "4_physics.lua",
    "5_functions.lua",
    "6_realtime.lua",
    "7_gui.lua",
    "8_loader.lua",
}

-- Locate the 'src' folder in the executor's workspace directory
local function findSrcPrefix()
    local candidatePrefixes = {
        "src/",
        "RoCustomClothes/src/",
        "rocustomclothes/src/",
        "RoCustomClothes-main/src/",
        "workspace/src/",
        "Workspace/src/",
    }

    for _, prefix in ipairs(candidatePrefixes) do
        local allFound = true
        for _, file in ipairs(sectionFiles) do
            if not isfile(prefix .. file) then
                allFound = false
                break
            end
        end
        if allFound then
            return prefix
        end
    end

    return nil
end

local srcPrefix = findSrcPrefix()

if not srcPrefix then
    local separator = string.rep("=", 65)
    local msg = string.format(
        "\n%s\n[RoCC Error] Could not find the 'src' folder in your executor workspace!\n" ..
        "Please ensure the 'src' directory containing the 8 section files is placed\n" ..
        "inside your executor's workspace folder (e.g. 'workspace/src/').\n%s",
        separator, separator
    )
    error(msg, 2)
end

print(string.format("[RoCC] Found 'src' in workspace at: '%s'. Loading modular sections...", srcPrefix))

local combinedChunks = {}
for _, file in ipairs(sectionFiles) do
    local path = srcPrefix .. file
    local content = readfile(path)
    table.insert(combinedChunks, content)
end

local fullScript = table.concat(combinedChunks, "\n")
local executeFunc, compileErr = loadstring(fullScript, "=RoCustomClothes")

if not executeFunc then
    error("[RoCC Error] Failed to compile modular sections from workspace: " .. tostring(compileErr), 2)
end

print("[RoCC] Modular sections compiled successfully! Starting RoCustomClothes...")
executeFunc()
