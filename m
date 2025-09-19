Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8C4CCAC5A8
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 21:10:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=U6kzpx7PuET5YG7VGCa/gaPyl4PFThzaxgxQk1CSqzg=; b=P9YCpJRzlpF40aIFOP4tVearqN
	0Xgi0nmUs4F29MnXo1vPg5F7g2TRXce9rUogkAXGNrmleOfsml8n6e8nUApe/x04PXyvcmUG7FUJz
	pHXDLXp3aml0SyCYIRpbMfqh31MEOjz5/wSvnqhq2D3LP71gNLRUBY+vumtS9l9nYeH0mntg6nlN5
	gAzJyCQpz+vGSDvIDYK+LEvgZWsTIsyl12AA4GP6kclAWRP66tdRKZ2IsfqIsG0kf6cSTdWs0hpkE
	A8lAnr4UeUgptqBUgS/Dx7pniOSmGaH0HGn81+BMHC51+kNoH/ZiogkXIsPPF8iIgXjJED4GabVse
	poveqTuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziN2-000000043NS-29wI;
	Fri, 19 Sep 2025 21:10:20 +0000
Received: from mail-il1-x130.google.com ([2607:f8b0:4864:20::130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uziMz-000000043LV-0sJU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 21:10:18 +0000
Received: by mail-il1-x130.google.com with SMTP id e9e14a558f8ab-4247d991161so10113145ab.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 19 Sep 2025 14:10:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1758316215; x=1758921015; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=U6kzpx7PuET5YG7VGCa/gaPyl4PFThzaxgxQk1CSqzg=;
        b=A3ruKJFIuvCxX1R6LgRa9Xp8NQcn1Fc/2VOYRILbqiFfvBcENt/WkAnB1UERYluL3H
         N+rRT8rpaHCzycbIJvxQb97YAy7NwRvLbANLogq9iInoUItEAWdsbNEOv72G4SNI0mzT
         sSya5ZfPkkJ56Ttx8m++kjcXdHrxc+oF5+gvg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758316215; x=1758921015;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=U6kzpx7PuET5YG7VGCa/gaPyl4PFThzaxgxQk1CSqzg=;
        b=Mxp3rYGYKZmMy4Ntti+pzdB7xitr6uqrL3cDIMLiKIZe3ykXJhYmaLv+6f+0NcWqiH
         XsclQFz5pjuWdjKr8BEGOC8+66iQ6cC4MbPG/1fwNs5GYV+GZ6MWy/KnSzsGBd10z9KZ
         bwsV8llgnqatk+g5zqcRgRzUDoCkqVfCPfdUue3mVNeLd4DUO3BIODSktkPwQULi+ZY7
         uTlDMllMGi/8Kgz8QtGCCvY2COt/67liFB/wGSwm1A6N9JObYpZwDbkGpMGpTe2Hr6I+
         KkzRJ3UqJqS2ytIk81zZKUmHK+TfpSUuQgnZV/Sc6U+0sRTtOu45ZEqCtncHnQtftSmC
         6Pnw==
X-Gm-Message-State: AOJu0Yx4MilKZKYHeJ5TQ9CzazoZ8CByTw/ap/KYhhT+WG2u9J+aqdhw
	VwOvdfaACPX69EkwQ1n7bQzdUzUQKm2n7KYvQkWT8DSuvMkxHm6c0cgNiAa7IFaQqGo//5c0TZv
	D0PvQLA==
X-Gm-Gg: ASbGncvR6VKTUobVg/VTI5DgWHp4pTtp+cvKdzOflK1r34IF4jSLu2TZGafachh9aPF
	KOc7IjQRgp4y3naZng+qgdW6HtVLJ1y74KdzFYZ3fKr/sVnn1aO573Sqc5R9vjfXmfR5L6byhuZ
	P5t4XzxWzIcZRcPQ1poJovcXypCVh1sDuEhTSzDzR3YOBte0EMifWF3kfivAaDhhA4muffS8fTb
	LXgEMc1olzNCzF9YfZoJ2eD2v0F8UeuDvO8IGpQGWhXxhpdODI8zZu0h3M54JDL5MeE7vVBAEpc
	Jaq6qHAqnQ2Q5I8IIQZS/Fx1wA4aqwdS/QFYKeyxVBaiRQ+jsf3jhNbp2Wa2AEV3HryhweT5u8i
	p5qatY6kgepcmK0SwfGZR61V1Cn4=
X-Google-Smtp-Source: AGHT+IHKmT4xaJZbwqHmJdVZ0iaAsPxl4/+9IIfOk8OLoGXCmH5OmfwufWJ3RQfWwDFIzzKhhQ3Pog==
X-Received: by 2002:a05:6e02:17ca:b0:3f0:7ad2:2bf5 with SMTP id e9e14a558f8ab-42481924952mr86717955ab.12.1758316215285;
        Fri, 19 Sep 2025 14:10:15 -0700 (PDT)
Received: from chromium.org ([96.79.232.53])
        by smtp.gmail.com with ESMTPSA id 8926c6da1cb9f-53d56e41ec1sm2513604173.72.2025.09.19.14.10.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Sep 2025 14:10:14 -0700 (PDT)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Tom Rini <trini@konsulko.com>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Simon Glass <sjg@chromium.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH 1/2] scripts/make_fit: Support an initial ramdisk
Date: Fri, 19 Sep 2025 15:09:57 -0600
Message-ID: <20250919211000.1045267-1-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_141017_304067_4D097838 
X-CRM114-Status: GOOD (  17.71  )
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

 scripts/make_fit.py | 47 +++++++++++++++++++++++++++++++++++++++------
 1 file changed, 41 insertions(+), 6 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 1683e5ec6e67..c43fd9d60809 100755
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
@@ -133,7 +135,30 @@ def write_kernel(fsw, data, args):
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
+            compress: Compression algorithm to use, e.g. 'gzip'
+    """
+    with fsw.add_node('ramdisk'):
+        fsw.property_string('description', 'Ramdisk')
+        fsw.property_string('type', 'ramdisk')
+        fsw.property_string('arch', args.arch)
+        fsw.property_string('os', args.os)
+        fsw.property_string('compression', args.compress)
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
 
 
@@ -274,6 +302,13 @@ def build_fit(args):
     size += os.path.getsize(args.kernel)
     write_kernel(fsw, comp_data, args)
 
+    # Handle the ramdisk if provided
+    if args.ramdisk:
+        with open(args.ramdisk, 'rb') as inf:
+            comp_data = compress_data(inf, args.compress)
+        size += os.path.getsize(args.ramdisk)
+        write_ramdisk(fsw, comp_data, args)
+
     for fname in args.dtbs:
         # Ignore non-DTB (*.dtb) files
         if os.path.splitext(fname)[1] != '.dtb':
-- 
2.43.0

base-commit: 846bd2225ec3cfa8be046655e02b9457ed41973e
branch: fit

