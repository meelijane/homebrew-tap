cask "exit-arc" do
  version "0.4.2"
  sha256 "3bc8129eafc4b8e93eb996a82d09a43201f1a9756eaf609012331156e139600d"

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
