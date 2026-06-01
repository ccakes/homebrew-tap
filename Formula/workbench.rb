class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.8"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "6a92e47a38bb74be010a74b7c7dab093b03bd64ddc19e44bea0b3c4aa4122861"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "acdcdaef28af262aa0f2781c9db482f086fc9fc8bb6ebff56b3ee9ed7b3f3a13"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "2fdd39e06ab38d0aa9e8d2b1623d4d1a95ceb96e42125c8a224aba65ca420988"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "ec19aa0b7d27fe4a10a796e8036d9f6b8e38cdf4463685efdb78d0666b3f0cd7"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
