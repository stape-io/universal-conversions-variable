const copyFromDataLayer = require('copyFromDataLayer');
const getUrl = require('getUrl');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const Math = require('Math');
const Object = require('Object');
const parseUrl = require('parseUrl');

/*==============================================================================
==============================================================================*/

const keyId = data.keyId;
const keyPr = data.keyPr;
const keyNm = data.keyNm;
const keyQt = data.keyQt;
const keyCat = data.keyCat;
const keyImg = data.keyImg;
const taxDeductPercent = toFixed2(makeNumber(data.taxDeductPercent));
const keyDisc = data.keyDiscItemLevel;
const customParamMap = data.customParams
  ? makeTableMap(data.customParams, 'cusKey', 'cusName')
  : {};
const keyCatList = data.keyCatList ? data.keyCatList.split(',') : [];
const inputArray = data.orderItems;
const idBuilder = data.buildIdFromPattern ? createIdBuilder() : undefined;

if (getType(inputArray) === 'array' && inputArray.length) return runTask();
else return;

/*==============================================================================
  Vendor related functions
==============================================================================*/

function runTask() {
  const platform = data.platform;
  if (platform === 'generic') {
    return data.generic_task === 'ids' ? getContentIds(inputArray) : getGenericItems(inputArray);
  }

  const dataKeys = Object.keys(data);
  let task;

  for (const key of dataKeys) {
    if (endsWith(key, '_task') && data[key]) {
      task = data[key];
      break;
    }
  }

  switch (task) {
    case 'contents':
      return getContents(inputArray, platform);
    case 'ids':
      return getContentIds(inputArray);
    case 'name':
      return getContentName(inputArray);
    case 'value':
      return getValue(inputArray);
    case 'numitems':
      return getNumItems(inputArray);
    case 'items':
      return getItems(inputArray, platform);
    case 'item':
      return getItem(inputArray);
  }
}

function getId(item) {
  let id = item[keyId];

  if (data.useAdditionalKeyId && data.keyIdAdditional && item[data.keyIdAdditional]) {
    id = item[data.keyIdAdditional];
  }

  if (idBuilder) return buildItemId(item, id);

  if (data.formatIdInShopifyFormat && data.shopifyKeyVariant && item[data.shopifyKeyVariant]) {
    const marketCode = data.shopifyMarketCode || 'ZZ';
    if (id) id = 'shopify_' + marketCode + '_' + id + '_' + item[data.shopifyKeyVariant];
  }

  return id;
}

function getNumItems(arr) {
  const num_items = arr.reduce((acc, curr) => {
    const quantity = curr[keyQt] ? makeInteger(curr[keyQt]) : 1;
    return acc + quantity;
  }, 0);
  return num_items;
}

function getContentName(arr) {
  if (arr.length !== 1) return '';
  return arr[0][keyNm];
}

function getContentIds(arr) {
  const content_ids = arr.map((item) => getId(item));
  return content_ids;
}

function getItem(arr) {
  let cat = [];
  cat.push(arr[0][keyCat]);

  let item = {
    ProductID: getId(arr[0]),
    ProductName: arr[0][keyNm],
    Price: arr[0][keyPr],
    ImageURL: arr[0][keyImg],
    Categories: cat
  };

  return item;
}

function getValue(arr) {
  const value = arr.reduce((acc, curr) => {
    const itemPrice = curr[keyPr] ? makeNumber(curr[keyPr]) : 0;
    const itemQuantity = curr[keyQt];
    return acc + (itemQuantity ? makeInteger(itemQuantity) * itemPrice : itemPrice);
  }, 0);

  const platform = data.platform;
  if (platform === 'openai') {
    const keyCurrency = data.keyCurrency || 'currency';
    const currency = arr[0][keyCurrency] || copyFromDataLayer(keyCurrency);
    return convertCurrencyValueToMinorUnit(value, currency);
  }

  return toFixed2(value);
}

