library(hexSticker)
library(showtext)

# Load Google font.
#
font_add_google("Roboto Slab", "roboto_slab")
showtext_auto()

sticker(
  here::here("inst/hex/filebin-logo.png"),
  # Image
  s_x = 1,
  s_y = 1.10,
  s_width = 0.6,
  # s_height = 0.6,
  # Package name
  package = "{filebin}",
  p_size = 16,
  p_x = 1.370,
  p_y = 0.365,
  angle = 30,
  p_color = "#000000",
  p_family = "roboto_slab",
  # Hex
  h_fill = "#ffffff",
  h_color = "#000000",
  # Output
  filename = here::here("man/figures/filebin-hex.png"),
  dpi = 300
)
