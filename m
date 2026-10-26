Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCCD7606A31E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 18:29:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=WnxXg3q/;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=T3FmclUL
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=; b=WnxXg3q/vlP7h6
	D+tdrr4V86f8ZeAQqsHYWib7ZKf0HQdD/1eACqYxMhg+cRu5CtpBMsG0eveYP8R1hrM3KLTeTIoEe
	hzac+0y+IHgRluSMkKRKx0NkLzKflgIrSSy2FpCBsOKaciSiG0DFB8Ef5eA64mOVhUrd1aFHtKrz3
	ExO0x+IhPHwwfX2fSdPx30DmXTgq+M0VbRgtjB3D6qresObSJppMOycgfCY6Y/I0qTWH0PC0RUWWm
	7sHaSS6+sSNps6qak1pvZb4qlML3rCDyRdKa0UWI0HptxBoDLOiYXkRiz9CSy/wvRFVNZnYRgHxIq
	PQAZDmpt/3KcWLZ+x0nw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRv-000000034YW-3qJt;
	Mon, 26 Oct 2026 18:29:35 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLPRs-000000034Uo-34W5
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 18:29:34 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3adac5b29ebso1908156a91.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793039372; x=1793644172;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
        b=Dugy1AGqWuF2UA86xy01LKxDJCPKIgrgbw0YJKHov/NG+SI5lYkT0AQEwvdXz+bbh8
         rJiMEILPaxcogjtz9MN9PYxNuwKvckS3aa/iw5ASLXoN2LZoJqAi2Mg7l7p5LVbKxkJs
         SF+LntPfM4OMRpGo0C3mgHof1y0nW6oRRhzqi9MOFMhOKK+OO7DEZ4m57ycZxs3Pk1AF
         Ji4OzsKOMGA93V/cNGOn4D+f/zb9bSgeWB8/6Hgu/cHwa7sPVKogMFYrHS4bK4E/Jjsm
         opsP2Vn1/Q15LdlhxfEYpQ1NggEftnJx/Hv7UK5bBKKUGOX1E6adklZ9sRe5pkrpVUYk
         dH3w==
X-Forwarded-Encrypted: i=1; AKwUvBwaznF6ZHsGCTWTN0slg8SRDQLocpGB9rvQ9Y5TrxvYlkL8k/PoFXuHcwK9G94Y+xDwbQp4vNI11wjBMNq70som@lists.infradead.org
X-Gm-Message-State: AFq9FYIXDSx/nzDT0UGsMVIutqhKf8xJz3B+r5v/NeFULEYjyUCn5jeu
	BePVGynViJ54X7GMCXXEjz2lqfpUTB30lG4QmzpKBuF6OXwc4Fk7DdouBblVw8Ov7uNOv8Dkb2O
	9XVT8V4SknxB9rFQSIQR9m5Ly8/NTrRQB23TqnK3HbAT+ruVo77TBrq1XW/koOuSCWW1f5u84Xw
	vqoPbNb/1AWahoZYKXJcM590GFoOEn25ssNpEZNTuGU/iP/0xmUE9yshnPj2trvjGINLuDbFeS4
	earqtmcsaX3TrKDKbHM6KDxoQjJyD/6vElyuQ==
X-Gm-Gg: AYBFou3r6uPvNGM0+g8bjM8MVFrgJRp1YGGt8fpqfzwGICbSil+Azcj8jDg1a0ItThX
	nCkED9fc/+feIEoJ2aNBALcI7dIleKtzue7UFwZSaqLnyDlZ1bK+/v9PmMWgk0Dd9wqUWe40SW3
	keq5kvsHj/amktURbZLOwiIQqdn2HtvqlHmUHMMSbh1KoMjbFfzjs+qhTedlherJLgfxzRpTelS
	QdF6JQwtOa0xGxp71ulAMAhlJOrn05TBfyNbJF0wNrJCDZ57V2OyubjByxnoRjVaH2s8zb026WV
	zYOzrYSaf51s9SCHL4yVwPyKU98aUSOpLjiRjavh3sRecqWl03vr15uwSvscG4UWzITqVJERtoJ
	lnIUI7pCOH+HwlQWrqP9HNeEvO6hN1oLBiC5M6odGf+8MmVXRm1Qa0S5UL1guGEVbC0FMMKWYwu
	xTIZbsdqTFV86uN26TweIX9hGeZ1onRB0PZPYALluP
X-Received: by 2002:a17:90b:58e8:b0:3ac:9706:7739 with SMTP id 98e67ed59e1d1-3adead57cf0mr6655950a91.17.1793039371646;
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-28.dlp.protect.broadcom.com. [144.49.247.28])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40405cfbsm285846a91.0.2026.10.26.11.29.31
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 11:29:31 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so9496531eec.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 11:29:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793039370; x=1793644170; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mvtMFeEgqCOciHeQyrJ9AYtTF4EED76l0h+Ctv+GHTw=;
        b=T3FmclULnLSKA5LJiplL+VlFP984bObrp256hZQmhsksSKhHNwFu63PJviOS1eO/QJ
         JWim9pN0yjVQvP7KGf4Lo1ZSqy7EybRB6htm2UyTCNTQuvQER6CP/lA2eJEJy3iabT2X
         pTTodo/AEXoXbii30jxTlqPakpw36CgUgBIys=
