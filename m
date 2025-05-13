Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB43C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 May 2025 17:08:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=zxp5saJ00M0V4HD55ygHhJp7ySrhrAQhBKVNcX+nZcA=; b=fNAZTas7jy7v4UQt5ySH/IOD8P
	TSXBFE0ATADHPpStVvWZi6O+GWcDLPvTqeN1dIg+7+POYFpQujmJ3Sjn6ouxo80NvyBLv4r5k35XU
	o2F3s8R5gU5s4Ao0zzSWmFzs6xINSrqBAoDJnjRwglc4KXBGfj+kjT74Kgl44SVzNroBwJHL2ZCLa
	8fSVK9OEohUw5KOXF7cz3YDEGkea3HXjyu+qmQcw9baPwLhj7FedyfBx8iw3edQla1vHApGtn1yLx
	HJaR8xPJk49ua2sFSdCu387KXuTxJUE3flTpgPvN7PwF6H+4UJ2XrtHlR1LueJCo4A2M3TGHz05vl
	fbD5T6ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEt6z-0000000D2Bh-0X8J;
	Tue, 13 May 2025 17:08:13 +0000
Received: from out-171.mta0.migadu.com ([91.218.175.171])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uEt0Q-0000000D18U-2LVX
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 May 2025 17:01:28 +0000
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1747155674;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding;
	bh=zxp5saJ00M0V4HD55ygHhJp7ySrhrAQhBKVNcX+nZcA=;
	b=Otc68QU84N5ZqYJGbMPb31Z9ICWeBRz9p/HX0/+qKkt37fDhjWsr9FQCOwbDW/cyICpCMU
	vYdzQ7SzmLwNmd5/MSwXmAZmaS9J0AZ6q435rWS7Zq6lLuX3XL+0tx3GRj850YH8QxG3Sv
	+ZnjrzgbEprC5Hf+82AMa4JaAZkHkaECyd4adpcMrLJnzRl0qXN3eeNB1cfQSxXmaeZvBV
	15xh8kPFVeq36oS+lOsPgT9DrD4a3Wt+/aCPiFQ7sprgNrJeSlQaGIurXD38flngsr4LEs
	UdgT0fSwAfKanyXq9LA47m56u42KjID6Ag8p/QV0sNkWnK/5neWrwBdxiQoiqg==
From: Diederik de Haas <didi.debian@cknow.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Dragan Simic <dsimic@manjaro.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Tianling Shen <cnsztl@gmail.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH] arm64: dts: rockchip: Improve LED config for NanoPi R5S
Date: Tue, 13 May 2025 18:57:27 +0200
Message-ID: <20250513170056.96259-1-didi.debian@cknow.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250513_100126_735902_254F0C14 
X-CRM114-Status: GOOD (  11.11  )
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

The NanoPi R5S has 4 GPIO LEDs, a RED one for SYStem power and 3 green
LEDs meant to indicate that a cable is connected to either of the
2.5GbE LAN ports or the 1GbE WAN port.

In the NanoPi R5S schematic (2204; page 19) as well as on the PCB and on
the case, SYS is used and not POWER. So replace 'power' with 'sys'.
But keep the 'power_led' label/phandle even though the kernel doesn't
use it, but it may be used outside of it.

The SYStem LED already had "heartbeat" as its default-trigger.
Set the default-trigger to "netdev" for the NICs so they will show when
LAN1/LAN2/WAN is connected and set their default-state to "off".

Also assign labels as close as possible to the labels on the case, while
still being descriptive enough in their own right.

Signed-off-by: Diederik de Haas <didi.debian@cknow.org>
---
 .../boot/dts/rockchip/rk3568-nanopi-r5s.dts    | 18 ++++++++++++++----
 1 file changed, 14 insertions(+), 4 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
index 4cb8df1129c0..3b31f0dd8f3b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts
@@ -20,33 +20,43 @@ aliases {
 	gpio-leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
-		pinctrl-0 = <&lan1_led_pin>, <&lan2_led_pin>, <&power_led_pin>, <&wan_led_pin>;
+		pinctrl-0 = <&lan1_led_pin>, <&lan2_led_pin>, <&sys_led_pin>, <&wan_led_pin>;
 
 		led-lan1 {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_LAN;
 			function-enumerator = <1>;
 			gpios = <&gpio3 RK_PD6 GPIO_ACTIVE_HIGH>;
+			label = "LAN-1";
+			linux,default-trigger = "netdev";
 		};
 
 		led-lan2 {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_LAN;
 			function-enumerator = <2>;
 			gpios = <&gpio3 RK_PD7 GPIO_ACTIVE_HIGH>;
+			label = "LAN-2";
+			linux,default-trigger = "netdev";
 		};
 
-		power_led: led-power {
+		power_led: led-sys {
 			color = <LED_COLOR_ID_RED>;
 			function = LED_FUNCTION_POWER;
-			linux,default-trigger = "heartbeat";
 			gpios = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
+			label = "SYS";
+			linux,default-trigger = "heartbeat";
 		};
 
 		led-wan {
 			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
 			function = LED_FUNCTION_WAN;
 			gpios = <&gpio2 RK_PC1 GPIO_ACTIVE_HIGH>;
+			label = "WAN";
+			linux,default-trigger = "netdev";
 		};
 	};
 };
@@ -126,7 +136,7 @@ lan2_led_pin: lan2-led-pin {
 			rockchip,pins = <3 RK_PD7 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-		power_led_pin: power-led-pin {
+		sys_led_pin: sys-led-pin {
 			rockchip,pins = <4 RK_PD2 RK_FUNC_GPIO &pcfg_pull_none>;
 		};
 
-- 
2.49.0


