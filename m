Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E756E6F069
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 15:33:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JBIbDS3b2Cy/hxqzSSKFPym1A4g1588e/7Asf0Evx88=; b=kHn3bqkoP1yxtvo/9wSQup11Jh
	qEtTPchwvgOzipmilw0ilUfPF8xaLkG9guIx8CWJkD+vv+wh3ZTYdPXJeddi2TWinPkQ60COi2Ug8
	xJMPfsC0c20eJ6BLwSltCuvIEq8GSf9QCl9MKi9MYhmeB6Q+p0sIPtp3KcmwSChn9GPSlvXarup0t
	WyWDx4VkJk7ycWsb/PAnefIyKMgI/9jRYQwprk9tinnaDWqEKLIj6ZaT8nd+TCiTjB3MYropFAhWZ
	nEh5QA3GtHx4EeCCvmlMeEKh9nItcb4ATsJcX6ctgdlUV+nN2EvLpUhACxhXiX7rOqomhNKD33/8b
	oWNU1NvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tdo-00000007VwG-24om;
	Fri, 01 Nov 2024 15:32:48 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6tSN-00000007UIy-1DGT;
	Fri, 01 Nov 2024 15:21:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730474457;
	bh=/+TZMp3OuOQDQDtXHRy7fu88xK0qHPfQkGlXJfyTdTg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=WUTyXX9KAWFb3gX0LpNpPH6GX48WVZPnDO9ivRGy5nGMOGP4ZIBLd7lSW7KDolK+L
	 Bjsp1W/eLD4Fgi2GLyJfQMYOtyPgbKF8cTktz18YKwOaKxQ/+KRidryUZPVwyE1E8a
	 iRRyPWU23/+E2LZi+LAlUp3OuKz8tbqrDnRa8cf29cmCdM+MIpqJuGRSm6qRFyuU+K
	 URN5dZ1roRwUmx+adiOtj5sv9e6/3I6p++hW/5dmseozw/mPNnL+vzyxa6GhMCMsK5
	 WrqxyGzlj1z3MDGgkZPcMC6+hY0f3AYvKDQuklWwO1deJ9ggSvQx4nAWQN/jwDDfHB
	 tvh8D2Bc1mCqQ==
Received: from [192.168.1.214] (pool-100-2-116-133.nycmny.fios.verizon.net [100.2.116.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nfraprado)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3445217E0F85;
	Fri,  1 Nov 2024 16:20:54 +0100 (CET)
From: =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
Date: Fri, 01 Nov 2024 11:20:26 -0400
Subject: [PATCH 4/4] arm64: dts: mediatek: Add mediatek,mac-wol-noninverted
 to ethernet nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241101-mediatek-mac-wol-noninverted-v1-4-75b81808717a@collabora.com>
References: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
In-Reply-To: <20241101-mediatek-mac-wol-noninverted-v1-0-75b81808717a@collabora.com>
To: Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Biao Huang <biao.huang@mediatek.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Jose Abreu <joabreu@synopsys.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>
Cc: kernel@collabora.com, netdev@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_082059_498166_47F6D7E8 
X-CRM114-Status: GOOD (  10.83  )
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

Add the newly introduced and now required mediatek,mac-wol-noninverted
property to the dwmac ethernet nodes and invert the presence of the
mediatek,mac-wol property to make it align with the description on the
binding and maintain the current behavior.

Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
---
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts                   | 2 ++
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts                  | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts        | 2 +-
 arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts | 2 ++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts         | 2 +-
 5 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
index c84c47c1352fba49d219fb8ace17a74953927fdc..09760a0784bfb59511ea64fb44b7aeb66326f81b 100644
--- a/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
+++ b/arch/arm64/boot/dts/mediatek/mt2712-evb.dts
@@ -115,6 +115,8 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default>;
 	pinctrl-1 = <&eth_sleep>;
+	mediatek,mac-wol-noninverted;
+	mediatek,mac-wol;
 	status = "okay";
 
 	mdio {
diff --git a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
index 31d424b8fc7cedef65489392eb279b7fd2194a4a..f48baa0b7dcbb95816517b7e501d87e39ac63a2d 100644
--- a/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8195-demo.dts
@@ -109,6 +109,8 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
+	mediatek,mac-wol-noninverted;
+	mediatek,mac-wol;
 	status = "okay";
 
 	mdio {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
index 5f16fb82058056cf8cf6318c9fc373601bd6eb60..290fcdce1c9f49c475403fa4aa7a0911605d4abd 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts
@@ -177,7 +177,7 @@ &eth {
 	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
 	snps,reset-delays-us = <0 10000 10000>;
 	mediatek,tx-delay-ps = <2030>;
-	mediatek,mac-wol;
+	mediatek,mac-wol-noninverted;
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
index e2e75b8ff91880711c82f783c7ccbef4128b7ab4..ebd0deb4e9ec1d67182c7602203e4fa1a0fb1c0c 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts
@@ -271,6 +271,8 @@ &eth {
 	pinctrl-names = "default", "sleep";
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
+	mediatek,mac-wol-noninverted;
+	mediatek,mac-wol;
 	status = "okay";
 
 	mdio {
diff --git a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
index 14ec970c4e491fbd69bf2800639abf726d47589a..a541d4fb9621c55f789d55a1eb985030827b158b 100644
--- a/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
+++ b/arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts
@@ -179,7 +179,7 @@ &eth {
 	pinctrl-0 = <&eth_default_pins>;
 	pinctrl-1 = <&eth_sleep_pins>;
 	mediatek,tx-delay-ps = <2030>;
-	mediatek,mac-wol;
+	mediatek,mac-wol-noninverted;
 	snps,reset-gpio = <&pio 93 GPIO_ACTIVE_HIGH>;
 	snps,reset-delays-us = <0 20000 100000>;
 	status = "okay";

-- 
2.47.0


