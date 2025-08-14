Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178EFCA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 13:14:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSgp2H68J6FBU2BP2pfjKp1HjSbq/9381uR+ikBt0eM=; b=fI3WKBV51r9iwpo/YqAlWFo3jE
	fsbWNpj50cq36eihSYAC3Z/RPb+riHwjd/8pZWGvDVDZdc79fXHhfejUdhvCU55yYfktSUh2UHHoK
	V6hd9VIbb+8xbB49xWErbe5Sut66rTmjGatUYWDA+G5wQq6+gmLk2/vdBN1oGsHR/tWQVIbNoASid
	WiNYwoOMyNavmLfza+vxxKnFPVWkIjW2w7ZuOtEXJzrg/+eSuBkAARqYUbxQ+W/jUPbWJ5E+KG/PY
	eRUYaXAqrPwV3DyZTKD63Yjj9x2/4qzaI24dmFUJiWYXEbvCUBIeAQcohToGVVvML703tQZt1IKWn
	J9isCQTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umXmu-0000000GxQX-13SR;
	Thu, 14 Aug 2025 13:14:36 +0000
Received: from szxga01-in.huawei.com ([45.249.212.187])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umU4b-0000000GNMQ-3VrZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 09:16:39 +0000
Received: from mail.maildlp.com (unknown [172.19.163.174])
	by szxga01-in.huawei.com (SkyGuard) with ESMTP id 4c2fcY4p51zvX0p;
	Thu, 14 Aug 2025 17:11:25 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id 848A4140275;
	Thu, 14 Aug 2025 17:16:25 +0800 (CST)
Received: from kwepemq200018.china.huawei.com (7.202.195.108) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:16:25 +0800
Received: from DESKTOP-VM4LOUJ.huawei.com (10.67.121.177) by
 kwepemq200018.china.huawei.com (7.202.195.108) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 14 Aug 2025 17:16:24 +0800
From: Yicong Yang <yangyicong@huawei.com>
To: <will@kernel.org>, <mark.rutland@arm.com>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>
CC: <jonathan.cameron@huawei.com>, <prime.zeng@hisilicon.com>,
	<linuxarm@huawei.com>, <yangyicong@hisilicon.com>, <wangyushan12@huawei.com>,
	<hejunhao3@h-partners.com>
Subject: [PATCH v6 3/3] MAINTAINERS: Remove myself from HiSilicon PMU maintainers
Date: Thu, 14 Aug 2025 17:16:22 +0800
Message-ID: <20250814091622.23269-4-yangyicong@huawei.com>
X-Mailer: git-send-email 2.31.0
In-Reply-To: <20250814091622.23269-1-yangyicong@huawei.com>
References: <20250814091622.23269-1-yangyicong@huawei.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.67.121.177]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemq200018.china.huawei.com (7.202.195.108)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_021638_024483_D65F0E82 
X-CRM114-Status: UNSURE (   8.90  )
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

From: Yicong Yang <yangyicong@hisilicon.com>

Remove myself as I'm leaving HiSilicon and not suitable for maintaining
this. Thanks for the journey.

Signed-off-by: Yicong Yang <yangyicong@hisilicon.com>
---
 MAINTAINERS | 1 -
 1 file changed, 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index fe168477caa4..22999fccfbd7 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11059,7 +11059,6 @@ F:	Documentation/devicetree/bindings/net/hisilicon*.txt
 F:	drivers/net/ethernet/hisilicon/
 
 HISILICON PMU DRIVER
-M:	Yicong Yang <yangyicong@hisilicon.com>
 M:	Jonathan Cameron <jonathan.cameron@huawei.com>
 S:	Supported
 W:	http://www.hisilicon.com
-- 
2.24.0


