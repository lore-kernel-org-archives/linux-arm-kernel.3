Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26283C282DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 14:49:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gNwIlbvFX4QRldBXaIs5/RL9LSC9AEjKyZahDbOst8Q=; b=IdvOSLgAE1desyA43GzKOEa/xg
	zU56FwX95/FXajLpU87h9EbZ78wbD7+vTlE2Xi+N6rdvendssv+P+kxfnX9tCosEeR9zV1zfK0oBo
	QMY5PjGg8eexRLVoKPSgh0j+1v7sCQ1C421JRoI3AUowKVm+Ycuohdrt2v/0ry6NtGDsjxGisR0m8
	nDdh56Qa4aqkgHktlTarUXu8oRdMEw7FGrS1Gy0ej2vzfO8KLl5rr8H6WupjDfTXQP9EoHDGrdhzD
	GLcfNF1YTdft+APIgeh3wb4NG58o/rp86hGO23vn9bJB3Gz6NN2VRhJAQWIT1ezKA80gp8J1z40re
	NVPHf78A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpq3P-00000008PN6-38Dp;
	Wed, 05 Mar 2025 14:48:59 +0000
Received: from mail-wm1-f47.google.com ([209.85.128.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tppyn-00000008OV6-339Q;
	Wed, 05 Mar 2025 14:44:14 +0000
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43bd03ed604so11934355e9.2;
        Wed, 05 Mar 2025 06:44:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1741185852; x=1741790652; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gNwIlbvFX4QRldBXaIs5/RL9LSC9AEjKyZahDbOst8Q=;
        b=KhC7SodpMU7bX/sVKnaYkeRkYEShET85Tm4LeFW0jGemMYbaDo2FUImQiVDs0KIuue
         SEoNvj3et7XdPcdUolWXsq1qwHFSnekkIoWvfrfJsMFl7JT0hJLfrfeoE8l7oXu4DMJ3
         xy1+/hkvKRXTd61SoUuKgAYOeteezW40npjW7xFG19tIKfomXhBR8R+USD8XhtqI6CAM
         EhfjN/9Kx/kex1hVwYXG0NogpINF5rwTtgLN2Umn1GrNFmmD7gNW/QNEvR6OowvXvLjC
         hgX5zJf6rrPQOrjXo89evK/Fb5UUnEguUMtqapNzaIfutYn/Cka2CDlbt8Jew4m4E10/
         nSIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1741185852; x=1741790652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gNwIlbvFX4QRldBXaIs5/RL9LSC9AEjKyZahDbOst8Q=;
        b=sykyrrG/ut2VoxSdc/gxeXrlRxbDixZM15rup0azRWBy46y9dxOkle3KoTAv9O8p0E
         gcFLPVPGtCBj+dttDu77OEa63hM1uh7FPOESSKaMOB91H5vS0Bm1CZYuouJcqtQNkV6R
         lhiADU/AdbELx6h+vcOpSjfiIdDLjZ2qQxS3G1kMiqJup6yj+8yby05+N7BHoC0Vne3B
         s0qsFwLuKF8IdLlW4Ko2y20sRuHWzyCXhUDhp6fLduprtW4yDe7T1MFPkgmE1fLdxqBM
         LgboPp5zvUsQ7hQH9Anl/GtwP+SGxDobZaID0dvdyXF3Uc/mbWOIc8cOCnTkDyPrQr/o
         KOAA==
X-Forwarded-Encrypted: i=1; AJvYcCWQQJPwPhmNjVoSJJfioGcxrIm0JjmJD8RfcoGQOIldvF9mDOa+47JmcuaHp1FBWFPawof31CqFdU1Rlf0i+khx@lists.infradead.org
X-Gm-Message-State: AOJu0YwChTC+a6CVEmmaol0JGVb+7tzfnOdxk+VF/6J8kMh5jq7gzKoQ
	Arr47v1HvHYw8kwnNfq/5y/5eZ0ZzqWvcz159pp5ZGBZsmph2za7
X-Gm-Gg: ASbGnctXe3uIXXIxtyqYVF11OkXFHyHpNtJ/C3OjfGuFYlcVxoxN1a6/A4dFXGqmy51
	zUNJW0gl+93rPeKFAnYy+JS0cpKZzhgMdPRSrkE7Lgz9Ct7jXCDXt/1slGN1HL7o6Oea7YBTIls
	oH52TvHCA7Zyh92haYeqYcdaPjUWujuNkydH5kVF5EuPjZkKvbpF/UGCaXAL5LHM1vp3Zq2EQ7h
	TcIEe9bEiYIBkP0v3GD9fbWX9XduJPqg3iPlPaIvaCl3G7XzffMticO66wK2T9t1Ka4xQsNrDJ2
	cblRJSl0c7gzh3umQ6vzmasypPun1duy2NB1P5zPPJ8HLuu7
X-Google-Smtp-Source: AGHT+IFJVniNBPju7U0+Zkvo7cT0yiY6E+Oe3yG3cuVYvnJhnTUke2U3Jt13V/c1QPsHTlV77FcZzw==
X-Received: by 2002:a05:600c:1c94:b0:439:7c0b:13f6 with SMTP id 5b1f17b1804b1-43bd2ae52d7mr27450545e9.31.1741185851384;
        Wed, 05 Mar 2025 06:44:11 -0800 (PST)
Received: from eichest-laptop.. ([178.197.169.96])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-43bd435cd8csm19314375e9.40.2025.03.05.06.44.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Mar 2025 06:44:11 -0800 (PST)
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
Subject: [PATCH v2 2/2] phy: freescale: imx8m-pcie: assert phy reset and perst in power off
Date: Wed,  5 Mar 2025 15:43:16 +0100
Message-ID: <20250305144355.20364-3-eichest@gmail.com>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20250305144355.20364-1-eichest@gmail.com>
References: <20250305144355.20364-1-eichest@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_064413_768126_0AD4F015 
X-CRM114-Status: GOOD (  11.45  )
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
 drivers/phy/freescale/phy-fsl-imx8m-pcie.c | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
index 5b505e34ca364..7355d9921b646 100644
--- a/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
+++ b/drivers/phy/freescale/phy-fsl-imx8m-pcie.c
@@ -156,6 +156,16 @@ static int imx8_pcie_phy_power_on(struct phy *phy)
 	return ret;
 }
 
+static int imx8_pcie_phy_power_off(struct phy *phy)
+{
+	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
+
+	reset_control_assert(imx8_phy->reset);
+	reset_control_assert(imx8_phy->perst);
+
+	return 0;
+}
+
 static int imx8_pcie_phy_init(struct phy *phy)
 {
 	struct imx8_pcie_phy *imx8_phy = phy_get_drvdata(phy);
@@ -176,6 +186,7 @@ static const struct phy_ops imx8_pcie_phy_ops = {
 	.init		= imx8_pcie_phy_init,
 	.exit		= imx8_pcie_phy_exit,
 	.power_on	= imx8_pcie_phy_power_on,
+	.power_off	= imx8_pcie_phy_power_off,
 	.owner		= THIS_MODULE,
 };
 
-- 
2.45.2


