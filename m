Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 291CFCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iWO0sMJG8r4J7LKnC484yIJn4WyUtK7EGFantGfMt+4=; b=tGroqopMiJ1A34V7onp6hdGH/r
	/KVmzEY7KMxjNsh/W/9JWRPSS8Up/Drd/somPMrZDc46ZD7vKSphUlJ3T1JgiokgkJWQNzwjaxxEs
	Jpz9zJWrde5UsCWt2mwfPl6SuJ/XxsI3YCB0hZm+O7pqV7JNYc/BRWKAZnXhKmBaQI0IDkEDmFku+
	6IwanKf0i2UdqTMwhvkoufupAp4t3xz1Cv90mn7FJI0QdmwzZROgpfXmE9REPhCxwHiDakc7u9Mqc
	BQDpXPvQoRPafP1QV7/tuFzfbG2CPWr8Lul2xOfipo08ulPEgjbfvZjzTmk+gNCZ1gKsbZLQRbHkE
	gX9fFZKw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNL-0000000FNBU-1gCU;
	Wed, 03 Jun 2026 15:19:23 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNA-0000000FMxL-2DFI
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=iWO0sMJG8r4J7LKnC484yIJn4WyUtK7EGFantGfMt+4=; b=UK/eyF8J3u0YVs2H0Fmp6tMGoB
	7IaGaEWvFqyCnML+tu84JXcpCky+Qkq8Ls3GOcQvW6sdOU2SU4HNPKkzQrB1I4wLlEMi7itLr/5kC
	ihYNyni8TOJvMQIcCDXuWMVZ+hhccnjBLz1eIl78xunvC3/rSRl2jgmvjMGAoHjuLm7TDD8/EORwv
	gEI/1iWWQwOvDxPRYcOFJ4L3INh9QSrcs+mD5aN8cSkBblRl0QhU2JfZlnF30Ex/TWxpmSwH+jIJi
	MfJU7coSdGEiTcHEpDPfWBMyo/pOjx61JUtI79rTP1CtgA3bY8AkKYJPxyskDdgEIryN0oW97zSZM
	QgLVKRdg==;
Received: from out30-113.freemail.mail.aliyun.com ([115.124.30.113])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN5-000000045gQ-41Ih
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499933; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=iWO0sMJG8r4J7LKnC484yIJn4WyUtK7EGFantGfMt+4=;
	b=mgnOawTmohCMp1wPATKwzqF7HiGzpzYONgwlQTYAiJigmHcg/LnN5RL+luPimvQSeqmLIZ4xRyWNAjViMIIecFK/UewRfbINL2z15SlKRAghNmtWUMIQc+8tMBL9/GTcjYCPyOHBdATbxR43+jPyxf2gNL7lrYuPg84RA9bUtnQ=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R581e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033037026112;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR3Q_1780499930;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR3Q_1780499930 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:50 +0800
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
Subject: [PATCH v3 12/32] iommu/exynos: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:44 +0800
Message-ID: <20260603151804.1963871-13-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161908_770120_0A8AC81F 
X-CRM114-Status: UNSURE (   9.82  )
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

Implement iova_to_phys_length for Exynos IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/exynos-iommu.c | 20 ++++++++++++++------
 1 file changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/exynos-iommu.c b/drivers/iommu/exynos-iommu.c
index 874d05f4b396..17d77b9114c4 100644
--- a/drivers/iommu/exynos-iommu.c
+++ b/drivers/iommu/exynos-iommu.c
@@ -1372,13 +1372,14 @@ static size_t exynos_iommu_unmap(struct iommu_domain *iommu_domain,
 	return 0;
 }
 
-static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
-					  dma_addr_t iova)
+static phys_addr_t exynos_iommu_iova_to_phys_length(struct iommu_domain *iommu_domain,
+						 dma_addr_t iova,
+						 size_t *mapped_length)
 {
 	struct exynos_iommu_domain *domain = to_exynos_domain(iommu_domain);
 	sysmmu_pte_t *entry;
 	unsigned long flags;
-	phys_addr_t phys = 0;
+	phys_addr_t phys = PHYS_ADDR_MAX;
 
 	spin_lock_irqsave(&domain->pgtablelock, flags);
 
@@ -1386,13 +1387,20 @@ static phys_addr_t exynos_iommu_iova_to_phys(struct iommu_domain *iommu_domain,
 
 	if (lv1ent_section(entry)) {
 		phys = section_phys(entry) + section_offs(iova);
+		if (mapped_length)
+			*mapped_length = SECT_SIZE;
 	} else if (lv1ent_page(entry)) {
 		entry = page_entry(entry, iova);
 
-		if (lv2ent_large(entry))
+		if (lv2ent_large(entry)) {
 			phys = lpage_phys(entry) + lpage_offs(iova);
-		else if (lv2ent_small(entry))
+			if (mapped_length)
+				*mapped_length = LPAGE_SIZE;
+		} else if (lv2ent_small(entry)) {
 			phys = spage_phys(entry) + spage_offs(iova);
+			if (mapped_length)
+				*mapped_length = SPAGE_SIZE;
+		}
 	}
 
 	spin_unlock_irqrestore(&domain->pgtablelock, flags);
@@ -1484,7 +1492,7 @@ static const struct iommu_ops exynos_iommu_ops = {
 		.attach_dev	= exynos_iommu_attach_device,
 		.map_pages	= exynos_iommu_map,
 		.unmap_pages	= exynos_iommu_unmap,
-		.iova_to_phys	= exynos_iommu_iova_to_phys,
+		.iova_to_phys_length	= exynos_iommu_iova_to_phys_length,
 		.free		= exynos_iommu_domain_free,
 	}
 };
-- 
2.43.7


