Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D9CF4606D80E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 22:15:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GqJDqFfG;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=iJueFP8/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:To:From:Reply-To:
	Cc:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ObXOwDf+V5qXl3CgOF9Q2/eJbEXw721iosf7wblAaTU=; b=GqJDqFfGL0qhPw
	SpR8r49v6ziiNB+oHWa3mrQI/VQiH2dEu0JdVC+adeuHU5QoAlezzszp1IlcPbyohNLkMDc7GFJ0i
	uh2GOeD3b0gmCbmmtIKswidxR6CQ2BZf68+Fz+Qwy7zf7n6HS6C7p0KfyXUR5pwq0QBjwgH1S+XsQ
	vSHUOKAX1JTSUUtI9W3RuVc8hGKk8AC4uSdV1HsHXZYazL5Jf54rNb1H7Vdw0vcKu16Z9vfvQNVMz
	8F2+l0tJogfgbli+FTtek2SS976LFZ+61MOHH/awAOafEMkXT0G7Z1SHGAcd8YRW/XhyvaT8uxFwu
	J4r9fO9xCSZLgv6my6Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmb-00000003oWb-1wx2;
	Tue, 03 Nov 2026 22:15:09 +0000
Received: from mail-wr1-x42c.google.com ([2a00:1450:4864:20::42c])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOMmU-00000003oIM-21Ys
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 22:15:06 +0000
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-48afcd7ba9bso43598f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 14:15:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793744100; x=1794348900; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=ObXOwDf+V5qXl3CgOF9Q2/eJbEXw721iosf7wblAaTU=;
        b=iJueFP8/lBG2oAjQM+33GZiG3alg44v2b5vZdn7wM6XWqiNed9t4Cyxmb24+VWVjye
         jBomkzKglleXFXsGITf+uHsAwbr37QrmULobXH95+MG9CbkKxZyYYnKoX0KzYOrfRO2p
         dX5JPrYFPDxVpLnE1bmZoQ5oEnifzGGllkRluEF2NY7JTPJXHcXlfnTyv9XQl2WXr3Xk
         46R1XucU1Z8Qv7SNpA+G4BSLJV1FYC7CQPsO+0AtADPRDM7uwltSjqGa0J4jK5JpTCUi
         IFi1sYFI+mt/PEP9k9zFMh99e33EcKlhpbCuy+0Ec/PDgwrdR57qC/nO3nNoKJfXgx8c
         HtIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793744100; x=1794348900;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to:content-type;
        bh=ObXOwDf+V5qXl3CgOF9Q2/eJbEXw721iosf7wblAaTU=;
        b=XCZMsXwCrWF1fga0LaTxLfii7l6ueXuqclaBLzjbgb9kp7uFSrwg7FSkruD7cWMsHh
         ASqrKMbhZfmdzE+TsXIf8qrppduSDV4zkyxxSXg3m56x/SViJROTHpIBSOVnKU1PDkRi
         hSR5jCERVLnk4ne19+xeA9fv3kZ7JUk5ZlMBMEPOyhMPOhsSlKl2WJayO2ZxsGJMos12
         jYS2Uk4+6yJLrsXxX6sw/XS5Ajr+XXlKQJCiCFmw0ayehrKL0B09VRzlGNcdgMwMYG2X
         yKxtIurZYRUJHiuCVWiIIm7RkgjR8e+S7/N/VGiE5lMdfZkqWuVskumtYpnyhZptIaIC
         MjmA==
X-Forwarded-Encrypted: i=1; AKwUvBzLEebZzGx13WNCnmI62PjiprcY+F3431K9O3ypq1Y7IsxcS4l36DDtliYnKS74GvwRDNxz2kUrXQi76FMDV7VT@lists.infradead.org
X-Gm-Message-State: APuU4Z99TPVxTV8H/5skblkfWpsEyqr9aGx5M4OtatN/QDLMaRNgrUH2
	O9xzrx1LhRedh4m6XZ8wijKkDfDims19Fc7mY5wpJDUoi+ODTfpNg1uA
