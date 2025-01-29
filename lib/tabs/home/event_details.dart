import 'package:evently/app_theam.dart';
import 'package:evently/providers/events_provider.dart';
import 'package:evently/tabs/home/edit_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class EventDetails extends StatelessWidget {
 //static const String routeName="/Event Details";
  int selectedIndex;
  EventDetails({required this.selectedIndex});
  @override
  Widget build(BuildContext context) {
TextTheme textStyle=Theme.of(context).textTheme;
    EventsProvider eventsProvider=Provider.of<EventsProvider>(context);
    return Scaffold(
      appBar: AppBar(
        title:Text("Event Details"),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) =>EditEvent(selectedIndex: selectedIndex,) ,));

            },
            child: SvgPicture.asset("assets/icons/Edit_detial.svg",width: 24,height: 24,fit: BoxFit.scaleDown,),
            
          ),
          GestureDetector(
            onTap: ()async {
              bool? result = await showDialog<bool>(
                context: context,
                builder: (context) => AlertDialog(
                  title:  Text('Are you sure?'),
                  content:  Text('This action will permanently delete this data'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.pop(context, false),
                      child: const Text('Cancel'),
                    ),
                    TextButton(
                      onPressed: () => Navigator.pop(context, true),
                      child: const Text('Delete'),
                    ),
                  ],
                ),
              );

              if (result == null || result==false) {

                return;
              }
              eventsProvider.deleteEvent(selectedIndex).then((value) => Navigator.of(context).pop(),).catchError((){});


            },
            child: SvgPicture.asset("assets/icons/Delete.svg",width: 24,height: 24,fit: BoxFit.scaleDown,),

          )

        ],
        
        
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all( 16),
          child: Column(


            children: [ClipRRect(
                borderRadius: BorderRadius.circular(16)
                ,child: Image.asset("assets/images/${eventsProvider.event[selectedIndex].catgoryItem.imageOfCat}.png",fit: BoxFit.fill,width:double.infinity,height: MediaQuery.sizeOf(context).height*.23,)),
              SizedBox(
                height:16 ,

              ),
              Text("${eventsProvider.event[selectedIndex].title}",style: textStyle.titleLarge?.copyWith(color: AppThem.primary),),
              SizedBox(height: 16,),
              Container(
                padding: EdgeInsets.all(8),
                decoration: BoxDecoration(
                  border: Border.all(color: AppThem.primary,width: 2),
                  borderRadius: BorderRadius.circular(16)


                ),
                child: Row(
                  children: [
                    SvgPicture.asset("assets/icons/Calendar_detials.svg",height: 48,width: 48,fit: BoxFit.scaleDown,),
                    SizedBox(width: 8,),
                    Column(
                      children: [
                        Text("${DateFormat("dd MMMM yyyy").format( eventsProvider.event[selectedIndex].date)}",style: textStyle.bodyLarge?.copyWith(color: AppThem.primary),),
                        Text("${DateFormat().add_jm().format( eventsProvider.event[selectedIndex].date)}",style: textStyle.bodyLarge,),


                      ],

                    )


                  ],

                )
                


              ),
              SizedBox(height: 16,),
              Column(
crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Text("Description",style: textStyle.bodyLarge),
                  SizedBox(height: 8,),
                  Text("${eventsProvider.event[selectedIndex].description}",style: textStyle.bodyLarge,)
                  
                ],
                
              )



            ],


          ),
        ),
      ),



    );
  }
}
