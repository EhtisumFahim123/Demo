import 'package:flutter/material.dart';

class PersonalActivity {
  final String imageUrl;
  final String name;
  final String time;
  final double rating;
  final int reviews;
  final String description;

  PersonalActivity({
    required this.imageUrl,
    required this.name,
    required this.time,
    required this.rating,
    required this.reviews,
    required this.description,
  });
}

class UpdateActivity {
  final String userName;
  final String time;
  final String productImageUrl;
  final String productTitle;
  final String productDescription;
  final String price;
  final String oldPrice;
  final String stock;

  UpdateActivity({
    required this.userName,
    required this.time,
    required this.productImageUrl,
    required this.productTitle,
    required this.productDescription,
    required this.price,
    required this.oldPrice,
    required this.stock,
  });
}

// --- MAIN PAGE WIDGET ---

class Notification extends StatefulWidget {
  const Notification({super.key});

  @override
  State<Notification> createState() => _NotificationPageState();
}

class _NotificationPageState extends State<Notification>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  // --- MOCK DATA ---
  final List<PersonalActivity> personalActivities = [
    PersonalActivity(
      imageUrl: 'https://placehold.co/60x60/EFEFEF/808080?text=User',
      name: 'Joey McKenseyy',
      time: '12:31 AM',
      rating: 4.9,
      reviews: 1,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
    ),
    PersonalActivity(
      imageUrl: 'https://placehold.co/60x60/EFEFEF/808080?text=User',
      name: 'Sadia Jahan',
      time: '12:31 AM',
      rating: 4.9,
      reviews: 1,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
    ),
    PersonalActivity(
      imageUrl: 'https://placehold.co/60x60/EFEFEF/808080?text=User',
      name: 'John Luise',
      time: '12:31 AM',
      rating: 4.9,
      reviews: 1,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
    ),
    PersonalActivity(
      imageUrl: 'https://placehold.co/60x60/EFEFEF/808080?text=User',
      name: 'Hossain',
      time: '12:31 AM',
      rating: 4.9,
      reviews: 1,
      description:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text.',
    ),
  ];

  final List<UpdateActivity> updateActivities = [
    UpdateActivity(
      userName: 'Eshogol',
      time: '12:31 AM',
      productImageUrl: 'https://placehold.co/100x100/EFEFEF/808080?text=PC',
      productTitle: 'Gaming PC Intel 13th Gen Cor...',
      productDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the...',
      price: '25.99S',
      oldPrice: '29.99S',
      stock: '05',
    ),
    UpdateActivity(
      userName: 'Eshogol',
      time: '12:31 AM',
      productImageUrl: 'https://placehold.co/100x100/EFEFEF/808080?text=Phone',
      productTitle: 'Apple 17 new collection',
      productDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the...',
      price: '25.99S',
      oldPrice: '29.99S',
      stock: '05',
    ),
    UpdateActivity(
      userName: 'Eshogol',
      time: '12:31 AM',
      productImageUrl:
          'https://placehold.co/100x100/EFEFEF/808080?text=Headset',
      productTitle: 'Awei A360BL Wireless Headp...',
      productDescription:
          'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the...',
      price: '25.99S',
      oldPrice: '29.99S',
      stock: '05',
    ),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          elevation: 0,
          automaticallyImplyLeading: false,
          flexibleSpace: SafeArea(
            child: Column(
              children: [
                // Custom App Bar Row
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(Icons.arrow_back_ios, size: 20),
                        color: Colors.grey.shade700,
                        onPressed: () => Navigator.pop(context),
                      ),
                      const SizedBox(width: 12),
                      Text(
                        'Notification',
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                // TabBar
                TabBar(
                  controller: _tabController,
                  labelColor: Colors.black,
                  unselectedLabelColor: Colors.grey.shade600,
                  indicatorColor: primaryColor,
                  indicatorWeight: 3.0,
                  labelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  unselectedLabelStyle: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                  tabs: [
                    _buildTabWithBadge('Personal Activity', '2'),
                    _buildTabWithBadge('Update Activity', '5'),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPersonalActivityList(),
          _buildUpdateActivityList(),
        ],
      ),
    );
  }

  Widget _buildTabWithBadge(String title, String count) {
    return Tab(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          const SizedBox(width: 8),
          Container(
            padding: const EdgeInsets.all(2.0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            constraints: const BoxConstraints(
              minWidth: 18,
              minHeight: 18,
            ),
            child: Text(
              count,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }

  // --- Personal Activity Tab Builder ---
  Widget _buildPersonalActivityList() {
    return ListView.separated(
      itemCount: personalActivities.length,
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemBuilder: (context, index) {
        final item = personalActivities[index];
        return _buildPersonalActivityCard(item);
      },
    );
  }

  Widget _buildPersonalActivityCard(PersonalActivity item) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        CircleAvatar(
          radius: 24,
          backgroundImage: NetworkImage(item.imageUrl),
          backgroundColor: Colors.grey.shade200,
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    item.name,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    item.time,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 4),
              Row(
                children: [
                  Icon(Icons.star, color: Colors.orange.shade400, size: 16),
                  const SizedBox(width: 4),
                  Text(
                    item.rating.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(width: 4),
                  Icon(Icons.circle, color: Colors.grey.shade400, size: 6),
                  const SizedBox(width: 4),
                  Text(
                    '${item.reviews} Reviews',
                    style: TextStyle(color: Colors.grey.shade600),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Text(
                item.description,
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.grey.shade700,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  // --- Update Activity Tab Builder ---
  Widget _buildUpdateActivityList() {
    return ListView.separated(
      itemCount: updateActivities.length,
      padding: const EdgeInsets.all(16.0),
      separatorBuilder: (context, index) => const Divider(height: 32),
      itemBuilder: (context, index) {
        final item = updateActivities[index];
        return _buildUpdateActivityCard(item);
      },
    );
  }

  Widget _buildUpdateActivityCard(UpdateActivity item) {
    final Color primaryColor = Theme.of(context).primaryColor;

    return Column(
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 16,
              backgroundColor: Colors.grey.shade300,
              child: Icon(Icons.person, size: 20, color: Colors.grey.shade600),
            ),
            const SizedBox(width: 8),
            Text(
              item.userName,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Spacer(),
            Text(
              item.time,
              style: TextStyle(
                fontSize: 12,
                color: Colors.grey.shade600,
              ),
            ),
          ],
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8.0),
              child: Image.network(
                item.productImageUrl,
                width: 80,
                height: 80,
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  width: 80,
                  height: 80,
                  color: Colors.grey.shade200,
                  child: Icon(Icons.image_not_supported,
                      color: Colors.grey.shade400),
                ),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item.productTitle,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 4),
                  Text(
                    item.productDescription,
                    style: TextStyle(
                      fontSize: 13,
                      color: Colors.grey.shade700,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        item.price,
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        item.oldPrice,
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade500,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Stock: ${item.stock}',
                        style: TextStyle(
                          fontSize: 12,
                          color: Colors.grey.shade600,
                        ),
                      ),
                      Row(
                        children: [
                          Container(
                            height: 32,
                            width: 32,
                            decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(6),
                            ),
                            child: const Icon(
                              Icons.shopping_bag_outlined,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 8),
                          SizedBox(
                            height: 32,
                            child: OutlinedButton(
                              onPressed: () {},
                              style: OutlinedButton.styleFrom(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 24),
                                side:
                                    BorderSide(color: Colors.grey.shade400),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6),
                                ),
                              ),
                              child: const Text(
                                'Buy',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
