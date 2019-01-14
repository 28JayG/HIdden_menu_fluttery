//TODO:(7.1) Create a Menu which takes up the menu items.
/*Now you can give menu from above the tree*/

class Menu {
  final List<MenuItem> menuItems;

  const Menu({
    this.menuItems,
  });
}

class MenuItem {
  final String title;
  final String id;

  const MenuItem({
    this.title,
    this.id,
  });
}

const  items = <MenuItem>[
  MenuItem(
    title: 'RESTAURANTS',
    id: '0',
  ),
  MenuItem(
    title: 'OTHERS',
    id: '1',
  ),
  MenuItem(
    title: 'HELP US GROW',
    id: '2',
  ),
  MenuItem(
    title: 'SETTINGS',
    id: '3',
  ),
];
