Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DC19CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o1pBWOp6KPk1xwyKTTozbXEjvmJOV/Yw7GM3gk1sgVc=; b=Dm6TpC8Md5BFdbdfyZGz+iBQ6K
	R91sLKuaKOnPEu9Bm59YXWOoKjOvMcoxFko0qPbh8u5JydccnRPvdRX1tsbgXpaeqPMtW9tf1L+yp
	edY3ZHYN3BWBzxphUa1WZN9xhOg0/1hsTNiAubPxiI/QM1y9pm6OBC0Bv8NDhN7h+imHBtXwKAVx4
	R+DQ7q/nrPYsI3DsSQrQMD7dagSZak5ik/WmidgPysAdKu8FvNZlLOiMvTAeX9egPiNH1rBTkrTAH
	oh7qycR593zw3VVE5H+YQe+xcwROJ+syvu3NUfhkuK38nMewrzxoXyvytLJa5mPpPwf/eg68p8re2
	jT+hLzHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNT-0000000FNRK-0u8N;
	Wed, 03 Jun 2026 15:19:31 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNH-0000000FN5B-0q4Y
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=o1pBWOp6KPk1xwyKTTozbXEjvmJOV/Yw7GM3gk1sgVc=; b=UkeP9b46X+Bux5WMMbJsqnTSQM
	fjQf9kJ33WIvH4YZv4LyKecWfY0oGw6nXWSOXjrR6w6R4bfYKr2z9JB4BI00Bo3+Ydc161d3kDVkg
	lvIK+UXPZP2NotIZX4aHSm8S62qdPlISls4IZwqvBqzO24y4tHIZieSGAYkJYkAXRw1vzviK4FWZN
	TaAOLiD3G/1Qme+DtOAcKH5IRQa1gTBU4e/rLxngbvYZOduVhoF5dSY7knX41Lj2u4AzGIOFn0nRY
	gYCRE0TwFHopZO3NQAuSdhRu45FyaMwejRFvw2jqSsVXBNPiSJlMHzh4wEx0LYR1nsgc30HmHzGcu
	Kvr5sFmQ==;
Received: from out30-99.freemail.mail.aliyun.com ([115.124.30.99])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnND-0000000CXs8-3Zuo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499951; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=o1pBWOp6KPk1xwyKTTozbXEjvmJOV/Yw7GM3gk1sgVc=;
	b=E/0Mh5ep1zBw8wm0hFBWXel7/ni9lFcFy1IAkRWd3V7tLwguZIxWpfpE7zEPxyK0xjB4zpRc0VefWNcBvNFeaf3RgnEuaKB7Q3ZT2llCh0OSaYhsHoEPuzqmIsSRQGMxDyUe0qJWZtv7rvx1DVv4FBRFioO5gWPe0awKRiTf304=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R751e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR8Z_1780499949;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR8Z_1780499949 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:09 +0800
From: Guanghui Feng <guanghuifeng@linux.alibaba.com>
To: jgg@ziepe.ca
Cc: adrian.larumbe@collabora.com,
	airlied@gmail.com,
	alex@shazbot.org,
	alikernel-developer@linux.alibaba.com,
	baolu.lu@linux.intel.com,
	boris.brezillon@collabora.com,
	dri-devel@lists.freedesktop.org,
	dwmw2@infradead.org,
	iommu@lists.linux.dev,
	joro@8bytes.org,
	kevin.tian@intel.com,
	kvm@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	liviu.dudau@arm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	oliver.yang@linux.alibaba.com,
	robh@kernel.org,
	robin.murphy@arm.com,
	shiyu.zsq@linux.alibaba.com,
	steven.price@arm.com,
	suravee.suthikulpanit@amd.com,
	tzimmermann@suse.de,
	wei.guo.simon@linux.alibaba.com,
	will@kernel.org,
	xlpang@linux.alibaba.com
Subject: [PATCH v3 31/32] iommu/io-pgtable-dart: remove deprecated iova_to_phys wrapper
Date: Wed,  3 Jun 2026 23:18:03 +0800
Message-ID: <20260603151804.1963871-32-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161916_339417_82614D5D 
X-CRM114-Status: UNSURE (   6.31  )
X-CRM114-Notice: Please train this message.
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

Remove the iova_to_phys wrapper function and .iova_to_phys assignment
from DART io-pgtable, as all callers now use iova_to_phys_length.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-dart.c | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/iommu/io-pgtable-dart.c b/drivers/iommu/io-pgtable-dart.c
index 2dac21a578a7..01c4c022830b 100644
--- a/drivers/iommu/io-pgtable-dart.c
+++ b/drivers/iommu/io-pgtable-dart.c
@@ -333,18 +333,6 @@ static size_t dart_unmap_pages(struct io_pgtable_ops *ops, unsigned long iova,
 	return i * pgsize;
 }
 
-static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
-					    unsigned long iova,
-					    size_t *mapped_length);
-
-static phys_addr_t dart_iova_to_phys(struct io_pgtable_ops *ops,
-				     unsigned long iova)
-{
-	phys_addr_t phys = dart_iova_to_phys_length(ops, iova, NULL);
-
-	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
-}
-
 static phys_addr_t dart_iova_to_phys_length(struct io_pgtable_ops *ops,
 					    unsigned long iova,
 					    size_t *mapped_length)
@@ -416,7 +404,6 @@ dart_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	data->iop.ops = (struct io_pgtable_ops) {
 		.map_pages		= dart_map_pages,
 		.unmap_pages		= dart_unmap_pages,
-		.iova_to_phys		= dart_iova_to_phys,
 		.iova_to_phys_length	= dart_iova_to_phys_length,
 	};
 
-- 
2.43.7


