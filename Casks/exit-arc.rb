cask "exit-arc" do
  version "0.4.1"
  sha256 "a1aa3a9cd159af30a8294f28140e6748067e6ea1121752f5f095f1060a286e65"

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
