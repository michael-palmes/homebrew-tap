class Offsider < Formula
  desc "Inspect and drive iOS and Android simulators, emulators and USB devices"
  homepage "https://offsidercli.com/"
  url "https://github.com/michael-palmes/offsider/releases/download/v0.15.0/offsider-0.15.0-arm64.tar.gz"
  sha256 "e0c79bcf6e5a15366820d15976e093926731dba1015d4796ca88d7ef5082fdaf"
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
