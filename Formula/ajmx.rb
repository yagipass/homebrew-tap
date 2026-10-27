class Ajmx < Formula
  desc "JMX CLI for AI agents"
  homepage "https://github.com/yagipass/ajmx"
  url "https://github.com/yagipass/ajmx/releases/download/v0.2.1/ajmx-darwin-arm64"
  sha256 "58ba6f9e1833174d5cb1a0dd7f65cfd86f9b23b624ad1f9c8ac2256fb51abb3e"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.1/ajmx-linux-arm64"
      sha256 "755465f52e993193e7fa97c42517938c873b43646ebed7449cac40629a9327f2"
    end
    on_intel do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.1/ajmx-linux-amd64"
      sha256 "f248ad6013401a39c0afefddafceef3316352749fca65ab96a0e33178167cb8f"
    end
  end

  def install
    bin.install Dir["ajmx-*"].first => "ajmx"
  end

  test do
    assert_match '"usage":"ajmx ', shell_output("#{bin}/ajmx help")
  end
end
