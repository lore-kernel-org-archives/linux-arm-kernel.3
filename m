Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C67BB606A324
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Oct 2026 19:18:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=sWTpjk+a;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=M+Doum+J
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=; b=sWTpjk+aBc3Vf3
	7PAPfZ4jhLm3KU5Zak0tb/eTFJY+7SVdm8iabIc8osNicdeOMpL/obp2Gix+oNAf8VEQ462HDTejn
	SnbI8whq+sred7vlFxj5aFsLrVFz1qMvm41AoINgkwL6XNWemRY7myIHQNHKDkSdPONXFNuDXS1Yh
	gbH4aMDq8B43Sk8BASn4YUld3oL2BBtP2NbgfJfRn2h29FFBnhG3/U7Vwbev+ISmMqfLTrOGXETW4
	hz+dXs1D65DIHzNmJOM4ntMVUaETwqIefDNLuxOu1yyiDs7xT78H9z5E5hDtH0Fpts2U/aQ9b2+AJ
	G77yOVX1z2DVReU4nH3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQDC-000000039Zn-0RI1;
	Mon, 26 Oct 2026 19:18:26 +0000
Received: from mail-pj1-x1064.google.com ([2607:f8b0:4864:20::1064])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLQCy-000000039P8-0tJR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Oct 2026 19:18:13 +0000
Received: by mail-pj1-x1064.google.com with SMTP id 98e67ed59e1d1-3adac5c10e3so1774945a91.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:12 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793042291; x=1793647091;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=Zxrg5FJG86nz3pI8jFj5r75xDJKvSbe2rtghJDNs3w5UQYQr72KbOAN7kR+9F4PJjY
         M/huv0liChWMvY2gLJiLxYyD10D1bcpzWDzVFIwx9EI1I/pG4nuWVzJLsw5dJGn2Y0II
         lRgPU/wA9D/k2rs8rbc2RYZk7LD+cSGJJMieVxSFcURDlv2hp3I7i8vMhAoCG3AYZVtG
         sq0O40j0d3yX4797NlmUJY2KHH3cXsp/pkVdFxbEG3Iv4yi2cmjuPe2ouwrI9G68WFf/
         N4mH5gmBIRliLW698j6fUhc3QkH/mMcbv2Ou5aU12w6VbDZynoxS2M8GYM36SecRy36i
         7FgA==
X-Forwarded-Encrypted: i=1; AKwUvBzNRjsUsLDL56+MSOgaCZysQMmXamECDzPd6LH7Mh+8j0pqVjbyGK6f7z9Ofpsq9lnepSu9nZcfFTlGI3yHw0Pw@lists.infradead.org
X-Gm-Message-State: AFq9FYIw6VGFX6uBkRPkDp4dQqQCK/j6cbR+9XiUghqCwnsG/VsP9duW
	OV3r9Ta0HHyCTh8vjKY9K1R/6fJ2p44S8Rf/7CgZya4JslhUZ5lMy/43/mEC9tCmzPw7CCrtrnP
	601UUuM+1dA05wzZaaJBWnpSmgFAtzeNvuOlARXS9yDbHLj2fJUfxp43IPHD1G4SyhI86L4gHcT
	tBxwN7dctzibyEygjHvH3pC5srjhsHcSr/5BOHYDbhfzj7zjEw/CtzcDRxWVz7NB/v7GP4G4yri
	7rDd0SDOQ2Qhvc3tgIqsqOgK6oWBKLqESA=
