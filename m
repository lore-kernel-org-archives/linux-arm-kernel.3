Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7D57F43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:28:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=t0NGnyRbn66zDpxSXSQM3lvtGQ9KR2Bfzs6FbQVoRE8=; b=hRssyOjhpmgvh/TZeTPvPJq6P/
	iCYO0u7E9Kg5LPI5uB3befXThLGojAM/zCW4IsK+aBqoo+OFyUk+4DJpzj7QAf8bQeq6uLs+dAkxd
	SmtSCWPeCAvkqMZMBDKuXsOEyalHcTjCaYscdDhwQr94SYlQSluYiHLrH9BwKBEFQ9K9FX98qmPzH
	8q+fjRfprvWtTyPFM0Im7lqKSEuDIMmPLEej5zXpPoqihcE47nhauon7bCwJD4JtdNGOUw5fPEi+K
	y2CPcy2KOSvi7TdhA4eFPGmQ2pj714uz2aL5cnrSDtaHPki/GPctYj06vHJItK/yifO5GEdEi7A1n
	Q1xCk2CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfUU-00000003nu0-1Zy4;
	Fri, 17 Apr 2026 09:27:58 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSI-00000003l8v-3JAS;
	Fri, 17 Apr 2026 09:25:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417939;
	bh=DqumH3cbOiT/lZQvNfpDqshvLeTDzUp+/4PTZ7qWh+U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=hdNNIsPF6JpDSsoAp2ohdn+04Ph51QsdLNCObdyS0qvKVRpnuskLKhFR/AI+ry9Pt
	 dpismdBmY+kJk/tP6aq9F9IZv6pItaah29SFoKLa9UErheaSSrZMOpPVCNqxvKo0qV
	 jUFb3O1afBYYRptM+Otw4jyNI3cMwaSd15SaS6Ob0nnAQ3Ny+zToLG7xdMeDxt6Bod
	 1SsNOVP4WvGYMSrprbfHdS+mmTzjzKlu3vLRICSrhM0cpKXNOuMBJVcaIn8DiwMRzm
	 Ze46BWK8cDybwZ/6n+7ArcZNhMcXdLB+lVG9mqf6HoV7Xe/6vcSSC3VoHW9H8XA9jt
	 WQY54N8kaJQpw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C139F17E1340;
	Fri, 17 Apr 2026 11:25:39 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:13 +0300
Subject: [PATCH 39/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-rock-5a
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-39-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022543_026546_25415804 
X-CRM114-Status: GOOD (  10.61  )
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

The board exposes the GPIO4_B6 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts | 10 +++++++++-
 1 file changed, 9 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
index 0991f6a21190..b3afbdd7119d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts
@@ -327,7 +327,9 @@ &hdmi0 {
 	pinctrl-0 = <&hdmim0_tx0_cec
 		     &hdmim1_tx0_hpd
 		     &hdmim0_tx0_scl
-		     &hdmim0_tx0_sda>;
+		     &hdmim0_tx0_sda
+		     &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -373,6 +375,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		io_led: io-led {
 			rockchip,pins = <3 RK_PD5 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


