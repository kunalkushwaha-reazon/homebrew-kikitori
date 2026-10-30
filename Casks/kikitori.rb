cask "kikitori" do
  version "0.1.0"
  sha256 "65ee077b66f338a5bd8060dbdda1f44e17e174b86ddcaa369d7c8d314fe38c4f"

  url "https://github.com/kunalkushwaha-reazon/homebrew-kikitori/releases/download/v#{version}/Kikitori-#{version}-arm64.zip"
  name "Kikitori"
  desc "Private on-device meeting recorder and Japanese-English live translator"
  homepage "https://github.com/kunalkushwaha-reazon/homebrew-kikitori"

  livecheck do
    url :url
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe

  app "Kikitori.app"

  uninstall quit: "dev.kikitori.app"

  # Meeting folders (~/meetings by default) are the user's data and are kept.
  zap trash: "~/Library/Preferences/dev.kikitori.app.plist"

  caveats <<~EOS
    Kikitori is not notarized by Apple yet, so macOS blocks the first launch.
    Open Kikitori once, then go to System Settings > Privacy & Security and
    click "Open Anyway".

    macOS asks again for microphone, system audio and calendar permissions
    after each update.
  EOS
end
