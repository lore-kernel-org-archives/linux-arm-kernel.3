Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5F2ACCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 10:08:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hBNAS5M1hQOxxlrANdSff3GZBvV5T3wowX7znoz7cEM=; b=Q1YLesSUF4r882dgfxj01WyQ22
	xXE12B27I6OuWtmbV0Kq1HAHHRyar9lMFXGKWGY8hIVtLVkw2qQBwz0VuzLZsrxHE//TMG+m/g833
	U7QufUORlqKuUQBcDv6uyC0HUG0xAzu1IZh2Pt73zsaEAPFu5/ORQnB5W8JJBxj9fFmMQ64dWCm4t
	OoiZOe0jWl0Wetc2R9XQDTVUxuvzk7ucCV0jELkJJyTtF6H/i/z9qpaFd0aUBI2usmiourPivDtGs
	hD2LTExtcy468OTS7Xrgz/t7oFdqWR8BSyCfJruNoAMG45wCHdjawO9/BpKQY5bGsI1Nivz+Z0cyD
	FNq4oYJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoB-0000000Ckhp-3wW9;
	Mon, 20 Oct 2025 10:08:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmoA-0000000CkgO-0WBN;
	Mon, 20 Oct 2025 10:08:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=hBNAS5M1hQOxxlrANdSff3GZBvV5T3wowX7znoz7cEM=; b=FKEI5K3zOFvJjtz2TsYNBvW/1r
	12Wa7hye5DjgRgKsmxW1SEK7Ng3b4MrJjfI3Q0OtZ1r5sPd9sZXM7QSGLAUe8HeqFQvq4/OsKlb+v
	MPEH+Ub7hXJSzB36R1AQd3bVkyYgt+obyl+0XP6p4mCsPVKqO24TcKiUmjX481z99/BcXD7gS1out
	23Zb2FCUnv5BBrBWGI1PENZc185cy3UUjA4DU69gPXBPyt/TR0qE/pohFjx0v9I+T5lirN7GwPnaF
	F0LPWscTWOidIKRJDBgR497rvsX8b13MUqvwXGyfkeZY7ZfjLAjQTvfY83nJqxr/jAFJzyM1UjD65
	18Qr3hzg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAmo6-00000009hqn-2nEJ;
	Mon, 20 Oct 2025 10:08:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=hBNAS5M1hQOxxlrANdSff3GZBvV5T3wowX7znoz7cEM=; b=fhCdSmbwx7yd07UWQjihZgYCqB
	HrORil8TilBFrQpmlUE1aauEc5o4g8xn1aHAzgEzuKfdh1INr3eDoCL13+uS2U1gR7v0jxHoYUntR
	B7Tobhyhp7cjA4WcsP/7lOUDyDyD9V69OrptEGh1iMUOGS0oPsu6hngKmK1r4wpr9U5vHnjShl/Ex
	dN0g+J6ombfz3NZiFENa5Bu3zdLtfcYr87UXRkezFh+bCXh9pHZ+m+1ZjprZCikF6bq5f0BhxjnYr
	zKj4GfPz5xTpv+EtdWhn5WEwwTRbhBifcR2ZiRDvVPJPbk+aWTThEs6TYHIJL5r4QXoacXafcZPxZ
	DMuYUKFg==;
Received: from [141.76.253.240] (helo=phil.eduroam.local)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vAmo4-00083f-CR; Mon, 20 Oct 2025 12:08:00 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH 3/3] arm64: dts: rockchip: Correctly describe the ethernet phy on rk3368-lion
Date: Mon, 20 Oct 2025 12:07:57 +0200
Message-ID: <20251020100757.3669681-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20251020100757.3669681-1-heiko@sntech.de>
References: <20251020100757.3669681-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_110803_134006_425F8220 
X-CRM114-Status: GOOD (  11.99  )
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

So far, the board used the phy implicitly using the deprecated snps reset
properties. Improve that and describe the PHY correctly under the new
mdio node.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi | 22 ++++++++++++++++---
 1 file changed, 19 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
index 8ccc3184a836..61c52bd91784 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
@@ -154,13 +154,11 @@ &gmac {
 	assigned-clocks = <&cru SCLK_MAC>;
 	assigned-clock-parents = <&ext_gmac>;
 	clock_in_out = "input";
+	phy-handle = <&vsc8531_2>;
 	phy-supply = <&vcc33_io>;
 	phy-mode = "rgmii";
 	pinctrl-names = "default";
 	pinctrl-0 = <&rgmii_pins>;
-	snps,reset-active-low;
-	snps,reset-delays-us = <0 10000 50000>;
-	snps,reset-gpio = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
 	tx_delay = <0x10>;
 	rx_delay = <0x10>;
 	status = "okay";
@@ -285,7 +283,25 @@ &io_domains {
 	status = "okay";
 };
 
+&mdio {
+	vsc8531_2: ethernet-phy@0 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x0>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&phy_rst>;
+		reset-assert-us = <10000>;
+		reset-deassert-us = <50000>;
+		reset-gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+	};
+};
+
 &pinctrl {
+	ethernet {
+		phy_rst: phy-rst {
+			rockchip,pins = <3 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
 	leds {
 		module_led_pins: module-led-pins {
 			rockchip,pins =
-- 
2.47.2


