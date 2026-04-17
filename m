Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52A2EF43689
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:26:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m7zJ3S5SEy057yWgToyydgwButYH5J7tZezvleJitAU=; b=hpr3Whwhs38b3sATOWLtqeIc7r
	aI1oOWWO3oQmuzr3nLMyoEKCVSdOPCbS9FYoZ92wGQ1Ah3ZqjjzWaVez5AdaRhPaottriyEi0sXwU
	wwXtaSMx+aBWYDrNX4Y5Yd2KynsiETTiPzSonDqMZaTPy1CcrVTgWPlIyr6A820lIqBcupCXMgqCi
	/BhlmAeeXz9stdUGjk3MfrdoCSmxNCck1BjOApFy51MY9HC6+HwQajP0FGJvmvIDtIXGngbueoETA
	lT0oKt5MW/ui7qksjMSIXIv9NhN8TLk6L9YU8iyEFDpP4g4HcUR2+uqJse03Q3a29qUYOHx+Hiany
	/zKf7SIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSf-00000003lox-27Wx;
	Fri, 17 Apr 2026 09:26:05 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfS0-00000003kk1-3XUO;
	Fri, 17 Apr 2026 09:25:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417922;
	bh=sou77FlTVzMQhjA7gThHrUSzC1twA5ROGWEA2MS9xlw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Eb79kOpJTurKinzugJ5MFihX6th1MTN3rOuByeJmzw5mVb/2HY14zZMebQ1WgpfPM
	 0LO5L6da/BSYuJDIwYbEKqQ9cHgCSybBZuhNqaschQcnpyhZa1hKn0DFLXwukPoxU2
	 jLPqjPctDXM+DBNkeb068w/fFXZ+Xx+Zmf+UJAp1C9D1xji+ZV1N5GEJcPJxm3WZ+7
	 tyyxLSs9tymFH9kzxVwe7yQrfWuf5kTfqjzMpXMqmjLa3T8vuE4BKdCfFTrR+lFrpo
	 w8rZJk3vKlAaG1PHXZGIBgnkGOChtzLwa0CENUsdG4S2o9qqc7mtKetffTtSRdf3hc
	 WXw3WNTOyNaCQ==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8168B17E0F7F;
	Fri, 17 Apr 2026 11:25:22 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:24:52 +0300
Subject: [PATCH 18/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-h96-max-v58
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-18-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022525_463680_A9F537AF 
X-CRM114-Status: UNSURE (   9.27  )
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

The board exposes the GPIO4_B1 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
index 73d8ce4fde2b..03b0cf7da010 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -210,6 +210,9 @@ &gpu {
 };
 
 &hdmi0 {
+	pinctrl-0 = <&hdmim0_tx0_cec &hdmim0_tx0_hpd
+		     &hdmim0_tx0_scl &hdmim0_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -339,6 +342,12 @@ &pd_gpu {
 };
 
 &pinctrl {
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	hym8563 {
 		hym8563_int: hym8563-int {
 			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


