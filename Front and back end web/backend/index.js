import express from 'express';
import cors from 'cors';

const app = express();
const PORT = 8080;
const SECRET_WORD = 'apple';

app.use(cors());
app.use(express.json());

app.post('/api/guess', (req, res) => {
  const { guess } = req.body;
  if (!guess) return res.status(400).json({ message: 'No guess provided' });

  if (guess.toLowerCase() === SECRET_WORD) {
    res.json({ correct: true, message: '(TAMA) Correct!' });
  } else {
    res.json({ correct: false, message: '(MALI) Try again!' });
  }
});

app.listen(PORT, () => {
  console.log(`Server running on http://localhost:${PORT}`);
});