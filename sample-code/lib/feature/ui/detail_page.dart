import 'package:assignment/core/route/route.dart';
import 'package:assignment/core/ui/cached_network_image.dart';
import 'package:assignment/core/utility/call_wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

class DetailPageRoutingInfo extends RoutingInfo {
  final String imageUrl;
  const DetailPageRoutingInfo({
    required this.imageUrl,
  });
}

class DetailPage extends StatefulWidget {
  final DetailPageRoutingInfo info;
  const DetailPage(
    this.info, {
    super.key,
  });

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
  }

  @override
  void dispose() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Center(
              child: CustomCachedNetworkImage(
                widget.info.imageUrl,
                width: double.infinity,
              ),
            ),
            Positioned(
              top: 10,
              left: 10,
              child: IconButton(
                onPressed: () => Throttler.processSync(hashCode, context.pop),
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 36,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
