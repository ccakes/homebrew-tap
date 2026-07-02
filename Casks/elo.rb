cask "elo" do
  version "0.4.0"
  sha256 "9d61280c90111293b86dfaa7e842e528eadce3a4d5a635247d29005bcc8da10e"

  url "https://github.com/ccakes/elo/releases/download/v#{version}/Elo_#{version}_universal.dmg"
  name "Elo"
  desc "Numi-compatible notepad calculator"
  homepage "https://github.com/ccakes/elo"

  depends_on macos: :big_sur

  app "Elo.app"

  zap trash: [
    "~/Library/Application Support/com.elo.calculator",
    "~/Library/Preferences/com.elo.calculator.plist",
    "~/Library/Caches/com.elo.calculator",
    "~/Library/Saved Application State/com.elo.calculator.savedState",
  ]
end
