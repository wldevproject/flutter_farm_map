import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/infus_controller.dart';

class InfusView extends GetView<InfusController> {
  const InfusView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('InfusView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'InfusView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}


class SidebarItem1 extends StatefulWidget {
  const SidebarItem1(
      {super.key,
      required this.onTap,
      required this.onTapProject,
      required this.data,
      this.selectedProjectId,
      this.isSelected = false});

  final GestureTapCallback onTap;
  final Function(ProjectCustomerReferenceDTO) onTapProject;
  final CustomerReferenceDTO data;
  final String? selectedProjectId;
  final bool isSelected;

  @override
  State<SidebarItem1> createState() => _SidebarItem1State();
}

class _SidebarItem1State extends State<SidebarItem1> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      child: Column(
        children: [
          Row(
            children: [
              InkWell(
                onTap: () {
                  setState(() {
                    _isExpanded = !_isExpanded;
                  });
                },
                child: Icon(
                  _isExpanded ? Icons.arrow_drop_down : Icons.arrow_right,
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: widget.data.show == true ? widget.onTap : null,
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(8, 12, 12, 12),
                    // decoration: BoxDecoration(
                    //   color: widget.isSelected
                    //       ? AppColors.neutral1
                    //       : Colors.transparent,
                    //   borderRadius: BoxDecorationHelper.radiusDefault,
                    // ),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${widget.data.customerId ?? ''} - ${widget.data.name ?? ''}',
                                // style: AppTextStyle.montserratBold.copyWith(
                                //     color: widget.data.show == true
                                //         ? AppColors.neutral5
                                //         : AppColors.disabled),
                              ),
                              IntrinsicHeight(
                                child: Row(
                                  children: [
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Capacity: ',
                                          // style: AppTextStyle.montserratRegular
                                          //     .copyWith(
                                          //   color: widget.data.show == true
                                          //       ? AppColors.neutral5
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        ),
                                        TextSpan(
                                          text:
                                              '${(widget.data.capacity?.value ?? 0)}',
                                          // style: AppTextStyle.montserratSemiBold
                                          //     .copyWith(
                                          //   color: widget.data.show == true
                                          //       ? AppColors.neutral5
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        ),
                                        TextSpan(
                                          text:
                                              ' ${widget.data.capacity?.unit ?? ''}',
                                          // style: AppTextStyle.montserratRegular
                                          //     .copyWith(
                                          //   color: widget.data.show == true
                                          //       ? AppColors.neutral5
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        ),
                                      ]),
                                    ),
                                    const VerticalDivider(),
                                    RichText(
                                      text: TextSpan(children: [
                                        TextSpan(
                                          text: 'Harvest Ratio: ',
                                          // style: AppTextStyle.montserratRegular
                                          //     .copyWith(
                                          //   color: widget.data.show == true
                                          //       ? AppColors.neutral5
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        ),
                                        TextSpan(
                                          text: (widget.data.ratio ?? 0).toGMK,
                                          // style: AppTextStyle.montserratSemiBold
                                          //     .copyWith(
                                          //   color: widget.data.show == true
                                          //       ? AppColors.neutral5
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        ),
                                        TextSpan(
                                          text: ' 30dma',
                                          // style: AppTextStyle.montserratRegular
                                          //     .copyWith(
                                          //   color: widget.data.show == true
                                          //       ? AppColors.neutral5
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        ),
                                      ]),
                                    ),
                                  ].separate(10),
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (widget.data.show == false)
                          Image.asset(
                            icNoAccess,
                            width: 20,
                            height: 20,
                          )
                      ].separate(10),
                    ),
                  ),
                ),
              ),
            ].separate(10),
          ),
          AnimatedCrossFade(
            firstChild: Container(),
            secondChild: Column(
              children: widget.data.projects?.map(
                    (e) {
                      return GestureDetector(
                        onTap: () {
                          if (e.show == true) {
                            widget.onTapProject(e);
                          }
                        },
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 12),
                          // decoration: BoxDecoration(
                          //     color: widget.selectedProjectId == e.id
                          //         ? AppColors.neutral1
                          //         : Colors.transparent,
                          //     borderRadius: BoxDecorationHelper.radiusDefault),
                          child: Row(
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          width: 8,
                                          height: 8,
                                          decoration: BoxDecoration(
                                            // color: e.show == true
                                            //     ? StatusColorHelper
                                            //         .getStatusColor(
                                            //             e.status ?? '')
                                            //     : AppColors.disabled,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                        Text(
                                          e.status ?? '',
                                          // style: AppTextStyle.montserratMedium
                                          //     .copyWith(
                                          //   color: e.show == true
                                          //       ? StatusColorHelper
                                          //           .getStatusColor(
                                          //               e.status ?? '')
                                          //       : AppColors.disabled,
                                          //   fontSize: AppFontSized.extraSmall,
                                          // ),
                                        )
                                      ].separate(5),
                                    ),
                                    // AppGaps.v4,
                                    Text(
                                      '${e.projectId} - ${e.name}',
                                      // style: AppTextStyle.montserratBold
                                      //     .copyWith(
                                      //         color: e.show == true
                                      //             ? AppColors.neutral5
                                      //             : AppColors.disabled),
                                    ),
                                    // AppGaps.v4,
                                    IntrinsicHeight(
                                      child: Row(
                                        children: [
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Capacity: ',
                                                // style: AppTextStyle
                                                //     .montserratRegular
                                                //     .copyWith(
                                                //   color: e.show == true
                                                //       ? AppColors.neutral5
                                                //       : AppColors.disabled,
                                                //   fontSize:
                                                //       AppFontSized.extraSmall,
                                                // ),
                                              ),
                                              TextSpan(
                                                text:
                                                    '${(e.capacity?.value ?? 0)}',
                                                // style: AppTextStyle
                                                //     .montserratSemiBold
                                                //     .copyWith(
                                                //   color: e.show == true
                                                //       ? AppColors.neutral5
                                                //       : AppColors.disabled,
                                                //   fontSize:
                                                //       AppFontSized.extraSmall,
                                                // ),
                                              ),
                                              TextSpan(
                                                text:
                                                    ' ${e.capacity?.unit ?? ''}',
                                                // style: AppTextStyle
                                                //     .montserratRegular
                                                //     .copyWith(
                                                //   color: e.show == true
                                                //       ? AppColors.neutral5
                                                //       : AppColors.disabled,
                                                //   fontSize:
                                                //       AppFontSized.extraSmall,
                                                // ),
                                              ),
                                            ]),
                                          ),
                                          const VerticalDivider(),
                                          RichText(
                                            text: TextSpan(children: [
                                              TextSpan(
                                                text: 'Harvest Ratio: ',
                                                // style: AppTextStyle
                                                //     .montserratRegular
                                                //     .copyWith(
                                                //   color: e.show == true
                                                //       ? AppColors.neutral5
                                                //       : AppColors.disabled,
                                                //   fontSize:
                                                //       AppFontSized.extraSmall,
                                                // ),
                                              ),
                                              TextSpan(
                                                text: (e.ratio ?? 0).toGMK,
                                                // style: AppTextStyle
                                                //     .montserratSemiBold
                                                //     .copyWith(
                                                //   color: e.show == true
                                                //       ? AppColors.neutral5
                                                //       : AppColors.disabled,
                                                //   fontSize:
                                                //       AppFontSized.extraSmall,
                                                // ),
                                              ),
                                              TextSpan(
                                                text: ' 30dma',
                                                // style: AppTextStyle
                                                //     .montserratRegular
                                                //     .copyWith(
                                                //   color: e.show == true
                                                //       ? AppColors.neutral5
                                                //       : AppColors.disabled,
                                                //   fontSize:
                                                //       AppFontSized.extraSmall,
                                                // ),
                                              ),
                                            ]),
                                          ),
                                        ].separate(10),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              if (e.show == false)
                                Image.asset(
                                  icNoAccess,
                                  width: 20,
                                  height: 20,
                                )
                            ].separate(10),
                          ),
                        ),
                      );
                    },
                  ).toList() ??
                  [],
            ),
            crossFadeState: _isExpanded
                ? CrossFadeState.showSecond
                : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          ),
        ],
      ),
    );
  }
}
