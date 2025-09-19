Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD4F6CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 22:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GuH2MBotnVgm/KcFiuPMrEV+WdPjTxaJwI5CcIOrjDY=; b=pTaPOttlBVPorhOYlwfzS2dkgo
	5iS1XdCQjcHPvAxksDOe/24ss02ZViooTKj7MLk456H3pPhfwOqspuS8FFmKuAaore4Q9JzzBjICV
	/yAWF41DenEbbhRYUhAnnjC/1SAU8BecVMp5g/jtFjJQflWjanbAYnzqYKStM0SzXR5hrPnmHm3lv
	AbDUMFmp5FaUhPXA/OavIAyoBusTryhlgtGP9m0zewDt/rpjhLaWWB+WSgZVlpnNkIExSuBvbkxIC
	x0H1+AmEkO8U77bi6cmGWr2XLg4XOUfb/AsGPOw+tshD5cUBi/lcMXQcdsVunFQfhEJ1s/CgDd0sn
	H1f3AJyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjsM-00000004Fxv-0mN4;
	Fri, 19 Sep 2025 22:46:46 +0000
Received: from mail-il1-x135.google.com ([2607:f8b0:4864:20::135])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzjsK-00000004Fww-21TO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 22:46:45 +0000
Received: by mail-il1-x135.google.com with SMTP id e9e14a558f8ab-42403719c73so26011555ab.0
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 15:46:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758322003; x=1758926803; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=GuH2MBotnVgm/KcFiuPMrEV+WdPjTxaJwI5CcIOrjDY=;
        b=I/KDSnpdG+w3k4/MyCSx+ZXl53LcBWY4bRZSogGllqz1BGyH/KmycnOybb9FfnJyHJ
         mSXrxJTgQ0K4tkGAv6YDBuoIRQMM8traS/8fxiUvvI/Nlc7qwC4C/waSLYjAFNk0lxsS
         sAjq9cYtcrOyADQ6a7wkgQIA1iUlLFUzPLssQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758322003; x=1758926803;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GuH2MBotnVgm/KcFiuPMrEV+WdPjTxaJwI5CcIOrjDY=;
        b=bKf2JYF2DGbn4K8hsqi7wKg5G35NDgeYiBsWn9Q3/yYDwKdEpp7LkrA63Yvrldj1Dm
         mceA/InxORrZOLpom0D4HXPlPnzsnkkuUKH/DWrL7URsW6wPIxyQWWkD7hLf5VilGDas
         dKNm5oFvNb6mKU29MpoP7BhFJukSQYxl0wpFaMUPsV5wu0pV6sqiIjGZRuM0S0+G0dEW
         f1A49aYN9nLTHC/DhqM4Y/QzQisHYTWLfdEhEEm5ckgUOXZdAZFiMTLAbLnNlVXEX6ey
         iOhwMkQJLDb5np6b0lp44m0JpNwDgdnAf3WQo3gKiAfa96DDYtaDMwb33ZbI/HwZ/Hl2
         I6/A==
X-Gm-Message-State: AOJu0YxQ9aFVMsSgjX8QMjh8o5mzCcz78ai3IN8s3QmaHVhILRotOgpD
	rYe0pCeItTn4PAHW43gGV/nWrV9lXt8ZKYKxN+/3778LW715DhWgpxqGbvPDG+CYGXXW0kjQDrE
	nZi3z4Q==
X-Gm-Gg: ASbGncvowdCP0nRUn/XkrAEWp/NwzUFx3eLx0SzJUCyxJJhnDuHSeEJQD1qegqFfymL
	WMC6bztEGvhJmOIUVruipuQSZ7kWpQV8pl7XcrGMlE92PcGzvzhhroQScIZFxinuFFL/mJIAiFu
	nwEst9KY8cNjEC+CWY3b9Ui/8+CAWMJcWOG5drpUg+DxLmOcnaUyBZl38F2I9KY3MGT5zTLg6Iu
	ci45Dhz+0ufGWGc73NnkWAfNt/gfefjjTO9cF5GPQR/u6SoYWbvgkWsnFgGMsld6IAGu6Eu6w7V
	AYGBmDE7CftZINg6s9cIj6RmjFBi8rGLPHCaOqR1QiqsnM0Mu0Gm/FZSYQ49Yhs8hE3hDo0LkKd
	RjnN9d1p74BCncijw
X-Google-Smtp-Source: AGHT+IH1joaNFFBUlmJSRWwYgfP/Jl1wfWiGMU8D8ShdnjXorvf9uY1FmfBG1WmwA8Z3f8m8D9fxdg==
X-Received: by 2002:a05:6e02:1c21:b0:408:4492:c9c2 with SMTP id e9e14a558f8ab-424819115acmr78580765ab.10.1758322002709;
        Fri, 19 Sep 2025 15:46:42 -0700 (PDT)
Received: from chromium.org ([96.79.232.53])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d58bed61bsm2581743173.82.2025.09.19.15.46.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 15:46:42 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Tom Rini <trini@konsulko.com>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 1/2] scripts/make_fit: Support an initial ramdisk
Date: Fri, 19 Sep 2025 16:46:24 -0600
Message-ID: <20250919224639.1122848-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_154644_542545_18C79FED 
X-CRM114-Status: GOOD (  19.04  )
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

FIT (Flat Image Tree) allows an ramdisk to be included in each
configuration. Add support for this to the script.

This feature is not available via 'make image.fit' since the ramdisk
likely needs to be built separately anyway, e.g. using modules from
the kernel build.

Signed-off-by: Simon Glass <sjg@chromium.org>
---

Changes in v2:
- Don't compress the ramdisk as it is already compressed

 scripts/make_fit.py | 46 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 40 insertions(+), 6 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1683e5ec6e67..b4caa127d2c3 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -10,10 +10,12 @@
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
 
 Use -E to generate an external FIT (where the data is placed after the
 FIT data structure). This allows parsing of the data without loading
@@ -29,8 +31,6 @@ looks at the .cmd files produced by the kernel build.
 
 The resulting FIT can be booted by bootloaders which support FIT, such
 as U-Boot, Linuxboot, Tianocore, etc.
-
-Note that this tool does not yet support adding a ramdisk / initrd.
 """
 
 import argparse
@@ -81,6 +81,8 @@ def parse_args():
           help='Specifies the operating system')
     parser.add_argument('-k', '--kernel', type=str, required=True,
           help='Specifies the (uncompressed) kernel input file (.itk)')
+    parser.add_argument('-r', '--ramdisk', type=str,
+          help='Specifies the ramdisk/initrd input file')
     parser.add_argument('-v', '--verbose', action='store_true',
                         help='Enable verbose output')
     parser.add_argument('dtbs', type=str, nargs='*',
@@ -133,7 +135,28 @@ def write_kernel(fsw, data, args):
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
@@ -143,6 +166,7 @@ def finish_fit(fsw, entries):
         entries (list of tuple): List of configurations:
             str: Description of model
             str: Compatible stringlist
+        has_ramdisk (bool): True if a ramdisk is included in the FIT
     """
     fsw.end_node()
     seq = 0
@@ -154,6 +178,8 @@ def finish_fit(fsw, entries):
                 fsw.property_string('description', model)
                 fsw.property('fdt', bytes(''.join(f'fdt-{x}\x00' for x in files), "ascii"))
                 fsw.property_string('kernel', 'kernel')
+                if has_ramdisk:
+                    fsw.property_string('ramdisk', 'ramdisk')
     fsw.end_node()
 
 
@@ -274,6 +300,14 @@ def build_fit(args):
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
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fit

