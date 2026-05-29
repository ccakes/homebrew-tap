class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.6"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "6bb23680761423d42b9d36c8fc16f790bcfb06fd4306dd6fa3372b483a41e251"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "af60d7e7e381519b9d3b8a5325fd4850476e04e4df9466257331f6fde072b1d9"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "7db7b57db10d20f38d9c1f68747c608664336a40a3049cd08b1dbcede4917d16"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "9c531292800b4a1ce22235b15e2b42d3fdb3e2ffc92214453f0a01850eaefe26"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
