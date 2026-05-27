cask "elo" do
  version "0.3.0"
  sha256 "a9a89bd63bb54263ce29c5ae0f2f614fd7fc79a0810c2c92280a485ee362172c"

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
