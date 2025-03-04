Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD418C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 20:20:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YjwIne5TvQyIGFZn7AOjsAAARhRhaBHJQjw6qbw1ro0=; b=CzC9+B2Nj97vYzDqtUG3HT5KgY
	JwVt8FZM1Iu8odH/HLdegJ5B46wia1sGUyBohJuBYIgIooaWEjOHSdd7qhdMo2zd4CHA6d3JTWtDk
	lr7IRYkK9+JJmuCgKjS5wUC782Oy6x3rAVG9nd5FPSakKSWHlETUbUM8yMQG+WAiRWMf1G3o20Ksd
	zz8kpQcPf1TyycOhilXco26P61i7dPcOp6J1WFJUz5ThuleBFedwxR4VIkbLSUUwlpAwW7RIq3lrH
	MOfP8NG74Rbi6BZZPx6FVhKoqWXOFH1HdWqn6vHGpjKFpJ3XB4PWlwfC5SFeK/4tqn+u/YiZUT056
	w2zEuFgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYkJ-00000006Ayn-0Yya;
	Tue, 04 Mar 2025 20:20:07 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpYhG-00000006AXP-0CLn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 20:16:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1741119417; bh=YjwIne5TvQyIGFZn7AOjsAAARhRhaBHJQjw6qbw1ro0=;
 b=jjozYlPzY/1EDw5yPf3JYWBmMYF4x/CR+hddJWUKSHnFSHZen0mIj3SxYKc0X4NF5cYousj0w
 S6hDypuI00es/IsJqJ3efojmzqSIiJvoPsUHKzbzxYGiOc/oQWnw23G9jOR+Ll45u9NhrQpju+J
 ifETV6gAoX1VOmw6HZM060QCmOKrbNPhoWSFVydztK7zuoZcNMSjgZoO4jSBd5XK+W5frgHKTl7
 aRpXAeaQ8cGXyO5/iW2QEvn408jCu6MtkRJ9VlXWgJNIrUj/4WVy5+sWafqny0AXijhd8jetvAv
 brqaKx+nXprBICY6ATYkk8u5s/G+Ta6t2l/xrTQitajg==
X-Forward-Email-ID: 67c75fb666a4509299dbdf80
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH v2 2/4] arm64: dts: rockchip: Add user button to Radxa E20C
Date: Tue,  4 Mar 2025 20:16:35 +0000
Message-ID: <20250304201642.831218-3-jonas@kwiboo.se>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250304201642.831218-1-jonas@kwiboo.se>
References: <20250304201642.831218-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_121658_176078_713AD970 
X-CRM114-Status: UNSURE (   9.92  )
X-CRM114-Notice: Please train this message.
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

Add support for the user button using a gpio-keys node.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v2: No change
---
 .../boot/dts/rockchip/rk3528-radxa-e20c.dts   | 20 +++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
index 7f0237206405..b378774d2a4e 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts
@@ -7,6 +7,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/input/input.h>
 #include <dt-bindings/leds/common.h>
 #include "rk3528.dtsi"
 
@@ -18,6 +19,19 @@ chosen {
 		stdout-path = "serial0:1500000n8";
 	};
 
+	gpio-keys {
+		compatible = "gpio-keys";
+		pinctrl-names = "default";
+		pinctrl-0 = <&user_key>;
+
+		button-user {
+			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
+			label = "USER";
+			linux,code = <BTN_1>;
+			wakeup-source;
+		};
+	};
+
 	leds {
 		compatible = "gpio-leds";
 		pinctrl-names = "default";
@@ -50,6 +64,12 @@ led-wan {
 };
 
 &pinctrl {
+	gpio-keys {
+		user_key: user-key {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
 	leds {
 		lan_led_g: lan-led-g {
 			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
-- 
2.48.1


