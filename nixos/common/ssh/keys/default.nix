{lib, ...}: {
  age.secrets = with lib;
    listToAttrs (
      map (keyName:
        nameValuePair "ssh-${keyName}" {
          rekeyFile = ./${keyName}.age;
          owner = "cyril";
          mode = "600";
        })
      [
        "perso"
      ]
    );
}
