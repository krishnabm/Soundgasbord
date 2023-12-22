local WindowModule = {}

WindowModule.win = am.window {
  title = "Hello",
  width = 800,
  height = 600,
  clear_color = vec4(0.5, 0, 0.5, 1),
  borderless = false,
  resizable = true,
  msaa_samples = 2, -- low antialiasing
  highdpi = false
}
WindowModule.win.scene = am.group()

return WindowModule
