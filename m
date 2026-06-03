Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43FD0CD6E6C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B2CWGyb/jy+luBGe9CF0J2PFthBHN8proHGbNilHQH0=; b=dFWX7ufJX54vZjo6aJlp+MdHoO
	AqsZjORUfHAv3XCIZNY0ciB0jzcQXGg7gLFd5F+JyNR6PzlsLLK44y6AF60M+V0UhACNrUVWLq2oB
	0d79d+i0oB+bY9IEzuQBILS7srRT4vdV6yERxBV0pGuFuAC12v6jTb/M/U2aA6WFEw23er444rIc3
	6p9XmNmi5P7KW4QZZePpQjqyEBX7C4Vjr0QPs7eAVfLOINk01KZDSR1VN+O//D57vcE5kuDlJBxu6
	1yY1wyluGAzdt7cneeM6dfHTP37mvNV41nABtwKFCpuwvFc64OU/ZZiI3cXYdm1GS/tXYdO16trkR
	5EvdVnIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNJ-0000000FN8b-3Knx;
	Wed, 03 Jun 2026 15:19:21 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN5-0000000FMrn-1DmU
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=B2CWGyb/jy+luBGe9CF0J2PFthBHN8proHGbNilHQH0=; b=Xhoje7itf7eo4ALhBGAs3FmCqn
	ZQtRo1zHNO7GOkNcneFLuTpOoUHSCad1uxKZFUZeV6X5Cue6/tVIFkwdINDOaRHsuNb3MYA4TS6WY
	2HeZxWaI90MtvizSTZuT/KZIrdRBwE04Ksae0izYRQ4Lhf2ZBB72MM3cfNrn8nmCGSMK786y6iHcP
	YCLjOdLZgSuS61FDzbQM0Cd5FPLH/ODh6eN9IbUaD6azujqG3U7mB1MdePtajr/pmoQuki6g2Koai
	hyPt4j/vC/QrghzPMxom5PqfLfcu09LwZ1COtCijNr+Z9jbevKWpX+GTuSQeMG1MBQR28zCCYAqe2
	J5IrimpA==;
Received: from out199-10.us.a.mail.aliyun.com ([47.90.199.10])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnN2-0000000CXhV-1Ecq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499938; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=B2CWGyb/jy+luBGe9CF0J2PFthBHN8proHGbNilHQH0=;
	b=U3jtHoYmI9JraEWIDtxZuZpVz1+6UrR/jq4EnXftNI2jhoxHQBEi/loi9mbYloL5gGRjCAUA+sSxZGmvV+5wMtM5rEfLz/r+CjKy3oRCTUmG3DcKN8PKfSePZGeC93WYRzNmaUxd0QbIMdlcTpEck/XeEuJCBadaJ9Gvc52pyms=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R921e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033032089153;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR4e_1780499934;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR4e_1780499934 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:54 +0800
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
Subject: [PATCH v3 16/32] iommu/omap: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:48 +0800
Message-ID: <20260603151804.1963871-17-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161904_641141_85A4E414 
X-CRM114-Status: GOOD (  10.92  )
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

Implement iova_to_phys_length for OMAP IOMMU driver,
returning the actual PTE mapping size.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/omap-iommu.c | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/iommu/omap-iommu.c b/drivers/iommu/omap-iommu.c
index 8231d7d6bb6a..f4a416326f7c 100644
--- a/drivers/iommu/omap-iommu.c
+++ b/drivers/iommu/omap-iommu.c
@@ -1592,15 +1592,16 @@ static void omap_iommu_domain_free(struct iommu_domain *domain)
 	kfree(omap_domain);
 }
 
-static phys_addr_t omap_iommu_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t da)
+static phys_addr_t omap_iommu_iova_to_phys_length(struct iommu_domain *domain,
+						  dma_addr_t da,
+						  size_t *mapped_length)
 {
 	struct omap_iommu_domain *omap_domain = to_omap_domain(domain);
 	struct omap_iommu_device *iommu = omap_domain->iommus;
 	struct omap_iommu *oiommu = iommu->iommu_dev;
 	struct device *dev = oiommu->dev;
 	u32 *pgd, *pte;
-	phys_addr_t ret = 0;
+	phys_addr_t ret = PHYS_ADDR_MAX;
 
 	/*
 	 * all the iommus within the domain will have identical programming,
@@ -1609,19 +1610,27 @@ static phys_addr_t omap_iommu_iova_to_phys(struct iommu_domain *domain,
 	iopgtable_lookup_entry(oiommu, da, &pgd, &pte);
 
 	if (pte) {
-		if (iopte_is_small(*pte))
+		if (iopte_is_small(*pte)) {
 			ret = omap_iommu_translate(*pte, da, IOPTE_MASK);
-		else if (iopte_is_large(*pte))
+			if (mapped_length)
+				*mapped_length = IOPTE_SIZE;
+		} else if (iopte_is_large(*pte)) {
 			ret = omap_iommu_translate(*pte, da, IOLARGE_MASK);
-		else
+			if (mapped_length)
+				*mapped_length = IOLARGE_SIZE;
+		} else
 			dev_err(dev, "bogus pte 0x%x, da 0x%llx", *pte,
 				(unsigned long long)da);
 	} else {
-		if (iopgd_is_section(*pgd))
+		if (iopgd_is_section(*pgd)) {
 			ret = omap_iommu_translate(*pgd, da, IOSECTION_MASK);
-		else if (iopgd_is_super(*pgd))
+			if (mapped_length)
+				*mapped_length = IOSECTION_SIZE;
+		} else if (iopgd_is_super(*pgd)) {
 			ret = omap_iommu_translate(*pgd, da, IOSUPER_MASK);
-		else
+			if (mapped_length)
+				*mapped_length = IOSUPER_SIZE;
+		} else
 			dev_err(dev, "bogus pgd 0x%x, da 0x%llx", *pgd,
 				(unsigned long long)da);
 	}
@@ -1723,7 +1732,7 @@ static const struct iommu_ops omap_iommu_ops = {
 		.attach_dev	= omap_iommu_attach_dev,
 		.map_pages	= omap_iommu_map,
 		.unmap_pages	= omap_iommu_unmap,
-		.iova_to_phys	= omap_iommu_iova_to_phys,
+		.iova_to_phys_length	= omap_iommu_iova_to_phys_length,
 		.free		= omap_iommu_domain_free,
 	}
 };
-- 
2.43.7


