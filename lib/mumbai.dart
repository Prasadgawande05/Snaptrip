import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class MumbaiDetailsScreen extends StatelessWidget {
  const MumbaiDetailsScreen({super.key});

  Future<void> _openLink(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    final ok = await launchUrl(uri, mode: LaunchMode.externalApplication);
    if (!ok) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open link')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Mumbai – Tourist & Hotels')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text('Top Tourist Places',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _linkTile(context, 'Gateway of India', 'View on Google Maps',
              'https://maps.google.com/?q=Gateway+of+India+Mumbai'),
          _linkTile(context, 'Marine Drive', 'View on Google Maps',
              'https://maps.google.com/?q=Marine+Drive+Mumbai'),
          _linkTile(context, 'Elephanta Caves', 'View on Google Maps',
              'https://maps.google.com/?q=Elephanta+Caves'),
          _linkTile(context, 'Juhu Beach', 'View on Google Maps',
              'https://maps.google.com/?q=Juhu+Beach'),
          _linkTile(context, 'CSMT (UNESCO)', 'View on Google Maps',
              'https://maps.google.com/?q=Chhatrapati+Shivaji+Maharaj+Terminus'),
          const SizedBox(height: 16),
          const Text('Hotels (Official Websites)',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          const SizedBox(height: 8),
          _linkTile(context, 'The Taj Mahal Palace', 'Open website',
              'https://www.tajhotels.com/en-in/taj/taj-mahal-palace-mumbai/'),
          _linkTile(context, 'The Oberoi, Mumbai', 'Open website',
              'https://www.oberoihotels.com/hotels-in-mumbai-the-oberoi/'),
          _linkTile(context, 'Trident Nariman Point', 'Open website',
              'https://www.tridenthotels.com/hotels-in-mumbai-nariman-point'),
          _linkTile(context, 'ITC Maratha', 'Open website',
              'https://www.itchotels.com/in/en/itcmaratha-mumbai'),
        ],
      ),
    );
  }

  Widget _linkTile(
      BuildContext context, String title, String subtitle, String url) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(horizontal: 0),
      title: Text(title),
      subtitle: Text(subtitle),
      trailing: const Icon(Icons.open_in_new),
      onTap: () => _openLink(context, url),
    );
  }
}
