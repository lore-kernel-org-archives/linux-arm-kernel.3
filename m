Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F08F43834
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=07DC/HC1a9koZJHxIqto4gguT7Jp99XXb+1BlNgqhu8=; b=WPhiikujqVUytbTtyAN6X2xBk8
	AZOb1v0aWrVl36FzNm4xTIdn9Zc6qSi1Mmk3cWSfsb9IldFs8dDW6T9PqgRV2IoB0HrRvqvkke2YU
	2lMzkO7uDHkaqxPPKrEb73k73+d2uEiY8i/Qs9808Zc6Wi1aLAFVi0avrlYok0z46E5PGfKuZFXrG
	ZK3rvF/hCvcZMzBzc29/FfKnJO/Tgfooi1X87e5SWa1P06xr125jA0RkXxTP/Mje0EJeoG25md/kG
	qxAeyXn8DNqqR5zEaBStqRdIStcYCEATe3cRgbjeqFWlJWr/EES4qFVHoXCCYEQYhQAElYQILV75S
	i+sqGwBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD25p-00000001JSh-2mes;
	Wed, 15 Apr 2026 15:23:53 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD25n-00000001JQf-0qtW;
	Wed, 15 Apr 2026 15:23:52 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD25h-000000002ek-0OOp;
	Wed, 15 Apr 2026 15:23:45 +0000
Date: Wed, 15 Apr 2026 16:23:42 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH 3/9] ASoC: mediatek: mt2701: add AFE HDMI register definitions
Message-ID: <ddaa926d8b0914623f1eddcdf2346acd2e44c9b4.1776265610.git.daniel@makrotopia.org>
References: <cover.1776265610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776265610.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_082351_239263_160CB5CC 
X-CRM114-Status: GOOD (  10.92  )
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

Add register offsets and bit defines for the MT2701/MT7623N AFE
HDMI audio output path: the HDMI BCK divider in AUDIO_TOP_CON3,
the HDMI output memif control and descriptor registers, the 8-bit
AFE_HDMI_CONN0 interconnect, and the AFE_8CH_I2S_OUT_CON engine
that drives the HDMI TX serial link. These are a prerequisite for
adding an HDMI playback path to the mt2701 AFE driver and have no
behavioural effect on their own.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 sound/soc/mediatek/mt2701/mt2701-reg.h | 35 ++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/sound/soc/mediatek/mt2701/mt2701-reg.h b/sound/soc/mediatek/mt2701/mt2701-reg.h
index c84d14cdd7ae8..b7a25bfb58662 100644
--- a/sound/soc/mediatek/mt2701/mt2701-reg.h
+++ b/sound/soc/mediatek/mt2701/mt2701-reg.h
@@ -10,10 +10,17 @@
 #define _MT2701_REG_H_
 
 #define AUDIO_TOP_CON0 0x0000
+#define AUDIO_TOP_CON3 0x000c
 #define AUDIO_TOP_CON4 0x0010
 #define AUDIO_TOP_CON5 0x0014
 #define AFE_DAIBT_CON0 0x001c
 #define AFE_MRGIF_CON 0x003c
+#define AFE_HDMI_OUT_CON0 0x0370
+#define AFE_HDMI_OUT_BASE 0x0374
+#define AFE_HDMI_OUT_CUR  0x0378
+#define AFE_HDMI_OUT_END  0x037c
+#define AFE_HDMI_CONN0    0x0390
+#define AFE_8CH_I2S_OUT_CON 0x0394
 #define ASMI_TIMING_CON1 0x0100
 #define ASMO_TIMING_CON1 0x0104
 #define PWR1_ASM_CON1 0x0108
@@ -125,6 +132,34 @@
 #define AFE_MEMIF_PBUF_SIZE_DLM_BYTE_MASK	(0x3 << 12)
 #define AFE_MEMIF_PBUF_SIZE_DLM_32BYTES		(0x1 << 12)
 
+/* AUDIO_TOP_CON0 (0x0000) -- HDMI audio clock gating */
+#define AUDIO_TOP_CON0_PDN_HDMI_CK		(0x1 << 20)
+#define AUDIO_TOP_CON0_PDN_SPDIF_CK		(0x1 << 21)
+#define AUDIO_TOP_CON0_PDN_SPDIF2_CK		(0x1 << 22)
+#define AUDIO_TOP_CON0_PDN_APLL_CK		(0x1 << 23)
+
+/* AUDIO_TOP_CON3 (0x000c) -- HDMI BCK divider */
+#define AUDIO_TOP_CON3_HDMI_BCK_DIV_MASK	(0x3f << 8)
+#define AUDIO_TOP_CON3_HDMI_BCK_DIV(x)		(((x) & 0x3f) << 8)
+
+/* AFE_HDMI_OUT_CON0 (0x0370) */
+#define AFE_HDMI_OUT_CON0_OUT_ON		(0x1 << 0)
+#define AFE_HDMI_OUT_CON0_BIT_WIDTH_MASK	(0x1 << 1)
+#define AFE_HDMI_OUT_CON0_BIT_WIDTH_16		(0x0 << 1)
+#define AFE_HDMI_OUT_CON0_BIT_WIDTH_32		(0x1 << 1)
+#define AFE_HDMI_OUT_CON0_CH_NUM_MASK		(0xf << 4)
+#define AFE_HDMI_OUT_CON0_CH_NUM(x)		(((x) & 0xf) << 4)
+
+/* AFE_8CH_I2S_OUT_CON (0x0394) -- on-SoC 8-channel I2S that feeds HDMI TX */
+#define AFE_8CH_I2S_OUT_CON_EN			(0x1 << 0)
+#define AFE_8CH_I2S_OUT_CON_BCK_INV		(0x1 << 1)
+#define AFE_8CH_I2S_OUT_CON_LRCK_INV		(0x1 << 2)
+#define AFE_8CH_I2S_OUT_CON_I2S_DELAY		(0x1 << 3)
+#define AFE_8CH_I2S_OUT_CON_WLEN_MASK		(0x3 << 4)
+#define AFE_8CH_I2S_OUT_CON_WLEN_16BIT		(0x1 << 4)
+#define AFE_8CH_I2S_OUT_CON_WLEN_24BIT		(0x2 << 4)
+#define AFE_8CH_I2S_OUT_CON_WLEN_32BIT		(0x3 << 4)
+
 /* I2S in/out register bit control */
 #define ASYS_I2S_CON_FS			(0x1f << 8)
 #define ASYS_I2S_CON_FS_SET(x)		((x) << 8)
-- 
2.53.0

