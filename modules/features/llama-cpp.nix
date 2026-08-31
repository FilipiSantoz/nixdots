{...}: {
  flake.homeManagerModules.llama-cpp = {pkgs, ...}: {
    home.packages = with pkgs; [
      (llama-cpp.override {
        vulkanSupport = true;
      })
    ];
  };
}
