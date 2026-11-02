# Homebrew formula for the stetdoc command-line tool. This is a template, not a formula you can install as it stands.
#
# The release job in .github/workflows/release.yml fills the 0.9.1 and @SHA256_*@ placeholders from the release's
# `.sha256` files (see packaging/scripts/fill-formula.mjs) and attaches the result to the draft release as stetdoc.rb.
# To publish it, a maintainer copies that file into a tap repository, as Formula/stetdoc.rb in a repository named
# homebrew-tap. Nothing here pushes to a tap. See https://docs.brew.sh/Taps and https://docs.brew.sh/Formula-Cookbook.
#
# The archives hold a single directory, stetdoc-<triple>/, with the binary and the licence files in it. Homebrew enters
# that directory when it unpacks an archive, so the glob below finds the binary either way.
class Stetdoc < Formula
  desc "Turn a .docx into an agent-editable working copy and back, with real Word tracked changes"
  homepage "https://github.com/clauseo-ai/stetdoc"
  version "0.9.1"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.1/stetdoc-aarch64-apple-darwin.tar.gz"
      sha256 "497df49118e68ff4c096e4b5b15dc89e6bb2897a2f387e2d376db67ee1b1e77f"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.1/stetdoc-x86_64-apple-darwin.tar.gz"
      sha256 "43eebe2d157090fe33db475b960a33d56f6ac27760b8036ea8091a792564dac7"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.1/stetdoc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "c77e129394d60607636c90c458ea2ddc1d41ef8d8ca74f7618b045b6595f1de4"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.1/stetdoc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "d3fb14f102cfbaffd8b8167da2670f453edf5b64399b0cc65e973154122fb67e"
    end
  end

  def install
    bin.install Dir["**/stetdoc"].first => "stetdoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stetdoc --version")
  end
end
