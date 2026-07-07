cask "elo" do
  version "0.4.2"
  sha256 "92c4d81216ebf374c67667d849545f9d2c4aba984c1a3d3e060638dc05939f48"

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
