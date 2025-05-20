'use client';

import * as React from 'react';
import dynamic from 'next/dynamic';
import { getPaymentSchedulesByLoanId, PaymentScheduleDTO } from '@/services/payments-schedule.api';
import Box from '@mui/material/Box';
import Typography from '@mui/material/Typography';
import dayjs from 'dayjs';

const Chart = dynamic(() => import('react-apexcharts'), { ssr: false });

interface Props {
  readonly loanId: number;
}

export function LoanPaymentInfo({ loanId }: Props) {
  const [schedules, setSchedules] = React.useState<PaymentScheduleDTO[]>([]);
  const [loading, setLoading] = React.useState(true);
  const [chartSeries, setChartSeries] = React.useState<number[]>([]);
  const [chartOptions, setChartOptions] = React.useState<any>({});
  const [nextPayment, setNextPayment] = React.useState<PaymentScheduleDTO | null>(null);
  const [completedPercentage, setCompletedPercentage] = React.useState<number>(0);
  const [completedPayments, setCompletedPayments] = React.useState<number>(0);
  const [totalPayments, setTotalPayments] = React.useState<number>(0);

  React.useEffect(() => {
    if (loanId) {
      loadSchedules(loanId);
    }
  }, [loanId]);

  React.useEffect(() => {
    console.log(chartOptions,chartSeries);
    
  }, [chartOptions,chartSeries]);

  async function loadSchedules(loanId: number) {
    setLoading(true);
    try {
      const data = await getPaymentSchedulesByLoanId(loanId);
      setSchedules(data);
      updateChart(data);
    } catch (error) {
      console.error('Failed to load payment schedules', error);
    } finally {
      setLoading(false);
    }
  }

  function updateChart(schedules: PaymentScheduleDTO[]) {
    if (!schedules?.length) {
      setChartSeries([]);
      setChartOptions({});
      setNextPayment(null);
      setCompletedPayments(0);
      setTotalPayments(0);
      setCompletedPercentage(0);
      return;
    }

    const total = schedules.length;
    const completed = schedules.filter((s) => s.statusid === 2).length;

    const upcomingPayment = schedules
      .filter((s) => s.statusid === 1)
      .sort((a, b) => new Date(a.duedate).getTime() - new Date(b.duedate).getTime())[0];

    const completedPercent = (completed / total) * 100;

    setTotalPayments(total);
    setCompletedPayments(completed);
    setCompletedPercentage(completedPercent);
    setNextPayment(upcomingPayment);

    setChartSeries([completed, total - completed]);

    setChartOptions({
        chart: {
            height: 300, 
          },
      labels: ['Paid', 'Remaining'],
      colors: ['#4caf50', '#f44336'],
      legend: {
        position: 'bottom' as const,
      },
      dataLabels: {
        enabled: true,
        formatter: (val: number) => `${val.toFixed(0)}%`,
      },
    });
  }

  if (loading) {
    return <Typography>Loading payment info...</Typography>;
  }

  if (!schedules?.length) {
    return <Typography>No payment schedules available</Typography>;
  }

  return (
    <Box sx={{ display: 'flex', flexDirection: 'column', alignItems: 'center', gap: 2 }}>
      {nextPayment && (
        <Typography variant="h6">Next Payment: {dayjs(nextPayment.duedate).format('MMM D, YYYY')}</Typography>
      )}

      
      {chartSeries.length > 0 && chartOptions.labels ? (
        <Chart options={chartOptions} series={chartSeries} type="pie" width={300} />
      ) : (
        <Typography>Chart data is not available</Typography>
      )}
      <Typography variant="body1">
        Paid: {completedPayments} of {totalPayments} payments ({completedPercentage.toFixed(0)}%)
      </Typography>
    </Box>
  );
}
