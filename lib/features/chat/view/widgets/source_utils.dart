String? getFaviconUrl(String url) {
  if (url.isEmpty || url.startsWith('rag://')) return null;

  try {
    Uri uri = Uri.parse(url);
    if (!uri.hasScheme) {
      uri = Uri.parse('https://$url');
    }

    if (uri.host.isEmpty) return null;

    // Use Google's s2 service which works better with just domains
    return 'https://www.google.com/s2/favicons?domain=${uri.host}&sz=64';
  } catch (_) {
    return null;
  }
}

String deriveSourceName({String? source, String? url}) {
  if (source != null && source.trim().isNotEmpty) {
    return source.trim();
  }

  if (url == null || url.isEmpty) {
    return 'Source';
  }

  if (url.startsWith('rag://dataset/')) {
    return 'Dataset';
  }

  try {
    final uri = Uri.parse(url);
    if (uri.host.isNotEmpty) {
      return uri.host;
    }
  } catch (_) {
    // ignore parse errors, fall through to url fallback
  }

  return url;
}
