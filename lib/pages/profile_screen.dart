
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ==================================================
// PROFILE SCREEN
// ==================================================
//
// Halaman profil pengguna dengan desain iOS.
// Menampilkan informasi akun, pengaturan, dan logout.
//

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({
    super.key,
    this.dataDiri,
  });

  // Data pengguna yang diterima dari halaman Login.
  final Map<String, dynamic>? dataDiri;

  @override
  Widget build(BuildContext context) {
    // Mengambil informasi pengguna.
    final String nama =
        dataDiri?['name'] ?? 'yutong 6127';

    final String username =
        dataDiri?['username'] ?? 'negoroangin';

    final String role =
        dataDiri?['role'] ?? 'Admin';

    return Scaffold(
      backgroundColor: const Color(0xFFF2F2F7),

      // ==================================================
      // BODY
      // ==================================================

      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            20,
            20,
            20,
            30,
          ),

          children: [

            // ==================================================
            // HEADER
            // ==================================================

            const Text(
              'Profil',
              style: TextStyle(
                fontSize: 34,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1C1C1E),
                letterSpacing: -0.8,
              ),
            ),

            const SizedBox(height: 24),

            // ==================================================
            // PROFILE CARD
            // ==================================================
            //
            // Menampilkan avatar, nama, username,
            // dan role pengguna.
            //

            Container(
              padding: const EdgeInsets.all(20),

              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(22),
              ),

              child: Row(
                children: [

                  // ------------------------------------------
                  // PROFILE AVATAR
                  // ------------------------------------------

                  Container(
                    width: 68,
                    height: 68,

                    decoration: const BoxDecoration(
                      color: Color(0xFFE5F0FF),
                      shape: BoxShape.circle,
                    ),

                    child: const Icon(
                      CupertinoIcons.person_fill,
                      size: 34,
                      color: Color(0xFF007AFF),
                    ),
                  ),

                  const SizedBox(width: 16),

                  // ------------------------------------------
                  // USER INFORMATION
                  // ------------------------------------------

                  Expanded(
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,

                      children: [

                        Text(
                          nama,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1C1C1E),
                          ),
                        ),

                        const SizedBox(height: 5),

                        Text(
                          '@$username',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Color(0xFF8E8E93),
                          ),
                        ),

                        const SizedBox(height: 7),

                        // Role badge.
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 4,
                          ),

                          decoration: BoxDecoration(
                            color: const Color(0xFFE5F0FF),
                            borderRadius:
                                BorderRadius.circular(20),
                          ),

                          child: Text(
                            role.toUpperCase(),
                            style: const TextStyle(
                              fontSize: 10,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF007AFF),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  // Tombol detail profil.
                  const Icon(
                    CupertinoIcons.chevron_right,
                    size: 18,
                    color: Color(0xFFC7C7CC),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 32),

            // ==================================================
            // ACCOUNT SECTION
            // ==================================================

            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),

              child: Text(
                'ACCOUNT',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8E93),
                  letterSpacing: 0.5,
                ),
              ),
            ),

            // Grouped account settings.
            _settingsGroup(
              children: [

                _settingsTile(
                  icon: CupertinoIcons.person,
                  title: 'Personal Information',
                  onTap: () {},
                ),

                _settingsDivider(),

                _settingsTile(
                  icon: CupertinoIcons.lock,
                  title: 'Password & Security',
                  onTap: () {},
                ),

                _settingsDivider(),

                _settingsTile(
                  icon: CupertinoIcons.creditcard,
                  title: 'Payment Methods',
                  onTap: () {},
                ),

              ],
            ),

            const SizedBox(height: 28),

            // ==================================================
            // PREFERENCES SECTION
            // ==================================================

            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),

              child: Text(
                'PREFERENCES',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8E93),
                  letterSpacing: 0.5,
                ),
              ),
            ),

            _settingsGroup(
              children: [

                _settingsTile(
                  icon: CupertinoIcons.bell,
                  title: 'Notifications',
                  onTap: () {},
                ),

                _settingsDivider(),

                _settingsTile(
                  icon: CupertinoIcons.globe,
                  title: 'Language',
                  trailingText: 'Indonesia',
                  onTap: () {},
                ),

                _settingsDivider(),

                _settingsTile(
                  icon: CupertinoIcons.moon,
                  title: 'Appearance',
                  trailingText: 'Light',
                  onTap: () {},
                ),

              ],
            ),

            const SizedBox(height: 28),

            // ==================================================
            // SUPPORT SECTION
            // ==================================================

            const Padding(
              padding: EdgeInsets.only(left: 5, bottom: 10),

              child: Text(
                'SUPPORT',
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF8E8E93),
                  letterSpacing: 0.5,
                ),
              ),
            ),

            _settingsGroup(
              children: [

                _settingsTile(
                  icon: CupertinoIcons.question_circle,
                  title: 'Help Center',
                  onTap: () {},
                ),

                _settingsDivider(),

                _settingsTile(
                  icon: CupertinoIcons.info_circle,
                  title: 'About Application',
                  onTap: () {},
                ),

              ],
            ),

            const SizedBox(height: 30),

            // ==================================================
            // LOGOUT BUTTON
            // ==================================================

            SizedBox(
              height: 55,

              child: CupertinoButton(
                color: Colors.white,

                borderRadius: BorderRadius.circular(16),

                onPressed: () {

                  // Menampilkan konfirmasi logout.
                  showCupertinoDialog(
                    context: context,

                    builder: (dialogContext) {
                      return CupertinoAlertDialog(

                        title: const Text(
                          'Log Out',
                        ),

                        content: const Text(
                          'Apakah kamu yakin ingin keluar '
                          'dari akun ini?',
                        ),

                        actions: [

                          // Batal logout.
                          CupertinoDialogAction(
                            onPressed: () {
                              Navigator.pop(dialogContext);
                            },

                            child: const Text(
                              'Cancel',
                            ),
                          ),

                          // Konfirmasi logout.
                          CupertinoDialogAction(
                            isDestructiveAction: true,

                            onPressed: () {

                              // Kembali ke halaman login.
                              Navigator.of(context)
                                  .pushNamedAndRemoveUntil(
                                '/login',
                                (route) => false,
                              );
                            },

                            child: const Text(
                              'Log Out',
                            ),
                          ),

                        ],
                      );
                    },
                  );
                },

                child: const Text(
                  'Log Out',

                  style: TextStyle(
                    color: Color(0xFFFF3B30),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 24),

            // ==================================================
            // APP VERSION
            // ==================================================

            const Center(
              child: Text(
                'MY SAMPLE APP',
                style: TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w600,
                  letterSpacing: 1.5,
                  color: Color(0xFFAEAEB2),
                ),
              ),
            ),

            const SizedBox(height: 5),

            const Center(
              child: Text(
                'Version 1.0.0',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFFAEAEB2),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // ==================================================
  // SETTINGS GROUP
  // ==================================================
  //
  // Container untuk mengelompokkan beberapa menu.
  // Setiap kelompok memiliki background putih.
  //

  static Widget _settingsGroup({
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),

      child: Column(
        children: children,
      ),
    );
  }

  // ==================================================
  // SETTINGS TILE
  // ==================================================
  //
  // Widget reusable untuk setiap menu pengaturan.
  //
  // Parameter:
  // icon         = ikon menu.
  // title        = nama menu.
  // trailingText = teks tambahan di sebelah kanan.
  // onTap        = aksi ketika menu ditekan.
  //

  static Widget _settingsTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    String? trailingText,
  }) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: onTap,

      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),

        child: Row(
          children: [

            // Ikon menu.
            Icon(
              icon,
              size: 21,
              color: const Color(0xFF007AFF),
            ),

            const SizedBox(width: 14),

            // Nama menu.
            Expanded(
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 15,
                  color: Color(0xFF1C1C1E),
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),

            // Informasi tambahan.
            if (trailingText != null)
              Text(
                trailingText,
                style: const TextStyle(
                  fontSize: 14,
                  color: Color(0xFF8E8E93),
                ),
              ),

            const SizedBox(width: 8),

            // Chevron.
            const Icon(
              CupertinoIcons.chevron_right,
              size: 15,
              color: Color(0xFFC7C7CC),
            ),
          ],
        ),
      ),
    );
  }

  // ==================================================
  // SETTINGS DIVIDER
  // ==================================================
  //
  // Garis pemisah antar menu.
  //

  static Widget _settingsDivider() {
    return const Padding(
      padding: EdgeInsets.only(left: 50),

      child: Divider(
        height: 1,
        thickness: 0.5,
        color: Color(0xFFE5E5EA),
      ),
    );
  }
}
