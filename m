Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8279EC1E92
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Feb 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05jgx+0MnkFAcnKU6lS4I/sXEof8lEHcRFmjOH00Mlw=; b=u/J+6t3Lz1Gh871nk1pX8WO2H7
	u+c7dIDwRQsj/cjjKhOMmqavJ5eqI4IBm/7ulFlsbamzgXdHhFKlG84lCluAJ6BIgdyC9UrbpzDeC
	CCJ+C480ukwhV+p6jtUAoXvhnLorGAgeQwnuu+ao/pnFModxOKp5xjq4Nwpa3Nd7HBR5l4qTN96Od
	nqZ+6PVVWRGhCQpffbWxjRrQ78hvgjYnsVje5YSgr8bXYnXKmQihyWFWv5McTdfj7kJETb+EpAzoA
	SXTU3hdNCPNmVoSg4rEByfM3NQskxIxu/HA2iyXVlgpCnmpnxj66sYuD2Nt/KCuQLr9c7ytdRVsqL
	B3oIDKaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwUI-00000009lnj-3cMx;
	Thu, 05 Feb 2026 10:21:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwUB-00000009lia-2zLC;
	Thu, 05 Feb 2026 10:21:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=05jgx+0MnkFAcnKU6lS4I/sXEof8lEHcRFmjOH00Mlw=; b=MGhblie6cHPO8w9trCnqu+M9NR
	Mu4uBe7/PJ/GPJlqFMQM8MjZYsuiF6HduK0xOf5R6TBtyLYXmpIQ2BpEYK37we1HoKARQ+l3tmVfi
	lQDqvNi7UJmRJWd+nqWLHx0VINkOOIsYAjqg1F3f+LV82nEFZajNXa2in90lKIQJjlPYuTmDuAuuJ
	4F1EZYdYDQDmVQvHtXAJWvFWppopuiDIMoZfFiZC1n8/w1UE3n6lDIn4Wr4aRVAS6K4ZBP+nJxhEU
	i78f3Yh5Hyy23S3cilvNy9lOJNywzrdqZizE+vaOFJhzCYYwpnubjJdIcMMDb1lqV7VyFsSonTdc4
	GncO2Omg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnwU8-00000001xF5-2A9Y;
	Thu, 05 Feb 2026 10:21:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=05jgx+0MnkFAcnKU6lS4I/sXEof8lEHcRFmjOH00Mlw=; b=mRKVfEn4WKG8d+UIFi+2uHEt67
	ZQ5HoaXCPE+ugg7D/iUwwndTw7p2kQFlS/4hakxCxvSAY3bxEscbspxlnkoD3LzpMWAgJ+rnX6McH
	AarGgNCvyICTJvOWxwKUwEM7rqRvjVRpton/MhW3Scjtlv4C2AW6bDRAMPK9ZTBSLirL/CsMk7G9S
	52zY3vpLnUUCzB2PMsgRiJ3c5BeFUFlcpafS/X98Nz54s8wR2u7MDjnCcXg9S7Llb/ZBYU25eg9PO
	SizpeiywKKpTRLtBYKJG2x2If5yn0CtmamLUiDdFoAggdaN/+NxtxRZ7mmS9LWFq3vfoD/ZqOY/W4
	EHgj6asw==;
Received: from i53875afe.versanet.de ([83.135.90.254] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vnwU6-0075El-5Q; Thu, 05 Feb 2026 11:21:14 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/3] arm64: dts: rockchip: add pinctrl for clk-generator GPIO on rk3588-tiger
Date: Thu,  5 Feb 2026 11:21:04 +0100
Message-ID: <20260205102104.394991-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260205102104.394991-1-heiko@sntech.de>
References: <20260205102104.394991-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260205_102116_852984_DCA392D5 
X-CRM114-Status: GOOD (  12.83  )
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

From: Heiko Stuebner <heiko.stuebner@cherry.de>

While specific driver in the Linux-Kernel handles GPIOs gracefully without
matching pinctrl entries, this might not be true for other operating
systems. So having pinctrl entries makes the hardware-description
more complete.

The somewhat similar rk3588-jaguar board has a pinctrl entry already,
so also add one for rk3588-tiger.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index 259fb125e13f..91057b166690 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -58,6 +58,8 @@ pcie_refclk: pcie-clock-generator {
 		clock-frequency = <100000000>;
 		clock-output-names = "pcie3_refclk";
 		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie30x4_clkreqn_m1_l>;
 		vdd-supply = <&vcca_3v3_s0>;
 	};
 
@@ -357,6 +359,12 @@ module_led_pin: module-led-pin {
 		};
 	};
 
+	pcie30x4 {
+		pcie30x4_clkreqn_m1_l: pcie30x4-clkreqn-m1-l {
+			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	usb3 {
 		usb3_id: usb3-id {
 			rockchip,pins =
-- 
2.47.2


