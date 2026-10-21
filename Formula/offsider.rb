class Offsider < Formula
  desc "Inspect and drive iOS and Android simulators, emulators and USB devices"
  homepage "https://offsidercli.com/"
  url "https://github.com/michael-palmes/offsider/releases/download/v0.14.0/offsider-0.14.0-arm64.tar.gz"
  sha256 "5b8d68320049e4f0396b57cb643b3f8002ced1a6075f95fa685e46523a986c78"
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
