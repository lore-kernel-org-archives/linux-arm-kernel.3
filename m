Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58504606A320
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 21:25:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Nzjc87yD;
	dkim=pass (1024-bit key, unprotected) header.d=broadcom.com header.i=@broadcom.com header.a=rsa-sha256 header.s=google header.b=ISQntnuV
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=; b=Nzjc87yDTau3Xq
	1wu1UZjb9sESkc38GDMvS7yON+lBbNUtRf/sP4OB17vZfIJ36ynB/ErIS0/wKc91jRnBWKAz3lSlT
	OFj+o4E2tQmk8oJl3QUhqcTHB4HM1QIC9WbSWXQk3MI2MDS/D+nNZQSFFAZ4uPkUG3sY592/BDgi6
	fxrD6it/ns4k8Z7FGn1FPxmXGE0tb1fkK5fxhr3M8hTS6GxZH3G0jwwHmLEqCNWvC9ZIPkT93exIi
	mPlvkq7cXKTHqcQdtt3QvhY4iEQj5JlMdTlKnRjVfIgn/Q7XmxUeCEMiFceecuASnXIM46hBeV9Ju
	SCyuKQsQMmyMyq310WcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXdB-0000000APfk-0eHQ;
	Thu, 29 Oct 2026 21:25:53 +0000
Received: from mail-pj1-x1063.google.com ([2607:f8b0:4864:20::1063])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMXct-0000000APVS-3QiI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 21:25:37 +0000
Received: by mail-pj1-x1063.google.com with SMTP id 98e67ed59e1d1-3a4b3ac8fb7so31498a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793309134; x=1793913934;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=fMO2IGVw8y6rK8vSw5jxmbJq+ZB9/xpO2nAn2dLCVSiZ9GCAaaRlU4622ztdKqTyDd
         tV4GKEzggK23KnMpJFUUzUfCkRLW44nACe6R+rzAZY8aoHCl+KTGNEjQecLGw7C4QkDc
         NSQcpFsEvmSbCu4jJTNiQSBXandLh48TpoXu/tY84PbL0klkOtm+TWdsvjcAGvDAHdX2
         f3HHyHqtMD23zbvkjKTMBnNVmY0/szg9JPHlf+7xs3aYmf4i7pro9ffzrBt74UW8iMmr
         R8E3TQq0k0/9BbKiOkUiVeG7Ep1Nj+SUPQrwV6e6U8trjxdXHstgmkp7qZkzUXvCMDoq
         PPNg==
X-Forwarded-Encrypted: i=1; AKwUvBzWoCP7L5M8cyWVtco2Q49mqo0h4Nsq/Sc3CS+vNVT56TEF+Dm1PdKXKaEcMR+NgLCpZclPuyHX9OWCiHMMpjWk@lists.infradead.org
X-Gm-Message-State: AFq9FYL1Y0nN6uWEQJtdtoihUTKPdjBTFOrOWs6Z6sXphpbWyQLNq9B1
	GlDNA2YV7DYRSH6DWgaLEIfrzCRhkzZZBDdTaPMOhma3ec/OO/JD5DOUElS4gHsUdLO8Un6gDYJ
	Le+Cs+TH5dqoFaXh/FXpDjwoXn+tu7BmilVt0MrwKBX1QFRMItVOheQHgVmsRa6aXlTnaoxxTaa
	NziRKvsvwzD65b/VktWLLDG2HNvYCL+dptQ7yLj7s+4yReVe4kkVmcy9wXuNPp4y6WgquIzJz9s
	9uZvXfgpa6gU5rhmPXEM1dQBexgy/UfE9FsTg==
X-Gm-Gg: AYBFou2tg4Lq16pUXeqrXsSouTI2yQn9714CKilSVPhPBUN0PpPdVyFsSLKuM9mMIkY
	1/ZMVfpRCobdXCEriMfQr1bqF7QeCTuuXUiW0AupQEgfAq6kSER9hmSyYX/QYguXomKuS+0dcfP
	adQVn8x7+bF2ov7E5Qtyxgn5OuHxUuj/3xRKeOKAec3ktsi1SZii2pla37NOWlYy6NRKH97c2A+
	XfZClF25XxrqcXi5pAV4aQwpW3L+2RrvB1Vzn3EnZJycWNYHXmhvTteEQHUbQ42NmWo5FdJSMtm
	etmxBjzKdnHdO8jKd2gHRO10HqMs81TojyyEB7VyGkJU+vkTlARU3rej/giejB6Sw3r8hHfe26a
	43rT7wLW7hrplUyVaYV1FFlnxaEHfDYjiOmlOuoe8icE/pfeEdW9t6LiJU2SemWMXpGkPi01bIs
	PiD1QKWxOOqcz+dKLeLWb+H7YNXOjGQPK9wQRkyL/t
X-Received: by 2002:a17:90b:2fc3:b0:3ac:b2e6:3181 with SMTP id 98e67ed59e1d1-3ae89771953mr179865a91.37.1793309134352;
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-13.dlp.protect.broadcom.com. [144.49.247.13])
        by smtp-relay.gmail.com with ESMTPS id 98e67ed59e1d1-3ae85cc3344sm186055a91.0.2026.10.29.14.25.33
        for <linux-arm-kernel@lists.infradead.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 29 Oct 2026 14:25:34 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-qv1-f72.google.com with SMTP id 6a1803df08f44-91c7886e8dfso1966606d6.1
        for <linux-arm-kernel@lists.infradead.org>; Thu, 29 Oct 2026 14:25:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1793309133; x=1793913933; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eG9L8JoEnV2/AJh4IZs2XwE9uOcVbAGkOowIPsI/5ZY=;
        b=ISQntnuVtZsvuEPM0f+wNwR9rM8+w4lovGv9e95vyDO3vX/N841PWFeGNOt9+TKZ/n
         ykC0PwCz75FuS29yOcr6aW6LmAy2O4foH0ZlRYKS5myloPoC0T4+g16rK2J9Bv9aJJqH
         VCsXcaMDN7Bbp0mrvDI6jK8jYZjTOqHanTlGU=
X-Forwarded-Encrypted: i=1; AKwUvBxKA/X1grjiYmQSYdhfY8VuAWFmIGukv0bGSW4AVY8tWMKvCAw9eqDUoRU2h9IewtUAiNrenk0aorVzfdbQKOoQ@lists.infradead.org
X-Received: by 2002:a05:6214:45a0:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91ca4b7973dmr3564116d6.49.1793309132742;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
X-Received: by 2002:a05:6214:45a0:b0:91c:7a0e:3385 with SMTP id 6a1803df08f44-91ca4b7973dmr3563736d6.49.1793309132301;
        Thu, 29 Oct 2026 14:25:32 -0700 (PDT)
Received: from fainelli-desktop.igp.broadcom.net ([192.19.223.252])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ca314fb6csm6384936d6.34.2026.10.29.14.25.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Oct 2026 14:25:31 -0700 (PDT)
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
Subject: [PATCH v4 3/6] ata: ahci_brcm: Initialize the NSP interface clock and reset
Date: Thu, 29 Oct 2026 14:25:10 -0700
Message-ID: <20261029212513.4126083-4-florian.fainelli@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
References: <20261029212513.4126083-1-florian.fainelli@broadcom.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_142535_870280_B04AA1EB 
X-CRM114-Status: GOOD (  18.51  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-18.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
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


