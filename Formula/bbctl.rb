class Bbctl < Formula
  desc "Run self-hosted bridges with the Beeper Matrix server"
  homepage "https://github.com/beeper/bridge-manager"
  version "0.15.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-macos-amd64",
          using: :nounzip
      sha256 "887b8a344c2782c150bb84aecd6c144f5b8d028bf9960622cf497730fb5dbf2c"
    end

    on_arm do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-macos-arm64",
          using: :nounzip
      sha256 "4ed8dcd4bfda2500fef7258d6109dfc200a9d7a4046c878d9749962d1219671c"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-linux-amd64",
          using: :nounzip
      sha256 "ff3091816429d41aeb51871445f8ccd77864ebe479a57a4b4a5981fd5051a73e"
    end

    on_arm do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-linux-arm64",
          using: :nounzip
      sha256 "aea4f129ac1dffd964d1ad8a57bd2d080c969f277666d0aa734b73de7c6f0033"
    end
  end

  def install
    binary_name = if OS.mac?
      Hardware::CPU.arm? ? "bbctl-macos-arm64" : "bbctl-macos-amd64"
    elsif OS.linux?
      Hardware::CPU.arm? ? "bbctl-linux-arm64" : "bbctl-linux-amd64"
    end

    bin.install binary_name => "bbctl"
    chmod 0755, bin/"bbctl"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bbctl --version")
  end
end
