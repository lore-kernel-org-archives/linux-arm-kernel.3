Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8552CD6E49
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 May 2026 19:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmR9U5oGkuqoj1HWmZh9xVMHg2w6Lea9XEJywHJCXuE=; b=TZ2g+tBXmPsebAMdbSfo+hTTFG
	rVCH3D7sWPhYrBdGsIvKEV3SCoOsbtaJ8Ft0GPCVVLg65+4hPyC+6m9Qep1T92VxCJ9WJqbXlx6+F
	6BI6B4oEuaBQ5qgxW/Z6H1K2CSLjaPF3748oSCTJfcr30PQLmqyBmSH8cIkozzofP8WUM173Y+fhv
	qmhBhxSE8zZa4uSp3LyFL9lbXx3wwEyFLhKw/lY+oeSY9vqfHA5edjeoShq17AEQUF737ncqeusNt
	TjWBLNkCRE8w+HsEZud7xynytM5vDXMaIwGP+yw9RHGGfXB9FrEoSSFIUeeZuTwElv2bmEUamoh1r
	impZsa1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2VC-000000089on-0AMJ;
	Fri, 29 May 2026 19:04:14 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wT2V3-000000089jG-1A8J;
	Fri, 29 May 2026 19:04:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=hmR9U5oGkuqoj1HWmZh9xVMHg2w6Lea9XEJywHJCXuE=; b=dfK1gAWTdJ978S4zWdgS6v/YVS
	QyvJPAbKjO76IkBrrRYCm8HBxwPss2IPOvEJ5Rpc+PRgBwkvkzwtpCt9jg9zpRMUu1Hvq7/GnPD6i
	NISESNTgAUNiRflkH9i2JOrMT4Uyn3Yirklg0UiZ1zB4knL+9257jJAA+9nPQMOiADnHbwfKhO4We
	B2TBQwlgeoMbyYG1JPRRpOdk+Of4DMdHfINZEn47H884qXwgJx9Yn1EmZu9Srs2ANoj+1UfevktVR
	qbWNfwJFsngdmqUE3qZxWS45wE87kHS+iZmhq6R5e7wW7E3zvWHDS3iy03WhF+qRnLO7ApYano5WM
	LLp1os4g==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	amadeus@jmu.edu.cn,
	jonas@kwiboo.se
Subject: [PATCH v4 3/5] arm64: dts: rockchip: Enable USB ports on Radxa ROCK 2A/2F
Date: Fri, 29 May 2026 21:03:53 +0200
Message-ID: <20260529190355.4148175-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260529190355.4148175-1-heiko@sntech.de>
References: <20260529190355.4148175-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_120405_365280_75D32988 
X-CRM114-Status: GOOD (  10.89  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The ROCK 2A has three USB 2.0 Type-A HOST ports behind an onboard
USB hub, and one USB 3.0 Type-A port.

And the ROCK 2F has two USB 2.0 Type-A HOST ports behind an onboard
USB hub, and one USB 2.0 Type-C OTG port.

Add support for using the USB ports on Radxa ROCK 2A/2F.

The onboard USB hub handles OHCI so only the EHCI controller is enabled.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi | 17 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts | 11 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts | 12 ++++++++++++
 3 files changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
index aedc7ee9ee46..501a91f4c23e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
@@ -166,6 +166,10 @@ rfkill {
 	};
 };
 
+&combphy {
+	status = "okay";
+};
+
 &cpu0 {
 	cpu-supply = <&vdd_arm>;
 };
@@ -291,3 +295,16 @@ &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb2phy {
+	status = "okay";
+};
+
+&usb2phy_host {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts b/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
index 0b696d49b71f..5e17ec2758d5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
@@ -79,3 +79,14 @@ usb_otg_en: usb-otg-en {
 		};
 	};
 };
+
+&usb_host0_xhci {
+	dr_mode = "host";
+	extcon = <&usb2phy>;
+	status = "okay";
+};
+
+&usb2phy_otg {
+	phy-supply = <&vcc5v0_usb30_otg>;
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts b/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
index 3e2b9b685cb2..f2b021ff5046 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
@@ -8,3 +8,15 @@ / {
 	model = "Radxa ROCK 2F";
 	compatible = "radxa,rock-2f", "rockchip,rk3528";
 };
+
+&usb_host0_xhci {
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	status = "okay";
+};
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.47.3


