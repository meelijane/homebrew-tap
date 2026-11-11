cask "exit-arc" do
  version "0.3.0"
  sha256 "812016407456934de291010a6e4ceb2b7cb20c8083921b02f366a151dd8dbb24"

  url "https://github.com/meelijane/exit-arc/releases/download/v#{version}/exit-arc.pyz"
  name "exit-arc"
  desc "Move your Arc sidebar into Firefox, Zen or Chrome, or save it as files"
  homepage "https://github.com/meelijane/exit-arc"

  container type: :naked

  binary "exit-arc.pyz", target: "exit-arc"

  postflight do
    set_permissions "#{staged_path}/exit-arc.pyz", "0755"
  end

  caveats "Runs with the python3 on your PATH (Python 3.8 or newer; macOS has one)."
end
