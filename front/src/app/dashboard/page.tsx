import * as React from 'react';
import type { Metadata } from 'next';
import { Typography } from '@mui/material';
import Grid from '@mui/material/Unstable_Grid2';


import { config } from '@/config';

export const metadata = { title: `Overview | Dashboard | ${config.site.name}` } satisfies Metadata;

export default function Page(): React.JSX.Element {
  return (
    <Grid>
      <div>
        <Typography variant="h4">Cursova</Typography>
      </div>

      <Typography variant="h6">Welcome to my micro finances dashboard</Typography>
    </Grid>
  );
}
