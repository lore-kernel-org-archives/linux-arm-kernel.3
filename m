Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48DFED3CC89
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Jan 2026 23:07:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YbatM8JK6Cu45VHt4p9eaYIeoU98okLTZUPN7BjFQyg=; b=SDT4hX3g+vu1V3RT2qujGpPssB
	PV49VnBd0idgE9jYD+g/e058Rp6Lk4y2EoqpCMmHKJ0yv1gHpbtOzFKjBsaLE2E2fUspkNLuW6lgp
	ZuImIYCgDOp9rk+1svS8U4Musn6n9ZN96SbvZ/U1DiRJLMeZ7z2UxW03RVQ7d+w+QX+/0i/vYhvB7
	7AhZKXsatOpeCGqo/kA+UiOQGtudjXOl2tKSiM0gPVXCmVA+dJ8C0aD/LVWePyOv3V6IIq/lGrp2f
	ZLLl6qqMaMIFsNhTqUeoTrptMkwWVti7+g6Y7gjVzd1DWKzYQR3pM/ezvWeBNq0RgWMS9sfiegNnY
	F5K9q5jA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xf-0000000B1qH-1Dpc;
	Wed, 14 Jan 2026 23:07:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vg9xW-0000000B1hI-1m12;
	Wed, 14 Jan 2026 23:07:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=YbatM8JK6Cu45VHt4p9eaYIeoU98okLTZUPN7BjFQyg=; b=IrpzQueHohmPFasUoeGeKibkxG
	RPfW4KNoCpED6KAyy3jKwqwFwYKMQXRf+v5vEe6S3INdUE+Z6uZPyBqGCes6ovdZN0RBZnDG6lXY3
	QPXMUQ3gX3dnR/ooGKNYPAVWj9Mbw8XH0AVCbaCeLhRIuPs/AE+FB+S66wzy3icNW+DVbDEAouDGw
	LWGRYSTA+2oXC6+JrOYVPZD0GwrLqa0qOSU7IYnSKc+xnOAuSExiIQl+0lpgaXvTpxQxQ5pbsYyXG
	1rdSYbzYEaO0vnKgVNZLTht0+XHzkdRLPJo0hIBBIwVcXNSYbYvN8f2e4RRGp5POUYZV9zd4GwHE7
	dq7qfi3w==;
Received: from i53875b96.versanet.de ([83.135.91.150] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vg9xU-002N2m-50; Thu, 15 Jan 2026 00:07:24 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: quentin.schulz@cherry.de,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Heiko Stuebner <heiko.stuebner@cherry.de>
Subject: [PATCH v3 3/5] arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
Date: Thu, 15 Jan 2026 00:07:05 +0100
Message-ID: <20260114230707.4175162-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260114230707.4175162-1-heiko@sntech.de>
References: <20260114230707.4175162-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260114_150726_464293_0A6BF77A 
X-CRM114-Status: GOOD (  11.90  )
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

Enable the VOP and HDMI controller on the Lion-Haikou board.

Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
---
 .../boot/dts/rockchip/rk3368-lion-haikou.dts     | 16 ++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi    |  5 +++++
 2 files changed, 21 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
index abd1af97456a..ec843a1b0266 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion-haikou.dts
@@ -58,6 +58,14 @@ vcc5v0_otg: regulator-vcc5v0-otg {
 	};
 };
 
+&display_subsystem {
+	status = "okay";
+};
+
+&hdmi {
+	status = "okay";
+};
+
 &i2c_lvds_blc {
 	eeprom: eeprom@50 {
 		compatible = "atmel,24c01";
@@ -101,6 +109,14 @@ &uart1 {
 	status = "disabled";
 };
 
+&vop {
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
 &pinctrl {
 	pinctrl-names = "default";
 	pinctrl-0 = <&haikou_pin_hog>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
index 61c52bd91784..4b4305b90055 100644
--- a/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi
@@ -164,6 +164,11 @@ &gmac {
 	status = "okay";
 };
 
+&hdmi {
+	avdd-0v9-supply = <&vdd10_video>;
+	avdd-1v8-supply = <&vcc18_video>;
+};
+
 &i2c0 {
 	status = "okay";
 
-- 
2.47.2


