Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F2FADF8A14D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Apr 2026 09:51:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IS0BYVYyFUFyGsV7yxrTrAtJ0lKbLZKVcc9lvWENtdY=; b=aA0/XFrVO98Q3iWFYtyhyenZ4g
	rNRi54Sf1T2f/Go04cS/9n/rYr+JF4BOxj7QqPl25H952BQjJZ0u69yOvNBwKxyW2wsPRbN/ZvtNy
	FmVnhlF6aWYuSV3qOh5SaUCvpQPr+Ujnlk/kd/sN//Tfk5bgvbhT783W4bFnCgYPFNTE1fqcEK/Dj
	Y01Jzg4fIyVMeN+TonSiobS5/ISggfmbS05pMGd2tZimtGYFKSI9Un3JFveNg46kJybi9/lM/Dpeq
	I8XefPpOgeDdx1XK1T83Hsmzkt6n4LLhqqNRt1PmwAPYKQ3cQ0R7rX4O+IGozTY9nSJeTdRvDHrJ6
	ftdaqiBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJNc-00000002H2R-16Ch;
	Thu, 16 Apr 2026 09:51:24 +0000
Received: from frasgout.his.huawei.com ([185.176.79.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDJNY-00000002H1O-0qFv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Apr 2026 09:51:22 +0000
Received: from mail.maildlp.com (unknown [172.18.224.107])
	by frasgout.his.huawei.com (SkyGuard) with ESMTPS id 4fxCv22jMRzHnH6K;
	Thu, 16 Apr 2026 17:50:54 +0800 (CST)
Received: from dubpeml500005.china.huawei.com (unknown [7.214.145.207])
	by mail.maildlp.com (Postfix) with ESMTPS id 2A09D4058D;
	Thu, 16 Apr 2026 17:51:12 +0800 (CST)
Received: from SecurePC-101-06.huawei.com (10.123.51.176) by
 dubpeml500005.china.huawei.com (7.214.145.207) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 16 Apr 2026 10:51:11 +0100
From: Jonathan Cameron <Jonathan.Cameron@huawei.com>
To: Yushan Wang <wangyushan12@huawei.com>, Jie Zhan <zhanjie9@hisilicon.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-perf-users@vger.kernel.org>
CC: <linuxarm@huawei.com>, <jic23@kernel.org>
Subject: [PATCH] MAINTAINERS: Update HiSilicon PMU driver maintainer to Yushan Wang
Date: Thu, 16 Apr 2026 10:51:10 +0100
Message-ID: <20260416095110.25612-1-Jonathan.Cameron@huawei.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.123.51.176]
X-ClientProxiedBy: lhrpeml100012.china.huawei.com (7.191.174.184) To
 dubpeml500005.china.huawei.com (7.214.145.207)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260416_025120_387276_D090CF97 
X-CRM114-Status: UNSURE (   9.77  )
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

Replace myself with Yushan Wang who is very familiar with the HiSilicon PMU
drivers.

Signed-off-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index d1cc0e12fe1f..8b95a43527fa 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11563,7 +11563,7 @@ F:	Documentation/devicetree/bindings/net/hisilicon*.txt
 F:	drivers/net/ethernet/hisilicon/
 
 HISILICON PMU DRIVER
-M:	Jonathan Cameron <jonathan.cameron@huawei.com>
+M:	Yushan Wang <wangyushan12@huawei.com>
 S:	Supported
 W:	http://www.hisilicon.com
 F:	Documentation/admin-guide/perf/hisi-pcie-pmu.rst
-- 
2.51.0


