local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()

  local function SetTimeFormat(use24)
    SetCVar("timeMgrUseMilitaryTime", use24 and 1 or 0)
    if TimeManagerMilitaryTimeCheck then
      TimeManagerMilitaryTimeCheck:SetChecked(use24)
    end
    if TimeManager_MilitaryTimeCheck then
      TimeManager_MilitaryTimeCheck()
    end
  end

  -- Apply saved setting
  SetTimeFormat(GetCVar("timeMgrUseMilitaryTime") == "1")

  -- Create dropdown
  local dropdown = CreateFrame("Frame", "Clock24H_Dropdown", UIParent, "UIDropDownMenuTemplate")

  local function InitDropdown(self, level)
    local info = {}

    info.text = "Clock Format"
    info.isTitle = true
    info.notCheckable = true
    UIDropDownMenu_AddButton(info)

    info = {}
    info.text = "24-Hour"
    info.checked = GetCVar("timeMgrUseMilitaryTime") == "1"
    info.func = function() SetTimeFormat(true) end
    UIDropDownMenu_AddButton(info)

    info = {}
    info.text = "AM/PM"
    info.checked = GetCVar("timeMgrUseMilitaryTime") == "0"
    info.func = function() SetTimeFormat(false) end
    UIDropDownMenu_AddButton(info)
  end

  UIDropDownMenu_Initialize(dropdown, InitDropdown)

  -- Invisible overlay on top of the clock to catch right-clicks
  local overlay = CreateFrame("Button", nil, MinimapCluster)
overlay:SetWidth(55)
overlay:SetHeight(14)
overlay:SetPoint("BOTTOM", MinimapCluster, "BOTTOM", 15, 22)
overlay:SetFrameLevel(MinimapCluster:GetFrameLevel() + 10)
overlay:RegisterForClicks("RightButtonUp")
overlay:SetScript("OnClick", function()
  ToggleDropDownMenu(1, nil, Clock24H_Dropdown, "cursor", 0, 0)
end)

end)
