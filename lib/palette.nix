rec {
  colors = {
    red = "E67E80";
    orange = "E69875";
    yellow = "DBBC7F";
    green = "B2C98F";
    aqua = "93C9A1";
    skye = "97C9C3";
    blue = "9BB5CF";
    purple = "D6A0D1";
    pink = "E3A8D1";
  };

  fall = colors // {
    text = "DDDECF";
    subtext1 = "CACCBE";
    subtext0 = "94AAA0";
    overlay2 = "839E9A";
    overlay1 = "738A8B";
    overlay0 = "617377";
    surface2 = "4F5E62";
    surface1 = "3D494D";
    surface0 = "313B40";
    base = "232A2E";
    mantle = "1C2225";
    crust = "171C1F";
  };

  winter = fall // {
    surface0 = fall.base;
    base = "1D2428";
    mantle = "191E21";
  };

  spring = fall // {
    base = "2B3538";
    mantle = fall.base;
    crust = fall.mantle;
  };
}
