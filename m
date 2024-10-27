Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE6EFD10BFE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 09:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+DaEwnlS4lOD6gl8n5IC4q8JgYWiQY3dTRRDj5Yl7Z8=; b=2+LSfKyHumXZavv8nX5davI5Gm
	cWxuFdc54hILzv5X8cC/QBrku1uTmOUh7a23jiLscveHQGFraTfM5PNRHcNMOKQv2bJrofeUwA4R+
	YbLG1glJxnYIopN6ztcqeYrh0Xn0Pe1GNDNq/rzz9Fqn0P2VcQH2g2Vqeh0qWF7la8Kg5oZVPmeBC
	0yqsJSKcDPX7KV0eHnkxdEnganX30qEdqzkjjxZzulkXCaRnt2hgP5LGo/fmC+VG9vezMmXo5OjGm
	3qB2rQrI6VKtuSphW2wZbGTmYI7gcuX3pdgKwB0a8W5yghzUqzL6amSqHB8jComBd3F8/1+XDPlFe
	qonFdDGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zRq-00000007sic-2x2H;
	Sun, 27 Oct 2024 09:20:34 +0000
Received: from fw2.prolan.hu ([193.68.50.107])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4zNu-00000007sMf-3w4I
	for linux-arm-kernel@lists.infradead.org;
	Sun, 27 Oct 2024 09:17:59 +0000
Received: from proxmox-mailgw.intranet.prolan.hu (localhost.localdomain [127.0.0.1])
	by proxmox-mailgw.intranet.prolan.hu (Proxmox) with ESMTP id 88878A0727;
	Sun, 27 Oct 2024 10:16:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=prolan.hu; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:from:from:in-reply-to:message-id:mime-version:references
	:reply-to:subject:subject:to:to; s=mail; bh=+DaEwnlS4lOD6gl8n5IC
	4q8JgYWiQY3dTRRDj5Yl7Z8=; b=KzT7PcH5Lo5iMZPKc50bWNLOKAuIFZ8dsMdE
	/Gk2LC65IF03H2kmNsHR28NL553CuWdovXtj9wDh2SfhgP3guL4zA46XbrkR4ehK
	xuWCimb5u5jFXzJszkxVD88Cguj92U0LczDpDCqgCSuuqqU+b1+8A2h80L9SXo/v
	Rss8nLw5HEDJS974he7iooe7H3NbfvneWJmnxPW/gFnFYh1qDJkiOi2m+1U6rClU
	uNZU0PAMi2PsE6oyk9CaJffxrVrELGsEslykgvLSPQFdAnXT2tQDe2G58tliwHrV
	0wJRr+UNSN5AHg65EXpsvUDMRYkeOccsdOZURJM/tqhOguAaZKX4CpdbIGf8xCKW
	98r9x57wAK3LOr15FDBlxCD3ut1lIsFQTyQSFSDP1tNxlFuhklfLUqUyiains4Tl
	A8eII85YT0sBDu5VX4MbqCdmzqDMVGuh1iepTL3nxE4qFIIcyqmVY7+qqFbr2X3Z
	41eVGVWEmGIpaadeWJvIYFnIn3Fm327W2mFYGqHCnyWJCVgQzjjGf2vIIjq/1Y3W
	Rm838w7zlNIbvv/JYKa2OmpQ5mPdJhM64M3F0dMOw4fqkc0J2+nBlArV1+aEuEOG
	D8u+fmkOdfFI6AJuN9Stx31UhoFImHf7LRgxO+Zgn4lvpu0UStFyqobpzTe66ejC
	s9e4KjY=
From: =?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>
To: <dmaengine@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
	<linux-sunxi@lists.linux.dev>, <linux-kernel@vger.kernel.org>
CC: Mesih Kilinc <mesihkilinc@gmail.com>,
	=?UTF-8?q?Cs=C3=B3k=C3=A1s=2C=20Bence?= <csokas.bence@prolan.hu>, Vinod Koul
	<vkoul@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
	<jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, "Philipp
 Zabel" <p.zabel@pengutronix.de>
