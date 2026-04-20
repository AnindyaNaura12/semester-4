Nama    : Anindya Naura Putri Azzahra
NIM     : 244107060051
Kelas   : SIB 2G

PRAKTIKUM Tugas Praktikum 1
Basic List
![Screenshot BasicList](images/basic_list.png)
--> In this practicum, I learned how to use the ListView and ListTile widgets in Flutter to create a simple list. The ListView widget is used to display elements in a scrollable list, while ListTile is used to structure each list item containing an icon and text. Through this practicum, I gained an understanding of how to create a clean, simple, and readable list interface in a Flutter application, as well as how to combine basic widgets such as Icon and Text within a single layout

Horizontal List
![Screenshot HorizontalList](images/horizontal_list.png)
--> In this practicum, I learned how to create a horizontal list using the ListView widget in Flutter by setting scrollDirection: Axis.horizontal. With this configuration, list items can be scrolled horizontally, making it suitable for displaying multiple pieces of content in a single row

Grid List
![Screenshot GridList](images/grid_list.png)
--> In this practicum, I learned how to use the GridView widget in Flutter to display data in a grid layout using GridView.count. By setting crossAxisCount: 2, the layout is divided into two columns, allowing items to be arranged more neatly and systematically. In addition, List.generate is used to create multiple items automatically based on their index

Create lists with different types of items
![Screenshot ListDifferent](images/mixed_list.png)
--> In this practicum, I learned how to use ListView.builder to display large amounts of data efficiently. With this approach, items are only created when needed, making it more memory-efficient and improving application performance. In addition, I also learned a simple concept of polymorphism through the use of a ListItem class with two subclasses, namely HeadingItem and MessageItem. Each item type has a different appearance for its title and subtitle

List with spaced items
![Screenshot SpaceList](images/spaced_list.png)
--> In this practicum, I learned how to arrange widget layouts using Column, LayoutBuilder, and SingleChildScrollView in Flutter. This combination ensures that the interface remains responsive and adapts to different screen sizes. Additionally, ConstrainedBox is used to enforce a minimum height based on the screen size, while the Card widget is utilized to display items in a clean and organized manner

Work with long lists
![Screenshot LongList](images/long_list.png)
--> In this practicum, I learned how to use ListView.builder in Flutter to display large amounts of data efficiently. This widget only builds the items that are currently visible on the screen, making it more memory-efficient and improving application performance. Additionally, the prototypeItem property is used to help Flutter determine item size consistently, allowing for more optimal rendering

Place a floating app bar above a list
![Screenshot FloatingAppBar](images/floating_app_bar.png)
--> In this practicum, I learned how to use CustomScrollView and SliverAppBar in Flutter to create a more dynamic user interface. The SliverAppBar allows the app bar to have flexible effects, such as expanding and collapsing during scrolling. Additionally, SliverList.builder is used to efficiently display a list of items within the scroll view

Create a scrolling parallax effect
![Screenshot ParallaxEffect](images/parallax_effect.png)
--> In this practicum, I learned how to create a parallax scrolling effect in Flutter using widgets such as SingleChildScrollView, Stack, Flow, and a custom FlowDelegate. The parallax effect allows background images to move at a different speed than the main content, resulting in a more dynamic and visually engaging interface. Additionally, I explored the use of RenderObject and scroll position management to calculate element movement in real time, enabling more precise and interactive visual effects