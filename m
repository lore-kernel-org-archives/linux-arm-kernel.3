Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 334A5C02188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 00:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=SykZfNWuy7YlKNuIYwyzV55UjWxya80le8VNlDTlmu4=; b=O97R4cjHyV9tYtbr0WdKjeaANb
	Wfjbgu6t3lnRMzZXSzB/Bhd7juVYdXnLW9UEFTvgGV1fLt2iOORw09fxFcJZWNmAPGUFA+Mnt6bg3
	NaedvefSBzxjl3UFlHzwQAEY0eO75oIkd1XA1v7Q0iBcJZTE1m03XffQ5vkrLTxam/D7InUDJBC5Q
	JEME+wfrh2m12AMEKwzWduRlNFHmawp008h5dp0WpSdhx5RjJGVTvhPHBcXH3I9DzYI5MU8k2Lcc+
	qPhRb77DclVHLe79Fxh2JHAh+elXiwhy4aI32CAFwjbUqSvT1+RgyzfifEDAyJWvdSy7Iv+qDQwuX
	Kr+ORbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZrt-00000003r3E-3Mdq;
	Tue, 28 Jan 2025 00:54:17 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcZqb-00000003qnw-0Cwd;
	Tue, 28 Jan 2025 00:52:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=SykZfNWuy7YlKNuIYwyzV55UjWxya80le8VNlDTlmu4=; b=MEtgfelHghgCzYOp
	cgteMoUKm6a2Kqz6Z2CiQLss0kKMKvdry6PlE1ilssYv/s6G62lYWTVk+v5LN0sHdHuG7flcvfk8C
	KM4qax+cVi2vwSgIeh18I07qsV0rfsoCdwWPMZYvCV2meSXbW++Q4b5+/mE3nQKzxrYEcn8tpl7Zx
	ldcRlFKZdGbmN5JWmYrY269z765lgFcn5lER8fSskKTVy4+W6FiLG9iuy+J8OC+++du+yqDpMbsin
	wC7fy2d0ydrF0YDXFxfsXhEhFfTMabhPVxd1mjzLbbtqNmwc2plTCP+bnXUnfoIa01oIAM8ii4tJZ
	kcLkkcx6RYNyzvoCPg==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tcZqO-00COvY-0E;
	Tue, 28 Jan 2025 00:52:44 +0000
From: linux@treblig.org
To: matthias.bgg@gmail.com,
	angelogioacchino.delregno@collabora.com,
	lgirdwood@gmail.com,
	broonie@kernel.org,
	perex@perex.cz,
	tiwai@suse.com
Cc: linux-sound@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH] ASoC: mediatek: mt6358: Remove unused functions
Date: Tue, 28 Jan 2025 00:52:43 +0000
Message-ID: <20250128005243.295977-1-linux@treblig.org>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_165257_180147_A4880C3F 
X-CRM114-Status: UNSURE (   9.77  )
X-CRM114-Notice: Please train this message.
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

The functions:
  mt6358_mtkaif_calibration_disable()
  mt6358_mtkaif_calibration_enable()
  mt6358_set_mtkaif_calibration_phase()
were added in the 2019
commit 6a8d4198ca80 ("ASoC: mediatek: mt6358: add codec driver")

but never used.

Remove them.

This leaves mt6358_set_dcxo(), mt6358_set_clksq(),
mt6358_set_aud_global_bias(), also unused.

Remove them.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 sound/soc/codecs/mt6358.c | 104 --------------------------------------
 sound/soc/codecs/mt6358.h |   4 --
 2 files changed, 108 deletions(-)

diff --git a/sound/soc/codecs/mt6358.c b/sound/soc/codecs/mt6358.c
index 9247b90d1b99..e033027fd4c7 100644
--- a/sound/soc/codecs/mt6358.c
+++ b/sound/soc/codecs/mt6358.c
@@ -162,47 +162,6 @@ static void capture_gpio_reset(struct mt6358_priv *priv)
 			   0xf << 12, 0x0);
 }
 
