cask "elo" do
  version "0.3.1"
  sha256 "bef66ecd39a9a3ce7f48249c658bb0de4db10cadfe1b3708c0645c65517c373e"

  url "https://github.com/ccakes/elo/releases/download/v#{version}/Elo-macos.app.zip"
  name "Elo"
  desc "Numi-compatible notepad calculator"
  homepage "https://github.com/ccakes/elo"

  depends_on macos: ">= :big_sur"

  app "Elo.app"

  zap trash: [
    "~/Library/Application Support/com.elo.calculator",
    "~/Library/Preferences/com.elo.calculator.plist",
    "~/Library/Caches/com.elo.calculator",
    "~/Library/Saved Application State/com.elo.calculator.savedState",
  ]
end
