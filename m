Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 599FACA0EFC
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=; b=GVYI7RhdEfvYi469WqE8NH40HF
	K+KS3pLcv5y+vkgpoEY5eWJupkHml1YM63Y9FuB6NUxLt1ridp3oVtDHFY8MDcdrvCsfGIshoElLO
	rd00LgakH0y3Yd2KbrYemumyXV1il7Q++OthgLBLCRGaK3eP5fBYnHcYrjJeVUsO53ClnGd09oBhJ
	brWpAGBiaRQS6o950lkKRK6VkeWSCLy149FO0ta+XzdM3c+UcColH5/DSUatjbPfTfbFMo4DCttpx
	u8thKCUq7yUpLqOsoUH8CEf6srKo1WgDTnl959DLl4lKCTS9qPkcbcOCRhlgP14DXrf8/rpLoQv3t
	DYmpeyKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJ6B-00000001Tey-3DXC;
	Fri, 22 Aug 2025 04:09:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBag-00000000OF9-0FpV
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=; b=KATIC5F861x3XpMQFjd7smbkJf
	zeuESi5dIWEBAL/km7wpexOCDbU1lKHMDgIlISr0JjrVY40J1V1DzWRVDU4OSQKlErm+eeW8Lstqe
	HwjR76ITXCFqMAY5ITvpiLW0BzGKL3qPjT/jedrLbcDwJkYdYLUfwUKnC90243haLHQycKSBeFhTp
	QUYNeQaIB6z5YnXWcxM8alzLaw6EHl/1YR4m/tjQIXfs/zSFXzutRWJgWXkTpazvyqsnnpQZ6XTvG
	Fj3KR/7RgMgX7Bp++DtV1prngpjjXuPvnVsvnAp1MaBqvY8iHBDOlHuT/sq25jYPuGMp0e9Rjl3Rg
	DX4O6zSg==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBaZ-00000000fGJ-0B2B
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806925;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
	b=ZD/4IrbbZ7RqzXVD54IOdaWGnkqwT0MfyW1F8vqVur3kESmlkInyu14II7WelsiKHNv3cA
	1PAZJI2G3nj/mAw4zAayoEO1bOXe14kT4c5werXTOEdGYuYJA/02b737/3hNWBDmlpVBC+
	cZEXL7kzwyCcKgj4S2+gRhS8K7S0Kg8=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806926;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
	b=cTWsbsAt7GWYHIYKURD1Pyw7M0tD3fRjasIPIX2VqOmtlhJp4Ez6qCZWU1vBbq95EqTvvH
	Y+2UxVqCHZyWNbAY+Ym1j+pecnexuqVQSrmuiOJXwQ6b8ZIVh28sVmR+f8i3dBqmR92AHL
	v1zd2kpbSKN3qo17pgZUpO+OKYEoyR0=
