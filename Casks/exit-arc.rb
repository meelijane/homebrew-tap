cask "exit-arc" do
  version "0.4.0"
  sha256 "a3fc3689708c58a8e5b46f5dcb5f74c3d1c10cc186b38ff4fff4cf0e834709fe"

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
