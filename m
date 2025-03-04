Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412D2C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 16:15:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3/SuLpIDOGIzG4acCvS1Ea6XeYeptoIArOdxdaJ6WxQ=; b=d3znpB5FZykDK8aaxkrx/P7bFw
	wuCKC5ghIN+Ur8HPx91isY9GUH603VAGgZS2QM+G2CqXR9pE4CNEjwnqgPjHyVlW/gt4QK+lw6jzQ
	HKhQN6ZnY1K/TejC5TDUNLKxcjfj6u0MQxl9pd1RXE8TYrMqc79BHJqW/UA0ApNVmQ49YChraNrQP
	Qm72o7spVmwMipWFO1qrodlgZedryPHWoqHHcgm1i8ua6peo0o3m9E11csdtSStgSbjKGZ+MXeWrL
	lCkGhjPVk6T6j8wlvnRlRwnGi+2aqNpxBeumzS7q4ci26SRjq7OAJ1+UUWDuqi8q3oiv+yYpqPSnE
	DgZL4moQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpUuy-00000005NhZ-1PTl;
	Tue, 04 Mar 2025 16:14:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU1U-00000005ALz-45nd;
	Tue, 04 Mar 2025 15:17:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3/SuLpIDOGIzG4acCvS1Ea6XeYeptoIArOdxdaJ6WxQ=; b=EBhsXwj4oJAldmQg6RPZQeIFjv
	hWwMG5GzvfczPNrZc6l5tY5xwGKQ8tDSduoqzukfzludbTaMlYSIKAgrpaHaDJRaUoQFX016R44o+
	wROXnsaV4Cn4Vn2+G6fdaARQv30Pe9J9Gf+MnxBSAFSqtNo/3+AGBYJtUSTulPgVXplv7znWKFRwt
	lSwNJtrrEvDfXal6OX4LznsMaSDo8r7ne9FALGeAeZrq9VhAO6BakF+GSKIuyXY8POmvk/IQuST8D
	sYm8bm9DjG2oUnQrf5qeQEAG+D0LAH1XfGTfW5siw7w7JCWpPfPHV3V9SEJYsIfQOQIxzZp1kxPBm
	/XkNfI9Q==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU1P-000000003oO-0zW1;
	Tue, 04 Mar 2025 15:17:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101445;
	bh=sk4Gc1vWzvy1bYpW1lA/DEQpt1YQ8vmHPR+8OGEM/CA=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=CsTYzapKORGbDcvcmNqUTdvhzFgGoG9Dl0vtI2BOz7JURA6wQ8p7tWWkkZ4Bf5dRG
	 r33aJuTnsNiNQMNVPEskd5tLMhKcG7Tw2pepxEO4HxsiOERJrmrmgk3Nnv4SniSF4o
	 wCDWoGHQMOuoUa3BAPOoF1oWjDQwxOuavT3UyXX/qPc55M8lGhz5ZU3EKKKSt01v1e
	 DJ744KdalxAOCKvpQU2NPB1DfGt+0mvHeG1P+IxRBEAOD7m7xeH7mR2nZinJuofCMv
	 CM2jByz5f3dTP2sP8mAVfA7fkOKZ3QdTw6s3tzvm8D2DrTcFnm0/X6gf5CCrSS7LVO
	 sNOp8KGznSzQA==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 408CD17E07F8;
	Tue,  4 Mar 2025 16:17:20 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:55 -0300
Subject: [PATCH v3 14/20] ASoC: mediatek: mt6359-accdet: Always use eint
 detect mode 4
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-14-5b0eafc29f5b@collabora.com>
References: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
In-Reply-To: <20250304-mt6359-accdet-dts-v3-0-5b0eafc29f5b@collabora.com>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>, 
 Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, linux-sound@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-pm@vger.kernel.org, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_151730_130096_7A9B4D10 
X-CRM114-Status: GOOD (  15.56  )
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

