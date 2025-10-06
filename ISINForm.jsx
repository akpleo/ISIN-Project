import React, { useState } from 'react';
import { sendISINRequest } from './api';

function ISINForm() {
  const [formData, setFormData] = useState({
    old_isin: '',
    new_isin: '',
    chck_count: 'N',
    edit_insin: '0',
    issplit: '0',
    split_rat: '',
    isbonus: '0'
  });

  const [result, setResult] = useState(null);

  const handleChange = (e) => {
    setFormData({ ...formData, [e.target.name]: e.target.value });
  };

  const handleSubmit = async (e) => {
    e.preventDefault();
    const data = await sendISINRequest(formData);
    setResult(data);
  };

  return (
    <div className="form-wrapper">
      <h2>ISIN Update Tool</h2>
      <form onSubmit={handleSubmit}>
        {['old_isin', 'new_isin'].map((field) => (
          <div className="form-group" key={field}>
            <label>{field.replace('_', ' ').toUpperCase()}</label>
            <input
              type="text"
              name={field}
              value={formData[field]}
              onChange={handleChange}
              required
            />
          </div>
        ))}

        {['chck_count', 'edit_insin', 'issplit', 'isbonus'].map((field) => (
          <div className="form-group" key={field}>
            <label>{field.replace('_', ' ').toUpperCase()}</label>
            <select name={field} value={formData[field]} onChange={handleChange}>
              <option value="0">No</option>
              <option value="1">Yes</option>
            </select>
          </div>
        ))}

        {formData.issplit === '1' && (
          <div className="form-group">
            <label>SPLIT RATIO</label>
            <input
              type="number"
              name="split_rat"
              value={formData.split_rat}
              onChange={handleChange}
              required
            />
          </div>
        )}

        <button type="submit" className="submit-btn">Submit</button>
      </form>

      {result && (
        <div className="result-box">
          <h3>Result</h3>
          <pre>{JSON.stringify(result, null, 2)}</pre>
        </div>
      )}
    </div>
  );
}

export default ISINForm;
