Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5E9E60A2614
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 13:37:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1GkGnZDz;
	dkim=pass (1024-bit key, unprotected) header.d=snu.ac.kr header.i=@snu.ac.kr header.a=rsa-sha256 header.s=google header.b=gX9VYSC6
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=/4ed/RMVrv6O/H4HMl4G3Xz4VIpFThxQX+sYINSnX4Q=; b=1GkGnZDzyluhZT
	LeUFp+WlfTz4RqkLYF0sbp6q4g7/Mi/OHtrEj0X4wV89124jJsVozyFINAwMCXuX5YEpEm0XqTn9m
	/U/3iqGf8+WsC3sSzvwhPRIAIs5vnaMJA/9m26DdO7E6rk2TfGRx1l7NJXpF3IfwU2QyVwSL61loX
	JmjG6IH+GY6J1Ma5az7jN+K0I9aZG4AE7f6gzMJxO4d98P0v0XfZwdjiCzo+uYMATRVzra+lQxvLV
	2/nyNGxAQZ/F05x0fFRoUVvatnuLy7bbYKbT0dlpiJlCkVRUQw8sI7ED9ZNLENMwBavWuTwR3tjpA
	zB28Rn1eiNOJwGz0gJWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKsw-00000002cRc-1ndM;
	Mon, 26 Oct 2026 13:37:10 +0000
Received: from mail-dy1-x1333.google.com ([2607:f8b0:4864:20::1333])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLKsq-00000002cPV-0Y2e
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 13:37:05 +0000
Received: by mail-dy1-x1333.google.com with SMTP id 5a478bee46e88-33bf40b0c8bso8841097eec.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 06:37:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=snu.ac.kr; s=google; t=1793021823; x=1793626623; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/4ed/RMVrv6O/H4HMl4G3Xz4VIpFThxQX+sYINSnX4Q=;
        b=gX9VYSC6DwybuJS/JfKxtsZ90M/MvkN6IxAgIKmobCyVZDupvJuutRAg4opd+c1ITU
         S+vgO04RIKdLQRu5rDBKglg/qmswqImCTOzQXAc5yPxA/54bX442t8dt/4Lq35aOV98p
         JKAG6A0+wbScpJGJ9Kdb6LNTMFXdR2gsvsBZA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793021823; x=1793626623;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/4ed/RMVrv6O/H4HMl4G3Xz4VIpFThxQX+sYINSnX4Q=;
        b=Q/WGjNVOK2w8F8AHBED91K85MFpQn1tUY8pmKl0nh3GWdu6oQJ6AxCYD1GobBdOOoz
         ES3wThb5idi31rXdteyeJY1a6TYF6/INnwoIJYghDiHyzIjiQQUVmGini0WOKzvMQGML
         zjNWgjSCGd9J6RNh7j4FrNrcklR981fT3Af9IVUfQZxozEBv5SAWX2slZRVad53eEIGT
         +rDDvbb1cBtK43BF+RDX5KeL08iUHtJHqgFoPu/eddCgeaStLMXUnY1rSl/CRM+AtxBW
         OTxZDWN1a2cfdKcCpQnleKSXQ7CYfKN3yu8cSmbn7FiIkrC0lgK/3QDSms9xcOZ0rIgn
         s0TQ==
X-Gm-Message-State: AFq9FYJMIplOO1fLxBVjylnxTG6ADQFwVaflVLYx5cvXj7m2REHi17VE
	DDnUdbBZkwWgAWRN/RFQN/AUnQtelwDaSs2rmCqhxyuU7YMQlkbGWnDgjw8lSA89A5g=
X-Gm-Gg: AYBFou0lfmmKR0nLOImJWhx+qS6z+mMBt02E7P236gnD/FT0ANDimYLw7RBdPbUHCwK
	QWqIKGdmiFkiEpwS9j1cxCsHvbtg3F0AoTlESAJ8PLQBUQoPnXwKdZz00/ghdPhrHd98aJmOA8s
	e8FH432EzKWXX9SNMs92egNnDE3nluYeW5HSUS+h4/AbIyAoiVC+dWSbxI/kX734xwKYQDdNBZb
	8D2x5NmX9lZZA21yMHxdWHc0WnS7h61JkN12T044v4mPMFSQjiPk8I61nJAtbwEVZcvCEFsAXH+
	md4M3fqiedY2TMP6L92gUszqqltDFluhxF5cv8SRJM6kcwnO5AtRZJIT/tgpe4eNfdcUtijJZMi
	yGQAMbMClw7hbfOzDzqz38DRtSrSsWpKjqOvj5S/i8UwY3yXc0N/tDU3/U91zHgjam3gWgrUooh
	HwVkpWaFXpgkMBCkMzrMoX3W3z4JsL5i1NI7gIWaibhGLFEJlu8/3hxH85EJPwa5rfxDj4uI5q4
	zqt1OR/B2bWR+cdQKtKnuiyLxhTloNrTrz4ZX7M388r0cexxGg3iUAdmOx4MFNZWTsvj5A=
