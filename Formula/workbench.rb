class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.7"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "cbf165c44e67cfeb623541965e7f9afeccb32dbb18b7dde3463551d1d17f9463"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "1e28f6462ae6f8912ef73f2c282197128f3977b70a19dc1ac33bdac7be63973e"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "146276399a6ab9606cc9b68006a8b2290b3c7a55a563735a9f21a297e83e537c"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "cb17b12d26f8fe91fb880bd712f70518bd0342b4a8b11203aed70775c9f80200"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
