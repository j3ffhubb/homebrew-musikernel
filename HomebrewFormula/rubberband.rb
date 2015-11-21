require 'formula'

# Originally from http://tuohela.net/irc/rubberband.rb
# Modified by mtolly to include libsndfile dependency,
# and to install pkg-config file.

class Rubberband < Formula
  homepage ''
  url 'http://code.breakfastquay.com/attachments/download/34/rubberband-1.8.1.tar.bz2'
  sha1 'ae1faaef211d612db745d66d77266cf6789fd4ee'

  depends_on 'pkg-config'
  depends_on 'libsamplerate'
  depends_on 'libsndfile'
  depends_on 'vamp-plugin-sdk' => :optional

  if MacOS.version >= :yosemite
    patch :p1 do
      url "http://tuohela.net/irc/rubberband-1.8.1-yosemite.diff"
      sha1 "76ea7cac0fc0ab99b38081176375ef7c34be678f"
    end
  end

  def install
    system "make", "-f", "Makefile.osx"
    bin.install "bin/rubberband"
    lib.install "lib/librubberband.dylib"
    include.install Dir['rubberband']
    (lib+'pkgconfig/rubberband.pc').write pc_file
  end

  def pc_file; <<-EOS.undent
    prefix=#{opt_prefix}
    exec_prefix=${prefix}
    libdir=${exec_prefix}/lib
    includedir=${prefix}/include

    Name: rubberband
    Version: 1.8.1
    Description:
    Libs: -L${libdir} -lrubberband
    Cflags: -I${includedir}
    EOS
  end

  test do
    system "false"
  end
end
