rec {
  colors = {
    red = "E67E80";
    orange = "E69F7F";
    yellow = "E1C182";
    green = "BCD19C";
    aqua = "A1CFAD";
    skye = "9ECEC8";
    blue = "9BB5CF";
    purple = "C8AFE0";
    pink = "EBB9DD";
  };

  fall = colors // {
    text = "DDDECF";
    subtext1 = "ADC9BC";
    subtext0 = "96B4AA";
    overlay2 = "839E9A";
    overlay1 = "6F8788";
    overlay0 = "58686D";
    surface2 = "4A585C";
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
