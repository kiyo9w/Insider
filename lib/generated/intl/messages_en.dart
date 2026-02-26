// DO NOT EDIT. This is code generated via package:intl/generate_localized.dart
// This is a library that provides messages for a en locale. All the
// messages from the main program should be duplicated here with the same
// function name.

// Ignore issues from commonly used lints in this file.
// ignore_for_file:unnecessary_brace_in_string_interps, unnecessary_new
// ignore_for_file:prefer_single_quotes,comment_references, directives_ordering
// ignore_for_file:annotate_overrides,prefer_generic_function_type_aliases
// ignore_for_file:unused_import, file_names, avoid_escaping_inner_quotes
// ignore_for_file:unnecessary_string_interpolations, unnecessary_string_escapes

import 'package:intl/intl.dart';
import 'package:intl/message_lookup_by_library.dart';

final messages = new MessageLookup();

typedef String MessageIfAbsent(String messageStr, List<dynamic> args);

class MessageLookup extends MessageLookupByLibrary {
  String get localeName => 'en';

  static String m0(count) => "Completed ${count} steps";

  static String m1(error) => "Failed to pick image: ${error}";

  static String m2(feature) => "${feature} coming soon";

  static String m3(count) => "+ ${count} more";

  static String m4(count) => "Reviewed ${count} sources";

  static String m5(index) => "Source ${index}";

  static String m6(count) => "${count} sources";

  static String m7(count) => "${count}d ago";

  static String m8(count) => "${count}h ago";

  static String m9(count) => "${count}m ago";

  static String m10(field) => "${field} updated successfully";

