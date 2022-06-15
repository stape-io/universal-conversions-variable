const makeInteger = require('makeInteger');
const getType = require('getType');
const math = require('Math');

let keyId = data.keyId;
let keyPr = data.keyPr;
let keyNm = data.keyNm;
let keyQt = data.keyQt;
let keyVar = data.keyVar;
let keyCat = data.keyCat;
let keyImg = data.keyImg;
let keyListName = data.keyListName;
let keyListId = data.keyListId;
let contentType = data.contentType;
let task;


if (!data.orderItems || !data.orderItems.length)
    return ;
else
    return runTask();


function runTask() {

    if (data.meta_task)
        task = data.meta_task;

    if (data.ga4_task)
        task = data.ga4_task;

    if (data.tiktok_task)
        task = data.tiktok_task;

    if (data.twitter_task)
        task = data.twitter_task;

    if (data.microsoft_task)
        task = data.microsoft_task;

    if (data.klaviyo_task)
        task = data.klaviyo_task;

    if (data.snap_task)
        task = data.snap_task;

    if (task === 'contents')
        return getContents(data.orderItems, data.platform);

    if (task === 'ids')
        return getContentIds(data.orderItems);

    if (task === 'name')
        return getContentName(data.orderItems);

    if (task === 'value')
        return getValue(data.orderItems);

    if (task === 'numitems')
        return getNumItems(data.orderItems);

    if (task === 'items')
        return getItems(data.orderItems, data.platform);

    if (task === 'item')
        return getItem(data.orderItems);
}


function getItem(arr) {

    let cat = [];
    cat.push(arr[0][keyCat]);

    return {
        'ProductID': arr[0][keyId],
        'ProductName': arr[0][keyNm],
        'Price': arr[0][keyPr],
        'ImageURL': arr[0][keyImg],
        'Categories': cat
    };
}


function getContents(arr, platform) {

    let contents = [];

    for (let i = 0; i < arr.length; i++) {

        let qt = 1;
        if (arr[i][keyQt])
            qt = arr[i][keyQt];

        if (platform === 'meta') {
            contents.push({
                'id': arr[i][keyId],
                'quantity': qt,
                'item_price': arr[i][keyPr]
            });
        }

        if (platform === 'tiktok') {
            contents.push({
                'content_id': arr[i][keyId],
                'content_type': contentType,
                'quantity': qt,
                'price': arr[i][keyPr]
            });
        }

    }

    return contents;
}


function getContentIds(arr) {

    let content_ids = [];

    for (let i = 0; i < arr.length; i++) {
        content_ids.push(arr[i][keyId]);
    }

    return content_ids;
}


function getValue(arr) {

    let value = 0;

    for (let i = 0; i < arr.length; i++) {

        if (arr[i][keyQt]) {

            if (getType(arr[i][keyQt]) === 'string')
                value = value + makeInteger(arr[i][keyQt]) * arr[i][keyPr];
            else
                value = value + arr[i][keyQt] * arr[i][keyPr];

        }
        else
            value = value + arr[i][keyPr];
    }

    return math.round(value * 100) / 100;

}


function getItems(arr, platform) {

    let items = [];

    for (let i = 0; i < arr.length; i++) {

        let qt = 1;
        if (arr[i][keyQt])
            qt = arr[i][keyQt];

        if (platform === 'ga4') {
            items.push({
                'item_id': arr[i][keyId],
                'item_name': arr[i][keyNm],
                'quantity': qt,
                'price': arr[i][keyPr],
                'item_category': arr[i][keyCat],
                'item_variant': arr[i][keyVar],
                'item_list_id': arr[i][keyListId],
                'item_list_name': arr[i][keyListName]
            });
        }

        if (platform === 'klaviyo') {

            let cat = [];
            cat.push(arr[i][keyCat]);

            items.push({
                'ProductID': arr[i][keyId],
                'ProductName': arr[i][keyNm],
                'Quantity': qt,
                'ItemPrice': arr[i][keyPr],
                'ImageURL': arr[i][keyImg],
                'ProductCategories': cat
            });
        }
    }

    return items;
}


function getNumItems(arr) {

    let num_items = 0;

    for (let i = 0; i < arr.length; i++) {

        if (arr[i][keyQt]) {

            if (getType(arr[i][keyQt]) === 'string')
                num_items = num_items + makeInteger(arr[i][keyQt]);
            else
                num_items = num_items + arr[i][keyQt];
        }
        else
            num_items = num_items + 1;

    }

    return num_items;
}


function getContentName(arr) {

    let content_name = '';

    if (arr.length === 1)
        content_name = arr[0][keyNm];

    return content_name;
}
