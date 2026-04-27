Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBADFFF8864
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 21:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/eD3kr5DNDYWX/pzoU/2KrL2miApuUb7IOk6/B1OZqw=; b=v2YBSXRJwyIH5ZwEUgsChAxQq8
	HMrT1dflxcBu/d+Izoz86tAkqM7B3FXqkdH6lcUx1bFqrYoxARlxLFJmOr3O8oRPeShoW+LBPM+zB
	KGi+QY3uzmHiGNt3EX8bn/JYS8qI+rXh7WDX2VIInOcOAz9W/Gho4y5ty/jVEAe8iRilXpvgNi0V2
	IPFqrWM9KkadBFdQcRSKAFOlYR4DL3zbgWAjkZHYGhTyh7tklf6r2MPOO0gu+tDWRBblAwg0t+d/f
	iuIgHzpPGqXCgkSN7GCYi65rG526ugg9EzD+2P9WMe19/tk4lIygvYfsuS2GeHvXDsZvrl/Mc2V38
	P4iEYm+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxm-00000000DSG-3D1M;
	Mon, 27 Apr 2026 21:57:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHTxe-00000000DFz-2oQE;
	Mon, 27 Apr 2026 21:57:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1777327068;
	bh=KpitoL56kjSJH2zK4K2wF3mkADlzeBuLCe4iX7ONuFs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DGcWLsln1qTLCz7HwxEJL/dzvhjgqfKwhKhdB8MT/xBD9r1sM8ixuYQLANXnf5BdU
	 rtYqjsiuVrXxSim6vuPpjg6tMCIJJ35uFHm4iKqGjl3zeyNTpl45Oj6RVMRMZ6V3rS
	 FO14UTUvEpKob73Lt2Xd2dT98JOqVKid0rnOIe2w7gvP5XYkExCJntI2m2AiUkC+57
	 8RtB85fWyJoMLCVK/we65ey1f7yzO/1z9HGPxYbxir4GENyhWyALhoXc9PGhBW0JjF
	 h6HI5lgm5eIilYT+N/VW3uGq2bl7yG8TrIZ4KF46NEEUfDp77hR9HLuw7JwiDnEvnC
	 eKFq4utsgfwVg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 62AA117E1537;
	Mon, 27 Apr 2026 23:57:48 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 28 Apr 2026 00:57:25 +0300
Subject: [PATCH v2 07/13] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-khadas-edge2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260428-dts-rk-frl-enable-gpios-v2-7-924df9db884a@collabora.com>
References: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
In-Reply-To: <20260428-dts-rk-frl-enable-gpios-v2-0-924df9db884a@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_145750_899501_02E38852 
X-CRM114-Status: UNSURE (   9.82  )
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

The board exposes the GPIO4_B1 pin to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the hdmi0 node to its dedicated GPIO via frl-enable-gpios to
allow adjusting the bias when transitioning between TMDS and FRL modes.

While at it, remove the duplicated &hdmi0_sound node.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts | 14 ++++++++++----
 1 file changed, 10 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
index 2c22abaf40a8..5afbc593341b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-khadas-edge2.dts
@@ -194,6 +194,10 @@ &gpu {
 };
 
 &hdmi0 {
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_tx_on_h>;
+	pinctrl-names = "default";
 	status = "okay";
 };
 
@@ -217,10 +221,6 @@ &hdptxphy0 {
 	status = "okay";
 };
 
-&hdmi0_sound {
-	status = "okay";
-};
-
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -282,6 +282,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_tx_on_h: hdmi0-tx-on-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	vdd_sd {
 		vdd_sd_en: vdd-sd-en {
 			rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_up>;

-- 
2.53.0


