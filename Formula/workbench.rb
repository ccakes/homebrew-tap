class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "90c10a5e71c1d486c200490d3bbd7e59459efccee9ce404949a5dde8d1d13255"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "09fa5f4d4d23771c31dd279ca61dddd47fb6b3cf4efedcc59314d8b4fe065525"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "0b9f1350a16cb5dae5f212764d29313597b177780af8197cdb367a52d5998428"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "6a638899b44d750a0143f09c24336391feaa8f048a0ef26a0e8334987f9d6b1c"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
