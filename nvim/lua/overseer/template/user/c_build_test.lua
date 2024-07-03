return {
  name = "C run",
  builder = function()
    return { cmd = { "gcc main.c && ./a.out" }, }
  end,

  condition = {
    filetype = { "C" }
  }

}
