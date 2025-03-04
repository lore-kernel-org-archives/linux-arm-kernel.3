Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D3F6C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 21:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=44nkz0sv0GIrmXFRGFsYFzWfaFRmrSwGCiy2zDwKAPQ=; b=1oCWgWsnbfZImDCEiyI7uG1fDe
	7M8hiUfZJ88abPeoW3pQlvjJsqBb+QjQpITj6d8/7OL5HgGE5zCAya95h6/Xd+j4ZQOFp/7Ek9D2I
	asTv/eqhFQbIsKrCiOIi76kdC4gdwlE+mCyHRuKLE2i6lW+7sp9sOEO/6Qrmk+Bw5guIs2sSS6tVZ
	9bpVhEs2Vrg+/+POLgo6eZ73D/LnUiOnpIY5ZnopEwDaVqPd032Cc+fnlgoL/Z6AaLJA5Bm5VR7++
	oJ6xlqyf0acdr6Ne+JgY9f7cHXCnwk5ZX8BlS0kGBelcPCXb2fO11ytzNR8uTtD1kT1j/dcYzXSXq
	2RjG+tUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZPP-00000006FuJ-1QnP;
	Tue, 04 Mar 2025 21:02:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpZNo-00000006Ffh-1b0u
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 21:00:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741122055; bh=44nkz0sv0GIrmXFRGFsYFzWfaFRmrSwGCiy2zDwKAPQ=;
 b=auoEI0bhayDR8FoRCYIHAtzEOE9PbWK/HDtT3tMOxe9cmalthRRC129HwQOXzNOv8rDvWIJXG
 41meyJzwM+JarqhA30PxJ0cxxoWWtJKqeRMedQkoNA5GTvTrjqKiRq9NKNglWvRSaBvi6vwSnR9
 J1zfXvlYT3wKA1mfXbpLfDf/FHPSm5wqRxRM5pxsaKCsoeRMyXH50k2ljba0RA+DvCnN8WcIpWg
 eZFiPdTOAHdG054m78I1saKW0sSzh2Ze3tvNh9C7XqpwGefoywv5m9ZD6bo3ZzzUALilU7ZmuSJ
 HfXpFwoDQC+Yw+/swupqIcKuKQ7FJYDYeOoMQ9DFkv3Q==
X-Forward-Email-ID: 67c75fb366a4509299dbdf53
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
Subject: [PATCH v2 1/4] arm64: dts: rockchip: Add leds node to Radxa E20C
Date: Tue,  4 Mar 2025 20:16:34 +0000
Message-ID: <20250304201642.831218-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304201642.831218-1-jonas@kwiboo.se>
References: <20250304201642.831218-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_130056_503688_DD019F21 
X-CRM114-Status: GOOD (  10.32  )
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

Radxa E20C has three gpio controlled leds (sys, wan and lan).

Add led nodes and set default trigger to heartbeat for the sys led and
netdev for the lan and wan leds.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: Rename gpio-leds node to leds
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 48 +++++++++++++++++++
 1 file changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 5161d22330ab..7f0237206405 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -6,6 +6,8 @@
  */
 
 /dts-v1/;
+
+#include <dt-bindings/leds/common.h>
 #include "rk3528.dtsi"
 
 / {
@@ -15,6 +17,52 @@ / {
 	chosen {
 		stdout-path = "serial0:1500000n8";
 	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&lan_led_g>, <&sys_led_g>, <&wan_led_g>;
+
+		led-lan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_LAN;
+			gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+
+		led-sys {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio4 RK_PC1 GPIO_ACTIVE_LOW>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-wan {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_WAN;
+			gpios = <&gpio4 RK_PC0 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "netdev";
+		};
+	};
+};
+
+&pinctrl {
+	leds {
+		lan_led_g: lan-led-g {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		sys_led_g: sys-led-g {
+			rockchip,pins = <4 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wan_led_g: wan-led-g {
+			rockchip,pins = <4 RK_PC0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
 };
 
 &uart0 {
-- 
2.48.1


