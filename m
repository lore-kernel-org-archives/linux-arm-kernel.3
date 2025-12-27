Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6EF15E8FDD8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 27 Dec 2025 14:22:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dkOl3+2E5uBM0wxWZy4TsfgVfQXwCyjeP1JIoSVkCIk=; b=B5W3uR7J/DhiBvSAhvcW4DxZ6q
	4+J6f9TDerw0Etpp6ffkOK4Wca8Rkfnh+WDp+w1V6j0pk7OrfEFOf1XmZ4vpHazOM935yDiE2X4uC
	D5hlyHSUGW7ioJ3HRUCDABaHzPnnmXYHXrZGHQnhUtichtXixHo0wuk/CdZxUiqXTtfSiTYxHRs1l
	6IjD/hjPuwsB3rGbkQ3WxioVNrHPpMnDfRWnhYx95qZDomFLlnSe+VXleV9T6uY49EnSBR8JKb2N4
	CFc3XVj/XJ3ZvHNfNHgi0Jwu6sPLEshPKwroaIOjQtOtMCyEvhM0d2QFB48V5kbPUYrhRiSa8TtNu
	XEQEsEuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBr-000000021fR-1w3E;
	Sat, 27 Dec 2025 14:22:43 +0000
Received: from mail-ot1-x336.google.com ([2607:f8b0:4864:20::336])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZVBk-000000021ch-26XS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 27 Dec 2025 14:22:37 +0000
Received: by mail-ot1-x336.google.com with SMTP id 46e09a7af769-7c6dbdaced8so6381160a34.1
        for <linux-arm-kernel@lists.infradead.org>; Sat, 27 Dec 2025 06:22:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1766845354; x=1767450154; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dkOl3+2E5uBM0wxWZy4TsfgVfQXwCyjeP1JIoSVkCIk=;
        b=QdwLKUPqg58KCTehvyuKpuLyS7FVHLSw8JLW2ler4oOixbwfX+M6NRExUWGcICOSsS
         qSCNnxJp6xpEB7s0yjOXM6nABhD6yZ7ATpRtViCXKeQaQ7VQLhAIXllTHfdcUZNZdmsf
         xbQ/2/XkDQ59kxV1n2GX8MyDjWUAmdCgOAhO4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766845354; x=1767450154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dkOl3+2E5uBM0wxWZy4TsfgVfQXwCyjeP1JIoSVkCIk=;
        b=snFPUDeqxwpFmjBqebUBMWWYPcoqxwV9x6MnQJHkqSpRgk0cjj0R838NwKV6A9PyQM
         IR8YUfYPPmdoGutHaGziihPC0zczpg5Ts7Dp4YYvpwb8nh3hrU8Df1TXHCmEw6+SiHWy
         I+v7HCmREKfyqLbKT+InucmPPj6rPipClGejBOu0NWdMLCXCLRBcNWmdb/bGo9lfuJR7
         pUV5mn1I9uyqNdfx5AXkUnSEpsF0bXU/BHFFaPDjEjZFNfAI8VpGWj5V9KuH9RllGUnH
         y4ky7OqJFOy1Hzk0CP0E3KPvluhxPcdqLYirRGew1HUsj/ZQNGw98RtQ9xBkIg8jc2uk
         b3zw==
X-Gm-Message-State: AOJu0YwgSLJRbA89V9sfwtzgRL+gEayS5+w6ItAAs8D5PQlBJdcfyKt8
	78C0C/37iYm1w66OcvWi2KMBuecPVBnjXqekW6AoBAOfNgX0DtaeedDBYFERHeSyOPTEPNI7inI
	ydsg=
X-Gm-Gg: AY/fxX7FWtRoVbdYpzoU0cPZ+CJT94Uylcx+QIdudQjqSj2c5DZ6TkEc3ddLh5vuII2
	ZLIX2jrYZmP8opiJ2AjKVb/Au8o1alaCipXvP18yP65lkTorRJwmeqL4HgfcTGdWdhDFNC2hzGg
	AW4GJGTliFPkFyNm5/WqRmr6CcF+BChTaX8OAZ77RCp4m9r9MTUEzHx/s7fIPtoIqynvyljhadM
	oawAGA8elbGeX9FvNGddOJZL6u46gsiKO4nQl9bz3O1HSlKFOmP4DDoRfWekVa0WJGCVuH7FELy
	PR6R3WaPDV8keScDLHbgb9Y70lC39/ZJm3uNTcdKoA6BZYLAiVcTtwIi+E3LmEqLf9gUDYUysaG
	ZlLbpwOMaFar+I8t2dqETf4WCXaSHsmSzGQidzM0cwt39u2W7/GOu/W5VgsVzf1GBa5DzZoZ+W0
	3zFnXB
