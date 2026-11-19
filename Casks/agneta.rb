# The Homebrew cask for Agneta, kept here and copied into olofd/homebrew-tap by .github/workflows/homebrew.yml
# when a release is published, with the version and each architecture's DMG checksum filled in (docs/RELEASING.md).
cask "agneta" do
  arch arm: "arm64", intel: "x86_64"

  version "0.4.0"
  sha256 arm:   "666f55d66b1cd87c0bd52dfb4a8820bd7ba9a419075b6960b1d31ad947fcf0aa",
         intel: "c5040f1271ebf9b738cc17689c4896375c602d230f4e32de26114876a8c952a9"

  url "https://github.com/olofd/agneta/releases/download/v#{version}/Agneta-#{version}-#{arch}.dmg"
  name "Agneta"
  desc "Give Mac apps an AI agent you control"
  homepage "https://github.com/olofd/agneta"

  livecheck do
    url :url
    strategy :github_latest
  end

  # Agneta updates itself (Sparkle); brew leaves that to it.
  auto_updates true
  depends_on macos: ">= :sonoma"

  app "Agneta.app"

  # What Reset Agneta removes, less its Keychain items, which only the app can find.
  zap trash: [
    "~/Library/Application Support/com.objectivecoder.agneta",
    "~/Library/Application Support/com.objectivecoder.agneta Workspaces",
    "~/Library/Caches/com.objectivecoder.agneta",
    "~/Library/HTTPStorages/com.objectivecoder.agneta",
    "~/Library/Logs/Agneta",
    "~/Library/Preferences/com.objectivecoder.agneta.plist",
  ]
end