Subject: [PATCH v2 02/10] dma-engine: sun4i: Add has_reset option to quirk
Date: Sun, 27 Oct 2024 10:14:32 +0100
Message-ID: <20241027091440.1913863-2-csokas.bence@prolan.hu>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20241027091440.1913863-1-csokas.bence@prolan.hu>
References: <20241027091440.1913863-1-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ESET-AS: R=OK;S=0;OP=CALC;TIME=1730020588;VERSION=7978;MC=1266469769;ID=156037;TRN=0;CRV=0;IPC=;SP=0;SIPS=0;PI=3;F=0
X-ESET-Antispam: OK
X-EsetResult: clean, is OK
X-EsetId: 37303A29ACD94855677D65
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_021631_161383_77DC3CF6 
X-CRM114-Status: GOOD (  16.37  )
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

From: Mesih Kilinc <mesihkilinc@gmail.com>

Allwinner suniv F1C100s has a reset bit for DMA in CCU. Sun4i do not
has this bit but in order to support suniv we need to add it. So add
support for reset bit.

Signed-off-by: Mesih Kilinc <mesihkilinc@gmail.com>
[ csokas.bence: Rebased and addressed comments ]
Signed-off-by: Csókás, Bence <csokas.bence@prolan.hu>
---

Notes:
    Changes in v2:
    * Call reset_control_deassert() unconditionally, as it supports optional resets
    * Use dev_err_probe()
    * Whitespace

 drivers/dma/sun4i-dma.c | 21 +++++++++++++++++++++
 1 file changed, 21 insertions(+)

diff --git a/drivers/dma/sun4i-dma.c b/drivers/dma/sun4i-dma.c
index d472f57a39ea..0a45089461e1 100644
--- a/drivers/dma/sun4i-dma.c
+++ b/drivers/dma/sun4i-dma.c
@@ -15,6 +15,7 @@
 #include <linux/of_dma.h>
 #include <linux/of_device.h>
 #include <linux/platform_device.h>
+#include <linux/reset.h>
 #include <linux/slab.h>
 #include <linux/spinlock.h>
 
@@ -159,6 +160,7 @@ struct sun4i_dma_config {
 	u8 ddma_drq_sdram;
 
 	u8 max_burst;
+	bool has_reset;
 };
 
 struct sun4i_dma_pchan {
@@ -208,6 +210,7 @@ struct sun4i_dma_dev {
 	int				irq;
 	spinlock_t			lock;
 	const struct sun4i_dma_config *cfg;
+	struct reset_control *rst;
 };
 
 static struct sun4i_dma_dev *to_sun4i_dma_dev(struct dma_device *dev)
@@ -1215,6 +1218,15 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return PTR_ERR(priv->clk);
 	}
 
+	if (priv->cfg->has_reset) {
+		priv->rst = devm_reset_control_get_exclusive(&pdev->dev,
+							     NULL);
+		if (IS_ERR(priv->rst)) {
+			dev_err_probe(&pdev->dev, "Failed to get reset control\n");
+			return PTR_ERR(priv->rst);
+		}
+	}
+
 	platform_set_drvdata(pdev, priv);
 	spin_lock_init(&priv->lock);
 
@@ -1287,6 +1299,14 @@ static int sun4i_dma_probe(struct platform_device *pdev)
 		return ret;
 	}
 
+	/* Deassert the reset control */
+	ret = reset_control_deassert(priv->rst);
+	if (ret) {
+		dev_err(&pdev->dev,
+			"Failed to deassert the reset control\n");
+		goto err_clk_disable;
+	}
+
 	/*
 	 * Make sure the IRQs are all disabled and accounted for. The bootloader
 	 * likes to leave these dirty
@@ -1356,6 +1376,7 @@ static struct sun4i_dma_config sun4i_a10_dma_cfg = {
 	.ddma_drq_sdram		= SUN4I_DDMA_DRQ_TYPE_SDRAM,
 
 	.max_burst		= SUN4I_MAX_BURST,
+	.has_reset		= false,
 };
 
 static const struct of_device_id sun4i_dma_match[] = {
-- 
2.34.1



