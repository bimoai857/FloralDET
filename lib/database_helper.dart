import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final database = db();
const tableProducts = 'products';

Future<Database> db() async {
  return openDatabase(
    join(await getDatabasesPath(), 'products_database.db'),
    onCreate: (db, version) {
      return db.execute('''
      CREATE TABLE $tableProducts(
      id INTEGER PRIMARY KEY,
      name TEXT NOT NULL,
      kingdom TEXT NOT NULL,
      genus TEXT NOT NULL,
      color TEXT NOT NULL,
      noofspecies INTEGER NOT NULL,
      foundin TEXT NOT NULL,
      description TET NOT NULL,
      about TEXT NOT NULL

    )
      ''');
    },
    // Version provides path to perform database upgrades and downgrades.
    version: 1,
  );
}

//Inserting demo data into database
void initDB() async {
  var f1 = Product(
      id: 11,
      name: 'Rose',
      kingdom: 'Plantae',
      genus: 'Rosa L.',
      color: 'Red',
      noofspecies: 100,
      foundin:
          'North America, Europe, northwest Africa and many parts of Asia and Oceania',
      description:
          'The flower of the rose plant can be different sizes. It may be as small as 1/2 inch across to a diameter of almost 7 inches.',
      about:
          'Roses are widely used across the world as symbols of love, sympathy or sorrow.The rose was sacred to Venus (mythology). Venus was the Roman goddess of love and beauty');
  var f2 = Product(
      id: 1,
      name: 'Bluebell',
      kingdom: 'Plantae',
      genus: 'Hyacinthoides',
      color: 'Blue',
      noofspecies: 11,
      foundin:
          'Most species are distributed around the Mediterranean Basin, with only one species in northwestern Europe',
      description:
          'Hyacinthoides is differentiated by the presence of two bracts at the base of each flower',
      about:
          'Bluebells are famous as indicator species (markers) for ancient woodland, where they carpet the forest floor in springtime. They grow in shade rather than in sunny areas');
  var f3 = Product(
      id: 2,
      name: 'Buttercup',
      kingdom: 'Plantae',
      genus: 'Ranunculus L.',
      color: 'Yellow and white',
      noofspecies: 600,
      foundin: 'Northern Europe',
      description:
          'Most can be identified by their yellow cupped flowers and free-growing habit. The plants often climb or sprawl, with leaves arranged in spirals. Some may contain leaves without stipules and flowers with many stamens',
      about:
          'It is poisonous to eat for humans and cattle, but when dry the poison is not active.');
  var f4 = Product(
      id: 3,
      name: 'Cowslip',
      kingdom: 'Plantae',
      genus: 'Primula',
      color: 'Yellow',
      noofspecies: 500,
      foundin:
          'The species is native throughout most of temperate Europe and western Asia, and although absent from more northerly areas including much of northwest Scotland, it reappears in northernmost Sutherland and Orkney and in Scandinavia',
      description:
          'Primula veris is a variable evergreen or semi-evergreen perennial plant growing to 25 cm (10 in) tall and broad, with a rosette of leaves 5–15 cm long and 2–6 cm broad. The deep yellow flowers are produced in spring, in clusters of 10–30 blooms together on a single stem. Each flower is 9–15 mm broad. Red- and orange-flowered plants occur rarely but can be locally widespread in areas where coloured primula hybrids bloom at the same time as the native cowslip',
      about:
          'This herb was already mentioned by Pliny the Elder for its early blooming attributes. Species from the genus Primula along with other ritual plants played a significant role in the pharmacy and mythology of the Celtic druids, likely as an ingredient of magical potions to increase the absorption of other herbal constituents.Cowslip leaves have been traditionally used in Spanish cooking as a salad green. Uses in English cookery include using the flowers to flavor country wine.');
  var f5 = Product(
      id: 4,
      name: 'Crocus',
      kingdom: 'Plantae',
      genus: 'Crocus L.',
      color: 'lilac, mauve, yellow, and white',
      noofspecies: 90,
      foundin:
          'Crocuses are native to woodland, scrub, and meadows from sea level to alpine tundra in North Africa and the Middle East, central and southern Europe, in particular Krokos, Greece, on the islands of the Aegean, and across Central Asia to Xinjiang Province in western China',
      description:
          'The cup-shaped, solitary, salverform flower tapers off into a narrow tube.The grass-like, ensiform leaf shows generally a white central stripe along the leaf axis. The leaf margin is entire',
      about:
          'The name of the genus is derived from the Greek κρόκος (krokos). Cultivation and harvesting of Crocus sativus for saffron was first documented in the Mediterranean, notably on the island of Crete');
  var f6 = Product(
      id: 5,
      name: 'Daffodil',
      kingdom: 'Plantae',
      genus: 'Narcissus L.',
      color: 'Contrasting yellow, white, pink, or orange.',
      noofspecies: 50,
      foundin:
          'Europe, northern parts of Africa and western parts of Asia and Mediterranean.',
      description:
          'Conspicuous flowers with six petal-like tepals surmounted by a cup- or trumpet-shaped corona.',
      about:
          'The decorative use of narcissi dates as far back as ancient Egyptian tombs, and frescoes at Pompeii.They are mentioned in the King James Version of the Bible as the Rose of Sharon and make frequent appearances in classical literature.');
  var f7 = Product(
      id: 6,
      name: 'Daisy',
      kingdom: 'Plantae',
      genus: 'Bellis',
      color:
          'A daisy flower is composed of white petals and a yellow center, although the flower can sometimes have a pink or rose color',
      noofspecies: 23000,
      foundin: 'Daisy can be found on all continents except Antarctica',
      description:
          'It is a perennial herbaceous plant with short creeping rhizomes and rosettes of small rounded or spoon-shaped leaves that are from 3/4 to 2 inches (approx. 2–5 cm) long and grow flat to the ground.',
      about:
          'This daisy may be used as a potherb.Young leaves can be eaten raw in salads or cooked, noting that the leaves become increasingly astringent with age.Flower buds and petals can be eaten raw in sandwiches, soups and salads.It is also used as a tea and as a vitamin supplement.');
  var f8 = Product(
      id: 9,
      name: 'Pansy',
      kingdom: 'Plantae',
      genus: 'Viola',
      color:
          'Yellow, gold, orange, purple, violet, red, white, and even near-black',
      noofspecies: 600,
      foundin:
          'Pansies are native to Europe and were formed from natural mutations of ancient viola cultivars.',
      description:
          'The garden pansy flower is 5 to 8 centimetres (2 to 3 in) in diameter and has two slightly overlapping upper petals, two side petals, and a single bottom petal with a slight beard emanating from the flowers center.',
      about:
          'Because its name means thought, the pansy was chosen as a symbol of Freethought and has been used in the literature of the American Secular Union.');
  var f9 = Product(
      id: 7,
      name: 'Dandelion',
      kingdom: 'Plantae',
      genus: 'Taraxacum',
      color: 'bright orangish yellow',
      noofspecies: 100,
      foundin: 'Dandelions are found on six continents',
      description:
          'Taraxacum officinale grows from generally unbranched taproots and produces one to more than ten stems that are typically 5–40 cm (2.0–15.7 in) tall, but sometimes up to 70 cm (28 in) tall. The stems can be tinted purplish, they are upright or lax, and produce flower heads that are held as tall or taller than the foliage.',
      about:
          'Dandelions are harvested from the wild or grown on a small scale as a leaf vegetable. The leaves (called dandelion greens) can be eaten cooked or raw in various forms, such as in soup or salad. They are probably closest in character to mustard greens.');
  var f10 = Product(
      id: 10,
      name: 'Passion',
      kingdom: 'Plantae',
      genus: 'Passiflora L.',
      color: 'Blue Purple Green Red White Pink Yellow',
      noofspecies: 550,
      foundin:
          'Mostly from tropical America but with a few species originating in Asia, Australasia and the Polynesian Islands.',
      description:
          'Most passion flowers are climbing or prostrate vines with grasping tendrils; some are trees or shrubs. The plants can be herbaceous or woody. The simple leaves are entire or lobed, and a single plant may produce a diversity of leaf shapes.',
      about:
          'The Passion in passion flower refers to the passion of Jesus in Christian theology.In the 15th and 16th centuries, Spanish Christian missionaries adopted the unique physical structures of this plant, particularly the numbers of its various flower parts, as symbols of the last days of Jesus and especially his crucifixion');
  var f11 = Product(
      id: 12,
      name: 'Snowdrop',
      kingdom: 'Plantae',
      genus: 'Galanthus',
      color: 'Light pink, blue, lavender, or white.',
      noofspecies: 20,
      foundin: 'Native to a large area of Europe',
      description:
          'Galanthus nivalis grows to around 7–15 cm tall, flowering between January and April in the northern temperate zone (January–May in the wild).They are perennial, herbaceous plants which grow from bulbs. Each bulb generally produces two linear, or very narrowly lanceolate, greyish-green leaves and an erect, leafless scape (flowering stalk), which bears at the top a pair of bract-like spathe valves joined by a papery membrane. From between them emerges a solitary, pendulous, bell-shaped white flower, held on a slender pedicel.',
      about:
          'In the UK and Ireland, many gardens open specially in February for visitors to admire the flowers. These displays may attract large numbers of sightseers. Some feature extensive displays of naturalised G. nivalis; others have more specialised collections of many species, forms and cultivars.');
  var f12 = Product(
      id: 13,
      name: 'Sunflower',
      kingdom: 'Plantae',
      genus: 'Helianthus L.',
      color:
          'Traditionally, sunflowers are bright yellow with brown centers, but varieties include shades of bright yellow, copper, red, brown, orange and bi-colored.',
      noofspecies: 52,
      foundin:
          'Sunflowers originate in the Americas. They were first domesticated in what is now Mexico and the Southern United States. Domestic sunflower seeds have been found in Mexico, dating to 2100 BCE. Native American people grew sunflowers as a crop from Mexico to Southern Canada.',
      description:
          'Sunflowers are usually tall annual or perennial plants that in some species can grow to a height of 300 cm (120 in) or more. They bear one or more wide, terminal capitula (flower heads), with bright yellow ray florets at the outside and yellow or maroon (also known as a brown/red) disc florets inside.',
      about:
          'The seed and sprouts of the common sunflower (Helianthus annuus L.) have many medicinal uses. The edible seed and the sprout have an abundance of nutrients and biological activities and have many antioxidants such as phenolic acids, flavonoids and vitamins.');
  var f13 = Product(
      id: 14,
      name: 'Tigerlily',
      kingdom: 'Plantae',
      genus: 'Lilium',
      color: 'Orange, red, yellow, white, and pink hybrids',
      noofspecies: 2,
      foundin: 'China, Japan, Korea, and the Russian Far East.',
      description:
          'Like other true lilies, the flowers are borne on upright stems that are 80–200 centimetres (31–79 in) tall and bear lanceolate leaves 6–10 centimetres (2.4–3.9 in) long and 1–2 centimetres (0.39–0.79 in) broad. Lilium lancifolium produces aerial bulblets, known as bulbils, in the leaf axils. These bulbils are uncommon in Lilium species and they produce new plants that are clones of the original plant.',
      about:
          'A case study of the successful treatment of a cat that ingested this particular species was published 2007.');
  var f14 = Product(
      id: 15,
      name: 'Tulip',
      kingdom: 'Plantae',
      genus: 'Tulipa L.',
      color: 'Red, pink, yellow, or white',
      noofspecies: 150,
      foundin:
          'Tulips originally were found in a band stretching from Southern Europe to Central Asia, but since the seventeenth century have become widely naturalised and cultivated',
      description:
          'Tulipa (tulips) is a genus of spring-blooming perennial herbaceous bulbiferous geophytes, dying back after flowering to an underground storage bulb. Depending on the species, tulip plants can be between 10 and 70 cm (4 and 28 inches) high.',
      about:
          'Tulip petals are edible flowers. The taste varies by variety and season, and is roughly similar to lettuce or other salad greens. Some people are allergic to tulips.Tulip festivals are held around the world, for example in the Netherlands and Spalding, England. There is also a popular festival in Morges, Switzerland.');

  var f15 = Product(
      id: 8,
      name: 'Hibiscus',
      kingdom: 'Plantae',
      genus: '	Hibiscus L.',
      color: 'White to pink, red, orange, peach, yellow or purple',
      noofspecies: 679,
      foundin:
          'Warm temperate, subtropical and tropical regions throughout the world.',
      description:
          'The leaves are alternate, ovate to lanceolate, often with a toothed or lobed margin. The flowers are large, conspicuous, trumpet-shaped, with five or more petals, colour from white to pink, red, orange, peach, yellow or purple, and from 4–18 cm broad.Flower colour in certain species, such as H. mutabilis and H. tiliaceus, changes with age.[9] The fruit is a dry five-lobed capsule, containing several seeds in each lobe, which are released when the capsule dehisces (splits open) at maturity. It is of red and white colours. It is an example of complete flowers.',
      about:
          'The red hibiscus is the flower of the Hindu goddess Kali, and appears frequently in depictions of her in the art of Bengal, India, often with the goddess and the flower merging in form. The hibiscus is used as an offering to goddess Kali and Lord Ganesha in Hindu worship.The hibiscus is a national symbol of Haiti, and the national flower of nations including the Solomon Islands and Niue. Hibiscus syriacus is the national flower of South Korea, and Hibiscus rosa-sinensis is the national flower of Malaysia. Hibiscus brackenridgei is the state flower of Hawaii.');
  var f16 = Product(
      id: 16,
      name: 'Balloon Flower',
      kingdom: 'Plantae',
      genus: 'Platycodon A.DC.',
      color: 'Blue; White; Pink',
      noofspecies: 1,
      foundin: 'East Asia (China, Korea, Japan, and the Russian Far East).',
      description:
          'Growing to 60 cm (24 in) tall by 30 cm (12 in) wide, it is an herbaceous perennial with dark green leaves and blue flowers in late summer. A notable feature of the plant is the flower bud, which swells like a balloon before fully opening. The five petals are fused together into a bell shape at the base, like its relatives, the campanulas.',
      about:
          'The extracts and purified platycoside compounds (saponins) from the roots of Platycodon grandiflorum may exhibit neuroprotective, antimicrobial, anti-inflammatory, anti-cancer, anti-allergy, improved insulin resistance, and cholesterol-lowering properties.[11] Evidence for these potential effects was mainly observed in vitro, with the exception of cholesterol lowering effects documented in vitro and in rats. The lack of efficacy and limited safety data in humans, however, necessitate further research.');

  var f17 = Product(
      id: 0,
      name: 'Alpine sea holly',
      kingdom: 'Plantae',
      genus: 'Eryngium',
      color: 'Bright green at the bases and the stiff, bristly bracts are blue',
      noofspecies: 250,
      foundin:
          'Austria, Liechtenstein, Croatia, France, Switzerland, Italy, and Slovenia.',
      description:
          'Eryngium alpinum is a hemicryptophyte, its overwintering buds are situated just below the soil surface and the floral axis more or less erect with a few leaves. The roots are deep and robust. The stems are solitary and erect, usually with three branches on the apex and with longitudinal purple stripes.  This plant generally reaches about 30–70 centimetres (12–28 in) in height, with a maximum of 100 centimetres (39 in).  The basal leaves are oval or heart-shaped, 10–15 centimetres (3.9–5.9 in) wide and 13–17 centimetres (5.1–6.7 in) long, with toothed hedges and a long petiole. The cauline leaves are sessile and progressively more divided.',
      about:
          'Eryngium alpinum is cultivated as an ornamental plant for its blue and purple flowerheads. It requires dry, well-drained soil and full sun.');
  // Insert a product into the database.
  await insertProduct(f1);
  await insertProduct(f2);
  await insertProduct(f3);
  await insertProduct(f4);
  await insertProduct(f5);
  await insertProduct(f6);
  await insertProduct(f7);
  await insertProduct(f8);
  await insertProduct(f9);
  await insertProduct(f10);
  await insertProduct(f11);
  await insertProduct(f12);
  await insertProduct(f13);
  await insertProduct(f14);
  await insertProduct(f15);
  await insertProduct(f16);
  await insertProduct(f17);
}

