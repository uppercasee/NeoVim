local status_ok, _ = pcall(require, "impatient")
  if status_ok then
    require("impatient").enable_profile()
  end
