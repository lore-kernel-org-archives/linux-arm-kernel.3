Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF844C282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:04:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VymoCBuQbJVOZiQ8kCmp23B7JKJ6M1aDwHI+dP/rK28=; b=PHIGorHJkxWe+vtVPfproOrF/Q
	iIyJ29rZkwjY+qiXwFNu/dpz5b6Ay50Bl4Pp2KmMYlRDFhX7SKasL2ZQBiz4Ir8DyeS11eD3JsZwc
	FydsHlnlMQFYudd4/8EdmeItFVNrJuScnaUEA4DJzMKHYLOFPPD8V0AySGOCTJA+CT4e5CNUPzjDG
	3cJEeUrIb3vgB4fyJd3OlDckC8pciqsyYKoKIIEsL3bq3sZo6ilQE8z762JnFyPkzkQRT45gUqbU6
	SdG7sSlkd9RVdiA4HOE7KEC3oNiNWktMQC9MVdRx2YpErspQUeGsYd+B7zMaz/0gIeTZVv9XV1ZtW
	23TPm/EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZQx-00000006G5L-48Qk;
	Tue, 04 Mar 2025 21:04:11 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZNo-00000006Ffi-1axf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741122055; bh=VymoCBuQbJVOZiQ8kCmp23B7JKJ6M1aDwHI+dP/rK28=;
 b=bzts/3BIpH+PbAoCuF59cxARnZpfv74jlYoEE/WeltA561mfKFMJUGiAAmTaI+6besWQBXG0i
 0w571jaY4AuzuLnDP666WmffN8sHhWpUtsbtYnlYc7yc8X7LDhBd/LAGpGS36c0dzORRRg6pXnB
 2l2Oa3mCCLhpbrsPdYxku8deVIJSHRFStbw26HfeOzxYbmTjB8a7s+ai8XeTmxXrb08lpN2OnPe
 LwbPXTK9TRO5gXB7h7dZZBdm2a5gazA5SnB3JIh0E48KeJLPTDpo7Ssw2unZShcmTFNWGIiNXGk
 tximCOEDSa9yQ/eyw2LvjqW5xFvvf4fZIBQVhAutckCw==
X-Forward-Email-ID: 67c75fbd66a4509299dbdfaa
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v2 4/4] arm64: dts: rockchip: Add maskrom button to Radxa E20C
Date: Tue,  4 Mar 2025 20:16:37 +0000
Message-ID: <20250304201642.831218-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304201642.831218-1-jonas@kwiboo.se>
References: <20250304201642.831218-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_130056_503762_106005FC 
X-CRM114-Status: GOOD (  10.51  )
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

Radxa E20C has two buttons, one SARADC maskrom button and one GPIO user
button.

Add support for the maskrom button using a adc-keys node, also add the
regulators used by SARADC controller.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index b378774d2a4e..5346ef457c2a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -19,6 +19,20 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
 	gpio-keys {
 		compatible = "gpio-keys";
 		pinctrl-names = "default";
@@ -61,6 +75,35 @@ led-wan {
 			linux,default-trigger = "netdev";
 		};
 	};
+
+	vcc_1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc_3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
 };
 
 &pinctrl {
@@ -85,6 +128,11 @@ wan_led_g: wan-led-g {
 	};
 };
 
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
 &uart0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&uart0m0_xfer>;
-- 
2.48.1


