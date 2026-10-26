cask "soyla" do
  version "0.3.0"
  sha256 "dd9540b7ac75bc78ff9ebe63a42725d998138f874f88a7d3135571e21e6476d1"

  url "https://github.com/ShamsiddinKomil/soyla/releases/download/v#{version}/Soyla-v#{version}.zip"
  name "Soyla"
  desc "Dictation for Uzbek, Russian and English in one sentence"
  homepage "https://github.com/ShamsiddinKomil/soyla"

  auto_updates true # Soyla updates itself (Settings → About); brew upgrade leaves it alone
  depends_on macos: :sonoma # macOS 14+, the same as Package.swift and LSMinimumSystemVersion

  app "Soyla.app"

  zap trash: [
    "~/Library/Application Support/Soyla",
    "~/Library/Preferences/ai.ovoz.settings.plist", # settings from before the rename
    "~/Library/Preferences/ai.soyla.app.plist",
    "~/Library/Preferences/ai.soyla.settings.plist",
  ]

  caveats <<~EOS
    Soyla is not notarized by Apple. On the first open of each version, macOS blocks it:
    click Done, then System Settings → Privacy & Security → Open Anyway.
  EOS
end
