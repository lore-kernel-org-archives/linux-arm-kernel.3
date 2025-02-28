Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2DDFC282C5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 11:15:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kNQfrx2+Y7l3TBgRs2HYeEusAxTadJTrsHyF6Qzg2L4=; b=Kro1IvGL63ZPn429jApSRzo+pq
	hvb78hIctpXJ474jpM+WsPxWE+GArE0TNcDinR8zTiucVmSz7zdR7YLYFDN38ykaqYuZ+XiW0IZen
	uh7ikKhGZFqEPUHgpuWWbnduzP1dIh9kD7ebK1fLTUTta5raDf99Zq52AdoWX1m+vXkrsCLFxGyp4
	ryvlGw9PRDM0AF7VIaHE66F87QhlQawPtKb9w1yOHeyJROcMjkmlHcMlT1niS/Bw5b02vjsgLxolB
	kE8LdID0d0Fi+gGOhyMttY2VA4S2FDoPP0HzPma8KDjVqJhnG2DlZDIwmNHRyCldmU5ogx7AuXSUx
	oo5SmBrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnyL1-0000000Aihd-2tEg;
	Fri, 28 Feb 2025 11:15:27 +0000
Received: from mail-wm1-x32f.google.com ([2a00:1450:4864:20::32f])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnxmr-0000000AdFq-0Ieo;
	Fri, 28 Feb 2025 10:40:10 +0000
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-4394345e4d5so13731685e9.0;
        Fri, 28 Feb 2025 02:40:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740739207; x=1741344007; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kNQfrx2+Y7l3TBgRs2HYeEusAxTadJTrsHyF6Qzg2L4=;
        b=McpUWGKodfIz+M4v/kIA9zKFFB7FtgObKSjsKSd7+FWF0gOFUeHTggXrq/tCeblmj8
         FQ3Uc/6TC4cw/DKa2ZOy9jHP7BvdDjDPNsXIVwfXoruycK8h6WHZAYDsMgPuV0Cpbd60
         1/3zDHb2hpI0l8sxORol+L/enflQusbM+n+GD0wQSEl5xSMGYx92ilFTrmZdqaOFbLvs
         13CNIz9O6aPEeHuUjXEP8o5xq6uhrz6f9yUrNqmKWWlY/l42jHsLGnNdhXghW3ESRDPu
         7VYYI1/Tq5T8DKamUM/0F9bqbwcllrEw51D2NEdhXy8gNOpe+CtNphtQTNfMxcFtDlJb
         ONOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740739207; x=1741344007;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kNQfrx2+Y7l3TBgRs2HYeEusAxTadJTrsHyF6Qzg2L4=;
        b=ra/4ht1btfrFwyW3Rqgu3oSO63gceUSGJY3VOI5DYoGs/iSme1RKGMjg8YuiaI79lR
         yN+wthaz4yhSA3XLKrIqhO26yR4FsOJwYsYnSXT8BQuBFQZfOKzD+gbf1ubfBCNPsLn3
         HRYLMsNf2lAHwHhNbgm0vG7/6IDE2yM7WtOxpUXrNZLRMqVuxCCe9dAmGyvuukks3+jV
         4rfb3Tnf83eeQ7Aht7DHOdS5N1xsgoYuknGbJpY94tN+LRFXhxvrzjIdb0fDKEakBIK8
         /1qX1EQnq0sycxzNk7VJO6ZBlJVPYi8FlYiRq34dZhCdv1UF4SeX9bhQTYqASfoCmjr0
         Voeg==
X-Forwarded-Encrypted: i=1; AJvYcCVGKlf4KcGsY+PwQMz5/XLRVsCG4e6LWLG/hQ8edqRL+SYnAjUtlV/7ATLnotI0GeeyPiOlr6D58BnOtRkeF6eh@lists.infradead.org
X-Gm-Message-State: AOJu0YzopFW9Q+a4KOyraWI8iboM3OopvwKWHfzGwXw0PFmkBVvsuE/I
	8T6AVk+t2+ApshTKK1f9O/3MqdihEd6oEJBz3TB3eZRu4x482hmP
