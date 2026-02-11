---@diagnostic disable: missing-fields
local has_graph, graph = pcall(require, "gitgraph")
if not has_graph then
  return
end

graph.setup({
  git_cmd = "git",
  symbols = {
    merge_commit = 'M',
    commit = '*',
  },
  format = {
    timestamp = '%H:%M:%S %d-%m-%Y',
    fields = { 'hash', 'timestamp', 'author', 'branch_name', 'tag' },
  },
  hooks = {
    -- Check diff of a commit
    on_select_commit = function(commit)
      vim.notify('DiffviewOpen ' .. commit.hash .. '^!')
      vim.cmd(':DiffviewOpen ' .. commit.hash .. '^!')
    end,
    -- Check diff from commit a -> commit b
    on_select_range_commit = function(from, to)
      vim.notify('DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
      vim.cmd(':DiffviewOpen ' .. from.hash .. '~1..' .. to.hash)
    end,
  },
})
