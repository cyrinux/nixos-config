{
  programs = {
    git = {
      enable = true;

      userEmail = "git@levis.name";
      userName = "Cyril Levis";

      extraConfig = {
        core.editor = "hx";
        github.user = "cyrinux";
        mergetool.prompt = false;
        pull.rebase = false;
      };
    };

    lazygit = {
      enable = true;
      settings = {
        gui = {
          # showFileTree = false;

          theme = {
            activeBorderColor = ["blue" "bold"];
            selectedLineBgColor = ["white"];
          };
        };
        git = {
          # Improves performance
          # https://github.com/jesseduffield/lazygit/issues/2875#issuecomment-1665376437
          log.order = "default";

          fetchAll = false;
        };
      };
    };
  };

  home.shellAliases = {
    lg = "lazygit";

    gfu = "git fetch upstream";
    gfo = "git fetch origin";
  };
}
