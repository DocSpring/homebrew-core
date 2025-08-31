class Renamify < Formula
  desc "Smart search & replace for code and filenames with case-aware transformations"
  homepage "https://github.com/DocSpring/renamify"
  version "0.2.1"
  license "MIT"
  
  livecheck do
    url :stable
    regex(/^cli[._-]v?(\d+(?:\.\d+)+)$/i)
    strategy :github_latest
  end

  on_macos do
    if Hardware::CPU.arm?
      url "https://github.com/DocSpring/renamify/releases/download/cli-v0.2.1/renamify-macos-arm64.tar.gz"
      sha256 "3a8a7ebbbf3d1792480b3aeb739907ff6b45c5e92b4c78fa6a19c6c1f93ef8e2"
    else
      url "https://github.com/DocSpring/renamify/releases/download/cli-v0.2.1/renamify-macos-amd64.tar.gz"
      sha256 "eef1d9ed7cdbdfbb9187c0835b45cd06f96111cf20f7fdf7c7d194f4de460215"
    end
  end

  on_linux do
    if Hardware::CPU.arm?
      url "https://github.com/DocSpring/renamify/releases/download/cli-v0.2.1/renamify-linux-arm64.tar.gz"
      sha256 "6a34742ffea9d2caf4c8ffab599bfb254d4c30f7c820a22270fedbd387bea11b"
    else
      url "https://github.com/DocSpring/renamify/releases/download/cli-v0.2.1/renamify-linux-amd64.tar.gz"
      sha256 "3241bc1eb783925c70f1320f7ad120cebf0643fcabec6e8403a3f73f88af28f8"
    end
  end

  def install
    bin.install "renamify"
  end

  test do
    assert_match "renamify", shell_output("#{bin}/renamify --help")
    assert_match version.to_s, shell_output("#{bin}/renamify --version")
  end
end
