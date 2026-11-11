class ExitArc < Formula
  desc "Move your Arc sidebar into Firefox, Zen or Chrome, or save it as files"
  homepage "https://github.com/meelijane/exit-arc"
  url "https://github.com/meelijane/exit-arc/archive/refs/tags/v0.3.0.tar.gz"
  sha256 "81f234ee1e6d34fffbdddb830973534211754cc04cfe2df68b9d366628679127"
  license "MIT"

  depends_on :macos
  depends_on "python@3.13"

  def install
    python3 = Formula["python@3.13"].opt_bin/"python3.13"
    system python3, "scripts/build_pyz.py"
    libexec.install "dist/exit-arc.pyz"
    (bin/"exit-arc").write <<~SH
      #!/bin/sh
      exec "#{python3}" "#{libexec}/exit-arc.pyz" "$@"
    SH
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/exit-arc --version")
    assert_match "Spaces as real spaces", shell_output("#{bin}/exit-arc --capabilities")
  end
end
