class Cli < Formula
  desc "Beeper CLI"
  homepage "https://developers.beeper.com/desktop-api/"
  license "MIT"
  version "0.6.3"

  on_arm do
    url "https://github.com/beeper/cli/releases/download/v0.6.3/beeper-cli-0.6.3-macos-arm64.zip"
    sha256 "a3d1f0df88e5a0c10d9222b5e17e2e232cd7e046bb3e665c70f53f1aed010477"
  end

  on_intel do
    url "https://github.com/beeper/cli/releases/download/v0.6.3/beeper-cli-0.6.3-macos-x64.zip"
    sha256 "6008e57fc920325020d4e574d62a397d47aa84445e0b8bbc5120a17933b78bb5"
  end

  def install
    bin.install "bin/beeper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beeper --version")
  end
end
