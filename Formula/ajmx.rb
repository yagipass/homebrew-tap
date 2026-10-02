class Ajmx < Formula
  desc "JMX CLI for AI agents"
  homepage "https://github.com/yagipass/ajmx"
  url "https://github.com/yagipass/ajmx/releases/download/v0.1.0/ajmx-darwin-arm64"
  sha256 "0000000000000000000000000000000000000000000000000000000000000000"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/ajmx/releases/download/v0.1.0/ajmx-linux-arm64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
    on_intel do
      url "https://github.com/yagipass/ajmx/releases/download/v0.1.0/ajmx-linux-amd64"
      sha256 "0000000000000000000000000000000000000000000000000000000000000000"
    end
  end

  def install
    bin.install Dir["ajmx-*"].first => "ajmx"
  end

  test do
    assert_match '"usage":"ajmx ', shell_output("#{bin}/ajmx help")
  end
end
