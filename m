Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFD2C36000
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 14:14:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sbyZcoaajFlmts2XUhsZjMQOjAP2jAbADTedozzwVLU=; b=b5O7tjZnIDdrTJMRdS8mLbH1Mm
	sEvBQrS/wWq3Ymt54QoxcKkcl6vFTSLvva7zAhr6olG83oV7HIl9h3ixNDdmrnB7pLT2Alwy4vWL5
	1IR7tLbtcIcojrPyqZC7Mz3mac/CZDlAk3sV4r/FJiGwORnFpJ5ElRSrVCRMeSaZD/jLF767/EDrL
	/tYliQDFbnsf7HzsDHKgrBYH3DCUUY0MFxmCGoyKPFXw6EtSQyQPLcVLxrxIaS9V5IzQ5aIcVTD2X
	c7LnxJ/WOORCEuKj5p67EUjt1ZGG4gqwzjNPjVutwN9J7o/bb09HGZlEKGe8ehvMA1BrTH8m8z2D8
	tXv6k+Yw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tvd8j-0000000F3md-0VOH;
	Fri, 21 Mar 2025 14:14:25 +0000
Received: from mail-wr1-x432.google.com ([2a00:1450:4864:20::432])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvcty-0000000F0YH-2n2p;
	Fri, 21 Mar 2025 13:59:11 +0000
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-3912e96c8e8so1236168f8f.2;
        Fri, 21 Mar 2025 06:59:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742565549; x=1743170349; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sbyZcoaajFlmts2XUhsZjMQOjAP2jAbADTedozzwVLU=;
        b=UgFpvNyzKBlBAV2Hp9LRWI/lbGlYdd8vam7/MD8kgB0hZIORO4ziDormdH2KzuVLFB
         Hgdbcv5tbOo3rajp4sVIdKOQMXtFbylJ9+j6yOYtlretFq+E1pV+odA9hFc8kOlAOAAc
         58pNFi0yQIuUWyz03ZMIVx9sAEeMixl9tk2dYURG4FbbpG78QLx4d5HT8ig0q68nongo
         gLvTIOSz+O2fv1gaD3XEX4/MgRWX0UG9tGXQ302IbUbiGjW8tDus30GpAxTsNxIFfpzi
         lI0WDSv3TVQexDe1q4iXGOPU5GRI/wuANpzPO1QiOTnM7SunIf1ervhHbmGMwXUOIf44
         olLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742565549; x=1743170349;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sbyZcoaajFlmts2XUhsZjMQOjAP2jAbADTedozzwVLU=;
        b=KjvPFcBmZyrLzPdT91Y/ELcQWuTwGMQQXHPb6d2BZQ9m+B2g/5lfBE3S640mnsM0CT
         6LRDAJoALz1gE+E/ec9B7iFNL2XiMw0fx18Y1OC3YjhOF2QMZGwpop34UCMhl/6fScvH
         h1BYi+Kqqe5kEnKhCyyz/lh7H4brXy8Lthp8sQBGckErS4kOq/GoGi+5LEeOANlsbF93
         WXibITayRgIvqhoLbuXZ6GPgVXX6S6gQmMuiamsZlelQC1iOzgVFTLLTFAxxLQ2gNtT5
         faIb8qxOraqgc/oB3yMEebFTk+JgiWiUk9zyd0nAjZaDY2RpvUmtMc4akL+9f8czb4xR
         8ghQ==
X-Forwarded-Encrypted: i=1; AJvYcCWqM1/zO5fEjdbNe68bQR0UZRAHDatoKsLnSjXoMn+4uYZJl6Ew4DS4JJkmwkvOQQ3UPVgyJx5fCk2b@lists.infradead.org, AJvYcCXECu9NQP6NwyWU5m84ECYnCz13zDlVbJGHC+rZ2CGV/gwlvU/vjH6M7Fg4RP4jZlC5z6xhZBXsJtVPo3AkixZu@lists.infradead.org
X-Gm-Message-State: AOJu0Yyh7oqWkMLUTLeVGMH1ew60wlJXI3A9a6wgvo5xDuCKZDmXEpXL
	nFh6DkwxFlH0wPlrS6cPQhBtSmNDn2S9baiujBi91NouovOOwreH
X-Gm-Gg: ASbGncvMzq5/lFL8Lyx9cohPV1xWdG4U9d4PMU2a1Cw4jYB0P6AQw7niaRnnJkbGtOG
	SswR1Ja8EMg5MaorKUOZAs6wtfWqPJgTPs6+XIlXbNqgYalOTun/c1w74jZtd6rbf276x+xb4zg
	2clOi2TReZ/0QhGInfSAWqJp2xO8GNNYa/7u3kyFRfSjkVwYZMnISPUnnlxbbFgqxJk6xpxMEHW
	OptcW0jOaxqcDi8MRMn9Tpdv8tvW3D1/0hRWz+c6TjZAqKNrWXYbjzNCeJYS9NrL1X6BENU20TY
	iu2KBBbiqjt6T6bAfDhUqwlBTULiiYMevaQIPMNV0cJ2Pv1FhWtJeP2A5EWBzagt/3PGxUBqTC+
	57/ji9sjROufi6EytxTON
