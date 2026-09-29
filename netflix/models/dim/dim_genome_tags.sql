WITH source_tags AS(
    SELECT * FROM {{ ref('source_genome_tags') }}
)

SELECT 
    tag_Id,
    INITCAP(TRIM(tag)) AS tag_name,
FROM source_tags