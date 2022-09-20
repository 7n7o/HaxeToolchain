local PARAMS = {...}

local INPUT_PATH = assert(PARAMS[1], "Input path not specified")
local OUTPUT_PATH = assert(PARAMS[2], "Output path not specified")

local function transformInput(source)
    source = string.gsub(source, '_G%.require%("lua%-utf8"%)', "utf8")
    source = string.gsub(source, '_G%.math%.POSITIVE_INFINITY', "math.huge")
    source = string.gsub(source, '_G%.math%.NEGATIVE_INFINITY', "-math.huge")
    source = string.gsub(source, '_G', 'getgenv()')
    return source
end

local function main()
    local project  = remodel.readModelFile(INPUT_PATH)[1]
    for _, module in ipairs(project:GetDescendants()) do
        if module.ClassName == "ModuleScript" or module.ClassName == "LocalScript" then
            local source = remodel.getRawProperty(module, "Source")
            source = transformInput(source)
            remodel.setRawProperty(module, "Source", "String", source)
        end
    end
    remodel.writeModelFile(project, OUTPUT_PATH)
end

main()