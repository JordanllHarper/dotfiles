return {
  name = "dart build",
  builder = function()
    return {
      cmd = { "fvm", "dart", "run", "build_runner", "build", "--delete-conflicting-outputs" },
    }
  end,
  condition = {
    filetype = { "dart" },
  }

}
