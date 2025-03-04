Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 859F5C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 17:14:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6H+V4x7uHeq/HJk0dDgNt5bXZ+Akgq6rofFNm1ylbII=; b=tuntuB2ROY8O0vMV4t0USwPDAy
	eHr35+NiUS1434RgLmTF1Gzfc4rrLlGkSrAXMpdVSnhRydhpO1PFxwA4GesTBSdperiIxp50THhi1
	cBqY/tb3kE2C1JxgTgmhtPS74zd7I7If/BpKqE9DU6z3sdd6N1nbseiaGFXaWr6AnMjiFXmW5wZff
	RAQi3cpVnCNuFQPGMljGEbDkLA4xSzmEMa+QYoqTyyTYRBhWpsGcr+m5UlgROH4lh4gC9764AQZqS
	iFwSmO0IqWA9I4JYg/JI+l/HTJH/rz6OFbN6/pGIFeO10pL3j4biJMgw/SzwWDt2pxCFX8QCkrCEF
	/LwZgtKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpVqu-00000005ZzH-1Xwy;
	Tue, 04 Mar 2025 17:14:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU0v-00000005AF7-3A0i;
	Tue, 04 Mar 2025 15:16:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=6H+V4x7uHeq/HJk0dDgNt5bXZ+Akgq6rofFNm1ylbII=; b=pwsV8kLUBFa/R0Fn96AhQGnPUa
	T4/qv6XmlJX4CYRJQVIKK+Q1uP6Y5OvLi8Vp3QjHGrGzI6JcQC1jYlVBaOlUdTG+jAHVLxoYcfPk5
	UxFvefNTNzF2yHT9yBgPpNp8WgOEkhi/RKwHl8Rtw5x4Yg+ZkGK3P2tW4tPmOPVGUnNrjtD0DYIZK
	M/qkDFOhMRZV2VgFtXn0hxOAefCI/YGmTTF7G7Puas7yG+0pEJUl3ne7JN6SrdILWA3tx1f14gaQT
	T3VtIEJlxCPtStGnySxJxxzxKugigAemBP36X+2cZXUPMoig4QCXeJw9A9dhIAeAZtaxzJ75+a2Fb
	bmDAtiHA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpU0s-000000003hp-0DMq;
	Tue, 04 Mar 2025 15:16:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741101406;
	bh=pxGZiXC6za5vFQ3V/0fw9IlCjpRVWVwiCZ21S4dEkDI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=obk45PT1hiFCwR4gOShJURghXzyJM+ZaDykUZb+JuDXWEwxjv2z5kNky2Acb68W6W
	 x5kqfPgxPrGUUyX8UYsFTFR5YC0LYdKXAqTBHVrlj1nwhBMwqx9wKES+jAuuSmTm85
	 Q+7B6MSyl/rsClN8FoRGDbJGjgrp2ttBMkWr0QwZY26CfXDbTzY1ZoVc13M3uZKl8V
	 c8JeCJKv+9G8NagN8krC0H6+rwdNNg2D6xVT4elSQs+hP6nHdL7lH2srzDG0tnx6CD
	 fw4HA+/I1EEBGq1G+W3TOO3ipEgx1ewsFTrMOGo4uc6HLo5CpmE5gPNG57G/IrdOAs
	 8w7xdUWinObWw==
Received: from [192.168.0.47] (unknown [IPv6:2804:14c:1a9:53ee::1001])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A1DEC17E07F8;
	Tue,  4 Mar 2025 16:16:41 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Tue, 04 Mar 2025 12:15:48 -0300
Subject: [PATCH v3 07/20] ASoC: mediatek: mt6359-accdet: Drop dead code for
 EINT/GPIO IRQ handling
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250304-mt6359-accdet-dts-v3-7-5b0eafc29f5b@collabora.com>
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
X-CRM114-CacheID: sfid-20250304_151654_684271_B10EF27B 
X-CRM114-Status: GOOD (  12.74  )
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

The ACCDET supports two modes for IRQ generation: PMIC EINT or AP GPIO,
which in principle could be configured through a DT property. However
this DT property has no user nor is documented in a binding, and the
driver only implements the PMIC EINT case, so drop the unused code
intended to handle both cases.

Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 sound/soc/codecs/mt6359-accdet.c | 20 +++-----------------
 1 file changed, 3 insertions(+), 17 deletions(-)

diff --git a/sound/soc/codecs/mt6359-accdet.c b/sound/soc/codecs/mt6359-accdet.c
index 1d4481109f6e4f473610e0797c9d3c636bdf12cf..ce8a5e64e0b9ca508124043ca1f93aaa3cc5f9a0 100644
--- a/sound/soc/codecs/mt6359-accdet.c
+++ b/sound/soc/codecs/mt6359-accdet.c
@@ -31,9 +31,6 @@
 #define REGISTER_VAL(x)	((x) - 1)
 
 /* mt6359 accdet capability */
-#define ACCDET_PMIC_EINT_IRQ		BIT(0)
-#define ACCDET_AP_GPIO_EINT		BIT(1)
-
 #define ACCDET_PMIC_EINT0		BIT(2)
 #define ACCDET_PMIC_EINT1		BIT(3)
 #define ACCDET_PMIC_BI_EINT		BIT(4)
@@ -448,8 +445,7 @@ static void mt6359_accdet_jd_work(struct work_struct *work)
 		mt6359_accdet_recover_jd_setting(priv);
 	}
 
-	if (priv->caps & ACCDET_PMIC_EINT_IRQ)
-		recover_eint_setting(priv);
+	recover_eint_setting(priv);
 	mutex_unlock(&priv->res_lock);
 }
 
@@ -580,14 +576,6 @@ static int mt6359_accdet_parse_dt(struct mt6359_accdet *priv)
 
 	priv->data->hp_eint_high = of_property_read_bool(node, "mediatek,hp-eint-high");
 
-	ret = of_property_read_u32(node, "mediatek,eint-use-ap", &tmp);
-	if (ret)
-		tmp = 0;
-	if (tmp == 0)
-		priv->caps |= ACCDET_PMIC_EINT_IRQ;
-	else if (tmp == 1)
-		priv->caps |= ACCDET_AP_GPIO_EINT;
-
 	ret = of_property_read_u32(node, "mediatek,eint-detect-mode",
 				   &priv->data->eint_detect_mode);
 	if (ret) {
@@ -902,10 +890,8 @@ static void mt6359_accdet_init(struct mt6359_accdet *priv)
 				   0x3 << RG_ANALOGFDEN_SFT);
 	}
 
-	if (priv->caps & ACCDET_PMIC_EINT_IRQ) {
-		config_eint_init_by_mode(priv);
-		config_digital_init_by_mode(priv);
-	}
+	config_eint_init_by_mode(priv);
+	config_digital_init_by_mode(priv);
 }
 
 int mt6359_accdet_enable_jack_detect(struct snd_soc_component *component,

-- 
2.48.1


