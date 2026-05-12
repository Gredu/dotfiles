local signatures = {
  SaaShop = {
    fi = {
      greeting = "Hei,",
      sig = {
        "Greatman Lim,",
        "R&D Tiimin vetäjä",
        "SaaShop Oy",
        "+358445200985",
      },
    },
    en = {
      greeting = "Hi,",
      sig = {
        "Greatman Lim,",
        "R&D Team Lead",
        "SaaShop Oy",
        "+358445200985",
      },
    },
  },
  Comets = {
    fi = { greeting = "Hei,", sig = { "Greatman Lim" } },
    en = { greeting = "Hi,", sig = { "Greatman Lim" } },
  },
  Gmail = {
    fi = { greeting = "Hei,", sig = { "Greatman Lim" } },
    en = { greeting = "Hi,", sig = { "Greatman Lim" } },
  },
  Mahti = {
    fi = { greeting = "Hei,", sig = { "Greatman Lim" } },
    en = { greeting = "Hi,", sig = { "Greatman Lim" } },
  },
}

local function insert_template(lang)
  local account = vim.env.AERC_ACCOUNT or "Gmail"
  local data = signatures[account] or signatures.Gmail
  local tmpl = data[lang]

  local lines = { tmpl.greeting, "", "", "" }
  for _, line in ipairs(tmpl.sig) do
    lines[#lines + 1] = line
  end

  vim.api.nvim_buf_set_lines(0, 0, -1, false, lines)
  vim.api.nvim_win_set_cursor(0, { 2, 0 })
  vim.cmd("startinsert")
end

vim.keymap.set("n", "sfi", function() insert_template("fi") end, { buffer = true })
vim.keymap.set("n", "sen", function() insert_template("en") end, { buffer = true })
