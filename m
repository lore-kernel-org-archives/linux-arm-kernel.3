Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C81FCCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Nov 2025 08:44:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mf1Syaj6YrgmTs1o+2e8mzsi+P6a+DDzD0J+A2WyoLI=; b=j6SgSTgnFIvozcWFD+Dm4nmqZT
	IaN5R3EAj4VIbIhoUbTqz8WEZGRrGtnoz8IMqunBksrqhjhEceahh57HE0kfiYNaRmg0QS+DZWDjd
	ZDB+rDaARAF5w7vxVaJmW1sdqgWF5KijpWOaRBcN9XU7rA8cMrkctTQAM7w8/u+UH+XwGVECmPUrf
	MT0ibK1JfYDh6CEdOjb7e+NyA+yNMSYPIGF7OFw6Ma8cOZ3zn1fMY7QyhB0bnKwqztZcjYgzYIe1d
	Ao/mdTm+L8FKnODEW1ljQo5YY5rLjpor4G2lcvzpZ4m9VoRWBavd+I7zeH4quOSzO+zd/w5gYaMKo
	GvLqrv4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4W-0000000Gu55-0qYm;
	Fri, 07 Nov 2025 08:43:52 +0000
Received: from mail-m1973190.qiye.163.com ([220.197.31.90])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHI4S-0000000Gu3v-3cye
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Nov 2025 08:43:50 +0000
Received: from localhost.localdomain (unknown [122.224.147.158])
	by smtp.qiye.163.com (Hmail) with ESMTP id 28c500960;
	Fri, 7 Nov 2025 16:43:33 +0800 (GMT+08:00)
From: Shouping Wang <allen.wang@hj-micro.com>
To: will@kernel.org,
	robin.murphy@arm.com
Cc: mark.rutland@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	allen.wang@hj-micro.com,
	andy.xu@hj-micro.com,
	peter.du@hj-micro.com
Subject: [PATCH 1/2] perf/arm-ni: rename PMU device name
Date: Fri,  7 Nov 2025 16:43:18 +0800
Message-ID: <20251107084320.555979-2-allen.wang@hj-micro.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251107084320.555979-1-allen.wang@hj-micro.com>
References: <20251107084320.555979-1-allen.wang@hj-micro.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9a5d7c37ed09d9kunm533ae5d212b2dd2
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlCHx8dVkIeHxpOQhpPTEJLSFYVFAkWGhdVEwETFh
	oSFyQUDg9ZV1kYEgtZQVlKSUlVSUlPVUpPTFVKTkNZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0hVSk
	tLVUpCS0tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251107_004349_093179_024721BF 
X-CRM114-Status: GOOD (  11.85  )
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

The PMU device names are arm_ni_1_*,arm_ni_2_*, etc. 
The device names change based on the order of registration 
for multiple NI instances. By naming the PMU device using 
its address, the device name can be made independent of 
the registration order.

Signed-off-by: Shouping Wang <allen.wang@hj-micro.com>
---
 drivers/perf/arm-ni.c | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/drivers/perf/arm-ni.c b/drivers/perf/arm-ni.c
index 1615a0564031..32eabdbe877a 100644
--- a/drivers/perf/arm-ni.c
+++ b/drivers/perf/arm-ni.c
@@ -53,6 +53,7 @@
 
 #define NI_NUM_COUNTERS		8
 #define NI_CCNT_IDX		31
+#define NI_PMU_PA_SHIFT		12
 
 /* Event attributes */
 #define NI_CONFIG_TYPE		GENMASK_ULL(15, 0)
@@ -115,7 +116,6 @@ struct arm_ni {
 	struct device *dev;
 	void __iomem *base;
 	enum ni_part part;
-	int id;
 	int cpu;
 	int num_cds;
 	struct hlist_node cpuhp_node;
@@ -560,7 +560,7 @@ static int arm_ni_init_cd(struct arm_ni *ni, struct arm_ni_node *node, u64 res_s
 		.read = arm_ni_event_read,
 	};
 
-	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%d_cd_%d", ni->id, cd->id);
+	name = devm_kasprintf(ni->dev, GFP_KERNEL, "arm_ni_%llx", res_start >> NI_PMU_PA_SHIFT);
 	if (!name)
 		return -ENOMEM;
 
@@ -623,7 +623,6 @@ static int arm_ni_probe(struct platform_device *pdev)
 	struct arm_ni *ni;
 	struct resource *res;
 	void __iomem *base;
-	static atomic_t id;
 	int ret, num_cds;
 	u32 reg, part;
 
@@ -674,7 +673,6 @@ static int arm_ni_probe(struct platform_device *pdev)
 	ni->base = base;
 	ni->num_cds = num_cds;
 	ni->part = part;
-	ni->id = atomic_fetch_inc(&id);
 	ni->cpu = cpumask_local_spread(0, dev_to_node(ni->dev));
 	platform_set_drvdata(pdev, ni);
 
-- 
2.43.0


