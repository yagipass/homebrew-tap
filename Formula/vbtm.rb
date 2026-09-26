class Vbtm < Formula
  desc "Reads .vbtm recordings and shows where the time went"
  homepage "https://github.com/yagipass/verbatime"
  url "https://github.com/yagipass/verbatime/releases/download/v0.8.0/vbtm-macos-arm64"
  sha256 "ea4041efcb3d46ab65793d4b008a2203c6cc2e0c04ef124eb3471ddcfa4d2dc1"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.0/vbtm-linux-arm64"
      sha256 "5bff56afa940db5b8a3f848d3bc3c92e6a7c5e4b57783e8f1a9f109149377e9c"
    end
    on_intel do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.0/vbtm-linux-amd64"
      sha256 "1814b3ac8b06180026221d228654bd1780bbfc81888efa7c8da23267e2d4bba1"
    end
  end

  def install
    bin.install Dir["vbtm-*"].first => "vbtm"
  end

  test do
    assert_match "Usage: vbtm", shell_output("#{bin}/vbtm --help")
  end
end
