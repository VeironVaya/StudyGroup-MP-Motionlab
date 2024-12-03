1. Scaffold
Purpose: Provides the basic structure of a screen.
Key Properties:

`appBar:` Adds a header using AppBar.
`body:` Main content area of the screen.
`floatingActionButton:` Adds an interactive button for quick actions.
`drawer & endDrawer:` Create side navigation menus.
`bottomNavigationBar:` Defines a persistent navigation bar at the bottom.

2. SizedBox
Purpose: Define fixed width and height for spacing or layout purposes.
Key Properties:

`height & width:` Define dimensions explicitly.
`child:` Optional widget to place inside the SizedBox.

3. Stack
Purpose: Overlay multiple widgets on top of each other.
Key Properties:

`alignment:` Align children within the stack (e.g., Alignment.center).
`fit:` Adjusts how children fill the Stack (e.g., loose, expand).
`clipBehavior:` Controls clipping of overflowing content (e.g., Clip.none).

4. Flex, Expanded, and Flexible
Purpose: Manage space distribution between widgets.
Key Properties for Flex:

`direction:` Sets layout direction (vertical or horizontal).
`mainAxisAlignment & crossAxisAlignment:` Space distribution along axes.

Key Properties for Expanded:
Expands a child widget to fill remaining space in the parent.

Key Properties for Flexible:
Similar to Expanded but allows content to shrink if needed.

5. Alignment Widgets
`Padding:` Adds spacing around a widget using EdgeInsets.
`Align:` Aligns a child widget within its parent.
`Center:` Centers a child widget within its parent.