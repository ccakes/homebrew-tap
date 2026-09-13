class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.7.1"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "ef67cb8b0e37cc24c73efa0296641be904e2c9cec14ce2d7ebfd5e3c44ea484d"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "f6ac9dbaf5fe130d9f4305fe08b07f3f903d54f8e2548dc8d5f66f24d0ca20a1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "6bacf213c3e6fe02af4a6c503217deae9b9c8d9ab2247c589506aeee63cebdbe"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "6b8f6641a13fc3c6ac32bbe953e2413afc54eef20e13fd5e9e869bbabf5e3421"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
