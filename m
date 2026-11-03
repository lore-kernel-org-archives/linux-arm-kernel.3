Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16771606BFA3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=RtUu8M2y;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Y8iYUtsi
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=RHjaZF/zEkaSXrLeJORF1ZXTNpz5Xq3a/jlyVJC+lRo=; b=RtUu8M2yuXhItV
	jEITooMOTO47xDO6l0k9ThUd9BTJz6WdDaVLkMECww32VvF5pwnHerUdLqO8pAJhvWr1obwgOlzsj
	E8iJT0DeuhFY6cxg5hbcugfhqxoiHtfMuBpdHqzqMzIFivL4J9slr2a0Tm/gRyf6tUlYFFulrUhgO
	lBef4wsmX6V6gnlILSDXrDxgfjTCc07/e+R3js7iXWBdk2+ElSn+zIfHsgkYmuUgkb45hvydX9C3E
	IhcZY6fHp7K5OAJwS7lrPEV26lkjtBK7VWmXW9ZGgywcOQu+iZpw05EyIodENlVxVHpx6gC19q4ta
	7P8XF2iVSl2IKwazM6hQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBbI-00000001xnS-3g9b;
	Tue, 03 Nov 2026 10:18:44 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBao-00000001xXc-3Gtv
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:18:38 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-33fb4680717so6561574eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:18:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701094; x=1794305894; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=RHjaZF/zEkaSXrLeJORF1ZXTNpz5Xq3a/jlyVJC+lRo=;
        b=Y8iYUtsiiQw2AzJhBwXfq3mKUj+PXrm8C6G+oxqQFJK9dQieRy03zNH+hbxjIxPdK6
         1OhWFXgLcFI2rtO+DZ+rm8u17QUmiSEXXyotLKH0RWMjzA9o3AiY9j6fSL6FaDdJtJst
         sWzb5Sx3LS+mM/brC2wHaFBXuLaWx11+FsEZ7vXkhHBzwWYW+WHoskk1XPrlSmiZqSuI
         WFcoMTUMW/FgjPaMvjs8Xtjb5ZQxU9dPyYAJDMaGzV4PbyGYLFbUOousTXD6P5PcjSr4
         CLvtAKnl8dCXpUhR7Ui832BpRsfY587F5rWUg+HKCaXpcPqvMvH/ySS1DizAamivDWT4
         z6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701094; x=1794305894;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=RHjaZF/zEkaSXrLeJORF1ZXTNpz5Xq3a/jlyVJC+lRo=;
        b=Vtn1rSqW78cpUbe2TmN4pt9yrS46o09APz+vruEXlpTqMcvSakzCupHmdYrceEHw7C
         EdGZUMdK0XkdjnGGDGNytH5Vj7XfpCsuiFfc7c1ncvKyGr39jMFBk7Q66qpsBmbsFb4Z
         5lI42Ozb7MvYOASil2+cp+bwTeBIU6UQU9NuSc8AQ+KYN1ZhoS+P3HdMVsQCaIoY+Jww
         u/KHSAA87xSf1JmzRiUQEZFkoT+/a2E28Zn16/V4j3B8szmjh5/ti3KN0i7Pgs/gjM3c
         MSbRKeYidASFGauSEn8RVSPnbLUQwmOifpmAkdhySTN/XE9wHZNn+pE3CDi6jVYnrZo5
         hspA==
X-Forwarded-Encrypted: i=1; AKwUvBxvICL2mO0X9LcTDWVO4udFMbATvh6mHgralMo5YHalcWqUsv4Icu+sSsfeEZzRiGjgMU68e4RJzACeBt7BLoOX@lists.infradead.org
X-Gm-Message-State: APuU4Z+rNZA4DuXkD2x4jd3a+1zdmlnGSxeb7bxPEL5DSgzZq2Jfr1bL
	45nZJEGpwh6kJjMkjPVDFVI4zZCnDwG/bZEhwZKHMRVcvsT1DZIBjtl6
X-Gm-Gg: AYBFou3v+NhYEmFQYBFZ6/V9/rmXo60xvtAJjYYUfW0oXQt5RswIRYTywXm6Dxq9mJe
	t0JM+u4E2ZCuX8Q/hLxFPwGrQdco6ydF2ZGNI7X4IDHDWC7R90dOeVLjrWN8l29GSEzKYf0nKcU
	giU+OC/XYcx4pFqUNqrVCKxMEE6naieWGd+CY4qb3m4xfsE+UmG3WyKZQF6vtIP7UbtsZxic8jz
	qF+DH0lJUzTk1bI2/lvV25F8nBzYvvcZaSN39WsKYO/Z6fCYhwxUOFencjoUaTyIvyIOObzrxFA
	hbaPOlN7CT1Xr+AzRVSBzTX9u46RC5fTGJIhDFaOA6aGAwFUrPmpkOAHm0UCn6feBesjUsa80J4
	Fdz3G6Xd4OmwexIQwkOCUSIV234jwL3Gu7i4RPJKxPYoB6uZnQFqQWnXPF8DfOLz3Y7LdVrrUYl
	/mhBnyMM4f6pQVejODre1Og48D/jYV3wuz0qfrAqOf+ceh2OdssQ1vhFo9mOSWgNFzK3qZ8D29Q
	8szzhtYo8gSGKaVp/jCStE9ecSu7ITNuM5F5fk6Fop6MFr2rMk/uqe1tmcFWHAmWAg84SFbCTiK
	OLOD1IENhNhGP11NwHfd2qEmHZtNzQ==
