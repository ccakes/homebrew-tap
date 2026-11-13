class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.7.2"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "a6a414c3d15336368ec14e02d5b48ad10eb76dc3edb97d7c994d6ee0ac080a89"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "7c015ddb94c37f86473b863ebd16fd12b24f57ec1d5b9311dbd86adde3b8ce66"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "3e9e82498ceab7e8a47589aa9609d1d4c20bd46d1a1d2277aa371539d59f7181"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "2b0e9afcdfb63f141336d6805f2084f2e9ba5682273c4de9a16e7fcffa93367d"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
