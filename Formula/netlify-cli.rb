require "language/node"

class NetlifyCli < Formula
  desc "Netlify command-line tool"
  homepage "https://www.netlify.com/docs/cli"
  url "https://registry.npmjs.org/netlify-cli/-/netlify-cli-2.13.0.tgz"
  sha256 "b826e2d2cbd4f397598e71b8d908ff6768580caec5d9d855d8b2c17e98426e5c"
  head "https://github.com/netlify/cli.git"

  bottle do
    sha256 "1bbe7e9920dd4d6ae567530dd1f474fac39784d793a3b1c59044810e925f1a8a" => :mojave
    sha256 "8275b004949942216f2ede5b27f5b7ee3fe436fb366e9ea9ebe570f51f3469a7" => :high_sierra
    sha256 "aa16bf478faf75d746c330ecb7ca2259f979b084e48e8175472d7ea36b64f85d" => :sierra
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    (testpath/"test.exp").write <<~EOS
      spawn #{bin}/netlify login
      expect "Opening"
    EOS
    assert_match "Logging in", shell_output("expect -f test.exp")
  end
end
