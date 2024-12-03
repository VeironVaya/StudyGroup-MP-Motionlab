`IMPORTANT:` for attributes all words are not in capital but for all object (widget) its camell

Ex:
attribute -> `color` : widget -> `Colors`

1. Widget-Based Architecture
Everything in Flutter is a widget (text, images, buttons, layouts, etc.).
Widgets are classified into:
Stateless Widgets: Immutable and don’t manage state.
Stateful Widgets: Mutable and can update based on user interaction.

2. Declarative UI Framework
UI is described declaratively, and changes in the app’s state automatically update the UI.
Benefits: Predictable and efficient UI updates.

3. State Management
Manage dynamic data and UI updates efficiently.
Local State: Use setState for small, isolated updates.
Global State: Use libraries like Provider, Bloc, or Riverpod for complex applications.

4. Rendering Pipeline
The UI passes through these stages:
Widget: The configuration of UI elements.
Element: Links widgets to the render tree.
Render Object: Manages layout and painting on the screen.

5. Responsive Design
Techniques for making UIs adapt to different screen sizes:
Use MediaQuery to access device dimensions.
Use Flexible, Expanded, or AspectRatio for scaling.
Utilize LayoutBuilder to dynamically adjust the layout.