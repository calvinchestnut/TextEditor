# TextEditor

`SwiftUI`'s `Text` and `TextField` types have some issues displaying multiple lines. 

Once I filed the radars for this behavior I made a wrapper around UITextField that could unblock me, hope this helps anyone else out there!

#### Broken

As of now I can't seem to be able to expose the initializer of TextEditor, so you can't actually construct the component with a Binding String to edit, which kinda breaks everything. Code reference is still available though!

## TODO

[ ] Apply inherited TextColor

[ ] Improve Font inheritance
