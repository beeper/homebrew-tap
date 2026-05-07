class ImessageCli < Formula
  desc "Automate iMessage locally on your Mac"
  homepage "https://github.com/beeper/platform-imessage"
  url "https://github.com/beeper/platform-imessage/releases/download/v0.21.1/imessage-cli-0.21.1-macos-universal.tar.gz"
  sha256 "4bbbdbd122d65d1c0c73e7c567d270e183b73c3af80f4f38cd23ebfe622bc631"
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
