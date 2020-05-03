use lead_gen_business;

SELECT SUM(amount)
FROM billing
WHERE charged_datetime BETWEEN '2012/03/01' AND '2012/03/31';

SELECT clients.client_id, SUM(billing.amount)
FROM clients
JOIN billing ON clients.client_id = billing.client_id
WHERE clients.client_id = 2;

SELECT clients.client_id, sites.domain_name
FROM clients
JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 10;

SELECT clients.client_id, COUNT(sites.domain_name) as count, DATE_FORMAT(sites.created_datetime, "%M") as month, YEAR(sites.created_datetime) as year
FROM clients
JOIN sites ON clients.client_id = sites.client_id
WHERE clients.client_id = 20
GROUP BY year, month;

SELECT sites.domain_name, COUNT(leads.leads_id) as num_leads
FROM sites
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN "2011/01/01" AND "2011/02/15"
GROUP BY sites.domain_name;

SELECT clients.first_name, clients.last_name, COUNT(leads.leads_id)
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN "2011/01/01" AND "2011/12/31"
GROUP BY clients.client_id;

SELECT CONCAT(clients.first_name, " ", clients.last_name) as name, COUNT(leads.leads_id), DATE_FORMAT(leads.registered_datetime, "%M") as month_generated
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE YEAR(leads.registered_datetime) = 2011 AND MONTH(leads.registered_datetime) BETWEEN 1 AND 6
GROUP BY clients.client_id, month_generated;

SELECT clients.first_name, clients.last_name, sites.domain_name, COUNT(leads.leads_id)
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
WHERE leads.registered_datetime BETWEEN "2011/01/01" AND "2011/12/31"
GROUP BY sites.site_id
ORDER BY clients.client_id, sites.domain_name;

SELECT clients.first_name, clients.last_name, sites.domain_name, count(leads.leads_id)
FROM clients
JOIN sites ON clients.client_id = sites.client_id
JOIN leads ON sites.site_id = leads.site_id
GROUP BY sites.domain_name
ORDER BY clients.client_id;

SELECT clients.first_name, clients.last_name, DATE_FORMAT(billing.charged_datetime, "%m"), DATE_FORMAT(billing.charged_datetime, "%Y"), SUM(billing.amount)
FROM clients
JOIN billing ON clients.client_id = billing.client_id
GROUP BY clients.client_id, MONTH(billing.charged_datetime)
ORDER BY clients.client_id, billing.charged_datetime;

SELECT clients.first_name, clients.last_name as name, DATE_FORMAT(billing.charged_datetime, "%M"), DATE_FORMAT(billing.charged_datetime, "%Y"), SUM(billing.amount)
FROM clients
JOIN billing ON clients.client_id = billing.client_id
GROUP BY clients.client_id, MONTH(billing.charged_datetime)
ORDER BY clients.client_id, billing.charged_datetime;

SELECT CONCAT(clients.first_name, ' ',clients.last_name) as client_name, GROUP_CONCAT(sites.domain_name) as sites
FROM clients
JOIN sites ON clients.client_id = sites.client_id
GROUP BY client_name
ORDER BY clients.client_id;