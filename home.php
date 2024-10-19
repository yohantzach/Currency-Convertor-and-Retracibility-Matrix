<?php include('db_connect.php') ?>
<!-- Info boxes -->
<?php if($_SESSION['login_type'] == 1): ?>
        <div class="row">
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box">
              <span class="info-box-icon bg-pink elevation-1"><i class="fas fa-users"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Customers</span>
                <span class="info-box-number">
                  <?php echo $conn->query("SELECT * FROM customers")->num_rows; ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-danger elevation-1"><i class="fas fa-user"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Staff</span>
                 <span class="info-box-number">
                  <?php echo $conn->query("SELECT * FROM staff")->num_rows; ?>
                </span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->

          <!-- fix for small devices only -->
          <div class="clearfix hidden-md-up"></div>

          <!-- /.col -->
          <div class="col-12 col-sm-6 col-md-3">
            <div class="info-box mb-3">
              <span class="info-box-icon bg-warning elevation-1"><i class="fas fa-ticket-alt"></i></span>

              <div class="info-box-content">
                <span class="info-box-text">Total Investments</span>
                <span class="info-box-number"><?php echo $conn->query("SELECT * FROM tickets")->num_rows; ?></span>
              </div>
              <!-- /.info-box-content -->
            </div>
            <!-- /.info-box -->
          </div>
          <!-- /.col -->
        </div>
<?php else: ?>
<div class="col-12">
    <div class="card">
        <div class="card-body">
            Welcome <?php echo $_SESSION['login_name'] ?>!

            <!-- Tabular column for currency information -->
            <table class="table mb-5">
                <thead>
                    <tr>
                        <th>Initial Currency Amount</th>
                        <th>Up to 500</th>
                        <th>Over 500</th>
                        <th>Over 1500</th>
                        <th>Over 2500</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Savings and investments module</td>
                        <td>3.5%</td>
                        <td>2.7%</td>
                        <td>2.0%</td>
                        <td>1.5%</td>
                    </tr>
                    <tr>
                        <td>Fee</td>
                        <td>3.5%</td>
                        <td>2.7%</td>
                        <td>2.0%</td>
                        <td>1.5%</td>
                    </tr>
                </tbody>
            </table>

            <!-- Investment types offered information -->
            <table class="table">
                <thead>
                    <tr>
                        <th>Investment Type</th>
                        <th>Maximum Investment Per Year</th>
                        <th>Minimum Monthly Investment</th>
                        <th>Minimum Initial Investment Lump Sum</th>
                        <th>Predicted Returns Per Year</th>
                        <th>Estimated Tax</th>
                        <th>RBSX Group Fees Per Month</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Basic Savings Plan</td>
                        <td>£20000</td>
                        <td>£50</td>
                        <td>N/A</td>
                        <td>1.2% to 2.4%</td>
                        <td>0%</td>
                        <td>0.25%</td>
                    </tr>
                    <tr>
                        <td>Savings Plan Plus</td>
                        <td>£30000</td>
                        <td>£50</td>
                        <td>£300</td>
                        <td>3% to 5.5%</td>
                        <td>10% on profits above £12000</td>
                        <td>0.3%</td>
                    </tr>
                    <tr>
                        <td>Managed Stock Investments</td>
                        <td>Unlimited</td>
                        <td>£150</td>
                        <td>£1000</td>
                        <td>4% to 23%</td>
                        <td>10% on profits above £12000, 20% on profits above £40000</td>
                        <td>1.3%</td>
                    </tr>
                </tbody>
            </table>

            <!-- Currency graph -->
            <canvas id="currencyChart" width="800" height="400"></canvas>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script>
    $(document).ready(function() {
        function updateCurrencyChart() {
            $.ajax({
                url: 'https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd',
                method: 'GET',
                success: function(response) {
                    var bitcoinPrice = response.bitcoin.usd;
                    var ethereumPrice = response.ethereum.usd;

                    currencyChart.data.datasets[0].data = [bitcoinPrice, ethereumPrice];
                    currencyChart.update();
                },
                error: function(xhr, status, error) {
                    console.error('Error fetching currency data:', error);
                }
            });
        }

        updateCurrencyChart();
        setInterval(updateCurrencyChart, 5000);

        var ctx = document.getElementById('currencyChart').getContext('2d');
        var currencyChart = new Chart(ctx, {
            type: 'bar',
            data: {
                labels: ['Bitcoin', 'Ethereum'],
                datasets: [{
                    label: 'Price (USD)',
                    data: [],
                    backgroundColor: [
                        'rgba(255, 99, 132, 0.2)',
                        'rgba(54, 162, 235, 0.2)'
                    ],
                    borderColor: [
                        'rgba(255, 99, 132, 1)',
                        'rgba(54, 162, 235, 1)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                scales: {
                    yAxes: [{
                        ticks: {
                            beginAtZero: true
                        }
                    }]
                }
            }
        });
    });
</script>
<?php endif; ?>
