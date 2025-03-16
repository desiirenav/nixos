{ pkgs, ... }: {
  # Install Typst
  home.packages = with pkgs; [ typst ];

  # Configure Zathura with autoreload
  programs.zathura = {
    enable = true;
    options = {
      autoreload = true;
      adjust-open = "best-fit";
      window-title-basename = true;
    };
  };
}