Future<void> insertProduct(Product product) async {
  // Get a reference to the database.
  final Database db = await database;

  // Insert the Product into the correct table. Also specify the
  // `conflictAlgorithm`. In this case, if the same product is inserted
  // multiple times, it replaces the previous data.
  await db.insert(
    tableProducts,
    product.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );
}

Future<List<Product>> allProducts(id) async {
  // Get a reference to the database.
  final Database db = await database;

  // Query the table for all The Products.
  final List<Map<String, dynamic>> maps =
      await db.query(tableProducts, where: "id=?", whereArgs: [id]);

  // Convert the List<Map<String, dynamic> into a List<Product>.
  return List.generate(
    maps.length,
    (i) {
      return Product(
          id: maps[i]['id'],
          name: maps[i]['name'],
          kingdom: maps[i]['kingdom'],
          genus: maps[i]['genus'],
          color: maps[i]['color'],
          noofspecies: maps[i]['noofspecies'],
          foundin: maps[i]['foundin'],
          description: maps[i]['description'],
          about: maps[i]['about']);
    },
  );
}

class Product {
  final int id;
  final String name;
  final String kingdom;
  final String genus;
  final String color;
  // ignore: non_constant_identifier_names
  final int noofspecies;
  // ignore: non_constant_identifier_names
  final String foundin;
  final String description;
  final String about;

  Product(
      {this.id,
      this.name,
      this.kingdom,
      this.genus,
      this.color,
      this.noofspecies,
      this.foundin,
      this.description,
      this.about});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'kingdom': kingdom,
      'genus': genus,
      'color': color,
      'noofspecies': noofspecies,
      'foundin': foundin,
      'description': description,
      'about': about
    };
  }

  @override
  String toString() {
    return 'Product("id": ${this.id},"name":${this.name},"kingdom":${this.kingdom},"genus":${this.genus},"color":${this.color},"noofspecies":${this.noofspecies},"foundin":${this.foundin},"description":${this.description},"about":${this.about}});';
  }
}
