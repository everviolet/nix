rec {
  colors = {
    red = "F57F82";
    orange = "F7A182";
    yellow = "F5D098";
    lime = "DBE6AF";
    green = "CBE3B3";
    aqua = "B3E3CA";
    skye = "B3E6DB";
    snow = "AFD9E6";
    blue = "B2CAED";
    purple = "D2BDF3";
    pink = "F3C0E5";
    cherry = "F6CEE5";
  };

  fall = colors // {
    text = "F8F9E8";
    subtext1 = "ADC9BC";
    subtext0 = "96B4AA";
    overlay2 = "839E9A";
    overlay1 = "6F8788";
    overlay0 = "58686D";
    surface2 = "4A585C";
    surface1 = "374145";
    surface0 = "2B3337";
    base = "232A2E";
    mantle = "1C2225";
    crust = "171C1F";
  };

  winter = fall // {
    surface0 = "262F33";
    base = "1E2528";
    mantle = "191E21";
  };

  spring = fall // {
    surface1 = "3E4A4F";
    surface0 = "343E43";
    base = "2B3438";
    mantle = fall.base;
    crust = fall.mantle;
  };

  summer = {
    red = "C0696B";
    orange = "C1866B";
    yellow = "BC9C6B";
    lime = "A7AF70";
    green = "91AC75";
    aqua = "7BAA92";
    skye = "79A39B";
    snow = "7FA0AA";
    blue = "8CA0BB";
    purple = "AB9AC6";
    pink = "CA9EBD";
    cherry = "CEABBF";
    text = "171C1F";
    subtext1 = "415055";
    subtext0 = "526469";
    overlay2 = "63787D";
    overlay1 = "758A90";
    overlay0 = "879DA4";
    surface2 = "9CB2B8";
    surface1 = "B4C6CC";
    surface0 = "CED9E0";
    base = "D7E1EB";
    mantle = "C8D5E1";
    crust = "BDCBDB";
  };
}
