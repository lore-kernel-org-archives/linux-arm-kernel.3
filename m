Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C772CE9D78
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 16:28:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQo1oqJAVo44ptfZ9oLDxIXzqeCSewp3mycJJep0ovk=; b=BOeYOHwno1XenVO0i+UTzG5qdc
	6/jCizvwomexW6J2J+biiiWL5xeOrLtj5EBFYtD7KlCBu5oado9u+26Frc0TejoLg5bWVz+ZEPGGA
	v+OzludAkBn04rV6XvBYecXnJnOnFEP69MSO9UEfPUPOL0xDLeDcIR9ntOO1SOQogYptQOSDDW0A5
	pH5OHqMsVQ80xghLYgBuqzuQkl8Y8jW/R0+4tAiWeDXHHFiBlfp/yEsYf4eZl4IkogNf1LgQMjDtg
	1VADwhV/UWsQEXRf1K1ZSfvcxHiLYwu7U0y51saZEfZ1PbDyoc2ieTGaN4J+qNogCC1rFPRko37Hv
	Mc0mAjaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uq-0000000DUEm-1psG;
	Tue, 06 Jan 2026 16:28:16 +0000
Received: from mail-ot1-x342.google.com ([2607:f8b0:4864:20::342])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd9uo-0000000DUCH-0DoR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 16:28:15 +0000
Received: by mail-ot1-x342.google.com with SMTP id 46e09a7af769-7c6d13986f8so859248a34.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 06 Jan 2026 08:28:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1767716892; x=1768321692; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OQo1oqJAVo44ptfZ9oLDxIXzqeCSewp3mycJJep0ovk=;
        b=OEUbhCQiqTz3E88hSxCy9qtKgpsYhmeOsfrKd0MOkZdDuNo6U0CtiEAGgA3ibWJ5PK
         oDtiCfnUIt4PbrZ3XeVH3Xs6/or2eEWgHoIGmL6stm2THj9McPJsxFDhCwzwt7LW9yzS
         IzMt3R1/1X0jt4EcKA/dTA82Bny8a6TU+WR8s=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767716892; x=1768321692;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=OQo1oqJAVo44ptfZ9oLDxIXzqeCSewp3mycJJep0ovk=;
        b=gyZDNpNm/o3YhTLIK3LnP2spOX62C9OCDvT3rEh/UHRB/qK2RDtXgQKr7icyEPECMS
         lKS/LrXhH1gDc2buIbxBUWKgOtcj65SBzHJMV3Jv31GkQ8MIddF3IISrpUoXCh072IxU
         QyWR2nZXJl4au6PeRmbiVTfHXlwcKibcqr5vLXcW3irqSlgUjxHCnCIs1+NwyRqip0Lr
         t3Wvr3vWVApOD7PiLaiyI93cJpi69g+QPVgp/H6/K9Wr2nef3wS/fL/pfHaSQZ4FllG7
         L4LQL68R/atJRy8e79QH6dLUMZSsFPFvm+FRf7y06Q8xyUeUZQVTUXvgu6nNJXquLa6g
         wkAA==
X-Gm-Message-State: AOJu0YwMMVRuNLZE1PYEPpOomsH1vGDKnD1nxm5gIXa9zVWOJV1quI+2
	twoL1+GXkvoHveyJWeIhT+x6mtld2Nypw/GjvOF/pxi+tZ9rfdJE3jffdjhEa5ZSDMbVmXmo8za
	JrhA=
X-Gm-Gg: AY/fxX4irYM6nAUWW08xKtHROocTqByheGBkUIJCmeAxPTfiU0JsYsaCCT4Bg4kIhnZ
	9OBc+f28dsbFbZwnxWOgB4lPb/gIUbtfHgwaMB5wZfXS8bXqU6lFjLEax1wvDW9M4GKndmHSte3
	XvflcDxfu0DCe57i4gRMV6S16woyWU93v11ZwB2FqLbBRzlD+ZSCV5R5lt9XQq1kaIZQG+LSAPy
	04Tvf3ldt4RaS3g5e5DPel06EZmE6LalQ16DEddehnlIVXQ2Vw4UgD/6gEIHFPmEfmTW2ziREoz
	qxaBP8gIXnZckhjvyuYhhu02dUmjKacDmbcjwDsTrzsU/6BvxIKAfOlQiJjPKW9eNvKu/k8qC+d
	YmstGwXveRUlpCHP4gZdGy/qnyAgjxfR0Lvk2XTwWm/3lZxieIspCov6VehdRLlceb0PesMRFL9
	o3av60
X-Google-Smtp-Source: AGHT+IGuJABBFnzvQfwuTK8ad1RpY2J0r9aGrWVcqmMOekBUx5pLw74qr+O3uLebVoUpSRypznVpqQ==
X-Received: by 2002:a05:6830:4588:b0:7c7:7f85:d19 with SMTP id 46e09a7af769-7ce46cae1b1mr1464100a34.8.1767716892094;
        Tue, 06 Jan 2026 08:28:12 -0800 (PST)
