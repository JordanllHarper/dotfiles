return {
  name = "c build main",
  builder = function()
    return {
      cmd = { "gcc", },
      args = { "main.c" }
    }
  end,
  condition = {
    filetype = { "c", "cpp", },
  }
}
