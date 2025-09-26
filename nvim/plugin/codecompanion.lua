
require('codecompanion').setup {
  adapters = {
    openai = function()
      return require('codecompanion.adapters').extend('openai', {
        schema = {
          model = {
            default = 'gpt-4.1',
          },
        },
      })
    end,
  },
}
