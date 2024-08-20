package database

import "api/models"

var questions = []models.Question{
    {
        ID:       1,
        Question: "What is a candlestick pattern used for in trading?",
        Options: []models.Option{
            {ID: 1, Text: "A decorative candle"},
            {ID: 2, Text: "Technical analysis of price movements"},
            {ID: 3, Text: "Market sentiment tracking"},
            {ID: 4, Text: "Currency exchange rates"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/candlestick.jpg", // Valid URL
    },
    {
        ID:       2,
        Question: "What does a 'bull market' indicate?",
        Options: []models.Option{
            {ID: 1, Text: "A period of declining stock prices"},
            {ID: 2, Text: "A stable or non-moving market"},
            {ID: 3, Text: "A period of rising stock prices"},
            {ID: 4, Text: "An extremely volatile market"},
        },
        CorrectAnswer: 3,
        ImageUrl:      "https://example.com/bull_market.jpg", // Valid URL
    },
    {
        ID:       3,
        Question: "What is the purpose of the 'P/E Ratio' in trading?",
        Options: []models.Option{
            {ID: 1, Text: "To calculate profit margins"},
            {ID: 2, Text: "To evaluate a company's stock valuation"},
            {ID: 3, Text: "To determine market volatility"},
            {ID: 4, Text: "To measure trading volume"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://example.com/pe_ratio.jpg", // Valid URL
    },
    {
        ID:       4,
        Question: "How does 'short selling' work in trading?",
        Options: []models.Option{
            {ID: 1, Text: "Selling stocks that are not yet owned, expecting a price drop"},
            {ID: 2, Text: "Selling stocks after a significant price increase"},
            {ID: 3, Text: "Selling stocks to make a profit"},
            {ID: 4, Text: "Selling stocks to avoid a loss"},
        },
        CorrectAnswer: 1,
        ImageUrl:      "https://example.com/short_selling.jpg", // Valid URL
    },
    {
        ID:       5,
        Question: "What does 'leverage' mean in trading?",
        Options: []models.Option{
            {ID: 1, Text: "Using borrowed funds to increase investment exposure"},
            {ID: 2, Text: "Investing in a diverse range of assets"},
            {ID: 3, Text: "Mitigating risk through asset allocation"},
            {ID: 4, Text: "Purchasing assets at a discounted price"},
        },
        CorrectAnswer: 1,
        ImageUrl:      "https://media.istockphoto.com/id/1064250164/photo/candlestick-chart-red-green-in-financial-market-for-trading-on-black-color-background.jpg?s=2048x2048&w=is&k=20&c=KSEOFBMqL2iJwcf1Pz1ZhaWKNU8C14lO0Y-RK2NfTd0=", // Valid URL
    },
    {
        ID:       6,
        Question: "Which indicator is used to measure market volatility?",
        Options: []models.Option{
            {ID: 1, Text: "Moving Average Convergence Divergence (MACD)"},
            {ID: 2, Text: "Relative Strength Index (RSI)"},
            {ID: 3, Text: "Volatility Index (VIX)"},
            {ID: 4, Text: "Bollinger Bands"},
        },
        CorrectAnswer: 3,
        ImageUrl:      "https://media.istockphoto.com/id/1064250164/photo/candlestick-chart-red-green-in-financial-market-for-trading-on-black-color-background.jpg?s=2048x2048&w=is&k=20&c=KSEOFBMqL2iJwcf1Pz1ZhaWKNU8C14lO0Y-RK2NfTd0=", // Valid URL
    },
    {
        ID:       7,
        Question: "What does the 'Dow Jones Industrial Average' represent?",
        Options: []models.Option{
            {ID: 1, Text: "A single company's stock price"},
            {ID: 2, Text: "The overall performance of major U.S. companies"},
            {ID: 3, Text: "A specific trading strategy"},
            {ID: 4, Text: "An index of international markets"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://media.istockphoto.com/id/1064250164/photo/candlestick-chart-red-green-in-financial-market-for-trading-on-black-color-background.jpg?s=2048x2048&w=is&k=20&c=KSEOFBMqL2iJwcf1Pz1ZhaWKNU8C14lO0Y-RK2NfTd0=", // Valid URL
    },
    {
        ID:       8,
        Question: "What is an 'IPO' in the financial markets?",
        Options: []models.Option{
            {ID: 1, Text: "Initial Purchase Order"},
            {ID: 2, Text: "Internal Public Offering"},
            {ID: 3, Text: "Initial Public Offering"},
            {ID: 4, Text: "International Purchase Offering"},
        },
        CorrectAnswer: 3,
        ImageUrl:      "https://media.istockphoto.com/id/1064250164/photo/candlestick-chart-red-green-in-financial-market-for-trading-on-black-color-background.jpg?s=2048x2048&w=is&k=20&c=KSEOFBMqL2iJwcf1Pz1ZhaWKNU8C14lO0Y-RK2NfTd0=", // Valid URL
    },
    {
        ID:       9,
        Question: "What is the function of a 'stop-loss order'?",
        Options: []models.Option{
            {ID: 1, Text: "To maximize investment gains"},
            {ID: 2, Text: "To limit potential losses"},
            {ID: 3, Text: "To automate stock purchases"},
            {ID: 4, Text: "To monitor stock price movements"},
        },
        CorrectAnswer: 2,
        ImageUrl:      "https://media.istockphoto.com/id/1064250164/photo/candlestick-chart-red-green-in-financial-market-for-trading-on-black-color-background.jpg?s=2048x2048&w=is&k=20&c=KSEOFBMqL2iJwcf1Pz1ZhaWKNU8C14lO0Y-RK2NfTd0=", // Valid URL
    },
    {
        ID:       10,
        Question: "What does 'dividend' mean in the context of stocks?",
        Options: []models.Option{
            {ID: 1, Text: "A financial reward for employees"},
            {ID: 2, Text: "Interest payment on a bond"},
            {ID: 3, Text: "A payment distributed to shareholders"},
            {ID: 4, Text: "A service fee charged by brokers"},
        },
        CorrectAnswer: 3,
        ImageUrl:      "https://example.com/dividend.jpg", // Valid URL
    },
}

func GetQuestions() []models.Question {
    return questions
}

func CheckAnswers(userAnswers []models.UserAnswer) models.QuizResult {
    var result models.QuizResult

    for _, userAnswer := range userAnswers {
        for _, question := range questions {
            if question.ID == userAnswer.QuestionID {
                if question.CorrectAnswer == userAnswer.AnswerID {
                    result.CorrectAnswers++
                } else {
                    result.IncorrectAnswers++
                }
                break
            }
        }
    }

    return result
}
