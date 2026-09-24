class Offsider < Formula
  desc "Drive iOS Simulators from the terminal and AI agents"
  homepage "https://github.com/michael-palmes/offsider"
  url "https://github.com/michael-palmes/offsider/releases/download/v0.2.0/offsider-0.2.0-arm64.tar.gz"
  sha256 "d14eb425cc5cecdc23f25bafcbbf7ab2429c2eb197cfc44653afb104290616df"
  license "MIT"

  livecheck do
    url :stable
    strategy :github_latest
  end

  depends_on arch: :arm64
  depends_on macos: :sequoia
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