X-Gm-Gg: ASbGncuKjTIXddJ9nKJOlRcyV1l+rMT4wpdN49FGAMcnnuQaOWLh+p4l4vq08GE3TJn
	ZmEGSxMJDe1LPwKodS1jOdiBAoKUpIyfV1sUuF9eLMntnMKsCxCAsHFzLuuehE20eU7/bFodIJX
	Hr9JTecvQVB447lI0tXoJddTuqESSEp2o9SDpOvUEDkXY1cRn+UW72S48N2a+fWgGX9QOgZQSi8
	MuumshgVvVTCygyTJtaJHQ04pnjTxyUIuDoGHcywrtcp2f5uNonXpo1Z6vOvzW/JKb3bL8jzVuw
	S84LZ6dBKHsM2BbB7fw63MYv6HYlINBYWnINBjJFgQ==
X-Google-Smtp-Source: AGHT+IHwAKMkbQkKZji2hIl2kLJahCHtsGvhDRkHSsHi5xjEjBT4SBZNdGXhe19X/KZFU+W8IlL/xQ==
X-Received: by 2002:a05:600c:1c95:b0:439:8bb3:cf8e with SMTP id 5b1f17b1804b1-43ba67606abmr21106225e9.20.1740739207395;
        Fri, 28 Feb 2025 02:40:07 -0800 (PST)
Received: from eichest-laptop.toradex.int ([2a02:168:af72:0:31d5:4145:8035:cb68])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43b73703caesm52078855e9.12.2025.02.28.02.40.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 28 Feb 2025 02:40:06 -0800 (PST)
From: Stefan Eichenberger <eichest@gmail.com>
To: vkoul@kernel.org,
	kishon@kernel.org,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com,
	p.zabel@pengutronix.de,
	tharvey@gateworks.com,
	hongxing.zhu@nxp.com,
	francesco.dolcini@toradex.com
Cc: linux-phy@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Stefan Eichenberger <stefan.eichenberger@toradex.com>,
	stable@vger.kernel.org
Subject: [PATCH v1 2/2] phy: freescale: imx8m-pcie: assert phy reset and perst in power off
Date: Fri, 28 Feb 2025 11:38:34 +0100
Message-ID: <20250228103959.47419-3-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250228103959.47419-1-eichest@gmail.com>
References: <20250228103959.47419-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_024009_109504_4DC40FC9 
X-CRM114-Status: GOOD (  11.82  )
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

From: Stefan Eichenberger <stefan.eichenberger@toradex.com>

Ensure the PHY reset and perst is asserted during power-off to
guarantee it is in a reset state upon repeated power-on calls. This
resolves an issue where the PHY may not properly initialize during
subsequent power-on cycles. Power-on will deassert the reset at the
appropriate time after tuning the PHY parameters.

During suspend/resume cycles, we observed that the PHY PLL failed to
lock during resume when the CPU temperature increased from 65C to 75C.
The observed errors were:
  phy phy-32f00000.pcie-phy.3: phy poweron failed --> -110
  imx6q-pcie 33800000.pcie: waiting for PHY ready timeout!
  imx6q-pcie 33800000.pcie: PM: dpm_run_callback(): genpd_resume_noirq+0x0/0x80 returns -110
  imx6q-pcie 33800000.pcie: PM: failed to resume noirq: error -110

This resulted in a complete CPU freeze, which is resolved by ensuring
the PHY is in reset during power-on, thus preventing PHY PLL failures.

Cc: stable@vger.kernel.org
Fixes: 1aa97b002258 ("phy: freescale: pcie: Initialize the imx8 pcie standalone phy driver")
Signed-off-by: Stefan Eichenberger <stefan.eichenberger@toradex.com>
---
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 00f957a42d9dc..36bef416618de 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -158,6 +158,17 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int imx8_pcie_phy_power_off(struct phy *phy)
+{
+	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
+
+	reset_control_assert(imx8_phy->reset);
+	if (imx8_phy->perst)
+		reset_control_assert(imx8_phy->perst);
+
+	return 0;
+}
+
 static int imx8_pcie_phy_init(struct phy *phy)
 {
 	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
@@ -178,6 +189,7 @@ static const struct phy_ops imx8_pcie_phy_ops = {
 	.init		= imx8_pcie_phy_init,
 	.exit		= imx8_pcie_phy_exit,
 	.power_on	= imx8_pcie_phy_power_on,
+	.power_off	= imx8_pcie_phy_power_off,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.45.2


