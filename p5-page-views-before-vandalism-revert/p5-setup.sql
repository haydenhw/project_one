CREATE TABLE pagehistory (
    wiki_db STRING,
    event_entity STRING,
    event_type STRING,
    event_timestamp STRING,
    event_comment_escaped STRING,
    event_user_id STRING,
    event_user_text_historical_escaped STRING,
    event_user_text_escaped STRING,
    event_user_blocks_historical_string STRING,
    event_user_blocks_string STRING,
    event_user_groups_historical_string STRING,
    event_user_groups_string STRING,
    event_user_is_bot_by_historical_string STRING,
    event_user_is_bot_by_string STRING,
    event_user_is_created_by_self STRING,
    event_user_is_created_by_system STRING,
    event_user_is_created_by_peer STRING,
    event_user_is_anonymous STRING,
    event_user_registration_timestamp STRING,
    event_user_creation_timestamp STRING,
    event_user_first_edit_timestamp STRING,
    event_user_revision_count STRING,
    event_user_seconds_since_previous_revision STRING,
    page_id STRING,
    page_title_historical_escaped STRING,
    page_title_escaped STRING,
    page_namespace_historical STRING,
    page_namespace_is_content_historical STRING,
    page_namespace STRING,
    page_namespace_is_content STRING,
    page_is_redirect STRING,
    page_is_deleted STRING,
    page_creation_timestamp STRING,
    page_first_edit_timestamp STRING,
    page_revision_count STRING,
    page_seconds_since_previous_revision STRING,
    user_id STRING,
    user_text_historical_escaped STRING,
    user_text_escaped STRING,
    user_blocks_historical_string STRING,
    user_blocks_string STRING,
    user_groups_historical_string STRING,
    user_groups_string STRING,
    user_is_bot_by_historical_string STRING,
    user_is_bot_by_string STRING,
    user_is_created_by_self STRING,
    user_is_created_by_system STRING,
    user_is_created_by_peer STRING,
    user_is_anonymous STRING,
    user_registration_timestamp STRING,
    user_creation_timestamp STRING,
    user_first_edit_timestamp STRING,
    revision_id STRING,
    revision_parent_id STRING,
    revision_minor_edit STRING,
    revision_deleted_parts_string STRING,
    revision_deleted_parts_are_suppressed STRING,
    revision_text_bytes STRING,
    revision_text_bytes_diff STRING,
    revision_text_sha1 STRING,
    revision_content_model STRING,
    revision_content_format STRING,
    revision_is_deleted_by_page_deletion STRING,
    revision_deleted_by_page_deletion_timestamp STRING,
    revision_is_identity_reverted STRING,
    revision_first_identity_reverting_revision_id STRING,
    revision_seconds_to_identity_revert INT,
    revision_is_identity_revert STRING,
    revision_is_from_before_page_creation STRING,
    revision_tags_string STRING
)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE;

LOAD DATA LOCAL INPATH '/home/hayden/revature/projects/one/data/page_history_enwiki/2020-12.enwiki.2020-12.tsv'
INTO TABLE pagehistory;
  
CREATE TABLE pageviews_per_hour
AS
SELECT 
  (SUM(count_views_adj) / 24) AS pageviews_per_hour  
FROM pageviews_dec25_adjusted;
  

CREATE TABLE average_hours_to_revert_edit
AS
SELECT 
  (AVG(revision_seconds_to_identity_revert)/60/60) AS average_hours_to_revert_edit
FROM pagehistory
WHERE revision_seconds_to_identity_revert < 610000 
  OR revision_seconds_to_identity_revert > 660000;



  