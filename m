Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 03271606A323
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=UZgWVK8N;
	dkim=pass (1024-bit key, unprotected) header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=pnMy+/rB
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=u8dEoOvFyttOe/BrdbS9Lckh8vPBq/eJHO5XvvUziD0=; b=UZgWVK8NVXXsBp
	TnKkaq/f1XWX0lPrPOZ6u4z33I3ufcCCvLWRpvaEw8wR4wPL7QT10RJPoKYM7L4jCfpAnGL4UA0bp
	c5CNj9boNRmgh3gKM5gH0no7rZ/wiZt73wwXyMzgFg8CCycKhjr60TDht7M/PjiO5bBjiZjyOwKEr
	6KYRtsiGJ7qLFb4qnv3cztj6EoONkbKPAaGNND0U23+NysDB89deFEPXvfE1ZRzVY765cf7JffICk
	To7wMbmqiWdvNdZS+UqflOe4ulVCsMiBOBO572zWFYMROnL+d32YoexwvjdQGDXhUp2GFQqWkainM
	WgckyREVTbJgdQ8x6R6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKsq-00000002cPc-0yuR;
	Mon, 26 Oct 2026 13:37:04 +0000
Received: from mail-dl1-x1236.google.com ([2607:f8b0:4864:20::1236])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKsm-00000002cOl-3AX8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:37:03 +0000
Received: by mail-dl1-x1236.google.com with SMTP id a92af1059eb24-15ea896ddc8so5140663c88.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:37:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1793021820; x=1793626620; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u8dEoOvFyttOe/BrdbS9Lckh8vPBq/eJHO5XvvUziD0=;
        b=pnMy+/rBfcNVqjjjXsvl/qUVYL/CrWjTqihUJLP0UFBkgOEkmKB2FDrAVxkJHVCQ6X
         UwzT1HwsiW4NEn26p4rflprrTq2dYTxpVvM7iGrcEZesmOzAvXOgMLMh1CRr57cRg/RS
         AaQpTNa7EKVEXzsAAr62AoDTozM9j/gK5BMSE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021820; x=1793626620;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=u8dEoOvFyttOe/BrdbS9Lckh8vPBq/eJHO5XvvUziD0=;
        b=XOJKUaD+A66T1Tppql4/LQcmuErAviYueIDNtTe6LuzbT4GqE9/ly4gCaSH5KUledF
         ALP+WQD/52f0RKW3Na6nqiQKnLoqhGy1hlPDbXm85DyW16g1rxogbxxT8xNLIrtaHrrw
         yYbnLj4TbCOZVcUoJL/n6ihyJc7uUbV5Rt8uO1laSHCElKYvHwwnlkUSNi6Twih1nQjK
         ggZ9cxA3pjaS1VdENBHHosnNWDipqsS0R1dNvXBFNdx7W/kyEa8CrBOlVwi0MHm/Qgec
         o0f4/fuShs6aVfRsG3GZ8dzSrN+Pii9a+AJ6NqUkhPizd8NZuFEnpKUq2S1i9bPYtRCA
         rLpQ==
X-Gm-Message-State: AFq9FYJWsvmSKhWvhMpWxMmnK+SfuXCDR8wyB6qy6wAquJqdFzulyqQW
	Jtmctq+CHGAyKSCyqvDx+bMCsXEnyfZDrXjtvQbIM3wQ1BcxW7/BIAoWmX8dZ9s84YI=
