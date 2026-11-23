# myportofolio_mobile

tugas 7: tidak ada jawaban

tugas 8:
1. Navigation.push menambah halaman destinasi keatas navigation stack, sedangkan Navigator.pushReplacement mengganti navigasi yang paling atas dengan halaman destinasi, sehingga navigation stack tetap memiliki total isi yang sama. Navigator.pop mengambil halaman teratas dan menghapusnya dari navigation stack.
2. susunan scaffold, appbar, drawer menjaga konsistensi karena struktur utama widget selalu menggunakan format yang sama untuk semua halaman dan karena untuk setiap lapisan widget, attribut dan konfigurasi yang dimiliki oleh setiap halaman sama.
3. widget pengatur jarak dan widget penggulir digunakan untuk mengatur supaya jika terdapat konten yang melebihi besar screen menjadi scrollable konten supaya pengguna tetap dapat melihat kontennya secara utuh dalam format yang lain.
4. peran GlobalKey<FormState> digunakan untuk menyimpan key untuk mengakses suatu state dari sebuah widget, lalu validator() dan validate() adalah sebuah bagian dari state untuk FormState yang akan mengvalidasi isi field, atau state field. Contoh jika validator di-define untuk menolak field yang empty adalah sebuah empty field, untuk string contohnya adalah "".
