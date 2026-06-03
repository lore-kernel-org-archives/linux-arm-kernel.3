Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BF005CD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bNxex+pO0MrYJpvCBggj4Mk1SXXB71J1utBey15cQ0s=; b=DzrCRHs/0sYQ+5V8vnGH9SHn4s
	NPh0o/29ANHusBLcdGp/6rQcctm7E8xf0fX+KWsb0s3uWt/5LhrFIc+H9oTGdurhEu001q5mo5gUy
	+ABsIlP1uAEq3rr7fuDSZT8pDoArAcBzAl5ApHwpABmvxZ0+I1xGHn8NmunNJ5Cl8+YyNh7NB5m8j
	TzdBg6Zwk2v8aPP+1cfyeUbG5ssinVRwMHV1LRMhjv+tTHvYpDOuJyuhCmz9uYw8d3Rwo65qiwhfp
	gx2w6KQL9ZP/kma3eow/4+6ZIXhtnHSGfO2nwBWZ9kVeb33shkjJu7TeKigl1fXaaDi+FXPd+FX+y
	ClvQFWlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN2-0000000FMnA-24Cc;
	Wed, 03 Jun 2026 15:19:04 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnMy-0000000FMii-3nyy
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=bNxex+pO0MrYJpvCBggj4Mk1SXXB71J1utBey15cQ0s=; b=AfnPMdsbGihU4xtGVV46xDeq7O
	4buw6+2TgDG2hN8MxPp1d0Iua3iyqsK6uLWD7h3xD2FCDX5IievDoL/L1ZbCwDyOKYXpArCI4VXJF
	+Eha2MIb/nIjnKXIqI8S7L31j2iD8Yr31eevNasSEiNkVVGakvXet6tjjzoT+3WgMNnv9eRgzGQms
	kJlYrME/Wb/8Rlj83+onvDEkxP+/MvcHbgCkunjZT4tM3tBEdsmeocI7cD54PnizUgNRevwWC9AJH
	vdBjQ1hlrV9W25ju1lu4yL38HWd+BfsT8B7nyYY9CzN2YZK5HmB+ir2KX+IEDs+qCWK+mufMlpf8G
	YzRNY4ow==;
Received: from out30-133.freemail.mail.aliyun.com ([115.124.30.133])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnMt-0000000CXaU-0GR5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499922; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=bNxex+pO0MrYJpvCBggj4Mk1SXXB71J1utBey15cQ0s=;
	b=Li35YIm1TdCOVdK7wejcGydlm2Lw2Jflmwz1H7WHN6I49ZbSlQbD2DlRHoqflUQZu0YNY52xDN9xLyIICP50ayy+Jm7C9XHcGTu+EQA6JZ4QKQpN96LibRBoywk84/3ayPEuR4PS3JBfyXzxQw+0mFfJz19QJ85CoN1wJDAA3wk=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R321e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037033178;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR16_1780499920;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR16_1780499920 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:40 +0800
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
Subject: [PATCH v3 02/32] iommu/io-pgtable-arm: introduce iova_to_phys_length in io_pgtable_ops
Date: Wed,  3 Jun 2026 23:17:34 +0800
Message-ID: <20260603151804.1963871-3-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161856_379858_2E32DC8E 
X-CRM114-Status: GOOD (  11.41  )
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

Add iova_to_phys_length to struct io_pgtable_ops alongside iova_to_phys.
Implement in ARM LPAE backend: returns ARM_LPAE_BLOCK_SIZE at the resolved level.
The old iova_to_phys is kept as a thin wrapper for backward compat.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm.c | 23 +++++++++++++++++++++--
 include/linux/io-pgtable.h     |  7 +++++++
 2 files changed, 28 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0208e5897c29..f33a86fa0f6c 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -731,8 +731,21 @@ static int visit_iova_to_phys(struct io_pgtable_walk_data *walk_data, int lvl,
 	return 0;
 }
 
+static phys_addr_t arm_lpae_iova_to_phys_length(struct io_pgtable_ops *ops,
+						 unsigned long iova,
+						 size_t *mapped_length);
+
 static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 					 unsigned long iova)
+{
+	phys_addr_t phys = arm_lpae_iova_to_phys_length(ops, iova, NULL);
+
+	return (phys == PHYS_ADDR_MAX) ? 0 : phys;
+}
+
+static phys_addr_t arm_lpae_iova_to_phys_length(struct io_pgtable_ops *ops,
+						 unsigned long iova,
+						 size_t *mapped_length)
 {
 	struct arm_lpae_io_pgtable *data = io_pgtable_ops_to_data(ops);
 	struct iova_to_phys_data d;
@@ -742,13 +755,18 @@ static phys_addr_t arm_lpae_iova_to_phys(struct io_pgtable_ops *ops,
 		.addr = iova,
 		.end = iova + 1,
 	};
+	size_t block_size;
 	int ret;
 
 	ret = __arm_lpae_iopte_walk(data, &walk_data, data->pgd, data->start_level);
 	if (ret)
-		return 0;
+		return PHYS_ADDR_MAX;
+
+	block_size = ARM_LPAE_BLOCK_SIZE(d.lvl, data);
+	if (mapped_length)
+		*mapped_length = block_size;
 
-	iova &= (ARM_LPAE_BLOCK_SIZE(d.lvl, data) - 1);
+	iova &= (block_size - 1);
 	return iopte_to_paddr(d.pte, data) | iova;
 }
 
@@ -948,6 +966,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 		.map_pages	= arm_lpae_map_pages,
 		.unmap_pages	= arm_lpae_unmap_pages,
 		.iova_to_phys	= arm_lpae_iova_to_phys,
+		.iova_to_phys_length	= arm_lpae_iova_to_phys_length,
 		.read_and_clear_dirty = arm_lpae_read_and_clear_dirty,
 		.pgtable_walk	= arm_lpae_pgtable_walk,
 	};
diff --git a/include/linux/io-pgtable.h b/include/linux/io-pgtable.h
index e19872e37e06..42bcdd309b88 100644
--- a/include/linux/io-pgtable.h
+++ b/include/linux/io-pgtable.h
@@ -203,6 +203,10 @@ struct arm_lpae_io_pgtable_walk_data {
  * @map_pages:    Map a physically contiguous range of pages of the same size.
  * @unmap_pages:  Unmap a range of virtually contiguous pages of the same size.
  * @iova_to_phys: Translate iova to physical address.
+ * @iova_to_phys_length: Translate iova to physical address and return the
+ *			  remaining mapped length from iova to the end of the
+ *			  mapping entry via @mapped_length. If @mapped_length is
+ *			  NULL, only the physical address is returned.
  * @pgtable_walk: (optional) Perform a page table walk for a given iova.
  * @read_and_clear_dirty: Record dirty info per IOVA. If an IOVA is dirty,
  *			  clear its dirty state from the PTE unless the
@@ -220,6 +224,9 @@ struct io_pgtable_ops {
 			      struct iommu_iotlb_gather *gather);
 	phys_addr_t (*iova_to_phys)(struct io_pgtable_ops *ops,
 				    unsigned long iova);
+	phys_addr_t (*iova_to_phys_length)(struct io_pgtable_ops *ops,
+					   unsigned long iova,
+					   size_t *mapped_length);
 	int (*pgtable_walk)(struct io_pgtable_ops *ops, unsigned long iova, void *wd);
 	int (*read_and_clear_dirty)(struct io_pgtable_ops *ops,
 				    unsigned long iova, size_t size,
-- 
2.43.7


