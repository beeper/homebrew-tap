class ImessageCli < Formula
  desc "Automate iMessage locally on your Mac"
  homepage "https://github.com/beeper/platform-imessage"
  url "https://github.com/beeper/platform-imessage/releases/download/v0.21.12/imessage-cli-0.21.12-macos-universal.tar.gz"
  sha256 "c8c5eb195fe8282ce0ebadee4b4a246f4ca159a9f5795893eadbf00e0d195526"
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
