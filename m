Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD628C88E72
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 14:27:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NQIErD8RMj3c96Y2peru6EPUda/1WEEQ4CrKh42s+Ao=; b=S3SOhILPKSn0Xr6LyIn2TiNAmh
	zpIcIQ6KBOCzIgX3rjiiyWHQEulXfphaA+NwSKXtwTFcmqVrzr93wXrO7GBcmDku5dN6se8TZpYUf
	sfN941MAaUK11FoBxZYA0beM7VLu7Ecr0S2pnRu3SB5Cwat6VlS0coYPzGOqP2jOPU+PrUWy83F1c
	diTey0Ox/f9ohMIRRRbeHrKDB7AXS7QMswT0Nbv6mck/s3MDnhRpVIPGCRiXHgDAsgWaQJoDWv3Ct
	BFc84cyWnqBwph/5DaO9oqw0I8I8Ho4VRrUm9geChGQZIIZQ988uehfZLtEOGHQEhj33l/RmpZEoO
	nL44LbYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D52-0000000BX2z-1fDD;
	Thu, 17 Sep 2026 14:27:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7D4z-0000000BX2M-0wUB
	for linux-arm-kernel@lists.infradead.org;
	Thu, 17 Sep 2026 14:27:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id F2BED4E4079D;
	Thu, 17 Sep 2026 14:27:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C6CD05FAA3;
	Thu, 17 Sep 2026 14:27:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id C377511C78B65;
	Thu, 17 Sep 2026 16:27:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1789655223; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=NQIErD8RMj3c96Y2peru6EPUda/1WEEQ4CrKh42s+Ao=;
	b=P2iZJTYGnfnqJojdbtYjMw0NsX3IKbGQZwtyfwF7klzE9sejGGQuU+sMJj5CodLdxxuPyF
	TWX+uX7+XeAXIgySTKN7/T/ss7RSXNklzznuW4uhjVi6FJmUROnCAXDI9tvz9VflRr/Bhy
	AFqzDL2d9byn1moj/z+ps/8sIilM8hb2e230YS2v4uMWw5sCAk99HAy8O10ihSESZ/3fab
	YmdGqWlVwepuGJKIh88GWNWXrkHxuVMCRWbz0UdHLxs1toRqy7VGXAPLv44tC704OaWon0
	MmeNEYXNNfNNcooGuk3DXQduEQLZx2feOe61ug3DrkxRpwL8sNGC2BFS5c2eXg==
From: alexandre.belloni@bootlin.com
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: linux-rtc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] rtc: omap: remove unused argument
Date: Thu, 17 Sep 2026 16:26:53 +0200
Message-ID: <20260917142654.2576889-1-alexandre.belloni@bootlin.com>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260917_072713_428180_5F793E64 
X-CRM114-Status: GOOD (  12.24  )
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

From: Alexandre Belloni <alexandre.belloni@bootlin.com>

omap_rtc_power_off_program takes one argument that is never used. One call
passes the struct device of the rtc but the other one passes its parent.
To avoid confusion, stop taking any argument

Signed-off-by: Alexandre Belloni <alexandre.belloni@bootlin.com>
---
 drivers/rtc/rtc-omap.c       | 5 ++---
 drivers/soc/ti/pm33xx.c      | 2 +-
 include/linux/rtc/rtc-omap.h | 2 +-
 3 files changed, 4 insertions(+), 5 deletions(-)

diff --git a/drivers/rtc/rtc-omap.c b/drivers/rtc/rtc-omap.c
index 0f90065e352c..18492165a19f 100644
--- a/drivers/rtc/rtc-omap.c
+++ b/drivers/rtc/rtc-omap.c
@@ -408,7 +408,7 @@ static struct omap_rtc *omap_rtc_power_off_rtc;
  * generates pmic_pwr_enable control, which can be used to control an external
  * PMIC.
  */
-int omap_rtc_power_off_program(struct device *dev)
+int omap_rtc_power_off_program(void)
 {
 	struct omap_rtc *rtc = omap_rtc_power_off_rtc;
 	struct rtc_time tm;
@@ -481,10 +481,9 @@ EXPORT_SYMBOL(omap_rtc_power_off_program);
  */
 static void omap_rtc_power_off(void)
 {
-	struct rtc_device *rtc = omap_rtc_power_off_rtc->rtc;
 	u32 val;
 
-	omap_rtc_power_off_program(rtc->dev.parent);
+	omap_rtc_power_off_program();
 
 	/* Set PMIC power enable and EXT_WAKEUP in case PB power on is used */
 	omap_rtc_power_off_rtc->type->unlock(omap_rtc_power_off_rtc);
diff --git a/drivers/soc/ti/pm33xx.c b/drivers/soc/ti/pm33xx.c
index dc52a2197d24..82979122417d 100644
--- a/drivers/soc/ti/pm33xx.c
+++ b/drivers/soc/ti/pm33xx.c
@@ -174,7 +174,7 @@ static struct wkup_m3_wakeup_src rtc_wake_src(void)
 
 static int am33xx_rtc_only_idle(unsigned long wfi_flags)
 {
-	omap_rtc_power_off_program(&omap_rtc->dev);
+	omap_rtc_power_off_program();
 	am33xx_do_wfi_sram(wfi_flags);
 	return 0;
 }
diff --git a/include/linux/rtc/rtc-omap.h b/include/linux/rtc/rtc-omap.h
index 9f03a329e63f..d6ec7c4daea6 100644
--- a/include/linux/rtc/rtc-omap.h
+++ b/include/linux/rtc/rtc-omap.h
@@ -3,5 +3,5 @@
 #ifndef _LINUX_RTCOMAP_H_
 #define _LINUX_RTCOMAP_H_
 
-int omap_rtc_power_off_program(struct device *dev);
+int omap_rtc_power_off_program(void);
 #endif /* _LINUX_RTCOMAP_H_ */
-- 
2.55.0


