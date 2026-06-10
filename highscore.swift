@State private var highScore: Int = 0

func endGame() {
    phase = .over
    colorTimer?.invalidate()
    colorTimer = nil
    if score > highScore { highScore = score }  // ← add this line
}

var gameOverView: some View {
    VStack(spacing: 20) {
        Text("Time's Up!")
            .font(.largeTitle.bold())

        Text("Final Score")
            .font(.headline)
            .foregroundStyle(.secondary)

        Text("\(score)")
            .font(.system(size: 72, weight: .black, design: .rounded))
            .foregroundStyle(.blue)

        // ← add this block
        if highScore > 0 {
            HStack(spacing: 6) {
                Image(systemName: score == highScore ? "trophy.fill" : "trophy")
                    .foregroundStyle(.yellow)
                Text(score == highScore ? "New High Score!" : "Best: \(highScore)")
                    .font(.subheadline.bold())
                    .foregroundStyle(.secondary)
            }
        }

        Button(action: resetGame) {
            Text("Play Again")
                .font(.title2.bold())
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundStyle(.white)
                .clipShape(RoundedRectangle(cornerRadius: 18))
        }
        .padding(.horizontal, 40)
        .padding(.top, 12)
    }
    .padding()
}