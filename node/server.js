const express = require('express');
const mongoose = require('mongoose');
const cors = require('cors');
const path = require('path');

const app = express();
app.use(cors());
app.use(express.json());

// MongoDB bağlantısı
const dbURI = 'mongodb+srv://alican:Ojqdb6xVsfCweOEc@cluster0.hehabxu.mongodb.net/dijitalurun?retryWrites=true&w=majority';
mongoose.connect(dbURI)
  .then(() => console.log('MongoDB connected'))
  .catch(err => console.error('MongoDB connection error:', err));

// İletişim Schema ve Model
const iletisimSchema = new mongoose.Schema({
  mesajisim: String,
  mesajkonu: String,
  mesajmail: String,
  mesajicerik: String,
  mesajip: String
}, { collection: 'iletisim' });

const Iletisim = mongoose.model('Iletisim', iletisimSchema);

// API Endpoint: Verileri Listele
app.get('/api/iletisim', async (req, res) => {
  try {
    const iletisimVerileri = await Iletisim.find();
    res.json(iletisimVerileri);
  } catch (err) {
    res.status(500).json({ error: 'Veriler alınamadı.' });
  }
});

// API Endpoint: İletişim Ekleme
app.post('/api/iletisim', async (req, res) => {
  try {
    const { mesajisim, mesajkonu, mesajmail, mesajicerik, mesajip } = req.body;

    if (!mesajisim || !mesajkonu || !mesajmail || !mesajicerik || !mesajip) {
      return res.status(400).json({ error: 'Tüm alanlar zorunludur.' });
    }

    const yeniIletisim = new Iletisim({ mesajisim, mesajkonu, mesajmail, mesajicerik, mesajip });
    await yeniIletisim.save();

    res.status(201).json(yeniIletisim);
  } catch (err) {
    res.status(500).json({ error: 'İletişim eklenemedi.', details: err.message });
  }
});

app.put('/api/iletisim', async (req, res) => {
  try {
    const { mesajmail, updateData } = req.body;

    if (!mesajmail || !updateData) {
      return res.status(400).json({ error: 'Geçersiz giriş. Tüm alanlar zorunludur.' });
    }

    console.log('Update Data:', updateData); // Loglama işlemi

    const updatedData = await Iletisim.findOneAndUpdate(
      { mesajmail: mesajmail },
      { $set: updateData },
      { new: true, runValidators: true }
    );

    if (updatedData) {
      res.json(updatedData);
    } else {
      res.status(404).json({ error: 'Veri bulunamadı.' });
    }
  } catch (err) {
    res.status(500).json({ error: 'Veri güncellenemedi.', details: err.message });
  }
});




// API Endpoint: İletişim Silme
app.delete('/api/iletisim', async (req, res) => {
  try {
    const { mesajmail } = req.body;

    if (!mesajmail) {
      return res.status(400).json({ error: 'Geçersiz mail.' });
    }

    const result = await Iletisim.findOneAndDelete({ mesajmail });

    if (result) {
      res.json({ message: 'İletişim silindi.' });
    } else {
      res.status(404).json({ error: 'İletişim bulunamadı.' });
    }
  } catch (err) {
    res.status(500).json({ error: 'İletişim silinemedi.' });
  }
});

// Frontend için statik dosyalar (Köprü Görevi)
app.use(express.static(path.join(__dirname, 'frontend')));

app.get('/', (req, res) => {
  res.sendFile(path.join(__dirname, 'frontend', 'index.html'));
});

app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ error: 'Sunucu hatası', details: err.message });
});


// Server dinleme
const PORT = 3000;
app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});
