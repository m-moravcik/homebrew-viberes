# Homebrew Cask for the VibeRes menu-bar GUI app.
# Install:
#   brew install --cask m-moravcik/viberes/viberes-app
#
# Upgrade:
#   brew upgrade --cask m-moravcik/viberes/viberes-app
#
# The release ZIP is ad-hoc signed (no Apple Developer account). Cask
# strips the quarantine attribute on install so Gatekeeper doesn't block
# the first launch.
cask "viberes-app" do
  version "0.4.2"
  sha256 "1930c93176d3cd8bc7bcd772cef83f9aafc9b9c2fd133abcd59cf096a2ba4d2b"

  url "https://github.com/m-moravcik/VibeRes/releases/download/v#{version}/VibeRes-#{version}.zip"
  name "VibeRes"
  desc "Modern menubar resolution switcher"
  homepage "https://github.com/m-moravcik/VibeRes"

  livecheck do
    url :url
    strategy :github_latest
  end

  app "VibeRes.app"

  # Wipe out app-private state on `brew uninstall --cask --zap` so users
  # can start fresh. Profiles JSON + UserDefaults entries the app writes.
  zap trash: [
    "~/Library/Application Support/VibeRes",
    "~/Library/Preferences/sk.moravcik.VibeRes.plist",
  ]
end
