Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86652C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 08:25:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kL8IeaRPZgdXDt9toDeaebIJa4xdkCZj0Gm4jxdLFq8=; b=ARaeB4V23oM/8KPeiBpJwH3Az1
	hTGEHBOVMxVKpTpae7PmjlyaZl/XmBHA0VFM0wkGHPYVA2EUS3tYeqzP59qSutF8PcvCXwMU20NvC
	Igeidux2wLDTfEO8n9T/SoT1u2iB/Is+MwsWP2ctWHhLc/vjRUMXsK6cqivWc1x+D0qcgZI2bCndK
	9oKKbPSQpJ4S5kEkORYx1FAbSznkexlr6s42hHJ7jzCJqTkJsz49U0aoih5R0iPmZir+W7hUh+gh+
	VUL0EuYqOZZh2Ahr0YI0DIETn5Bf1rRTDHXGGZntdma861tHcIaD/+5Tcox+k8uOS287y7hoIZWvh
	xrt6xQ8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE1zq-00000006wTl-46Ba;
	Sun, 11 May 2025 08:25:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE1tu-00000006vjU-3n5P
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 08:19:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2FCA0629D1;
	Sun, 11 May 2025 08:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8DBDDC4CEFF;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746951549;
	bh=aiw/oauXgAfultzR8biAhlLTScTQ5mj7r9Ng7qSiRtY=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=QyOtcfePhpY0ZqqcsTXVv3JCYPV7TrdSdgFfcs8I4a8atdOeWSJoQezaN+6+a5dFE
	 aYpKNbqoWJmULytMVq9zTI6Bm3Y0vhJIHeH/cwj3LF/bloexM3ptzhBXOHCi4R8XDs
	 fbpNESXU0+JXGDhhaAh9Lj46IVgmy7z4UhStC2f4O6fUsFvAgsgM4my5paAjy2R56P
	 FtSNIJv1vGBgUa1wprqYxr1DV36qqJeHaT1HL1VCij3N36jGY1pl8zL9dRs8YDtSbc
	 CQBsDgRA/dupslN4iuH9iZnt4PIplVFT+8f9zxEKCqRy/NMh/fgvE0uej9UrgMkZGx
	 2CBrZnlVkQLng==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 84D87C3ABD2;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 11 May 2025 08:18:44 +0000
Subject: [PATCH v5 09/10] arm64: dts: apple: t8112: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-smc-6-15-v5-9-f5980bdb18bd@svenpeter.dev>
References: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
In-Reply-To: <20250511-smc-6-15-v5-0-f5980bdb18bd@svenpeter.dev>
To: Sven Peter <sven@svenpeter.dev>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Hector Martin <marcan@marcan.st>, Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Sebastian Reichel <sre@kernel.org>, 
 Lee Jones <lee@kernel.org>, Marc Zyngier <maz@kernel.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1883; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=ofBto6ujzQFjs/gKnvleZvE09SOVHZi7r6UzS12OLx0=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZCbOV9uWr+CU+tD/quivnf98Rb69/dAq/fpw5u43i8f
 Pu9P7+udZSyMIhxMMiKKbJs329v+uThG8Glmy69h5nDygQyhIGLUwAmYpPN8Fcq/ldn9D2N9r/r
 v7E5VH1uWGojmyrc9OR6196aDRwvazYy/GS8u2WBatKb3vbtsooWnSUrL9zbc1r5ZOKXvfMO9zy
 VYOEFAA==
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t8112.dtsi | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8112.dtsi b/arch/arm64/boot/dts/apple/t8112.dtsi
index e95711d8337f6cea898e88a3d564caf2c4f94404..861cf2f684a067d73f79d8f01447bc375136793d 100644
--- a/arch/arm64/boot/dts/apple/t8112.dtsi
+++ b/arch/arm64/boot/dts/apple/t8112.dtsi
@@ -839,6 +839,41 @@ rtc_offset: rtc-offset@f900 {
 			};
 		};
 
+		smc: smc@23e400000 {
+			compatible = "apple,t8112-smc", "apple,smc";
+			reg = <0x2 0x3e400000 0x0 0x4000>,
+				<0x2 0x3fe00000 0x0 0x100000>;
+			reg-names = "smc", "sram";
+			mboxes = <&smc_mbox>;
+
+			smc_gpio: gpio {
+				compatible = "apple,smc-gpio";
+				gpio-controller;
+				#gpio-cells = <2>;
+			};
+
+			smc_reboot: reboot {
+				compatible = "apple,smc-reboot";
+				nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+					<&boot_error_count>, <&panic_count>, <&pm_setting>;
+				nvmem-cell-names = "shutdown_flag", "boot_stage",
+					"boot_error_count", "panic_count", "pm_setting";
+			};
+		};
+
+		smc_mbox: mbox@23e408000 {
+			compatible = "apple,t8112-asc-mailbox", "apple,asc-mailbox-v4";
+			reg = <0x2 0x3e408000 0x0 0x4000>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 499 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 500 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 501 IRQ_TYPE_LEVEL_HIGH>,
+				<AIC_IRQ 502 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "send-empty", "send-not-empty",
+				"recv-empty", "recv-not-empty";
+			#mbox-cells = <0>;
+		};
+
 		pinctrl_smc: pinctrl@23e820000 {
 			compatible = "apple,t8112-pinctrl", "apple,pinctrl";
 			reg = <0x2 0x3e820000 0x0 0x4000>;

-- 
2.34.1



