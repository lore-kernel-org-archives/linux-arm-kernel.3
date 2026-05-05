Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 178D3CD3441
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjyFB79RpcRjwJrLC2R/43QIEVjrqdz4xXxzes5h0Bk=; b=bsBxXXODTXVMS56P7sCWnyjffm
	3vgidh8g/EydCMXwROQgz7kgBMCV/fgJhdFmekZ6Ep4Mql6GJHvgjjaKvXOOWlMlHF/IUoUWG99WH
	ADsJLYo/2PXj6w4sTBSlA1UJRfsyz1AZt7wumkXzLa+d3Yu4kvNaVfa+nO/83OmVl3ssyflX4Xu8r
	OqcRNvpuCdphXT0RwVRpWKH1k9KTqqVZSZuTDpN44x4PEkC6fUqA0pK/LRhCliFiZp5Y51++EO+Kb
	iQ077hElTEZM0dsHNUBkXdMyeF1guxq1smeimjdIyUwU382xwJgBJMF4/ch0v3a7DEfr5TafH34SR
	Tqrsrrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJs-0000000H0xi-2J66;
	Tue, 05 May 2026 17:12:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJr-0000000H0uu-0RHK;
	Tue, 05 May 2026 17:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tjyFB79RpcRjwJrLC2R/43QIEVjrqdz4xXxzes5h0Bk=; b=l2MMRq121pGK8tYSZx21cvhTyC
	IMPrKXaxhvUWiqtbAeKZR9yEjSRp2Daj/CAQqiowzjRWUoocYoXv7v248fn9jWQroVOH5O+MTtYzn
	6a0GBHDEUGAxjfqBNxQtv8RTOcrWwcxoiqgdT9231zoqg1ZyzZp03vdqE5/o05VV9xMceFHLF8VKN
	PuM7oU9jq1iggIrcOgDjV7uHJ26N7TVbJPRnXgyuC3lXVy+e+XVxfu4XE1ERzTJf+eHSh+nlpLQo+
	k2IFQRBx3LXSprn05+q8+EeMUByr6/ATo42pP0mnyy1c2NTiyf3NCVkfWCVLAJowkVaMABpQXbpiU
	Aap1U+eQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJJm-0000000E83b-30AU;
	Tue, 05 May 2026 17:12:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=tjyFB79RpcRjwJrLC2R/43QIEVjrqdz4xXxzes5h0Bk=; b=nAT0Mu0eL+/BMnEYCG2N/vHxgI
	FpVTJuolg7aG1Bko6fJjzUkAEA/vaGp94bKYMWcorxPTktEucqyHh5y1leCaiBfViDdixAhcn6QYM
	siNTsjCqgl6N/QKOwrJU8Pst924+tR7Q4m8v49ztqeNJcSgjtQWctBw0bAMDbCEBzwlxJvozw4z9N
	yCrknh9H7BrFIpgZHQy02GFx+YZZpTJFKlCKu2Tk7L8e69N92YEp7yuuIVRd6BkL5dFKrX6rAvk3/
	gnQE0VI3GwU2sWGVlICtiH/LzJnlVKctRMgUW+bwQIzHjZhAGMPPaf10ca+j3O63fWOyZykM5WWLp
	6Pr+DKrQ==;
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: jonas@kwiboo.se,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 2/5] arm64: dts: rockchip: Enable USB 2.0 ports on Radxa E20C
Date: Tue,  5 May 2026 19:12:05 +0200
Message-ID: <20260505171208.3267387-3-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505171208.3267387-1-heiko@sntech.de>
References: <20260505171208.3267387-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_181222_997206_03E0ECE2 
X-CRM114-Status: GOOD (  11.06  )
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

The Radxa E20C has one USB2.0 Type-A HOST port and one USB2.0 Type-C OTG
port.

Add support for using the USB 2.0 ports on Radxa E20C.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b32452756155..6fb7e624bb04 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -134,6 +134,18 @@ vcc5v0_sys: regulator-5v0-vcc-sys {
 		regulator-max-microvolt = <5000000>;
 	};
 
+	vcc5v0_usb20: regulator-5v0-vcc-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio0 RK_PA1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb_host_en>;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
 	vccio_sd: regulator-vccio-sd {
 		compatible = "regulator-gpio";
 		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
@@ -273,6 +285,12 @@ sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
 			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 	};
+
+	usb {
+		usb_host_en: usb-host-en {
+			rockchip,pins = <0 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &pwm1 {
@@ -320,3 +338,33 @@ &uart0 {
 	pinctrl-0 = <&uart0m0_xfer>;
 	status = "okay";
 };
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	extcon = <&usb2phy>;
+	maximum-speed = "high-speed";
+	phys = <&usb2phy_otg>;
+	phy-names = "usb2-phy";
+	snps,dis_u2_susphy_quirk;
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
+
+&usb2phy_otg {
+	status = "okay";
+};
-- 
2.47.3


