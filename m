Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 086D9CD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Jun 2026 15:19:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6wu4xt2SoksscXk0W48QmnDjXSJs3uObhzvzFgCeYOU=; b=maH0swRm/CL5gCOYZIO1XYQF1C
	9MAEHbv2MDmOiKQOo2SeAqus2pqBikkHBicRZViMoglJQNkShWFVGm73CN5dzihZm5grxruvzu/PU
	R/EJ9ktKuFnsNc707MEYqfVWkcxcCsHlvmzA6AGfJMph6EymMdiYv1VXsqvh/DV1VsKWTAA2sMLdQ
	W/xVl+R5jdjvW9MNLHNvITdRLcWv1TYpgjL5ZrkkrbaDzP6mOkSq+2UgQb2f0ET5dn5zZaqPw1lfH
	rbC6SpHogjKLQhrr01lkaLxafc1GYqOYWQMorS0WQSpdU2LcKBJJfCq5QUMcN4L1eY8tGnAU8aqev
	Yok/DC2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNS-0000000FNPD-1GnH;
	Wed, 03 Jun 2026 15:19:30 +0000
Received: from desiato.infradead.org ([90.155.92.199])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUnNF-0000000FN3T-3s4z
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 03 Jun 2026 15:19:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=6wu4xt2SoksscXk0W48QmnDjXSJs3uObhzvzFgCeYOU=; b=RByszeyR17I+mgs9tfRkHrqVf9
	c6p4Un0wu3+Mx4UbNyw/UO9jxHaMIRQ0ZBP5x5jCmP+BOBimM3Ty+LiG1cUWrIHk/gDzLoaIjA6T8
	OLuwGmO9aHRnUx+HUGE4sJp0lltaeoxjzmvcVPB6gn79f+BTs87SK8tqXolbjR9Ls6t33jjzoY7n1
	10MS5Jxr7qbJhndhdfImGXAkepTp2pGCH/u0ZfxL7J1QKpDaL4xMzcAYZWsWy9Wd3mi5cLPpEut2s
	5eC5KMaiQtlF42XOTms1B7mKuL+az9WosZ1W7UZbX0O3pDPibCvxP/snsTJUaDz8qIXOReCcNFK3T
	4E9rXR1w==;
Received: from out30-98.freemail.mail.aliyun.com ([115.124.30.98])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wUnNC-0000000CXqS-3pbx
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Jun 2026 15:19:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1780499949; h=From:To:Subject:Date:Message-ID:MIME-Version;
	bh=6wu4xt2SoksscXk0W48QmnDjXSJs3uObhzvzFgCeYOU=;
	b=yj2XtTr8PywukJo0H4lymCukct14uf3SgFLw5+ShiF3VzIlg4bB2lEeCNA3wwfJhtj5Mc1AvsppsjIbhhcfuIJSVzXVLqFtHow8OeYbYzJZ32UuDTf+hxh9w99Wjf6nFt+zmZpwMClFLq1kuJ949LqPZdKOubEeuDen2RypDWf0=
X-Alimail-AntiSpam: AC=PASS;BC=-1|-1;BR=01201311R151e4;CH=green;DM=||false|;DS=||;FP=0|-1|-1|-1|0|-1|-1|-1;HT=maildocker-contentspam011083073210;MF=guanghuifeng@linux.alibaba.com;NM=1;PH=DS;RN=28;SR=0;TI=SMTPD_---0X47fR7p_1780499946;
Received: from VM20241011-104.tbsite.net(mailfrom:guanghuifeng@linux.alibaba.com fp:SMTPD_---0X47fR7p_1780499946 cluster:ay36)
          by smtp.aliyun-inc.com;
          Wed, 03 Jun 2026 23:19:06 +0800
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
Subject: [PATCH v3 28/32] iommu/io-pgtable: selftests switch to iova_to_phys_length
Date: Wed,  3 Jun 2026 23:18:00 +0800
Message-ID: <20260603151804.1963871-29-guanghuifeng@linux.alibaba.com>
X-Mailer: git-send-email 2.43.7
In-Reply-To: <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
References: <20260602104637.1219810-1-guanghuifeng@linux.alibaba.com>
 <20260603151804.1963871-1-guanghuifeng@linux.alibaba.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260603_161915_255726_65D31017 
X-CRM114-Status: UNSURE (   8.58  )
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

Migrate io-pgtable ARM selftests to use ops->iova_to_phys_length
instead of the deprecated ops->iova_to_phys.

Signed-off-by: Guanghui Feng <guanghuifeng@linux.alibaba.com>
---
 drivers/iommu/io-pgtable-arm-selftests.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm-selftests.c b/drivers/iommu/io-pgtable-arm-selftests.c
index 334e70350924..78252344c3d0 100644
--- a/drivers/iommu/io-pgtable-arm-selftests.c
+++ b/drivers/iommu/io-pgtable-arm-selftests.c
@@ -72,13 +72,13 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 		 * Initial sanity checks.
 		 * Empty page tables shouldn't provide any translations.
 		 */
-		if (ops->iova_to_phys(ops, 42))
+		if (ops->iova_to_phys_length(ops, 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(test, i);
 
-		if (ops->iova_to_phys(ops, SZ_1G + 42))
+		if (ops->iova_to_phys_length(ops, SZ_1G + 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(test, i);
 
-		if (ops->iova_to_phys(ops, SZ_2G + 42))
+		if (ops->iova_to_phys_length(ops, SZ_2G + 42, NULL) != PHYS_ADDR_MAX)
 			return __FAIL(test, i);
 
 		/*
@@ -100,7 +100,7 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 					    GFP_KERNEL, &mapped))
 				return __FAIL(test, i);
 
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+			if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 				return __FAIL(test, i);
 
 			iova += SZ_1G;
@@ -114,7 +114,7 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 			if (ops->unmap_pages(ops, iova, size, 1, NULL) != size)
 				return __FAIL(test, i);
 
-			if (ops->iova_to_phys(ops, iova + 42))
+			if (ops->iova_to_phys_length(ops, iova + 42, NULL) != PHYS_ADDR_MAX)
 				return __FAIL(test, i);
 
 			/* Remap full block */
@@ -122,7 +122,7 @@ static int arm_lpae_run_tests(struct kunit *test, struct io_pgtable_cfg *cfg)
 					   IOMMU_WRITE, GFP_KERNEL, &mapped))
 				return __FAIL(test, i);
 
-			if (ops->iova_to_phys(ops, iova + 42) != (iova + 42))
+			if (ops->iova_to_phys_length(ops, iova + 42, NULL) != (iova + 42))
 				return __FAIL(test, i);
 
 			iova += SZ_1G;
-- 
2.43.7


