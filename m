Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C0DD10BE5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 26 Oct 2024 07:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u/cfnRdGTqWkuF7xSCc7xE9/Pp3MGIjF5qrUXoTiTFI=; b=OEit0ddMtsWvajNzSTcXHsak/0
	UDI3pOt4VE8VoISJN/jHNXiW7OFRHWP2AwnkeiqoY9zFSdDHTO9TeFRNEiwBAuvRUyBvOAGcXxZEj
	dbM4XntGuGWmQGwsx4nBTVwyLbwWJiJQlTFnEBJlIuDOYJlVZ4R0MEjnjj9UVUkc4tMLWpy2Gwte7
	1EpJVYpGRVzksTzjoaem9oi71f8RHMEI3I3uwLmxgFPMFHdWJxpgca7t/sVpEPkiF51IvDZJcU+3X
	FwvIdqfdduEqNHmurERQQpPDvd71uueVmOzIjS7bbkkvPzXLXULQlDQiyddbcKEI6ap8sCp4NeFUo
	BMzTt6vQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bLY-000000068fA-0dnd;
	Sat, 26 Oct 2024 07:36:28 +0000
Received: from szxga08-in.huawei.com ([45.249.212.255])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4bAV-000000066sc-3h1D
	for linux-arm-kernel@lists.infradead.org;
	Sat, 26 Oct 2024 07:25:06 +0000
Received: from mail.maildlp.com (unknown [172.19.163.48])
	by szxga08-in.huawei.com (SkyGuard) with ESMTP id 4XbB1z5cJyz1T98Y;
	Sat, 26 Oct 2024 15:22:47 +0800 (CST)
Received: from kwepemd200014.china.huawei.com (unknown [7.221.188.8])
	by mail.maildlp.com (Postfix) with ESMTPS id 300A518006C;
	Sat, 26 Oct 2024 15:24:53 +0800 (CST)
Received: from localhost.localdomain (10.50.165.33) by
 kwepemd200014.china.huawei.com (7.221.188.8) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.34; Sat, 26 Oct 2024 15:24:52 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <jonathan.cameron@huawei.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <yangyicong@hisilicon.com>, <hejunhao3@huawei.com>, <linuxarm@huawei.com>,
	<wangyushan12@huawei.com>, <prime.zeng@hisilicon.com>
Subject: [PATCH v3 8/8] drivers/perf: hisi: Delete redundant blank line of DDRC PMU
Date: Sat, 26 Oct 2024 15:24:24 +0800
Message-ID: <20241026072424.29887-9-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20241026072424.29887-1-yangyicong@huawei.com>
References: <20241026072424.29887-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.165.33]
X-ClientProxiedBy: dggems705-chm.china.huawei.com (10.3.19.182) To
 kwepemd200014.china.huawei.com (7.221.188.8)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241026_002504_261518_1CC3BE8C 
X-CRM114-Status: UNSURE (   8.81  )
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
index b6b53ead6ac2..5286f2215fa6 100644
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


