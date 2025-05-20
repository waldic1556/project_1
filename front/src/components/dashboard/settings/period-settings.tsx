'use client';

import { useEffect, useState } from 'react';
import { apiLink } from '@/constants';
import api from '@/services/axios-api';
import { Box, Button, Card, CardContent, CardHeader, Grid, Paper, TextField, Typography } from '@mui/material';
import axios from 'axios';

export default function PeriodSettings() {
  const [startDate, setStartDate] = useState('');
  const [endDate, setEndDate] = useState('');

  useEffect(() => {
    api.get(`${apiLink}Settings/period`).then((res) => {
      setStartDate(res.data.startDate.substring(0, 10));
      setEndDate(res.data.endDate.substring(0, 10));
    });
  }, []);

  const savePeriod = async () => {
    await api.post(`${apiLink}Settings/period`, {
      startDate,
      endDate,
    });
    alert('Accounting period is updated!');
  };

  return (
    <Card sx={{ p: 3, mt: 4 }}>
      <CardHeader subheader="Accounting period" title="Setting up the accounting period" />
      <CardContent>
        <Grid container spacing={2}>
          <Grid item xs={12} sm={6}>
            <TextField
              label="Start"
              type="date"
              value={startDate}
              onChange={(e) => setStartDate(e.target.value)}
              InputLabelProps={{ shrink: true }}
              fullWidth
            />
          </Grid>
          <Grid item xs={12} sm={6}>
            <TextField
              label="End"
              type="date"
              value={endDate}
              onChange={(e) => setEndDate(e.target.value)}
              InputLabelProps={{ shrink: true }}
              fullWidth
            />
          </Grid>
          <Grid item xs={12}>
            <Button variant="contained" onClick={savePeriod}>
              Save
            </Button>
          </Grid>
        </Grid>
      </CardContent>
    </Card>
  );
}