X-Forwarded-Encrypted: i=1; AKwUvByf0NfvMGAoCeEEJR+Bk//Lzk4qghGi0T/gI3TlOWUGlNff5Mrl0EFlIH5FzaekMMBW7RDxntSISp93dKbnTdhz@lists.infradead.org
X-Received: by 2002:a05:7301:1525:b0:369:a113:756f with SMTP id 5a478bee46e88-369e850d487mr10690520eec.34.1793039369714;
        Mon, 26 Oct 2026 11:29:29 -0700 (PDT)
X-Received: by 2002:a05:7301:1525:b0:369:a113:756f with SMTP id 5a478bee46e88-369e850d487mr10690462eec.34.1793039368795;
        Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a01fa4c58sm24657259eec.21.2026.10.26.11.29.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 11:29:28 -0700 (PDT)
From: Florian Fainelli <florian.fainelli@broadcom.com>
To: linux-kernel@vger.kernel.org
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Damien Le Moal <dlemoal@kernel.org>,
	Niklas Cassel <cassel@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ray Jui <rjui@broadcom.com>,
	Scott Branden <sbranden@broadcom.com>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Tejun Heo <tj@kernel.org>,
	Yendapally Reddy Dhananjaya Reddy <yendapally.reddy@broadcom.com>,
	linux-ide@vger.kernel.org (open list:LIBATA SUBSYSTEM (Serial and Parallel ATA drivers)),
	devicetree@vger.kernel.org (open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS),
	linux-arm-kernel@lists.infradead.org (moderated list:BROADCOM IPROC ARM ARCHITECTURE),
	linux-phy@lists.infradead.org (open list:GENERIC PHY FRAMEWORK)
Subject: [PATCH v2 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Mon, 26 Oct 2026 11:28:53 -0700
Message-ID: <20261026182856.3168686-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
References: <20261026182856.3168686-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_112932_814027_0BBBC36A 
X-CRM114-Status: GOOD (  19.15  )
X-Spam-Score: -2.4 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The NSP probe path assumes firmware has enabled the SATA IDM interface
clock and released the core reset. The downstream iProc config_AHCI()
sequence explicitly performs both operations before accessing AHCI.
Without that setup, a cold boot can access an inactive controller.

Map the optional NSP IDM register region and enable the interface clock
before releasing reset, retaining the downstream settling intervals.
Perform the sequence at probe and resume before reconfiguring SATA.

Keep the resource optional so older device trees continue to rely on
firmware initialization.

Fixes: 3ee2e6dcaa35 ("ata: ahci_brcm: Add support for Broadcom NSP SoC")
Signed-off-by: Florian Fainelli <florian.fainelli@broadcom.com>
---
 drivers/ata/ahci_brcm.c | 34 ++++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..2ed60806b671 100644
--- a/drivers/ata/ahci_brcm.c
+++ b/drivers/ata/ahci_brcm.c
@@ -6,7 +6,9 @@
  */
 
 #include <linux/ahci_platform.h>
+#include <linux/bcma/bcma_regs.h>
 #include <linux/compiler.h>
+#include <linux/delay.h>
 #include <linux/device.h>
 #include <linux/init.h>
 #include <linux/interrupt.h>
@@ -83,6 +85,7 @@ enum brcm_ahci_quirks {
 struct brcm_ahci_priv {
 	struct device *dev;
 	void __iomem *top_ctrl;
+	void __iomem *idm;
 	u32 port_mask;
 	u32 quirks;
 	enum brcm_ahci_version version;
@@ -230,6 +233,25 @@ static u32 brcm_ahci_get_portmask(struct ahci_host_priv *hpriv,
 	return impl;
 }
 
+static void brcm_sata_init_idm(struct brcm_ahci_priv *priv)
+{
+	u32 data;
+
+	if (!priv->idm)
+		return;
+
+	/* Enable the interface clock before taking the SATA core out of reset. */
+	data = readl(priv->idm + BCMA_IOCTL);
+	writel(data | BCMA_IOCTL_CLK, priv->idm + BCMA_IOCTL);
+	readl(priv->idm + BCMA_IOCTL);
+	usleep_range(1000, 2000);
+
+	data = readl(priv->idm + BCMA_RESET_CTL);
+	writel(data & ~BCMA_RESET_CTL_RESET, priv->idm + BCMA_RESET_CTL);
+	readl(priv->idm + BCMA_RESET_CTL);
+	usleep_range(1000, 2000);
+}
+
 static void brcm_sata_init(struct brcm_ahci_priv *priv)
 {
 	void __iomem *ctrl = priv->top_ctrl + SATA_TOP_CTRL_BUS_CTRL;
@@ -369,6 +391,8 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
 	struct brcm_ahci_priv *priv = hpriv->plat_data;
 	int ret = 0;
 
+	brcm_sata_init_idm(priv);
+
 	ret = reset_control_deassert(priv->rcdev_ahci);
 	if (ret)
 		return ret;
@@ -453,6 +477,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	priv->version = (unsigned long)of_id->data;
 	priv->dev = dev;
 
+	/* Older NSP device trees rely on firmware to initialize the IDM. */
+	if (priv->version == BRCM_SATA_NSP &&
+	    platform_get_resource_byname(pdev, IORESOURCE_MEM, "idm")) {
+		priv->idm = devm_platform_ioremap_resource_byname(pdev, "idm");
+		if (IS_ERR(priv->idm))
+			return PTR_ERR(priv->idm);
+	}
+
 	priv->top_ctrl = devm_platform_ioremap_resource_byname(pdev, "top-ctrl");
 	if (IS_ERR(priv->top_ctrl))
 		return PTR_ERR(priv->top_ctrl);
@@ -493,6 +525,8 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	brcm_sata_init_idm(priv);
+
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
 		goto out_reset;
-- 
2.53.0


