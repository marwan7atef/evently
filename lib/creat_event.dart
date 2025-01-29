import 'package:evently/app_theam.dart';
import 'package:evently/component/default_elevatedButtom.dart';
import 'package:evently/models/event.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/tabs/home/tab_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'component/deafult_textformfield.dart';
import 'firebase_service.dart';
import 'models/catgory_item.dart';

class CreatEvent extends StatefulWidget {
  static const String routeName="/creat";


  @override
  State<CreatEvent> createState() => _CreatEventState();
}

class _CreatEventState extends State<CreatEvent> {

int currentIndex=0;
TextEditingController titleController=TextEditingController();
TextEditingController descriptionController=TextEditingController();
CatgoryItem currentCatgory=CatgoryItem.catgorys.first;
DateTime? selectedDate;
DateFormat dateFormat=DateFormat("d/M/yyyy");
TimeOfDay? selectedTimeOfDay;
GlobalKey<FormState> formKey=GlobalKey<FormState>();
@override
  Widget build(BuildContext context) {
    TextTheme textStyle=Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        title: Text("Create Event"),

      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(16),
              child: ClipRRect(
              borderRadius: BorderRadius.circular(16)
              ,child: Image.asset("assets/images/${currentCatgory.imageOfCat}.png",fit: BoxFit.fill,width:double.infinity,height: MediaQuery.sizeOf(context).height*.23,)),
            ),

            DefaultTabController(
                length: CatgoryItem.catgorys.length
                ,

                child: TabBar(
                    onTap: (value) {
                      if(value==currentIndex)return;
                      currentIndex=value;
                      currentCatgory=CatgoryItem.catgorys[currentIndex];
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
            DeafultTextformfield(numOfLines: 4,hintText: "Event Description",controller:descriptionController,validator: (value){
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
                   DateTime? date= await showDatePicker(context: context, firstDate: DateTime.now(), lastDate: DateTime.now().add(Duration(days: 365)),initialEntryMode: DatePickerEntryMode.calendarOnly,initialDate: selectedDate);
                   if(date!=null){
                     selectedDate=date;
                     setState(() {
        
                     });
                   }
        
                  },
                  child: Text(selectedDate==null?"Event Date":dateFormat.format(selectedDate!),style: textStyle.bodyLarge?.copyWith(color: AppThem.primary)),
        
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
                  child: Text(selectedTimeOfDay==null?"Choose Time":selectedTimeOfDay!.format(context),style: textStyle.bodyLarge?.copyWith(color: AppThem.primary)),
        
                )
        
        
        
              ],
        
            ),
            SizedBox(height: 16,),
        
        DefaultElevatedbutton(lable: "Add Event",onpressed:creatEvent)
        
        
        
          ],
        
        ),
      ),
    ),
  ),
)


          ],


        ),
      ),
    );

  }
void creatEvent(){

  if(formKey.currentState!.validate()&&selectedTimeOfDay!=null&&selectedDate!=null){
    DateTime dateTime=DateTime(
      selectedDate!.year,
      selectedDate!.month,
      selectedDate!.day,
      selectedTimeOfDay!.hour,
      selectedTimeOfDay!.minute

    );
Event event=Event( title: titleController.text, description: descriptionController.text, catgoryItem: currentCatgory, date: dateTime);
    FirebaseService.addEventToFirebase(event).then((value) {
      Provider.of<EventsProvider>(context,listen: false).getEvent();
      Navigator.of(context).pop();
    }).catchError((){});

  }

}
}
