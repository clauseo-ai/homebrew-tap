# Homebrew formula for the stetdoc command-line tool. This is a template, not a formula you can install as it stands.
#
# The release job in .github/workflows/release.yml fills the 0.9.4 and @SHA256_*@ placeholders from the release's
# `.sha256` files (see packaging/scripts/fill-formula.mjs) and attaches the result to the draft release as stetdoc.rb.
# To publish it, a maintainer copies that file into a tap repository, as Formula/stetdoc.rb in a repository named
# homebrew-tap. Nothing here pushes to a tap. See https://docs.brew.sh/Taps and https://docs.brew.sh/Formula-Cookbook.
#
# The archives hold a single directory, stetdoc-<triple>/, with the binary and the licence files in it. Homebrew enters
# that directory when it unpacks an archive, so the glob below finds the binary either way.
class Stetdoc < Formula
  desc "Turn a .docx into an agent-editable working copy and back, with real Word tracked changes"
  homepage "https://github.com/clauseo-ai/stetdoc"
  version "0.9.4"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.4/stetdoc-aarch64-apple-darwin.tar.gz"
      sha256 "4ef120543aeadc4b806b1b6b308e0b618bb49f66d7a960099f209d5764ee4428"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.4/stetdoc-x86_64-apple-darwin.tar.gz"
      sha256 "78e0646986ef2359d698248bb64c7134be0502c4a67cd2b3f8c417d5abb2ca6d"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.4/stetdoc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "2d6ffb63cc08e23a49fb3793718e91699553a47941b0e87afa43c32dd105dde5"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.4/stetdoc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "8437aea7b1b7c5d3271bc491729f1be68c8881139bda38570b5a00a81a313505"
    end
  end

  def install
    bin.install Dir["**/stetdoc"].first => "stetdoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stetdoc --version")
  end
end
