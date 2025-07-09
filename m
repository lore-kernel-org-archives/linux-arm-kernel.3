Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87BF6C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 02:05:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:CC:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kyiDDBqJ0a4ZYp5mVtSCFXYgn/hQu3322reAZwp/92E=; b=nE18uGtWv/LvkkpQcVBppLwzMf
	xuyxyI1b7TFfXT+H4uH3bajIRJBt1A6LrJjChIJ9308TVZbHmx8uDixSimnXiR9Q4Dip93n63Wl+d
	8CNs7mjnq2AUil5+QrWLDFQHGSpA3iF51IH8VX8hof45OOIB+eAau8b1N9WoHYBs4vqYildq5Ny4X
	cd/y/TYLuQb8EWHmfX1V4+PIBUm8TYK2MIKDpTK0NJ/D2Eec9y2LicuCv7Dym9En/cSi43Q+Axz5c
	hwem8ybT69/CIOlQBT8KHOQ33+/zAQ7ePzJrKWQ1mbxXbHZPaKSJgFWVzse6G15wtxBNbHU82YA18
	nYsRwz4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZKBU-000000079FI-05tD;
	Wed, 09 Jul 2025 02:05:20 +0000
Received: from mg.richtek.com ([220.130.44.152])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZK7C-000000078vz-2V0f;
	Wed, 09 Jul 2025 02:00:56 +0000
X-MailGates: (SIP:2,PASS,NONE)(compute_score:DELIVER,40,3)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=richtek.com;
	s=richtek; t=1752026442;
	bh=kyiDDBqJ0a4ZYp5mVtSCFXYgn/hQu3322reAZwp/92E=; l=1430;
	h=From:To:Subject:Date:Message-ID:MIME-Version;
	b=4BEa5BMhFVW9gnExMJANXLJRe4cKg6/c665eZJa3L+jSJJXcdu2Ki2WzkXW5d3Nol
	 /csu1Ec8O3DitT7Uh7ljENcJPk+DY+B/gPrwkGU8s7BtVW+Jg8DEFD2wrb0rpuR+Nj
	 loGxnVl4VIcZ+KoubuzYTCtWFEjmI4FY9Wf5dlQuxtRDEb3GzKJWFrv1do+X7RCyXp
	 IQKmsV1rAgTkpxeTbPINnxMq2m6iya/9DtIwuNneOXojhsTZpIgH7lx2Ohbxx3+W8m
	 fH3dpggNpm6bluJp/DGvW/g/m251if6XdD4x9vad8TldchXvm6O81ROJPeUW3CQH2q
	 GV146WKztQfzA==
Received: from 192.168.10.47
	by mg.richtek.com with MailGates ESMTPS Server V6.0(244594:0:AUTH_RELAY)
	(envelope-from <cy_huang@richtek.com>)
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256/256); Wed, 09 Jul 2025 10:00:21 +0800 (CST)
Received: from ex3.rt.l (192.168.10.46) by ex4.rt.l (192.168.10.47) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Wed, 9 Jul
 2025 10:00:20 +0800
Received: from git-send.richtek.com (192.168.10.154) by ex3.rt.l
 (192.168.10.45) with Microsoft SMTP Server id 15.2.1544.11 via Frontend
 Transport; Wed, 9 Jul 2025 10:00:20 +0800
From: <cy_huang@richtek.com>
To: Lee Jones <lee@kernel.org>
CC: Matthias Brugger <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, ChiaEn Wu <chiaen_wu@richtek.com>,
	Andy Shevchenko <andy.shevchenko@gmail.com>, ChiYuan Huang
	<cy_huang@richtek.com>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
Subject: [PATCH] mfd: mt6370: Fix the interrupt naming typo
Date: Wed, 9 Jul 2025 10:00:48 +0800
Message-ID: <a6ab943f4660e39b8112ff58fa97af0507cd89e9.1752026324.git.cy_huang@richtek.com>
X-Mailer: git-send-email 2.43.5
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_190055_663528_BCFAAD0D 
X-CRM114-Status: UNSURE (   9.99  )
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

From: ChiYuan Huang <cy_huang@richtek.com>

Modify the lowercase character to uppercase.

Fixes: b2adf788e603 ("mfd: mt6370: Add MediaTek MT6370 support")
Signed-off-by: ChiYuan Huang <cy_huang@richtek.com>
---
 drivers/mfd/mt6370.c | 2 +-
 drivers/mfd/mt6370.h | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/mfd/mt6370.c b/drivers/mfd/mt6370.c
index c126ccb25d66..c7c2efe3598c 100644
--- a/drivers/mfd/mt6370.c
+++ b/drivers/mfd/mt6370.c
@@ -95,7 +95,7 @@ static const struct regmap_irq mt6370_irqs[] = {
 	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_SHORT, 8),
 	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB, 8),
 	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB, 8),
-	REGMAP_IRQ_REG_LINE(mT6370_IRQ_FLED2_STRB_TO, 8),
+	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_STRB_TO, 8),
 	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_STRB_TO, 8),
 	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED2_TOR, 8),
 	REGMAP_IRQ_REG_LINE(MT6370_IRQ_FLED1_TOR, 8),
diff --git a/drivers/mfd/mt6370.h b/drivers/mfd/mt6370.h
index 094e59e4af4e..dd9ccc0a53f1 100644
--- a/drivers/mfd/mt6370.h
+++ b/drivers/mfd/mt6370.h
@@ -69,7 +69,7 @@
 #define MT6370_IRQ_FLED1_SHORT		79
 #define MT6370_IRQ_FLED2_STRB		80
 #define MT6370_IRQ_FLED1_STRB		81
-#define mT6370_IRQ_FLED2_STRB_TO	82
+#define MT6370_IRQ_FLED2_STRB_TO	82
 #define MT6370_IRQ_FLED1_STRB_TO	83
 #define MT6370_IRQ_FLED2_TOR		84
 #define MT6370_IRQ_FLED1_TOR		85
-- 
2.34.1