X-Gm-Gg: AYBFou1MKYwzshjP4xxCWpSeQZuVH+KdIZr8gtU5rgKAi+OoJUO2mUsfdRi/XEYRrTx
	HSklBcXBFg5c7/K2WRGyR0+bUK9gtI1iFbN/sNN4QsBksUQpne3yjCexA4JQH3R5A0BlDie+tov
	6eY0Er8S/nWl54xKZO2bYBGEsiBqCVYQ6A5q+Tzu05yCsuzRvHSeIbw0f2NTYzkJ158Q6kPa/75
	qEVM4ioeX+Le6XvVaZDn0nTRe20rUYoNh+TiFoOoQzry2Mx1Mii3CYl70ZgK9YIKRZkcTexcd4W
	7vlgwt5wdelju6G+KZd867XUN6xOPxu5+BO5lrj9YKILqm30Mcclt3BRqr0ssI/cglRyqAbsa+d
	+slSL6iZV27qQ57LfYjiAPYWH6Oo5LNkfijtLfxraJtxEJflf0EdrNbihJx6JGsBTd6VAZ4CYJW
	gXOVM+juN4mPkuvrOtL6XAhAsdRb4u7kWMjId4SB5VE0Y=
X-Received: by 2002:a17:90b:528c:b0:3ac:b08a:ed2c with SMTP id 98e67ed59e1d1-3adead49388mr6178705a91.40.1793042291041;
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae40619b11sm387966a91.5.2026.10.26.12.18.10
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2026 12:18:11 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-91b8306ba68so87834076d6.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 26 Oct 2026 12:18:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793042290; x=1793647090; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=M+Doum+J4GbeUFnA26kavk8uiWsFuE7zS/8GZ5I5lO/nOzHCwlwh8Iv+3OpVGpVsbm
         siWAdRWrYYdZQmMlSzNA32Zpnz1w26BNxZG6/BusAA4GntdLV53H7OtUhmGMa7STUGgz
         Qy/4vT+xeJ3xRqd9e1BTj4pa4al8f/xdHjImw=
X-Forwarded-Encrypted: i=1; AKwUvBzerLXF/e9mOdO6FYgQ9p9voQkv4it+UoKZoH4Fc9dRaZS2ggNNMSL6XHozs9TPRIlvXIEcUTNHY0OxrDjhYoaV@lists.infradead.org
X-Received: by 2002:ad4:5d42:0:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91c6d307d76mr12445216d6.52.1793042289906;
        Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
X-Received: by 2002:ad4:5d42:0:b0:91c:6d30:7c2c with SMTP id 6a1803df08f44-91c6d307d76mr12444746d6.52.1793042289436;
        Mon, 26 Oct 2026 12:18:09 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91c62063dacsm33430996d6.37.2026.10.26.12.18.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 12:18:08 -0700 (PDT)
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
Subject: [PATCH v3 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Mon, 26 Oct 2026 12:16:15 -0700
Message-ID: <20261026191618.3178830-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
References: <20261026191618.3178830-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_121812_267362_E5F23724 
X-CRM114-Status: GOOD (  18.76  )
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
 drivers/ata/ahci_brcm.c | 36 ++++++++++++++++++++++++++++++++++++
 1 file changed, 36 insertions(+)

diff --git a/drivers/ata/ahci_brcm.c b/drivers/ata/ahci_brcm.c
index 29be74fedcf0..3b6ed56f3e95 100644
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
+	/* Enable the interface clock before releasing the SATA core reset. */
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
@@ -376,6 +398,9 @@ static int __maybe_unused brcm_ahci_resume(struct device *dev)
 	if (ret)
 		return ret;
 
+	/* Initialize the IDM before enabling the controller clocks. */
+	brcm_sata_init_idm(priv);
+
 	/* Make sure clocks are turned on before re-configuration */
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
@@ -453,6 +478,14 @@ static int brcm_ahci_probe(struct platform_device *pdev)
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
@@ -493,6 +526,9 @@ static int brcm_ahci_probe(struct platform_device *pdev)
 	if (ret)
 		return ret;
 
+	/* Initialize the IDM before enabling the controller clocks. */
+	brcm_sata_init_idm(priv);
+
 	ret = ahci_platform_enable_clks(hpriv);
 	if (ret)
 		goto out_reset;
-- 
2.53.0


