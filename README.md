# HaxeToolchain

## Getting Started
Prerequisites: Haxe, Rojo, Remodel

## Building
```powershell
haxe build.hxml | rojo build -o Build.rbxm | remodel run ci/bundle.lua Build.rbxm public/Build.rbxm
```