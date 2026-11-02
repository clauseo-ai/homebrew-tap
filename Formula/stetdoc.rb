# Homebrew formula for the stetdoc command-line tool. This is a template, not a formula you can install as it stands.
#
# The release job in .github/workflows/release.yml fills the 0.9.0 and @SHA256_*@ placeholders from the release's
# `.sha256` files (see packaging/scripts/fill-formula.mjs) and attaches the result to the draft release as stetdoc.rb.
# To publish it, a maintainer copies that file into a tap repository, as Formula/stetdoc.rb in a repository named
# homebrew-tap. Nothing here pushes to a tap. See https://docs.brew.sh/Taps and https://docs.brew.sh/Formula-Cookbook.
#
# The archives hold a single directory, stetdoc-<triple>/, with the binary and the licence files in it. Homebrew enters
# that directory when it unpacks an archive, so the glob below finds the binary either way.
class Stetdoc < Formula
  desc "Turn a .docx into an agent-editable working copy and back, with real Word tracked changes"
  homepage "https://github.com/clauseo-ai/stetdoc"
  version "0.9.0"
  license any_of: ["MIT", "Apache-2.0"]

  on_macos do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.0/stetdoc-aarch64-apple-darwin.tar.gz"
      sha256 "cea7020f34f7ccf67e41b64db1cd45f69d47e15fa7509e29886b5e7ea760bd2b"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.0/stetdoc-x86_64-apple-darwin.tar.gz"
      sha256 "3f654b61194251e6055ef0fd4a5d5c4fc8d5c2f037fff9595fa9d8a30171da52"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.0/stetdoc-aarch64-unknown-linux-musl.tar.gz"
      sha256 "0e985a4a05c9706d490cd99e5b268666f1b1c62d67e41bbfbf25ea551c632bdb"
    end
    on_intel do
      url "https://github.com/clauseo-ai/stetdoc/releases/download/v0.9.0/stetdoc-x86_64-unknown-linux-musl.tar.gz"
      sha256 "c654bb772cb95fd36b379658b35aff2273c419ba2af339906e275c2fc2fe9f7a"
    end
  end

  def install
    bin.install Dir["**/stetdoc"].first => "stetdoc"
  end

  test do
    assert_match version.to_s, shell_output("#{bin}/stetdoc --version")
  end
end