X-Google-Smtp-Source: AGHT+IH+2fFfhpMMxFeukqxtBdzObwyT8Ia+HitEAnOFLETYjHsbEDshOLHe3rAQCd4FWWRGCErwog==
X-Received: by 2002:a05:6830:4104:b0:7c7:62d0:b462 with SMTP id 46e09a7af769-7cc668ffda5mr13302862a34.6.1766845354627;
        Sat, 27 Dec 2025 06:22:34 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7cc66727e11sm17352660a34.3.2025.12.27.06.22.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Dec 2025 06:22:33 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Masahiro Yamada <masahiroy@kernel.org>,
	Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v8 6/6] scripts/make_fit: Compress dtbs in parallel
Date: Sat, 27 Dec 2025 07:21:50 -0700
Message-ID: <20251227142200.2241198-7-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251227142200.2241198-1-sjg@chromium.org>
References: <20251227142200.2241198-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251227_062236_551951_55AB5008 
X-CRM114-Status: GOOD (  15.71  )
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

When there are 1500 device tree files it takes quite a while to compress
them. Do it in parallel.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v8:
- Drop erroneous line 'kbuild: Allow adding modules into the FIT ...'

 scripts/make_fit.py | 56 ++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 50 insertions(+), 6 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index defb87f223d7..e923cc8b05b7 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -37,6 +37,7 @@ as U-Boot, Linuxboot, Tianocore, etc.
 
 import argparse
 import collections
+import multiprocessing
 import os
 import subprocess
 import sys
@@ -225,15 +226,31 @@ def compress_data(inf, compress):
     return comp_data
 
 
-def output_dtb(fsw, seq, fname, arch, compress):
+def compress_dtb(fname, compress):
+    """Compress a single DTB file
+
+    Args:
+        fname (str): Filename containing the DTB
+        compress (str): Compression algorithm, e.g. 'gzip'
+
+    Returns:
+        tuple: (str: fname, bytes: compressed_data)
+    """
+    with open(fname, 'rb') as inf:
+        compressed = compress_data(inf, compress)
+    return fname, compressed
+
+
+def output_dtb(fsw, seq, fname, arch, compress, data=None):
     """Write out a single devicetree to the FIT
 
     Args:
         fsw (libfdt.FdtSw): Object to use for writing
         seq (int): Sequence number (1 for first)
         fname (str): Filename containing the DTB
-        arch: FIT architecture, e.g. 'arm64'
+        arch (str): FIT architecture, e.g. 'arm64'
         compress (str): Compressed algorithm, e.g. 'gzip'
+        data (bytes): Pre-compressed data (optional)
     """
     with fsw.add_node(f'fdt-{seq}'):
         fsw.property_string('description', os.path.basename(fname))
@@ -241,9 +258,10 @@ def output_dtb(fsw, seq, fname, arch, compress):
         fsw.property_string('arch', arch)
         fsw.property_string('compression', compress)
 
-        with open(fname, 'rb') as inf:
-            compressed = compress_data(inf, compress)
-        fsw.property('data', compressed)
+        if data is None:
+            with open(fname, 'rb') as inf:
+                data = compress_data(inf, compress)
+        fsw.property('data', data)
 
 
 def process_dtb(fname, args):
@@ -300,6 +318,11 @@ def _process_dtbs(args, fsw, entries, fdts):
     """
     seq = 0
     size = 0
+
+    # First figure out the unique DTB files that need compression
+    todo = []
+    file_info = []  # List of (fname, model, compat, files) tuples
+
     for fname in args.dtbs:
         # Ignore non-DTB (*.dtb) files
         if os.path.splitext(fname)[1] != '.dtb':
@@ -311,11 +334,32 @@ def _process_dtbs(args, fsw, entries, fdts):
             sys.stderr.write(f'Error processing {fname}:\n')
             raise e
 
+        file_info.append((fname, model, compat, files))
+        for fn in files:
+            if fn not in fdts and fn not in todo:
+                todo.append(fn)
+
+    # Compress all DTBs in parallel
+    cache = {}
+    if todo and args.compress != 'none':
+        if args.verbose:
+            print(f'Compressing {len(todo)} DTBs...')
+
+        with multiprocessing.Pool() as pool:
+            compress_args = [(fn, args.compress) for fn in todo]
+            # unpacks each tuple, calls compress_dtb(fn, compress) in parallel
+            results = pool.starmap(compress_dtb, compress_args)
+
+        cache = dict(results)
+
+    # Now write all DTBs to the FIT using pre-compressed data
+    for fname, model, compat, files in file_info:
         for fn in files:
             if fn not in fdts:
                 seq += 1
                 size += os.path.getsize(fn)
-                output_dtb(fsw, seq, fn, args.arch, args.compress)
+                output_dtb(fsw, seq, fn, args.arch, args.compress,
+                           cache.get(fn))
                 fdts[fn] = seq
 
         files_seq = [fdts[fn] for fn in files]
-- 
2.43.0


