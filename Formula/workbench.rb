class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.7.0"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "e5ffc0fdefb3543ef443c22be5eadd9221b2059270a3769d0793258817c4beea"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "82da3b2594bf048b3fc9fabf03a4ef199fd14f6ab85df270a7cb5a05010544d1"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "64e904695b43a1a3331a156d7903832b938cd87efef9898504e3007eaa18fc94"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "4957daf5b31a8b7f31708739a6191a98eb67f9d4a4c734cd3f58af6d0026cb13"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
