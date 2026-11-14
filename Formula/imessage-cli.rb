class ImessageCli < Formula
  desc "Automate iMessage locally on your Mac"
  homepage "https://github.com/beeper/platform-imessage"
  url "https://github.com/beeper/platform-imessage/releases/download/v0.25.11/imessage-cli-0.25.11-macos-universal.tar.gz"
  sha256 "814e403c0cd04e0fa17bae64f8bd5a5dac16421a0450a621056331f4e2f9fcf9"
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
