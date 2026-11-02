# Homebrew formula for the stetdoc command-line tool. This is a template, not a formula you can install as it stands.
#
# The release job in .github/workflows/release.yml fills the 0.9.2 and @SHA256_*@ placeholders from the release's
# `.sha256` files (see packaging/scripts/fill-formula.mjs) and attaches the result to the draft release as stetdoc.rb.
# To publish it, a maintainer copies that file into a tap repository, as Formula/stetdoc.rb in a repository named
# homebrew-tap. Nothing here pushes to a tap. See https://docs.brew.sh/Taps and https://docs.brew.sh/Formula-Cookbook.
#
# The archives hold a single directory, stetdoc-<triple>/, with the binary and the licence files in it. Homebrew enters
# that directory when it unpacks an archive, so the glob below finds the binary either way.
class Stetdoc < Formula
  desc "Turn a .docx into an agent-editable working copy and back, with real Word tracked changes"
  homepage "https://github.com/clauseo-ai/stetdoc"
  version "0.9.2"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.2/stetdoc-aarch64-apple-darwin.tar.gz"
      sha256 "5cc5c6f37287edb425c444fe58a45417e5d809e4843d18e7a410802c6d862f9a"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.2/stetdoc-x86_64-apple-darwin.tar.gz"
      sha256 "ecad294baf66395268b25d5ce1c23df0513986683bfa43fbfaa7502e50b8dd0c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.2/stetdoc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "06c6382da55140a7d14f6577862d999b8a16575da1448fab629666852da58c44"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.2/stetdoc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "4a46289eb71df5427967e483de5a5e9a6585fe0c5952de548f2bf3685d2679be"
    end
  end

  def install
    bin.install Dir["**/stetdoc"].first => "stetdoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stetdoc --version")
  end
end
