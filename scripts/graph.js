const {jsonToGraphQLQuery} = require('json-to-graphql-query');


const json = {
    "language": "en",
    "vendor": "lululemon-m",
    "currency": "USD",
    "source": "https://shop.lululemon.com/",
    "index_urls": [
        {
                "url": "https://shop.lululemon.com/api/c/womens-leggings/_/N-8s6?page=2&page_size=45",
                "gender": "womens",
                "category": "lingerie",
        }
    ],
    "products_meta": {
        "pagination_meta": {
            "page_url_field": "page",
            "pagination_style": "classic",
            "pagniates_from_zero": false,
            "total_pages_field_path": {
                "path_steps": [
                    {
                        "data_type": "object",
                        "field_name": "data"
                    },
                    {
                        "data_type": "object",
                        "field_name": "attributes"
                    },
                    {
                        "data_type": "list",
                        "field_name": "main-content"
                    },
                    {
                        "data_type": "object",
                        "nth_list_item": 0
                    },
                    {
                        "data_type": "number",
                        "field_name": "total-num-recs"
                    }
                ]
            },
            "items_per_page": 45
        },
        "product_list_path": [
            {
                "data_type": "object",
                "field_name": "data"
            },
            {
                "data_type": "object",
                "field_name": "attributes"
            },
            {
                "data_type": "list",
                "field_name": "main-content"
            },
            {
                "data_type": "object",
                "nth_list_item": 0
            },
            {
                "data_type": "list",
                "field_name": "records"
            }
        ],
        "product_fields": {
            "external_id": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "repository-id"
                    }
                ]
            },
            "review_query": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "bazaar-voice-id"
                    }
                ],
                "text_transform": {
                    "prepend_text": "id:eq:"
                }
            },
            "name": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "display-name"
                    }
                ],
                "text_transform": {
                    "replace": {
                        "to_be_replaced": "*",
                        "replacement": ""
                    }
                }
            },
            "image": {
                "path_steps": [
                    {
                        "data_type": "list",
                        "field_name": "sku-sku-images"
                    },
                    {
                        "data_type": "string",
                        "nth_list_item": 0
                    }
                ]
            },
            "url": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "pdp-url"
                    }
                ],
                "text_transform": {
                    "prepend_text": "https://shop.lululemon.com"
                }
            },
            "price": {
                "path_steps": [
                    {
                        "data_type": "list",
                        "field_name": "list-price"
                    },
                    {
                        "data_type": "string",
                        "nth_list_item": 0
                    }
                ]
            },
        }
    },
    "reviews_meta": {
        "url": "https://api.bazaarvoice.com/data/batch.json?passkey=caOGkxt5ZGxRUy0oZU3zbSlV36IBwxAijWghipc2FSoQY&apiversion=5.5&displaycode=7834-en_us&resource.q0=products&filter.q0=id%3Aeq%3ADeep_Sea_Swim_Top_D&stats.q0=reviews&filteredstats.q0=reviews&filter_reviews.q0=contentlocale%3Aeq%3Aen_US&filter_reviewcomments.q0=contentlocale%3Aeq%3Aen_US&resource.q1=reviews&filter.q1=isratingsonly%3Aeq%3Afalse&filter.q1=productid%3Aeq%3ADeep_Sea_Swim_Top_D&filter.q1=contentlocale%3Aeq%3Aen_US&sort.q1=submissiontime%3Adesc&stats.q1=reviews&filteredstats.q1=reviews&include.q1=authors%2Cproducts%2Ccomments&filter_reviews.q1=contentlocale%3Aeq%3Aen_US&filter_reviewcomments.q1=contentlocale%3Aeq%3Aen_US&filter_comments.q1=contentlocale%3Aeq%3Aen_US&limit.q1=8&offset.q1=0&limit_comments.q1=3",
        "product_url_field": "filter.q0",
        "pagination_meta": {
            "page_url_field": "offset.q1",
            "pagination_style": "offset",
            "pagniates_from_zero": false,
            "total_pages_field_path": {
                "path_steps": [
                    {
                        "data_type": "object",
                        "field_name": "BatchedResults"
                    },
                    {
                        "data_type": "object",
                        "field_name": "q1"
                    },
                    {
                        "data_type": "number",
                        "field_name": "TotalResults"
                    },
                ]
            },
            "items_per_page": 10
        },
        "review_list_path": [
            {
                "data_type": "object",
                "field_name": "BatchedResults"
            },
            {
                "data_type": "object",
                "field_name": "q1"
            },
            {
                "data_type": "list",
                "field_name": "Results"
            },
        ],
        "review_fields": {
            "external_id": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "Id"
                    }
                ]
            },
            "comment": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "ReviewText"
                    }
                ],
            },
            "rating": {
                "path_steps": [
                    {
                        "data_type": "number",
                        "field_name": "Rating"
                    }
                ]
            },
            "rating_total": {
                "path_steps": [
                    {
                        "data_type": "number",
                        "field_name": "RatingRange"
                    }
                ]
            },
            "title": {
                "path_steps": [
                    {
                        "data_type": "string",
                        "field_name": "Title"
                    }
                ],
            },
        }
    }
}



const graphql_query = jsonToGraphQLQuery(json, { pretty: true });

console.log(graphql_query)