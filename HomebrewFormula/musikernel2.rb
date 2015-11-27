require 'formula'

class Musikernel2 < Formula
  homepage 'https://github.com/j3ffhubb/musikernel'
  url 'https://github.com/j3ffhubb/musikernel/archive/musikernel2-15.12.1.zip'
  sha1 '81da95fa475b34705b23db628cc6944d57ddad05'

  depends_on 'python3'
  depends_on 'liblo'
  depends_on 'portaudio'
  depends_on 'portmidi'
  depends_on 'j3ffhubb/musikernel/rubberband'
  depends_on 'fftw'
  depends_on 'numpy'
  depends_on 'pyqt5'
  depends_on 'libsndfile'

  def install
    system "brew", "install", "numpy", "--with-python3"
    system "make", "-C", "src", "mac_osx"
    system "make", "-C", "src", "install_mac_osx"
  end

  test do
    system "false"
  end
end
