Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90408F34C45
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 02:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vEX6bw5iFEM3OkIOsBFSgt8EM3yQ25aL4kQiNDSNRGU=; b=LH42RzAThaotv7sMFp2Vk4Qbr0
	1FcWXRwtEFyyktEbE5jRHioGvyb/nrBrW/DjCAJTsU+KTLKsh2gUr3CK6IvP/0GcIZUottoHOdhDY
	vUUes5K8ch3Y5rI5yKcMg0le4AImY0Kmt7kZxCsF2O4g1JggevFQng5hXxsezVFHF1euYWkXcNjpH
	SeHGuallBpNyYevCrkkPIj1gF7r0macUQHaYkhlF2XiHWgszK2uAmUsZpdDpNp7aDUxLj7S0lHKRk
	idThZEbQQunvTz6EiOUxA9cDl3AKOOTJkQH9EXZxqhG4uWmxES7vMMEoeahCf8HejHRCrpyi/tYtd
	ZNfevZLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6bH-0000000CWTs-2t0n;
	Fri, 24 Apr 2026 02:49:03 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wG6bB-0000000CWRS-3AjK;
	Fri, 24 Apr 2026 02:48:58 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wG6b3-000000002MT-2mWi;
	Fri, 24 Apr 2026 02:48:49 +0000
Date: Fri, 24 Apr 2026 03:48:41 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Cyril Chao <Cyril.Chao@mediatek.com>, Arnd Bergmann <arnd@arndb.de>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Daniel Golle <daniel@makrotopia.org>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v3 1/9] ASoC: dt-bindings: mt2701-afe-pcm: add HDMI audio
 path clocks
Message-ID: <1a871e4494d514a270c7c27c080e338b2dbf6559.1776998727.git.daniel@makrotopia.org>
References: <cover.1776998727.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776998727.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260423_194857_817052_D08E934E 
X-CRM114-Status: GOOD (  11.04  )
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

Document four additional optional clocks feeding the HDMI audio
output path on MT2701: the HADDS2 PLL (root of the HDMI audio
clock tree), the HDMI audio and S/PDIF interface power gates,
and the audio APLL root gate. Older device trees that do not
wire these up remain valid via minItems. MT7622 does not have
HDMI audio hardware, so its compatible is restricted to the
base set of 34 clocks.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v3: allOf goes before additionalProperties
v2:
 * Restrict the four HDMI clocks to mediatek,mt2701-audio only
   using an allOf/if/then conditional; MT7622 is capped at 34
   clocks (Krzysztof Kozlowski)

 .../bindings/sound/mediatek,mt2701-audio.yaml | 23 +++++++++++++++++++
 1 file changed, 23 insertions(+)

diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
index 45382c4d86aa..30f331366566 100644
--- a/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
+++ b/Documentation/devicetree/bindings/sound/mediatek,mt2701-audio.yaml
@@ -32,6 +32,7 @@ properties:
     maxItems: 1
 
   clocks:
+    minItems: 34
     items:
       - description: audio infra sys clock
       - description: top audio mux 1
@@ -67,8 +68,13 @@ properties:
       - description: top audio a1 sys pd
       - description: top audio a2 sys pd
       - description: audio merge interface pd
+      - description: HADDS2 PLL 294 MHz (HDMI audio path root)
+      - description: HDMI audio interface pd
+      - description: S/PDIF interface pd
+      - description: audio APLL root pd
 
   clock-names:
+    minItems: 34
     items:
       - const: infra_sys_audio_clk
       - const: top_audio_mux1_sel
@@ -104,6 +110,10 @@ properties:
       - const: audio_a1sys_pd
       - const: audio_a2sys_pd
       - const: audio_mrgif_pd
+      - const: hadds2pll_294m
+      - const: audio_hdmi_pd
+      - const: audio_spdf_pd
+      - const: audio_apll_pd
 
 required:
   - compatible
@@ -113,4 +123,17 @@ required:
   - clocks
   - clock-names
 
+allOf:
+  - if:
+      properties:
+        compatible:
+          contains:
+            const: mediatek,mt7622-audio
+    then:
+      properties:
+        clocks:
+          maxItems: 34
+        clock-names:
+          maxItems: 34
+
 additionalProperties: false
-- 
2.54.0

