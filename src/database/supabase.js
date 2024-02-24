const { createClient } = require('@supabase/supabase-js');
const { database } = require('../config/config');

const supabase = createClient(database.url, database.apiKey);

module.exports = supabase;