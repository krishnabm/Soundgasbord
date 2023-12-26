_G.AmuletTk = {};
AmuletTk.WindowModule = {}
AmuletTk.isTouchEnv = am.platform == "ios" or am.platform == "android"
AmuletTk.store = {}
AmuletTk.store.enableGlissando = false;
AmuletTk.store.enableLoop = false;
math.randomseed(os.time())
-- AmuletTk.store.noteCode = math.random(100000, 999999) * 100 + math.random(0,9);
AmuletTk.store.noteCode = 55581500;
print("Note code -> " .. AmuletTk.store.noteCode)

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

