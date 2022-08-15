#!/bin/bash
## Bash Script to clear cached memory on (Ubuntu/Debian) Linux
## By Philipp Klaus
## see <http://blog.philippklaus.de/2011/02/clear-cached-memory-on-ubuntu/>

if [ "$(whoami)" != "root" ]
then
  echo "Você tem que executar este script como superusuário!"
  exit 1
fi

# Get Memory Information
freemem_before=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_before=$(echo "$freemem_before/1024.0" | bc)
cachedmem_before=$(cat /proc/meminfo | grep "^Cached" | tr -s ' ' | cut -d ' ' -f2) && cachedmem_before=$(echo "$cachedmem_before/1024.0" | bc)

# Output Information
echo -e "Este script irá limpar a memória cache e liberar sua memória RAM.\n\nNo momento você tem $cachedmem_before MiB em cache e $freemem_before MiB memória livre."

# Test sync
if [ "$?" != "0" ]
then
  echo "Algo deu errado, é impossível sincronizar o sistema de arquivos."
  exit 1
fi

# Clear Filesystem Buffer using "sync" and Clear Caches
sync && echo 3 > /proc/sys/vm/drop_caches

freemem_after=$(cat /proc/meminfo | grep MemFree | tr -s ' ' | cut -d ' ' -f2) && freemem_after=$(echo "$freemem_after/1024.0" | bc)

# Output Summary
echo -e "Isso liberou $(echo "$freemem_after - $freemem_before" | bc) MiB, então agora você tem $freemem_after MiB de RAM livre."

exit 0