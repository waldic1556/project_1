
"use client";
import { useState } from "react";
import {
  Box, Grid, TextField, Button, Paper
} from "@mui/material";

export default function LogsFilters({ onFilter }: { onFilter: Function }) {
  const [userId, setUserId] = useState("");
  const [action, setAction] = useState("");
  const [from, setFrom] = useState("");
  const [to, setTo] = useState("");

  const handleApply = () => {
    onFilter(userId, action, from, to);
  };

  return (
    <Paper sx={{ padding: 2, mb: 3 }}>
      <Grid container spacing={2}>
        <Grid item xs={12} sm={3}>
          <TextField
            fullWidth
            label="User"
            value={userId}
            onChange={(e) => setUserId(e.target.value)}
          />
        </Grid>
        <Grid item xs={12} sm={2}>
          <TextField
            fullWidth
            label="Action"
            value={action}
            onChange={(e) => setAction(e.target.value)}
          />
        </Grid>
        <Grid item xs={12} sm={2}>
          <TextField
            fullWidth
            label="From"
            type="date"
            InputLabelProps={{ shrink: true }}
            value={from}
            onChange={(e) => setFrom(e.target.value)}
          />
        </Grid>
        <Grid item xs={12} sm={2}>
          <TextField
            fullWidth
            label="To"
            type="date"
            InputLabelProps={{ shrink: true }}
            value={to}
            onChange={(e) => setTo(e.target.value)}
          />
        </Grid>
        <Grid item xs={12} sm={3} display="flex" alignItems="flex-end">
          <Button fullWidth variant="contained" onClick={handleApply}>
            Apply
          </Button>
        </Grid>
      </Grid>
    </Paper>
  );
}
