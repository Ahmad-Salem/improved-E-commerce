import 'package:flutter/material.dart';
import 'package:salem/constants.dart';
import 'package:salem/helper/enum.dart';
import 'package:salem/view/widgets/custom_text.dart';

class DeliveryTime extends StatefulWidget {
  const DeliveryTime({Key? key,}) : super(key: key);

  @override
  State<DeliveryTime> createState() => _DeliveryTime();
}
class _DeliveryTime  extends State<DeliveryTime> {

  Delivery delivery = Delivery.StandardDelivery;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        height: MediaQuery.of(context).size.height*0.68,
        // decoration: BoxDecoration(
        //     border: Border.all(color: Colors.black)
        // ),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            RadioListTile<Delivery>(
              value: Delivery.StandardDelivery,
              groupValue: delivery,
              onChanged: (value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(text: 'Standard Delivery', fontSize: 18,),
              subtitle: CustomText(
                text: '\n Order will be delivered between 3 - 5 business days',
                fontSize: 13,),
              activeColor: primaryColor,
            ),
            const SizedBox(height: 30,),
            RadioListTile<Delivery>(
              value: Delivery.NextDayDelivery,
              groupValue: delivery,
              onChanged: (value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(text: 'Next Day Delivery', fontSize: 18,),
              subtitle: CustomText(
                text: '\n Place your order before 6pm and your items will be delivered the next day',
                fontSize: 13,),
              activeColor: primaryColor,
            ),
            const SizedBox(height: 30,),
            RadioListTile<Delivery>(
              value: Delivery.NominatedDelivery,
              groupValue: delivery,
              onChanged: (value) {
                setState(() {
                  delivery = value!;
                });
              },
              title: CustomText(text: 'Nominated Delivery', fontSize: 18,),
              subtitle: CustomText(
                text: '\n Pick a particular date from the calendar and order will be delivered on selected date',
                fontSize: 13,),
              activeColor: primaryColor,
            ),
            const SizedBox(height: 30,),
          ],
        ),
      ),
    );
  }

}
