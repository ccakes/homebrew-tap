class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.3"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "8950c8a7d61b41d74736854c0939c37c47a3615fe8db3d5683c8b4ab9e4a7d38"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "2dabc0aa6f538b8c05ba1fe5686e3e0b2efa2f04a8ae3c9049175e07537a3cba"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "859c3d216c05fcd503318ec24e1ab519794916621dc3ae7bf0ef14af0df63687"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "99a00537637b4dd6af1d0747901546969c2914bc08b1cd66a2af786d3b4278bc"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
