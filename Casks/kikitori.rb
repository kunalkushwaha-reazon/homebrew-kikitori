cask "kikitori" do
  version "0.1.4"
  sha256 "71be60af3e948440b65c109e7958247b47684342a392147e1ad500385247e1fa"

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