X-Received: by 2002:a05:701b:2085:10b0:190:d0d9:3110 with SMTP id a92af1059eb24-199406385f5mr9674399c88.45.1793021823146;
        Mon, 26 Oct 2026 06:37:03 -0700 (PDT)
Received: from [172.19.0.2] ([49.142.45.25])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2ee5asm22432520c88.8.2026.10.26.06.37.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 06:37:02 -0700 (PDT)
From: Seongjun Hong <hsj0512@snu.ac.kr>
Date: Mon, 26 Oct 2026 13:36:44 +0000
Subject: [PATCH 2/2] iommu/io-pgtable-arm: invalidate iotlb on dirty pte
 read_and_clear
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261026-iommu-arm-fix-missing-dirty-pages-v1-2-115b6b1cc0f5@snu.ac.kr>
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
X-CRM114-CacheID: sfid-20261026_063704_185008_DD6E64B2 
X-CRM114-Status: GOOD (  11.85  )
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

Use io_pgtable_tlb_add_page() instead of iommu_iotlb_gather_add_range()
to prevent the undesirable case where iotlb invalidation cannot be executed
because gather->pgsize is not updated before arm_smmu_iotlb_sync().

io_pgtable_tlb_add_page() leads to iommu_iotlb_gather_add_page(), which
updates gather->pgsize. It prevents missing iotlb invalidation because
arm_smmu_iotlb_sync() invalidates iotlb only when gather->pgsize is not
zero.

Update gather iova range only when IOMMU_DIRTY_NO_CLEAR flag is not set,
as record_dirty() does.

Since iommu_dirty_bitmap_record() becomes stale, discard it.

Fixes: 4fe88fd8b4ae ("iommu/io-pgtable-arm: Add read_and_clear_dirty() support")
Cc: stable@vger.kernel.org
Signed-off-by: Seongjun Hong <hsj0512@snu.ac.kr>
---
 drivers/iommu/io-pgtable-arm.c | 11 +++++++++--
 include/linux/iommu.h          | 17 -----------------
 2 files changed, 9 insertions(+), 19 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 01c3f9cd5d9c..6513dac26e79 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -870,9 +870,16 @@ static int visit_dirty(struct io_pgtable_walk_data *walk_data, int lvl,
 	if (iopte_writeable_dirty(*ptep)) {
 		u64 iova = ALIGN_DOWN(walk_data->addr, size);
 
-		iommu_dirty_bitmap_record(dirty, iova, size);
-		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR))
+		if (dirty->bitmap)
+			iova_bitmap_set(dirty->bitmap, iova, size);
+
+		if (!(walk_data->flags & IOMMU_DIRTY_NO_CLEAR)) {
 			iopte_set_writeable_clean(ptep);
+			if (dirty->gather)
+				io_pgtable_tlb_add_page(walk_data->iop,
+							dirty->gather, iova,
+							size);
+		}
 	}
 
 	return 0;
diff --git a/include/linux/iommu.h b/include/linux/iommu.h
index ef5043752a36..df57ead2cc3c 100644
--- a/include/linux/iommu.h
+++ b/include/linux/iommu.h
@@ -1106,17 +1106,6 @@ static inline void iommu_dirty_bitmap_init(struct iommu_dirty_bitmap *dirty,
 	dirty->gather = gather;
 }
 
-static inline void iommu_dirty_bitmap_record(struct iommu_dirty_bitmap *dirty,
-					     unsigned long iova,
-					     unsigned long length)
-{
-	if (dirty->bitmap)
-		iova_bitmap_set(dirty->bitmap, iova, length);
-
-	if (dirty->gather)
-		iommu_iotlb_gather_add_range(dirty->gather, iova, length);
-}
-
 /* PCI device grouping function */
 extern struct iommu_group *pci_device_group(struct device *dev);
 /* Generic device grouping function */
@@ -1449,12 +1438,6 @@ static inline void iommu_dirty_bitmap_init(struct iommu_dirty_bitmap *dirty,
 {
 }
 
-static inline void iommu_dirty_bitmap_record(struct iommu_dirty_bitmap *dirty,
-					     unsigned long iova,
-					     unsigned long length)
-{
-}
-
 static inline void iommu_device_unregister(struct iommu_device *iommu)
 {
 }

-- 
2.43.0