X-Gm-Gg: AYBFou3xab5ZXqTZQ+8ga5j4IKByyvhgzSYh/J33swdBlAekIEfZmLF4qBNDNN15FsM
	/nQ0HwsxWX0O7594MSxDI5KWzPqOIigIyWPMuqx7fr/OFnKSjgg7FdgUbaLi4oew3xcoOi0Q0Vp
	SsRMhgb41WRT5xnckSY518ys1pi+3KUvcN8GANUd5keEdVLkGkEMNXorYcNV2EPp+cSG/XYWkea
	Qn8KlqE8HP94HTyQVSo9rEI9IXsYySSK4HbmcE9n6HD8azD/YndNRf5ZX3JuRm3tN6OKfVP9Q1G
	/RvDIHGPtCycAC1t3DrcU6jGRAVnDsK5MbztuTcnQZ650RvbiSZztBgsNSoFK7C1DYKImitd0kF
	e9MA1xxuVbjKnQsqI+oun9+zToHUEMigRZ+ocaZ+19S9Vr1lLNYyNsQRrXGh5CqOMuU4HOv0Wtq
	UXKOMp1lWB2EWwF8gOnZoJo5/97Y7MXVGE8gATcLrklMBR61viVMijrYzCHaK9pTMjWmFVklC/C
	VOQF4A9lemovIA5WuD78vaZJo4ssepfIbIeXjhyX7b21NfJQw==
X-Received: by 2002:a05:7022:150c:b0:191:ac4:55a7 with SMTP id a92af1059eb24-19934a96e58mr10119771c88.23.1793021819831;
        Mon, 26 Oct 2026 06:36:59 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm22432520c88.8.2026.10.26.06.36.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:36:59 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Date: Mon, 26 Oct 2026 13:36:43 +0000
Subject: [PATCH 1/2] iommu/io-pgtable-arm: align next walk address to large
 page size
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-iommu-arm-fix-missing-dirty-pages-v1-1-115b6b1cc0f5@snu.ac.kr>
References: <20261026-iommu-arm-fix-missing-dirty-pages-v1-0-115b6b1cc0f5@snu.ac.kr>
In-Reply-To: <20261026-iommu-arm-fix-missing-dirty-pages-v1-0-115b6b1cc0f5@snu.ac.kr>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 "Joerg Roedel (AMD)" <joro@8bytes.org>, Jason Gunthorpe <jgg@ziepe.ca>, 
 Shameer Kolothum <skolothumtho@nvidia.com>, 
 Ryan Roberts <ryan.roberts@arm.com>, Kevin Tian <kevin.tian@intel.com>
Cc: linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev, 
 linux-kernel@vger.kernel.org, Seongjun Hong <hsj0512@snu.ac.kr>, 
 stable@vger.kernel.org
X-Mailer: b4 0.13.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_063700_816805_A1DDD65A 
X-CRM114-Status: GOOD (  11.50  )
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Align down walk_data->addr before the increment by page size to prevent
the missing dirty pages on IOMMU_HWPT_GET_DIRTY_BITMAP ioctl.

As Commit e21952d72b47 ("iommufd/iova_bitmap: Ensure that iova_bitmap_set()
handles the full IOVA") mentioned, the requested iova range can begin in
the middle of the large page (e.g., 2MB page block). So incrementing walk
address by large page size (e.g., 2M) could bypass next dirty'd small pages.

Fixes: 4fe88fd8b4ae ("iommu/io-pgtable-arm: Add read_and_clear_dirty() support")
Cc: stable@vger.kernel.org
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/iommu/io-pgtable-arm.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631a..01c3f9cd5d9c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -821,7 +821,7 @@ static int io_pgtable_visit(struct arm_lpae_io_pgtable *data,
 		return ret;
 
 	if (iopte_leaf(pte, lvl, iop->fmt)) {
-		walk_data->addr += size;
+		walk_data->addr = ALIGN_DOWN(walk_data->addr, size) + size;
 		return 0;
 	}
 
@@ -868,7 +868,9 @@ static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
 		return 0;
 
 	if (iopte_writeable_dirty(*ptep)) {
-		iommu_dirty_bitmap_record(dirty, walk_data->addr, size);
+		u64 iova = ALIGN_DOWN(walk_data->addr, size);
+
+		iommu_dirty_bitmap_record(dirty, iova, size);
 		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
 			iopte_set_writeable_clean(ptep);
 	}

-- 
2.43.0


