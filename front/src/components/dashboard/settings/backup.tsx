'use client';

import * as React from 'react';
import { apiLink } from '@/constants';
import { BackupFile, createBackup, deleteBackup, listBackups, restoreBackup } from '@/services/backup-api';
import {
  Box,
  Button,
  Card,
  CardContent,
  CardHeader,
  CircularProgress,
  Divider,
  IconButton,
  List,
  ListItem,
  ListItemText,
  Stack,
  Typography,
} from '@mui/material';
import { ClockClockwise, Trash } from '@phosphor-icons/react';

export default function BackupManager() {
  const [backups, setBackups] = React.useState<BackupFile[]>([]);
  const [loading, setLoading] = React.useState(false);
  const [actionLoading, setActionLoading] = React.useState<string | null>(null);

  const download = (fileName: string) => {
    const url = `${apiLink}Backup/${fileName}`;
    const link = document.createElement('a');
    link.href = url;
    link.download = fileName;
    link.click();
  };

  const loadBackups = async () => {
    setLoading(true);
    try {
      const data = await listBackups();
      setBackups(data);
    } catch (err) {
      console.error('Failed to load backups:', err);
    } finally {
      setLoading(false);
    }
  };

  React.useEffect(() => {
    loadBackups();
  }, []);

  const handleCreate = async () => {
    setActionLoading('create');
    try {
      await createBackup();
      await loadBackups();
    } catch (err) {
      console.error('Create failed:', err);
    } finally {
      setActionLoading(null);
    }
  };

  const handleRestore = async (fileName: string) => {
    setActionLoading(`restore:${fileName}`);
    try {
      await restoreBackup(fileName);
    } catch (err) {
      console.error('Restore failed:', err);
    } finally {
      setActionLoading(null);
    }
  };

  const handleDelete = async (fileName: string) => {
    setActionLoading(`delete:${fileName}`);
    try {
      await deleteBackup(fileName);
      await loadBackups();
    } catch (err) {
      console.error('Delete failed:', err);
    } finally {
      setActionLoading(null);
    }
  };

  return (
    <Card>
      <CardHeader subheader="Manage the backups" title="Database Backups" />
      <Divider />
      <CardContent>
        <Box>
          <Stack direction="row" alignItems="center" justifyContent="space-between" mb={2}>
            <Button variant="contained" onClick={handleCreate} disabled={actionLoading === 'create'}>
              {actionLoading === 'create' ? <CircularProgress size={20} /> : 'Create Backup'}
            </Button>
          </Stack>

          {loading ? (
            <CircularProgress />
          ) : (
            <List>
              {backups.map((b) => (
                <React.Fragment key={b.fileName}>
                  <ListItem
                    secondaryAction={
                      <Stack direction="row" spacing={1}>
                        <Button variant="contained" size="small" onClick={() => download(b.fileName)}>
                          Download
                        </Button>
                        <IconButton
                          onClick={() => handleRestore(b.fileName)}
                          disabled={actionLoading === `restore:${b.fileName}`}
                        >
                          <ClockClockwise size={32} />
                        </IconButton>
                        <IconButton
                          onClick={() => handleDelete(b.fileName)}
                          disabled={actionLoading === `delete:${b.fileName}`}
                        >
                          <Trash size={32} />
                        </IconButton>
                      </Stack>
                    }
                  >
                    <ListItemText primary={b.fileName} secondary={new Date(b.createdAt).toLocaleString()} />
                  </ListItem>
                  <Divider />
                </React.Fragment>
              ))}
            </List>
          )}
        </Box>
      </CardContent>
    </Card>
  );
}