  final messages = _notInlinedMessages(_notInlinedMessages);
  static Map<String, Function> _notInlinedMessages(_) => <String, Function>{
    "account_settings": MessageLookupByLibrary.simpleMessage(
      "Account Settings",
    ),
    "account_title": MessageLookupByLibrary.simpleMessage("Account"),
    "already_have_account": MessageLookupByLibrary.simpleMessage(
      "Already have an account? ",
    ),
    "answer_tab": MessageLookupByLibrary.simpleMessage("Answer"),
    "app_language": MessageLookupByLibrary.simpleMessage("App language"),
    "article_not_found": MessageLookupByLibrary.simpleMessage(
      "Article not found",
    ),
    "article_title": MessageLookupByLibrary.simpleMessage("Article"),
    "assets": MessageLookupByLibrary.simpleMessage("Assets gen"),
    "camera": MessageLookupByLibrary.simpleMessage("Camera"),
    "choose_from_gallery": MessageLookupByLibrary.simpleMessage(
      "Choose from gallery",
    ),
    "choose_mode": MessageLookupByLibrary.simpleMessage("Choose a mode"),
    "completed_steps": m0,
    "confirm_password_hint": MessageLookupByLibrary.simpleMessage(
      "Confirm Password",
    ),
    "connection_error": MessageLookupByLibrary.simpleMessage(
      "Connection error",
    ),
    "connection_failed": MessageLookupByLibrary.simpleMessage(
      "Connection failed. Please check your internet connection.",
    ),
    "continue_button": MessageLookupByLibrary.simpleMessage("Continue"),
    "conversation_id_missing": MessageLookupByLibrary.simpleMessage(
      "Conversation ID is missing",
    ),
    "copied_to_clipboard": MessageLookupByLibrary.simpleMessage(
      "Copied to clipboard",
    ),
    "copy": MessageLookupByLibrary.simpleMessage("Copy"),
    "create_account_title": MessageLookupByLibrary.simpleMessage(
      "Create an account",
    ),
    "dark_mode": MessageLookupByLibrary.simpleMessage("Dark mode"),
    "delete_failed": MessageLookupByLibrary.simpleMessage("Delete failed"),
    "delete_success": MessageLookupByLibrary.simpleMessage("Delete success"),
    "didnt_supported": MessageLookupByLibrary.simpleMessage(
      "Floor didnt support",
    ),
    "dog_image_random": MessageLookupByLibrary.simpleMessage(
      "Dog image random",
    ),
    "dont_have_account": MessageLookupByLibrary.simpleMessage(
      "Don\'t have an account? ",
    ),
    "edit": MessageLookupByLibrary.simpleMessage("Edit"),
    "email_hint": MessageLookupByLibrary.simpleMessage("Email"),
    "english": MessageLookupByLibrary.simpleMessage("English"),
    "failed_to_load_history": MessageLookupByLibrary.simpleMessage(
      "Failed to load conversation history. Please try again.",
    ),
    "failed_to_load_news": MessageLookupByLibrary.simpleMessage(
      "Failed to load news",
    ),
    "failed_to_load_threads": MessageLookupByLibrary.simpleMessage(
      "Failed to load threads",
    ),
    "failed_to_pick_image": m1,
    "feature_coming_soon": m2,
    "file": MessageLookupByLibrary.simpleMessage("File"),
    "forgot_password_instruction": MessageLookupByLibrary.simpleMessage(
      "Enter your email to receive reset instructions.",
    ),
    "forgot_password_question": MessageLookupByLibrary.simpleMessage(
      "Forgot password?",
    ),
    "forgot_password_title": MessageLookupByLibrary.simpleMessage(
      "Forgot password",
    ),
    "guest_create_thread_button": MessageLookupByLibrary.simpleMessage(
      "Create a thread",
    ),
    "guest_create_thread_desc": MessageLookupByLibrary.simpleMessage(
      "Create a thread to dive into a new world of curiosity and knowledge",
    ),
    "guest_get_started": MessageLookupByLibrary.simpleMessage("Get started"),
    "guest_user": MessageLookupByLibrary.simpleMessage("Guest"),
    "home": MessageLookupByLibrary.simpleMessage("Home"),
    "image": MessageLookupByLibrary.simpleMessage("Image"),
    "image_from_db": MessageLookupByLibrary.simpleMessage("Image from DB"),
    "images_tab": MessageLookupByLibrary.simpleMessage("Images"),
    "input_placeholder": MessageLookupByLibrary.simpleMessage(
      "Ask anything...",
    ),
    "insider_badge": MessageLookupByLibrary.simpleMessage("Insider"),
    "internal_resources": MessageLookupByLibrary.simpleMessage(
      "Internal Resources",
    ),
    "internal_resources_subtitle": MessageLookupByLibrary.simpleMessage(
      "Search RAG indexed resources",
    ),
    "intro_title": MessageLookupByLibrary.simpleMessage("Intro"),
    "just_now": MessageLookupByLibrary.simpleMessage("Just now"),
    "load_and_insert_db": MessageLookupByLibrary.simpleMessage(
      "Load and insert DB",
    ),
    "load_failed": MessageLookupByLibrary.simpleMessage("Load failed"),
    "load_image": MessageLookupByLibrary.simpleMessage("Load image"),
    "login_action": MessageLookupByLibrary.simpleMessage("Continue"),
    "login_card_description": MessageLookupByLibrary.simpleMessage(
      "Sync preferences, keep progress, and stay up to date across devices.",
    ),
    "login_card_title": MessageLookupByLibrary.simpleMessage(
      "Log in to Insider",
    ),
    "manage_account": MessageLookupByLibrary.simpleMessage("Manage Account"),
    "no_articles_available": MessageLookupByLibrary.simpleMessage(
      "No articles available",
    ),
    "no_conversations_yet": MessageLookupByLibrary.simpleMessage(
      "No conversations yet",
    ),
    "no_images_yet": MessageLookupByLibrary.simpleMessage("No images yet"),
    "no_results_found": MessageLookupByLibrary.simpleMessage(
      "No results found",
    ),
    "no_sources_available": MessageLookupByLibrary.simpleMessage(
      "No sources available",
    ),
    "not_set": MessageLookupByLibrary.simpleMessage("Not set"),
    "password_hint": MessageLookupByLibrary.simpleMessage("Password"),
    "passwords_do_not_match": MessageLookupByLibrary.simpleMessage(
      "Passwords do not match",
    ),
    "plus_count_more": m3,
    "png_format": MessageLookupByLibrary.simpleMessage("PNG"),
    "press_button": MessageLookupByLibrary.simpleMessage("Press button"),
    "pro_search_mode": MessageLookupByLibrary.simpleMessage("Pro Search"),
    "pro_search_mode_short": MessageLookupByLibrary.simpleMessage("Pro Search"),
    "pro_search_mode_subtitle": MessageLookupByLibrary.simpleMessage(
      "Get detailed answers with enhanced search capabilities.",
    ),
    "profile_email": MessageLookupByLibrary.simpleMessage("Email"),
    "profile_introduction": MessageLookupByLibrary.simpleMessage(
      "Introduction",
    ),
    "profile_location": MessageLookupByLibrary.simpleMessage("Location"),
    "profile_name": MessageLookupByLibrary.simpleMessage("Name"),
    "profile_username": MessageLookupByLibrary.simpleMessage("Username"),
    "push_notifications": MessageLookupByLibrary.simpleMessage(
      "Push Notifications",
    ),
    "read_full_article": MessageLookupByLibrary.simpleMessage(
      "Read full article",
    ),
    "reload": MessageLookupByLibrary.simpleMessage("Reload"),
    "remove_avatar": MessageLookupByLibrary.simpleMessage("Remove avatar"),
    "research_mode": MessageLookupByLibrary.simpleMessage("Research"),
    "research_mode_short": MessageLookupByLibrary.simpleMessage("Research"),
    "research_mode_subtitle": MessageLookupByLibrary.simpleMessage(
      "Conduct in-depth research with comprehensive responses.",
    ),
    "reset_link_sent": MessageLookupByLibrary.simpleMessage(
      "If an account exists for that email, a reset link will be sent.",
    ),
    "response_exception": MessageLookupByLibrary.simpleMessage(
      "Response Exception",
    ),
    "results": MessageLookupByLibrary.simpleMessage("Results"),
    "results_label": MessageLookupByLibrary.simpleMessage("RESULTS"),
    "retry": MessageLookupByLibrary.simpleMessage("Retry"),
    "retry_action": MessageLookupByLibrary.simpleMessage("Retry"),
    "reviewed_sources": m4,
    "search_mode": MessageLookupByLibrary.simpleMessage("Search"),
    "search_mode_short": MessageLookupByLibrary.simpleMessage("Search"),
    "search_mode_subtitle": MessageLookupByLibrary.simpleMessage(
      "Quickly find answers to your questions.",
    ),
    "search_queries": MessageLookupByLibrary.simpleMessage("Search Queries"),
    "search_resources_hint": MessageLookupByLibrary.simpleMessage(
      "Search resources...",
    ),
    "search_threads_hint": MessageLookupByLibrary.simpleMessage(
      "Search threads",
    ),
    "searching_label": MessageLookupByLibrary.simpleMessage("SEARCHING"),
    "select_all": MessageLookupByLibrary.simpleMessage("Select All"),
    "send_reset_link_button": MessageLookupByLibrary.simpleMessage(
      "Send reset link",
    ),
    "server_busy": MessageLookupByLibrary.simpleMessage(
      "Server was busy, please try again!",
    ),
    "setting": MessageLookupByLibrary.simpleMessage("Setting"),
    "settings_title": MessageLookupByLibrary.simpleMessage("Settings"),
    "sign_in_action": MessageLookupByLibrary.simpleMessage("Sign in"),
    "sign_in_email_title": MessageLookupByLibrary.simpleMessage(
      "Sign in with email",
    ),
    "sign_in_to_manage": MessageLookupByLibrary.simpleMessage(
      "Sign in to manage your account",
    ),
    "sign_out": MessageLookupByLibrary.simpleMessage("Sign out"),
    "sign_up_action": MessageLookupByLibrary.simpleMessage("Sign up"),
    "source": MessageLookupByLibrary.simpleMessage("Source"),
    "source_configuration": MessageLookupByLibrary.simpleMessage(
      "Source Configuration",
    ),
    "source_default_title": MessageLookupByLibrary.simpleMessage("Source"),
    "source_index": m5,
    "sources": MessageLookupByLibrary.simpleMessage("Sources"),
    "sources_count_text": m6,
    "sources_title": MessageLookupByLibrary.simpleMessage("Sources"),
    "sources_will_appear_here": MessageLookupByLibrary.simpleMessage(
      "Sources will appear here once loaded",
    ),
    "start_new_search_for_history": MessageLookupByLibrary.simpleMessage(
      "Start a new search to see your history here",
    ),
    "started_button": MessageLookupByLibrary.simpleMessage("Started"),
    "step_prefix": MessageLookupByLibrary.simpleMessage("Step"),
    "step_processing": MessageLookupByLibrary.simpleMessage("Processing"),
    "svg_format": MessageLookupByLibrary.simpleMessage("SVG"),
    "take_photo": MessageLookupByLibrary.simpleMessage("Take a photo"),
    "theme_dark": MessageLookupByLibrary.simpleMessage("Dark"),
    "theme_light": MessageLookupByLibrary.simpleMessage("Light"),
    "theme_system": MessageLookupByLibrary.simpleMessage("System"),
    "theme_title": MessageLookupByLibrary.simpleMessage("Theme"),
    "thought_process": MessageLookupByLibrary.simpleMessage("Thought Process"),
    "time_days_ago": m7,
    "time_hours_ago": m8,
    "time_minutes_ago": m9,
    "top_news": MessageLookupByLibrary.simpleMessage("Top News"),
    "try_different_search_term": MessageLookupByLibrary.simpleMessage(
      "Try a different search term",
    ),
    "understanding_results_label": MessageLookupByLibrary.simpleMessage(
      "UNDERSTANDING RESULTS",
    ),
    "unknown_source": MessageLookupByLibrary.simpleMessage("Unknown"),
    "update_action": MessageLookupByLibrary.simpleMessage("Update"),
    "update_success": m10,
    "vietnamese": MessageLookupByLibrary.simpleMessage("Vietnamese"),
    "web_search": MessageLookupByLibrary.simpleMessage("Web Search"),
    "web_search_subtitle": MessageLookupByLibrary.simpleMessage(
      "Search across the entire internet",
    ),
    "working_status": MessageLookupByLibrary.simpleMessage("Working..."),
  };
}
