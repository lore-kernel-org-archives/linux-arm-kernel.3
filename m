Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE7EBF43683
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Apr 2026 09:27:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qwcuoZlr52DPblavccTCbsOQmgLH02gKG/dgDUs/LYg=; b=o8JclLvvmB7EWA4pIXAVATPRZ1
	MDKYTUDcKSSKavPDqNJeVDxPq/E3lFPFCBR6DTpkUKYzWRzo6XZoweet/cUOhVi+Xe197SVcCV/Jm
	mA1tChOqN9Pj9kRWprhdXHeGi8ZUhJ/XeLmd3g69jlZ+LIIVlCgMGXBdCvQ3pMxuaQhAM4RMCCM6L
	rqZKxDmEzXPXD+wcrneYlTklAR56vGZzxKrQJ14SVbv5vP7bhv4Q4dbAKtG+ursQND9IISvBA79zy
	gkd8wrZFILa77KkuzditOUVZaoqUJQ4SrZnE6sgAR084k7w9zcuDGaEqoLRwx9St+a5NBQ7jIujp0
	vL8nzjHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfTW-00000003mfj-26F4;
	Fri, 17 Apr 2026 09:26:58 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wDfSA-00000003kxz-1Vub;
	Fri, 17 Apr 2026 09:25:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776417932;
	bh=MFvZsAweErYsM8rT/Ug1tTVSPPr+xfkSfDEwWngml94=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=mFgvM3RUcUwFLEwr4/wtsVIpA6ODqHbt71iqjuvTZ30WR9ACUomrORwUUDBipBZgI
	 NVaMMNdiybacN+dTGQ88g3KbqccnXxuk8u/yXuwvKkQVnPMhBeM9UbbYnBeh5hePj0
	 s50rxbEuEmUxJtlpG/irHlRZ5+cSCZ7m/UbCJL0XePJubMWmNJPzMZqWEaA08p8PZY
	 hpw5Vemq85p/X6caNR8Z8SefNeXerlBnkPNGbNMb8FPxnR+F54mH2cJ7zanqSfc2L9
	 aWunggAjpoiNz6fA1sVw3f/OY1XgE/l/oXseAephyLn4Rq+T/X47qJzomAb0tAa0vR
	 fsBlLwZbSc9qg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6439A17E131B;
	Fri, 17 Apr 2026 11:25:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Fri, 17 Apr 2026 12:25:04 +0300
Subject: [PATCH 30/40] arm64: dts: rockchip: Add frl-enable-gpios to
 rk3588s-gameforce-ace
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260417-dts-rk-frl-enable-gpios-v1-30-a19c0dd8c9f6@collabora.com>
References: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
In-Reply-To: <20260417-dts-rk-frl-enable-gpios-v1-0-a19c0dd8c9f6@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.15.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260417_022534_686408_78FDB63B 
X-CRM114-Status: GOOD (  11.64  )
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

The board exposes the GPIO4_B3 line to control the voltage bias on the
HDMI0 data lines.  It must be asserted when operating in HDMI 2.1 FRL
mode and deasserted for HDMI 1.4/2.0 TMDS mode.

Wire up the HDMI0 node to the GPIO line using the frl-enable-gpios
property and drop the line from hdmi0-con to allow adjusting the bias
when transitioning between TMDS and FRL operating modes.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts | 8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts b/arch/arm64/boot/dts/rockchip/rk3588s-gameforce-ace.dts
index 89618394c0bf..0270e5b046eb 100644
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
@@ -515,8 +512,9 @@ &gpu {
 &hdmi0 {
 	no-hpd;
 	pinctrl-0 = <&hdmim0_tx0_cec>, <&hdmim0_tx0_scl>,
-		    <&hdmim0_tx0_sda>;
+		    <&hdmim0_tx0_sda>, <&hdmi0_frl_en>;
 	pinctrl-names = "default";
+	frl-enable-gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
 	status = "okay";
 };
 
@@ -893,7 +891,7 @@ charger_int_h: charger-int-h {
 	};
 
 	hdmi {
-		hdmi0_en: hdmi0-en {
+		hdmi0_frl_en: hdmi0-frl-en {
 			rockchip,pins =
 				<4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
 		};

-- 
2.53.0


