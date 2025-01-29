import 'package:evently/Home/home_screen.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/tabs/home/home_tap.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../app_theam.dart';
import '../../component/deafult_textformfield.dart';
import '../../component/default_elevatedButtom.dart';
import '../../models/catgory_item.dart';
import '../../models/event.dart';

class EditEvent extends StatefulWidget {
  int selectedIndex;

  EditEvent({required this.selectedIndex});

  @override
  State<EditEvent> createState() => _EditEventState();
}

class _EditEventState extends State<EditEvent> {
   CatgoryItem? currentCatgory;
   int? currentIndex;
   String? selectedImage;
   TextEditingController? titleController;
 TextEditingController? descController;
   GlobalKey<FormState>formKey= GlobalKey<FormState>();

 DateTime? selectedDate;
 DateFormat dateFormat=DateFormat("d/M/yyyy");
 TimeOfDay? selectedTimeOfDay;
  @override
  Widget build(BuildContext context) {
    EventsProvider eventsProvider=Provider.of<EventsProvider>(context);
    TextTheme textStyle=Theme.of(context).textTheme;
    if(selectedImage==null){
      selectedImage=eventsProvider.event[widget.selectedIndex].catgoryItem.imageOfCat;
    }
    if(selectedDate==null){
      selectedDate=eventsProvider.event[widget.selectedIndex].date;
    }
    if(selectedTimeOfDay==null){
      selectedTimeOfDay=TimeOfDay.fromDateTime(eventsProvider.event[widget.selectedIndex].date);
    }

    if (currentIndex==null){
      currentIndex=int.parse(eventsProvider.event[widget.selectedIndex].catgoryItem.id)-1;
    }
    if (titleController==null){
titleController=TextEditingController(
    text: "${eventsProvider.event[widget.selectedIndex].title}"
);
    }
    if (descController==null){
descController=TextEditingController(
    text: "${eventsProvider.event[widget.selectedIndex].description}"
);
    }
    if(currentCatgory==null){
      currentCatgory=CatgoryItem.catgorys[currentIndex!];
    }


    return Scaffold(
      appBar: AppBar(
        title: Text("Edit Event"),

      ),
      body: SafeArea(child: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(16)
                ,child: Image.asset("assets/images/${selectedImage}.png",fit: BoxFit.fill,width:double.infinity,height: MediaQuery.sizeOf(context).height*.23,)),
          ),
          DefaultTabController(
            initialIndex:currentIndex!,
              length: CatgoryItem.catgorys.length
              ,

              child: TabBar(

                  onTap: (value) {
                    if(value==currentIndex)return;
                    currentIndex=value;
                    currentCatgory=CatgoryItem.catgorys[value];
                    selectedImage=currentCatgory!.imageOfCat;
                    setState(() {

                    });
                  }
                  ,
                  tabAlignment: TabAlignment.start
                  ,
                  labelPadding: EdgeInsets.all(16),
                  isScrollable: true,
                  dividerColor: Colors.transparent,
                  indicatorColor: Colors.transparent
                  ,tabs: CatgoryItem.catgorys.map((catgoryTiem)=>TabItem(label: catgoryTiem.catName,icon: catgoryTiem.icon,selectedBack: AppThem.primary,selectedFor: AppThem.white,unSelectedFor: AppThem.primary,unSelectedborder: AppThem.primary,isSelected:currentIndex==CatgoryItem.catgorys.indexOf(catgoryTiem),)).toList())),
          Expanded(
            child:
            Padding(
              padding: EdgeInsets.all(16),
              child: Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Title",style: textStyle.bodyLarge,),
                      SizedBox(height: 8,),
                      DeafultTextformfield(hintText: "Event Title",controller:titleController ,perfixicon:"Edit",validator: (value){
                        if(value==null||value.isEmpty){
                          return "Title cant be empty";
                        }

                      },),
                      SizedBox(
                        height: 16,
                      ),
                      Text("Description",style: textStyle.bodyLarge,),
                      SizedBox(height: 8,),
                      DeafultTextformfield(numOfLines: 4,hintText: "Event Description",controller:descController,validator: (value){
                        if(value==null||value.isEmpty){
                          return "Description cant be empty";
                        }
                      },),
                      SizedBox(
                        height: 16,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/Calendar.svg",width: 24,height: 24,fit: BoxFit.scaleDown,),
                          SizedBox(width: 10,),
                          Text("Event Date",style: textStyle.bodyLarge),
                          Spacer(),
                          GestureDetector(
                            onTap: () async{
                              DateTime? date= await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)),initialEntryMode: DatePickerEntryMode.calendarOnly,initialDate: eventsProvider.event[widget.selectedIndex].date);
                              if(date!=null){
                                selectedDate=date;
                                setState(() {

                                });
                              }

                            },
                            child: Text(dateFormat.format(selectedDate!),style: textStyle.bodyLarge?.copyWith(color: AppThem.primary)),

                          )



                        ],

                      ),
                      SizedBox(height: 16,),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/Clock.svg",width: 24,height: 24,fit: BoxFit.scaleDown,),
                          SizedBox(width: 10,),
                          Text("Event Time",style: textStyle.bodyLarge),
                          Spacer(),
                          GestureDetector(
                            onTap: () async{
                              TimeOfDay? time =await showTimePicker(context: context, initialTime: TimeOfDay.now(),initialEntryMode: TimePickerEntryMode.dialOnly,);
                              if(time!=null){
                                selectedTimeOfDay=time;
                                setState(() {

                                });
                              }
                            },
                            child: Text(selectedTimeOfDay!.format(context),style: textStyle.bodyLarge?.copyWith(color: AppThem.primary)),

                          )



                        ],

                      ),
                      SizedBox(height: 16,),

                      DefaultElevatedbutton(lable: "Update Event",onpressed:upDateEvent)



                    ],

                  ),
                ),
              ),
            ),
          )


        ],

      )


      ),

    );
  }
  void upDateEvent() {
    if(formKey.currentState!.validate()&&selectedTimeOfDay!=null&&selectedDate!=null) {
    DateTime dateTime = DateTime(
        selectedDate!.year,
        selectedDate!.month,
        selectedDate!.day,
        selectedTimeOfDay!.hour,
        selectedTimeOfDay!.minute

    );

    Provider.of<EventsProvider>(context,listen: false).editEvent(
        selectedEvent: widget.selectedIndex,
        editedTitle: titleController!.text,
        editedDesc: descController!.text,
        editedDate: dateTime,
        editedCatId: currentCatgory!.id).then((value) => Navigator.of(context).pushReplacementNamed(HomeScreen.routeName),).catchError((){});
  }
  }
}
