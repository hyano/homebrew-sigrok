# Based on rob-deutsch's branch
# https://github.com/rob-deutsch/homebrew-core/tree/sigrok
class SigrokCli < Formula
  desc "Command-line frontend for sigrok"
  homepage "https://sigrok.org/wiki/Sigrok-cli"
  url "https://sigrok.org/download/source/sigrok-cli/sigrok-cli-0.7.2.tar.gz"
  head "git://sigrok.org/sigrok-cli"
  sha256 "71d0443f36897bf565732dec206830dbea0f2789b6601cf10536b286d1140ab8"

  depends_on "automake" => :build
  depends_on "autoconf" => :build
  depends_on "glib" => :build
  depends_on "make" => :build
  depends_on "pkg-config" => :build
  depends_on "glib" => :build
  depends_on "glibmm@2.66" => :build
  depends_on "libftdi" => :build
  depends_on "libserialport" => :build
  depends_on "libusb" => :build
  depends_on "libzip" => :build
  depends_on "hyano/sigrok/libsigrok" => :build
  depends_on "hyano/sigrok/libsigrokdecode" => :build
  depends_on "python@3.13"

  def install
    ENV["PYTHON3"] = Formula["python@3.13"].opt_bin/"python3"

    system "./autogen.sh"
    system "./configure", "--prefix=#{prefix}"
    system "make"
    system "make", "install"
  end

  test do
    system "#{bin}/sigrok-cli", "-L"
  end
end
