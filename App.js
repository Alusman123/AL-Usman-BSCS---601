import { useState } from 'react';

function App() {
  const [guess, setGuess] = useState('');
  const [result, setResult] = useState('');

  const handleGuess = async () => {
    try {
      const response = await fetch('http://localhost:8080/api/guess', {
        method: 'POST',
        headers: { 'Content-Type': 'application/json' },
        body: JSON.stringify({ guess }),
      });
      const data = await response.json();
      setResult(data.message);
    } catch (error) {
      console.error('Error:', error);
      setResult('Server error.');
    }
  };

  return (
    <div style={{ textAlign: 'center', marginTop: '50px' }}>
      <h1>🎯 Guess the Word</h1>
      <input
        value={guess}
        onChange={(e) => setGuess(e.target.value)}
        placeholder="Type your guess..."
      />
      <button onClick={handleGuess}>Submit</button>
      <p>{result}</p>
    </div>
  );
}

export default App;