X-Google-Smtp-Source: AGHT+IH5K8T4c9k4ekIQnpelX9sEZXchTsHL4Ta9XthUbbS4ibsFVFojmfNk/OO/KF7tgKLwgcCcCA==
X-Received: by 2002:a05:6000:1a8e:b0:391:4559:8773 with SMTP id ffacd0b85a97d-3997f938993mr3360194f8f.51.1742565549242;
        Fri, 21 Mar 2025 06:59:09 -0700 (PDT)
Received: from ivaylo-T580.. (91-139-201-119.stz.ddns.bulsat.com. [91.139.201.119])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3997f9e6651sm2437162f8f.75.2025.03.21.06.59.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 Mar 2025 06:59:08 -0700 (PDT)
From: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
To: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Abel Vesa <abel.vesa@linaro.org>
Cc: linux-arm-msm@vger.kernel.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 08/10] phy: phy-snps-eusb2: refactor reference clock init
Date: Fri, 21 Mar 2025 15:58:52 +0200
Message-ID: <20250321135854.1431375-9-ivo.ivanov.ivanov1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
References: <20250321135854.1431375-1-ivo.ivanov.ivanov1@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_065910_708486_5D77C647 
X-CRM114-Status: GOOD (  12.18  )
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

Instead of matching frequencies with a switch and case, introduce
a table-based lookup. This improves readability, reduces redundancy,
and makes it easier to extend support for additional frequencies in
the future.

Signed-off-by: Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>
---
 drivers/phy/phy-snps-eusb2.c | 61 +++++++++++++++++++-----------------
 1 file changed, 32 insertions(+), 29 deletions(-)

diff --git a/drivers/phy/phy-snps-eusb2.c b/drivers/phy/phy-snps-eusb2.c
index 1e7e75bbc..4ca11860a 100644
--- a/drivers/phy/phy-snps-eusb2.c
+++ b/drivers/phy/phy-snps-eusb2.c
@@ -192,44 +192,47 @@ static void qcom_eusb2_default_parameters(struct snps_eusb2_hsphy *phy)
 				    FIELD_PREP(PHY_CFG_TX_HS_XV_TUNE_MASK, 0x0));
 }
 
+struct snps_eusb2_ref_clk {
+	unsigned long freq;
+	u32 fsel_val;
+	u32 div_7_0_val;
+	u32 div_11_8_val;
+};
+
+static const struct snps_eusb2_ref_clk qcom_eusb2_ref_clk[] = {
+	{ 19200000, FSEL_19_2_MHZ_VAL, DIV_7_0_19_2_MHZ_VAL, DIV_11_8_19_2_MHZ_VAL },
+	{ 38400000, FSEL_38_4_MHZ_VAL, DIV_7_0_38_4_MHZ_VAL, DIV_11_8_38_4_MHZ_VAL },
+};
+
 static int qcom_eusb2_ref_clk_init(struct snps_eusb2_hsphy *phy)
 {
+	const struct snps_eusb2_ref_clk *config = NULL;
 	unsigned long ref_clk_freq = clk_get_rate(phy->ref_clk);
 
-	switch (ref_clk_freq) {
-	case 19200000:
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
-					    FSEL_MASK,
-					    FIELD_PREP(FSEL_MASK, FSEL_19_2_MHZ_VAL));
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
-					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
-					    DIV_7_0_19_2_MHZ_VAL);
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
-					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
-					    DIV_11_8_19_2_MHZ_VAL);
-		break;
-
-	case 38400000:
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
-					    FSEL_MASK,
-					    FIELD_PREP(FSEL_MASK, FSEL_38_4_MHZ_VAL));
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
-					    PHY_CFG_PLL_FB_DIV_7_0_MASK,
-					    DIV_7_0_38_4_MHZ_VAL);
-
-		snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
-					    PHY_CFG_PLL_FB_DIV_11_8_MASK,
-					    DIV_11_8_38_4_MHZ_VAL);
-		break;
+	for (int i = 0; i < ARRAY_SIZE(qcom_eusb2_ref_clk); i++) {
+		if (qcom_eusb2_ref_clk[i].freq == ref_clk_freq) {
+			config = &qcom_eusb2_ref_clk[i];
+			break;
+		}
+	}
 
-	default:
+	if (!config) {
 		dev_err(&phy->phy->dev, "unsupported ref_clk_freq:%lu\n", ref_clk_freq);
 		return -EINVAL;
 	}
 
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_HS_PHY_CTRL_COMMON0,
+				    FSEL_MASK,
+				    FIELD_PREP(FSEL_MASK, config->fsel_val));
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_2,
+				    PHY_CFG_PLL_FB_DIV_7_0_MASK,
+				    config->div_7_0_val);
+
+	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
+				    PHY_CFG_PLL_FB_DIV_11_8_MASK,
+				    config->div_11_8_val);
+
 	snps_eusb2_hsphy_write_mask(phy->base, QCOM_USB_PHY_CFG_CTRL_3,
 				    PHY_CFG_PLL_REF_DIV, PLL_REF_DIV_VAL);
 
-- 
2.43.0


