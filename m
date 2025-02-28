Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5ECCAC19776
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 13:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1/KPza773U4ZAtfv2ADrHNglgC1639YAh+ulMqKIYV8=; b=MWfx2j3DN1StTVQDhl+LSHgYBH
	ogyT9aPoBTZlgEEEw0zLbuxk0hv5/miJAwlOp2Lce3QDh6+bHZSoO7dSA3rxQnjmYbVY7OFRRc+Dr
	xylbsPCMOQiCCEeIv+FP079cd+kEeaS22+rFBe/f80x2OMlhHfQE62+lsDbG2/G9WHypPkkmcjoJp
	rQkTcTmhg8cO/M+7JCv8DaE0vyGPDr086v1Yuo2G8PpAuEFK0VcLRT4qBEKcUvufEKSrzxtVddrCd
	7dJIdAcHXQFcypfW6EHptcp5T0b+9ozV2Xmj0oQmmSQvnpYZZ+IeheDP8LuTGxPiNkPKfSAyy4bgf
	8cJTB8jw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1to0I6-0000000B3mS-3tZV;
	Fri, 28 Feb 2025 13:20:34 +0000
Received: from mail.manjaro.org ([116.203.91.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1to0DP-0000000B2qD-0B4y;
	Fri, 28 Feb 2025 13:15:44 +0000
From: Dragan Simic <dsimic@manjaro.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=manjaro.org; s=2021;
	t=1740748539;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1/KPza773U4ZAtfv2ADrHNglgC1639YAh+ulMqKIYV8=;
	b=kPe4pB8QfH0t26AvlrjftXluSDJSZEY18CXtmvJdWvvaAlXUIWSeN0xE1fVGTEXsoCDWez
	Bn0jjcpDlZvgrd3vZMgICUmwQpNci26Gcb7biW7CTYnYq8n2bgypBnsTY69KCqHI2JiwYI
	rvyGhXKePJGo0kMoONZLCfFBoVEYlFaXvPLvwg9GLNYdAlkbfs1RnSD2v5/TlcsH1llioU
	NgTOU0yE9gDi73Egcwe3KEal2s3GEJUJ49lPUvP+XhqKfYhbMOB33maFNTgyKXN3HDicYu
	TEgwZi2zPYn8QCcBG25SKdqS6YLZwWS4Z1doDilP5pOJ8n6SU7H97bD2fIvuGw==
To: linux-rockchip@lists.infradead.org
Cc: heiko@sntech.de,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH 1/2] arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
Date: Fri, 28 Feb 2025 14:15:28 +0100
Message-Id: <3deb832a4c6266d1820eaea02db8805c1d952938.1740748439.git.dsimic@manjaro.org>
In-Reply-To: <cover.1740748439.git.dsimic@manjaro.org>
References: <cover.1740748439.git.dsimic@manjaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Authentication-Results: ORIGINATING;
	auth=pass smtp.auth=dsimic@manjaro.org smtp.mailfrom=dsimic@manjaro.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250228_051543_226922_20D72DDB 
X-CRM114-Status: GOOD (  11.02  )
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

