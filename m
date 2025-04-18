Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E3CCC369AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Apr 2025 07:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Swlp2st3waLe+SuAGbptIu6cJ8BzFZDvGVG5NyxeDsM=; b=lziTjBdfEPuZR5J8UBiodcJyXz
	h2uM1NRSD4+QbpJjNV4OmW0AUInthLqNx1FV5x8UN5gBPzCCKG/LsCwLjm36Al2H3ez//q0q/YZw8
	UFog/qQxpJZEy01LQNWYvsiGKD2duBJ6I7YkHooPzBxiVJuOmMlsyzr8XecG/32fPKQ6HnTFZ6rmn
	Hic6QS8SIjtdctmo5voTdogJfwGyHysvihv1Y7nRFL6y1tD+lypQwWOHxQyQAdBkgaIL4R4XdsqpF
	gOAYuwjfwn6ZAHH6suz7k5+VRRLeMc5EAHk3xZ1nTOxWe4gbZUmZFcQvXVGQ/2FOMCai08kl/xsKO
	bbExBNSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5gLn-0000000FVEz-3RaY;
	Fri, 18 Apr 2025 07:41:27 +0000
Received: from szxga07-in.huawei.com ([45.249.212.35])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5fvx-0000000FRXC-1hLt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Apr 2025 07:14:48 +0000
Received: from mail.maildlp.com (unknown [172.19.163.17])
	by szxga07-in.huawei.com (SkyGuard) with ESMTP id 4Zf5c162nyzsSgH;
	Fri, 18 Apr 2025 15:14:25 +0800 (CST)
Received: from dggemv712-chm.china.huawei.com (unknown [10.1.198.32])
	by mail.maildlp.com (Postfix) with ESMTPS id 8204C1A0190;
	Fri, 18 Apr 2025 15:14:36 +0800 (CST)
Received: from kwepemn500004.china.huawei.com (7.202.194.145) by
 dggemv712-chm.china.huawei.com (10.1.198.32) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 15:14:36 +0800
Received: from localhost.localdomain (10.90.30.45) by
 kwepemn500004.china.huawei.com (7.202.194.145) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Fri, 18 Apr 2025 15:14:35 +0800
From: Junhao He <hejunhao3@huawei.com>
To: <peterz@infradead.org>, <mingo@redhat.com>, <acme@kernel.org>,
	<namhyung@kernel.org>, <mark.rutland@arm.com>,
	<alexander.shishkin@linux.intel.com>, <jolsa@kernel.org>,
	<irogers@google.com>, <james.clark@linaro.org>, <leo.yan@arm.com>,
	<john.g.garry@oracle.com>, <will@kernel.org>, <mike.leach@linaro.org>,
	<yangyicong@hisilicon.com>, <jonathan.cameron@huawei.com>
CC: <linux-perf-users@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linuxarm@huawei.com>, <hejunhao3@huawei.com>,
	<linux-arm-kernel@lists.infradead.org>
Subject: [PATCH v2 3/3] MAINTAINERS: Add hisilicon pmu json events under its entry
Date: Fri, 18 Apr 2025 15:08:12 +0800
Message-ID: <20250418070812.3771441-4-hejunhao3@huawei.com>
X-Mailer: git-send-email 2.30.0
In-Reply-To: <20250418070812.3771441-1-hejunhao3@huawei.com>
References: <20250418070812.3771441-1-hejunhao3@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.30.45]
X-ClientProxiedBy: dggems706-chm.china.huawei.com (10.3.19.183) To
 kwepemn500004.china.huawei.com (7.202.194.145)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_001445_685761_4325EB53 
X-CRM114-Status: UNSURE (   7.44  )
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

The all hisilicon pmu json events were missing to be listed there.

Signed-off-by: Junhao He <hejunhao3@huawei.com>
Reviewed-by: James Clark <james.clark@linaro.org>
---
 MAINTAINERS | 1 +
 1 file changed, 1 insertion(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 00ff21b955bc..bf9588a94919 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -10474,6 +10474,7 @@ W:	http://www.hisilicon.com
 F:	Documentation/admin-guide/perf/hisi-pcie-pmu.rst
 F:	Documentation/admin-guide/perf/hisi-pmu.rst
 F:	drivers/perf/hisilicon
+F:	tools/perf/pmu-events/arch/arm64/hisilicon/
 
 HISILICON PTT DRIVER
 M:	Yicong Yang <yangyicong@hisilicon.com>
-- 
2.33.0


