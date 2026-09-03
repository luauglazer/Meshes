local g = (type(getgenv) == "function" and getgenv()) or {}
local readfile = readfile or (syn and syn.readfile) or g.readfile
local isfile = isfile or (syn and syn.isfile) or g.isfile
local isfolder = isfolder or (syn and syn.isfolder) or g.isfolder
local writefile = writefile or (syn and syn.writefile) or g.writefile
local makefolder = makefolder or (syn and syn.makefolder) or g.makefolder
local loadstring = loadstring or (syn and syn.loadstring) or g.loadstring

local customasset_fn = getcustomasset or (syn and syn.getcustomasset) or (fluxus and fluxus.getcustomasset) or g.getcustomasset
if customasset_fn and type(g) == "table" and not g.getcustomasset then
    g.getcustomasset = customasset_fn
end
local synasset_fn = getsynasset or (syn and syn.getsynasset) or g.getsynasset
if synasset_fn and type(g) == "table" and not g.getsynasset then
    g.getsynasset = synasset_fn
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

local GITHUB_BASE = "https://raw.githubusercontent.com/luauglazer/Meshes/main/src/"

local function fetchUrl(url)
    local s, res = pcall(game.HttpGet, game, url)
    if s and type(res) == "string" and #res > 0 then
        return res
    end
    local req = (type(request) == "function" and request)
        or (type(http_request) == "function" and http_request)
        or (syn and type(syn.request) == "function" and syn.request)
        or (fluxus and type(fluxus.request) == "function" and fluxus.request)
        or (http and type(http.request) == "function" and http.request)
        or (type(g.request) == "function" and g.request)
    if req then
        local s2, resp = pcall(req, {Url = url, Method = "GET"})
        if s2 and resp and resp.Body and #resp.Body > 0 then
            return resp.Body
        end
    end
    return nil
end

local function findSrcPrefix()
    if not (isfile and readfile) then return nil end
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

local function loadFromLocal(prefix)
    if not prefix or not readfile then return nil, "No local prefix" end
    local chunks = {}
    for _, file in ipairs(sectionFiles) do
        local path = prefix .. file
        local ok, content = pcall(readfile, path)
        if not ok or not content or #content == 0 then
            return nil, "Failed to read local file: " .. path
        end
        table.insert(chunks, content)
    end
    local fullScript = table.concat(chunks, "\n")
    local executeFunc, compileErr = loadstring(fullScript, "=RoCustomClothes")
    if not executeFunc then
        return nil, "Compile error: " .. tostring(compileErr)
    end
    return executeFunc
end

local function loadFromGitHub()
    print("[RoC] Pulling modular sections from GitHub (luauglazer/Meshes)...")
    local chunks = {}
    for idx, file in ipairs(sectionFiles) do
        print(string.format("[RoC] Fetching section (%d/%d): %s...", idx, #sectionFiles, file))
        local content = fetchUrl(GITHUB_BASE .. file)
        if not content or #content == 0 then
            return nil, "Failed to fetch " .. file .. " from GitHub"
        end
        table.insert(chunks, content)

        if writefile and makefolder then
            pcall(function()
                if isfolder and not isfolder("src") then
                    makefolder("src")
                end
                writefile("src/" .. file, content)
            end)
        end
    end

    local fullScript = table.concat(chunks, "\n")
    local executeFunc, compileErr = loadstring(fullScript, "=RoCustomClothes")
    if not executeFunc then
        return nil, "GitHub script compile error: " .. tostring(compileErr)
    end
    return executeFunc
end

local executeFunc = nil
local loadError = nil
local srcPrefix = findSrcPrefix()

if g.RoCC_ForceGitHub then
    executeFunc, loadError = loadFromGitHub()
    if not executeFunc and srcPrefix then
        warn("[RoC Warning] GitHub load failed: " .. tostring(loadError) .. ". Falling back to local workspace...")
        executeFunc, loadError = loadFromLocal(srcPrefix)
    end
elseif srcPrefix then
    print(string.format("[RoCC] Found 'src' in workspace at: '%s'. Loading modular sections...", srcPrefix))
    executeFunc, loadError = loadFromLocal(srcPrefix)
    if not executeFunc then
        warn("[RoC Warning] Local compilation failed: " .. tostring(loadError) .. ". Attempting GitHub fallback...")
        executeFunc, loadError = loadFromGitHub()
    end
else
    executeFunc, loadError = loadFromGitHub()
end

if not executeFunc then
    local separator = string.rep("=", 65)
    local msg = string.format(
        "\n%s\n[RoC Error] Failed to load RoClothes modular sections!\n" ..
        "Reason: %s\n" ..
        "Please ensure your internet connection is active, or place the 'src'\n" ..
        "folder inside your executor's workspace directory (e.g. 'workspace/src/').\n%s",
        separator, tostring(loadError), separator
    )
    error(msg, 2)
end

print("[RoC]  compiled successfully! Starting RoClothes...")
executeFunc()
