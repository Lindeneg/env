local prettier = require("prettier")

prettier.setup({
  bin = 'prettier',
  cli_options = {
    arrow_parens = "always",
    bracket_spacing = true,
    bracket_same_line = false,
    embedded_language_formatting = "auto",
    end_of_line = "lf",
    html_whitespace_sensitivity = "css",
    -- jsx_bracket_same_line = false,
    print_width = 80,
    semi = true,
    single_quote = false,
    tab_width = 4,
    trailing_comma = "es5",
  },
  filetypes = {
    "css",
    "html",
    "javascript",
    "json",
    "typescript",
  },
});

