class Ttysvg < Formula
  desc "Record terminal sessions as SVG animations"
  homepage "https://github.com/rabarbra/ttysvg"
  version "0.0.5"
  license "MIT"

  on_macos do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_arm64.tar.gz"
      sha256 "d82ba041b25d95ad7c70ee9f7f011f3f7344ecf52d58452443e0641149636970"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_macos_x86_64.tar.gz"
      sha256 "d9262314ddbd0f2301732c7cfbe9561e5aa3e74b117e11c1fc4672bf4dd5187c"
    end
  end

  on_linux do
    on_arm do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_arm64.tar.gz"
      sha256 "e56affbae2e01ca90bae7525e69ee88da8690d6750fd793d8edab341274afd2c"
    end

    on_intel do
      url "https://github.com/rabarbra/ttysvg/releases/download/v#{version}/ttysvg_v#{version}_linux_x86_64.tar.gz"
      sha256 "bff8e3dac95cbe355bd05949bb75621289a2b596d3ffe0896793e80628c89352"
    end
  end

  def install
    bin.install "ttysvg"
    man1.install "man/man1/ttysvg.1"

    bash_completion.install "completions/ttysvg.bash" => "ttysvg"
    zsh_completion.install "completions/_ttysvg"
    fish_completion.install "completions/ttysvg.fish"
  end

  test do
    assert_match "ttysvg v#{version}", shell_output("#{bin}/ttysvg --version")
  end
end
