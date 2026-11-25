class Ajmx < Formula
  desc "JMX CLI for AI agents"
  homepage "https://github.com/yagipass/ajmx"
  url "https://github.com/yagipass/ajmx/releases/download/v0.2.3/ajmx-darwin-arm64"
  sha256 "5560b9dd3e539cb064eb591184557434f71e9f1ab23a91b407e242afc787bf26"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.3/ajmx-linux-arm64"
      sha256 "4994e1d5ef3c7539f2623accad2f02d25eb6eac4b287d12eef81a2ef9ed6febb"
    end
    on_intel do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.3/ajmx-linux-amd64"
      sha256 "49730043a97441c882d5077de2f8fe692b1619dc986bbc879b214d88eee7d860"
    end
  end

  def install
    bin.install Dir["ajmx-*"].first => "ajmx"
  end

  test do
    assert_match '"usage":"ajmx ', shell_output("#{bin}/ajmx help")
  end
end
