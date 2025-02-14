# alias run_rsync="rsync -a . eg@raspberrypi.local:/opt/dev/source-mixpanel";
# rsync -ar --inplace --exclude 'eth' --delete . eg@raspberrypi.local:/opt/dev/source-mixpanel; fswatch -o . | while read f; do rsync -ar --inplace  --exclude 'eth' --delete . eg@raspberrypi.local:/opt/dev/source-mixpanel; done



rsync -ar --inplace --exclude 'data' --exclude '*.csv' --exclude '*.log' --exclude 'node_modules' --exclude 'dist' --delete . \
    analytics@elt.us-central1-c.from-ga-to-bigquery:/home/analytics/dev/source-mixpanel; \
    fswatch -o . | \
    while read f; \
    do rsync -ar --inplace --exclude 'data' --exclude '*.log' --exclude '*.csv' --exclude 'node_modules' --exclude 'dist'  --delete . \
    analytics@elt.us-central1-c.from-ga-to-bigquery:/home/analytics/dev/source-mixpanel; \
    done