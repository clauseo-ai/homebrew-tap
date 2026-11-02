# Homebrew formula for the ooxml-validate command-line tool, for the tap clauseo-ai/homebrew-tap, so that
# `brew install clauseo-ai/tap/ooxml-validate` works. See https://docs.brew.sh/Taps.
#
# The archives hold a single directory, ooxml-validate-<rid>/, with the self-contained binary, LICENSE, NOTICE,
# THIRD-PARTY-NOTICES.txt and README.md in it. Homebrew enters that directory when it unpacks an archive, so the glob
# below finds the binary either way.
class OoxmlValidate < Formula
  desc "Validate .docx files with the Open XML SDK validator, or compare two"
  homepage "https://github.com/clauseo-ai/ooxml-validate"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/clauseo-ai/ooxml-validate/releases/download/v0.1.0/ooxml-validate-osx-arm64.tar.gz"
      sha256 "82c474e7ef83cd361fcc41fc081a5669277eb8cb157a10716cf69d2ee1a7abf9"
    end
    on_intel do
      url "https://github.com/clauseo-ai/ooxml-validate/releases/download/v0.1.0/ooxml-validate-osx-x64.tar.gz"
      sha256 "221a12db728492d3d60700bf63bf35a8ed67387d976fdae6f9c59adc7e254f67"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/clauseo-ai/ooxml-validate/releases/download/v0.1.0/ooxml-validate-linux-arm64.tar.gz"
      sha256 "48d2a6c50a87973f89973f05a9aa3bb0b0c1340ba16a7f404a023c165e8a1193"
    end
    on_intel do
      url "https://github.com/clauseo-ai/ooxml-validate/releases/download/v0.1.0/ooxml-validate-linux-x64.tar.gz"
      sha256 "ffb42f65ea10326d32285c9e0d149d6d5c064b8744ec3784c780f50c02be39cb"
    end
  end

  def install
    bin.install Dir["**/ooxml-validate"].first => "ooxml-validate"
    # Homebrew keeps LICENSE, NOTICE and README.md by itself, but not the .NET runtime's third-party notices.
    prefix.install Dir["**/THIRD-PARTY-NOTICES.txt"]
  end

  test do
    assert_match "ooxml-validate #{version}", shell_output("#{bin}/ooxml-validate --version")
    # A file that is not a package is an error: exit 1, not a crash and not a usage error (2).
    (testpath/"not-a-package.docx").write("this is not a zip")
    shell_output("#{bin}/ooxml-validate not-a-package.docx", 1)
  end
end
