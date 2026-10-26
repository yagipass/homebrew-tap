class Ajmx < Formula
  desc "JMX CLI for AI agents"
  homepage "https://github.com/yagipass/ajmx"
  url "https://github.com/yagipass/ajmx/releases/download/v0.2.0/ajmx-darwin-arm64"
  sha256 "e1dd50c2583654565051b8eea73a40e0ff7e5752838aabd441adb00c5007421b"
  license "Apache-2.0"

  on_macos do
    depends_on arch: :arm64
  end

  on_linux do
    on_arm do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.0/ajmx-linux-arm64"
      sha256 "a5379f73eb82f2f15c83797e0a0b230a6ec0a746e024f27d2fc06b2f09b9c97e"
    end
    on_intel do
      url "https://github.com/yagipass/ajmx/releases/download/v0.2.0/ajmx-linux-amd64"
      sha256 "f21e7a82b3d29f7b52720f349dc1cada4d931ed14912c6521883376d77510fbd"
    end
  end

  def install
    bin.install Dir["ajmx-*"].first => "ajmx"
  end

  test do
    assert_match '"usage":"ajmx ', shell_output("#{bin}/ajmx help")
  end
end
