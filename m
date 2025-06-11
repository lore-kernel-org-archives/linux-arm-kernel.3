Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F03CC678DC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aI96b9lLbrtCOM5eTINB9+bY1cWihDbig1ATPuanPxc=; b=dcfVNXZ/3C5BYGCgqXuxrOlaPz
	wcqwewapssbDPeZ/YKHm60IKlwMgSHpVGYkmCFTvjJFjkXfIvCbJhJYt3rXA9jl5DBMVNXkNygeuV
	sM5881gtHk0EHuQCVHfMODiXU+QM4o8zxYzVqsAHNvlea0FdulczZ04YCGYeku6gR+htpD8X3cEG2
	D4Yo+VwSVYmjpsdWvv+FVZZWyrRLFUNiOfxSLVS0RgDcEBmEa+MT9QAYU38MannKN74qbyzElvadL
	V2nOO+HALUA69Nz03SeMDAUhgAOn3JP8qzrYiBC1KC1V6xTLtUAi0wUB7icONcr3JZbc3mbM0+U0s
	dMCBgt5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnF-0000000ADQQ-0Dpk;
	Wed, 11 Jun 2025 14:51:09 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIj3-00000009cTv-2tJY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:30:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id EF94315A1;
	Wed, 11 Jun 2025 03:30:11 -0700 (PDT)
Received: from e129823.cambridge.arm.com (e129823.arm.com [10.1.197.6])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 08A723F673;
	Wed, 11 Jun 2025 03:30:29 -0700 (PDT)
From: Yeoreum Yun <yeoreum.yun@arm.com>
To: suzuki.poulose@arm.com,
	mike.leach@linaro.org,
	james.clark@linaro.org,
	alexander.shishkin@linux.intel.com,
	leo.yan@arm.com
Cc: coresight@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	kernel test robot <lkp@intel.com>
Subject: [PATCH v2] coresight: fix indentation error in cscfg_remove_owned_csdev_configs()
Date: Wed, 11 Jun 2025 11:30:25 +0100
Message-Id: <20250611103025.939020-1-yeoreum.yun@arm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_033033_770434_1AE5B502 
X-CRM114-Status: UNSURE (   9.08  )
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

Fix wrong indentation in cscfg_remove_owned_csdev_configs()

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202506102238.XQfScl5x-lkp@intel.com/
Fixes: 53b9e2659719 ("coresight: holding cscfg_csdev_lock while removing cscfg from csdev")
Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>
---

Sorry for my bad forgetting to run checkpatch.pl...

---
 drivers/hwtracing/coresight/coresight-syscfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwtracing/coresight/coresight-syscfg.c b/drivers/hwtracing/coresight/coresight-syscfg.c
index 83dad24e0116..6836b05986e8 100644
--- a/drivers/hwtracing/coresight/coresight-syscfg.c
+++ b/drivers/hwtracing/coresight/coresight-syscfg.c
@@ -395,7 +395,7 @@ static void cscfg_remove_owned_csdev_configs(struct coresight_device *csdev, voi
 	if (list_empty(&csdev->config_csdev_list))
 		return;

-  guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);
+	guard(raw_spinlock_irqsave)(&csdev->cscfg_csdev_lock);

 	list_for_each_entry_safe(config_csdev, tmp, &csdev->config_csdev_list, node) {
 		if (config_csdev->config_desc->load_owner == load_owner)
--
LEVI:{C3F47F37-75D8-414A-A8BA-3980EC8A46D7}


