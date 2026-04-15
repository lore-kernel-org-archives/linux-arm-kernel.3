Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C4FAF43832
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Apr 2026 15:24:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nFVsgToErq4iZ17aijmJzaB78PIZnSMUD2rP/c7hdZE=; b=f2Xz/0RyHRrbX+NGkhYySZ6ewG
	8O9r+sdTnLP/a7bPJzdNBjycyxYL3KUNlYMf9aTm6tZXjdUyrcS8IlTneDtizVK1fIs1KETNI2fzc
	FCkyjvXbK/LckigE6pViEifQBxm+h0fWB96dq9gXzgDHGEhFy/SjCpA3V1lC69efXdMCegIJ7h4d6
	kk5RvVRhbJVDrlngK+PkVPegaTogdki5XJJ79nbMuIIsMut6fY59HvMyqIJJl8deBmBDW0xkRLtxp
	RfcVjmJGthnP87nLg4gIHx46FlcBjf+tIHA1Zud/ISukIuSfWyj8tipSCE7Xyl7P0O7SaPxcBihS6
	rgi5mKqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD26T-00000001JwC-19y1;
	Wed, 15 Apr 2026 15:24:33 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wD26Q-00000001Jsa-0bLC;
	Wed, 15 Apr 2026 15:24:32 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wD26J-000000002hE-4Aaj;
	Wed, 15 Apr 2026 15:24:24 +0000
Date: Wed, 15 Apr 2026 16:24:20 +0100
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
Subject: [PATCH 8/9] ARM: dts: mediatek: mt7623: wire HDMI audio path clocks
 into AFE
Message-ID: <f4268285d26f33fb39e30fa1dd61f4ef062d0364.1776265610.git.daniel@makrotopia.org>
References: <cover.1776265610.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <cover.1776265610.git.daniel@makrotopia.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260415_082430_900696_972A8D7F 
X-CRM114-Status: GOOD (  11.69  )
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

Mirror the MT2701 change for the MT7623 SoC dtsi: add HADDS2PLL,
audio_hdmi, audio_spdf and audio_apll to the AFE clocks list and
reparent the AUDPLL mux to HADDS2PLL_98M. Required for HDMI audio
on MT7623N boards via the shared mt2701 AFE driver.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
 arch/arm/boot/dts/mediatek/mt7623.dtsi | 21 ++++++++++++++++-----
 1 file changed, 16 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/mediatek/mt7623.dtsi b/arch/arm/boot/dts/mediatek/mt7623.dtsi
index 71ac2b94c6ba3..4eb028ffee6f5 100644
--- a/arch/arm/boot/dts/mediatek/mt7623.dtsi
+++ b/arch/arm/boot/dts/mediatek/mt7623.dtsi
@@ -665,7 +665,11 @@ afe: audio-controller {
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
@@ -700,15 +704,22 @@ afe: audio-controller {
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

