Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BB054CCA471
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  6 Oct 2025 23:02:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D/GhgyUTJVSqf6jn50N7qbJFCmaZJonK+/mIvqtdKlw=; b=u0bw8KdP9DYEx56O7VpcPopTe2
	NjUGxvszUQFyKe9GqIPGr63tUSj/rFvKV3ZDGxWz706uz7WfkE/B1JVeS7JBrxfFTPqtemkEqduET
	2ECkpWJrI6hQXiziYJZNQRHXP6NIzhwallqMY3zArVii/u6CodJRNY0d00Tn2R/Lip+OHNYL31rlW
	y/kwBzF2AnPE3J/Q/fhxECrmwbdN6NWsY2tndT28oP9FmSOqs2tIbyewB1YDMpnU2bp74wftX8/Zy
	BchaqAAJFqfkJDUbvHVZzsd0zHpHpqMlP3yBrxnh9QM09ILQEYWbwSLDwdyCTtEgpqwOXMtWF1khT
	P/V6mRnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uED-00000000xt1-1rwt;
	Mon, 06 Oct 2025 23:02:49 +0000
Received: from mail-il1-x142.google.com ([2607:f8b0:4864:20::142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v5uEB-00000000xrw-1q8o
	for linux-arm-kernel@lists.infradead.org;
	Mon, 06 Oct 2025 23:02:48 +0000
Received: by mail-il1-x142.google.com with SMTP id e9e14a558f8ab-42592472031so14769655ab.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 06 Oct 2025 16:02:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1759791765; x=1760396565; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D/GhgyUTJVSqf6jn50N7qbJFCmaZJonK+/mIvqtdKlw=;
        b=a8oCbsz+YJfWcY5KqRPU8ucrok4Ahznk0EXgMD/9oTrOIL9JkBvH5xlwQKO7LiflOT
         6L7YuPwXJa8Ulc5D8f3mJ7gYnIEQctlW1dMyb6PyPId9BZ4zuPswJ0aIuQAR4HOpEIO0
         sVMkSb06twEdE0SEmsC3BKgKkDY1lR4RtsE2I=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759791765; x=1760396565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=D/GhgyUTJVSqf6jn50N7qbJFCmaZJonK+/mIvqtdKlw=;
        b=h6LhHMxyKq4REKYrcSxGQRcoAlFKdJ8LSfLoxyhxxIYQxU7jOT77PqqEd3sDPVCgEJ
         qiHVuvXVgdsGSe7Lr8DAkh7vqimvY47uosSakLpwB7yx63xlSXr03fRTKmcPX4GPwxjl
         VY3xRldnDbJdrSPqVTKGBoi9dMuBIk88ruHqMCtXOTInEmTzpHA0lNeeF1rKnuvxGGxW
         dOpJkYy/4N56vROGjMOw2MN6AqPHOI1xT3D3qLYC9TWeXU7is/9OPzG3vV6oj3u+kLAP
         HK3fBAlp+CqGd6+GgEVnXWV1J5MP5SX648SKb2BdskvfCB985h21JxLDXBY4hjgKMakZ
         YVZg==
X-Gm-Message-State: AOJu0Yyfjih6ejdWkpJz74ecsYCUu9Zytl57kefs0rEyCf+BS7prgmxN
	SAj0ye8qAoMWEqeg8ePBwni6ji7N9hzW5MtBnCMSIox5HJ+XlhbrCtY8UbY+qHtVEnpHdhwhmJs
	nUswnViwC
X-Gm-Gg: ASbGncu/v2H6IYwR5JlApTdGnuSLPtSyIiLWE8AGbw77c/mzI1gEVEg3BA58JD75hrL
	sh3mlYUehIQAuiMp3hIrPYMejVTU1leQ+MS4nwD8Q/748Y1L/h0kUQuT81yixoHbw1XrM544Mqi
	aXyv7U5jcPsYMiTJZShAgqtQxaQ1Qq/iVdRrZlVgqhAB8Vr607EhZXXEcNFYo9MgsMFLoT6QUhM
	H++WsnhZnZrPSWwWyDXudDVFoYkdmWvzjaX6/WBbZIfAUvb3P+64Mq2wNHPKVFdbhwaunQiwO3V
	bGGTVEAtSCBydMMemfpP0o1Q4yyOu3cestQCn3ymGwD7vfRfCfs+bN4wZofK9Wr5ds5xoJTbMxh
	4fPQfXCDYCQJqsusYQPf69DMFCXovIjb44CFp2SWUrcC+UpWxw0eXkg==
X-Google-Smtp-Source: AGHT+IEbnOK5MEZLn3qI/u/o7BEClgUIMh+Q50zXFLmPT5dUkz6tZ9h7Rqa5VCJPtPqD4jFv0BZZjg==
X-Received: by 2002:a05:6e02:2581:b0:425:6f0b:a1db with SMTP id e9e14a558f8ab-42e7ad16a3emr170806305ab.9.1759791765261;
        Mon, 06 Oct 2025 16:02:45 -0700 (PDT)
Received: from chromium.org ([50.235.115.130])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-57b5ec55bc7sm5422226173.69.2025.10.06.16.02.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Oct 2025 16:02:44 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Masahiro Yamada <masahiroy@kernel.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v4 2/7] scripts/make_fit: Support an initial ramdisk
Date: Mon,  6 Oct 2025 17:01:53 -0600
Message-ID: <20251006230205.521341-3-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251006230205.521341-1-sjg@chromium.org>
References: <20251006230205.521341-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251006_160247_485559_AA0E936B 
X-CRM114-Status: GOOD (  24.05  )
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

FIT (Flat Image Tree) allows a ramdisk to be included in each
configuration. Add support for this to the script.

This feature is not available via 'make image.fit' since the ramdisk
likely needs to be built separately anyway, e.g. using modules from
the kernel build. A later patch in this series provides support for
doing that.

Note that the uncompressed size is not correct when a ramdisk is use,
since it is too expensive to decompress the ramdisk.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

(no changes since v3)

Changes in v3:
- Add a comment at the top of the file about the -r option
- Count the ramdisk in the total files
- Update the commit message
- Update the commit message

Changes in v2:
- Don't compress the ramdisk as it is already compressed

 scripts/make_fit.py | 52 ++++++++++++++++++++++++++++++++++++++-------
 1 file changed, 44 insertions(+), 8 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 0f5e7c4b8aed..984371f505bc 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -10,10 +10,14 @@
 Usage:
     make_fit.py -A arm64 -n 'Linux-6.6' -O linux
         -o arch/arm64/boot/image.fit -k /tmp/kern/arch/arm64/boot/image.itk
-        @arch/arm64/boot/dts/dtbs-list -E -c gzip
+        -r /boot/initrd.img-6.14.0-27-generic @arch/arm64/boot/dts/dtbs-list
+        -E -c gzip
 
-Creates a FIT containing the supplied kernel and a set of devicetree files,
-either specified individually or listed in a file (with an '@' prefix).
+Creates a FIT containing the supplied kernel, an optional ramdisk, and a set of
+devicetree files, either specified individually or listed in a file (with an
+'@' prefix).
+
+Use -r to specify an existing ramdisk/initrd file.
 
 Use -E to generate an external FIT (where the data is placed after the
 FIT data structure). This allows parsing of the data without loading
@@ -29,8 +33,6 @@ looks at the .cmd files produced by the kernel build.
 
 The resulting FIT can be booted by bootloaders which support FIT, such
 as U-Boot, Linuxboot, Tianocore, etc.
-
-Note that this tool does not yet support adding a ramdisk / initrd.
 """
 
 import argparse
@@ -81,6 +83,8 @@ def parse_args():
           help='Specifies the operating system')
     parser.add_argument('-k', '--kernel', type=str, required=True,
           help='Specifies the (uncompressed) kernel input file (.itk)')
+    parser.add_argument('-r', '--ramdisk', type=str,
+          help='Specifies the ramdisk/initrd input file')
     parser.add_argument('-v', '--verbose', action='store_true',
                         help='Enable verbose output')
     parser.add_argument('dtbs', type=str, nargs='*',
@@ -133,7 +137,28 @@ def write_kernel(fsw, data, args):
         fsw.property_u32('entry', 0)
 
 
-def finish_fit(fsw, entries):
+def write_ramdisk(fsw, data, args):
+    """Write out the ramdisk image
+
+    Writes a ramdisk node along with the required properties
+
+    Args:
+        fsw (libfdt.FdtSw): Object to use for writing
+        data (bytes): Data to write (possibly compressed)
+        args (Namespace): Contains necessary strings:
+            arch: FIT architecture, e.g. 'arm64'
+            fit_os: Operating Systems, e.g. 'linux'
+    """
+    with fsw.add_node('ramdisk'):
+        fsw.property_string('description', 'Ramdisk')
+        fsw.property_string('type', 'ramdisk')
+        fsw.property_string('arch', args.arch)
+        fsw.property_string('os', args.os)
+        fsw.property('data', data)
+        fsw.property_u32('load', 0)
+
+
+def finish_fit(fsw, entries, has_ramdisk=False):
     """Finish the FIT ready for use
 
     Writes the /configurations node and subnodes
@@ -143,6 +168,7 @@ def finish_fit(fsw, entries):
         entries (list of tuple): List of configurations:
             str: Description of model
             str: Compatible stringlist
+        has_ramdisk (bool): True if a ramdisk is included in the FIT
     """
     fsw.end_node()
     seq = 0
@@ -154,6 +180,8 @@ def finish_fit(fsw, entries):
                 fsw.property_string('description', model)
                 fsw.property('fdt', bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii"))
                 fsw.property_string('kernel', 'kernel')
+                if has_ramdisk:
+                    fsw.property_string('ramdisk', 'ramdisk')
     fsw.end_node()
 
 
@@ -274,6 +302,14 @@ def build_fit(args):
     size += os.path.getsize(args.kernel)
     write_kernel(fsw, comp_data, args)
 
+    # Handle the ramdisk if provided. Compression is not supported as it is
+    # already compressed.
+    if args.ramdisk:
+        with open(args.ramdisk, 'rb') as inf:
+            data = inf.read()
+        size += len(data)
+        write_ramdisk(fsw, data, args)
+
     for fname in args.dtbs:
         # Ignore non-DTB (*.dtb) files
         if os.path.splitext(fname)[1] != '.dtb':
@@ -296,12 +332,12 @@ def build_fit(args):
 
         entries.append([model, compat, files_seq])
 
-    finish_fit(fsw, entries)
+    finish_fit(fsw, entries, bool(args.ramdisk))
 
     # Include the kernel itself in the returned file count
     fdt = fsw.as_fdt()
     fdt.pack()
-    return fdt.as_bytearray(), seq + 1, size
+    return fdt.as_bytearray(), seq + 1 + bool(args.ramdisk), size
 
 
 def run_make_fit():
-- 
2.43.0


