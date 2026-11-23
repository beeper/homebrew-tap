class ImessageCli < Formula
  desc "Automate iMessage locally on your Mac"
  homepage "https://github.com/beeper/platform-imessage"
  url "https://github.com/beeper/platform-imessage/releases/download/v0.25.13/imessage-cli-0.25.13-macos-universal.tar.gz"
  sha256 "58e1b6b4343be7efda87975e9818d89cfeadbe84ab740aeefbce6cccec301e1b"
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
