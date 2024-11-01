local leaderNmap = require 'utils'.leaderNmap
local nt = require 'neotest'


nt.setup {
  adapters = {
    require('rustaceanvim.neotest')({}),
    require('neotest-dart')({
      command = 'fvm flutter',
      use_lsp = false,
    })
  }
}

leaderNmap("nt", nt.run.run, "[N]eotest [R]un")
leaderNmap("no", nt.output_panel.toggle, "[N]eotest [O]utput")
leaderNmap("na", function()
  nt.run.run(vim.fn.expand("%"))
end, "[N]eotest [A]ll")

leaderNmap("ns", nt.summary.toggle, "[N]eotest [S]ummary")

leaderNmap("nwt", function()
  nt.watch.toggle()
end, "[N]eotest [W]atch [T]est (toggle)")

leaderNmap("nwa", function()
  nt.watch.toggle(vim.fn.expand("%"))
end, "[N]eotest [W]atch [A]ll (toggle)")
