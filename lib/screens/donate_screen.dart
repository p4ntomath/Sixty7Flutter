import 'package:flutter/material.dart';

class DonateScreen extends StatelessWidget {
  const DonateScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey[50],
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'Donate',
          style: TextStyle(color: Colors.white),
        ),

        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white), // Set
      ),
        body: Center(
          child: SingleChildScrollView( // Add SingleChildScrollView
            child: Column(
              children: [
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const donateMoney()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('Money', style: TextStyle(color: Colors.white)),
                            Icon(Icons.attach_money, color: Colors.white),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('............................OR............................')
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateFood()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Food'),
                              Icon(Icons.restaurant_sharp),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateClothes()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Clothes'),
                              Icon(Icons.shopping_bag),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateHygiene()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Hygiene'),
                              Icon(Icons.bathtub_rounded),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateToys()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Toys'),
                              Icon(Icons.child_friendly_sharp),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donatePads()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Pads and tampons'),
                              Icon(Icons.health_and_safety),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateBooks()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Books'),
                              Icon(Icons.menu_book),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateBed()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Bedding'),
                              Icon(Icons.bed),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => const donateComp()),
                          );
                        },
                        child: Container(
                          width: 100,
                          height: 75,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text('Computers'),
                              Icon(Icons.computer),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const donateOther()),
                        );
                      },
                      child: Container(
                        width: 200,
                        height: 75,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Other...',
                              style: TextStyle(color: Colors.white),
                            ),
                            Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: Colors.white,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
    );
  }
}

