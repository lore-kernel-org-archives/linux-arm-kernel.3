Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F2F9606D807
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 10:55:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=rmIgVsTZ;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cR0zOz0f
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=aFHl9iBgx/Mfi+s4BZBS+ijcqSNzZQXuaxbMC9IotGE=; b=rmIgVsTZ+3KGQC
	DWaQIPDxRt2E9dyWmGyKExlDQc+vWSCPS5Yk5KplVqWrn2bxBO9y5XQBnWXU+T8lUAjUgdmj1dKxo
	68hsQCugJvqcbRLMUt084zzs/cSBqpmGESo5Nq+XXLju8pBKo3Fq64XX3O8W04IlEsPViZQSd9xDE
	+PsOWYr7HTMF2IhVy/UEzMET7Vdx5svBxVifSmdi/GYQgvzwe7riJ/AVTuIw4Es2gCyhgEBGf3voK
	wqloeuGf/cbw/kXgbIjl1SBwuDQ0us+s0XRAY2JpUOAPKaoV1/2CzBrYm2lvj5BW3OaRgWXThkWnY
	BTuZosKGGOszITAJW+Dw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv86-00000008W3R-36yh;
	Thu, 05 Nov 2026 10:55:38 +0000
Received: from mail-wm1-x329.google.com ([2a00:1450:4864:20::329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOv7n-00000008Vj2-2pFm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 05 Nov 2026 10:55:25 +0000
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15823085e9.3
        for <linux-arm-kernel@lists.infradead.org>; Thu, 05 Nov 2026 02:55:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793876118; x=1794480918; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=aFHl9iBgx/Mfi+s4BZBS+ijcqSNzZQXuaxbMC9IotGE=;
        b=cR0zOz0f4m6iCX08PJlryI7CNPiBoYZdFEytdlv5Us18X6AcD8rpG+13zd1Vj4ECho
         VMD8n4vGW+4rfgYJNsFi+9WPlrefU7kXGE+REQ7bcX+3JP9/+av1JPfDpeeGUR0Y3VfS
         HTo0HFdU/IVYKY6NS4tFo+fwepNpHYZQpUX2DYlgX6i3Zd5V8SmajzgJsqql32+fvdNU
         2B/GsXOQiTY0Z4CW7hpAlNOO+8gJ7I/GCnfW/7l4S8LKra6VtGZcysXfYNM5T9sdrnue
         uCpeCKCORTgtsNZW4DxDclBdwIyGDYtpMmEugSs9ARE2aVaPfV48FO64OWjHlZ3o3Ak8
         Z+LA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793876118; x=1794480918;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=aFHl9iBgx/Mfi+s4BZBS+ijcqSNzZQXuaxbMC9IotGE=;
        b=RpjAK0HRIFh00ZJYkiTyHYwNyxt/5BtRNv4iF1xlS5kFZ+O0z4xYYrjsCCBjKO0r7L
         qEJwzrcqAioFzmPgCNjal/n6aJzZc8w/3PiNYwlFFHBvAM/NmJm7/6te3cbV03+8Al6d
         l6Vdya0zLY75zZ3xifTkbNgSrp90D036eeGt04kTOQtGuGD3YupV5+Qbxy5D6sAkOKai
         VKKOXde5qPdO7g+7AbF0P8K35MHOjGwnjoNqCFozjvDZ/qkt5py9a4HAULkCc7/U160i
         k13ehcP4RKGsyC5OxAyEJmTYIDogsM05uSKcHRSSi5QyYKcSEm5Tp0zIRWZ2xEWM0vqd
         ymkA==
X-Forwarded-Encrypted: i=1; AKwUvBwaEXwsSqprKTGYdP4S8ZTezcF5G3MO799EEtXRvLKed0D/HmulRPhvXciDdkCqqHmJat5/Xm0ZndgU1kfUjSEA@lists.infradead.org
X-Gm-Message-State: APuU4Z9ojy1dr86JoIweZI5+e2nCNn9SWXUpXSf6BhDXKR6+iwaKI0lv
	5mTO+lZrM/B4FumVSL+yNmzb1Krs2X2eRgzPW/W6vYojbca+Wdt1/Jwb
X-Gm-Gg: AYBFou1P1cSeJk0Wd0DsYpSHa3YdereCMRfcXwBbeTaGewwnaV3+JcBxxozd1AxfSY9
	g0tKLBtoB0GAsgR2lORbsVHDuwCFoOysKctO5h4/jrcRBrfmoYa0MEkLKJdy5eX5S2QG/T3T1hk
	M3pD7U+n/nUjuXdrvcyUAnJufa1pugZESXEGd/wgR6qCiQPhXJDwk3ZQilMyv6fZcaKfr0TwHaq
	/zMsNv+X6OvNrl1GmPJvL3y89ZGf1NqSV9TTkEOmdaUyrDs6P4WUnD3SQP41p8FuXa0/7olUWTv
	7f03hEXp3HsxzYjt6NHc6OAwt2k5yGDLk++KG6Jrb4fuQlxegB8NqRYAtiHAcQu8msU+q8W+aE/
	ZeMzcyqNxvHR+T2tmeX48aPDJ12p0eGk8lqJ1/Pz0buJ0z7eElPQSn9Yqw2KdUjrHCDwGHZplOs
	82B0rfjRzN1UrFvOmot8mgtelWRJes4FHOEtQl3Pn8LVubul9yIkTnOzBxEdVmKIzyxjwRQukZa
	wQlbXeE1shdJg2ydHhcTnmiC8nxNmCTpdkrU6D20kNhorcRa0u2Cr2v0Hb3aZxLPhizoLPe2tM4
	NesDjj7gQBb59NUTiC9qn4b0gS8EoUGXYOi2lxkNHvtO/AwRH60ueCR88fz+4jajbprcak1tIFP
	eZbCtO5MRcWy5wJXqZl73EBgT
X-Received: by 2002:a05:600c:674f:b0:4a2:1655:87db with SMTP id 5b1f17b1804b1-4ac1228a434mr433568835e9.0.1793876117760;
        Thu, 05 Nov 2026 02:55:17 -0800 (PST)
Received: from Ansuel-XPS24.lan (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id 5b1f17b1804b1-4b57317cb8esm59576355e9.13.2026.11.05.02.55.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 02:55:17 -0800 (PST)
From: Christian Marangi <ansuelsmth@gmail.com>
To: Andrew Lunn <andrew@lunn.ch>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Christian Marangi <ansuelsmth@gmail.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Qingfang Deng <dqfext@gmail.com>,
	SkyLake Huang <SkyLake.Huang@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Joris Vaisvila <joey@tinyisr.com>,
	Ahmed Naseef <naseefkm@gmail.com>,
	linux-kernel@vger.kernel.org,
	netdev@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH net-next v5 6/6] net: phy: mediatek: add calibration logic for AN7583
Date: Thu,  5 Nov 2026 11:55:02 +0100
Message-ID: <20261105105504.1024-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261105105504.1024-1-ansuelsmth@gmail.com>
References: <20261105105504.1024-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261105_025519_797721_4FF2EB42 
X-CRM114-Status: GOOD (  19.39  )
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
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Similar to Airoha AN7581 Switch PHY also the Airoha AN7583 SoC
requires dedicated calibration and tuneup to make EEE correctly work.

Airoha AN7583 differ from AN7581 by having a dedicated table for
calibration and additional EEE logic tuneup.

Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
---
 drivers/net/phy/mediatek/airoha-ge-soc.c | 232 ++++++++++++++++++++++-
 drivers/net/phy/mediatek/mtk.h           |   1 +
 2 files changed, 230 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
index 18b9b6562f6d..089035bb3e9b 100644
--- a/drivers/net/phy/mediatek/airoha-ge-soc.c
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -159,6 +159,106 @@ static u8 an7581_zcal_to_r45ohm[64] = {
 	 52,  50,  48,  46,  44,  42,  40,  39,  36,  35,  32,  32,  30,  28,  27,  25
 };
 
+/*
+ * 2 chip revision
+ * TXMR or discrete
+ * 2 MDI type
+ * TX AMP test/TX AMP 1G/TX AMP 100M/TX AMP 10M/R50
+ * 4 PHY
+ */
+static int an7583_tx_amp_compensation_tbl[TRANSFORMER_TYPE_MAX][MDI_TYPE_MAX][CALIB_CONST_TYPE_MAX][4] = {
+	[DISCRETE] = {
+		[MDI_0R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 4, 4, 4, 4 },
+			[R50_B] = { 4, 4, 4, 4 },
+			[R50_C] = { 6, 6, 6, 6 },
+			[R50_D] = { 4, 4, 4, 4 },
+		},
+		[MDI_5R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 0, 0, 0, 0 },
+			[R50_B] = { 0, 0, 0, 0 },
+			[R50_C] = { 0, 0, 0, 0 },
+			[R50_D] = { 0, 0, 0, 0 },
+		},
+	},
+	[TXMR] = {
+		[MDI_0R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { 4, 4, 0, 0 },
+			[R50_B] = { 4, 4, 0, 0 },
+			[R50_C] = { 5, 5, 3, 4 },
+			[R50_D] = { 4, 4, 4, 0 },
+		},
+		[MDI_5R] = {
+			[TX_AMP_TEST_A] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_B] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_C] = { -3, -3, -3, -3 },
+			[TX_AMP_TEST_D] = { -3, -3, -3, -3 },
+			[TX_AMP_1G_A] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_B] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_C] = { 0, 0, 0, 0 },
+			[TX_AMP_1G_D] = { 0, 0, 0, 0 },
+			[TX_AMP_100M_A] = { 4, 4, 4, 4 },
+			[TX_AMP_100M_B] = { 4, 4, 4, 4 },
+			[TX_AMP_10M_A] = { 0, 0, 0, 0 },
+			[TX_AMP_10M_B] = { 0, 0, 0, 0 },
+			[R50_A] = { -4, -4, -4, -4 },
+			[R50_B] = { -4, -4, -4, -4 },
+			[R50_C] = { -2, -2, -2, -2 },
+			[R50_D] = { -3, -3, -2, -2 },
+		},
+	},
+};
+
+static u8 an7583_zcal_to_r50ohm_0R[64] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 122, 118, 114, 110, 106, 102,  98,  96,  92,  88,  85,  82,  80,
+	 76,  72,  70,  68,  64,  62,  60,  57,  55,  52,  50,  48,  46,  44,  41,  40,
+	 38,  36,  33,  32,  30,  28,  26,  24,  24,  22,  20,  18,  16,  16,  14,  12,
+};
+
+static u8 an7583_zcal_to_r50ohm_5R[64] = {
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127, 127,
+	127, 127, 127, 127, 127, 127, 127, 127, 127, 124, 120, 116, 112, 110, 106, 102,
+	 99,  96,  93,  90,  88,  84,  81,  79,  76,  73,  71,  68,  66,  64,  61,  59,
+	 56,  54,  52,  50,  48,  46,  44,  42,  40,  39,  37,  36,  33,  32,  31,  29,
+};
+
 /* One calibration cycle consists of:
  * 1.Set DA_CALIN_FLAG high to start calibration. Keep it high
  *   until AD_CAL_COMP is ready to output calibration result.
@@ -824,8 +924,9 @@ static int airoha_rx_offset_cal_sw(struct phy_device *phydev)
 	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x100, 0x0);
 	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x145, 0x1000);
 
-	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG6,
-		      0x1);
+	if (phydev->drv->phy_id == AIROHA_GPHY_ID_AN7581)
+		phy_write_mmd(phydev, MDIO_MMD_VEND1,
+			      MTK_PHY_RG_ANA_CAL_RG6, 0x1);
 
 	return 0;
 }
@@ -1625,10 +1726,133 @@ static int en7528_phy_config_init(struct phy_device *phydev)
 				MTK_PHY_LED_BCR_EXT_CTRL);
 }
 
+static int an7583_phy_package_config_init_once(struct phy_device *phydev)
+{
+	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
+
+	/* FIXME: Read SoC MDI Resister Type if available or default to 5R */
+	shared->mdi_resister_type = MDI_5R;
+
+	if (shared->mdi_resister_type == MDI_0R)
+		shared->r50_cal_tbl = an7583_zcal_to_r50ohm_0R;
+	if (shared->mdi_resister_type == MDI_5R)
+		shared->r50_cal_tbl = an7583_zcal_to_r50ohm_5R;
+	shared->tx_amp_compensation_tbl = &an7583_tx_amp_compensation_tbl;
+
+	return 0;
+}
+
 static int an7583_phy_config_init(struct phy_device *phydev)
 {
+	struct airoha_socphy_shared *shared = phy_package_get_priv(phydev);
+	u8 phy_offset;
+	int ret;
+
 	/* BMCR_PDOWN is enabled by default */
-	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+	phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+
+	phy_offset = phy_package_offset(phydev);
+
+	if (phy_package_init_once(phydev)) {
+		ret = an7583_phy_package_config_init_once(phydev);
+		if (ret)
+			return ret;
+	}
+
+	ret = airoha_phy_calib(phydev);
+	if (ret)
+		return ret;
+
+	ret = airoha_phy_auto_select_transformer(phydev);
+	if (ret)
+		return ret;
+
+	ret = airoha_phy_tx_amp_compensation(phydev);
+	if (ret)
+		return ret;
+
+	/* Enable Idle Mode Power Setting */
+	if (phy_offset == 0) {
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x268, 0x07F1);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x703, 0x3111);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x271, 0x3C24);
+		phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x701, 0x1023);
+	}
+
+	if (shared->transformer_type[phy_offset] == TXMR) {
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0881);
+		phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0881);
+
+		if (shared->mdi_resister_type == MDI_5R)
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+		else
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0200);
+	} else {
+		if (shared->mdi_resister_type == MDI_5R) {
+			/* RX setting for 5R_TXMR before AN setting */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe7, 0x6666);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe9, 0x0003);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xfe, 0x0006);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0xe6, 0x1111);
+			/* 100M sharp */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0c86);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x01, 0x01cb);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x02, 0x01c2);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x03, 0x0108);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x04, 0x0211);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x06, 0x0387);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x07, 0x03ce);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x08, 0x03c8);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0b, 0x0005);
+		} else {
+			/* 100M sharp */
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x23, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x24, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x25, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x26, 0x0886);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x00, 0x0195);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x01, 0x01cb);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x02, 0x01c2);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x03, 0x0108);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x04, 0x0211);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x05, 0x0205);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x06, 0x0387);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x07, 0x03ce);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x08, 0x03c3);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0a, 0x0010);
+			phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x0b, 0x0005);
+		}
+	}
+
+	/* RX Setting */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3c, 0xc000);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3d, 0x0000);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x3e, 0xc000);
+
+	/* EEE setting */
+	phy_write_mmd(phydev, MDIO_MMD_AN, 0x3c, 0x0000);
+
+	/* 10M settings */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x1a3, 0x00d2);
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x1a4, 0x010e);
+	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x27b, 0x1177);
+	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x27c, 0x0808);
+
+	phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_3, 0x14, 0x190);
+	phy_write_paged(phydev, MTK_PHY_PAGE_EXTENDED_1, 0x14, 0x3a18);
+
+	phy_write(phydev, 0x9, 0x0600);
+
+	/* EEE keep only Pair A ON */
+	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x630, 0x006E);
+
+	return 0;
 }
 
 static struct phy_driver mtk_socphy_driver[] = {
@@ -1671,6 +1895,8 @@ static struct phy_driver mtk_socphy_driver[] = {
 		.led_hw_control_set = mt798x_phy_led_hw_control_set,
 		.led_hw_control_get = mt798x_phy_led_hw_control_get,
 		.led_polarity_set = an7581_phy_led_polarity_set,
+		.read_page	= mtk_phy_read_page,
+		.write_page	= mtk_phy_write_page,
 	},
 };
 
diff --git a/drivers/net/phy/mediatek/mtk.h b/drivers/net/phy/mediatek/mtk.h
index bc46646a95fd..608e5e3d754f 100644
--- a/drivers/net/phy/mediatek/mtk.h
+++ b/drivers/net/phy/mediatek/mtk.h
@@ -13,6 +13,7 @@
 
 #define MTK_EXT_PAGE_ACCESS			0x1f
 #define MTK_PHY_PAGE_EXTENDED_1			0x0001
+#define MTK_PHY_PAGE_EXTENDED_3			0x0003
 #define MTK_PHY_PAGE_STANDARD			0x0000
 #define MTK_PHY_PAGE_EXTENDED_52B5		0x52b5
 
-- 
2.55.0


