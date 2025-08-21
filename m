Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7773CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 00:43:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=; b=ISh84Z/KE0wgSMsn3EWUOVuYJl
	KpGEWpHOt4b9GSgJyrv1ql6jCHtXRWE4iyY68EtG5POwyF7X++WpsfDGnEjA08U85V9Rk303mXRs8
	NOpVfWWNckwY248mtsbWepVK3hmE6518LxjSq1Zi2cTeIiJZX7nIiZIQOYMJ4YuBLh0jYFkZSzxQD
	nHi5jwyIPWs0Ngl/ElJDMAZERJQhzGVnXCACaza45+OFwkq9dN+Q6g/50/tWIIo97+RLpvQ4zHamT
	32CbJUp0h8V4RfRNLJD6+OteZKLsXQHFpsJFDknx1f6034wlOWvQPUkOSKWjTKSY8eMoaO1NyT3S5
	EJUc3KKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFs5-000000013t9-3u55;
	Fri, 22 Aug 2025 00:43:10 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa5-00000000NvS-3QhH
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 21 Aug 2025 20:08:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=content-type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=; b=MchWWv+zJfBR6BH2/v+pt6kip3
	2YdWVIM9WkWGpSBb3/53zyx8mjL/lWWTDP1ddxM3Ew2DfXCLKDVH0UBY4kVCJvQYo+QYLqA/KjZfC
	yuOa+x6NimpE1sL5IRdLXt6aQ6K5T7ioJlwhdUYD3Yb4IsH5MOKbScWmS/3WnNcV2jbt2OZPvz2Mi
	RKn1PIwCAn0yaxgxPNYuF03LE2h2Tfkg1X3WuNTGlw3njS5CNoLlfC/FJolpC/oYypzySKgOJgW/h
	mSYOgI/o9AOCnOUUU6AfNAfdw+u9kPW0/bX8XAK3Od04WZOYCdt8lsKPWXBjw+TVFTpA9F7igBdGw
	cIlddI/Q==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upBa2-00000000eyb-0eOA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 20:08:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
	b=LAuI4ObQ8SK/1nK29SQ4IEJeO17n4p53HUvNerNItBLRh4TlQsyAA9PyGpyeoH4NcTxHAC
	K9wlfm/6fKZWSTr5BDOHiWmzKPrxGtCJGsVIzgrSK99KJpkRgbq1zSw17F/AJhaUnXB3gq
	wsmylcATFHCNgNF9PJ5A09LoNOxU+2g=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1755806891;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
	b=LAuI4ObQ8SK/1nK29SQ4IEJeO17n4p53HUvNerNItBLRh4TlQsyAA9PyGpyeoH4NcTxHAC
	K9wlfm/6fKZWSTr5BDOHiWmzKPrxGtCJGsVIzgrSK99KJpkRgbq1zSw17F/AJhaUnXB3gq
	wsmylcATFHCNgNF9PJ5A09LoNOxU+2g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-427-_WBAgCYtM6CQdXUgEVH0aQ-1; Thu, 21 Aug 2025 16:08:10 -0400
X-MC-Unique: _WBAgCYtM6CQdXUgEVH0aQ-1
X-Mimecast-MFC-AGG-ID: _WBAgCYtM6CQdXUgEVH0aQ_1755806889
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-3b9dc5c2820so445392f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 21 Aug 2025 13:08:10 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755806889; x=1756411689;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Pq6EMCEhMXNA7HGNe/O1qYHWHhWZrBzRdRZ7YmKumJw=;
        b=BuERGo7RN/MIGO2VzQ3aCmj0xnRewT5xbcI+4wU7EFEbhxB+UqmQUtDJn6j0Xb3+5K
         vNS9XxNSkw8WrRcnEOweXUUxq6UCdsA4EukOLs5zcLV1p9CvWRUgSP0aDawuTkKXN1No
         he1zavAIQA54B2hQCHF478qAaAk6CT6DhSu+y6FPiGDhZ01PHlykokgZDmXnJXKwGpuG
         vN03Rf/Eu1C99CDQxHegxcbrV55f4W2RKOoImkbT30GgMBzf9pvGingEzfMIh68CYQZv
         vTd8YKog2q+QOJ9UbHuKks0MmraC4ivZgA8y4/+PPYjjHG7vcAUSJCmgmloPJlH3aAI5
         VnCQ==
