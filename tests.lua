-- Lua Globals --
-- luacheck: globals print

local lib = _G.LibStub("LibIconFonts-1.0")

function _G.IconFontTest()
    print("IconFontTest")
    local fa = lib:GetIconFont("FontAwesome-4.7")
    fa.path = [[Interface\AddOns\RealUI_Skins\Media\fontawesome-webfont.ttf]]

    local frame = _G.CreateFrame("Frame", nil, _G.UIParent, "BasicFrameTemplate")
    frame:SetSize(925, 600)
    frame:SetPoint("CENTER")
    frame:EnableMouse(true)
    frame:SetMovable(true)
    frame:SetScript("OnMouseDown", function(self, button)
        frame:StartMoving()
    end)
    frame:SetScript("OnMouseUp", function(self, button)
        frame:StopMovingOrSizing()
    end)

    local line = frame:CreateTexture(nil, "ARTWORK")
    line:SetTexture(1, 1, 1, 1)
    line:SetHeight(1)
    line:SetPoint("LEFT", 3, 0)
    line:SetPoint("RIGHT", -3, 0)

    local previous
    local size = 16
    for i = 1, 6 do
        local textNormal = frame:CreateFontString(nil, "ARTWORK")
        textNormal:SetFont([[Fonts\FRIZQT__.TTF]], size, "OUTLINE")
        textNormal:SetText(size)
        if not previous then
            textNormal:SetPoint("BOTTOMLEFT", line, "TOPLEFT", 5, 5)
        else
            textNormal:SetPoint("BOTTOMLEFT", previous, "BOTTOMRIGHT", 5, 0)
        end

        local textIcons = frame:CreateFontString(nil, "ARTWORK")
        textIcons:SetFont(fa.path, size, "OUTLINE")
        textIcons:SetText(fa.microphone)
        textIcons:SetPoint("TOP", textNormal, "BOTTOM", 0, -10)
        previous = textNormal
        size = size + size
    end
end

function _G.FontSizeTest()
    local frame = _G.CreateFrame("Frame", nil, _G.UIParent)
    frame:SetAllPoints()

    local tex = frame:CreateTexture()
    tex:SetAllPoints()
    tex:SetColorTexture(0, 0, 0)

    local previous = frame
    local size = 250
    for i = 1, 7 do
        local text = frame:CreateFontString(nil, "ARTWORK")
        text:SetFont([[Fonts\ARIALN.TTF]], size, "")
        text:SetText("M")
        text:SetPoint("LEFT", frame, "RIGHT", previous:GetRight() + 5, 0)

        local sizeText = frame:CreateFontString(nil, "ARTWORK")
        sizeText:SetFont([[Fonts\ARIALN.TTF]], 32, "")
        sizeText:SetText(size)
        sizeText:SetPoint("TOP", text, "BOTTOM", 0, -10)

        previous = text
        size = size + 2
    end
end
