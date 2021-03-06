{
  description = ''The elvis package implements a 'truthy', 'ternary' and a 'coalesce' operator to Nim as syntactic sugar for working with conditional expressions'';

  inputs.flakeNimbleLib.owner = "riinr";
  inputs.flakeNimbleLib.ref   = "master";
  inputs.flakeNimbleLib.repo  = "nim-flakes-lib";
  inputs.flakeNimbleLib.type  = "github";
  inputs.flakeNimbleLib.inputs.nixpkgs.follows = "nixpkgs";
  
  inputs."elvis-master".dir   = "master";
  inputs."elvis-master".owner = "nim-nix-pkgs";
  inputs."elvis-master".ref   = "master";
  inputs."elvis-master".repo  = "elvis";
  inputs."elvis-master".type  = "github";
  inputs."elvis-master".inputs.nixpkgs.follows = "nixpkgs";
  inputs."elvis-master".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."elvis-v0_3_0".dir   = "v0_3_0";
  inputs."elvis-v0_3_0".owner = "nim-nix-pkgs";
  inputs."elvis-v0_3_0".ref   = "master";
  inputs."elvis-v0_3_0".repo  = "elvis";
  inputs."elvis-v0_3_0".type  = "github";
  inputs."elvis-v0_3_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."elvis-v0_3_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."elvis-v0_4_0".dir   = "v0_4_0";
  inputs."elvis-v0_4_0".owner = "nim-nix-pkgs";
  inputs."elvis-v0_4_0".ref   = "master";
  inputs."elvis-v0_4_0".repo  = "elvis";
  inputs."elvis-v0_4_0".type  = "github";
  inputs."elvis-v0_4_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."elvis-v0_4_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  inputs."elvis-v0_5_0".dir   = "v0_5_0";
  inputs."elvis-v0_5_0".owner = "nim-nix-pkgs";
  inputs."elvis-v0_5_0".ref   = "master";
  inputs."elvis-v0_5_0".repo  = "elvis";
  inputs."elvis-v0_5_0".type  = "github";
  inputs."elvis-v0_5_0".inputs.nixpkgs.follows = "nixpkgs";
  inputs."elvis-v0_5_0".inputs.flakeNimbleLib.follows = "flakeNimbleLib";
  
  outputs = { self, nixpkgs, flakeNimbleLib, ...}@inputs:
  let 
    lib  = flakeNimbleLib.lib;
    args = ["self" "nixpkgs" "flakeNimbleLib"];
  in lib.mkProjectOutput {
    inherit self nixpkgs;
    meta = builtins.fromJSON (builtins.readFile ./meta.json);
    refs = builtins.removeAttrs inputs args;
  };
}