Received: from mail-wm1-f71.google.com (mail-wm1-f71.google.com
 [209.85.128.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-43-jGVsjX_gMy2UE4O3JPYCyw-1; Thu, 21 Aug 2025 16:07:25 -0400
X-MC-Unique: jGVsjX_gMy2UE4O3JPYCyw-1
X-Mimecast-MFC-AGG-ID: jGVsjX_gMy2UE4O3JPYCyw_1755806845
Received: by mail-wm1-f71.google.com with SMTP id 5b1f17b1804b1-45a1b0ccb6cso6971455e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806844; x=1756411644;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=saIpwl0G6zoDDZA6kqzaAKGDHCkLp/ivw/dNNi90asQ=;
        b=pSxCJa7YPi9c22SrPLd3sNsHxe7MQL/CTtJfwssk0/Xz2wSxKDTM0TnOmNqaUWw61B
         G0+lNwavN4MIFjBIrosMsCbHjiqn9pLmqh8gzqweclZM1OBJpCQLgzJl1GK7mZf7vaje
         GOD+k0pKi8UofWxCunEP7KadC0dCnD0jWSBi63ylGcpv7cPM930xLAZ5PGnbJv3xIxc8
         xbQl8Hq6urVoBZo/z/BGJh8Vu2U30toRYDB9j+R59pQE1y1F0gyGyRvytmkgY4vpsuMt
         pNNSltgetNkIg4ACLeKwhziFjdocJN42Sfp9QiSpeEPLJ+xjsLo85Pqz5zoHKZTvrUzp
         veyA==
X-Forwarded-Encrypted: i=1; AJvYcCXnapXIAfBvMKgBCxZMVHF5v43beOABCbfO/VOTI/NaH5NbnCGadClrnoH3VluxMSmxYss+6VzbwSTMGjsdQzPk@lists.infradead.org
X-Gm-Message-State: AOJu0YwaWhotBXfbRK/IiHZ98d+wHtzc6mDJ9ZEnnrijtvmF/09mZqso
	Qab5wgMZ/3JhQP0yID6HjzqkCcfVwZ8oVpW+tr2ne4pL3S7JjLApLI+s7O6Ec8KJS6SemCMK1lE
	GGynmRBgDvDUnwG79o8lEPUvSJi0889njr8ACythsXcRljnMLHHkiOGDis/VVh4F6E+pYGZD2OQ
	cJ
X-Gm-Gg: ASbGncvklqXhI5NxNF9E8K9ju6U4CIRuV/FnwC/Fq9xDh3CBvd+KwD6HzJTZeJraBVu
	0l+rdzjcbPDeRPgGyTqjwzAl+24L5y5mNHNBDTGwwvRCjKGBDnnO4XXGzM5FR+nYMWxWAnURLNY
	JQVfoTSLvwSfx40bxxjt+qIQfZ0EUmVY1GvrsfwLrJBztZF4pO+Cy/RElltb4lDEwk7h6CAa/bq
	z/vuXBFoDrS7IrorxF4ZvqvVmiTNJwb0F/Y/IlZYtGBXtJMt/PNL0aVl8oIR84IRE2Ex0Jw/3Sb
	3jLyZano0G5K9bBPaAxymkSMoOX1+2otyHd9zHaNMMkoBPsIbf4U6ReOfQ4BwF/vLsCFcCtD7MT
	rR6/Lo+x4zW8kBQQ1E+bi3A==
X-Received: by 2002:a05:600c:35c3:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-45b5178e768mr3050335e9.3.1755806844566;
        Thu, 21 Aug 2025 13:07:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFwjTyvRglWWHHllkR7aRLdEFYS2lmKXV2DYH9bn4L7+YG6UNdB0HbBuiJbZZ1vy18QyYWFNg==
X-Received: by 2002:a05:600c:35c3:b0:456:285b:db3c with SMTP id 5b1f17b1804b1-45b5178e768mr3049835e9.3.1755806844048;
        Thu, 21 Aug 2025 13:07:24 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c074e38d65sm12980909f8f.27.2025.08.21.13.07.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:07:23 -0700 (PDT)
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
Subject: [PATCH RFC 06/35] mm/page_alloc: reject unreasonable folio/compound page sizes in alloc_contig_range_noprof()
Date: Thu, 21 Aug 2025 22:06:32 +0200
Message-ID: <20250821200701.1329277-7-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: iFIE9ESSdYcRBYDqe-5QhwFcxy6DyVxg_WreZrlxOps_1755806845
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210847_423663_BD8F3890 
X-CRM114-Status: GOOD (  16.26  )
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

Let's reject them early, which in turn makes folio_alloc_gigantic() reject
them properly.

To avoid converting from order to nr_pages, let's just add MAX_FOLIO_ORDER
and calculate MAX_FOLIO_NR_PAGES based on that.

Signed-off-by: David Hildenbrand <david@redhat.com>
---
 include/linux/mm.h | 6 ++++--
 mm/page_alloc.c    | 5 ++++-
 2 files changed, 8 insertions(+), 3 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index 00c8a54127d37..77737cbf2216a 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2055,11 +2055,13 @@ static inline long folio_nr_pages(const struct folio *folio)
 
 /* Only hugetlbfs can allocate folios larger than MAX_ORDER */
 #ifdef CONFIG_ARCH_HAS_GIGANTIC_PAGE
-#define MAX_FOLIO_NR_PAGES	(1UL << PUD_ORDER)
+#define MAX_FOLIO_ORDER		PUD_ORDER
 #else
-#define MAX_FOLIO_NR_PAGES	MAX_ORDER_NR_PAGES
+#define MAX_FOLIO_ORDER		MAX_PAGE_ORDER
 #endif
 
+#define MAX_FOLIO_NR_PAGES	(1UL << MAX_FOLIO_ORDER)
+
 /*
  * compound_nr() returns the number of pages in this potentially compound
  * page.  compound_nr() can be called on a tail page, and is defined to
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ca9e6b9633f79..1e6ae4c395b30 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -6833,6 +6833,7 @@ static int __alloc_contig_verify_gfp_mask(gfp_t gfp_mask, gfp_t *gfp_cc_mask)
 int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			      acr_flags_t alloc_flags, gfp_t gfp_mask)
 {
+	const unsigned int order = ilog2(end - start);
 	unsigned long outer_start, outer_end;
 	int ret = 0;
 
@@ -6850,6 +6851,9 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 					    PB_ISOLATE_MODE_CMA_ALLOC :
 					    PB_ISOLATE_MODE_OTHER;
 
+	if (WARN_ON_ONCE((gfp_mask & __GFP_COMP) && order > MAX_FOLIO_ORDER))
+		return -EINVAL;
+
 	gfp_mask = current_gfp_context(gfp_mask);
 	if (__alloc_contig_verify_gfp_mask(gfp_mask, (gfp_t *)&cc.gfp_mask))
 		return -EINVAL;
@@ -6947,7 +6951,6 @@ int alloc_contig_range_noprof(unsigned long start, unsigned long end,
 			free_contig_range(end, outer_end - end);
 	} else if (start == outer_start && end == outer_end && is_power_of_2(end - start)) {
 		struct page *head = pfn_to_page(start);
-		int order = ilog2(end - start);
 
 		check_new_pages(head, order);
 		prep_new_page(head, order, gfp_mask, 0);
-- 
2.50.1


