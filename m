Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3DE02FF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42JU1v60rF5PLOwqG3lWjHcdF2VHdkOAPvPXlurulLI=; b=VUrWUoaY/Pi4egfvEX7N8138TZ
	zw1NmwfqfAx2s/xtZ9xPTCiidYevoT1Y1QP6bNZINU58O3hnwQ6icx529G0QUSfBWo7UmWAtgv+DE
	XT9wuUAg7GGfr5pqbxUdbTvfY/2/oWlcFGbQFtOpRmAixAIcIrw9PlgMNtu/RZLIq1B8rmPr2Ci9i
	om6qrXGnVWMUywUnkjpgaG9mGVvmDrmZeqsDJG5E5rFeJJC121NfE7cefbXyvRkesCPCFr5rRCtS5
	u+Q4N7hwCf381//I7VIKBVIhApXnsLQwMJ0wbJpWPeadvkD6UF0bSFLZBTQFj8IhV0dT6dyAuLE68
	O4ma/klQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxr-00000000DaU-2AUU;
	Mon, 27 Apr 2026 21:58:03 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxg-00000000DHc-1rUt;
	Mon, 27 Apr 2026 21:57:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327070;
	bh=hkJBxlQNXD3WLXHHucu4Mt9C2VCbn3kXBkeHk5+lnGU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=AlP8SKxyr/i007iVsLGUqGeZXzqPCHwI5AiJuZdrzR2YQ4r53NDqHC/vYCNZ0pzor
	 7ZAzQsXOTPk3eedUztWsaQoQD17BmvS4rM9weuZp9Kfwf0ayZhGHpdUZOtdrlLWuSm
	 /zvtJtflWGHLhiIKFYo1O7wlSrycVq4c3zgQBEEitItcuHhSNf77SrU/MxtjkCOA3C
	 3A86ZQY8Si8Yk6ljUROgytZ8+3JjBnmVsPLVp6Bzr5b/pi3fYSCAaIcu7yFLPnYtq+
	 M47l69mwpFMSX7tj80AVL/BeQZcFwZnAOfwxYUHp9v2W0a2tH22vIHIbvnNI70mJQB
	 6gOovSejNnxQQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0BDE817E0D23;
	Mon, 27 Apr 2026 23:57:50 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:27 +0300
Subject: [PATCH v2 09/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-roc-pc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-9-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145752_724817_BBD89F47 
X-CRM114-Status: GOOD (  10.84  )
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

The board exposes the GPIO4_B2 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

While at it, move hym8563 down to fix the ordering of &pinctrl entries.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
index 7e179862da6e..aa02cf510d6d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts
@@ -224,6 +224,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -367,9 +371,9 @@ &pd_gpu {
 };
 
 &pinctrl {
-	hym8563 {
-		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
 
@@ -379,6 +383,12 @@ hp_detect: hp-detect {
 		};
 	};
 
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	leds {
 		led_pins: led-pins {
 			rockchip,pins = <1 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>,

-- 
2.53.0


