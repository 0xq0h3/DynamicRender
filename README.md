# DynamicRender App

## How to run
open `DynamicRenderApp/DynamicRenderApp.xcodeproj`

### Run Server
1. select scheme `Run` and for target `Mac`
2. build and run

### Run iOS Client
1. select scheme `DynamicRenderApp` for target iOS
2. build and run

## Change UI in Server Side
1. Comment out `DynamicSchemeResponse` in `AppLogic/Sources/Server/Controllers/DynamicSchemeController` 
2. Run Server 
3. Press Refresh button in iOS

## Module Structure
- DynamicRenderApp Project
	- DynamicRenderServer
	- AppLogic
		- Server 
		- Client
		- Common
