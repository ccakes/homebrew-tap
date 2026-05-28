class Workbench < Formula
  desc "TUI process orchestrator for local development"
  homepage "https://github.com/ccakes/workbench"
  version "0.6.4"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-arm64"
      sha256 "1c93001fcb1a263556d8a2130395edfc7ef501777e412e1ea6cf4a3b3836a839"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-darwin-amd64"
      sha256 "f510653897fb4df26901b22fa5501ccace8ed80a1ec995f635393e0d1216c409"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-arm64"
      sha256 "c40ce58c32acb74ff96b91fc0418960c7fbe7269943c09ae6560e9bfe86e7b7d"
    end
    on_intel do
      url "https://github.com/ccakes/workbench/releases/download/v#{version}/bench-linux-amd64"
      sha256 "4cf98c86c4f6cc3a93561631861508ad82185e60bde5bfd440a8ddbc4fb12b1a"
    end
  end

  def install
    bin.install Dir["bench-*"].first => "bench"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/bench version")
  end
end
