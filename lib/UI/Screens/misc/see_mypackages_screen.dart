import 'package:cruise_buddy/core/constants/styles/text_styles.dart';
import 'package:cruise_buddy/core/model/list_my_cruise_model/cruise.dart';
import 'package:flutter/material.dart';

class SeeMyPackagesScreen extends StatefulWidget {
  final Cruise cruise;

  const SeeMyPackagesScreen({super.key, required this.cruise});

  @override
  State<SeeMyPackagesScreen> createState() => _SeeMyPackagesScreenState();
}

late List<String> imageUrls;

int _currentIndex = 0;

class _SeeMyPackagesScreenState extends State<SeeMyPackagesScreen> {
  void initState() {
    super.initState();

    // Build the list from widget.cruise safely
    final images = widget.cruise.cruisesImages;
    imageUrls = (images?.isNotEmpty ?? false)
        ? images!.map((e) => e.cruiseImg ?? '').toList()
        : ['assets/image/boat_details_img/boat_detail_img.png'];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 249, 249, 249),
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: Text("My Cruise", style: TextStyles.ubuntu32black15w700),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cruise Images Carousel
            if (widget.cruise.cruisesImages?.isNotEmpty ?? false)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Stack(
                  children: [
                    SizedBox(
                      height: 200,
                      child: PageView.builder(
                        itemCount: widget.cruise.cruisesImages!.length,
                        onPageChanged: (index) {
                          setState(() {
                            _currentIndex = index;
                          });
                        },
                        itemBuilder: (context, index) {
                          final imageUrl = imageUrls[index];

                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 8.0),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(15),
                              child: imageUrl.startsWith('http')
                                  ? Image.network(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                        return Image.asset(
                                          'assets/image/boat_details_img/boat_detail_img.png',
                                          fit: BoxFit.cover,
                                        );
                                      },
                                    )
                                  : Image.asset(
                                      imageUrl,
                                      fit: BoxFit.cover,
                                    ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 10,
                      left: 20,
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.black54,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Text(
                          '${_currentIndex + 1}/${imageUrls.length}',
                          style: TextStyles.ubuntu16whitew2700,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.cruise.name ?? '',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                widget.cruise.description ?? '',
                style: TextStyle(fontSize: 16),
              ),
            ),

            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Text(
                "Available Packages",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600),
              ),
            ),

            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.cruise.packages?.length ?? 0,
              itemBuilder: (context, index) {
                final package = widget.cruise.packages![index];
                return Card(
                  color: const Color.fromARGB(255, 241, 240, 240),
                  margin:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  elevation: 3,
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          package.name ?? 'Package',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 8),
                        Text(package.description ?? 'No description provided.'),
                        const SizedBox(height: 8),
                        Text("Price: ${package.description}"),
                        const SizedBox(height: 4),
                        Text("Duration: ${package.description ?? 'N/A'} days"),
                        // Show Booking Types (with icons and prices)
                        const SizedBox(height: 15),
                        if (package.bookingTypes != null &&
                            package.bookingTypes!.isNotEmpty)
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Booking Types:",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              const SizedBox(height: 8),
                              ...package.bookingTypes!.map((type) {
                                return Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    children: [
                                      CircleAvatar(
                                        radius: 16,
                                        backgroundImage:
                                            NetworkImage(type.icon ?? ''),
                                      ),
                                      const SizedBox(width: 8),
                                      Expanded(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(type.name ?? '',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.w600)),
                                            const SizedBox(height: 2),
                                            Text(
                                                "Price: ₹${type.pivot?.price ?? 'N/A'}"),
                                            Text(
                                                "price Per Person: ₹${type.pivot?.pricePerPerson ?? 'N/A'}"),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                );
                              }).toList(),
                            ],
                          )
                      ],
                    ),
                  ),
                );
              },
            ),

            SizedBox(height: 70)
          ],
        ),
      ),
    );
  }
}
