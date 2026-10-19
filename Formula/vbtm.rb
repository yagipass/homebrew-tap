class Vbtm < Formula
  desc "Reads .vbtm recordings and shows where the time went"
  homepage "https://github.com/yagipass/verbatime"
  url "https://github.com/yagipass/verbatime/releases/download/v0.8.2/vbtm-darwin-arm64"
  sha256 "48880bf5dd78ec219195ba532b501da7d935b7657e4d7b1fd497810dbb1f5b2c"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.2/vbtm-linux-arm64"
      sha256 "54a60d5d9abc68e3d693dbdf7a855036d795ed1130ebfad3fb338e170972d9c5"
    end
    on_intel do
      url "https://github.com/yagipass/verbatime/releases/download/v0.8.2/vbtm-linux-amd64"
      sha256 "815b1ec771f7ae0acbf9f048498b6528e9323b47651aeb81cb94c979969e979c"
    end
  end

  def install
    bin.install Dir["vbtm-*"].first => "vbtm"
  end

  test do
    assert_match "Usage: vbtm", shell_output("#{bin}/vbtm --help")
  end
end