X-Gm-Gg: AYBFou3cRgk4pUBKk+2lkoytj8kSgIFPRCywwv1vDZRoIjr0Ky+TMZM5NHjwNYuAzd0
	I2xU0eBSekXXlOerwgYGMMs41s96SFKdwjBlAvxhE87UtZsDIoawNobCNVYy5OskWXiTE7v8GyF
	5LcFSUX4qMSsUdx8Wd1h066Ws5wqftPqbsEXsrbmLqrbZ6N2kiGH9SOG+4tamlQupfVabbpIolo
	yGR1NIsSBq2yEIEb3UVN5d3ZGn8qie7q8KnuGJZf05ISLOwFTD3q5XwmJdINvFC/J6pfF57BS98
	h1NyLJ697tJpsXx6C7mIsWLsyqoKTdzVEsOaDsgcZ0KmTZtH1jbcSs0guONOxTJ+C1ZOGnTBW77
	1CRnFU8zbcHBGj+I8+BjPMnWD3s0bTgq1PNEa63k5xg3moMG687NSvPL5Fj7b5VJH7bjyDVPb1m
	Q51zqkpUTxPSQyZ+8+ZcA70tYdiauET2X1XkvVZwKt16cF0ONjiQTA1d4tOCMKFZfg/0MfFw1/y
	kAojb1ebBpNpC1zn4BU+3kSg8EiAF497oKl4/X+/DAEbLaEHM0FMDFaIzmJarCTEOvIpXB7Yr7j
	SKUmuIy9mGkmUDFZdP77RH5LeJ3dDyKIppbOM2Rqwul7vLhUrNSTRE4c8D6AWjJRAkktye0FgVC
	+Pfc40sAk7rud5wfNpEw6jN2eXqPgoUiJpA==
X-Received: by 2002:a05:600c:e41a:b0:4b2:406b:f3bd with SMTP id 5b1f17b1804b1-4b2406bf3d2mr94283915e9.23.1793744100256;
        Tue, 03 Nov 2026 14:15:00 -0800 (PST)
Received: from Ansuel-XPS24.localdomain (93-34-90-148.ip49.fastwebnet.it. [93.34.90.148])
        by smtp.googlemail.com with ESMTPSA id ffacd0b85a97d-48fec9cd43bsm328556f8f.14.2026.11.03.14.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 14:14:59 -0800 (PST)
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
Subject: [PATCH net-next v4 6/6] net: phy: mediatek: add calibration logic for AN7583
Date: Tue,  3 Nov 2026 23:14:37 +0100
Message-ID: <20261103221439.30502-7-ansuelsmth@gmail.com>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261103221439.30502-1-ansuelsmth@gmail.com>
References: <20261103221439.30502-1-ansuelsmth@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_141502_645963_B356EF7B 
X-CRM114-Status: GOOD (  19.97  )
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
 drivers/net/phy/mediatek/airoha-ge-soc.c | 234 ++++++++++++++++++++++-
 drivers/net/phy/mediatek/mtk.h           |   1 +
 2 files changed, 232 insertions(+), 3 deletions(-)

diff --git a/drivers/net/phy/mediatek/airoha-ge-soc.c b/drivers/net/phy/mediatek/airoha-ge-soc.c
index 17fd741f8922..72c2b9fe7ba4 100644
--- a/drivers/net/phy/mediatek/airoha-ge-soc.c
+++ b/drivers/net/phy/mediatek/airoha-ge-soc.c
@@ -160,6 +160,106 @@ static u8 an7581_zcal_to_r45ohm[64] = {
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
 static int airoha_cal_cycle(struct phy_device *phydev, int devad,
 			    u32 regnum, u16 mask, u16 cal_val)
 {
@@ -774,8 +874,9 @@ static int airoha_rx_offset_cal_sw(struct phy_device *phydev)
 	phy_write_mmd(phydev, MDIO_MMD_VEND2, 0x100, 0x0);
 	phy_write_mmd(phydev, MDIO_MMD_VEND1, 0x145, 0x1000);
 
-	phy_write_mmd(phydev, MDIO_MMD_VEND1, MTK_PHY_RG_ANA_CAL_RG6,
-		      0x1);
+	if (phydev->drv->phy_id == AIROHA_GPHY_ID_AN7581)
+		phy_write_mmd(phydev, MDIO_MMD_VEND1,
+			      MTK_PHY_RG_ANA_CAL_RG6, 0x1);
 
 	return 0;
 }
@@ -1588,10 +1689,135 @@ static int en7528_phy_config_init(struct phy_device *phydev)
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
+	struct phy_device *phydev_p0;
+	u8 phy_offset;
+	int ret;
+
 	/* BMCR_PDOWN is enabled by default */
-	return phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+	phy_clear_bits(phydev, MII_BMCR, BMCR_PDOWN);
+
+	phydev_p0 = shared->phydev_p0;
+	phy_offset = phydev->mdio.addr - phydev_p0->mdio.addr;
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
@@ -1634,6 +1860,8 @@ static struct phy_driver mtk_socphy_driver[] = {
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


