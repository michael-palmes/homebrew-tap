class Offsider < Formula
  desc "Inspect and drive iOS and Android simulators, emulators and USB devices"
  homepage "https://offsidercli.com/"
  url "https://github.com/michael-palmes/offsider/releases/download/v0.17.0/offsider-0.17.0-arm64.tar.gz"
  sha256 "9c48ec6adf96a46739553ac057bf9b96fd6bbecb49392e99e955bd3ca88847a6"
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
