Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49BE5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 05:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=; b=oMRvjcQYw0SXWc6dSDQnWHxDih
	7M0TsUcjBHlwQCwYgqcrdBLLdg17GiBkQlKRgx1iR9wxxoad5spAN7pOO1kd4EZ3a+vwAs8HResPO
	R2oVYwnrzMHmpQUipDNggoeQJ6rNqaJWJFExm43O8PnQRV1af0sE9XUmQjCieQZU3MAkDRDUFEBRS
	wx4vS2IzEDskG9ybdc/fcMoy6t7M6LoUp2bJ58Qo8ok4KslPtLnkPYoSQootHdd231UcHQPVfWgKt
	7yJ6meilQK3WWMW647YyxVWDyWa3t8ZM7v9Yb7lIWSH47C3WTy/piuDQybM4lf5N/SWB9o96JE2Rg
	xMtcjEXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upKBA-00000001Zey-0QtU;
	Fri, 22 Aug 2025 05:19:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaa-00000000ODJ-2OPp
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=; b=gzW/guhTVJxFLAc9NVC/wIJawW
	IhJJSUTr7R0Pfv6CDpWI5puFgADXxBvAAnm5H0YSAzvtBNduo5SlWnfpRnwejdgFzN2A/3RhEIUZ5
	vGqFrHoPvcOWhR52u2J+azGcvxrUPJreqNbE7m75WyQwQo7/gXxiBucCk6d45HYaQ/oalB4TvugWT
	I221RBYNONgQKV2XGbhFSl9VQRmIJSTntuTu7nZYkG8FJwt2/zR0YTIUh7JyxpQ+V4v5Ktr2fXGiu
	cgdsUOqF6YuRmLMDwRUBJomMNNaxXl4Jd0V1WZHHvEdQSWYwsc1xDaOiqzcJWd7A0du5Ns4wAEjy8
	rDMpjUiA==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaU-00000000fBO-1PcK
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
	b=KEfuECZMPmPgKz3P5maZaZ1ERU194NQX2T81aasmi8II0rrAg4lfMfYAw9d6wBL6tTWHGU
	9eNdNEpK9+fgFEQDLIVAmRF7CVTGiABaPl3oFSWVQChW3yhP1U5LX8xhm73mmEL+8RGTdi
	fSwjwcyQ/gHjMnO0W907IReZKWy+Fn8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
	b=KEfuECZMPmPgKz3P5maZaZ1ERU194NQX2T81aasmi8II0rrAg4lfMfYAw9d6wBL6tTWHGU
	9eNdNEpK9+fgFEQDLIVAmRF7CVTGiABaPl3oFSWVQChW3yhP1U5LX8xhm73mmEL+8RGTdi
	fSwjwcyQ/gHjMnO0W907IReZKWy+Fn8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-62-WNbK6ImGMny2r-W8InPtxw-1; Thu, 21 Aug 2025 16:08:39 -0400
X-MC-Unique: WNbK6ImGMny2r-W8InPtxw-1
X-Mimecast-MFC-AGG-ID: WNbK6ImGMny2r-W8InPtxw_1755806918
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b9d41b88ffso838818f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806918; x=1756411718;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wK69Pd9CHZjKZhmlaft7kkJNdToX7IH/S9WvVIRScQg=;
        b=Vsiif1q3T5CFUI34r3JZrCW/YZLk7XnU3dGLvN8dGh6A5pSc7hIeKzcAfLif1Enc20
         659siEymQpbdZXcyYoV4KVjAnsdm4uaxFDcmJPi1CNpFrZoP+8Hc9t099AiCureLOIjq
         NRacsc4IffmvdQrM+VJiGBgAW2sLqyFEBImFR6tiileckV1vFQlJQ2+JNRJenASJDoIt
         wzX8B+XAP7Ro9RtXueKtrjMuAhTvYuYRfUUbGMgeDsjaJKS2ld1WBI5pvI3LW3++D9Dp
         ur7hsTY2vw2V0ys3VvXAgUfCPUQ3qSB9FAjQ5oM//dF5ltUUyNCB2Du55eGnNpnHeOBW
         PDbw==
X-Forwarded-Encrypted: i=1; AJvYcCVUJvLYgiIIh2VkKEKwTHuZsBOxfzJqhPXfO5kxuQRhMPc8eMDktyjQFDkeJSzFxDTAjqVnJgK1GAE/iCPMEy2s@lists.infradead.org
X-Gm-Message-State: AOJu0YzmzXHyr9Cr90qou6R9PA5bONQwPUm1YgySG2atbdB+tLlxn4CW
	C7PoIn3ZOTzWkRaFo53eoMGgKn/JJQmjPLIwKef1iQP4WEniwb3ZF2001qYy/0J2H/RHu7v6MyE
	7HIZfZP6/Md1kb25AcOgPdBeEW9t4np7HKzxX0ejXi52YRT4ekivNAVpharkMSwymXm17QRCWAZ
	Zi
