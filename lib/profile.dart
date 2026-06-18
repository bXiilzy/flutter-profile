import 'package:flutter/material.dart';


class MyProfile extends StatefulWidget {
  const MyProfile({super.key});

  @override
  State<MyProfile> createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  final double coverHeight = 200; // Less dominant than 260
  final double profileHeight = 140;
  bool isFollowing = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image
          Positioned.fill(
            child: Image.asset(
              'assets/images/background.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  color: const Color(0xFFDBEAFE), // Fallback light blue color
                );
              },
            ),
          ),
          // Scrollable Content
          Positioned.fill(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  buildHeader(),
                  const SizedBox(height: 16),
                  buildProfileDetails(),
                  const SizedBox(height: 20),
                  buildActionButtons(),
                  const SizedBox(height: 20),
                  buildContactInfo(),
                  const SizedBox(height: 24),
                  buildAboutSection(),
                  const SizedBox(height: 40),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }



  Widget buildHeader() {
    final top = coverHeight - profileHeight / 2;
    final bottomPadding = profileHeight / 2;
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.center,
      children: [
        Container(
          margin: EdgeInsets.only(bottom: bottomPadding),
          child: buildCoverImage(coverHeight),
        ),
        Positioned(top: top, child: buildProfileImage()),
      ],
    );
  }

  Widget buildCoverImage([double? coverHeight]) => Opacity(
    opacity: 0.65, // Softer, faint cover image blending with background
    child: Image.asset(
      'assets/images/cat.jpg',
      height: coverHeight,
      width: double.infinity,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stackTrace) {
        return Container(
          height: coverHeight,
          color: Colors.transparent,
          child: const Center(
            child: Icon(Icons.broken_image, color: Colors.grey, size: 48),
          ),
        );
      },
    ),
  );

  Widget buildProfileImage() => Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(24),
      border: Border.all(color: Colors.white, width: 4),
      boxShadow: [
        BoxShadow(
          color: Colors.black.withValues(alpha: 0.12),
          blurRadius: 16,
          spreadRadius: 2,
          offset: const Offset(0, 6),
        ),
      ],
    ),
    child: ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.asset(
        'assets/images/profile.jpg',
        width: profileHeight - 8,
        height: profileHeight - 8,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            width: profileHeight - 8,
            height: profileHeight - 8,
            color: Colors.grey.shade300,
            child: const Icon(Icons.person, color: Colors.grey, size: 48),
          );
        },
      ),
    ),
  );

  Widget buildProfileDetails() {
    return Column(
      children: [
        const Text(
          'นางสาวจีรนันท์ เกิดกล้า',
          style: TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.bold,
            color: Color(0xFF1E1B4B), // Deep indigo for high contrast
            letterSpacing: 0.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFC084FC).withValues(alpha: 0.15), // Soft pastel purple accent
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              color: const Color(0xFFC084FC).withValues(alpha: 0.25),
              width: 1,
            ),
          ),
          child: const Text(
            'ชื่อเล่น: เบลล์',
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w600,
              color: Color(0xFF7E22CE), // Rich purple text
            ),
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'สาขาวิทยาการคอมพิวเตอร์',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Color(0xFF334155), // Slate 700
          ),
        ),
        const SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.location_on_rounded,
              size: 16,
              color: Color(0xFF818CF8), // Soft pastel indigo
            ),
            const SizedBox(width: 4),
            const Text(
              'ศรีสะเกษ, ประเทศไทย',
              style: TextStyle(
                fontSize: 14,
                color: Color(0xFF475569), // Slate 600
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget buildContactInfo() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(18),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.85), // Frosted glass card
        borderRadius: BorderRadius.circular(20),
        border: Border.all(color: Colors.white.withValues(alpha: 0.3), width: 1),
      ),
      child: Column(
        children: [
          _buildInfoRow(
            Icons.email_outlined,
            'อีเมล',
            'jiranankredkla12@gmail.com',
          ),
          const Divider(height: 20, thickness: 0.8),
          _buildInfoRow(
            Icons.camera_alt_outlined,
            'Instagram',
            '@1bxil__',
          ),
          const Divider(height: 20, thickness: 0.8),
          _buildInfoRow(
            Icons.chat_bubble_outline_rounded,
            'LINE ID',
            '1bxil__',
          ),
        ],
      ),
    );
  }

  Widget buildActionButtons() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                gradient: isFollowing
                    ? const LinearGradient(
                        colors: [
                          Color(0xFFCBD5E1), // Soft slate grey 300
                          Color(0xFF94A3B8), // Soft slate grey 400
                        ],
                      )
                    : const LinearGradient(
                        colors: [
                          Color(0xFF93C5FD), // Pastel Blue (Blue 300)
                          Color(0xFFC084FC), // Pastel Purple (Purple 400)
                        ],
                      ),
                boxShadow: [
                  BoxShadow(
                    color: (isFollowing ? const Color(0xFF94A3B8) : const Color(0xFFC084FC))
                        .withValues(alpha: 0.25),
                    blurRadius: 10,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    isFollowing = !isFollowing;
                  });
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(
                        isFollowing
                            ? 'ติดตาม นางสาวจีรนันท์ เกิดกล้า เรียบร้อยแล้ว!'
                            : 'ยกเลิกการติดตามแล้ว',
                      ),
                      duration: const Duration(seconds: 2),
                      backgroundColor: isFollowing
                          ? const Color(0xFF8B5CF6) // Purple 500 SnackBar
                          : Colors.grey.shade700,
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  shadowColor: Colors.transparent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: Icon(
                  isFollowing ? Icons.check_rounded : Icons.person_add_rounded,
                  color: Colors.white,
                  size: 18,
                ),
                label: Text(
                  isFollowing ? 'ติดตามแล้ว' : 'ติดตาม',
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Container(
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(14),
                border: Border.all(color: const Color(0xFFA5B4FC), width: 1.5), // Pastel Indigo border
                color: Colors.white.withValues(alpha: 0.8),
              ),
              child: OutlinedButton.icon(
                onPressed: () => _showSendMessageDialog(context),
                style: OutlinedButton.styleFrom(
                  side: BorderSide.none,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                icon: const Icon(
                  Icons.chat_bubble_outline_rounded,
                  color: Color(0xFF4F46E5), // Indigo icon color
                  size: 18,
                ),
                label: const Text(
                  'ส่งข้อความ',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF4F46E5), // Indigo text color
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showSendMessageDialog(BuildContext context) {
    final textController = TextEditingController();
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
        ),
        child: Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24),
              topRight: Radius.circular(24),
            ),
          ),
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'ส่งข้อความถึงเบลล์',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF0F172A),
                    ),
                  ),
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(Icons.close, size: 20),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              TextField(
                controller: textController,
                autofocus: true,
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: 'เขียนข้อความของคุณที่นี่...',
                  hintStyle: TextStyle(color: Colors.grey.shade400),
                  filled: true,
                  fillColor: Colors.grey.shade50,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: BorderSide(color: Colors.grey.shade200),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                    borderSide: const BorderSide(
                      color: Color(0xFF6366F1),
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final text = textController.text.trim();
                  Navigator.pop(context);
                  if (text.isNotEmpty) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('ส่งข้อความ: "$text" เรียบร้อยแล้ว!'),
                        backgroundColor: const Color(0xFF0D9488),
                      ),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF6366F1),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(14),
                  ),
                ),
                child: const Text(
                  'ส่งข้อความ',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildAboutSection() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(horizontal: 24),
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white.withValues(alpha: 0.95), // Frosted glass effect
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 12,
            spreadRadius: 1,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'เกี่ยวกับฉัน',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Color(0xFF1E1B4B), // Deep indigo
            ),
          ),
          const SizedBox(height: 16),
          _buildInfoRow(
            Icons.school_outlined,
            'การศึกษา',
            'มหาวิทยาลัยราชภัฏศรีสะเกษ (SSKRU)',
          ),
          const Divider(height: 24, thickness: 0.8),
          _buildInfoRow(
            Icons.interests_outlined,
            'สาขาวิชา',
            'วิทยาการคอมพิวเตอร์ (Computer Science), Mobile App, AI',
          ),
        ],
      ),
    );
  }

  Widget _buildInfoRow(
    IconData icon,
    String title,
    String value, {
    VoidCallback? onTap,
  }) {
    final Widget content = Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: const Color(0xFF6366F1)),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey.shade500,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(
                  fontSize: 15,
                  color: onTap != null
                      ? const Color(0xFF6366F1)
                      : Colors.grey.shade800,
                  fontWeight: FontWeight.w500,
                  decoration: onTap != null
                      ? TextDecoration.underline
                      : TextDecoration.none,
                ),
              ),
            ],
          ),
        ),
      ],
    );

    if (onTap != null) {
      return InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(8),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 2),
          child: content,
        ),
      );
    }
    return content;
  }
}
