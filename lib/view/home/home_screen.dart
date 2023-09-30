import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../resources/resources.dart';
import '../../services/firebase_services.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    super.key,
  });

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Blogs"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.0.w),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Expanded(
                child: ListView.builder(
                  // reverse: true,
                  physics: const BouncingScrollPhysics(),
                  padding: EdgeInsets.symmetric(vertical: 15.w),
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {},
                      child: Column(
                        // crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 5,
                            child: Padding(
                              padding: EdgeInsets.symmetric(horizontal: 10.0.w),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 15.r),
                                    child: Text(
                                      "sasdasdasd",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: ColorManager.greyColor,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    // margin: EdgeInsets.symmetric(vertical: 10.r),
                                    constraints: BoxConstraints(minHeight: 150.h),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(15),
                                      image: const DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          "https://c4.wallpaperflare.com/wallpaper/611/838/413/spiderman-hd-4k-superheroes-wallpaper-preview.jpg",
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.symmetric(vertical: 7.w),
                                    child: Text(
                                      "sdasdasdasdasd",
                                      style: TextStyle(fontSize: 18.sp, fontWeight: FontWeight.w800),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 8.0),
                                    child: Container(
                                      constraints: BoxConstraints(
                                        minHeight: 30.h,
                                        maxHeight: 75.h,
                                      ),
                                      child: Text(
                                        "jimmy",
                                        softWrap: true,
                                        overflow: TextOverflow.fade,
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Row(
                                          children: [
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  padding: EdgeInsets.zero,
                                                  icon: Icon(
                                                    Icons.favorite_border,
                                                    size: 28.h,
                                                  ),
                                                ),
                                                Text(
                                                  "45",
                                                  style: TextStyle(fontSize: 17.sp),
                                                )
                                              ],
                                            ),
                                            SizedBox(width: 15.w),
                                            Row(
                                              children: [
                                                IconButton(
                                                  onPressed: () {},
                                                  padding: EdgeInsets.zero,
                                                  icon: Icon(
                                                    Icons.insert_comment_outlined,
                                                    size: 28.h,
                                                  ),
                                                ),
                                                Text(
                                                  "45",
                                                  style: TextStyle(fontSize: 17.sp),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                        Text(
                                          "12-45-54",
                                          style: TextStyle(fontSize: 14.sp, color: ColorManager.greyColor),
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
