<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Charts</title>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            width: 80%;
            margin: auto;
        }
        canvas {
            display: block;
            max-width: 100%;
            height: auto;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>My Charts</h2>
        <canvas id="myChart"></canvas>
        <script>
            // Get the context of the canvas element we want to select
            var ctx = document.getElementById('myChart').getContext('2d');

            // Create a new Chart instance
            var myChart = new Chart(ctx, {
                type: 'bar', // Type of chart
                data: {
                    labels: ['Task 1', 'Task 2', 'Task 3'], // Labels for the x-axis
                    datasets: [{
                        label: '# of Tasks',
                        data: [12, 19, 3], // Data for each label
                        backgroundColor: [
                            'rgba(255, 99, 132, 0.2)',
                            'rgba(54, 162, 235, 0.2)',
                            'rgba(255, 206, 86, 0.2)'
                        ],
                        borderColor: [
                            'rgba(255, 99, 132, 1)',
                            'rgba(54, 162, 235, 1)',
                            'rgba(255, 206, 86, 1)'
                        ],
                        borderWidth: 1
                    }]
                },
                options: {
                    responsive: true,
                    scales: {
                        y: {
                            beginAtZero: true
                        }
                    }
                }
            });
        </script>
    </div>
</body>
</html>
