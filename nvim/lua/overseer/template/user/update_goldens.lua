return {
  name = "flutter update goldens",
  builder = function()
    return {
      cmd = { "fvm", "flutter", "test", "--update-goldens", "--tags=golden" },
    }
  end,
  condition = {
    filetype = { "dart" },
  }

}
