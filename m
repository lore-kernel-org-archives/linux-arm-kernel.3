Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5C83F43688
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iQWD1j41bRKm1Fvq2Lg64QXlxlztQryWP5pazjrE12U=; b=Pq4eC4ygTOKq3zk5OminDo1A9x
	whupSPhSyRNVEkLaWbR3EoECOKQfYyeqwW9jrMuwVtJT6uFbt70OAXXpubtVXpQwcZee3V1TkMt7g
	OBGkBXYLVL9igS9fJxkbYApmlTthtcpWrX7cKcybzTYeHrnntE8W8MWVOUK/gYLX9Zxu5YkEnXma/
	WaHDlJPs4wqcr/G8zpw2IEO4XG84s2JWOyHZ3lmLD1qz/ijmSmY5xN7MKBCxaV2Bas7XFzgPYCN/g
	27daKOfO5K7BmbF08mtR4Gz+iGYBkKOCRGafF1NBSYOLY1koswWLxaDYD2m4tFbpUxkESvsWd26k3
	OpFDxgGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfTd-00000003moC-071o;
	Fri, 17 Apr 2026 09:27:05 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSF-00000003l4C-0v3e;
	Fri, 17 Apr 2026 09:25:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=iQWD1j41bRKm1Fvq2Lg64QXlxlztQryWP5pazjrE12U=; b=E0eVSwTjVJagAckTAJCnuxjG/L
	LVSYjszrxersfNg5izjoKU6QFgN6svE9vvOXGrIR2nFIj2KVn7dBRqJwn21nbWGdUjR5/9QrEHhx6
	mz74ExPaTNxX6DnCc4bYYauwsHfexL4jKMvWYQ5KdAKXZ+UmDzggt58WmrqYmeayVcR78aFtLRD8m
	H/8yH74CRiVJ6jgwFR44QbvQX+5G0BJ2xoTWYl4XBtpjweNu4/B4fhbd6EOQvC+nWJeWJIP8zFiZX
	2vSY3gDFbezOdALD7tXG5AmhvXS2wFr0SlRX8UMNKf50+59uRnRESZsLXs0qYV7GcE9X6LUtGn7xr
	EjPA3SpA==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSA-000000054Pg-2I1p;
	Fri, 17 Apr 2026 09:25:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417930;
	bh=sIRKXMueFzrkzlpoeuajGnJ/98eQezXWQwjtfTPs/QU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Kw9FyWBBO9sjMpwOQnvwhnblcB1qFLlEXPUPu3rh9/z33qUywiVeGQ0NAi6oM6Gi6
	 lW1FQndBafI/kXeWQLBoLGjdaNG2bU3KorLAKgqJgW5Gka4L7J+nKH5f58bwPMawyZ
	 a0QMp9XCP4pVAyUPAcGyLWb/t3dJq90TPaGZZecIsOa+4kZb7L4QFX1dFahauj0yK9
	 BMHVtnwbD0mnKn/0X11OeIA76g1svCLQJO+4HQ+QpjxKIJqpvPphR3qz12Nf3BGv1K
	 BUu13n4lUAzvmsxXQt7d4+vs0MLNOAP1QN6Bq0hHb+AhFpsRGl94S/9HxqsS9CwZzw
	 g2ZrMIAxyAmIw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C215A17E1380;
	Fri, 17 Apr 2026 11:25:30 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:02 +0300
Subject: [PATCH 28/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588-tiger
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-28-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_102534_788155_E36698DE 
X-CRM114-Status: GOOD (  11.26  )
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

The board exposes the GPIO0_D3 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property to allow adjusting the bias when transitioning between TMDS and
FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts | 3 ++-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi       | 9 ++++++++-
 2 files changed, 10 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
index caa43d1abf17..8401f7bebe86 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger-haikou.dts
@@ -173,7 +173,8 @@ &hdmi0 {
 	 * connected on Haikou itself.
 	 */
 	pinctrl-names = "default";
-	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda>;
+	pinctrl-0 = <&hdmim0_tx0_hpd &hdmim1_tx0_scl &hdmim1_tx0_sda
+		     &hdmi0_frl_en>;
 	status = "okay";
 };
 
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index a0e97481afb7..ea0be7b6c935 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -150,7 +150,8 @@ &gpu {
 &hdmi0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmim1_tx0_cec &hdmim0_tx0_hpd &hdmim1_tx0_scl
-		     &hdmim1_tx0_sda>;
+		     &hdmim1_tx0_sda &hdmi0_frl_en>;
+	frl-enable-gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
 };
 
 &i2c1 {
@@ -349,6 +350,12 @@ eth_reset: eth-reset {
 		};
 	};
 
+	hdmi {
+		hdmi0_frl_en: hdmi0-frl-en {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		module_led_pin: module-led-pin {
 			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;

-- 
2.53.0


