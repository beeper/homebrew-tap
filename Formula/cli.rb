class Cli < Formula
  desc "Beeper CLI"
  homepage "https://developers.beeper.com/desktop-api/"
  license "MIT"
  version "0.6.4"

  on_arm do
    url "https://github.com/beeper/cli/releases/download/v0.6.4/beeper-cli-0.6.4-macos-arm64.zip"
    sha256 "1687c2f1642b5254e6b0396cb4de4d331697682005b7aad7db452dead1223958"
  end

  on_intel do
    url "https://github.com/beeper/cli/releases/download/v0.6.4/beeper-cli-0.6.4-macos-x64.zip"
    sha256 "8eacbda7de4935dae3bc81b5785f06b6680c6d1f28b727558ad2527752002035"
  end

  def install
    bin.install "bin/beeper"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/beeper --version")
  end
end
