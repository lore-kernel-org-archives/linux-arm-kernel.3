Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3175E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Dec 2024 14:23:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bhBjVkTgtJEz/YnwuqS+duQU7s7QfKCiY2O40byhKsc=; b=XioLCngtVDOsXY7Kic9KN59K7E
	XjcoCqRTa8ewCo/f+6go2Lo6JxwqyqF8bQEs9Zo69X1bJa+HyFg090bL/2keYnrvWFuv3Pq52sSVs
	P+ZuQhoWGCH9ysZWUsGwes8RiZWfzWl+6Xc+7H6t9xwo8AJZ00+Bvmml6mi+T5k2VSMFrNI0HVbne
	roby0oRgAEumIXfn2JncXTUnpWSP5aFOfaXC0DAsDLOXBbBG0ZwYFx8XuJC5lq/OS0W40GIl9QGXe
	q9MLWPPYiOkz6Ypuu2ujsgMFw/Kv0TL9/XyvTqLpKrKZCjknJo2NJVnfwLcVg0AvHyLcJ3VcqEvKV
	0bKHcvcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tL18X-0000000BjwV-0n1l;
	Tue, 10 Dec 2024 14:22:53 +0000
Received: from szxga05-in.huawei.com ([45.249.212.191])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tL12M-0000000BiHM-1xgp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Dec 2024 14:16:33 +0000
Received: from mail.maildlp.com (unknown [172.19.88.163])
	by szxga05-in.huawei.com (SkyGuard) with ESMTP id 4Y714C6B7Jz1JDvg;
	Tue, 10 Dec 2024 22:16:11 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 154241802E8;
	Tue, 10 Dec 2024 22:16:26 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Tue, 10 Dec 2024 22:16:25 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v5 10/10] drivers/perf: hisi: Delete redundant blank line of DDRC PMU
Date: Tue, 10 Dec 2024 22:15:25 +0800
Message-ID: <20241210141525.37788-11-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241210141525.37788-1-yangyicong@huawei.com>
References: <20241210141525.37788-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241210_061630_697511_F970436D 
X-CRM114-Status: UNSURE (   8.77  )
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

From: Junhao He <hejunhao3@huawei.com>

Do not add blank line at the end of a code block defined by braces.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
index fb309b8d5301..7e490f8868f2 100644
--- a/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
+++ b/drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c
@@ -550,7 +550,6 @@ static void __exit hisi_ddrc_pmu_module_exit(void)
 {
 	platform_driver_unregister(&hisi_ddrc_pmu_driver);
 	cpuhp_remove_multi_state(CPUHP_AP_PERF_ARM_HISI_DDRC_ONLINE);
-
 }
 module_exit(hisi_ddrc_pmu_module_exit);
 
-- 
2.24.0


