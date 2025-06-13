const express = require('express');
const app = express();
const PORT = process.env.PORT || 3001;

app.use(express.json());

app.post('/email', (req, res) => {
  console.log('Email notification:', req.body);
  res.json({ status: 'sent' });
});

app.post('/push', (req, res) => {
  console.log('Push notification:', req.body);
  res.json({ status: 'sent' });
});

app.get('/', (req, res) => {
  res.send('Notification service running');
});

app.listen(PORT, () => {
  console.log(`Notification service listening on port ${PORT}`);
});