The driver currently reads a mediatek,eint-detect-mode property from DT,
which determines certain register configurations. Since there are no
users of the property, it doesn't directly describe the hardware, and
the default value (4) is known to work across multiple boards, remove
the handling for this property and always assume mode 4 is used. The
property can be properly introduced in the binding in the future if
different boards actually need different configurations.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 208 +++++++++++++--------------------------
 sound/soc/codecs/mt6359-accdet.h |   1 -
 2 files changed, 70 insertions(+), 139 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 6728f1018c992fc9d4e4133dbaf091d256567683..83e65b6d5845dea00a8a77d68df4b7df1f62a87c 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -81,31 +81,22 @@ static void recover_eint_setting(struct mt6359_accdet *priv);
 
 static unsigned int adjust_eint_analog_setting(struct mt6359_accdet *priv)
 {
-	if (priv->data->eint_detect_mode == 0x3 ||
-	    priv->data->eint_detect_mode == 0x4) {
-		/* ESD switches off */
-		regmap_update_bits(priv->regmap,
-				   RG_ACCDETSPARE_ADDR, 1 << 8, 0);
-	}
-	if (priv->data->eint_detect_mode == 0x4) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* enable RG_EINT0CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0CONFIGACCDET_ADDR,
-					   RG_EINT0CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT0CONFIGACCDET_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* enable RG_EINT1CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT1CONFIGACCDET_ADDR,
-					   RG_EINT1CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT1CONFIGACCDET_SFT));
-		}
-		/*select 500k, use internal resistor */
-		regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
-				   RG_EINT0HIRENB_MASK_SFT,
-				   BIT(RG_EINT0HIRENB_SFT));
+	/* ESD switches off */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR, 1 << 8, 0);
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* enable RG_EINT0CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
+				   RG_EINT0CONFIGACCDET_MASK_SFT,
+				   BIT(RG_EINT0CONFIGACCDET_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* enable RG_EINT1CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT1CONFIGACCDET_ADDR,
+				   RG_EINT1CONFIGACCDET_MASK_SFT,
+				   BIT(RG_EINT1CONFIGACCDET_SFT));
 	}
+	/*select 500k, use internal resistor */
+	regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
+			   RG_EINT0HIRENB_MASK_SFT, BIT(RG_EINT0HIRENB_SFT));
 	return 0;
 }
 
@@ -123,18 +114,14 @@ static unsigned int adjust_eint_digital_setting(struct mt6359_accdet *priv)
 				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT, 0);
 	}
 
-	if (priv->data->eint_detect_mode == 0x4) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* set DA stable signal */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* set DA stable signal */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT1_CEN_STABLE_MASK_SFT, 0);
-		}
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* set DA stable signal */
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT0_CEN_STABLE_MASK_SFT, 0);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* set DA stable signal */
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT1_CEN_STABLE_MASK_SFT, 0);
 	}
 	return 0;
 }
@@ -159,27 +146,19 @@ static unsigned int mt6359_accdet_jd_setting(struct mt6359_accdet *priv)
 
 static void recover_eint_analog_setting(struct mt6359_accdet *priv)
 {
-	if (priv->data->eint_detect_mode == 0x3 ||
-	    priv->data->eint_detect_mode == 0x4) {
-		/* ESD switches on */
-		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
-				   1 << 8, 1 << 8);
-	}
-	if (priv->data->eint_detect_mode == 0x4) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* disable RG_EINT0CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0CONFIGACCDET_ADDR,
-					   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* disable RG_EINT1CONFIGACCDET */
-			regmap_update_bits(priv->regmap,
-					   RG_EINT1CONFIGACCDET_ADDR,
-					   RG_EINT1CONFIGACCDET_MASK_SFT, 0);
-		}
-		regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
-				   RG_EINT0HIRENB_MASK_SFT, 0);
+	/* ESD switches on */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR, 1 << 8, 1 << 8);
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* disable RG_EINT0CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT0CONFIGACCDET_ADDR,
+				   RG_EINT0CONFIGACCDET_MASK_SFT, 0);
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* disable RG_EINT1CONFIGACCDET */
+		regmap_update_bits(priv->regmap, RG_EINT1CONFIGACCDET_ADDR,
+				   RG_EINT1CONFIGACCDET_MASK_SFT, 0);
 	}
+	regmap_update_bits(priv->regmap, RG_EINT0HIRENB_ADDR,
+			   RG_EINT0HIRENB_MASK_SFT, 0);
 }
 
 static void recover_eint_digital_setting(struct mt6359_accdet *priv)
@@ -193,37 +172,30 @@ static void recover_eint_digital_setting(struct mt6359_accdet *priv)
 				   ACCDET_EINT1_M_SW_EN_ADDR,
 				   ACCDET_EINT1_M_SW_EN_MASK_SFT, 0);
 	}
-	if (priv->data->eint_detect_mode == 0x4) {
+	if (priv->caps & ACCDET_PMIC_EINT0) {
 		/* enable eint0cen */
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* enable eint0cen */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
-					   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* enable eint1cen */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_DA_STABLE_ADDR,
-					   ACCDET_EINT1_CEN_STABLE_MASK_SFT,
-					   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
-		}
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT0_CEN_STABLE_MASK_SFT,
+				   BIT(ACCDET_EINT0_CEN_STABLE_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* enable eint1cen */
+		regmap_update_bits(priv->regmap, ACCDET_DA_STABLE_ADDR,
+				   ACCDET_EINT1_CEN_STABLE_MASK_SFT,
+				   BIT(ACCDET_EINT1_CEN_STABLE_SFT));
 	}
 
-	if (priv->data->eint_detect_mode != 0x1) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			/* enable inverter */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			/* enable inverter */
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
-		}
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		/* enable inverter */
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		/* enable inverter */
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
 	}
 }
 
