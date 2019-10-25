class Drinks {
  String name;
  String id;
  String imagePath;
  bool isFavorite;

  Drinks({
    this.name = '',
    this.id = '',
    this.imagePath = '',
    this.isFavorite = false
  });

  static List<Drinks> popularDrinksList = [
    Drinks(
      imagePath: 'https://www.thecocktaildb.com/images/media/drink/rxtqps1478251029.jpg',
      name: 'Mojito',
      id: '11000',
      isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/vrwquq1478252802.jpg',
        name: 'Old Fashioned',
        id: '11001',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/ywxwqs1439906072.jpg',
        name: 'Long Island Tea',
        id: '11002',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/qgdu971561574065.jpg',
        name: 'Negroni',
        id: '11003',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/o56h041504352725.jpg',
        name: 'Whiskey Sour',
        id: '11004',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/71t8581504353095.jpg',
        name: 'Dry Martini',
        id: '11005',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/usuuur1439906797.jpg',
        name: 'Daiquiri',
        id: '11006',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/wpxpvu1439905379.jpg',
        name: 'Margarita',
        id: '11007',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/ec2jtz1504350429.jpg',
        name: 'Manhattan',
        id: '11008',
        isFavorite: false
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/3pylqc1504370988.jpg',
        name: 'Moscow Mule',
        id: '11009',
        isFavorite: false
    ),
  ];

  static List<Drinks> latestDrinksList = [
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/03du7q1569041777.jpg',
        name: 'Brooklyn',
        id: '178310'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/acvf171561574403.jpg',
        name: 'Espresso Rumtini',
        id: '178309'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/51ezka1551456113.jpg',
        name: 'Spritz Veneziano',
        id: '178308'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/43uhr51551451311.jpg',
        name: 'Tequila Slammer',
        id: '178307'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/l9tgru1551439725.jpg',
        name: 'Slippery Nipple',
        id: '178306'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/nwatpb1504817045.jpg',
        name: 'Affinity',
        id: '17840'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/wxrsxx1472720734.jpg',
        name: 'Affair',
        id: '17839'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/xrvruq1472812030.jpg',
        name: 'Adonis Cocktail',
        id: '17838'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/rwuxsv1472812169.jpg',
        name: 'Adam',
        id: '17837'
    ),
    Drinks(
        imagePath: 'https://www.thecocktaildb.com/images/media/drink/vtpsvr1472811976.jpg',
        name: 'Acapulco',
        id: '17836'
    ),
  ];
}