class donateOther extends StatelessWidget {
  const donateOther({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
            'Other...',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://cf.ltkcdn.net/charity/images/std-lg/261540-1200x800-donations.webp', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Orion Donation Facility',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'In this place, no donation is too much, too weird or too unorthodox, we accept all.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('123 Beach Ave, Sun City, SA'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 75-987-6543'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('contact@OrionDonationFacility.com'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateFood extends StatelessWidget {
  const donateFood({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Food',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://media.istockphoto.com/id/1060352206/photo/donate-food-to-hungry-people-concept-of-poverty-and-hunger.jpg?s=1024x1024&w=is&k=20&c=gGe745FB1BoPtvm1gX-4AGTexDDZOn7Xpk_HB3phOtM=', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Johannesburg Food Bank',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'We envisioned a positive community with efficient and effective developmental services that promote the wellbeing and development of young people so that the members of the said community may lead a purposeful fulfilled life.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('85 High Street, Johannesburg, South Africa'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 73-538-2855'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('projects@believerscaresociety.org'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateClothes extends StatelessWidget {
  const donateClothes({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Clothes',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://clothestogood.com/wordpress/wp-content/uploads/2021/09/Mian-pic-1-1024x576.jpg', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Clothes To Good',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Clothes to Good (CTG) is a textile recycling and disability empowerment organisation. We find great joy in empowering people through what others categorise as “waste”.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('45 Migmiatite Dr zwartkop, Centurion, South Africa'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 74-242-7414'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('jesse@c2cx.co.za'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateHygiene extends StatelessWidget {
  const donateHygiene({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Hygiene Products',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://www.forgood.co.za/_next/image?url=https%3A%2F%2Fforgood-cdn.azureedge.net%2Fforgoodupload%2Fneedlogo%2F65d65a1b-2f0d-4fcd-9cc4-e9f197f51739%2Flogo_large.Jpeg&w=750&q=75', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'For Good',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Connect people to causes',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Postal Address'),
              subtitle: Text('P.O. Box 413342, Craighall, 2024'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 11-325-2594'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('contact@forgood.co.za'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateToys extends StatelessWidget {
  const donateToys({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Toys',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://ashrafulaid.org/wp-content/uploads/2021/01/Benoni-1024x1024.png', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Ashraful AID',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'In order for a child’s brain to develop effectively, it must be stimulated during the early and formative years. Activities, such as playing with toys – from puzzles to teddy bears – pave the way for emotional stability later on in life.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('14 zinnia Drive, Marlboro Gardens, South Africa'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 11-809-8181'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('info@ashrafulaid.org'),
            ),
          ],
        ),
      ),
    );
  }
}
class donatePads extends StatelessWidget {
  const donatePads({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Pads and Tempons',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://www.caring4girls.africa/wp-content/uploads/2021/03/brand-image.png', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Caring4girls',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Our mission is to transform current sanitary pad collection initiatives into profitable business opportunities through the sale of our ‘business-in-a-box’ that provides economic empowerment and affordable sanitary products to women in low income communities.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('43 Wierda Road, Sandton, South Africa'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 67-030-5924'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('info@caring4girls.africa'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateBooks extends StatelessWidget {
  const donateBooks({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Books',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://www.emmauspl.org/wp-content/uploads/2022/02/Donations-1.jpg', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Books for Africa',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Books For Africa appreciates all book donations. It costs BFA 50 cents to ship each book to Africa. Consider making a financial donation.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('717 Prior ave, Suit B St.Paul, USA'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+1 651-251-8896'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('bfa@booksforafrica.org'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateBed extends StatelessWidget {
  const donateBed({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Bedding',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://b3602177.smushcdn.com/3602177/wp-content/uploads/2021/03/DonationBlankets02-1024x683.jpg?lossy=2&strip=1&webp=1', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'Selsi Textiles (PTY) LTD',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Offering those less fortunate our affordable range of donation blankets.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('1090 Anvil Road, Robertville, Johannesburg, South Africa'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 11-674-5114'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('factoryshop@selsi.co.za'),
            ),
          ],
        ),
      ),
    );
  }
}
class donateComp extends StatelessWidget {
  const donateComp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Computers and other Internet devices',
          style: TextStyle(color: Colors.white),
        ),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
                bottom: Radius.circular(20.0)
            )
        ),
        iconTheme: IconThemeData(color: Colors.white),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Adding the picture of the place
            ClipRRect(
              borderRadius: BorderRadius.circular(12), // Rounded corners for the image
              child: Image.network(
                'https://static.east-tec.com/images/b/blog/2013/go-green-donate-your-old-computer-not-your-data/post-image-go-green-donate-your-old-computer-not-your-data.png', // Example place image URL
                width: double.infinity, // Make the image take full width
                height: 200,
                fit: BoxFit.cover, // Ensure the image covers the area
              ),
            ),
            SizedBox(height: 16), // Space between picture and description

            // Adding the description of the place
            Text(
              'ComputerLab',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'With your support, we enable schools and learners across South Africa with computers.',
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center, // Center align the description text
            ),
            SizedBox(height: 20), // Space before the list of contact details

            // Adding the ListTiles for address, contact, and email
            ListTile(
              leading: Icon(Icons.location_on),
              title: Text('Address'),
              subtitle: Text('33 6th Street, Wynberg, Sandton, South Africa'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.phone),
              title: Text('Phone Number'),
              subtitle: Text('+27 10-140-0877'),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.email),
              title: Text('Email'),
              subtitle: Text('info@Ocomputerlab.co.za'),
            ),
          ],
        ),
      ),
    );
  }
}

class donateMoney extends StatelessWidget {
  const donateMoney({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'Donate Now',
        style: TextStyle(color: Colors.white)),
        iconTheme: IconThemeData(color: Colors.white),
        backgroundColor: Colors.lightBlue,
        centerTitle: true,
      ),
      body: SingleChildScrollView( // Add SingleChildScrollView here
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              // Header Image or Banner
              Container(
                height: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        'https://www.kindpng.com/picc/m/108-1084723_donate-button-png-image-transparent-png.png'),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
              SizedBox(height: 20.0),

              // Donation Amount Input
              TextField(
                decoration: InputDecoration(
                  labelText: 'Enter Donation Amount in Rands',
                  prefixIcon: Icon(Icons.money),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                keyboardType: TextInputType.number,
              ),
              SizedBox(height: 20.0),

              // Payment Method Selection
              DropdownButtonFormField<String>(
                decoration: InputDecoration(
                  labelText: 'Select Payment Method',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                items: <String>[
                  'Credit Card',
                  'PayPal',
                  'Google Pay',
                  'Apple Pay'
                ].map((String value) {
                  return new DropdownMenuItem<String>(
                    value: value,
                    child: new Text(value),
                  );
                }).toList(),
                onChanged: (_) {},
              ),
              SizedBox(height: 20.0),

              // Donate Button
              ElevatedButton(
                onPressed: () {
                  // Handle donation submission logic here
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: Text('Thank You!'),
                        content: Text('Your donation has been received.'),
                        actions: <Widget>[
                          TextButton(
                            child: Text('OK'),
                            onPressed: () {
                              Navigator.of(context).pop();
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlue,
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
                child: Text(
                  'Donate Now',
                  style: TextStyle(fontSize: 18.0, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}




