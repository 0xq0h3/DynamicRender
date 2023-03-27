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

<table>
	<tr>
		<th><code>SimpleScheme</code></th>
		<th><code>FirstScheme</code></th>
		<th><code>SecondScheme</code></th>
    </tr>
	<tr>
		<td>
			<img width="399" alt="image" src="https://user-images.githubusercontent.com/125193351/227917089-05119011-a594-4528-82a1-f66e1275c17a.png">
		</td>
		<td>
			<img width="398" alt="image" src="https://user-images.githubusercontent.com/125193351/227917122-5d2e3c05-851a-4575-bd3b-b03cdfba1ae0.png">
		</td>
		<td>
			<img width="399" alt="image" src="https://user-images.githubusercontent.com/125193351/227917153-0c31f657-eabb-4338-8777-e5921faeac4c.png">
		</td>
	</tr>
</table>




## Module Structure
- DynamicRenderApp Project
	- DynamicRenderServer
	- AppLogic
		- Server 
		- Client
		- Common
