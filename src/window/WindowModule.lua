_G.AmuletTk = {};
AmuletTk.WindowModule = {}
AmuletTk.isTouchEnv = am.platform == "ios" or am.platform == "android"

AmuletTk.WindowModule.win = am.window {
  title = "Soundgasboard",
  width = 720,
  height = 1600,
  clear_color = vec4(0.1, 0.1, 0.1, 1),
  borderless = false,
  resizable = true,
  msaa_samples = 0, -- low antialiasing
  highdpi = false
}
AmuletTk.WindowModule.win.scene = am.group()

