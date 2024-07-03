return {
  name = "flutter test",
  builder = function()
    return {
      cmd = { "fvm", "flutter", "test" },
    }
  end,
  condition = {
    filetype = { "dart" },
  }

}
