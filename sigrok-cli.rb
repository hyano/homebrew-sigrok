# Based on rob-deutsch's branch
# https://github.com/rob-deutsch/homebrew-core/tree/sigrok
class SigrokCli < Formula
  desc "Command-line frontend for sigrok"
  homepage "https://sigrok.org/wiki/Sigrok-cli"
  url "https://sigrok.org/download/source/sigrok-cli/sigrok-cli-0.7.2.tar.gz"
  sha256 "71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8"

  depends_on "glib" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "hyano/sigrok/libsigrok"
  depends_on "hyano/sigrok/libsigrokdecode"

  def install
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/sigrok-cli", "-L"
  end
end
