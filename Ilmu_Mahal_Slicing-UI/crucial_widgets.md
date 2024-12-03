1. Container

Purpose: Core layout and styling widget.
Key Properties:
    `alignment:` Aligns the child widget within the container.
    `padding:` Adds inner spacing around the child.
    `margin:` Adds outer spacing outside the container.
    `decoration:` Provides styling such as color, gradient, border, or shadow using BoxDecoration.
    `width & height:` Define fixed dimensions of the container.
    `constraints:` Set flexible size constraints using BoxConstraints.

2. Column and Row

Purpose: Arrange widgets vertically (Column) or horizontally (Row).
Key Properties:
    `mainAxisAlignment:` Space distribution along the primary axis.
    `crossAxisAlignment:` Alignment along the cross axis (perpendicular to the main axis).
    `mainAxisSize:` Determines whether the widget takes minimum or maximum space along the main axis.
    `children:` List of widgets to arrange.

3. Text
Purpose: Display textual content.
Key Properties:
    `data:` The actual text to display.
    `style:` Controls text styling via TextStyle. fontSize, fontWeight, color, letterSpacing, wordSpacing.
    `textAlign:` Aligns text horizontally.
    `maxLines:` Sets the maximum number of lines for the text.
    `overflow:` Defines behavior when text exceeds available space (e.g., ellipsis).

4. Image
Purpose: Display local or network images.
Key Properties:
    `image:` Specifies the image source.
    `fit:` Defines how the image fits inside its container (e.g., cover, contain, fill).
    `width & height:` Set the image dimensions.
    `alignment:` Align the image inside its container.
    `color:` Applies a color filter over the image.

5. ListView and GridView
Purpose: Display scrollable lists or grids of widgets.
Key Properties for ListView:
    `children or builder:` Add items to the list dynamically or statically.
    `scrollDirection:` Scroll vertically (Axis.vertical) or horizontally (Axis.horizontal).
    `padding:` Adds spacing around the list.
    `shrinkWrap:` Reduces size when ListView is inside another scrollable widget.
Key Properties for GridView:
    `gridDelegate:` Specifies grid layout configuration (e.g., SliverGridDelegateWithFixedCrossAxisCount).
    `crossAxisSpacing & mainAxisSpacing:` Controls spacing between grid items.
    `childAspectRatio:` Defines width-to-height ratio of items.