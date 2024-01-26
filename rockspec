package = "HoGBot-Library"
version = "0.1-0"
source = {
  url = "git://github.com/TibiaHoGBot/HoGBot-Library.git"
}
dependencies = {
  "lua >= 5.1, < 5.4",
  "busted"
}
build = {
  type = "command",
  build_command = "busted tests/"
}
