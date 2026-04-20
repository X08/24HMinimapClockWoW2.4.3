local f = CreateFrame("Frame")
f:RegisterEvent("PLAYER_LOGIN")
f:SetScript("OnEvent", function()
  -- Enable the built-in 24h (military time) setting
  SetCVar("timeMgrUseMilitaryTime", 1)
  -- Tick the checkbox if TimeManager is loaded
  if TimeManagerMilitaryTimeCheck then
    TimeManagerMilitaryTimeCheck:SetChecked(1)
    TimeManager_MilitaryTimeCheck()
  end
end)
