class ImessageCli < Formula
  desc "Automate iMessage locally on your Mac"
  homepage "https://github.com/beeper/platform-imessage"
  url "https://github.com/beeper/platform-imessage/releases/download/v0.22.5/imessage-cli-0.22.5-macos-universal.tar.gz"
  sha256 "4322e1f5a5a6f48272c68c0aa4e1289937044d04889b2b968387d478ea578c63"
  license "MIT"
  head "https://github.com/beeper/platform-imessage.git", branch: "main"

  on_macos do
    depends_on macos: :big_sur
  end

  def install
    bin.install "imessage-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imessage-cli version")
  end
end
