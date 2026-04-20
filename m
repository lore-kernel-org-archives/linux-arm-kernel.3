Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95D09EA71B4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 01:14:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0CLrXGPIgejxCaP4xKDmgv1AFIgYcHyec052/XGXZFI=; b=DBklaSjX45MU8ev2EtBPMcOamK
	8unoqrT+pxPH/igNoWV/epnSOgsKvZa//Zxi4cuY+tU/XVqt4kc8yIgYfBErl3yy5ulwB/Ttl/0Y4
	S7GrI+z0BkTXqJsO7DXf0/qj+KlyxfgTTaFI29+Kj8ClfTIlFn/3PHXupZxSCc48/+x5LP9Hp2u5U
	JHFWzn9Kd5HZ+SjP/ZIUgDqJX/JHr31MkD4GWfLy7PlEa0M1YH5OEM6RY1faNo8ipYcaQRok5ltQ/
	49c3k/CYZ4XXhgOiI4iHNFEt4oPfi2DQc4fvR5ndFyIB4K2IJFuaWiy3OYxvWiBZnp0evugqM+GW5
	UY3qNx5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdD7-00000006G9Y-1cpP;
	Mon, 20 Apr 2026 01:14:01 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEdD4-00000006G5W-46xY;
	Mon, 20 Apr 2026 01:14:00 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEdCx-000000002ZI-0gqE;
	Mon, 20 Apr 2026 01:13:51 +0000
Date: Mon, 20 Apr 2026 02:13:48 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Arnd Bergmann <arnd@arndb.de>, Cyril Chao <Cyril.Chao@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
	Eugen Hristev <eugen.hristev@linaro.org>,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v2 7/9] ARM: dts: mediatek: mt2701: wire HDMI audio path
 clocks into AFE
Message-ID: <29da9abd86362471bacae22cbd07ae63f742b048.1776646435.git.daniel@makrotopia.org>
References: <cover.1776646435.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776646435.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_181359_664136_CB2C9869 
X-CRM114-Status: GOOD (  11.00  )
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

Add the HADDS2 PLL 294 MHz root, the audio_hdmi and audio_spdf
interface gates and the audio_apll gate to the MT2701 AFE node,
and reparent the AUDPLL mux to HADDS2PLL_98M so the HDMI audio
serial clock path has a stable 294.912 MHz source. The clock
names match the updated mediatek,mt2701-audio binding.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v2: no changes

 arch/arm/boot/dts/mediatek/mt2701.dtsi | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt2701.dtsi b/arch/arm/boot/dts/mediatek/mt2701.dtsi
index 128b87229f3d5..80c8c7e6a422a 100644
--- a/arch/arm/boot/dts/mediatek/mt2701.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt2701.dtsi
@@ -464,7 +464,11 @@ afe: audio-controller {
 				 <&audsys CLK_AUD_AFE_CONN>,
 				 <&audsys CLK_AUD_A1SYS>,
 				 <&audsys CLK_AUD_A2SYS>,
-				 <&audsys CLK_AUD_AFE_MRGIF>;
+				 <&audsys CLK_AUD_AFE_MRGIF>,
+				 <&topckgen CLK_TOP_HADDS2PLL_294M>,
+				 <&audsys CLK_AUD_HDMI>,
+				 <&audsys CLK_AUD_SPDF>,
+				 <&audsys CLK_AUD_APLL>;
 
 			clock-names = "infra_sys_audio_clk",
 				      "top_audio_mux1_sel",
@@ -499,15 +503,22 @@ afe: audio-controller {
 				      "audio_afe_conn_pd",
 				      "audio_a1sys_pd",
 				      "audio_a2sys_pd",
-				      "audio_mrgif_pd";
+				      "audio_mrgif_pd",
+				      "hadds2pll_294m",
+				      "audio_hdmi_pd",
+				      "audio_spdf_pd",
+				      "audio_apll_pd";
 
 			assigned-clocks = <&topckgen CLK_TOP_AUD_MUX1_SEL>,
 					  <&topckgen CLK_TOP_AUD_MUX2_SEL>,
 					  <&topckgen CLK_TOP_AUD_MUX1_DIV>,
-					  <&topckgen CLK_TOP_AUD_MUX2_DIV>;
+					  <&topckgen CLK_TOP_AUD_MUX2_DIV>,
+					  <&topckgen CLK_TOP_AUDPLL_MUX_SEL>;
 			assigned-clock-parents = <&topckgen CLK_TOP_AUD1PLL_98M>,
-						 <&topckgen CLK_TOP_AUD2PLL_90M>;
-			assigned-clock-rates = <0>, <0>, <49152000>, <45158400>;
+						 <&topckgen CLK_TOP_AUD2PLL_90M>,
+						 <0>, <0>,
+						 <&topckgen CLK_TOP_HADDS2PLL_98M>;
+			assigned-clock-rates = <0>, <0>, <49152000>, <45158400>, <0>;
 		};
 	};
 
-- 
2.53.0

