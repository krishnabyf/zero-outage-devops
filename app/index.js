require('dotenv').config();

if (!process.env.API_KEY) {
  console.error("❌ Missing API_KEY - FAIL FAST");
  process.exit(1);
}

const express = require('express');
const app = express();

app.get('/', (req, res) => {
  res.send('✅ App is running');
});

app.get('/health', (req, res) => {
  res.status(200).send('OK');
});

app.listen(3000, () => console.log('🚀 Server running on port 3000'));