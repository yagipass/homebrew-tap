class Vbtm < Formula
  desc "Reads .vbtm recordings and shows where the time went"
  homepage "https://github.com/yagipass/verbatime"
  url "https://github.com/yagipass/verbatime/releases/download/v0.8.3/vbtm-darwin-arm64"
  sha256 "ffc657579d6a6843ed87c4e8a39fd885e9ff1e8498bc1a0789e102827a2a7418"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.3/vbtm-linux-arm64"
      sha256 "a2d84716b9615fda1e4aab55732419fb3a92fba711bdc0fba0383f1e2e8a9584"
    end
    on_intel do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.3/vbtm-linux-amd64"
      sha256 "81daa00088e1d02f0456caf16bbd1bf947e8ca88bc3065b048eda0ddeba16166"
    end
  end

  def install
    bin.install Dir["vbtm-*"].first => "vbtm"
  end

  test do
    assert_match "Usage: vbtm", shell_output("#{bin}/vbtm --help")
  end
end
