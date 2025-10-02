local bannertext = {
  '                                                       NVIM v0.10.2',
  '',
  '                                       Nvim is open source and freely distributable',
  '                                                 https://neovim.io/#chat',
  '',
  '                                      type  :help nvim<Enter>       if you are new!',
  '                                      type  :checkhealth<Enter>     to optimize Nvim',
  '                                      type  :q<Enter>               to exit',
  '                                      type  :help<Enter>            for help',
  '',
  '                                     type  :help news<Enter> to see changes in v0.10',
  '',
  '                                              Help poor children in Uganda!',
  '                                      type  :help iccf<Enter>       for information',
}

require('dashboard').setup {
  theme = 'doom',
  config = {
    header = bannertext,
    center = {
      {
        icon = ' ',
        desc = 'Projects',
        key = 'p',
        -- keymap = 'SPC f d',
        key_format = ' %s',
        action = 'Telescope project',
      },
    },
    footer = {}, --your footer
  },
}
