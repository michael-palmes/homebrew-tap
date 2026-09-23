class Offsider < Formula
  desc "Drive iOS Simulators from the terminal and AI agents"
  homepage "https://github.com/michael-palmes/offsider"
  url "https://github.com/michael-palmes/offsider/releases/download/v0.1.0/offsider-0.1.0-arm64.tar.gz"
  sha256 "28247206e96ae5a24466afd644f4532dd2bf3aa9b6d894b7e09aec3846a8241c"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on xcode: "26.0"
  depends_on macos: :sequoia

  # Pre-built, Developer ID signed and notarised payload. Keep @rpath install names so
  # Homebrew's relocation does not rewrite the frameworks and replace their signatures.
  preserve_rpath

  def install
    libexec.install "offsider", "Offsider_Offsider.bundle", "Frameworks"
    prefix.install "LICENSE", "THIRD_PARTY_LICENSES"
    bin.install_symlink libexec/"offsider"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/offsider --version")
    assert_match "name: offsider", shell_output("#{bin}/offsider init --print")
  end
end
