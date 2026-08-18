Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBD3CC5DF74
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Aug 2026 02:54:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Rf/sV1nZYPCwF8O/HLcV7GkcanrcIbb1uYgcD7xhwdc=; b=3mdBhmx9TwC8HU8aivIFklqzOz
	pqBkuOPEOv8RC+ryTwzeLpvjcYJwXdt8kjT92e/P4GFj5ZSJFr7qIk6g60MR3segs+2Tnd4F2wqMH
	uhDyG1y3uZnrsK/yXE5/Kl8S7AmfHGJC/rQB1Ow5GQ28loxfR/84aG+mds8BkmFssLKdDUTO05uwI
	QpIuZjGjCpp8PpFStrIrJ9hhxzEnGhslPuq8js3hm8CNnGL9nh8LBoi7Ntja6JltrX9FeOj7cajCT
	yU6Vxny+Dkq5m/DQOXxN8hOIgOHuUAedISxNbmdfAE3F0slrW6umqRMOSjVHuhAkCvu0PsbNyJqOq
	StA1sy0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9xe-0000000779l-07xy;
	Tue, 18 Aug 2026 02:53:58 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ww9xa-0000000778y-2KJV
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Aug 2026 02:53:56 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=Rf/sV1nZYPCwF8O/HLcV7GkcanrcIbb1uYgcD7xhwdc=;
	b=QRb6FroCWUzvGFgI2C9DcZHZYot0I88Bz13Msb0U5bRLu20BUVZF24zwaRzUUr+y4/oIfXLLh
	WIR0lIWP9QchCJeJWFv1esb3L+NDeVOaRyuB44G8ZpYMxR49Jq0719DTdCvHeHKTvMrjy8u8RqX
	MrVQo4Ul7OJDcqK0H2b7ZBo=
Received: from mail.maildlp.com (unknown [172.19.163.214])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4hPDX64sC3z1cyPY;
	Tue, 18 Aug 2026 10:43:02 +0800 (CST)
Received: from kwepemr200004.china.huawei.com (unknown [7.202.195.241])
	by mail.maildlp.com (Postfix) with ESMTPS id 781B84057C;
	Tue, 18 Aug 2026 10:53:42 +0800 (CST)
Received: from huawei.com (10.50.163.32) by kwepemr200004.china.huawei.com
 (7.202.195.241) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 18 Aug
 2026 10:53:41 +0800
From: Pengjie Zhang <zhangpengjie2@huawei.com>
To: <xuwei5@huawei.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>
CC: <linuxarm@huawei.com>, <zhanjie9@hisilicon.com>, <lihuisong@huawei.com>
Subject: [PATCH] MAINTAINERS: Add myself as maintainer of kunpeng_hccs
Date: Tue, 18 Aug 2026 10:53:41 +0800
Message-ID: <20260818025341.1408345-1-zhangpengjie2@huawei.com>
X-Mailer: git-send-email 2.33.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.50.163.32]
X-ClientProxiedBy: kwepems200001.china.huawei.com (7.221.188.67) To
 kwepemr200004.china.huawei.com (7.202.195.241)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260817_195355_065278_8DAC3969 
X-CRM114-Status: UNSURE (   9.94  )
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

Add myself as maintainer of HISILICON KUNPENG SOC HCCS DRIVER
as I will be responsible for this driver.

Signed-off-by: Pengjie Zhang <zhangpengjie2@huawei.com>
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index f37a81950e25..0e7519a9907c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -11707,7 +11707,7 @@ F:	Documentation/devicetree/bindings/i2c/hisilicon,ascend910-i2c.yaml
 F:	drivers/i2c/busses/i2c-hisi.c
 
 HISILICON KUNPENG SOC HCCS DRIVER
-M:	Huisong Li <lihuisong@huawei.com>
+M:	Pengjie Zhang <zhangpengjie2@huawei.com>
 S:	Maintained
 F:	Documentation/ABI/testing/sysfs-devices-platform-kunpeng_hccs
 F:	drivers/soc/hisilicon/kunpeng_hccs.c
-- 
2.33.0


