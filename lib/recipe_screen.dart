import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: RecipePage(),
    );
  }
}

class RecipePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Tomato Soup'),
        backgroundColor: Colors.green[50],
      ),
      backgroundColor: const Color.fromARGB(255, 191, 229, 207),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Food Picture - No padding here
            Container(
              width: double.infinity,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/Images/tomato_soup.jpg'), // Asset image
                  fit: BoxFit.cover,
                ),
              ),
            ),
            // Apply padding to the following content only
            Padding(
              padding: EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Ingredients Title
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Ingredients',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[600])),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      '',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                  SizedBox(height: 16),

                  // Instructions Title
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text('Instructions',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                            color: Colors.teal[600])),
                  ),
                  SizedBox(height: 10),
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      '1. Preheat the oven to 350°F (175°C). Grease and flour a 9x13-inch pan.\n'
                      '2. Whisk together the flour, baking powder, baking soda, cinnamon, nutmeg, and salt.\n'
                      '3. Mix the brown sugar, vegetable oil, and applesauce in another bowl.\n'
                      '4. Gradually combine the wet and dry ingredients, then fold in the grated carrots and walnuts.\n'
                      '5. Pour the batter into the pan and bake for 35 to 40 minutes or until a toothpick comes out clean.\n'
                      '6. Let the cake cool completely before frosting.',
                      style: TextStyle(fontSize: 16),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