X-Received: by 2002:a05:7301:18af:b0:36c:9b35:5d45 with SMTP id 5a478bee46e88-36c9b356dd1mr806355eec.25.1793701094017;
        Tue, 03 Nov 2026 02:18:14 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:18:13 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 09/10] mm/vmalloc: map contiguous pages in batches for vmap() if possible
Date: Tue,  3 Nov 2026 18:16:57 +0800
Message-Id: <20261103101658.766905-10-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021817_171898_F6C30842 
X-CRM114-Status: GOOD (  21.04  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

In many cases, the pages passed to vmap() may include high-order
pages. For example, the systemheap often allocates pages in descending
order: order 8, then 4, then 0. Currently, vmap() iterates over every
page individually—even pages inside a high-order block are handled
one by one.

This patch detects physically contiguous pages (regardless of whether
they are compound or non-compound) by scanning with
num_pages_contiguous(), and maps them as a single contiguous block
whenever possible. The mapping order is determined by taking the
minimum of the contiguous page count and the pfn alignment, allowing
graceful degradation when pfn alignment is less than the contiguous
range.

Pages with the same page_shift are coalesced and mapped via
vmap_pages_range_noflush_walk() to avoid page table rewalk.

As users typically allocate memory in descending orders (e.g.
8 → 4 → 0), once an order-0 page is encountered, we stop scanning
for contiguous pages since subsequent pages are likely order-0 as well.

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Co-developed-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Dev Jain <dev.jain@arm.com>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---

Sashiko review: flagged a potential NULL pointer dereference -- with
HUGE_VMAP enabled, a NULL entry in the pages array reaches
page_to_pfn()/num_pages_contiguous() in get_vmap_mapping_order() before
the WARN_ON(!page) safeguard in vmap_pages_pte_range() runs.

This is not a bug: vmap()'s contract requires the caller to pass an
array of valid pages. The WARN_ON(!page) is a defensive sanity check,
not part of the API contract -- passing NULL pages has always been a
caller bug. get_vmap_mapping_order() runs on the same pages array that
vmap() received, so a caller passing NULL pages is already broken
regardless of whether we batch.

 mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 1 file changed, 80 insertions(+), 2 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index ee2c1ec4ff1f..42b3addd20f9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -3613,6 +3613,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
 	return arch_vmap_pte_supported_shift(size);
 }
 
+static inline int get_vmap_mapping_order(struct page **pages,
+		pgprot_t prot, unsigned int nr_pages)
+{
+	unsigned long pfn;
+	unsigned int nr_contig;
+	int order;
+
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
+		return 0;
+
+	/* Limit nr_pages by pfn alignment */
+	pfn = page_to_pfn(*pages);
+	if (pfn > 0)
+		nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
+
+	nr_contig = num_pages_contiguous(pages, nr_pages);
+	if (nr_contig < 2)
+		return 0;
+
+	order = ilog2(nr_contig);
+
+	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
+		return 0;
+
+	return order;
+}
+
+static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages)
+{
+	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
+	unsigned int prev_shift = 0, batch_idx = 0;
+	unsigned long batch_start = addr, batch_end = addr;
+	int err;
+
+	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
+					     PAGE_SHIFT, GFP_KERNEL);
+
+	if (err)
+		goto out;
+
+	for (unsigned int i = 0; i < nr_pages; ) {
+		unsigned int shift = PAGE_SHIFT +
+			get_vmap_mapping_order(pages + i, prot, nr_pages - i);
+
+		if (!i)
+			prev_shift = shift;
+
+		if (shift != prev_shift) {
+			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
+					prot, pages + batch_idx, prev_shift);
+			if (err)
+				goto out;
+			prev_shift = shift;
+			batch_start = batch_end;
+			batch_idx = i;
+		}
+
+		/*
+		 * Once we fail to batch pages, we expect to fail batching
+		 * for all remaining pages, so just give up.
+		 */
+		if (shift == PAGE_SHIFT)
+			break;
+
+		batch_end += 1UL << shift;
+		i += 1U << (shift - PAGE_SHIFT);
+	}
+
+	/* Remaining */
+	if (batch_start < end)
+		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
+				pages + batch_idx, prev_shift);
+
+out:
+	flush_cache_vmap(addr, end);
+	return err;
+}
+
 /**
  * vmap - map an array of pages into virtually contiguous space
  * @pages: array of page pointers
@@ -3656,8 +3735,7 @@ void *vmap(struct page **pages, unsigned int count,
 		return NULL;
 
 	addr = (unsigned long)area->addr;
-	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
-				pages, PAGE_SHIFT) < 0) {
+	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
 		vunmap(area->addr);
 		return NULL;
 	}
-- 
2.34.1


