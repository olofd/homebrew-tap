# The Homebrew cask for Agneta, kept here and copied into olofd/homebrew-tap by .github/workflows/homebrew.yml
# when a release is published, with the version and each architecture's DMG checksum filled in (docs/RELEASING.md).
cask "agneta" do
  arch arm: "arm64", intel: "x86_64"

  version "0.3.1"
  sha256 arm:   "1cf2d106a451a5323ee474ab938f6de758ac2bd8659fc6282712bc7a0278c33c",
         intel: "015afafcf799d0556681c095e02d669dff7c305311005adbae8c7b1d506384f3"

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
