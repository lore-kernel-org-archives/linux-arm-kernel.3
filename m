Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B2DFC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 21:45:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTUn5qDH83alwoR8172wGnmaTD/nkQcDeotToQ/FQtU=; b=bkLX9sakTvqDveuQB9ePYNc6E4
	ODgjGRveK2rbfCS9ZP+WAX+SFzs8IBq7X4NBtuxyblzcL0EpUPAoXEJhpNGrbNBWyCTOd6Z3LG142
	hsY+Xxi/LI4dL9lAPTzjgXf5mVhEku84LH50P4k9ufk9fEvyZai+13ejwPRvkJdlqNAgw16ZmYOch
	VUn0skgopZEFHeWWAxnjjeqZFs07pSEZ0omtYD1ykJ5yZjsE8sfPpdYb1oMDIx+pDyIX2E2e8J9e2
	ZhMlALcvp9mnP3huFuLuSvp2o5hh546suTyInJeA8st7aGXuAGtSFHNTS4BebkzGtiKz0/UyRHHtL
	koGVhEpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuek9-000000079ba-0pbD;
	Tue, 18 Mar 2025 21:45:01 +0000
Received: from mail-pl1-x649.google.com ([2607:f8b0:4864:20::649])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuego-0000000790U-1mZn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Mar 2025 21:41:35 +0000
Received: by mail-pl1-x649.google.com with SMTP id d9443c01a7336-224192ff68bso89470445ad.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 18 Mar 2025 14:41:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742334093; x=1742938893; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=eTUn5qDH83alwoR8172wGnmaTD/nkQcDeotToQ/FQtU=;
        b=eNG6aCeomgHFsCpxR5pX00qtnbu4p8f+KdOMZa4tC9a4Reo4EK+9CjKBKr9EPJJXj0
         U/HHXSOXVNfiEtlqjlrRI+CoycAyx+p4dytavWktISAxx7aqN+FaCpkloZKdMQ5mSeoF
         QZfv2zioVoopWKlnTlBvqqrjSMmZtqwxidXH4UNAaijKLFyl2mw5IEVCMOj1DLH7I66N
         e3t5Sz2onitsqH4mBTkAhLgptOijzDE2w7Au5DSk+2DrPXMXJDYkQSSGhOV7CauI9XDl
         eIE3hncpZ1u6SVuRRZPCHA9+lBgjJYeRvlTkHD+G+5DSMVEGnY08wFOMIVEHTjAA7xei
         Yk4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742334093; x=1742938893;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eTUn5qDH83alwoR8172wGnmaTD/nkQcDeotToQ/FQtU=;
        b=PfZQYtVgibvSYx5/bXbBx8SBtfR9069p58Qt1sav+sRy6nVrIEIxgHwM5/qtF6KDVg
         6zdLv0B+3Zd6cJ0bKiyXevejc6cc2AhQjUcqcRjVe2I0T9fxshbotrSuMXB9o2v7AeB3
         /u2zyBRWLnsxydxoCtOlZP1+MNyXleTjOggr3FMwI6u7sakBVFacneaas3UNcGzjAmOD
         3S4FsV4yMyADnEPuYh2YXb6HlHtuOWrDd0msOy+ASHc+nWA1k1/Tmr//iSjebZFPPLZl
         +96h7YA0Rf0KGIbf5tVs2w3+Ta7fIP/DXspsn7uDL7GEWtqNdSjBi0w5oZVQ8+75PW43
         7G1g==
X-Forwarded-Encrypted: i=1; AJvYcCV/08x6fCe8DY6dV1htUp3vePJVxqbhpqNUmEO7+zmvVhbHL9wVgL8P2W4wSv7Parz+WJLFN71q/yoQDzkp/C5r@lists.infradead.org
X-Gm-Message-State: AOJu0YznaoK7AsObnQs3zLM2Kp3voVZneUA0bWF0arUNdakWOTI6juHc
	NUnGmVI8bR0RSM6OUP5CNSLOUQjv/mz56hHTOx5pYfzDRLfv8IX8tmiyHU+wl4v09A==
