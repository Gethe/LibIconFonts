-- Lua Globals --
-- luacheck: globals assert type

local MAJOR, MINOR = "LibIconFonts-1.0", 1 -- Should be manually increased
assert(_G.LibStub, MAJOR .. " requires LibStub")

local lib, oldminor = _G.LibStub:NewLibrary(MAJOR, MINOR) --luacheck: ignore
if not lib then return end -- No upgrade needed

local fonts = {}

-- Retrieve a specific icon font
-- @param fontName The name of the font
function lib:GetIconFont(fontName)
    assert(fonts[fontName], fontName.."has not been registered.")
    if type(fonts[fontName]) ~= "table" then
        fonts[fontName] = fonts[fontName]()
    end
    return fonts[fontName]
end

-- Register an icon font
-- @param fontName The name of the font
-- @param fontFunc A function that returns a table containing the font icons
function lib:RegisterIconFont(fontName, fontFunc)
    assert(not fonts[fontName], fontName.."has already been registered.")
    assert(type(fontFunc) == "function", "fontFunc must be a function, got "..type(fontFunc))
    fonts[fontName] = fontFunc
end
