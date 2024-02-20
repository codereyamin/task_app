part of '../views/edit_and_add_view.dart';

class AppInputTextField extends StatelessWidget {
  const AppInputTextField({
    super.key,
    required this.title,
    required this.textEditingController,
    this.maxLines,
    this.mainLines,
    this.maxLength,
    this.textInputAction = TextInputAction.done,
    this.readOnly = false,
    this.onTap,
  });
  final bool readOnly;
  final String title;
  final VoidCallback? onTap;
  final TextEditingController textEditingController;
  final int? maxLines;
  final int? mainLines;
  final int? maxLength;
  final TextInputAction textInputAction;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title),
          const SizedBox(
            height: 5,
          ),
          TextFormField(
            validator: (value) {
              if (value == "" || value == null) {
                return "Field is required";
              }
              return null;
            },
            onTap: onTap,
            controller: textEditingController,
            readOnly: readOnly,
            maxLines: maxLines,
            maxLength: maxLength,
            textInputAction: textInputAction,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColor.whiteColor,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: AppColor.whiteColor,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
