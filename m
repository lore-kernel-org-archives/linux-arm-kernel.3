Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05654C2A079
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  4 Jan 2026 19:15:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lUuUqLfpAlmABnYAK2UNaASJ2eI1qRm0coIFUL1U6Yk=; b=IOc67lxsApwEC/+oa0GZZxXjxz
	ljCeGsUWpD8A6cBYt203nlTyWER3ITDu61YXl4zGgQnzObFSjntZzusYMfwVXXQafFFg183FtXWpQ
	S4TjO4gVKhp/QoG/hysj7D1nV64/OVLynFFo/26e8k4yoWb4o4D/+JMFnJ8A75/zdMGMSJRY4alaI
	jDeSTpNy+ozqQP+jjoJNKUdbSPaL+5ETFRse3t84xik3zlt/QvsPwY9W9erE+dM0I0Lhmpk3cntDD
	wd1fhQCgV7F77moTGK1xCC553g9L32ydn/yWQyHarfWai4XUAHaVMEWMfj/Hy7RHd5QxAfxBurgJx
	1ZbsFG1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZO-0000000AOnm-01cZ;
	Sun, 04 Jan 2026 19:15:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcTZJ-0000000AOk6-28vM;
	Sun, 04 Jan 2026 19:15:15 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=lUuUqLfpAlmABnYAK2UNaASJ2eI1qRm0coIFUL1U6Yk=; b=QK2PW0SfBWpNRaJHKZfD3qKV/k
	6L1Jvy0BUw9t4pOUmspyT8qOOPIhf20WFQ/Ot4uB8p/+jXC5Las7ORDD21xqk8v751O2NbHr/QBqW
	nz0w7OQlXjDqoM+ljNZpDcB+JVQalfq837xS1XDzso9G5emQUjOdKkVZqKIsbW8/mwuXVxsQbRw3s
	+V3Vu8gOviKW1i41w89gcR33PkG0sq5KLmx7MlVRpC9xV3ivYD///Yke55Pfdh0VLrgB7fLDPNyMD
	S4r/UPRezw3CiGmv9TME+hZa5Rvq5zZhIv1k6ytUXEqyI+Sh4LWTYn5IrhYFfT5a2VwfTSMYpEWtR
	aw6ibmmw==;
Received: from i53875ac4.versanet.de ([83.135.90.196] helo=phil..)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vcTZB-0012Mf-5q; Sun, 04 Jan 2026 20:15:05 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	uwe@kleine-koenig.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/5] arm64: dts: rockchip: Move copy-key to TSx33 board files
Date: Sun,  4 Jan 2026 20:14:46 +0100
Message-ID: <20260104191448.2693309-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20260104191448.2693309-1-heiko@sntech.de>
References: <20260104191448.2693309-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260104_111513_557176_E15CC4B1 
X-CRM114-Status: GOOD (  13.29  )
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

The copy-key is not present on all device variants, so move it to
the individual boards that have this key.

Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts  | 11 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts  | 11 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi | 10 ++--------
 3 files changed, 24 insertions(+), 8 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
index e76502180788..52b741376ef5 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts
@@ -51,6 +51,17 @@ eeprom@56 {
 	};
 };
 
+&keys {
+		pinctrl-names = "default";
+		pinctrl-0 = <&copy_button_pin>, <&reset_button_pin>;
+
+		key-copy {
+			label = "copy";
+			gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_COPY>;
+		};
+};
+
 &leds {
 	led-1 {
 		color = <LED_COLOR_ID_GREEN>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
index 708e7f1f8d0d..7d2aedfe616d 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts
@@ -61,6 +61,17 @@ eeprom@56 {
 	};
 };
 
+&keys {
+		pinctrl-names = "default";
+		pinctrl-0 = <&copy_button_pin>, <&reset_button_pin>;
+
+		key-copy {
+			label = "copy";
+			gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_LOW>;
+			linux,code = <KEY_COPY>;
+		};
+};
+
 &leds {
 	led-1 {
 		color = <LED_COLOR_ID_GREEN>;
diff --git a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
index 482d8584ec88..cca7b7d0685f 100644
--- a/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi
@@ -12,17 +12,11 @@ chosen {
 		stdout-path = "serial2:115200n8";
 	};
 
-	keys {
+	keys: keys {
 		compatible = "gpio-keys";
-		pinctrl-0 = <&copy_button_pin>, <&reset_button_pin>;
+		pinctrl-0 = <&reset_button_pin>;
 		pinctrl-names = "default";
 
-		key-copy {
-			label = "copy";
-			gpios = <&gpio0 RK_PB6 GPIO_ACTIVE_LOW>;
-			linux,code = <KEY_COPY>;
-		};
-
 		key-reset {
 			label = "reset";
 			gpios = <&gpio0 RK_PB5 GPIO_ACTIVE_LOW>;
-- 
2.47.2


