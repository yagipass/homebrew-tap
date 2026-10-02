class Ajmx < Formula
  desc "JMX CLI for AI agents"
  homepage "https://github.com/yagipass/ajmx"
  url "https://github.com/yagipass/ajmx/releases/download/v0.1.0/ajmx-darwin-arm64"
  sha256 "cc3083907986e94deab3407c4c145ef3d03315e41793f60c39254e3503dd20c9"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/ajmx/releases/download/v0.1.0/ajmx-linux-arm64"
      sha256 "34ee76e8b5220c29619574974aea6bbc1fbdb429087790c3f58d326e3dc127fc"
    end
    on_intel do
      url "https://github.com/yagipass/ajmx/releases/download/v0.1.0/ajmx-linux-amd64"
      sha256 "3c5aab52c818db525e68a4c7ecebb0439592dea32620ad9c4cf68386f2e07c52"
    end
  end

  def install
    bin.install Dir["ajmx-*"].first => "ajmx"
  end

  test do
    assert_match '"usage":"ajmx ', shell_output("#{bin}/ajmx help")
  end
end
