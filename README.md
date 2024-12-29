# NexusEmporio

*Proje, modern web teknolojileri kullanılarak tasarlanmış, kullanıcı dostu bir alışveriş deneyimi sunmayı amaçlar. Projede aşağıdaki temel özellikler ve işlevsellikler yer alacaktır.*

#### Projenin Amacı
  · E-ticaret sitelerinin yapısının ve işlevselliğinin öğrenilmesi. <br>
  · Tam ölçekli bir web uygulaması geliştirme sürecinin simüle edilmesi.<br>
  · Frontend ve Backend entegrasyonu üzerine deneyim kazanılması.

#### Projenin Hedef Kitlesi
  · Günlük giyim ürünlerini çevrimiçi satın almak isteyen bireyler.<br>
  · Mevsimsel ve moda trendlerine uygun kıyafet arayışında olan kullanıcılar.<br>
  · Her yaş ve cinsiyete hitap eden genel giyim müşterileri.

#### Öne Çıkan Özellikler
   · Kapsamlı Kategori Yönetimi: Tişört, pantolon, ayakkabı, gömlek, mont ve kaban gibi temel giyim kategorilerinin düzenlenmesi ve yönetimi. <br>
   · Sezonluk Ürün Vurgusu: Mevsimlere uygun koleksiyonlar ve indirim kampanyaları. <br>
   · Ürün Filtreleme: fiyat ve kategoriye göre gelişmiş filtreleme seçenekleri. <br>
   · Kullanıcı Dostu Tasarım: Kolay alışveriş deneyimi sunan modern ve minimal kullanıcı arayüzü. <br>
   · Responsive Tasarım: Mobil ve masaüstü cihazlarda kusursuz çalışan bir platform.

  #### Kullanım Alanları
   · Günlük kıyafet alışverişi. <br>
   · Kişisel gardırop ihtiyaçlarının hızlı ve kolay karşılanması. <br>
   · Mevsimlik kıyafetlerin çevrimiçi satışa sunulması.


  #### Projede Kullanılan Yazılım Dilleri
   · PHP <br>
   · Json <br>
   · HTML <br>
   · CSS <br>
   · AJAX

  #### NodeJs'in projeye entegrasyonu ve kullanım alanı
   · Proje dizininde yer alan 'node' adlı klasörde yer almaktadır <br>
   · node.js'i klasöre yüklenmesi için gerekli terminal kodları yazılmıştır. <br>
   · Bu kodlar sınıflardan ve kütüphanelerden oluşmaktadır. <br>
   · Kod MongoDb Atlas'a bağlanarak CRUD işlemleri yapılması sağlanır (app.get, app.post, app.put, app.delete, app.use, app.listen). <br>
   · Gerekli kütüphaneler import edip mongoDB bağlantısı ile istenilen listeleme silme ve güncelleme işlemleri için oluşturulan endpointler server.js dosyasında oluşturulmaktadır. <br>
   . Oluşturulan endpointlerin UI ile görselleştirilmesi için köprü oluşturulur. <br>
   · Codeigniter projemizin içeirinde yer alan admin-panel klasörünün altındaki view klasörünün içerisinde bulunan contact_update_view.php dosyamızda  end pointlerimiz ile etkileşimli bağlantı kuran bir form oluşturduk. <br>
   . Form head içerisine gömülü  script ile listeleme ,güncelleme ve silme fonksiyonları oluşturduk ; bu fonksiyonlar ile forma girilen verileri 3000 portuna fetch ederek silme ve güncelleme işlemleri sağladık. <br>
   · Kullandığımız bir ikinci yöntem ise Controller (Contact.php) , view (contact_update_view.php) , modal(Models) üçlemesi ; bu üçleme ile birlikte assets altında buluanan contact.js içerisinde ajax kullanarak mongodb İletişim bilgilerini 
     Panel iletişim bölümünde contact_view.php`de listeledik. <br>
   · Sitemizin UI kısmında bulunan iletişimde aynı şeklide ajax etkileşimi ile ve gerekli controller , model , view üçlemesiyle Forma girilen verilerin mongoDB üzerinde kayıt edilmesini gerçekleştirir. <br>
   · Sonuç olarak hem ajax hemde nodejs (JSON) kullanarak etkileşimli bir mongoDB contact form işlemi gerçekleştirdik.
  
  #### Ekip Üyelerinin Sorumlulukları = Proje genel yapılışı ortak bir biçimde yürütülmüştür.

  #### Ekip Üyeleri
   · *Ali KAPLAN - 2213210044* <br>
   · *Enes Malik TALMAÇ - 2313210024*

    
