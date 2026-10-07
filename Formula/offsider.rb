class Offsider < Formula
  desc "Drive iOS Simulators from the terminal and AI agents"
  homepage "https://github.com/michael-palmes/offsider"
  url "https://github.com/michael-palmes/offsider/releases/download/v0.7.0/offsider-0.7.0-arm64.tar.gz"
  sha256 "f1565b967ea562d380cd9b9e0fcfd95f14c89b2b7f4415067727c64c72012f5f"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :tahoe
  depends_on xcode: "26.0"

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
