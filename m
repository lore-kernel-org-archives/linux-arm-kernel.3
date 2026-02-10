Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 170ADEA3F1F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 08:03:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hPrpzvTn1blb4qvw6DL7D5C3Jr1Z/N7sP9GBJ7rtElw=; b=nQSz5tH8zAm7HKo+EjalThA8MV
	tDWPeokqyRa5FpUqaarSBcy9GbiHQcM2ISGZ++4lHARtAtEVavQxEuGtD69nRGSXqfz7f5gdWROxm
	0kigV4Umnr0cZiuWlYXVXwiZFfc7iZJZMuQ+QgKqdAQDBACHo0kz5M/xUSHB151ms2CUE5o4j6UrJ
	4eXFbGwrI6a7IrJnMZ9f2XymWm/ZaOsmO9BtdsQ+TIXDDH3V82GKXPJ8mleqIcvdxs/RpA/ncXmMg
	QEqnQidju8j2OUi6FVtGYngfAormG6qq4UCiv7cRZP+8WF2ejXzbrHxyfvD9ph8NTkz+qUYtd1npI
	dAcv8rrw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiI-0000000Gf9q-426D;
	Tue, 10 Feb 2026 08:03:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpiiC-0000000Gf6I-2Y39;
	Tue, 10 Feb 2026 08:03:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=hPrpzvTn1blb4qvw6DL7D5C3Jr1Z/N7sP9GBJ7rtElw=; b=KVo5b7QusLcPKb/wBk3t0TR+We
	xQU4M534hilk9BP7T6Wv0OQZ+RiUpTvfJ59lwe2WosXm8u/XfsrPqaCe/BukuQktKb0ZAl2p5Gz8A
	7MbLAe3I8iVc1b1L/JaXeGcwsucG0t8pB613fEA6/kcvoYRU8unJ3k7xIOvX0FpY5SBdqGE55jLoo
	47lxFzuin+OMM0TcL+v3snq75ZvRc8w0J3zTiBthcTE3P4Aw6E20LJQeLdnu1iPs1a3o9o3/T8RuG
	74OOtWOqrRjOmrpMeWL9vEHfyx9lh54tWkHUABy1tbZ17Ea3nb6Wd3/ANMankKkstFFf4ZGa+GWpo
	Sg+GCQaQ==;
Received: from i53875a81.versanet.de ([83.135.90.129] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vpii9-007v2y-NY; Tue, 10 Feb 2026 09:03:06 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v2 3/4] arm64: dts: rockchip: add pinctrl for clk-generator GPIO on rk3588-tiger
Date: Tue, 10 Feb 2026 09:03:01 +0100
Message-ID: <20260210080303.680403-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260210080303.680403-1-heiko@sntech.de>
References: <20260210080303.680403-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_000308_644502_037DDB6F 
X-CRM114-Status: GOOD (  12.75  )
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

Reviewed-by: Quentin Schulz <quentin.schulz@cherry.de>
Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
index b4b8f305935f..a0e97481afb7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi
@@ -54,6 +54,8 @@ pcie_refclk: pcie-clock-generator {
 		clock-frequency = <100000000>;
 		clock-output-names = "pcie-refclk-clock";
 		enable-gpios = <&gpio4 RK_PB4 GPIO_ACTIVE_HIGH>; /* PCIE30X4_CLKREQN_M1_L */
+		pinctrl-names = "default";
+		pinctrl-0 = <&pcie30x4_clkreqn_m1_l>;
 		vdd-supply = <&vcca_3v3_s0>;
 	};
 
@@ -353,6 +355,12 @@ module_led_pin: module-led-pin {
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


