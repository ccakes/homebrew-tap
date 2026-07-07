class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.10"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "1b6315006fa01f167f50d68191213c6031b3791722a1b9f1e2372086f212b3e2"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "9a27a9c7fa7476e43ff2f9e2972bf571d31c92f8dd9f602f75caa3c9c27002c8"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "73cd33200fc695ff06199e42e8eb95dbdc5255209312bd3ff4d43290af105bb4"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "6cd590d409f4cb5de9effcce31076b0135a2a32954cc8066027f3a119a35d6e4"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
