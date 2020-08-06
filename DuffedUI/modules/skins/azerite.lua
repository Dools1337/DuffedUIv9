local D, C, L = unpack(select(2, ...))
-- Thx Wetxius and Shestak

local function LoadSkin()
	Mixin(AzeriteEssenceUI, BackdropTemplateMixin)
	AzeriteEssenceUI:StripTextures()
	AzeriteEssenceUI:SetTemplate("Transparent")

	AzeriteEssenceUIPortrait:SetAlpha(0)
	AzeriteEssenceUI.NineSlice:Kill()
	AzeriteEssenceUI.LeftInset.NineSlice:Kill()
	AzeriteEssenceUI.RightInset.NineSlice:Kill()

	AzeriteEssenceUI.PowerLevelBadgeFrame:ClearAllPoints()
	AzeriteEssenceUI.PowerLevelBadgeFrame:SetPoint("TOPLEFT")
	AzeriteEssenceUI.PowerLevelBadgeFrame.Ring:Hide()
	AzeriteEssenceUI.PowerLevelBadgeFrame.BackgroundBlack:Hide()

	for _, button in pairs(AzeriteEssenceUI.EssenceList.buttons) do
		button:DisableDrawLayer("ARTWORK")
		button:StyleButton(nil, 3)

		button.bg = CreateFrame("Frame", nil, button)
		button.bg:CreateBackdrop("Overlay")
		button.bg:SetFrameLevel(button:GetFrameLevel() - 1)
		button.bg:SetPoint("TOPLEFT", 3, -3)
		button.bg:SetPoint("BOTTOMRIGHT", -3, 3)
		
		button:CreateBackdrop()
		button.backdrop:ClearAllPoints()
		button.backdrop:SetOutside(button.Icon)
		button.Icon:SetTexCoord(unpack(D['IconCoord']))
		button.backdrop:SetFrameLevel(button:GetFrameLevel())
	end

	local HeaderButton = AzeriteEssenceUI.EssenceList.HeaderButton
	HeaderButton.Middle:Hide()
	HeaderButton.Left:Hide()
	HeaderButton.Right:Hide()

	AzeriteEssenceUI.EssenceList.ScrollBar:SkinScrollBar()
	AzeriteEssenceUICloseButton:SkinCloseButton()
end

D['SkinFuncs']['Blizzard_AzeriteEssenceUI'] = LoadSkin