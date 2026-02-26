// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(
      _current != null,
      'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.',
    );
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(
      instance != null,
      'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?',
    );
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `Load failed`
  String get load_failed {
    return Intl.message('Load failed', name: 'load_failed', desc: '', args: []);
  }

  /// `Dog image random`
  String get dog_image_random {
    return Intl.message(
      'Dog image random',
      name: 'dog_image_random',
      desc: '',
      args: [],
    );
  }

  /// `Load image`
  String get load_image {
    return Intl.message('Load image', name: 'load_image', desc: '', args: []);
  }

  /// `Home`
  String get home {
    return Intl.message('Home', name: 'home', desc: '', args: []);
  }

  /// `Press button`
  String get press_button {
    return Intl.message(
      'Press button',
      name: 'press_button',
      desc: '',
      args: [],
    );
  }

  /// `Setting`
  String get setting {
    return Intl.message('Setting', name: 'setting', desc: '', args: []);
  }

  /// `English`
  String get english {
    return Intl.message('English', name: 'english', desc: '', args: []);
  }

  /// `Vietnamese`
  String get vietnamese {
    return Intl.message('Vietnamese', name: 'vietnamese', desc: '', args: []);
  }

  /// `Dark mode`
  String get dark_mode {
    return Intl.message('Dark mode', name: 'dark_mode', desc: '', args: []);
  }

  /// `Assets gen`
  String get assets {
    return Intl.message('Assets gen', name: 'assets', desc: '', args: []);
  }

  /// `Load and insert DB`
  String get load_and_insert_db {
    return Intl.message(
      'Load and insert DB',
      name: 'load_and_insert_db',
      desc: '',
      args: [],
    );
  }

  /// `Image from DB`
  String get image_from_db {
    return Intl.message(
      'Image from DB',
      name: 'image_from_db',
      desc: '',
      args: [],
    );
  }

  /// `Delete success`
  String get delete_success {
    return Intl.message(
      'Delete success',
      name: 'delete_success',
      desc: '',
      args: [],
    );
  }

  /// `Delete failed`
  String get delete_failed {
    return Intl.message(
      'Delete failed',
      name: 'delete_failed',
      desc: '',
      args: [],
    );
  }

  /// `Floor didnt support`
  String get didnt_supported {
    return Intl.message(
      'Floor didnt support',
      name: 'didnt_supported',
      desc: '',
      args: [],
    );
  }

  /// `App language`
  String get app_language {
    return Intl.message(
      'App language',
      name: 'app_language',
      desc: '',
      args: [],
    );
  }

  /// `Create an account`
  String get create_account_title {
    return Intl.message(
      'Create an account',
      name: 'create_account_title',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get email_hint {
    return Intl.message('Email', name: 'email_hint', desc: '', args: []);
  }

  /// `Password`
  String get password_hint {
    return Intl.message('Password', name: 'password_hint', desc: '', args: []);
  }

  /// `Confirm Password`
  String get confirm_password_hint {
    return Intl.message(
      'Confirm Password',
      name: 'confirm_password_hint',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get continue_button {
    return Intl.message(
      'Continue',
      name: 'continue_button',
      desc: '',
      args: [],
    );
  }

  /// `Already have an account? `
  String get already_have_account {
    return Intl.message(
      'Already have an account? ',
      name: 'already_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Passwords do not match`
  String get passwords_do_not_match {
    return Intl.message(
      'Passwords do not match',
      name: 'passwords_do_not_match',
      desc: '',
      args: [],
    );
  }

  /// `Sign in`
  String get sign_in_action {
    return Intl.message('Sign in', name: 'sign_in_action', desc: '', args: []);
  }

  /// `Sign in with email`
  String get sign_in_email_title {
    return Intl.message(
      'Sign in with email',
      name: 'sign_in_email_title',
      desc: '',
      args: [],
    );
  }

  /// `Forgot password?`
  String get forgot_password_question {
    return Intl.message(
      'Forgot password?',
      name: 'forgot_password_question',
      desc: '',
      args: [],
    );
  }

  /// `Don't have an account? `
  String get dont_have_account {
    return Intl.message(
      'Don\'t have an account? ',
      name: 'dont_have_account',
      desc: '',
      args: [],
    );
  }

  /// `Sign up`
  String get sign_up_action {
    return Intl.message('Sign up', name: 'sign_up_action', desc: '', args: []);
  }

  /// `Forgot password`
  String get forgot_password_title {
    return Intl.message(
      'Forgot password',
      name: 'forgot_password_title',
      desc: '',
      args: [],
    );
  }

  /// `Enter your email to receive reset instructions.`
  String get forgot_password_instruction {
    return Intl.message(
      'Enter your email to receive reset instructions.',
      name: 'forgot_password_instruction',
      desc: '',
      args: [],
    );
  }

  /// `If an account exists for that email, a reset link will be sent.`
  String get reset_link_sent {
    return Intl.message(
      'If an account exists for that email, a reset link will be sent.',
      name: 'reset_link_sent',
      desc: '',
      args: [],
    );
  }

  /// `Send reset link`
  String get send_reset_link_button {
    return Intl.message(
      'Send reset link',
      name: 'send_reset_link_button',
      desc: '',
      args: [],
    );
  }

  /// `Connection failed. Please check your internet connection.`
  String get connection_failed {
    return Intl.message(
      'Connection failed. Please check your internet connection.',
      name: 'connection_failed',
      desc: '',
      args: [],
    );
  }

  /// `Conversation ID is missing`
  String get conversation_id_missing {
    return Intl.message(
      'Conversation ID is missing',
      name: 'conversation_id_missing',
      desc: '',
      args: [],
    );
  }

  /// `Ask anything...`
  String get input_placeholder {
    return Intl.message(
      'Ask anything...',
      name: 'input_placeholder',
      desc: '',
      args: [],
    );
  }

  /// `Search`
  String get search_mode {
    return Intl.message('Search', name: 'search_mode', desc: '', args: []);
  }

  /// `Research`
  String get research_mode {
    return Intl.message('Research', name: 'research_mode', desc: '', args: []);
  }

  /// `Pro Search`
  String get pro_search_mode {
    return Intl.message(
      'Pro Search',
      name: 'pro_search_mode',
      desc: '',
      args: [],
    );
  }

  /// `Choose a mode`
  String get choose_mode {
    return Intl.message(
      'Choose a mode',
      name: 'choose_mode',
      desc: '',
      args: [],
    );
  }

  /// `Sources`
  String get sources {
    return Intl.message('Sources', name: 'sources', desc: '', args: []);
  }

  /// `Image`
  String get image {
    return Intl.message('Image', name: 'image', desc: '', args: []);
  }

  /// `Camera`
  String get camera {
    return Intl.message('Camera', name: 'camera', desc: '', args: []);
  }

  /// `File`
  String get file {
    return Intl.message('File', name: 'file', desc: '', args: []);
  }

  /// `Server was busy, please try again!`
  String get server_busy {
    return Intl.message(
      'Server was busy, please try again!',
      name: 'server_busy',
      desc: '',
      args: [],
    );
  }

  /// `Retry`
  String get retry {
    return Intl.message('Retry', name: 'retry', desc: '', args: []);
  }

  /// `Connection error`
  String get connection_error {
    return Intl.message(
      'Connection error',
      name: 'connection_error',
      desc: '',
      args: [],
    );
  }

  /// `Response Exception`
  String get response_exception {
    return Intl.message(
      'Response Exception',
      name: 'response_exception',
      desc: '',
      args: [],
    );
  }

  /// `Reload`
  String get reload {
    return Intl.message('Reload', name: 'reload', desc: '', args: []);
  }

  /// `Insider`
  String get insider_badge {
    return Intl.message('Insider', name: 'insider_badge', desc: '', args: []);
  }

  /// `Reviewed {count} sources`
  String reviewed_sources(Object count) {
    return Intl.message(
      'Reviewed $count sources',
      name: 'reviewed_sources',
      desc: '',
      args: [count],
    );
  }

  /// `Completed {count} steps`
  String completed_steps(Object count) {
    return Intl.message(
      'Completed $count steps',
      name: 'completed_steps',
      desc: '',
      args: [count],
    );
  }

  /// `Working...`
  String get working_status {
    return Intl.message(
      'Working...',
      name: 'working_status',
      desc: '',
      args: [],
    );
  }

  /// `Thought Process`
  String get thought_process {
    return Intl.message(
      'Thought Process',
      name: 'thought_process',
      desc: '',
      args: [],
    );
  }

  /// `SEARCHING`
  String get searching_label {
    return Intl.message(
      'SEARCHING',
      name: 'searching_label',
      desc: '',
      args: [],
    );
  }

  /// `RESULTS`
  String get results_label {
    return Intl.message('RESULTS', name: 'results_label', desc: '', args: []);
  }

  /// `UNDERSTANDING RESULTS`
  String get understanding_results_label {
    return Intl.message(
      'UNDERSTANDING RESULTS',
      name: 'understanding_results_label',
      desc: '',
      args: [],
    );
  }

  /// `Answer`
  String get answer_tab {
    return Intl.message('Answer', name: 'answer_tab', desc: '', args: []);
  }

  /// `Images`
  String get images_tab {
    return Intl.message('Images', name: 'images_tab', desc: '', args: []);
  }

  /// `Sources`
  String get sources_title {
    return Intl.message('Sources', name: 'sources_title', desc: '', args: []);
  }

  /// `No sources available`
  String get no_sources_available {
    return Intl.message(
      'No sources available',
      name: 'no_sources_available',
      desc: '',
      args: [],
    );
  }

  /// `Sources will appear here once loaded`
  String get sources_will_appear_here {
    return Intl.message(
      'Sources will appear here once loaded',
      name: 'sources_will_appear_here',
      desc: '',
      args: [],
    );
  }

  /// `Source {index}`
  String source_index(int index) {
    return Intl.message(
      'Source $index',
      name: 'source_index',
      desc: '',
      args: [index],
    );
  }

  /// `Unknown`
  String get unknown_source {
    return Intl.message('Unknown', name: 'unknown_source', desc: '', args: []);
  }

  /// `Source Configuration`
  String get source_configuration {
    return Intl.message(
      'Source Configuration',
      name: 'source_configuration',
      desc: '',
      args: [],
    );
  }

  /// `Web Search`
  String get web_search {
    return Intl.message('Web Search', name: 'web_search', desc: '', args: []);
  }

  /// `Search across the entire internet`
  String get web_search_subtitle {
    return Intl.message(
      'Search across the entire internet',
      name: 'web_search_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Internal Resources`
  String get internal_resources {
    return Intl.message(
      'Internal Resources',
      name: 'internal_resources',
      desc: '',
      args: [],
    );
  }

  /// `Search RAG indexed resources`
  String get internal_resources_subtitle {
    return Intl.message(
      'Search RAG indexed resources',
      name: 'internal_resources_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Search resources...`
  String get search_resources_hint {
    return Intl.message(
      'Search resources...',
      name: 'search_resources_hint',
      desc: '',
      args: [],
    );
  }

  /// `Select All`
  String get select_all {
    return Intl.message('Select All', name: 'select_all', desc: '', args: []);
  }

  /// `Copy`
  String get copy {
    return Intl.message('Copy', name: 'copy', desc: '', args: []);
  }

  /// `Copied to clipboard`
  String get copied_to_clipboard {
    return Intl.message(
      'Copied to clipboard',
      name: 'copied_to_clipboard',
      desc: '',
      args: [],
    );
  }

  /// `Edit`
  String get edit {
    return Intl.message('Edit', name: 'edit', desc: '', args: []);
  }

  /// `Search`
  String get search_mode_short {
    return Intl.message(
      'Search',
      name: 'search_mode_short',
      desc: '',
      args: [],
    );
  }

  /// `Research`
  String get research_mode_short {
    return Intl.message(
      'Research',
      name: 'research_mode_short',
      desc: '',
      args: [],
    );
  }

  /// `Pro Search`
  String get pro_search_mode_short {
    return Intl.message(
      'Pro Search',
      name: 'pro_search_mode_short',
      desc: '',
      args: [],
    );
  }

  /// `Quickly find answers to your questions.`
  String get search_mode_subtitle {
    return Intl.message(
      'Quickly find answers to your questions.',
      name: 'search_mode_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Get detailed answers with enhanced search capabilities.`
  String get pro_search_mode_subtitle {
    return Intl.message(
      'Get detailed answers with enhanced search capabilities.',
      name: 'pro_search_mode_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Conduct in-depth research with comprehensive responses.`
  String get research_mode_subtitle {
    return Intl.message(
      'Conduct in-depth research with comprehensive responses.',
      name: 'research_mode_subtitle',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load conversation history. Please try again.`
  String get failed_to_load_history {
    return Intl.message(
      'Failed to load conversation history. Please try again.',
      name: 'failed_to_load_history',
      desc: '',
      args: [],
    );
  }

  /// `Intro`
  String get intro_title {
    return Intl.message('Intro', name: 'intro_title', desc: '', args: []);
  }

  /// `Started`
  String get started_button {
    return Intl.message('Started', name: 'started_button', desc: '', args: []);
  }

  /// `+ {count} more`
  String plus_count_more(int count) {
    return Intl.message(
      '+ $count more',
      name: 'plus_count_more',
      desc: '',
      args: [count],
    );
  }

  /// `Retry`
  String get retry_action {
    return Intl.message('Retry', name: 'retry_action', desc: '', args: []);
  }

  /// `Search Queries`
  String get search_queries {
    return Intl.message(
      'Search Queries',
      name: 'search_queries',
      desc: '',
      args: [],
    );
  }

  /// `Results`
  String get results {
    return Intl.message('Results', name: 'results', desc: '', args: []);
  }

  /// `Source`
  String get source {
    return Intl.message('Source', name: 'source', desc: '', args: []);
  }

  /// `Settings`
  String get settings_title {
    return Intl.message('Settings', name: 'settings_title', desc: '', args: []);
  }

  /// `Manage Account`
  String get manage_account {
    return Intl.message(
      'Manage Account',
      name: 'manage_account',
      desc: '',
      args: [],
    );
  }

  /// `Guest`
  String get guest_user {
    return Intl.message('Guest', name: 'guest_user', desc: '', args: []);
  }

  /// `Theme`
  String get theme_title {
    return Intl.message('Theme', name: 'theme_title', desc: '', args: []);
  }

  /// `Push Notifications`
  String get push_notifications {
    return Intl.message(
      'Push Notifications',
      name: 'push_notifications',
      desc: '',
      args: [],
    );
  }

  /// `Sign out`
  String get sign_out {
    return Intl.message('Sign out', name: 'sign_out', desc: '', args: []);
  }

  /// `Log in to Insider`
  String get login_card_title {
    return Intl.message(
      'Log in to Insider',
      name: 'login_card_title',
      desc: '',
      args: [],
    );
  }

  /// `Sync preferences, keep progress, and stay up to date across devices.`
  String get login_card_description {
    return Intl.message(
      'Sync preferences, keep progress, and stay up to date across devices.',
      name: 'login_card_description',
      desc: '',
      args: [],
    );
  }

  /// `Continue`
  String get login_action {
    return Intl.message('Continue', name: 'login_action', desc: '', args: []);
  }

  /// `Top News`
  String get top_news {
    return Intl.message('Top News', name: 'top_news', desc: '', args: []);
  }

  /// `Failed to load news`
  String get failed_to_load_news {
    return Intl.message(
      'Failed to load news',
      name: 'failed_to_load_news',
      desc: '',
      args: [],
    );
  }

  /// `No articles available`
  String get no_articles_available {
    return Intl.message(
      'No articles available',
      name: 'no_articles_available',
      desc: '',
      args: [],
    );
  }

  /// `Article`
  String get article_title {
    return Intl.message('Article', name: 'article_title', desc: '', args: []);
  }

  /// `Article not found`
  String get article_not_found {
    return Intl.message(
      'Article not found',
      name: 'article_not_found',
      desc: '',
      args: [],
    );
  }

  /// `Read full article`
  String get read_full_article {
    return Intl.message(
      'Read full article',
      name: 'read_full_article',
      desc: '',
      args: [],
    );
  }

  /// `Failed to load threads`
  String get failed_to_load_threads {
    return Intl.message(
      'Failed to load threads',
      name: 'failed_to_load_threads',
      desc: '',
      args: [],
    );
  }

  /// `No results found`
  String get no_results_found {
    return Intl.message(
      'No results found',
      name: 'no_results_found',
      desc: '',
      args: [],
    );
  }

  /// `Try a different search term`
  String get try_different_search_term {
    return Intl.message(
      'Try a different search term',
      name: 'try_different_search_term',
      desc: '',
      args: [],
    );
  }

  /// `No conversations yet`
  String get no_conversations_yet {
    return Intl.message(
      'No conversations yet',
      name: 'no_conversations_yet',
      desc: '',
      args: [],
    );
  }

  /// `Start a new search to see your history here`
  String get start_new_search_for_history {
    return Intl.message(
      'Start a new search to see your history here',
      name: 'start_new_search_for_history',
      desc: '',
      args: [],
    );
  }

  /// `Search threads`
  String get search_threads_hint {
    return Intl.message(
      'Search threads',
      name: 'search_threads_hint',
      desc: '',
      args: [],
    );
  }

  /// `Get started`
  String get guest_get_started {
    return Intl.message(
      'Get started',
      name: 'guest_get_started',
      desc: '',
      args: [],
    );
  }

  /// `Create a thread to dive into a new world of curiosity and knowledge`
  String get guest_create_thread_desc {
    return Intl.message(
      'Create a thread to dive into a new world of curiosity and knowledge',
      name: 'guest_create_thread_desc',
      desc: '',
      args: [],
    );
  }

  /// `Create a thread`
  String get guest_create_thread_button {
    return Intl.message(
      'Create a thread',
      name: 'guest_create_thread_button',
      desc: '',
      args: [],
    );
  }

  /// `Just now`
  String get just_now {
    return Intl.message('Just now', name: 'just_now', desc: '', args: []);
  }

  /// `Source`
  String get source_default_title {
    return Intl.message(
      'Source',
      name: 'source_default_title',
      desc: '',
      args: [],
    );
  }

  /// `Processing`
  String get step_processing {
    return Intl.message(
      'Processing',
      name: 'step_processing',
      desc: '',
      args: [],
    );
  }

  /// `Step`
  String get step_prefix {
    return Intl.message('Step', name: 'step_prefix', desc: '', args: []);
  }

  /// `Account Settings`
  String get account_settings {
    return Intl.message(
      'Account Settings',
      name: 'account_settings',
      desc: '',
      args: [],
    );
  }

  /// `Sign in to manage your account`
  String get sign_in_to_manage {
    return Intl.message(
      'Sign in to manage your account',
      name: 'sign_in_to_manage',
      desc: '',
      args: [],
    );
  }

  /// `Not set`
  String get not_set {
    return Intl.message('Not set', name: 'not_set', desc: '', args: []);
  }

  /// `Name`
  String get profile_name {
    return Intl.message('Name', name: 'profile_name', desc: '', args: []);
  }

  /// `Username`
  String get profile_username {
    return Intl.message(
      'Username',
      name: 'profile_username',
      desc: '',
      args: [],
    );
  }

  /// `Email`
  String get profile_email {
    return Intl.message('Email', name: 'profile_email', desc: '', args: []);
  }

  /// `Introduction`
  String get profile_introduction {
    return Intl.message(
      'Introduction',
      name: 'profile_introduction',
      desc: '',
      args: [],
    );
  }

  /// `Location`
  String get profile_location {
    return Intl.message(
      'Location',
      name: 'profile_location',
      desc: '',
      args: [],
    );
  }

  /// `Account`
  String get account_title {
    return Intl.message('Account', name: 'account_title', desc: '', args: []);
  }

  /// `Choose from gallery`
  String get choose_from_gallery {
    return Intl.message(
      'Choose from gallery',
      name: 'choose_from_gallery',
      desc: '',
      args: [],
    );
  }

  /// `Take a photo`
  String get take_photo {
    return Intl.message('Take a photo', name: 'take_photo', desc: '', args: []);
  }

  /// `Remove avatar`
  String get remove_avatar {
    return Intl.message(
      'Remove avatar',
      name: 'remove_avatar',
      desc: '',
      args: [],
    );
  }

  /// `Failed to pick image: {error}`
  String failed_to_pick_image(Object error) {
    return Intl.message(
      'Failed to pick image: $error',
      name: 'failed_to_pick_image',
      desc: '',
      args: [error],
    );
  }

  /// `{field} updated successfully`
  String update_success(Object field) {
    return Intl.message(
      '$field updated successfully',
      name: 'update_success',
      desc: '',
      args: [field],
    );
  }

  /// `Update`
  String get update_action {
    return Intl.message('Update', name: 'update_action', desc: '', args: []);
  }

  /// `No images yet`
  String get no_images_yet {
    return Intl.message(
      'No images yet',
      name: 'no_images_yet',
      desc: '',
      args: [],
    );
  }

  /// `SVG`
  String get svg_format {
    return Intl.message('SVG', name: 'svg_format', desc: '', args: []);
  }

  /// `PNG`
  String get png_format {
    return Intl.message('PNG', name: 'png_format', desc: '', args: []);
  }

  /// `System`
  String get theme_system {
    return Intl.message('System', name: 'theme_system', desc: '', args: []);
  }

  /// `Light`
  String get theme_light {
    return Intl.message('Light', name: 'theme_light', desc: '', args: []);
  }

  /// `Dark`
  String get theme_dark {
    return Intl.message('Dark', name: 'theme_dark', desc: '', args: []);
  }

  /// `{count} sources`
  String sources_count_text(Object count) {
    return Intl.message(
      '$count sources',
      name: 'sources_count_text',
      desc: '',
      args: [count],
    );
  }

  /// `{count}d ago`
  String time_days_ago(Object count) {
    return Intl.message(
      '${count}d ago',
      name: 'time_days_ago',
      desc: '',
      args: [count],
    );
  }

  /// `{count}h ago`
  String time_hours_ago(Object count) {
    return Intl.message(
      '${count}h ago',
      name: 'time_hours_ago',
      desc: '',
      args: [count],
    );
  }

  /// `{count}m ago`
  String time_minutes_ago(Object count) {
    return Intl.message(
      '${count}m ago',
      name: 'time_minutes_ago',
      desc: '',
      args: [count],
    );
  }

  /// `{feature} coming soon`
  String feature_coming_soon(Object feature) {
    return Intl.message(
      '$feature coming soon',
      name: 'feature_coming_soon',
      desc: '',
      args: [feature],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'en'),
      Locale.fromSubtags(languageCode: 'vi'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
