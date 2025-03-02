Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9CECC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  2 Mar 2025 18:50:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gQcmtYRJ6ZBHGuG3ItZvKIEimpluYI6lauZf8aMldM=; b=kQr3BulIy5oPk16WME0NrmntHE
	HGUgtXuGG1R5Rr0F/ON7MH6KZBR5OiIeZJoEvWya8tYMIpxysauDHkjRZKqW5r4mxSlds/8MPwSBB
	NZhXP9V66dEcyh29uuMXPO7mCp4yW/Cm0rmIaMCXoN1Qb40H989ax4y5gHvS0y1XoJFiCq2vAQyH0
	wiVd0azUIkEMROsscVLajb9z+30wmXA8x5Q/jbia6lkh9+fwJK/STcejyFvPs6h+JRSjm692LSoRw
	oq1MPmNKRq86NDj9d/Lda0yjexrBI+KZv1qm1zEIpliGj0l9/A9Zr+3ZY4Gc1DV912XvNFrsWpVcY
	kPwp96hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tooNv-0000000GX4h-48ll;
	Sun, 02 Mar 2025 18:49:55 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tooMM-0000000GWuI-3kvZ;
	Sun, 02 Mar 2025 18:48:20 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740941293;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5gQcmtYRJ6ZBHGuG3ItZvKIEimpluYI6lauZf8aMldM=;
	b=HUYGW807T4tqTNe8WFbayXXrWnHqGZwm0xvJeJJ97W21KmzfpUIL8q56xt8ETuvwDXfpHa
	HzqUDkM0TbRXfnE+WJWMrmNg/fpJT/zZxXWju8a/C7plyQhovZzAoW9mHKBqr++sQb0Lj2
	Ig1XHeR9kwmQHIGvTuWdIVG6sCHUnzi+OvRMq7pY6BULOS3s9cHBoRVXbpRqbYMi4FJyEF
	2tnrSlBwpFwMSevXUTzZuL+1khukgSp37yturt7o0SJSn6XtlKPd7vOTkCmUfYNf1bq0Xx
	9FGJIYuG1C7AB8q2GkLziYQGRYnmF41ePW9KxadYWXM+83TgRW35VdYVKkhVrA==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	didi.debian@cknow.org,
	chris@z9.de,
	stable@vger.kernel.org
Subject: [PATCH v2 1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
Date: Sun,  2 Mar 2025 19:48:03 +0100
Message-Id: <df3d7e8fe74ed5e727e085b18c395260537bb5ac.1740941097.git.dsimic@manjaro.org>
In-Reply-To: <cover.1740941097.git.dsimic@manjaro.org>
References: <cover.1740941097.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250302_104819_083582_690D19CD 
X-CRM114-Status: GOOD (  11.01  )
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

Add missing "avdd-0v9-supply" and "avdd-1v8-supply" properties to the "hdmi"
node in the Pine64 RockPro64 board dtsi file.  To achieve this, also add the
associated "vcca_0v9" regulator that produces the 0.9 V supply, [1][2] which
hasn't been defined previously in the board dtsi file.

This also eliminates the following warnings from the kernel log:

  dwhdmi-rockchip ff940000.hdmi: supply avdd-0v9 not found, using dummy regulator
  dwhdmi-rockchip ff940000.hdmi: supply avdd-1v8 not found, using dummy regulator

There are no functional changes to the way board works with these additions,
because the "vcc1v8_dvp" and "vcca_0v9" regulators are always enabled, [1][2]
but these additions improve the accuracy of hardware description.

These changes apply to the both supported hardware revisions of the Pine64
RockPro64, i.e. to the production-run revisions 2.0 and 2.1. [1][2]

[1] https://files.pine64.org/doc/rockpro64/rockpro64_v21-SCH.pdf
[2] https://files.pine64.org/doc/rockpro64/rockpro64_v20-SCH.pdf

Fixes: e4f3fb490967 ("arm64: dts: rockchip: add initial dts support for Rockpro64")
Cc: stable@vger.kernel.org
Suggested-by: Diederik de Haas <didi.debian@cknow.org>
Signed-off-by: Dragan Simic <dsimic@manjaro.org>
---
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
index 69a9d6170649..47dc198706c8 100644
--- a/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi
@@ -227,6 +227,16 @@ vcc5v0_usb: regulator-vcc5v0-usb {
 		vin-supply = <&vcc12v_dcin>;
 	};
 
+	vcca_0v9: regulator-vcca-0v9 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcca_0v9";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc3v3_sys>;
+	};
+
 	vdd_log: regulator-vdd-log {
 		compatible = "pwm-regulator";
 		pwms = <&pwm2 0 25000 1>;
@@ -312,6 +322,8 @@ &gmac {
 };
 
 &hdmi {
+	avdd-0v9-supply = <&vcca_0v9>;
+	avdd-1v8-supply = <&vcc1v8_dvp>;
 	ddc-i2c-bus = <&i2c3>;
 	pinctrl-names = "default";
 	pinctrl-0 = <&hdmi_cec>;

