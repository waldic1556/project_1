'use client';

import { useState } from 'react';
import { apiLink } from '@/constants';
import api from '@/services/axios-api';
import jsPDF from 'jspdf';
import autoTable from 'jspdf-autotable';
import { Button } from '@mui/material';

const endpoints = [
  { path: 'customer-loans', label: 'Customers and their loans' },
  { path: 'loans-with-status', label: 'Loans with status' },
  { path: 'schedules-with-customers', label: 'Payment schedules with customers' },
  { path: 'payments-with-types', label: 'Payments with types' },
  { path: 'contracts-with-customers', label: 'Contracts with customers' },
  { path: 'loan-payment-sums', label: 'Loan payment totals' },
  { path: 'employees-with-positions', label: 'Employees with positions' },
  { path: 'loan-dates-types', label: 'Loan dates and types' },
  { path: 'customers-with-types', label: 'Customers and their types' },
  { path: 'schedules-with-status', label: 'Loan type stats' },
];
export default function LoanReports() {
  const [loading, setLoading] = useState<string | null>(null);

  const fetchData = async (endpoint: string, label: string) => {
    setLoading(endpoint);
    const res = await api.get<any>(`${apiLink}Loan/${endpoint}`);
    const data = res.data;

    const doc = new jsPDF();
    doc.text(label, 10, 10);

    const keys = Object.keys(data[0]);

    autoTable(doc, {
      startY: 20,
      head: [keys],
      body: data.map((c: any) => keys.map((key) => c[key])),
    });

    doc.save(`${label.replaceAll(' ', '_')}.pdf`);
    setLoading(null);
  };

  return (
    <div style={{ padding: 20 }}>
      <h1>Selects with pdf</h1>
      {endpoints.map(({ path, label }) => (
        <Button
         variant="contained"
          key={path}
          onClick={() => fetchData(path, label)}
          disabled={loading === path}
          style={{ display: 'block', margin: '10px 0', padding: '10px 20px' }}
        >
          {loading === path ? 'Загрузка...' : label}
        </Button>
      ))}
    </div>
  );
}
