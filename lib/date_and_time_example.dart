import 'package:flutter/material.dart';

class ChoosingDateAndTimeExample extends StatefulWidget {
  const ChoosingDateAndTimeExample({super.key});

  @override
  State<ChoosingDateAndTimeExample> createState() =>
      _ChoosingDateAndTimeExampleState();
}

//! Kullanıcının şuanki zamanını aldık
DateTime simdikiZaman = DateTime.now();

//* Kullanıcı bulunduğu zamandan iki ay öncesini seçebilsin
DateTime ikiAyOncesi = DateTime(2023, simdikiZaman.month - 2);

//* Kullanıcı bulunduğu zamandan iki ay sonrasını seçebilsin
DateTime ikiAySonrasi = DateTime(2023, simdikiZaman.month + 2);

//? İkinci Bölüm: Saat seçimi
//! Kullanıcın şuanki saatini ele alarak ilerliyorum
TimeOfDay suankiSaat = TimeOfDay.now();

class _ChoosingDateAndTimeExampleState
    extends State<ChoosingDateAndTimeExample> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // foreground
            ),
            child: const Text('Tarih Seç'),
            onPressed: () {
              showDatePicker(
                      context: context,
                      firstDate: ikiAyOncesi,
                      lastDate: ikiAySonrasi,
                      //! Kullanıcının şuanki zamanını tanımladık
                      initialDate: simdikiZaman)
                  .then((kullanicininSectigiTarih) {
                //! kullanıcının seçtiği tarihi string türünde yazdırdık. Farklı formatlar da mevcut.
                debugPrint(kullanicininSectigiTarih.toString());
              });
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Colors.white,
              backgroundColor: Colors.blue, // foreground
            ),
            child: const Text('Saat Seç'),
            onPressed: () {
              showTimePicker(context: context, initialTime: suankiSaat)
                  .then((kullanicininSectigiSaat) {
                debugPrint(kullanicininSectigiSaat?.format(context));
              });
            },
          )
        ],
      ),
    );
  }
}