@@ -534,13 +506,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 
 	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
-	ret = of_property_read_u32(node, "mediatek,eint-detect-mode",
-				   &priv->data->eint_detect_mode);
-	if (ret) {
-		/* eint detection mode equals to EINT HW Mode */
-		priv->data->eint_detect_mode = 0x4;
-	}
-
 	ret = of_property_read_u32(node, "mediatek,eint-num", &tmp);
 	if (ret)
 		tmp = 0;
@@ -592,31 +557,16 @@ static void config_digital_init_by_mode(struct mt6359_accdet *priv)
 	/* enable PWM */
 	regmap_write(priv->regmap, ACCDET_CMP_PWM_EN_ADDR, 0x67);
 	/* enable inverter detection */
-	if (priv->data->eint_detect_mode == 0x1) {
-		/* disable inverter detection */
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-					   0);
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-					   0);
-		}
-	} else {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			regmap_update_bits(priv->regmap,
-					   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
-					   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
-					   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
-		}
+	if (priv->caps & ACCDET_PMIC_EINT0) {
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT0_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT0_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT0_INVERTER_SW_EN_SFT));
+	} else if (priv->caps & ACCDET_PMIC_EINT1) {
+		regmap_update_bits(priv->regmap,
+				   ACCDET_EINT1_INVERTER_SW_EN_ADDR,
+				   ACCDET_EINT1_INVERTER_SW_EN_MASK_SFT,
+				   BIT(ACCDET_EINT1_INVERTER_SW_EN_SFT));
 	}
 
 	if (priv->data->hp_eint_high) {
@@ -649,28 +599,10 @@ static void config_eint_init_by_mode(struct mt6359_accdet *priv)
 	regmap_update_bits(priv->regmap, RG_NCP_PDDIS_EN_ADDR,
 			   RG_NCP_PDDIS_EN_MASK_SFT, BIT(RG_NCP_PDDIS_EN_SFT));
 
-	if (priv->data->eint_detect_mode == 0x1 ||
-	    priv->data->eint_detect_mode == 0x2 ||
-	    priv->data->eint_detect_mode == 0x3) {
-		if (priv->caps & ACCDET_PMIC_EINT0) {
-			regmap_update_bits(priv->regmap,
-					   RG_EINT0CONFIGACCDET_ADDR,
-					   RG_EINT0CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT0CONFIGACCDET_SFT));
-		} else if (priv->caps & ACCDET_PMIC_EINT1) {
-			regmap_update_bits(priv->regmap,
-					   RG_EINT1CONFIGACCDET_ADDR,
-					   RG_EINT1CONFIGACCDET_MASK_SFT,
-					   BIT(RG_EINT1CONFIGACCDET_SFT));
-		}
-	}
-
-	if (priv->data->eint_detect_mode != 0x1) {
-		/* current detect set 0.25uA */
-		regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
-				   0x3 << RG_ACCDETSPARE_SFT,
-				   0x3 << RG_ACCDETSPARE_SFT);
-	}
+	/* current detect set 0.25uA */
+	regmap_update_bits(priv->regmap, RG_ACCDETSPARE_ADDR,
+			   0x3 << RG_ACCDETSPARE_SFT,
+			   0x3 << RG_ACCDETSPARE_SFT);
 	regmap_write(priv->regmap, RG_EINTCOMPVTH_ADDR,
 		     val | priv->data->eint_comp_vth << RG_EINTCOMPVTH_SFT);
 }
diff --git a/sound/soc/codecs/mt6359-accdet.h b/sound/soc/codecs/mt6359-accdet.h
index 287201eebe0330fa170093fd6192bf5694c30469..ff5cd6ea1b06f045b6e1b9f6bc53ef80d78e3b92 100644
--- a/sound/soc/codecs/mt6359-accdet.h
+++ b/sound/soc/codecs/mt6359-accdet.h
@@ -54,7 +54,6 @@ struct dts_data {
 	unsigned int mic_vol;
 	unsigned int mic_mode;
 	bool hp_eint_high;
-	unsigned int eint_detect_mode;
 	unsigned int eint_comp_vth;
 };
 

-- 
2.48.1


