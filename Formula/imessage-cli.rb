class ImessageCli < Formula
  desc "Automate iMessage locally on your Mac"
  homepage "https://github.com/beeper/platform-imessage"
  url "https://github.com/beeper/platform-imessage/archive/refs/tags/v0.21.1.tar.gz"
  sha256 "d7d3964b337b13064ec571d22f888bf748719148f62f40eb48facef4b4450bf1"
  license "MIT"
  head "https://github.com/beeper/platform-imessage.git", branch: "main"

  depends_on xcode: ["26.1", :build]

  on_macos do
    depends_on macos: :big_sur
  end

  def install
    system "swift", "build", "-c", "release", "--product", "imessage-cli", "--disable-sandbox"
    bin.install ".build/release/imessage-cli"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/imessage-cli version")
  end
end
