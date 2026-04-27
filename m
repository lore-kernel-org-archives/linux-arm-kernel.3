Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0581FFF8870
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dN0DxvXj3cI5M/SH/bs+jOaqrArX2aUlnl2gQoe72+k=; b=k9+DOiQ9a2rrTEDbiFW2BhjdPy
	TUECekOkd08M/tZ9PiGFB3kbAfiH8+OBDte1xSVAQMgcoR+oSHhdYb5dY0xzRimlOkzEBxMkDGyuI
	Iq5K8A1XrLRokznZQeripRFGhEBvebYw3RrcjftPwRDLsR2t6RZf2epI5Ow19Pcdi03okksCMaRhA
	8pUePV9f0tcfqyuc01K/nXm+nBxHdfctij2SzkUEvjayp+dnSivTASbJEvjI5CuUhgrZk7yMzH+0/
	N8vLe5memArarbKOruH1AI96ol63YhnF5quU9Is6xMyQf2/VNEqNgUGU1I6rW8Cd6qXlyXairA5ck
	x0PkLjlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxo-00000000DUn-0FeH;
	Mon, 27 Apr 2026 21:58:00 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxe-00000000DGF-44lm;
	Mon, 27 Apr 2026 21:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327067;
	bh=fsbtfxnHKzRAMurlKmT5vTCPiS8SnkUNBPVNt3XJDIM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=QH+HEcgomXbn+Vl8Trn21QyTg1vyJEJn6ai2tYU+ZIFptUSunrfo8Bk+kvKigYAhR
	 kUXpcMdcaIAmKLmJPJr5uSSsW65kc8lkEoFS1mYsn24U+HGkDeKuM7IiUkRrHVCZ0u
	 j/AGiv+9wa8UlcVlfiV5hZ8CibbWwfthY0OnWfkRMsG1Ee5ptELiDKngWZ0rQ1VTeZ
	 IEf9QxL4J++WxFYxrYfxfVSpOPCAMZDh/+9rh6C1M1OTsKRN13K4VXhNCykshBYsVx
	 lrcuAUNinKMzOhw63k8e3y3ZA6X8i17/s4QMmyQ4/2ShqqAUmdgUarEDv25Yg31dxD
	 zd2JI3ADpl+TA==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 903DC17E1534;
	Mon, 27 Apr 2026 23:57:47 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:24 +0300
Subject: [PATCH v2 06/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-gameforce-ace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-6-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145751_203986_42E67BD3 
X-CRM114-Status: GOOD (  11.47  )
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

The board exposes the GPIO4_B3 pin to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

Additionally, drop the now unnecessary ddc-en-gpios property and the
associated pinctrl-* entries from hdmi0-con, and rename the hdmi0_en
pinmux to hdmi0_tx_on_h, in line with the naming commonly used in
RK3588s-based board schematics.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 89618394c0bf..b657d54c2c59 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
@@ -302,9 +302,6 @@ amp_headphone: headphone-amplifier {
 
 	hdmi0-con {
 		compatible = "hdmi-connector";
-		ddc-en-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
-		pinctrl-0 = <&hdmi0_en>;
-		pinctrl-names = "default";
 		type = "d";
 
 		port {
@@ -514,8 +511,9 @@ &gpu {
 
 &hdmi0 {
 	no-hpd;
+	frl-enable-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
 	pinctrl-0 = <&hdmim0_tx0_cec>, <&hdmim0_tx0_scl>,
-		    <&hdmim0_tx0_sda>;
+		    <&hdmim0_tx0_sda>, <&hdmi0_tx_on_h>;
 	pinctrl-names = "default";
 	status = "okay";
 };
@@ -893,7 +891,7 @@ charger_int_h: charger-int-h {
 	};
 
 	hdmi {
-		hdmi0_en: hdmi0-en {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
 			rockchip,pins =
 				<4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

-- 
2.53.0


