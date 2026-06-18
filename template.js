const copyFromDataLayer = require('copyFromDataLayer');
const makeInteger = require('makeInteger');
const makeNumber = require('makeNumber');
const makeString = require('makeString');
const makeTableMap = require('makeTableMap');
const getType = require('getType');
const Math = require('Math');
const Object = require('Object');

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

if (getType(inputArray) === 'array' && inputArray.length) return runTask();
else return;

/*==============================================================================
  Vendor related functions
==============================================================================*/

function runTask() {
  const platform = data.platform;
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