X-Google-Smtp-Source: AGHT+IG/QGxbxUqv2YDIjQQv/YN/p4GQJhFMy09dmHyQiNHhErBBFph57AE76+yZ/pqecPFGYqZrens=
X-Received: from plsu3.prod.google.com ([2002:a17:902:bf43:b0:223:f487:afc6])
 (user=pcc job=prod-delivery.src-stubby-dispatcher) by 2002:a17:903:2412:b0:223:3ef1:a30a
 with SMTP id d9443c01a7336-22649a57c52mr3056545ad.45.1742334093068; Tue, 18
 Mar 2025 14:41:33 -0700 (PDT)
Date: Tue, 18 Mar 2025 14:40:32 -0700
In-Reply-To: <20250318214035.481950-1-pcc@google.com>
Mime-Version: 1.0
References: <20250318214035.481950-1-pcc@google.com>
X-Mailer: git-send-email 2.49.0.395.g12beb8f557-goog
Message-ID: <20250318214035.481950-2-pcc@google.com>
Subject: [PATCH v2 1/2] string: Add load_unaligned_zeropad() code path to sized_strscpy()
From: Peter Collingbourne <pcc@google.com>
To: Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Kees Cook <kees@kernel.org>, 
	Andy Shevchenko <andy@kernel.org>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Mark Rutland <mark.rutland@arm.com>
Cc: Peter Collingbourne <pcc@google.com>, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_144134_462762_B78D22BE 
X-CRM114-Status: GOOD (  14.61  )
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

The call to read_word_at_a_time() in sized_strscpy() is problematic
with MTE because it may trigger a tag check fault when reading
across a tag granule (16 bytes) boundary. To make this code
MTE compatible, let's start using load_unaligned_zeropad()
on architectures where it is available (i.e. architectures that
define CONFIG_DCACHE_WORD_ACCESS). Because load_unaligned_zeropad()
takes care of page boundaries as well as tag granule boundaries,
also disable the code preventing crossing page boundaries when using
load_unaligned_zeropad().

Signed-off-by: Peter Collingbourne <pcc@google.com>
Link: https://linux-review.googlesource.com/id/If4b22e43b5a4ca49726b4bf98ada827fdf755548
Fixes: 94ab5b61ee16 ("kasan, arm64: enable CONFIG_KASAN_HW_TAGS")
Cc: stable@vger.kernel.org
---
v2:
- new approach

 lib/string.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/lib/string.c b/lib/string.c
index eb4486ed40d25..b632c71df1a50 100644
--- a/lib/string.c
+++ b/lib/string.c
@@ -119,6 +119,7 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	if (count == 0 || WARN_ON_ONCE(count > INT_MAX))
 		return -E2BIG;
 
+#ifndef CONFIG_DCACHE_WORD_ACCESS
 #ifdef CONFIG_HAVE_EFFICIENT_UNALIGNED_ACCESS
 	/*
 	 * If src is unaligned, don't cross a page boundary,
@@ -133,12 +134,14 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	/* If src or dest is unaligned, don't do word-at-a-time. */
 	if (((long) dest | (long) src) & (sizeof(long) - 1))
 		max = 0;
+#endif
 #endif
 
 	/*
-	 * read_word_at_a_time() below may read uninitialized bytes after the
-	 * trailing zero and use them in comparisons. Disable this optimization
-	 * under KMSAN to prevent false positive reports.
+	 * load_unaligned_zeropad() or read_word_at_a_time() below may read
+	 * uninitialized bytes after the trailing zero and use them in
+	 * comparisons. Disable this optimization under KMSAN to prevent
+	 * false positive reports.
 	 */
 	if (IS_ENABLED(CONFIG_KMSAN))
 		max = 0;
@@ -146,7 +149,11 @@ ssize_t sized_strscpy(char *dest, const char *src, size_t count)
 	while (max >= sizeof(unsigned long)) {
 		unsigned long c, data;
 
+#ifdef CONFIG_DCACHE_WORD_ACCESS
+		c = load_unaligned_zeropad(src+res);
+#else
 		c = read_word_at_a_time(src+res);
+#endif
 		if (has_zero(c, &data, &constants)) {
 			data = prep_zero_mask(c, data, &constants);
 			data = create_zero_mask(data);
-- 
2.49.0.395.g12beb8f557-goog


