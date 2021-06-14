{ buildGoModule
, fetchFromGitHub
, lib
, wl-clipboard
, makeWrapper
}:

buildGoModule rec {
  pname = "clipman";
  version = "1.5.2";

  src = fetchFromGitHub {
    owner = "yory8";
    repo = pname;
    rev = "v${version}";
    sha256 = "1lf5fbzplyc1mpdqgfwbrn8m5568vhjf48580fvvfgbhz6zcil8n";
  };

  vendorSha256 = "18jw4z0lcrh00yjr3qdkgvlrpfwqbsm0ncz7fp1h72pzkh41byv7";

  doCheck = false;

  nativeBuildInputs = [ makeWrapper ];

  postInstall = ''
    wrapProgram $out/bin/clipman \
      --prefix PATH : ${lib.makeBinPath [ wl-clipboard ]}
  '';

  meta = with lib; {
    homepage = "https://github.com/yory8/clipman";
    description = "A simple clipboard manager for Wayland";
    license = licenses.gpl3Only;
    maintainers = with maintainers; [ ma27 ];
    platforms = platforms.linux;
  };
}