function getContents(arr, platform) {
  let contents = [];

  for (let i = 0; i < arr.length; i++) {
    let qt = 1;
    if (arr[i][keyQt]) qt = makeNumber(arr[i][keyQt]);

    if (platform === 'meta') {
      contents.push({
        id: getId(arr[i]),
        quantity: qt,
        item_price: arr[i][keyPr]
      });
    }

    if (platform === 'tiktok') {
      const contentType = data.contentType;
      const id = getId(arr[i]);
      contents.push({
        content_id: id ? makeString(id) : undefined,
        content_type: contentType,
        content_category: arr[i][keyCat],
        content_name: arr[i][keyNm],
        quantity: qt,
        price: arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }

    if (platform === 'twitter') {
      contents.push({
        content_id: getId(arr[i]),
        content_name: arr[i][keyNm],
        content_type: arr[i][keyCat],
        num_items: qt,
        content_price: arr[i][keyPr]
      });
    }

    if (platform === 'pinterest') {
      contents.push({
        quantity: qt,
        item_price: arr[i][keyPr] ? makeString(arr[i][keyPr]) : '0'
      });
    }

    if (platform === 'openai') {
      const keyCurrency = data.keyCurrency || 'currency';
      const contentType = data.contentTypeOpenAI;
      const id = getId(arr[i]);
      const amount = arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0;
      const currency = arr[i][keyCurrency] || copyFromDataLayer(keyCurrency);
      contents.push({
        id: id ? makeString(id) : undefined,
        name: arr[i][keyNm] ? makeString(arr[i][keyNm]) : undefined,
        quantity: qt,
        amount: convertCurrencyValueToMinorUnit(amount, currency),
        content_type: contentType,
        currency: currency
      });
    }
  }

  return contents;
}

function getItems(arr, platform) {
  let items = [];
  let totalDiscount = 0;
  if (data.discConfig === 'order_level') {
    totalDiscount = makeNumber(data.discOrderLevel);

    if (data.taxDiscountConfig == 'discDeduct') {
      totalDiscount = totalDiscount / (taxDeductPercent / 100 + 1);
    }
  }

  for (let i = 0; i < arr.length; i++) {
    let qt = 1;
    if (arr[i][keyQt]) qt = makeInteger(arr[i][keyQt]);

    if (platform === 'ga4') {
      let itemObj = {
        item_id: getId(arr[i]),
        item_name: arr[i][keyNm],
        quantity: qt,
        price: arr[i][keyPr],
        item_category: arr[i][keyCat]
      };

      for (let prop in customParamMap) {
        if (customParamMap[prop]) {
          if (prop === 'discountamountqty') itemObj[customParamMap[prop]] = arr[i][prop] * qt;
          else itemObj[customParamMap[prop]] = arr[i][prop];
        }
      }

      items.push(itemObj);
    }

    if (platform === 'klaviyo') {
      let cat = [];
      cat.push(arr[i][keyCat]);

      let itemObj = {
        ProductID: getId(arr[i]),
        ProductName: arr[i][keyNm],
        Quantity: qt,
        ItemPrice: arr[i][keyPr],
        ImageURL: arr[i][keyImg],
        ProductCategories: cat
      };

      for (let prop in customParamMap) {
        if (customParamMap[prop]) {
          itemObj[customParamMap[prop]] = arr[i][prop];
        }
      }

      items.push(itemObj);
    }

    if (platform === 'criteo') {
      let itemObj = {
        id: getId(arr[i]),
        quantity: qt,
        price: arr[i][keyPr]
      };

      items.push(itemObj);
    }

    if (platform === 'gAdsOff') {
      const id = getId(arr[i]);
      items.push({
        productId: id ? makeString(id) : undefined,
        quantity: qt,
        unitPrice: makeNumber(arr[i][keyPr])
      });
    }

    if (platform === 'pinterest') {
      items.push({
        product_id: getId(arr[i]),
        product_name: arr[i][keyNm],
        product_quantity: qt,
        product_price: arr[i][keyPr] ? makeNumber(arr[i][keyPr]) : 0
      });
    }

    if (platform === 'reddit') {
      const id = getId(arr[i]);
      items.push({
        id: id ? makeString(id) : undefined,
        category: arr[i][keyCat],
        name: arr[i][keyNm]
      });
    }

    if (platform === 'rakuten') {
      //let p = arr[i][keyPr];
      let p = toFixed2(makeNumber(arr[i][keyPr]));
      let price;

      if (data.taxPriceConfig === 'priceDeduct' && taxDeductPercent && taxDeductPercent > 0) {
        let tmp = p / (taxDeductPercent / 100 + 1);
        price = toFixed2(tmp) * 100 * qt;
        price = toFixed2(price);
      }

      if (data.discConfig === 'item_level' && arr[i][keyDisc]) {
        let tmp;
        let disc = makeNumber(arr[i][keyDisc]); //.replace(',','')
        if (data.taxDiscountConfig == 'discDeduct' && taxDeductPercent && taxDeductPercent > 0) {
          disc = disc / (taxDeductPercent / 100 + 1);
        }

        totalDiscount = toFixed2(makeNumber(totalDiscount) + toFixed2(disc));
      }

      let itemObj = {
        sku: getId(arr[i]),
        product_name: arr[i][keyNm],
        quantity: qt,
        amount: price > 0 ? price : toFixed2(p * 100 * qt),
        optional_data: {}
      };

      if (keyCatList.length > 0) {
        let catArr = [];
        keyCatList.forEach((element) => catArr.push(arr[i][element]));
        itemObj.optional_data = { category: catArr.join(' > ') };
      }

      for (let prop in customParamMap) {
        if (customParamMap[prop]) {
          itemObj.optional_data[customParamMap[prop]] = arr[i][prop];
        }
      }

      items.push(itemObj);
    }
  }

  if (platform === 'rakuten' && totalDiscount > 0) {
    items.push({
      sku: 'Discount',
      quantity: '0',
      amount: toFixed2((totalDiscount - totalDiscount * 2) * 100),
      product_name: 'Discount'
    });
  }

  return items;
}

/*==============================================================================
  Helpers
==============================================================================*/

function toFixed2(value) {
  if (!value) return value;
  return Math.round(makeNumber(value) * 100) / 100;
}

function endsWith(str, suffix) {
  return str.indexOf(suffix, str.length - suffix.length) !== -1;
}

function convertCurrencyValueToMinorUnit(value, currency) {
  if (!value) return value;

  // prettier-ignore
  const zeroDecimalCurrencies = [
    'BIF', 'CLP', 'DJF', 'GNF', 'IDR', 'ISK',
    'JPY', 'KMF', 'KRW', 'MGA', 'PYG', 'RWF',
    'UGX', 'VND', 'VUV', 'XAF', 'XOF', 'XPF'
  ];
  const threeDecimalCurrencies = ['BHD', 'IQD', 'JOD', 'KWD', 'LYD', 'OMR', 'TND'];
  const upperCurrency = currency ? makeString(currency).toUpperCase() : '';

  let multiplier = 100; // default: 2 decimal places (BRL, USD, EUR, GBP, etc.)
  if (zeroDecimalCurrencies.indexOf(upperCurrency) !== -1) multiplier = 1;
  else if (threeDecimalCurrencies.indexOf(upperCurrency) !== -1) multiplier = 1000;

  return makeInteger(toFixed2(value * multiplier));
}

/*==============================================================================
  Item ID Builder
==============================================================================*/

function getGenericItems(inputArray) {
  return inputArray.map((item) => {
    if (getType(item) !== 'object') return item;
    const genericItem = {};
    Object.keys(item).forEach((key) => {
      genericItem[key] = item[key];
    });
    const id = getId(item);
    if (id !== undefined) genericItem[keyId] = id;
    return genericItem;
  });
}

function createIdBuilder() {
  const variables = {};
  (data.idPatternVariables || []).forEach((row) => {
    if (row && row.name) variables[makeString(row.name).trim()] = row;
  });

  return {
    pattern: parsePattern(data.idPattern),
    fallbackPattern:
      data.onMissingToken === 'fallback' ? parsePattern(data.idFallbackPattern) : undefined,
    variables: variables,
    hostnameToken: data.useHostnameLookup
      ? makeString(data.hostnameLookupToken || '').trim() || 'country'
      : undefined,
    hostnameValue: data.useHostnameLookup ? lookupHostnameValue() : undefined
  };
}

function parsePattern(pattern) {
  if (pattern === undefined || pattern === null || pattern === '') return undefined;
  pattern = makeString(pattern);

  const parts = [];
  let hasToken = false;
  let cursor = 0;
  while (cursor < pattern.length) {
    const close = pattern.indexOf('}', cursor);
    const open = close === -1 ? -1 : pattern.lastIndexOf('{', close);
    const tokenName = open >= cursor ? pattern.substring(open + 1, close).trim() : '';

    if (!tokenName) {
      const end = close === -1 ? pattern.length : close + 1;
      parts.push({ text: pattern.substring(cursor, end) });
      cursor = end;
    } else {
      if (open > cursor) parts.push({ text: pattern.substring(cursor, open) });
      parts.push({ token: tokenName });
      hasToken = true;
      cursor = close + 1;
    }
  }
  return hasToken ? parts : undefined;
}

function buildItemId(item, originalId) {
  let id = buildIdFromParts(idBuilder.pattern, item, originalId);
  if (id === undefined) id = buildIdFromParts(idBuilder.fallbackPattern, item, originalId);
  return id === undefined ? stripShopifyGid(originalId) : id;
}

function buildIdFromParts(parts, item, originalId) {
  if (!parts) return undefined;

  let id = '';
  for (let i = 0; i < parts.length; i++) {
    if (parts[i].token) {
      const value = resolveToken(parts[i].token, item, originalId);
      if (value === undefined) return undefined;
      id += value;
    } else {
      id += parts[i].text;
    }
  }
  return id;
}

function resolveToken(name, item, originalId) {
  let value;
  if (name === 'id') {
    value = originalId;
  } else if (name === idBuilder.hostnameToken) {
    value = idBuilder.hostnameValue;
  } else if (idBuilder.variables.hasOwnProperty(name)) {
    const variable = idBuilder.variables[name];
    value =
      variable.source === 'itemKey'
        ? getItemValue(item, makeString(variable.value || '').trim())
        : variable.value;
  } else {
    value = getItemValue(item, name);
  }
  return cleanTokenValue(value);
}

function getItemValue(item, path) {
  if (!path) return undefined;
  if (item[path] !== undefined) return item[path];

  const keys = path.split('.');
  let value = item;
  for (let i = 0; i < keys.length; i++) {
    const type = getType(value);
    if (type !== 'object' && type !== 'array') return undefined;
    value = value[keys[i]];
  }
  return value;
}

function cleanTokenValue(value) {
  const type = getType(value);
  if (type !== 'string' && type !== 'number' && type !== 'boolean') return undefined;

  const stringValue = stripShopifyGid(makeString(value).trim());
  return stringValue === '' ? undefined : stringValue;
}

function stripShopifyGid(value) {
  if (!data.stripShopifyGid || getType(value) !== 'string' || value.indexOf('gid://') !== 0) {
    return value;
  }
  return value.substring(value.lastIndexOf('/') + 1);
}

function lookupHostnameValue() {
  const hostname = normalizeHostname(data.hostnameLookupSource || getUrl('host'));
  const rows = data.hostnameLookupTable || [];
  for (let i = 0; i < rows.length; i++) {
    if (hostname && normalizeHostname(rows[i].hostname) === hostname) {
      const value = rows[i].tokenValue;
      if (value !== undefined && value !== null && makeString(value).trim() !== '') return value;
      break;
    }
  }
  return data.hostnameLookupDefault;
}

function normalizeHostname(hostname) {
  if (!hostname) return '';
  let host = makeString(hostname).trim().toLowerCase();
  if (host.indexOf('://') !== -1) {
    const url = parseUrl(host);
    host = url && url.hostname ? url.hostname : '';
  }
  if (host.indexOf('www.') === 0) host = host.substring(4);
  return host;
}
