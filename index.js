function sendRequest(params) {
  const formData = new URLSearchParams(params);
  fetch('/update-isin/', {
    method: 'POST',
    body: formData
  })
    .then(res => res.json())
    .then(data => renderTable(data))
    .catch(err => {
      document.getElementById('result').innerHTML = '<p style="color:red;">Error: ' + err + '</p>';
    });
}

function checkCount() {
  const params = {
    old_isin: document.getElementById('old_isin').value,
    new_isin: document.getElementById('new_isin').value,
    chck_count: 'Y',
    edit_insin: '0',
    issplit: '0',
    isbonus: '0',
    split_rat: '0'
  };
  sendRequest(params);
}

function applySplit() {
  document.getElementById('split_ratio_group').style.display = 'block';
}

function confirmSplit() {
  const params = {
    old_isin: document.getElementById('old_isin').value,
    new_isin: document.getElementById('new_isin').value,
    chck_count: 'N',
    edit_insin: '0',
    issplit: '1',
    isbonus: '0',
    split_rat: document.getElementById('split_rat').value
  };
  sendRequest(params);
  document.getElementById('split_ratio_group').style.display = 'none';
}

function applyBonus() {
  const params = {
    old_isin: document.getElementById('old_isin').value,
    new_isin: document.getElementById('new_isin').value,
    chck_count: 'N',
    edit_insin: '0',
    issplit: '0',
    isbonus: '1',
    split_rat: '0'
  };
  sendRequest(params);
}

function renderTable(data) {
  let html = '<table><thead><tr><th>ISIN</th><th>Count</th><th>Quantity</th></tr></thead><tbody>';
  const counts = data.count || [];
  const qtys = data.qty || [];

  counts.forEach(row => {
    const qtyRow = qtys.find(q => q.tio_tISIN === row.tio_tISIN);
    html += `<tr>
      <td>${row.tio_tISIN}</td>
      <td>${row.count}</td>
      <td>${qtyRow ? qtyRow.qty : '-'}</td>
    </tr>`;
  });

  html += '</tbody></table>';

  if (data.split) html += `<p><strong>${data.split}</strong></p>`;
  if (data.bonus) html += `<p><strong>${data.bonus}</strong></p>`;
  if (data.error) html += `<p style="color:red;"><strong>${data.error}</strong></p>`;

  document.getElementById('result').innerHTML = html;
}
