document.getElementById('calculate-button').addEventListener('click', calculateInvestment);

function calculateInvestment() {
    const initialAmount = parseFloat(document.getElementById('initial-amount').value);
    const monthlyAmount = parseFloat(document.getElementById('monthly-amount').value);
    const investmentType = document.getElementById('investment-type').value;

    // Perform calculations based on investment type and durations
    // Here, you should implement the logic to calculate the returns, fees, and taxes based on the user input for 1 year, 5 years, and 10 years

    // Dummy calculations for demonstration
    const results = {
        maxReturns1Year: initialAmount * 0.10,
        minReturns1Year: initialAmount * 0.05,
        totalProfit1Year: (initialAmount * 0.10) - initialAmount,
        totalFees1Year: initialAmount * 0.02,
        totalTaxes1Year: ((initialAmount * 0.10) - initialAmount) * 0.15,

        maxReturns5Years: initialAmount * 0.50,
        minReturns5Years: initialAmount * 0.25,
        totalProfit5Years: (initialAmount * 0.50) - initialAmount + (monthlyAmount * 12 * 5), // Include monthly contributions for 5 years
        totalFees5Years: initialAmount * 0.10,
        totalTaxes5Years: ((initialAmount * 0.50) - initialAmount + (monthlyAmount * 12 * 5)) * 0.20,

        maxReturns10Years: initialAmount * 1.00,
        minReturns10Years: initialAmount * 0.75,
        totalProfit10Years: (initialAmount * 1.00) - initialAmount + (monthlyAmount * 12 * 10), // Include monthly contributions for 10 years
        totalFees10Years: initialAmount * 0.15,
        totalTaxes10Years: ((initialAmount * 1.00) - initialAmount + (monthlyAmount * 12 * 10)) * 0.25
    };

    // Display results
    displayResults(results);
    displayCharts(results);
}

function displayResults(results) {
    // Display results in HTML
    const resultsDiv = document.getElementById('results');
    resultsDiv.innerHTML = `
        <h2>Investment Results</h2>
        <h3>1 Year</h3>
        <p>Max Returns: £${results.maxReturns1Year.toFixed(2)}</p>
        <p>Min Returns: £${results.minReturns1Year.toFixed(2)}</p>
        <p>Total Profit: £${results.totalProfit1Year.toFixed(2)}</p>
        <p>Total Fees: £${results.totalFees1Year.toFixed(2)}</p>
        <p>Total Taxes: £${results.totalTaxes1Year.toFixed(2)}</p>
        
        <h3>5 Years</h3>
        <p>Max Returns: £${results.maxReturns5Years.toFixed(2)}</p>
        <p>Min Returns: £${results.minReturns5Years.toFixed(2)}</p>
        <p>Total Profit: £${results.totalProfit5Years.toFixed(2)}</p>
        <p>Total Fees: £${results.totalFees5Years.toFixed(2)}</p>
        <p>Total Taxes: £${results.totalTaxes5Years.toFixed(2)}</p>
        
        <h3>10 Years</h3>
        <p>Max Returns: £${results.maxReturns10Years.toFixed(2)}</p>
        <p>Min Returns: £${results.minReturns10Years.toFixed(2)}</p>
        <p>Total Profit: £${results.totalProfit10Years.toFixed(2)}</p>
        <p>Total Fees: £${results.totalFees10Years.toFixed(2)}</p>
        <p>Total Taxes: £${results.totalTaxes10Years.toFixed(2)}</p>
    `;
}

function displayCharts(results) {
    // Display charts using Chart.js
    const returnsChart = new Chart(document.getElementById('returns-chart'), {
        type: 'pie',
        data: {
            labels: ['1 Year', '5 Years', '10 Years'],
            datasets: [{
                label: 'Max Returns (Pie Chart)',
                data: [results.maxReturns1Year, results.maxReturns5Years, results.maxReturns10Years],
                backgroundColor: ['#007bff', '#28a745', '#ffc107']
            }, {
                label: 'Min Returns (Pie Chart)',
                data: [results.minReturns1Year, results.minReturns5Years, results.minReturns10Years],
                backgroundColor: ['#dc3545', '#fd7e14', '#6610f2']
            }]
        },
        options: {
            title: {
                display: true,
                text: 'Max and Min Returns (Pie Chart)'
            }
        }
    });

    const feesChart = new Chart(document.getElementById('fees-chart'), {
        type: 'pie',
        data: {
            labels: ['1 Year', '5 Years', '10 Years'],
            datasets: [{
                label: 'Total Fees (Pie Chart)',
                data: [results.totalFees1Year, results.totalFees5Years, results.totalFees10Years],
                backgroundColor: ['#007bff', '#28a745', '#ffc107']
            }]
        },
        options: {
            title: {
                display: true,
                text: 'Total Fees (Pie Chart)'
            }
        }
    });

    const taxesChart = new Chart(document.getElementById('taxes-chart'), {
        type: 'pie',
        data: {
            labels: ['1 Year', '5 Years', '10 Years'],
            datasets: [{
                label: 'Total Taxes (Pie Chart)',
                data: [results.totalTaxes1Year, results.totalTaxes5Years, results.totalTaxes10Years],
                backgroundColor: ['#007bff', '#28a745', '#ffc107']
            }]
        },
        options: {
            title: {
                display: true,
                text: 'Total Taxes (Pie Chart)'
            }
        }
    });

    const returnsBarChart = new Chart(document.getElementById('returns-bar-chart'), {
        type: 'bar',
        data: {
            labels: ['1 Year', '5 Years', '10 Years'],
            datasets: [{
                label: 'Max Returns (Bar Chart)',
                data: [results.maxReturns1Year, results.maxReturns5Years, results.maxReturns10Years],
                backgroundColor: '#007bff',
                borderWidth: 1
            }, {
                label: 'Min Returns (Bar Chart)',
                data: [results.minReturns1Year, results.minReturns5Years, results.minReturns10Years],
                backgroundColor: '#dc3545',
                borderWidth: 1
            }]
        },
        options: {
            title: {
                display: true,
                text: 'Max and Min Returns (Bar Chart)'
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });

    const profitsChart = new Chart(document.getElementById('profits-chart'), {
        type: 'bar',
        data: {
            labels: ['1 Year', '5 Years', '10 Years'],
            datasets: [{
                label: 'Total Profits',
                data: [results.totalProfit1Year, results.totalProfit5Years, results.totalProfit10Years],
                backgroundColor: ['#007bff', '#28a745', '#ffc107'],
                borderWidth: 1
            }]
        },
        options: {
            title: {
                display: true,
                text: 'Total Profits'
            },
            scales: {
                yAxes: [{
                    ticks: {
                        beginAtZero: true
                    }
                }]
            }
        }
    });
}