Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9190DCD4855
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 09:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1jmP/TvG+eVU58X498eguI1YKUfux/ase4Doi+Mx29Q=; b=kPLGmnOqwsKiUKVXE/peHFjavv
	DGF0T++mLoPnQH+Y0vRD56yGxsYnlTIvRaisAVHViGb2nGkL7V3fuNVShlcpPtPl+qe3Db135tBkR
	C5BA/lDkYr645Qg+d/su9+XWDtqgbTnbsr2whuMfxjDEuIVQ8tftq00AirJBgVbLtA91bxzt+ozl9
	AVuxDic1rl/FiyyRvAKSMd+t1/gX8DjxKeSCGFTiJFyfrBlmztcvUxBJm2WfmkXhvr8YXJuqL+IUU
	MLGUZIe2hIYFMY6txb+p2asWktAU0poxLJQPXzWyzilAXLl24sX6W7DBKO9XvAyZdzyVNP1NdlNV9
	LGSWPhfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4q-0000000GCcB-0OuL;
	Tue, 12 May 2026 09:06:56 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4o-0000000GCaC-29PA
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 12 May 2026 09:06:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=1jmP/TvG+eVU58X498eguI1YKUfux/ase4Doi+Mx29Q=; b=VIEfqQhLKQwxwQikyX/YvctYqj
	u1fDOGOQmPcXnTkA6JTJEERPfcsaUcGNmciqqHXNAHNH3Ix9IWRPD9tYrhLgc0edur43O+P+tk+i8
	7HmDEUSoJnA6S++H/GvWlelXfAsifpqQJHNN3HJ5wCDeAwjU8+b2gjJHNVbKGEmAq0lDkCo07qZU6
	ShwuT+GuOwYm0I+L3Ai9K6GhmCsOwqiV5MCfbA8HoZYmkh1yk1hqHHTId9srk8fTdbiyYEPdZ55XD
	tow/ollaNyAMVtn/o1BKtUo82yNMDDoyrDXWSyRMOZEfOZH/66woSvwsgMwbvZp+GSQigEFk7+lJx
	dhsZMN2Q==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMj4a-0000000EC1y-3mR7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 09:06:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CE56E4391C;
	Tue, 12 May 2026 09:06:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3AC84C2BCF7;
	Tue, 12 May 2026 09:06:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778576799;
	bh=mTlzwGmKaksgYc3F/GyUj4XB9AG9GATAkfL4j43fQ40=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Gg9NhAp7QAL+VjZbnyz/0jlu7gA+E880rsW1LbQ4Tm+kjB/qLh83dBTqQCogFkMnk
	 6ldiTPnH1BZAHckzOmx/zFVXOvdywPpPf75pIgEpalHO5cqsgAyIFMRGo1Pp+77GEO
	 MM0gflFTCnuDTyh7C+CWAabFjFk801in1C2uepCZveaoORNYDG2BAqk4lzaTwLJQO6
	 msRKi6DGIBt9MapjDJ/C6gK56qwGC2e+Q3E3tpjbe3FWjBA4z4aPUCiQI43o+zkFJu
	 mUPkM5VjW/y2kXSQuOj2NG74UZEsprayRa/8m7pL2NMYQAR7xaHdfQY+GzIyu7EPvK
	 ce/+WEjgnU5BQ==
From: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
To: iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-coco@lists.linux.dev
Cc: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
	Robin Murphy <robin.murphy@arm.com>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Will Deacon <will@kernel.org>,
	Marc Zyngier <maz@kernel.org>,
	Steven Price <steven.price@arm.com>,
	Suzuki K Poulose <Suzuki.Poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Jiri Pirko <jiri@resnulli.us>,
	Jason Gunthorpe <jgg@ziepe.ca>,
	Mostafa Saleh <smostafa@google.com>,
	Petr Tesarik <ptesarik@suse.com>,
	Alexey Kardashevskiy <aik@amd.com>,
	Dan Williams <dan.j.williams@intel.com>,
	Xu Yilun <yilun.xu@linux.intel.com>,
	linuxppc-dev@lists.ozlabs.org,
	linux-s390@vger.kernel.org,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>,
	Alexander Gordeev <agordeev@linux.ibm.com>,
	Gerald Schaefer <gerald.schaefer@linux.ibm.com>,
	Heiko Carstens <hca@linux.ibm.com>,
	Vasily Gorbik <gor@linux.ibm.com>,
	Christian Borntraeger <borntraeger@linux.ibm.com>,
	Sven Schnelle <svens@linux.ibm.com>,
	x86@kernel.org
