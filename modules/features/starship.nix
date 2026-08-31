{...}: {
  flake.homeManagerModules.starship = {...}: {
    programs.starship = {
      enable = true;
      enableZshIntegration = true;

      settings = {
        add_newline = true;
        command_timeout = 200;
        format = "$os$hostname:$directory$git_branch$all$character";

        hostname = {
          ssh_only = false;
          format = "[$hostname]($style)";
          style = "bold #FFFFFF";
          disabled = false;
        };

        os = {
          disabled = false;
          style = "#FFFFFF";
        };

        character = {
          error_symbol = "[🗶](bold #FFFFFF)";
          success_symbol = "[🢖](bold #FFFFFF)";
          vimcmd_symbol = "[🢔](bold #FFFFFF)";
        };

        directory = {
          truncation_length = 2;
          truncation_symbol = "…/";
          repo_root_style = "bold #9D71C9";
          style = "bold #FFFFFF";
          repo_root_format = "[$repo_root]($repo_root_style)[$path]($style)[$read_only]($read_only_style) ";
          read_only = " 󰌾";
        };

        git_branch = {
          symbol = " ";
        };

        git_status = {
          format = "[$all_status]($style)";
          style = "cyan";
          ahead = "⇡\${count} ";
          diverged = "⇕⇡\${ahead_count}⇣\${behind_count} ";
          behind = "⇣\${count} ";
          conflicted = " ";
          up_to_date = "✦ ";
          untracked = "? ";
          modified = " ";
          stashed = "";
          staged = "";
          renamed = "";
          deleted = "";
        };

        aws.symbol = " ";
        buf.symbol = " ";
        bun.symbol = " ";
        c.symbol = " ";
        cpp.symbol = " ";
        cmake.symbol = " ";
        conda.symbol = " ";
        crystal.symbol = " ";
        dart.symbol = " ";
        deno.symbol = " ";
        docker_context.symbol = " ";
        elixir.symbol = " ";
        elm.symbol = " ";
        fennel.symbol = " ";
        fortran.symbol = " ";
        fossil_branch.symbol = " ";
        gcloud.symbol = " ";
        git_commit.tag_symbol = "  ";
        golang.symbol = " ";
        gradle.symbol = " ";
        guix_shell.symbol = " ";
        haskell.symbol = " ";
        haxe.symbol = " ";
        hg_branch.symbol = " ";
        java.symbol = " ";
        julia.symbol = " ";
        kotlin.symbol = " ";
        lua.symbol = " ";
        memory_usage.symbol = "󰍛 ";
        meson.symbol = "󰔷 ";
        nim.symbol = "󰆥 ";
        nix_shell.symbol = " ";
        ocaml.symbol = " ";
        package.symbol = "󰏗 ";
        perl.symbol = " ";
        php.symbol = " ";
        pijul_channel.symbol = " ";
        pixi.symbol = "󰏗 ";
        python.symbol = " ";
        rlang.symbol = "󰟔 ";
        ruby.symbol = " ";
        rust.symbol = "󱘗 ";
        scala.symbol = " ";
        status.symbol = " ";
        swift.symbol = " ";
        xmake.symbol = " ";
        zig.symbol = " ";

        os.symbols = {
          NixOS = " ";
        };
      };
    };
  };
}
