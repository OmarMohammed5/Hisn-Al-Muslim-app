import 'package:flutter/material.dart';
import 'package:hisn_almuslim/shared/custom_text.dart';

class ButtonToAddZikr extends StatelessWidget {
  const ButtonToAddZikr({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final TextEditingController zikrController = TextEditingController();

        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              title: CustomText(
                "اضافة ذكر",
                color: Colors.teal.shade700,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
              content: TextField(
                controller: zikrController,
                maxLines: 5,
                cursorHeight: 20,
                cursorColor: Colors.teal.shade700,
                decoration: InputDecoration(
                  hintText: "اضف الذكر هنا",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: Colors.teal.shade700,
                      width: 1.5,
                    ),
                  ),
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop(); // إلغاء
                  },
                  child: CustomText(
                    "إلغاء",
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    String newZikr = zikrController.text.trim();
                    if (newZikr.isNotEmpty) {
                      Navigator.of(context).pop();
                      // ZekrCounterCard(title: newZikr, index: 0, onTap: () {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          behavior: SnackBarBehavior.floating,
                          content: CustomText(
                            "تمت إضافة الذكر",
                            color: Colors.white,
                            fontSize: 16,
                          ),
                          backgroundColor: Colors.green.shade500,
                        ),
                      );
                    }
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.teal.shade700,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: CustomText(
                    "اضافة",
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            );
          },
        );
      },
      child: Container(
        width: 150,
        padding: const EdgeInsets.all(10),
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.teal.shade700,
          borderRadius: BorderRadius.circular(12),
          boxShadow: const [
            BoxShadow(
              color: Colors.black45,
              blurRadius: 6,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              Icon(Icons.add, color: Colors.white),
              SizedBox(width: 6),
              CustomText(
                "اضافة ذكر",
                color: Colors.white,
                fontWeight: FontWeight.w600,
                fontSize: 17,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
