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
  version "0.3.5"
  sha256 "495a1194ef40ba18ea44062f498b68b86094d98d3d709d6a67b7afced71c9b64"

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
