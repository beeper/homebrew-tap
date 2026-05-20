class Cli < Formula
  desc "Beeper CLI"
  homepage "https://developers.beeper.com/desktop-api/"
  license "MIT"
  version "0.6.2"

  if OS.mac? && RbConfig::CONFIG["host_cpu"] == "arm64"
    url "https://github.com/beeper/cli/releases/download/v0.6.2/beeper-cli-0.6.2-macos-arm64.zip"
    sha256 "688ccde7e7d044d33980cd06474bf1ae7215ccf8ca79967262fa3bfb85a2589a"
  elsif OS.mac? && RbConfig::CONFIG["host_cpu"] == "x86_64"
    url "https://github.com/beeper/cli/releases/download/v0.6.2/beeper-cli-0.6.2-macos-x64.zip"
    sha256 "4113a1979cfbd7839f14743158e70c12efa941313afb77ab2b11a08309196186"
  else
    odie "Unsupported platform"
  end

  def install
    bin.install "beeper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beeper --version")
  end
end
