// Gerekli modüller
const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');

// Express uygulamasını oluşturma
const app = express();
app.use(bodyParser.json());

// MongoDB'ye bağlanma
const dbURI = 'mongodb+srv://alican:Ojqdb6xVsfCweOEc@cluster0.hehabxu.mongodb.net/dijitalurun?retryWrites=true&w=majority';
mongoose.connect(dbURI)
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));


// İletişim Schema'sı
const iletisimSchema = new mongoose.Schema({
  mesajisim: String,
  mesajkonu: String,
  mesajmail: String,
  mesajicerik: String,
  mesajip: String
});

// İletişim modelini oluşturma
const Iletisim = mongoose.model('Iletisim', iletisimSchema);

// İletişim verilerini listeleme (GET /iletisim)
app.get('/iletisim', async (req, res) => {
  try {
    const iletisimVerileri = await Iletisim.find();
    res.json(iletisimVerileri);
  } catch (err) {
    res.status(500).send('Veri listeleme sırasında hata oluştu: ' + err);
  }
});

// İletişim verisini silme (DELETE /iletisim/:id)
app.delete('/iletisim/:id', async (req, res) => {
  const { id } = req.params;
  try {
    const sonuc = await Iletisim.findByIdAndDelete(id);
    if (!sonuc) {
      return res.status(404).send('Veri bulunamadı.');
    }
    res.send({ message: 'Veri silindi' });
  } catch (err) {
    res.status(500).send('Silme işlemi sırasında hata oluştu: ' + err);
  }
});

// İletişim verisini güncelleme (PATCH /iletisim/:id)
app.patch('/iletisim/:id', async (req, res) => {
  const { id } = req.params;
  const { mesajisim, mesajkonu, mesajmail, mesajicerik, mesajip } = req.body;

  try {
    const veri = await Iletisim.findById(id);
    if (!veri) {
      return res.status(404).send('Veri bulunamadı.');
    }

    // Güncelleme işlemi
    if (mesajisim) veri.mesajisim = mesajisim;
    if (mesajkonu) veri.mesajkonu = mesajkonu;
    if (mesajmail) veri.mesajmail = mesajmail;
    if (mesajicerik) veri.mesajicerik = mesajicerik;
    if (mesajip) veri.mesajip = mesajip;

    await veri.save();

    res.send({ message: 'Veri güncellendi', veri });
  } catch (err) {
    res.status(500).send('Güncelleme işlemi sırasında hata oluştu: ' + err);
  }
});

app.post('/iletisim', async (req, res) => {
    const { mesajisim, mesajkonu, mesajmail, mesajicerik, mesajip } = req.body;
  
    try {
      const yeniVeri = new Iletisim({
        mesajisim,
        mesajkonu,
        mesajmail,
        mesajicerik,
        mesajip
      });
  
      await yeniVeri.save();
      res.status(201).send({ message: 'Veri başarıyla eklendi', veri: yeniVeri });
    } catch (err) {
      res.status(500).send('Veri eklenirken bir hata oluştu: ' + err);
    }
  });
  

// Sunucuyu başlat
const port = 3000;
app.listen(port, () => {
  console.log(`Sunucu ${port} portunda çalışıyor...`);
});
