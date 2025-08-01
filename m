Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 560EDC87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Aug 2025 11:31:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Wz4DIDgd3umyrvPhO7TmPMYKaPD2y9emt09k3/+XLkk=; b=H4Z2gq4aoRXvYbD9WICn+btzQc
	WerqETPZ3OK1aKhNKb0jY8lG/hlZ9dEZ+rLvllXMJG3rdIAYNkTZSlOqTOUZl+OptOz+Sd54UEH7T
	6K9vrKhy/DQ+sU0cYbgb/pIHNDjMeb7e5LSh8mjdIgO9W//mxMNa9/+rgatlCl7b1PacOwdVk0h78
	g2y7EmjsamGSXRH5N9XsmWpxbqFDwO+M1htTGTASUrPiFfatgTYTTIZrPt/cWUXmt5mixDhk2t+3d
	GDT8W++S3++6IRwnxHhiOnuyHmPo7N5TOzyFfWG/2PXyI1HM5zITFS61oKb1FQFVsod4FvCoWh6il
	BxcGcjFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnyt-00000005ZED-2Eqx;
	Fri, 01 Aug 2025 11:31:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uhnm8-00000005XHy-0zXh;
	Fri, 01 Aug 2025 11:18:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1754047091;
	bh=d6dT/wDT+YeFOrMY1wIDLKJ9lcvpXyqaB+zVXEElMnQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Tszx7GywvR/BWvi4Nr+LadRCJdzwNmYVYDjgNASU8mni761xHEaYOAvWa1IvfEQsf
	 4uBudj7elfkyRPchdulGc2hDlKETEulQDRBvogyHxTGUPH5slPsxuio/+6zUbYTQpE
	 Njj1taY1LOLwZTiux6cgSmhIQqyfJFfuaGrhVYQizDWDGhA2I2U5DiGgWCK3cj7Oxc
	 JZYjvJPpRMAOxr8qaBCdvIzEDvyNLJjFDY89vSeuYlndw0QVWSBP/plBPsNl8AOQdp
	 DjrpFDoKWuWKomIqZSkFZH2ix3CpmBFfNEwrUO+YoUrsvOCr9xoOPpsgGMNm+NLnvl
	 uui5HdoFpzFLw==
