require 'formula'

class MusiKernel2 < Formula
  homepage 'https://github.com/j3ffhubb/musikernel'
  url 'https://github.com/j3ffhubb/musikernel/archive/d5526dc23aa0aef29027dccbbf372131b26a57f8.zip'
  sha1 'cfb988757761c1bbb9132073523bf5a0bacfbb2b'

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
    system "make", "-C", "src", "mac_os_x"
    system "make", "-C", "src", "mac_os_x_install"
  end

  test do
    system "false"
  end
end
