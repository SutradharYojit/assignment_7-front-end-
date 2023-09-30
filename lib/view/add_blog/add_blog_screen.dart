import 'dart:developer';
import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import '../../resources/resources.dart';
import '../../services/services.dart';
import '../../widget/widget.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  File? imageFile;
  final ImagePicker picker = ImagePicker();
  final DateTime timeStamp = DateTime.now();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _titleController = TextEditingController();
  final bar = WarningBar();

  String getDate(int time) {
    final DateTime date1 = DateTime.fromMillisecondsSinceEpoch(time);
    log(date1.toString());
    return DateFormat.jm().format(date1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(StringManager.addBlogScreen)),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.all(15.0.w),
            child: Column(
              children: [
                Center(
                  child: DottedBorder(
                    borderType: BorderType.RRect,
                    radius: Radius.circular(12.r),
                    padding: EdgeInsets.all(6.r),
                    dashPattern: const [7, 3],
                    strokeWidth: 1,
                    child: ClipRRect(
                      borderRadius: BorderRadius.all(
                        Radius.circular(12.r),
                      ),
                      child: imageFile != null
                          ? SizedBox(
                              height: 170.h,
                              width: double.infinity,
                              child: Image.file(
                                imageFile!,
                                fit: BoxFit.cover,
                              ),
                            )
                          : Container(
                              height: 170.h,
                              width: double.infinity,
                              color: ColorManager.gradientLightTealColor,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  IconButton(
                                    splashColor: Colors.teal,
                                    onPressed: () async {
                                      final image = await picker.pickImage(
                                        source: ImageSource.gallery,
                                      );
                                      setState(() {
                                        imageFile = File(image!.path);
                                      });
                                    },
                                    icon: Icon(
                                      Icons.add_circle_outline,
                                      size: 50.h,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.r),
                  child: PrimaryTextFilled(
                    controller: _titleController,
                    hintText: StringManager.titleHintTxt,
                    labelText: StringManager.titleLabelTxt,
                    prefixIcon: const Icon(
                      Icons.title,
                      color: ColorManager.tealColor,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15.r),
                  child: PrimaryTextFilled(
                    controller: _descriptionController,
                    hintText: StringManager.descriptionHintTxt,
                    labelText: StringManager.descriptionLabelTxt,
                    prefixIcon: const Icon(
                      Icons.title,
                      color: ColorManager.tealColor,
                    ),
                  ),
                ),
                PrimaryButton(
                    onTap: () async {
                      log(UserPreferences.uid.toString());
                      final addBlog = bar.snack(StringManager.blogAdd, ColorManager.greenColor);

                      showDialog(
                          context: context,
                          builder: (context) {
                            return const Center(child: Loading());
                          });
                      await ApiServices().postApi(
                        api: "http://10.1.81.185:4253/blog/addblog",
                        data: {
                          "title": _titleController.text.trim(),
                          "description": _descriptionController.text.trim(),
                          "timeStamp": timeStamp.millisecondsSinceEpoch.toString(),
                         //  "authorId": UserPreferences.uid,
                         //  "authorEmail": UserPreferences.email,
                         //  "imageUrl":
                         //      "https://c4.wallpaperflare.com/wallpaper/611/838/413/spiderman-hd-4k-superheroes-wallpaper-preview.jpg"
                         },
                      );
                    },
                    title: StringManager.addBlogScreen)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
