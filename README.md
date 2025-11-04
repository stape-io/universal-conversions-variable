# Universal Conversions Variable for Google Tag Manager Web Container

The **Universal Conversions Variable for Google Tag Manager Web container** allows you to map multiple parameters into the formats required by platform destinations (Meta, TikTok, GA4, Reddit, etc.), such as:
- **product** array
- **value**
- **item count**
- etc.

- ### Product ID Formatting

This template includes advanced options for formatting the product IDs sent to various platforms.

| Field | Description |
| :--- | :--- |
| **Product ID Format** | A dropdown menu to select which ID to use. <br> - **Default:** Uses the original `Product ID/SKU` field. <br> - **Variant ID:** Uses the ID from the `Item Variant ID Key` field. <br> - **SKU:** Uses the ID from the `Item SKU Key` field. <br> - **Custom Shopify:** Builds a custom string in the format `shopify_MARKET_prod_var`. |
| **Item Variant ID Key** | **Required for 'Variant ID' & 'Custom Shopify'.** The Data Layer key for your item's variant ID (e.g., `item_variant`). |
| **Item SKU Key** | **Required for 'SKU'.** The Data Layer key for your item's SKU (e.g., `item_sku`). |
| **Market Code** | **Used for 'Custom Shopify'.** The market code (e.g., `GB`, `US`) to be prefixed to the custom ID. |

It currenly supports the following platforms:
- Meta Pixel/CAPI
- Google Analytics 4
- TikTok CAPI
- Twitter CAPI
- Microsoft Ads
- Klaviyo
- Snapchat
- Google Ads Offline
- Pinterest
- Rakuten
- Criteo
- Reddit

## Open Source

The **Universal Conversions Variable for Web GTM** is developed and maintained by [Stape Team](https://stape.io/) under the Apache 2.0 license.
