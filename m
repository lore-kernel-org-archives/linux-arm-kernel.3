Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F177CC87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:50:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x/e5kCslJYDoFpQ6zaF3VOwpJkCoYx1KKrXOFc+oh2Q=; b=EtjBZ/GSMjCiYqwQuS/jPd5vl2
	DVlilRDbcKfWN0BdNBMpZZn9ccOuedHmzScGEA2Rs1Dxfchpqbb5U9J0pXLX3mLIK4HUrhbBm04oa
	sSIPEAFN9PnuXZoO77pFox38errQV0G847PeKHap9drIQ2/FgvTLqMLuvRdxOanA6E3L1OrLtRnPc
	BCz3RqPt5RKM9XxNCgXd7emFfznRcfsEgBRAyv2rtgSMYMmFLfe6i0KlLP6UJTE8BzRNwSVfU6x+V
	qXHOFqs1C5QGs5BP8/7GGd8nnQmtl4EzBb7LT2q9NwXXhAMZ6LVEKUx+CY2Ej2AsMjAtrHnWoCwke
	M1LP2QrA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulOEo-00000006uFu-18V3;
	Mon, 11 Aug 2025 08:50:38 +0000
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNhU-00000006p8E-15GY;
	Mon, 11 Aug 2025 08:16:13 +0000
X-UUID: 6f1beb5e768b11f09f706fa2197c6ceb-20250811
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=x/e5kCslJYDoFpQ6zaF3VOwpJkCoYx1KKrXOFc+oh2Q=;
	b=QNZtTEE2rzaqZDZGephNySLtzpjwf0mgv++vMoadLqHf8URiYECyPcRluyhC8GiHfC8hSbAZGJ+QmnNvwJ1VzN4OLzkDIAeQNPi0FDcQ8KfZoaVLYn458j/JtTsM0KAHCy0KzhfFOo7AJvL9Gc3hh6p/zBrlviHf4ZEGJFCA+lw=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.3,REQID:5d3e0cee-e380-4cad-b3fa-dc88aed7494e,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:f1326cf,CLOUDID:38a84da1-1800-4e4f-b665-a3d622db32cf,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:-5,Content:0|15|50,EDM:
	-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,
	AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 3,DMD|SSN|SDN
X-CID-BAS: 3,DMD|SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 6f1beb5e768b11f09f706fa2197c6ceb-20250811
Received: from mtkmbs10n1.mediatek.inc [(172.21.101.34)] by mailgw01.mediatek.com
	(envelope-from <ot_shunxi.zhang@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 1803812360; Mon, 11 Aug 2025 01:16:08 -0700
Received: from mtkmbs13n1.mediatek.inc (172.21.101.193) by
 mtkmbs11n2.mediatek.inc (172.21.101.187) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Mon, 11 Aug 2025 16:16:00 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs13n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Mon, 11 Aug 2025 16:15:59 +0800
From: <ot_shunxi.zhang@mediatek.com>
To: Eddie Huang <eddie.huang@mediatek.com>, Sean Wang
	<sean.wang@mediatek.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Matthias Brugger <matthias.bgg@gmail.com>, Lee Jones <lee@kernel.org>, Shunxi
 Zhang <ot_shunxi.zhang@mediatek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
	<linux-mediatek@lists.infradead.org>, <linux-rtc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, <sirius.wang@mediatek.com>,
	<vince-wl.liu@mediatek.com>, <jh.hsu@mediatek.com>
Subject: [PATCH v1 2/2] rtc: mt6397: Add BBPU alarm status reset and shutdown handling
Date: Mon, 11 Aug 2025 16:15:34 +0800
Message-ID: <20250811081543.4377-3-ot_shunxi.zhang@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
References: <20250811081543.4377-1-ot_shunxi.zhang@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_011612_312756_B869ED64 
X-CRM114-Status: GOOD (  18.93  )
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

From: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>

This patch introduces a new function, mtk_rtc_reset_bbpu_alarm_status,
to reset the BBPU alarm status in the MT6397 RTC driver. This function
writes the necessary bits to the RTC_BBPU register to clear the alarm
status and ensure proper operation.

Additionally, the mtk_rtc_shutdown function is added to handle RTC
shutdown events. It resets the BBPU alarm status and updates the
RTC_IRQ_EN register to disable the one-shot alarm interrupt,
ensuring a clean shutdown process.

Signed-off-by: Shunxi Zhang <ot_shunxi.zhang@mediatek.com>
---
 drivers/rtc/rtc-mt6397.c | 36 +++++++++++++++++++++++++++++++++++-
 1 file changed, 35 insertions(+), 1 deletion(-)

diff --git a/drivers/rtc/rtc-mt6397.c b/drivers/rtc/rtc-mt6397.c
index 692c00ff544b..063bd399de8c 100644
--- a/drivers/rtc/rtc-mt6397.c
+++ b/drivers/rtc/rtc-mt6397.c
@@ -37,6 +37,21 @@ static int mtk_rtc_write_trigger(struct mt6397_rtc *rtc)
 	return ret;
 }
 
+static void mtk_rtc_reset_bbpu_alarm_status(struct mt6397_rtc *rtc)
+{
+	u32 bbpu = RTC_BBPU_KEY | RTC_BBPU_PWREN | RTC_BBPU_RESET_AL;
+	int ret;
+
+	ret = regmap_write(rtc->regmap, rtc->addr_base + RTC_BBPU, bbpu);
+	if (ret < 0) {
+		dev_err(rtc->rtc_dev->dev.parent, "%s: write rtc bbpu error\n",
+			__func__);
+		return;
+	}
+
+	mtk_rtc_write_trigger(rtc);
+}
+
 static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 {
 	struct mt6397_rtc *rtc = data;
@@ -51,6 +66,8 @@ static irqreturn_t mtk_rtc_irq_handler_thread(int irq, void *data)
 		if (regmap_write(rtc->regmap, rtc->addr_base + RTC_IRQ_EN,
 				 irqen) == 0)
 			mtk_rtc_write_trigger(rtc);
+
+		mtk_rtc_reset_bbpu_alarm_status(rtc);
 		mutex_unlock(&rtc->lock);
 
 		return IRQ_HANDLED;
@@ -297,6 +314,22 @@ static int mtk_rtc_probe(struct platform_device *pdev)
 	return devm_rtc_register_device(rtc->rtc_dev);
 }
 
+static void mtk_rtc_shutdown(struct platform_device *pdev)
+{
+	struct mt6397_rtc *rtc = platform_get_drvdata(pdev);
+	int ret = 0;
+
+	mtk_rtc_reset_bbpu_alarm_status(rtc);
+
+	ret = regmap_update_bits(rtc->regmap,
+				 rtc->addr_base + RTC_IRQ_EN,
+				 RTC_IRQ_EN_ONESHOT_AL, 0);
+	if (ret < 0)
+		return;
+
+	mtk_rtc_write_trigger(rtc);
+}
+
 #ifdef CONFIG_PM_SLEEP
 static int mt6397_rtc_suspend(struct device *dev)
 {
@@ -345,7 +378,8 @@ static struct platform_driver mtk_rtc_driver = {
 		.of_match_table = mt6397_rtc_of_match,
 		.pm = &mt6397_pm_ops,
 	},
-	.probe	= mtk_rtc_probe,
+	.probe = mtk_rtc_probe,
+	.shutdown = mtk_rtc_shutdown,
 };
 
 module_platform_driver(mtk_rtc_driver);
-- 
2.46.0


