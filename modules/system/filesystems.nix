{ ... }:

{
  fileSystems."/mnt/drive" = {
    device = "/dev/disk/by-uuid/a788c710-a9bf-4883-a741-bbccce249b3e";
    fsType = "ext4";
    options = [
      "nofail"
    ];
  };
}
