Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F027D185F8
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 13:33:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=8MM4w9BNHq3D+Hk+IMvzG8aRuPYIfWZsJB70MRmrOgg=; b=J6uBrd7pLr0hWQ9KhFwnlI8Ilc
	sLQHtafkYGc5+PEoZvLCRw8m4FhcUj5yWhBYj5EgMohz3Su/AsASbCv19RLAuSvj1pCAyFqutjfe5
	GWXnNorETMsIlQ05muQGzHKiAqiDASslQf2R0WFEHcPhPE4UY6iJ3m8Q0l8l3IO6gH+SvpaCSElay
	Z1742gbeHB00j+IBcSIyaS4U7Ucv4jnyx9bL7sYXGMvEaMtrYhvD/GO7M/UBmD3cvFfcBwd+cEXEM
	A5PVLFX2/WAhfjnebL2SD3UC1dz3Jv63EtdedWMh+YBViTC1PKbou34tLSxsqRgYMzF9l+dptvEFc
	hRk6MBXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq97-0000000HAzQ-12PI;
	Thu, 08 Jan 2026 13:33:49 +0000
Received: from canpmsgout04.his.huawei.com ([113.46.200.219])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdq94-0000000HAcP-3myx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 13:33:48 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8MM4w9BNHq3D+Hk+IMvzG8aRuPYIfWZsJB70MRmrOgg=;
	b=C8m1L5B7jjwY7qCTzYrSgnzX3y/pA+iRJPJP6qAJvioMT/Cvrw/07pCHAQIxRUbTF9A7YOM6v
	d/sbbtGtxnZARHob/8UpIz+W9eXfx6/KVq9e/2wadjY3OMqpnjqLzjC8SlsR9K6+HH2Iu6WLVF/
	z337MFTp/A4ubw4POElUosY=
Received: from mail.maildlp.com (unknown [172.19.162.197])
	by canpmsgout04.his.huawei.com (SkyGuard) with ESMTPS id 4dn5Lz4KgYz1prRF;
	Thu,  8 Jan 2026 21:28:11 +0800 (CST)
Received: from dggemv706-chm.china.huawei.com (unknown [10.3.19.33])
	by mail.maildlp.com (Postfix) with ESMTPS id ACD4E40569;
	Thu,  8 Jan 2026 21:31:29 +0800 (CST)
Received: from kwepemn100008.china.huawei.com (7.202.194.111) by
 dggemv706-chm.china.huawei.com (10.3.19.33) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Thu, 8 Jan 2026 21:31:29 +0800
Received: from localhost.huawei.com (10.90.31.46) by
 kwepemn100008.china.huawei.com (7.202.194.111) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.36; Thu, 8 Jan 2026 21:31:28 +0800
From: Yushan Wang <wangyushan12@huawei.com>
To: <arnd@arndb.de>, <catalin.marinas@arm.com>, <conor@kernel.org>,
	<Jonathan.Cameron@huawei.com>, <will@kernel.org>,
	<linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <liuyonglong@huawei.com>,
	<prime.zeng@hisilicon.com>, <fanghao11@huawei.com>,
	<wangzhou1@hisilicon.com>, <wangyushan12@huawei.com>
Subject: [PATCH] MAINTAINERS: Add myself as maintainer of hisi_soc_hha
Date: Thu, 8 Jan 2026 21:31:28 +0800
Message-ID: <20260108133128.777813-1-wangyushan12@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.90.31.46]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 kwepemn100008.china.huawei.com (7.202.194.111)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_053347_414343_4A126C57 
X-CRM114-Status: UNSURE (   8.28  )
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

Add myself as maintainer of HiSilicon SoC HHA driver as I will be
responsible for this driver.

Signed-off-by: Yushan Wang <wangyushan12@huawei.com>

---
 MAINTAINERS | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a0dd762f5648..b8427c072c9e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11366,6 +11366,11 @@ F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 F:	drivers/soc/hisilicon/kunpeng_hccs.c
 F:	drivers/soc/hisilicon/kunpeng_hccs.h
 
+HISILICON SOC HHA DRIVER
+M:	Yushan Wang <wangyushan12@huawei.com>
+S:	Maintained
+F:	drivers/cache/hisi_soc_hha.c
+
 HISILICON LPC BUS DRIVER
 M:	Jay Fang <f.fangjian@huawei.com>
 S:	Maintained
-- 
2.33.0


