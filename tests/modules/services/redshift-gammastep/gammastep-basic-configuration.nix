{
  services.gammastep = {
    enable = true;
    provider = "manual";
    dawnTime = "6:00-7:45";
    duskTime = "18:35-20:15";
    settings = {
      general = {
        adjustment-method = "randr";
        gamma = 0.8;
      };
      randr = {
        screen = 0;
      };
    };
  };

  nmt.script = ''
    assertFileExists home-files/.config/gammastep/config.ini
    assertFileContent \
        home-files/.config/gammastep/config.ini \
        ${./gammastep-basic-configuration-file-expected.conf}

    assertFileExists home-files/.config/systemd/user/gammastep.service
    assertFileContent \
        home-files/.config/systemd/user/gammastep.service \
        ${./gammastep-basic-configuration-expected.service}
  '';
}