Received: from chromium.org ([73.34.74.121])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7ce478af8b2sm1630951a34.15.2026.01.06.08.28.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 06 Jan 2026 08:28:09 -0800 (PST)
From: Simon Glass <sjg@chromium.org>
To: linux-arm-kernel@lists.infradead.org
Cc: =?UTF-8?q?Thomas=20Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>,
	=?UTF-8?q?J=20=2E=20Neusch=C3=A4fer?= <j.ne@posteo.net>,
	Masahiro Yamada <masahiroy@kernel.org>,
	Ahmad Fatoum <a.fatoum@pengutronix.de>,
	Nicolas Schier <nicolas@fjasle.eu>,
	Tom Rini <trini@konsulko.com>,
	Chen-Yu Tsai <wenst@chromium.org>,
	Simon Glass <sjg@chromium.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kernel@vger.kernel.org
Subject: [PATCH v9 3/6] scripts/make_fit: Move dtb processing into a function
Date: Tue,  6 Jan 2026 09:27:33 -0700
Message-ID: <20260106162738.2605574-4-sjg@chromium.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260106162738.2605574-1-sjg@chromium.org>
References: <20260106162738.2605574-1-sjg@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_082814_097690_20207B6B 
X-CRM114-Status: GOOD (  17.29  )
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

Since build_fit() is getting quite long, move the dtb processing into a
separate function.

Change the double quotes in the write() call to single, to match the
rest of the script.

Signed-off-by: Simon Glass <sjg@chromium.org>
Reviewed-by: Nicolas Schier <nsc@kernel.org>
Reviewed-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
Reviewed-by: Chen-Yu Tsai <wenst@chromium.org>
---

(no changes since v7)

Changes in v7:
- Add a note about the " -> ' change

 scripts/make_fit.py | 67 +++++++++++++++++++++++++++++----------------
 1 file changed, 44 insertions(+), 23 deletions(-)

diff --git a/scripts/make_fit.py b/scripts/make_fit.py
index 66cd73711506..7ddaf3c0d783 100755
--- a/scripts/make_fit.py
+++ b/scripts/make_fit.py
@@ -277,6 +277,47 @@ def process_dtb(fname, args):
 
     return (model, compat, files)
 
+
+def _process_dtbs(args, fsw, entries, fdts):
+    """Process all DTB files and add them to the FIT
+
+    Args:
+        args: Program arguments
+        fsw: FIT writer object
+        entries: List to append entries to
+        fdts: Dictionary of processed DTBs
+
+    Returns:
+        tuple:
+            Number of files processed
+            Total size of files processed
+    """
+    seq = 0
+    size = 0
+    for fname in args.dtbs:
+        # Ignore non-DTB (*.dtb) files
+        if os.path.splitext(fname)[1] != '.dtb':
+            continue
+
+        try:
+            (model, compat, files) = process_dtb(fname, args)
+        except Exception as e:
+            sys.stderr.write(f'Error processing {fname}:\n')
+            raise e
+
+        for fn in files:
+            if fn not in fdts:
+                seq += 1
+                size += os.path.getsize(fn)
+                output_dtb(fsw, seq, fn, args.arch, args.compress)
+                fdts[fn] = seq
+
+        files_seq = [fdts[fn] for fn in files]
+        entries.append([model, compat, files_seq])
+
+    return seq, size
+
+
 def build_fit(args):
     """Build the FIT from the provided files and arguments
 
@@ -289,7 +330,6 @@ def build_fit(args):
             int: Number of configurations generated
             size: Total uncompressed size of data
     """
-    seq = 0
     size = 0
     fsw = libfdt.FdtSw()
     setup_fit(fsw, args.name)
@@ -310,34 +350,15 @@ def build_fit(args):
         size += len(data)
         write_ramdisk(fsw, data, args)
 
-    for fname in args.dtbs:
-        # Ignore non-DTB (*.dtb) files
-        if os.path.splitext(fname)[1] != '.dtb':
-            continue
-
-        try:
-            (model, compat, files) = process_dtb(fname, args)
-        except Exception as e:
-            sys.stderr.write(f"Error processing {fname}:\n")
-            raise e
-
-        for fn in files:
-            if fn not in fdts:
-                seq += 1
-                size += os.path.getsize(fn)
-                output_dtb(fsw, seq, fn, args.arch, args.compress)
-                fdts[fn] = seq
-
-        files_seq = [fdts[fn] for fn in files]
-
-        entries.append([model, compat, files_seq])
+    count, fdt_size = _process_dtbs(args, fsw, entries, fdts)
+    size += fdt_size
 
     finish_fit(fsw, entries, bool(args.ramdisk))
 
     # Include the kernel itself in the returned file count
     fdt = fsw.as_fdt()
     fdt.pack()
-    return fdt.as_bytearray(), seq + 1 + bool(args.ramdisk), size
+    return fdt.as_bytearray(), count + 1 + bool(args.ramdisk), size
 
 
 def run_make_fit():
-- 
2.43.0