Subject: [PATCH v4 11/13] dma-direct: rename ret to cpu_addr in alloc helpers
Date: Tue, 12 May 2026 14:34:06 +0530
Message-ID: <20260512090408.794195-12-aneesh.kumar@kernel.org>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260512090408.794195-1-aneesh.kumar@kernel.org>
References: <20260512090408.794195-1-aneesh.kumar@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_100647_441654_23179F67 
X-CRM114-Status: GOOD (  12.78  )
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

ret in dma_direct_alloc() and dma_direct_alloc_pages() holds the returned
CPU mapping, not a generic return value. Rename it to cpu_addr and update
the remaining uses to match.

This makes the allocation paths easier to follow and keeps the local naming
consistent with what the variable actually represents.

Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
---
 kernel/dma/direct.c | 31 +++++++++++++++----------------
 1 file changed, 15 insertions(+), 16 deletions(-)

diff --git a/kernel/dma/direct.c b/kernel/dma/direct.c
index 1e9f9ff7b9d3..902008e40ea1 100644
--- a/kernel/dma/direct.c
+++ b/kernel/dma/direct.c
@@ -212,7 +212,7 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 	bool mark_mem_decrypt = false;
 	bool allow_highmem = true;
 	struct page *page;
-	void *ret;
+	void *cpu_addr;
 
 	/*
 	 * DMA_ATTR_CC_SHARED is not a caller-visible dma_alloc_*()
@@ -326,34 +326,33 @@ void *dma_direct_alloc(struct device *dev, size_t size,
 		arch_dma_prep_coherent(page, size);
 
 		/* create a coherent mapping */
-		ret = dma_common_contiguous_remap(page, size, prot,
-				__builtin_return_address(0));
-		if (!ret)
+		cpu_addr = dma_common_contiguous_remap(page, size, prot,
+					__builtin_return_address(0));
+		if (!cpu_addr)
 			goto out_encrypt_pages;
 	} else {
-		ret = page_address(page);
+		cpu_addr = page_address(page);
 	}
 
-	memset(ret, 0, size);
+	memset(cpu_addr, 0, size);
 
 	if (set_uncached) {
 		void *uncached_cpu_addr;
 
 		arch_dma_prep_coherent(page, size);
-		uncached_cpu_addr = arch_dma_set_uncached(ret, size);
+		uncached_cpu_addr = arch_dma_set_uncached(cpu_addr, size);
 		if (IS_ERR(uncached_cpu_addr))
 			goto out_free_remap_pages;
-		ret = uncached_cpu_addr;
+		cpu_addr = uncached_cpu_addr;
 	}
 
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
 					 !!(attrs & DMA_ATTR_CC_SHARED));
-	return ret;
-
+	return cpu_addr;
 
 out_free_remap_pages:
 	if (remap)
-		dma_common_free_remap(ret, size);
+		dma_common_free_remap(cpu_addr, size);
 
 out_encrypt_pages:
 	if (mark_mem_decrypt &&
@@ -437,7 +436,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 {
 	unsigned long attrs = 0;
 	struct page *page;
-	void *ret;
+	void *cpu_addr;
 
 	if (force_dma_unencrypted(dev))
 		attrs |= DMA_ATTR_CC_SHARED;
@@ -455,7 +454,7 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 			swiotlb_free(dev, page, size);
 			return NULL;
 		}
-		ret = page_address(page);
+		cpu_addr = page_address(page);
 		goto setup_page;
 	}
 
@@ -463,11 +462,11 @@ struct page *dma_direct_alloc_pages(struct device *dev, size_t size,
 	if (!page)
 		return NULL;
 
-	ret = page_address(page);
-	if ((attrs & DMA_ATTR_CC_SHARED) && dma_set_decrypted(dev, ret, size))
+	cpu_addr = page_address(page);
+	if ((attrs & DMA_ATTR_CC_SHARED) && dma_set_decrypted(dev, cpu_addr, size))
 		goto out_leak_pages;
 setup_page:
-	memset(ret, 0, size);
+	memset(cpu_addr, 0, size);
 	*dma_handle = phys_to_dma_direct(dev, page_to_phys(page),
 					 !!(attrs & DMA_ATTR_CC_SHARED));
 	return page;
-- 
2.43.0