-/* use only when not govern by DAPM */
-static int mt6358_set_dcxo(struct mt6358_priv *priv, bool enable)
-{
-	regmap_update_bits(priv->regmap, MT6358_DCXO_CW14,
-			   0x1 << RG_XO_AUDIO_EN_M_SFT,
-			   (enable ? 1 : 0) << RG_XO_AUDIO_EN_M_SFT);
-	return 0;
-}
-
-/* use only when not govern by DAPM */
-static int mt6358_set_clksq(struct mt6358_priv *priv, bool enable)
-{
-	/* audio clk source from internal dcxo */
-	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON6,
-			   RG_CLKSQ_IN_SEL_TEST_MASK_SFT,
-			   0x0);
-
-	/* Enable/disable CLKSQ 26MHz */
-	regmap_update_bits(priv->regmap, MT6358_AUDENC_ANA_CON6,
-			   RG_CLKSQ_EN_MASK_SFT,
-			   (enable ? 1 : 0) << RG_CLKSQ_EN_SFT);
-	return 0;
-}
-
-/* use only when not govern by DAPM */
-static int mt6358_set_aud_global_bias(struct mt6358_priv *priv, bool enable)
-{
-	regmap_update_bits(priv->regmap, MT6358_AUDDEC_ANA_CON13,
-			   RG_AUDGLB_PWRDN_VA28_MASK_SFT,
-			   (enable ? 0 : 1) << RG_AUDGLB_PWRDN_VA28_SFT);
-	return 0;
-}
-
-/* use only when not govern by DAPM */
-static int mt6358_set_topck(struct mt6358_priv *priv, bool enable)
-{
-	regmap_update_bits(priv->regmap, MT6358_AUD_TOP_CKPDN_CON0,
-			   0x0066, enable ? 0x0 : 0x66);
-	return 0;
-}
-
 static int mt6358_mtkaif_tx_enable(struct mt6358_priv *priv)
 {
 	switch (priv->mtkaif_protocol) {
@@ -252,69 +211,6 @@ static int mt6358_mtkaif_tx_disable(struct mt6358_priv *priv)
 	return 0;
 }
 
-int mt6358_mtkaif_calibration_enable(struct snd_soc_component *cmpnt)
-{
-	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-
-	playback_gpio_set(priv);
-	capture_gpio_set(priv);
-	mt6358_mtkaif_tx_enable(priv);
-
-	mt6358_set_dcxo(priv, true);
-	mt6358_set_aud_global_bias(priv, true);
-	mt6358_set_clksq(priv, true);
-	mt6358_set_topck(priv, true);
-
-	/* set dat_miso_loopback on */
-	regmap_update_bits(priv->regmap, MT6358_AUDIO_DIG_CFG,
-			   RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT,
-			   1 << RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT);
-	regmap_update_bits(priv->regmap, MT6358_AUDIO_DIG_CFG,
-			   RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT,
-			   1 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_enable);
-
-int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt)
-{
-	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-
-	/* set dat_miso_loopback off */
-	regmap_update_bits(priv->regmap, MT6358_AUDIO_DIG_CFG,
-			   RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_MASK_SFT,
-			   0 << RG_AUD_PAD_TOP_DAT_MISO2_LOOPBACK_SFT);
-	regmap_update_bits(priv->regmap, MT6358_AUDIO_DIG_CFG,
-			   RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_MASK_SFT,
-			   0 << RG_AUD_PAD_TOP_DAT_MISO_LOOPBACK_SFT);
-
-	mt6358_set_topck(priv, false);
-	mt6358_set_clksq(priv, false);
-	mt6358_set_aud_global_bias(priv, false);
-	mt6358_set_dcxo(priv, false);
-
-	mt6358_mtkaif_tx_disable(priv);
-	playback_gpio_reset(priv);
-	capture_gpio_reset(priv);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mt6358_mtkaif_calibration_disable);
-
-int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
-					int phase_1, int phase_2)
-{
-	struct mt6358_priv *priv = snd_soc_component_get_drvdata(cmpnt);
-
-	regmap_update_bits(priv->regmap, MT6358_AUDIO_DIG_CFG,
-			   RG_AUD_PAD_TOP_PHASE_MODE_MASK_SFT,
-			   phase_1 << RG_AUD_PAD_TOP_PHASE_MODE_SFT);
-	regmap_update_bits(priv->regmap, MT6358_AUDIO_DIG_CFG,
-			   RG_AUD_PAD_TOP_PHASE_MODE2_MASK_SFT,
-			   phase_2 << RG_AUD_PAD_TOP_PHASE_MODE2_SFT);
-	return 0;
-}
-EXPORT_SYMBOL_GPL(mt6358_set_mtkaif_calibration_phase);
-
 /* dl pga gain */
 enum {
 	DL_GAIN_8DB = 0,
diff --git a/sound/soc/codecs/mt6358.h b/sound/soc/codecs/mt6358.h
index a5953315eaa2..b729c3899b7e 100644
--- a/sound/soc/codecs/mt6358.h
+++ b/sound/soc/codecs/mt6358.h
@@ -2307,8 +2307,4 @@ enum {
 /* set only during init */
 int mt6358_set_mtkaif_protocol(struct snd_soc_component *cmpnt,
 			       int mtkaif_protocol);
-int mt6358_mtkaif_calibration_enable(struct snd_soc_component *cmpnt);
-int mt6358_mtkaif_calibration_disable(struct snd_soc_component *cmpnt);
-int mt6358_set_mtkaif_calibration_phase(struct snd_soc_component *cmpnt,
-					int phase_1, int phase_2);
 #endif /* __MT6358_H__ */
-- 
2.48.1