X-Forwarded-Encrypted: i=1; AJvYcCVnrTbonnwkB/t6jErlac36ell/ngHMTZmpARC1w2WA2mOC1UcsNCPiGjWP6zcfUGwLa7kgQ0bKDErQIOGJumHC@lists.infradead.org
X-Gm-Message-State: AOJu0YwTHx/K2zmwv9BbJUQ7sgTvI/JV4cD/MX7vJl/ncOibNYNXgG1l
	4dnxf6Eg5/i/lmwYgBMGxci+goHnQIaYUxr+j/Ix89S7t7GA9hm9vHhW3B0xb9FyB5v+QZi8Ygg
	9JpPPMTOgbvFTmvUg5wACh7zCsKMLfs3WlucMxlMMDMR3b0l1M86Lfkm2yzjW9trNEBVu4Ef62d
	qO
X-Gm-Gg: ASbGncvchVxSFJt9CSmt9s5D+qsoA0i6qsW63CMU8THS6z0pN8SGu0xqQVIzRkMEh2G
	9WxJgDC24XcDh8Nk8L1ClNanIUEBXmdPPDIWJpv3S5Mi7us8S4Ia5vm+zyKYI1SQsAxpgCs6YkL
	lceqA0P3PfaqnNP79l/XZ4lxvGne7ykYMUZ4ONdWiJ3qkC5lNoLz9F+9BWVEHZJz8IEQbvf0tHb
	iCkNrawWeonIx1klTAEaWxtIoBkZKkF4636GfngApjoLDPa09evYc+elvozwzTEe4J/cYxabNSM
	hf/UinAFGnTX/Xn6liNAosfpkO1cdOJIbDuBzoz+3HDO+PVIV7cCCHdp7GBZmjdbliejs0judta
	D/nH6reOOQDbbweMUIqz71Q==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id ffacd0b85a97d-3c5da83bf5bmr151972f8f.9.1755806888913;
        Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGeHEkncn914iQLB6IDJFbFllUgyuseH1VcCPvg+Bdgchh7CcvmYDhAXktPsYS0hqHcr6hQuQ==
X-Received: by 2002:a05:6000:40c9:b0:3b7:911c:83f with SMTP id ffacd0b85a97d-3c5da83bf5bmr151916f8f.9.1755806888456;
        Thu, 21 Aug 2025 13:08:08 -0700 (PDT)
Received: from localhost (p200300d82f26ba0008036ec5991806fd.dip0.t-ipconnect.de. [2003:d8:2f26:ba00:803:6ec5:9918:6fd])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-45b4e2790a8sm21120815e9.1.2025.08.21.13.08.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 Aug 2025 13:08:07 -0700 (PDT)
From: David Hildenbrand <david@redhat.com>
To: linux-kernel@vger.kernel.org
Cc: David Hildenbrand <david@redhat.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Robin Murphy <robin.murphy@arm.com>,
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
	Michal Hocko <mhocko@suse.com>,
	Mike Rapoport <rppt@kernel.org>,
	Muchun Song <muchun.song@linux.dev>,
	netdev@vger.kernel.org,
	Oscar Salvador <osalvador@suse.de>,
	Peter Xu <peterx@redhat.com>,
	Suren Baghdasaryan <surenb@google.com>,
	Tejun Heo <tj@kernel.org>,
	virtualization@lists.linux.dev,
	Vlastimil Babka <vbabka@suse.cz>,
	wireguard@lists.zx2c4.com,
	x86@kernel.org,
	Zi Yan <ziy@nvidia.com>
Subject: [PATCH RFC 22/35] dma-remap: drop nth_page() in dma_common_contiguous_remap()
Date: Thu, 21 Aug 2025 22:06:48 +0200
Message-ID: <20250821200701.1329277-23-david@redhat.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250821200701.1329277-1-david@redhat.com>
References: <20250821200701.1329277-1-david@redhat.com>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7hTi0qXo-Xxal8_GCnINJl8csDuhxyH7shpCeL_eUv8_1755806889
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_210814_622252_00E03480 
X-CRM114-Status: GOOD (  14.12  )
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

dma_common_contiguous_remap() is used to remap an "allocated contiguous
region". Within a single allocation, there is no need to use nth_page()
anymore.

Neither the buddy, nor hugetlb, nor CMA will hand out problematic page
ranges.

Cc: Marek Szyprowski <m.szyprowski@samsung.com>
Cc: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: David Hildenbrand <david@redhat.com>
---
 kernel/dma/remap.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/kernel/dma/remap.c b/kernel/dma/remap.c
index 9e2afad1c6152..b7c1c0c92d0c8 100644
--- a/kernel/dma/remap.c
+++ b/kernel/dma/remap.c
@@ -49,7 +49,7 @@ void *dma_common_contiguous_remap(struct page *page, size_t size,
 	if (!pages)
 		return NULL;
 	for (i = 0; i < count; i++)
-		pages[i] = nth_page(page, i);
+		pages[i] = page++;
 	vaddr = vmap(pages, count, VM_DMA_COHERENT, prot);
 	kvfree(pages);
 
-- 
2.50.1