X-Gm-Gg: ASbGncsh2QTt7nQuOgVu7n+00o7AwmmXg5z8kuSdCa4kpG85qVlYb0HLImgDFYIRUK0
	D45TW6uYP4si0l9O0UgGdjvb+SFbjOsllmPO//dIosG+N0LCH4dxfUnopaTVfMKs3LBjn/P1vPg
	NOxbHBANxwhqecW75ToR5dqpFficGGxIFULRChcU3q9jTwUWk+F0/CjQ7gdQy7PTR+ft/VnS/Lp
	PdkHGhpTJqUIdmj6iTe1DVZqLQjtP4xNAlJBY5BLBlLtUUVyYYRypuVOm3lbqoOiFIguGcP+SKw
	iWVfnDgJp2TIgSgCV5cw/c6o1E5Adjad3EH2lGiYiYewnE32LhQVrcopiLkkuTBVEBalqGNkho+
	cP9faldnRB0a7ff6F0x/9gA==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3c5daefc298mr218319f8f.16.1755806917859;
        Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IETBfJ8klmP3LMs+G3FmlUfLKA9Qlb/rzelQ5gyETYamNwKefh2PCq6Da3p1XS4Ia+K1NPGrw==
X-Received: by 2002:a5d:64e9:0:b0:3b8:d7c7:62d7 with SMTP id ffacd0b85a97d-3c5daefc298mr218279f8f.16.1755806917364;
        Thu, 21 Aug 2025 13:08:37 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c4ccbf04fasm3355197f8f.7.2025.08.21.13.08.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:36 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Alexander Potapenko <glider@google.com>,
	Andrew Morton <akpm@linux-foundation.org>,
	Brendan Jackman <jackmanb@google.com>,
	Christoph Lameter <cl@gentwo.org>,
	Dennis Zhou <dennis@kernel.org>,
	Dmitry Vyukov <dvyukov@google.com>,
	dri-devel@lists.freedesktop.org,
	intel-gfx@lists.freedesktop.org,
	iommu@lists.linux.dev,
	io-uring@vger.kernel.org,
	Jason Gunthorpe <jgg@nvidia.com>,
	Jens Axboe <axboe@kernel.dk>,
	Johannes Weiner <hannes@cmpxchg.org>,
	John Hubbard <jhubbard@nvidia.com>,
	kasan-dev@googlegroups.com,
	kvm@vger.kernel.org,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	linux-arm-kernel@axis.com,
	linux-arm-kernel@lists.infradead.org,
	linux-crypto@vger.kernel.org,
	linux-ide@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	linux-mips@vger.kernel.org,
	linux-mmc@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	linux-s390@vger.kernel.org,
	linux-scsi@vger.kernel.org,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Marco Elver <elver@google.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Robin Murphy <robin.murphy@arm.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 32/35] mm/gup: drop nth_page() usage in unpin_user_page_range_dirty_lock()
Date: Thu, 21 Aug 2025 22:06:58 +0200
Message-ID: <20250821200701.1329277-33-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: o_anYY2T_lo-ZCoLhCz9pVkyYtVxRgwlQ7cvlWlEQcs_1755806918
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210842_651181_2248BD7C 
X-CRM114-Status: GOOD (  17.22  )
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

There is the concern that unpin_user_page_range_dirty_lock() might do
some weird merging of PFN ranges -- either now or in the future -- such
that PFN range is contiguous but the page range might not be.

Let's sanity-check for that and drop the nth_page() usage.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 mm/gup.c | 7 ++++++-
 1 file changed, 6 insertions(+), 1 deletion(-)

diff --git a/mm/gup.c b/mm/gup.c
index f017ff6d7d61a..0a669a766204b 100644
--- a/mm/gup.c
+++ b/mm/gup.c
@@ -237,7 +237,7 @@ void folio_add_pin(struct folio *folio)
 static inline struct folio *gup_folio_range_next(struct page *start,
 		unsigned long npages, unsigned long i, unsigned int *ntails)
 {
-	struct page *next = nth_page(start, i);
+	struct page *next = start + i;
 	struct folio *folio = page_folio(next);
 	unsigned int nr = 1;
 
@@ -342,6 +342,9 @@ EXPORT_SYMBOL(unpin_user_pages_dirty_lock);
  * "gup-pinned page range" refers to a range of pages that has had one of the
  * pin_user_pages() variants called on that page.
  *
+ * The page range must be truly contiguous: the page range corresponds
+ * to a contiguous PFN range and all pages can be iterated naturally.
+ *
  * For the page ranges defined by [page .. page+npages], make that range (or
  * its head pages, if a compound page) dirty, if @make_dirty is true, and if the
  * page range was previously listed as clean.
@@ -359,6 +362,8 @@ void unpin_user_page_range_dirty_lock(struct page *page, unsigned long npages,
 	struct folio *folio;
 	unsigned int nr;
 
+	VM_WARN_ON_ONCE(!page_range_contiguous(page, npages));
+
 	for (i = 0; i < npages; i += nr) {
 		folio = gup_folio_range_next(page, npages, i, &nr);
 		if (make_dirty && !folio_test_dirty(folio)) {
-- 
2.50.1


