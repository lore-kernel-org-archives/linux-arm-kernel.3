Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A32AF43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:26:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1h4hi5wKw3gICY4r7tS7+Zgt+YYRpzIHjyLcFO0Uuw=; b=KX9QIMserYyZQPRiNko95CHAwW
	rp+SM5pTDaaeGD95ApSJs4GvtHnY115k18makmg7r/516my8vYd/gA4OnHDMzqsPHdwuum/67QRqs
	OtVg1286pcEAud3/acLpF/0Htu9O7JTfnOI7jE1rGkRwFxHK3vNzB4pS+fvTil9/zbM4ASpQy4czb
	mkAB0NT20cdVRkZ+Ag8oWbOcnmnQogGC135R50M4b0N5hntKj6tHfdx8b4xqy+3kujxSgrjUBWdvA
	ylnO8XB8T6P5ggTbBuuk5ckmIarJwYu3sSv5Jha/FhZ/j3UcmkM4IpaDS+jlg/hfNx5XpvNtpwDu5
	+7fr3vSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfTE-00000003mNe-1ylt;
	Fri, 17 Apr 2026 09:26:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfS5-00000003ksP-3s4f;
	Fri, 17 Apr 2026 09:25:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417927;
	bh=XA64gsmd6KJbIrvvu5Dmgjjt7ajhyMvFMl5Ha8MY2ws=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lHa+o5Yf1xOxjhmRvLuJPzTjGUd/ptUBq2qIdB41sGUMsYzIgHx/F7l4zpWkQmgkm
	 J21/gUk+QAmrRxD6b53gzVewGJgE0gFF0jX7EI7bUW6cib+Piq6fgE5yiYFtYrhNUk
	 VvyD/WJMfzlvACZwdiQME7+vSfl5b/cBLdMDJHybJcMUrvoupePadoHNRNlfmOJE6I
	 WGJ68jNIDDFLSI6bEvUgE2OhtlW2DQ5OprYwsS6JaYdVpifxZMk+XZGVJvxs6jZtYh
	 5b8nG7LE8p+cxNt4bg88dOZzNiR+2cO+keNRwvTe+LPjepLa0+OwvncXUzTt8Bu5I3
	 xOEsI9v978NVw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C7EA17E0F7F;
	Fri, 17 Apr 2026 11:25:27 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:58 +0300
Subject: [PATCH 24/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-orangepi-5-ultra
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-24-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022531_720057_70FDF33C 
X-CRM114-Status: GOOD (  10.68  )
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
HDMI1 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI1 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts | 9 ++++++++-
 1 file changed, 8 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
index f8c6c080e418..8a3040ad7450 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-ultra.dts
@@ -27,7 +27,8 @@ hdmi1_con_in: endpoint {
 &hdmi1 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim0_tx1_cec &hdmim0_tx1_hpd
-			     &hdmim1_tx1_scl &hdmim1_tx1_sda>;
+			     &hdmim1_tx1_scl &hdmim1_tx1_sda &hdmi1_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB2 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -64,6 +65,12 @@ &led_green_pwm {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi1_frl_en: hdmi1-frl-en {
+			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb {
 		usb_otg_pwren: usb-otg-pwren {
 			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


