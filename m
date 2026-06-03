Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0F47CD6E73
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4rS05BvfO7tKKbX+DS2TrSOXcVnNjfP3PbV2BH3iGY=; b=ZOVyflVT7/pQR8x3NxiszHwd8C
	nvX6Cl9dQjQQgn1xpsuO7FeQ4jDhXxhRkCVX6HuUPNqIh/aXXSvFgMhx7orp+r6pb8KY9ascsFU4N
	kbSWvzUd0mL19hOatdRMcN53SbDQ4Bf9W54Nc051qFzTElflv0ecbsCaK7osnYqsJxIaSTFP7wckk
	Zx53Yrlf2O5DEpmQJgQdm/Znex3u7pbju7NRwwsNnWPs3S+hOX5jfq4SBq86Td5BD4uWAbXhVhvhP
	IMrJxH6A8LerjqCgnHa9JvyAfwmj+DVYHotcagv6cwCMGyeDvZ7/zLQNJ5qMXBBYx17I2KAyfHwkx
	Dj7Ej0bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNP-0000000FNIO-2XdS;
	Wed, 03 Jun 2026 15:19:27 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNC-0000000FMzO-0hDW
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=p4rS05BvfO7tKKbX+DS2TrSOXcVnNjfP3PbV2BH3iGY=; b=OXtLH1zmxpUPDR+3c9HBisRrx1
	RnyDSsS82rd6Q1Ka0mLDj3ujNek8s7ZcpeDDRi5Bz0npJK0UdiwKhHuHmolaLhUi+Tj1jNt52NItB
	3Vlza/fZUgT64LswdXW+UvPLENsQ49gIZvYBYGt2agSvubq2f5nFp6CshtB6wvf94kSmWuHMDnZpQ
	SOS+SL6tV8NV/xDMyNTPOXTDxnJyA8biNtpORLSmBHz0MBUOPnxMcAWE4/687u2NnZaYTjv9GPPPL
	31z0rmKUScwDTA1OiN0zTuwqtarvn5QhLaH7UCiCiEjKIH91io55SMVf37ctZm6erUogYCJnKz8EU
	37uAsayg==;
Received: from out30-100.freemail.mail.aliyun.com ([115.124.30.100])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnN7-000000045hm-1z5D
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499929; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=p4rS05BvfO7tKKbX+DS2TrSOXcVnNjfP3PbV2BH3iGY=;
	b=XQWSXUqSPzKwm8OQ/jHiVvaurfML3HQgeKTVEhHl64dSjCpKBKVnWBmjCvFfmb8crvkoCZ+CuYiUsV9fqA0sMWjH03txts/P45b9TiyqhZTOMfBQXZ/QJFtbtj94eTnbcA5bvGSMTdw+7Z6AiRQR3oblNUmAumw25ZaBwe5eFSo=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R121e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam033045098064;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR2o_1780499927;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR2o_1780499927 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:18:47 +0800
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
Subject: [PATCH v3 09/32] iommu/apple-dart: implement iova_to_phys_length
Date: Wed,  3 Jun 2026 23:17:41 +0800
Message-ID: <20260603151804.1963871-10-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161910_224127_28F6B1B9 
X-CRM114-Status: UNSURE (   9.84  )
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

Migrate Apple DART to implement iova_to_phys_length, passing through
mapped_length from io-pgtable.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/apple-dart.c | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/drivers/iommu/apple-dart.c b/drivers/iommu/apple-dart.c
index 17bdadb6b504..fdc533ba72da 100644
--- a/drivers/iommu/apple-dart.c
+++ b/drivers/iommu/apple-dart.c
@@ -528,16 +528,17 @@ static int apple_dart_iotlb_sync_map(struct iommu_domain *domain,
 	return 0;
 }
 
-static phys_addr_t apple_dart_iova_to_phys(struct iommu_domain *domain,
-					   dma_addr_t iova)
+static phys_addr_t apple_dart_iova_to_phys_length(struct iommu_domain *domain,
+					   dma_addr_t iova, size_t *mapped_length)
 {
 	struct apple_dart_domain *dart_domain = to_dart_domain(domain);
 	struct io_pgtable_ops *ops = dart_domain->pgtbl_ops;
 
+
 	if (!ops)
-		return 0;
+		return PHYS_ADDR_MAX;
 
-	return ops->iova_to_phys(ops, iova);
+	return ops->iova_to_phys_length(ops, iova, mapped_length);
 }
 
 static int apple_dart_map_pages(struct iommu_domain *domain, unsigned long iova,
@@ -1018,7 +1019,7 @@ static const struct iommu_ops apple_dart_iommu_ops = {
 		.flush_iotlb_all = apple_dart_flush_iotlb_all,
 		.iotlb_sync	= apple_dart_iotlb_sync,
 		.iotlb_sync_map	= apple_dart_iotlb_sync_map,
-		.iova_to_phys	= apple_dart_iova_to_phys,
+		.iova_to_phys_length = apple_dart_iova_to_phys_length,
 		.free		= apple_dart_domain_free,
 	}
 };
-- 
2.43.7


