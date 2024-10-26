// this script is only for controlling player character, chat, and do action and sex and blowjob (soon)
// full script is in the API "https://api.turtle.ai/mode/action/"
const express = require('express');
const app = express();
const port = 3000;

app.use(express.json());

let characters = {};

function initializeCharacter(characterId) {
    if (!characters[characterId]) {
        characters[characterId] = {
            position: [0, 0, 0],
            speed: 10,
            action: 'idle',
            dialogue: ''
        };
    }
}

function moveCharacter(characterId, destination, speed) {
    let character = characters[characterId];
    character.position = destination;
    character.speed = speed;
    return `Character ${characterId} is moving to ${destination} at speed ${speed}`;
}

function speakCharacter(characterId, message) {
    let character = characters[characterId];
    character.dialogue = message;
    return `Character ${characterId} says: ${message}`;
}

function performCharacterAction(characterId, action) {
    let character = characters[characterId];
    character.action = action;
    return `Character ${characterId} performed action: ${action}`;
}

app.post('/move', (req, res) => {
    const { characterId, destination, speed } = req.body;
    initializeCharacter(characterId);
    const result = moveCharacter(characterId, destination, speed);
    res.json({ status: 'success', message: result });
});

app.post('/speak', (req, res) => {
    const { characterId, message } = req.body;
    initializeCharacter(characterId);
    const result = speakCharacter(characterId, message);
    res.json({ status: 'success', message: result });
});

app.post('/performAction', (req, res) => {
    const { characterId, action } = req.body;
    initializeCharacter(characterId);
    const result = performCharacterAction(characterId, action);
    res.json({ status: 'success', message: result });
});

app.listen(port, () => {
    console.log(`AI API is running at http://localhost:${port}`);
});
