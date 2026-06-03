Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A955CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F3eN6aAZAGCJthbocac3Ss/Txd8BjZoiukZVZ8bvt4k=; b=o6j4QrMlZadjXUj7tXhGa0HbD6
	bS3A1aTlgsM8kd5AYXPL6NAfWllvZ0D+QFPZcOMXNbz6ObaoZ/3Cx0jr+zm78IXprzoDdOCUGDxFp
	9zEy/fmHzCS0EZaUY7a3RRHlCoNgvNb0vMDp2x+ZhJj8bkuTW66x3zfkL2iikF8gUoNLzFanIR8rx
	T4JzkBrP3sgcBKXVH6jNDB47OPqiuQfW3Z9f9aXFjg8+dOrec4BJgqTaPNjhfhOJorG1ywYXO5Q91
	5/OirHx+V7OTeNBM8r5TiJGZgUC0yjtR27tEJCCRqiWNQSpNTOmTXLoiEIp8nU+sy8JqlcuQdK8vu
	uXqPTxjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN3-0000000FMpC-0j6g;
	Wed, 03 Jun 2026 15:19:05 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN1-0000000FMlr-1hWX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=F3eN6aAZAGCJthbocac3Ss/Txd8BjZoiukZVZ8bvt4k=; b=ib+hiPVan8xpGo0x8rxDhMdp7b
	L2DzL83MPJ36qdcpxa9IiqqCdwZ5V6g+1CCSrG5BmBq7/+zfbuGElwkwW8nbKNO+u6jyQ+4c9eaPC
	RmegeAQjBSzfzhgbRfsQleibRr2a7FilhH8gPoFXiLfhDi7v7+bPT++WvvAX5znh2B/NPg3xR0/Nc
	14msVQ7gVNqj6+4ihhhmBiFo9OuvnqOzrG6/HhZnt86JCxqodstarHvpdYHi9W4PRyaFmfa87bEYP
	gS8vwjENTA13Q1ufdtQZH036Jf0IeDE1ZIntcPp4hU+Q/kYV+oozlOQf1pqO4Bw0ICay6xCGb4dJO
	pY3XT7nQ==;
Received: from out30-118.freemail.mail.aliyun.com ([115.124.30.118])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnMy-0000000CXb6-0nq9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499926; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=F3eN6aAZAGCJthbocac3Ss/Txd8BjZoiukZVZ8bvt4k=;
	b=YvaDwZrbt2OLddwT5aLexmG60mYcgSh8AC5oMN/CaHjsScH+C0rf/In8S95pu12h9Fc+jkqDWPapL0kmQGY87Cvb6dEtdgF+ZOD5vgjUDZvHmmemQB1uQaBAStEYi66ocb5UpR/R7VeKBIe/dbwBoqZogf08QbZnr4igWrTPhho=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R181e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR29_1780499924;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR29_1780499924 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:44 +0800
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
Subject: [PATCH v3 06/32] iommu/arm-smmu-v3: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:38 +0800
Message-ID: <20260603151804.1963871-7-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161900_830946_89FF757E 
X-CRM114-Status: UNSURE (   9.28  )
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

Migrate ARM SMMUv3 to implement iova_to_phys_length, calling
ops->iova_to_phys_length on the io-pgtable layer.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c | 10 ++++++----
 1 file changed, 6 insertions(+), 4 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
index e8d7dbe495f0..616e7057ec7f 100644
--- a/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
+++ b/drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c
@@ -4069,14 +4069,16 @@ static void arm_smmu_iotlb_sync(struct iommu_domain *domain,
 }
 
 static phys_addr_t
-arm_smmu_iova_to_phys(struct iommu_domain *domain, dma_addr_t iova)
+arm_smmu_iova_to_phys_length(struct iommu_domain *domain, dma_addr_t iova,
+			     size_t *mapped_length)
 {
 	struct io_pgtable_ops *ops = to_smmu_domain(domain)->pgtbl_ops;
 
+
 	if (!ops)
-		return 0;
+		return PHYS_ADDR_MAX;
 
-	return ops->iova_to_phys(ops, iova);
+	return ops->iova_to_phys_length(ops, iova, mapped_length);
 }
 
 static struct platform_driver arm_smmu_driver;
@@ -4396,7 +4398,7 @@ static const struct iommu_ops arm_smmu_ops = {
 		.unmap_pages		= arm_smmu_unmap_pages,
 		.flush_iotlb_all	= arm_smmu_flush_iotlb_all,
 		.iotlb_sync		= arm_smmu_iotlb_sync,
-		.iova_to_phys		= arm_smmu_iova_to_phys,
+		.iova_to_phys_length	= arm_smmu_iova_to_phys_length,
 		.free			= arm_smmu_domain_free_paging,
 	}
 };
-- 
2.43.7


