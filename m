Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25554C5DF94
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 13:29:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AXV7791+lKEuxikXvEafEqUKInZMtNVXGmlQ9vNTOV0=; b=japSXT8hTrZFfbsMMUSGfqfGgj
	007Eqxein1schJN1TML3/IQqHq9X4ECr1TiqCTYRDg01GvMFdw6XbcrGrosDnawWxPetb5o604G70
	3H1RvYkQPjvfHx06P4kS1tUTyEaTZW1NpiJw5VjOB2vth7VNIlX9tEgHQLW2UXhxg5uwP8DwLS4y9
	HOCiIIkwo2uz2KC+UARWE8VBkkiaetpA9nqHuo1rr+HXv3/s2aC40ARoyPvnRXEFBfsR71W6w3Xha
	P+jT+sMv7OmxpuTSe5Lxo1s02AqpmpiK7IFKGaeNimOiS35Q5UF+HjEcPGQ+rhPUAy1VwuA3gn0Jr
	1smedHSQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUjx-0000000GhVB-02P4;
	Mon, 24 Aug 2026 13:29:29 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyUju-0000000GhTf-2flU;
	Mon, 24 Aug 2026 13:29:27 +0000
X-UUID: cf62eb4e9fbf11f1acbe4559397dec65-20260824
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From; bh=AXV7791+lKEuxikXvEafEqUKInZMtNVXGmlQ9vNTOV0=;
	b=oMv/hnk94PcdcK0MXFlIX4CaUFAdM2dqrdvHA7guWMyRCwzpIPz0LYKgdwB2TJdFc+E2TKZsRebs3NGy4Hx7gtnKf4m/GI2oZCdFhsa4uKaI8TdqIr9YlfcsJfk1Hr2qP9yutmojIh6pFDgngVT1P+g9iK1KsN9i8gsIluUWwcs=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.19,REQID:105a291a-77b5-48ad-a8bb-180891c0dc38,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:7db8b62,CLOUDID:adb15bfe-f4cb-4ad2-b022-e3ac6648bf25,B
	ulkID:nil,BulkQuantity:0,SF:102|136|836|865|888|898,TC:-5,Content:0|15|50|
	99,EDM:-3|-100,IP:nil,URL:0,File:130,RT:0,Bulk:nil,QS:nil,BEC:-1,COL:0,OSI
	:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: cf62eb4e9fbf11f1acbe4559397dec65-20260824
