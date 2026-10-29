class Ajmx < Formula
  desc "JMX CLI for AI agents"
  homepage "https://github.com/yagipass/ajmx"
  url "https://github.com/yagipass/ajmx/releases/download/v0.2.2/ajmx-darwin-arm64"
  sha256 "e96df630f1a86ab0e533cb504553233de874a02e8bf83d561874e80d6b0e31ed"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.2/ajmx-linux-arm64"
      sha256 "46123183d097870333db4b70f917b2bb552926a7b6a2fa49da2cd63c036a586b"
    end
    on_intel do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.2/ajmx-linux-amd64"
      sha256 "97fdc82bbf91d5ae7057458ece0acb8f7b957d8914968df7ddd6e576345c0142"
    end
  end

  def install
    bin.install Dir["ajmx-*"].first => "ajmx"
  end

  test do
    assert_match '"usage":"ajmx ', shell_output("#{bin}/ajmx help")
  end
end
