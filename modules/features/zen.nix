{...}: {
  flake.homeManagerModules.zen = {inputs, ...}: {
    imports = [inputs.zen-browser.homeModules.beta];

    programs.zen-browser = {
      enable = true;

      profiles.default.presets = {
        catppuccin = {
          enable = true;
          flavor = "Macchiato";
          accent = "Mauve";
        };
        betterfox.enable = true;
      };

      policies = {
        AutofillAddressEnabled = false;
        AutofillCreditCardEnabled = false;
        DisableFeedbackCommands = true;
        DisableFirefoxStudies = true;
        DisablePocket = true;
        DisableTelemetry = true;
        DontCheckDefaultBrowser = true;
        OfferToSaveLogins = false;
        EnableTrackingProtection = {
          Value = true;
          Locked = true;
          Cryptomining = true;
          Fingerprinting = true;
        };
      };
    };
  };
}
