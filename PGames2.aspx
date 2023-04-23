<%@ Page Title="" Language="C#" MasterPageFile="~/codeTips.Master" AutoEventWireup="true" CodeBehind="PGames2.aspx.cs" Inherits="final_proj.PGames2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        #letter-stands, #crossed-off {
            letter-spacing: 5px;
        }

        #crossed-off {
            text-decoration: line-through;
        }
        
        #message-box {
            color: red;
        }

        .finished-img {
            width: 50px 50px;
        }
    </style>
    <script>
        const possibilities = [
            'context',
            'mourning',
            'attractive',
            'handy',
            'urgency',
            'ant',
            'squash',
            'fat',
            'hammer',
            'environment',
            'change',
            'nuance',
            'city',
            'hilarious',
            'craft',
            'digress',
            'deficit',
            'bin',
            'nap',
            'well',
            'guitar',
            'cart',
            'fax',
            'habitat',
            'slippery',
            'mine',
            'try',
            'distortion',
            'bat',
            'mist',
            'complete',
            'consolidate',
            'thigh',
            'ranch',
            'fly',
            'distant',
            'seed',
            'burn',
            'proposal',
            'fabricate',
            'theme',
            'headquarters',
            'fisherman',
            'unfair',
            'shoulder',
            'global',
            'protection',
            'chair',
            'bill',
            'rear',
        ];
        const maxTurns = 6;

        let targetWord;
        let found; // stores the data to display letter stands
        let crossedOff;
        let gallowsState;

        function start() {
            targetWord = pickWord(possibilities);
            console.log(targetWord);

            found = '';
            for (let c in targetWord) {
                found += '_';
            }
            displayLetterStands(found);

            crossedOff = '';
            displayCrossedOff(crossedOff);

            gallowsState = 1;
            changeGallows(gallowsState);

            document.getElementById('finished-img').remove();
        }

        function onGuess(event) {
            event.preventDefault();

            const guess = event.target["guess"].value;

            if (!isValidGuess(guess)) {
                document.getElementById('message-box').innerHTML = 'ניחוש חייב להיות בדיוק אות אחת';
            }
            else {
                document.getElementById('message-box').innerHTML = '';

                if (isGoodGuess(guess, targetWord)) {
                    updateLetterStands(guess, targetWord);
                    displayLetterStands(found);
                }
                else {
                    gallowsState += 1;
                    changeGallows(gallowsState);

                    crossedOff += guess;
                    displayCrossedOff(crossedOff);
                }

                if (checkWin(found)) {
                    const img = document.createElement('img');
                    img.src = 'res/hangman/win.png';
                    img.id = 'finished-img';
                    document.getElementById('game-finished').appendChild(img);

                    document.getElementById('win-audio').play();
                }
                else if (gallowsState == maxTurns) {
                    const img = document.createElement('img');
                    img.src = 'res/hangman/game_over.jpg';
                    img.id = 'finished-img';
                    document.getElementById('game-finished').appendChild(img);

                    document.getElementById('game-over-audio').play();
                }
            }

            event.target.reset();
        }

        function pickWord(possibilities) {
            return possibilities[Math.floor(Math.random() * possibilities.length)];
        }

        function displayLetterStands(found) {
            document.getElementById('letter-stands').innerHTML = found;
        }

        function displayCrossedOff(crossedOff) {
            document.getElementById('crossed-off').innerHTML = crossedOff;
        }

        function changeGallows(state) {
            document.getElementById('gallows').src = `res/hangman/${state}.png`;
        }

        function updateLetterStands(guess, target) {
            for (i = 0; i < target.length; i++) {
                if (target[i] == guess) {
                    found = found.slice(0, i) + guess + found.slice(i + 1); // replace character with the guessed letter
                    // why does js not have a replaceAt method??
                }
            }
        }

        function isGoodGuess(guess, target) {
            return target.includes(guess);
        }

        function isValidGuess(guess) {
            if (guess.length != 1) {
                return false;
            }
            return true;
        }

        function checkWin(found) {
            return !found.includes('_');
        }
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h2>איש תלוי!</h2>
    <p>שים.י לב! המילים באנגלית</p>
    <form runat="server" method="post" onsubmit="onGuess(event)">
        <input type="text" name="guess" />
        <input type="submit" value="נחש" name="submit" />
    </form>
    <p id="message-box"></p>
    <p id="letter-stands" dir="ltr"></p>
    <h3>אותיות פסולות:</h3>
    <p id="crossed-off" dir="ltr"></p>
    <img src="res/hangman/1.png" id="gallows" />

    <div id="game-finished">
    </div>

    <button onclick="start()">משחק חדש</button>

    <div id="audio">
        <audio src="res/hangman/win.mp3" id="win-audio"></audio>
        <audio src="res/hangman/game_over.mp3" id="game-over-audio"></audio>
    </div>

    <script>
        start();
    </script>
</asp:Content>