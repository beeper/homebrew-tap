class Bbctl < Formula
  desc "Run self-hosted bridges with the Beeper Matrix server"
  homepage "https://github.com/beeper/bridge-manager"
  version "0.14.0"
  license "Apache-2.0"

  on_macos do
    on_intel do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-macos-amd64",
          using: :nounzip
      sha256 "022bc3cb989baaa8e67859cdbce624640cd4cf7d12e996511fe040bd6ec3d527"
    end

    on_arm do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-macos-arm64",
          using: :nounzip
      sha256 "b06e094e4a1f1e212d852db512f106a5a707ae5e2571fb3526a041d2fcac096b"
    end
  end

  on_linux do
    on_intel do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-linux-amd64",
          using: :nounzip
      sha256 "50a73eeac380093bd5a79a1736e7640595dc968aacd37bae6d5b1ac408f909bc"
    end

    on_arm do
      url "https://github.com/beeper/bridge-manager/releases/download/v#{version}/bbctl-linux-arm64",
          using: :nounzip
      sha256 "2b15dcc0595ef1194046814dff7bf1daa57d56bddf18d5dbf10221b4c2963a72"
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
