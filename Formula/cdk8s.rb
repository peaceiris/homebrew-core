require "language/node"

class Cdk8s < Formula
  desc "Define k8s native apps and abstractions using object-oriented programming"
  homepage "https://cdk8s.io/"
  url "https://registry.npmjs.org/cdk8s-cli/-/cdk8s-cli-2.0.87.tgz"
  sha256 "185fd6c694f2173f97fcaf39de5dfe70ad7aaa714f9b035d53acdf44b8d3459e"
  license "Apache-2.0"

  bottle do
    sha256 cellar: :any_skip_relocation, all: "ab563462c79ea3d61c53af075ad576328d2b7bb05ab67b0d2c57d8147e1d0fe6"
  end

  depends_on "node"

  def install
    system "npm", "install", *Language::Node.std_npm_install_args(libexec)
    bin.install_symlink Dir["#{libexec}/bin/*"]
  end

  test do
    assert_match "Cannot initialize a project in a non-empty directory",
      shell_output("#{bin}/cdk8s init python-app 2>&1", 1)
  end
end
