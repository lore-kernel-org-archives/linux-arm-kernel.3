Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8DEAC5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 May 2025 02:24:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Mime-Version:Message-ID:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=CUzzvNx6zBqr1yGBIcd8RAT/Tg/ICwm9Vu4xR1RE8nk=; b=p8uN3BnmUeX3dZTvAEoQ86d094
	0x5dIGd4Cqp0wuZUVYr83t2C1O4LRonZdpdE6maUsqiHB755E60DwqGtiuQqAOKZUUt8gvzG7+hhL
	i8NoqNg2rXnWeeFIRHJ3ecTIvlE698BkpGUwS5rNZBfm0iW8T2jvKeUWLz0FTwXhasLHLzAbNkDmW
	BcI4om9521E2i+AUOa7Tc//EyUmo2SLplnb9uILtcXSWX8zDXgBkQSF6Y+VRsKDfY24Gdipm15Dx/
	rzKVn0tbgkL3QzrCfXSP7Ht/X1OVqk0k/2ZjtelYflYsGC5eXo/A4jXEt8yyIAN78ZaRjS0YWXIj1
	Hpf7P3VQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSwf-0000000Ek6A-1hvR;
	Thu, 29 May 2025 02:24:37 +0000
Received: from mxct.zte.com.cn ([183.62.165.209])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKSuX-0000000EjyE-0Bxb
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 May 2025 02:22:26 +0000
Received: from mse-fl2.zte.com.cn (unknown [10.5.228.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mxct.zte.com.cn (FangMail) with ESMTPS id 4b79B274JDz51SYg;
	Thu, 29 May 2025 10:22:18 +0800 (CST)
Received: from xaxapp02.zte.com.cn ([10.88.97.241])
	by mse-fl2.zte.com.cn with SMTP id 54T2LxxY019807;
	Thu, 29 May 2025 10:21:59 +0800 (+08)
	(envelope-from shao.mingyin@zte.com.cn)
Received: from mapi (xaxapp05[null])
	by mapi (Zmail) with MAPI id mid32;
	Thu, 29 May 2025 10:22:00 +0800 (CST)
Date: Thu, 29 May 2025 10:22:00 +0800 (CST)
X-Zmail-TransId: 2afc6837c4c8ffffffffdf9-534be
X-Mailer: Zmail v1.0
Message-ID: <202505291022003179-UwGRHwJQ-a0Mox6S2Gg@zte.com.cn>
Mime-Version: 1.0
From: <shao.mingyin@zte.com.cn>
To: <hayashi.kunihiko@socionext.com>
Cc: <mhiramat@kernel.org>, <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <yang.yang29@zte.com.cn>,
        <xu.xin16@zte.com.cn>, <yang.tao172@zte.com.cn>,
        <ye.xingchen@zte.com.cn>
Subject: =?UTF-8?B?YnVzOiB1bmlwaGllci1zeXN0ZW0tYnVzOiBVc2Ugc3RyX29uX29mZigpIGhlbHBlciBpbiB1bmlwaGllcl9zeXN0ZW1fYnVzX2NoZWNrX2Jvb3Rfc3dhcCgp?=
Content-Type: text/plain;
	charset="UTF-8"
X-MAIL: mse-fl2.zte.com.cn 54T2LxxY019807
X-Fangmail-Anti-Spam-Filtered: true
X-Fangmail-MID-QID: 6837C4DA.006/4b79B274JDz51SYg
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250528_192225_235431_7660C8EA 
X-CRM114-Status: GOOD (  10.43  )
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

From: Shao Mingyin <shao.mingyin@zte.com.cn>

Remove hard-coded strings by using the str_on_off() helper function.

Signed-off-by: Shao Mingyin <shao.mingyin@zte.com.cn>
---
 drivers/bus/uniphier-system-bus.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/bus/uniphier-system-bus.c b/drivers/bus/uniphier-system-bus.c
index cb5c89ce7b86..ee8e432a5277 100644
--- a/drivers/bus/uniphier-system-bus.c
+++ b/drivers/bus/uniphier-system-bus.c
@@ -10,6 +10,7 @@
 #include <linux/of_address.h>
 #include <linux/of_platform.h>
 #include <linux/platform_device.h>
+#include <linux/string_choices.h>

 /* System Bus Controller registers */
 #define UNIPHIER_SBC_BASE	0x100	/* base address of bank0 space */
@@ -120,7 +121,7 @@ static void uniphier_system_bus_check_boot_swap(

 	is_swapped = !(readl(base_reg) & UNIPHIER_SBC_BASE_BE);

-	dev_dbg(priv->dev, "Boot Swap: %s\n", is_swapped ? "on" : "off");
+	dev_dbg(priv->dev, "Boot Swap: %s\n", str_on_off(is_swapped));

 	/*
 	 * If BOOT_SWAP was asserted on power-on-reset, the CS0 and CS1 are
-- 
2.25.1