Received: from mtkmbs09n1.mediatek.inc [(172.21.101.35)] by mailgw02.mediatek.com
	(envelope-from <wanming.gao@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1574913668; Mon, 24 Aug 2026 06:29:19 -0700
Received: from mtkmbs13n2.mediatek.inc (172.21.101.108) by
 mtkmbs10n1.mediatek.inc (172.21.101.34) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.2562.29; Mon, 24 Aug 2026 21:29:16 +0800
Received: from gcnsap21.gcn.mediatek.inc (10.17.81.22) by
 mtkmbs13n2.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.2562.29 via Frontend Transport; Mon, 24 Aug 2026 21:29:16 +0800
From: Wanming Gao <wanming.gao@mediatek.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
	<linux@roeck-us.net>, Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
CC: <linux-watchdog@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>,
	<wanming.gao@mediatek.com>, <wallace.yu@mediatek.com>,
	<Jarried.Lin@mediatek.com>, <vince-wl.liu@mediatek.com>
Subject: [PATCH] watchdog: mediatek: Enable pretimeout support
Date: Mon, 24 Aug 2026 21:29:12 +0800
Message-ID: <20260824132914.2662346-1-wanming.gao@mediatek.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260824_062926_702810_F8D33818 
X-CRM114-Status: GOOD (  19.23  )
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

The watchdog pretimeout interrupt needs to be deasserted after the
hardware pretimeout event is received. Add IRQ level control handling
to the MediaTek watchdog interrupt handler so the interrupt is cleared
before notifying the watchdog core.

Serialize all WDT_MODE read-modify-write operations using the existing
watchdog spinlock. Initialize the lock before registering the interrupt
handler and hold it across the complete 70us IRQ level toggle sequence.
This prevents concurrent watchdog start, stop, or pretimeout updates
from overwriting the temporary IRQ level state and disrupting the
deassert pulse.

This avoids leaving the watchdog pretimeout interrupt asserted, prevents
a potential interrupt storm, and allows the kernel to handle the
pretimeout event properly before the final watchdog reset.

Test: Boot ok, trigger watchdog pretimeout case and verify the
      pretimeout interrupt is received and handled before watchdog reset.

Signed-off-by: Wanming Gao <wanming.gao@mediatek.com>
---
 drivers/watchdog/mtk_wdt.c | 59 +++++++++++++++++++++++++++++++++++---
 1 file changed, 55 insertions(+), 4 deletions(-)

diff --git a/drivers/watchdog/mtk_wdt.c b/drivers/watchdog/mtk_wdt.c
index d9c30e4c80e3..17176bee9d38 100644
--- a/drivers/watchdog/mtk_wdt.c
+++ b/drivers/watchdog/mtk_wdt.c
@@ -35,6 +35,7 @@
 #define WDT_MAX_TIMEOUT		31
 #define WDT_MIN_TIMEOUT		2
 #define WDT_LENGTH_TIMEOUT(n)	((n) << 5)
+#define WDT_IRQ_LEVEL_SYNC_US	70
 
 #define WDT_LENGTH		0x04
 #define WDT_LENGTH_KEY		0x8
@@ -49,6 +50,7 @@
 #define WDT_MODE_EXRST_EN	(1 << 2)
 #define WDT_MODE_IRQ_EN		(1 << 3)
 #define WDT_MODE_AUTO_START	(1 << 4)
+#define WDT_MODE_IRQ_LEVEL_EN	(1 << 5)
 #define WDT_MODE_DUAL_EN	(1 << 6)
 #define WDT_MODE_CNT_SEL	(1 << 8)
 #define WDT_MODE_KEY		0x22000000
@@ -72,7 +74,7 @@ static unsigned int timeout;
 struct mtk_wdt_dev {
 	struct watchdog_device wdt_dev;
 	void __iomem *wdt_base;
-	spinlock_t lock; /* protects WDT_SWSYSRST reg */
+	spinlock_t lock; /* protects WDT_MODE and WDT_SWSYSRST reg */
 	struct reset_controller_dev rcdev;
 	bool disable_wdt_extrst;
 	bool reset_by_toprgu;
@@ -212,8 +214,6 @@ static int toprgu_register_reset_controller(struct platform_device *pdev,
 	int ret;
 	struct mtk_wdt_dev *mtk_wdt = platform_get_drvdata(pdev);
 
-	spin_lock_init(&mtk_wdt->lock);
-
 	mtk_wdt->rcdev.owner = THIS_MODULE;
 	mtk_wdt->rcdev.nr_resets = rst_num;
 	mtk_wdt->rcdev.ops = &toprgu_reset_ops;
@@ -230,14 +230,17 @@ static int mtk_wdt_restart(struct watchdog_device *wdt_dev,
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base;
+	unsigned long flags;
 	u32 reg;
 
 	wdt_base = mtk_wdt->wdt_base;
 
 	/* Enable reset in order to issue a system reset instead of an IRQ */
+	spin_lock_irqsave(&mtk_wdt->lock, flags);
 	reg = readl(wdt_base + WDT_MODE);
 	reg &= ~WDT_MODE_IRQ_EN;
 	writel(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+	spin_unlock_irqrestore(&mtk_wdt->lock, flags);
 
 	while (1) {
 		writel(WDT_SWRST_KEY, wdt_base + WDT_SWRST);
@@ -302,12 +305,15 @@ static int mtk_wdt_stop(struct watchdog_device *wdt_dev)
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	unsigned long flags;
 	u32 reg;
 
+	spin_lock_irqsave(&mtk_wdt->lock, flags);
 	reg = readl(wdt_base + WDT_MODE);
 	reg &= ~WDT_MODE_EN;
 	reg |= WDT_MODE_KEY;
 	iowrite32(reg, wdt_base + WDT_MODE);
+	spin_unlock_irqrestore(&mtk_wdt->lock, flags);
 
 	return 0;
 }
@@ -317,12 +323,14 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 	u32 reg;
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdt_dev);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	unsigned long flags;
 	int ret;
 
 	ret = mtk_wdt_set_timeout(wdt_dev, wdt_dev->timeout);
 	if (ret < 0)
 		return ret;
 
+	spin_lock_irqsave(&mtk_wdt->lock, flags);
 	reg = ioread32(wdt_base + WDT_MODE);
 	if (wdt_dev->pretimeout)
 		reg |= (WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
@@ -334,6 +342,7 @@ static int mtk_wdt_start(struct watchdog_device *wdt_dev)
 		reg |= WDT_MODE_CNT_SEL;
 	reg |= (WDT_MODE_EN | WDT_MODE_KEY);
 	iowrite32(reg, wdt_base + WDT_MODE);
+	spin_unlock_irqrestore(&mtk_wdt->lock, flags);
 
 	return 0;
 }
@@ -343,7 +352,11 @@ static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
 {
 	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
 	void __iomem *wdt_base = mtk_wdt->wdt_base;
-	u32 reg = ioread32(wdt_base + WDT_MODE);
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&mtk_wdt->lock, flags);
+	reg = ioread32(wdt_base + WDT_MODE);
 
 	if (timeout && !wdd->pretimeout) {
 		wdd->pretimeout = wdd->timeout / 2;
@@ -352,19 +365,55 @@ static int mtk_wdt_set_pretimeout(struct watchdog_device *wdd,
 		wdd->pretimeout = 0;
 		reg &= ~(WDT_MODE_IRQ_EN | WDT_MODE_DUAL_EN);
 	} else {
+		spin_unlock_irqrestore(&mtk_wdt->lock, flags);
 		return 0;
 	}
 
 	reg |= WDT_MODE_KEY;
 	iowrite32(reg, wdt_base + WDT_MODE);
+	spin_unlock_irqrestore(&mtk_wdt->lock, flags);
 
 	return mtk_wdt_set_timeout(wdd, wdd->timeout);
 }
 
+static void mtk_wdt_deassert_irq(struct watchdog_device *wdd)
+{
+	struct mtk_wdt_dev *mtk_wdt = watchdog_get_drvdata(wdd);
+	void __iomem *wdt_base = mtk_wdt->wdt_base;
+	unsigned long flags;
+	u32 reg;
+
+	spin_lock_irqsave(&mtk_wdt->lock, flags);
+	reg = ioread32(wdt_base + WDT_MODE);
+
+	if (reg & WDT_MODE_IRQ_LEVEL_EN) {
+		reg &= ~WDT_MODE_IRQ_LEVEL_EN;
+		iowrite32(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+		/*
+		 * Wait for two 32KHz watchdog clock cycles so the
+		 * hardware can latch the IRQ level change across the clock
+		 * domain.
+		 */
+		udelay(WDT_IRQ_LEVEL_SYNC_US);
+		reg = ioread32(wdt_base + WDT_MODE);
+		reg |= WDT_MODE_IRQ_LEVEL_EN;
+	} else {
+		reg |= WDT_MODE_IRQ_LEVEL_EN;
+		iowrite32(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+		udelay(WDT_IRQ_LEVEL_SYNC_US);
+		reg = ioread32(wdt_base + WDT_MODE);
+		reg &= ~WDT_MODE_IRQ_LEVEL_EN;
+	}
+	iowrite32(reg | WDT_MODE_KEY, wdt_base + WDT_MODE);
+	ioread32(wdt_base + WDT_MODE);
+	spin_unlock_irqrestore(&mtk_wdt->lock, flags);
+}
+
 static irqreturn_t mtk_wdt_isr(int irq, void *arg)
 {
 	struct watchdog_device *wdd = arg;
 
+	mtk_wdt_deassert_irq(wdd);
 	watchdog_notify_pretimeout(wdd);
 
 	return IRQ_HANDLED;
@@ -406,6 +455,8 @@ static int mtk_wdt_probe(struct platform_device *pdev)
 	if (!mtk_wdt)
 		return -ENOMEM;
 
+	spin_lock_init(&mtk_wdt->lock);
+
 	platform_set_drvdata(pdev, mtk_wdt);
 
 	mtk_wdt->wdt_base = devm_platform_ioremap_resource(pdev, 0);
-- 
2.45.2