Received: from 2a01cb0892f2d600c8f85cf092d4af51.ipv6.abo.wanadoo.fr (2a01cb0892f2d600c8f85cF092d4af51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D32CD17E0FFA;
	Fri,  1 Aug 2025 13:18:09 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Fri, 01 Aug 2025 13:18:06 +0200
Subject: [PATCH 4/9] ASoc: dt-binding: Convert mt8183-afe-pcm binding to
 YAML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-mtk-dtb-warnings-v1-4-6ba4e432427b@collabora.com>
References: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
In-Reply-To: <20250801-mtk-dtb-warnings-v1-0-6ba4e432427b@collabora.com>
To: kernel@collabora.com, Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ikjoon Jang <ikjn@chromium.org>, 
 Enric Balletbo i Serra <eballetbo@kernel.org>, 
 Chen-Yu Tsai <wenst@chromium.org>, Weiyi Lu <weiyi.lu@mediatek.com>, 
 Eugen Hristev <eugen.hristev@linaro.org>, 
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
 Julien Massot <jmassot@collabora.com>, Sean Wang <sean.wang@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>
Cc: linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-sound@vger.kernel.org, 
 linux-gpio@vger.kernel.org, Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250801_041812_430311_5676D96A 
X-CRM114-Status: GOOD (  16.57  )
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

Convert the MediaTek MT8183 AFE PCM Device Tree binding from the old
.txt format to YAML schema format to improve validation.

While converting, also document all clock inputs used by the AFE block.

Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 .../devicetree/bindings/sound/mt8183-afe-pcm.txt   |  42 ----
 .../devicetree/bindings/sound/mt8183-afe-pcm.yaml  | 225 +++++++++++++++++++++
 2 files changed, 225 insertions(+), 42 deletions(-)

diff --git a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt b/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
deleted file mode 100644
index 1f1cba4152ceecbe61d0db0b972f98df7d5d91ac..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.txt
+++ /dev/null
@@ -1,42 +0,0 @@
-Mediatek AFE PCM controller for mt8183
-
-Required properties:
-- compatible = "mediatek,mt68183-audio";
-- reg: register location and size
-- interrupts: should contain AFE interrupt
-- resets: Must contain an entry for each entry in reset-names
-  See ../reset/reset.txt for details.
-- reset-names: should have these reset names:
-		"audiosys";
-- power-domains: should define the power domain
-- clocks: Must contain an entry for each entry in clock-names
-- clock-names: should have these clock names:
-		"infra_sys_audio_clk",
-		"mtkaif_26m_clk",
-		"top_mux_audio",
-		"top_mux_aud_intbus",
-		"top_sys_pll3_d4",
-		"top_clk26m_clk";
-
-Example:
-
-	afe: mt8183-afe-pcm@11220000  {
-		compatible = "mediatek,mt8183-audio";
-		reg = <0 0x11220000 0 0x1000>;
-		interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
-		resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
-		reset-names = "audiosys";
-		power-domains = <&scpsys MT8183_POWER_DOMAIN_AUDIO>;
-		clocks = <&infrasys CLK_INFRA_AUDIO>,
-			 <&infrasys CLK_INFRA_AUDIO_26M_BCLK>,
-			 <&topckgen CLK_TOP_MUX_AUDIO>,
-			 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
-			 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
-			 <&clk26m>;
-		clock-names = "infra_sys_audio_clk",
-			      "mtkaif_26m_clk",
-			      "top_mux_audio",
-			      "top_mux_aud_intbus",
-			      "top_sys_pll_d2_d4",
-			      "top_clk26m_clk";
-	};
diff --git a/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.yaml b/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..0f6ab43fa99e55a7572d962f61537c8ab31dcdb0
--- /dev/null
+++ b/Documentation/devicetree/bindings/sound/mt8183-afe-pcm.yaml
@@ -0,0 +1,225 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/sound/mt8183-afe-pcm.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Mediatek AFE PCM controller for mt8183
+
+maintainers:
+  - Julien Massot <jmassot@collabora.com>
+
+properties:
+  compatible:
+    const: mediatek,mt8183-audio
+
+  interrupts:
+    maxItems: 1
+
+  resets:
+    maxItems: 1
+
+  reset-names:
+    const: audiosys
+
+  power-domains:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: AFE clock
+      - description: ADDA DAC clock
+      - description: ADDA DAC pre-distortion clock
+      - description: ADDA ADC clock
+      - description: ADDA6 ADC clock
+      - description: Audio low-jitter 22.5792m clock
+      - description: Audio low-jitter 24.576m clock
+      - description: Audio PLL1 tuner clock
+      - description: Audio PLL2 tuner clock
+      - description: I2S1 bit clock
+      - description: I2S2 bit clock
+      - description: I2S3 bit clock
+      - description: I2S4 bit clock
+      - description: Audio Time-Division Multiplexing interface clock
+      - description: Powerdown Audio test model clock
+      - description: Audio infra sys clock
+      - description: Audio infra 26M clock
+      - description: Mux for audio clock
+      - description: Mux for audio internal bus clock
+      - description: Mux main divider by 4
+      - description: Primary audio mux
+      - description: Primary audio PLL
+      - description: Secondary audio mux
+      - description: Secondary audio PLL
+      - description: Primary audio en-generator clock
+      - description: Primary PLL divider by 4 for IEC
+      - description: Secondary audio en-generator clock
+      - description: Secondary PLL divider by 8 for IEC
+      - description: Mux selector for I2S port 0
+      - description: Mux selector for I2S port 1
+      - description: Mux selector for I2S port 2
+      - description: Mux selector for I2S port 3
+      - description: Mux selector for I2S port 4
+      - description: Mux selector for I2S port 5
+      - description: APLL1 and APLL2 divider for I2S port 0
+      - description: APLL1 and APLL2 divider for I2S port 1
+      - description: APLL1 and APLL2 divider for I2S port 2
+      - description: APLL1 and APLL2 divider for I2S port 3
+      - description: APLL1 and APLL2 divider for I2S port 4
+      - description: APLL1 and APLL2 divider for IEC
+      - description: 26MHz clock for audio subsystem
+
+  clock-names:
+    items:
+      - const: aud_afe_clk
+      - const: aud_dac_clk
+      - const: aud_dac_predis_clk
+      - const: aud_adc_clk
+      - const: aud_adc_adda6_clk
+      - const: aud_apll22m_clk
+      - const: aud_apll24m_clk
+      - const: aud_apll1_tuner_clk
+      - const: aud_apll2_tuner_clk
+      - const: aud_i2s1_bclk_sw
+      - const: aud_i2s2_bclk_sw
+      - const: aud_i2s3_bclk_sw
+      - const: aud_i2s4_bclk_sw
+      - const: aud_tdm_clk
+      - const: aud_tml_clk
+      - const: aud_infra_clk
+      - const: mtkaif_26m_clk
+      - const: top_mux_audio
+      - const: top_mux_aud_intbus
+      - const: top_syspll_d2_d4
+      - const: top_mux_aud_1
+      - const: top_apll1_ck
+      - const: top_mux_aud_2
+      - const: top_apll2_ck
+      - const: top_mux_aud_eng1
+      - const: top_apll1_d8
+      - const: top_mux_aud_eng2
+      - const: top_apll2_d8
+      - const: top_i2s0_m_sel
+      - const: top_i2s1_m_sel
+      - const: top_i2s2_m_sel
+      - const: top_i2s3_m_sel
+      - const: top_i2s4_m_sel
+      - const: top_i2s5_m_sel
+      - const: top_apll12_div0
+      - const: top_apll12_div1
+      - const: top_apll12_div2
+      - const: top_apll12_div3
+      - const: top_apll12_div4
+      - const: top_apll12_divb
+      - const: top_clk26m_clk
+
+required:
+  - compatible
+  - interrupts
+  - resets
+  - reset-names
+  - power-domains
+  - clocks
+  - clock-names
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/clock/mt8183-clk.h>
+    #include <dt-bindings/interrupt-controller/arm-gic.h>
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/power/mt8183-power.h>
+    #include <dt-bindings/reset/mt8183-resets.h>
+
+    afe: mt8183-afe-pcm {
+        compatible = "mediatek,mt8183-audio";
+        interrupts = <GIC_SPI 161 IRQ_TYPE_LEVEL_LOW>;
+        resets = <&watchdog MT8183_TOPRGU_AUDIO_SW_RST>;
+        reset-names = "audiosys";
+        power-domains = <&spm MT8183_POWER_DOMAIN_AUDIO>;
+        clocks = <&audiosys CLK_AUDIO_AFE>,
+                 <&audiosys CLK_AUDIO_DAC>,
+                 <&audiosys CLK_AUDIO_DAC_PREDIS>,
+                 <&audiosys CLK_AUDIO_ADC>,
+                 <&audiosys CLK_AUDIO_PDN_ADDA6_ADC>,
+                 <&audiosys CLK_AUDIO_22M>,
+                 <&audiosys CLK_AUDIO_24M>,
+                 <&audiosys CLK_AUDIO_APLL_TUNER>,
+                 <&audiosys CLK_AUDIO_APLL2_TUNER>,
+                 <&audiosys CLK_AUDIO_I2S1>,
+                 <&audiosys CLK_AUDIO_I2S2>,
+                 <&audiosys CLK_AUDIO_I2S3>,
+                 <&audiosys CLK_AUDIO_I2S4>,
+                 <&audiosys CLK_AUDIO_TDM>,
+                 <&audiosys CLK_AUDIO_TML>,
+                 <&infracfg CLK_INFRA_AUDIO>,
+                 <&infracfg CLK_INFRA_AUDIO_26M_BCLK>,
+                 <&topckgen CLK_TOP_MUX_AUDIO>,
+                 <&topckgen CLK_TOP_MUX_AUD_INTBUS>,
+                 <&topckgen CLK_TOP_SYSPLL_D2_D4>,
+                 <&topckgen CLK_TOP_MUX_AUD_1>,
+                 <&topckgen CLK_TOP_APLL1_CK>,
+                 <&topckgen CLK_TOP_MUX_AUD_2>,
+                 <&topckgen CLK_TOP_APLL2_CK>,
+                 <&topckgen CLK_TOP_MUX_AUD_ENG1>,
+                 <&topckgen CLK_TOP_APLL1_D8>,
+                 <&topckgen CLK_TOP_MUX_AUD_ENG2>,
+                 <&topckgen CLK_TOP_APLL2_D8>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S0>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S1>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S2>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S3>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S4>,
+                 <&topckgen CLK_TOP_MUX_APLL_I2S5>,
+                 <&topckgen CLK_TOP_APLL12_DIV0>,
+                 <&topckgen CLK_TOP_APLL12_DIV1>,
+                 <&topckgen CLK_TOP_APLL12_DIV2>,
+                 <&topckgen CLK_TOP_APLL12_DIV3>,
+                 <&topckgen CLK_TOP_APLL12_DIV4>,
+                 <&topckgen CLK_TOP_APLL12_DIVB>,
+                 <&clk26m>;
+      clock-names = "aud_afe_clk",
+                    "aud_dac_clk",
+                    "aud_dac_predis_clk",
+                    "aud_adc_clk",
+                    "aud_adc_adda6_clk",
+                    "aud_apll22m_clk",
+                    "aud_apll24m_clk",
+                    "aud_apll1_tuner_clk",
+                    "aud_apll2_tuner_clk",
+                    "aud_i2s1_bclk_sw",
+                    "aud_i2s2_bclk_sw",
+                    "aud_i2s3_bclk_sw",
+                    "aud_i2s4_bclk_sw",
+                    "aud_tdm_clk",
+                    "aud_tml_clk",
+                    "aud_infra_clk",
+                    "mtkaif_26m_clk",
+                    "top_mux_audio",
+                    "top_mux_aud_intbus",
+                    "top_syspll_d2_d4",
+                    "top_mux_aud_1",
+                    "top_apll1_ck",
+                    "top_mux_aud_2",
+                    "top_apll2_ck",
+                    "top_mux_aud_eng1",
+                    "top_apll1_d8",
+                    "top_mux_aud_eng2",
+                    "top_apll2_d8",
+                    "top_i2s0_m_sel",
+                    "top_i2s1_m_sel",
+                    "top_i2s2_m_sel",
+                    "top_i2s3_m_sel",
+                    "top_i2s4_m_sel",
+                    "top_i2s5_m_sel",
+                    "top_apll12_div0",
+                    "top_apll12_div1",
+                    "top_apll12_div2",
+                    "top_apll12_div3",
+                    "top_apll12_div4",
+                    "top_apll12_divb",
+                    "top_clk26m_clk";
+    };
+
+...

-- 
2.50.1


