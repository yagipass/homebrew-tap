class Vbtm < Formula
  desc "Reads .vbtm recordings and shows where the time went"
  homepage "https://github.com/yagipass/verbatime"
  url "https://github.com/yagipass/verbatime/releases/download/v0.8.1/vbtm-darwin-arm64"
  sha256 "8be1e0edcb49f1099db3c17ef358eadd503bc99b9f37a15eeb01ebbebc78a6d8"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.1/vbtm-linux-arm64"
      sha256 "15426c1e040b1e92d6f6bb43cbdc1c8e85efc714c3e2ddf55f2ad23322b0c485"
    end
    on_intel do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.1/vbtm-linux-amd64"
      sha256 "3a29202629191595c0fdec471afa2b7ae1372d250fc9798901f0735c62c24703"
    end
  end

  def install
    bin.install Dir["vbtm-*"].first => "vbtm"
  end

  test do
    assert_match "Usage: vbtm", shell_output("#{bin}/vbtm --help")
  end
end
