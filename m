Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48C4BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Jun 2026 10:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Of5Pseiw1Okqs/9uIvscfVnyzxtGDayQKT+Zv91rDAU=; b=OjLtY10DpHVypJNhN45lDUCxtP
	TV2nlgdMSjCL9q0yNsog+92N5RsY3jDWaffz7BYLtyqIHJgFQklynZYQWcvMyPVDRNmdB9uQmY4vd
	n+fiMZljtTj5Ftu2U3j2b4eRmqPBP5pIX+o1Ja4mFMsvKNvPZOF/j4jodSa9uG7n5zdjKDvoOuPcm
	wpNVx/9gjVdWOazE8tsCF6dub1QRNUQNISbI6eMsfpUUU83p6jxRoyeuWUSQHFJpCucpXmw6ugAIy
	U5owHud99HjmUO6jkWVp00hm8ykU20Ysy7RzQx07J6VDGp4qr2sdtv9BuKRYawVzIHUTbff1+l0QB
	W+LB3Ypw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8ni-0000000EHE4-37Xm;
	Mon, 29 Jun 2026 10:01:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1we8ng-0000000EHDg-3qwB
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Jun 2026 10:01:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5D2EF409B5;
	Mon, 29 Jun 2026 10:01:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 3225BC19425;
	Mon, 29 Jun 2026 10:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1782727272;
	bh=rbgcrkj6z95Tpqoh9xStzNsaQrUhtiLAyJIzfA0gGDg=;
	h=From:Date:Subject:To:Cc:Reply-To:From;
	b=DCmrBkIJINrZGTToIVDyLNBHvawuYIFgAEi4hPjA1blHBacfPjR4KKmvCG+PSxeh9
	 hOvHVOlIaIsFPBdHlaWDTttljRYpthLJCdAg94hNUpVNRW5jO4CJ+SaczWnarKhL+t
	 QNIkgdRv53747ZJ+24dXvnqZeWjBf50dLXfhugvKskkIw0sViGmCDDNfqKRzlfFiKc
	 9DMpqnmgaVOBWCIY4MbwrAX66JyAcxvmq7xTr3wSIOjpVcFSH4X51+6Wxv+K0rzTac
	 2oPlQNGXuDQTJaLvBwfdLV0eRJnBQmGteXw/KA6Q+kupswEl0jL9nWDPfRxZ0YmG2n
	 y2plyJCUBv7tQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0E9BAC43458;
	Mon, 29 Jun 2026 10:01:12 +0000 (UTC)
From: Michael Reeves via B4 Relay <devnull+michael.reeves077.gmail.com@kernel.org>
Date: Mon, 29 Jun 2026 20:01:01 +1000
Subject: [PATCH] arm64: dts: apple: t8122: Fix I2C resources
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260629-t8122-i2c-fix-v1-1-cec044001550@gmail.com>
X-B4-Tracking: v=1; b=H4sIAFxCQmoC/x2MywqAIBAAfyX23IJtL+tXooPoVnux0IhA/Pek4
 wzMJIgchCPMVYLAj0Q5fYGmrsAexu+M4goDKRrUQBPeuiFCIYubvLi1o7NT3xltHJTmClz0/1v
 WnD8NkdvVXwAAAA==
X-Change-ID: 20260629-t8122-i2c-fix-f37dc954a8ad
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Joshua Peisach <jpeisach@ubuntu.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Michael Reeves <michael.reeves077@gmail.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782727271; l=3584;
 i=michael.reeves077@gmail.com; s=20260105; h=from:subject:message-id;
 bh=hlK9MIO4eVxPvoDNzV4TiPgH3mA8+0MVI+myk5cQbdQ=;
 b=vYF0LVjBAeCJcRh29ld6F43XBlcJxMcwpDIHly0ExE8C+l4bbcQoAmwrodt/K1BgAyA+/QP+v
 1coryZJwg20A0DSyZiyWQEwURtdFJQjZyyobYmlYB8v5roNUuRz/84f
X-Developer-Key: i=michael.reeves077@gmail.com; a=ed25519;
 pk=QIrgWBGCm3LG0YYc6MLCDkwuVXLTGGooVBdWX/KhSiU=
X-Endpoint-Received: by B4 Relay for michael.reeves077@gmail.com/20260105
 with auth_id=591
X-Original-From: Michael Reeves <michael.reeves077@gmail.com>
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
Reply-To: michael.reeves077@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Reeves <michael.reeves077@gmail.com>

Correct the MMIO ranges and IRQs for T8122 I2C controllers.
They were mistakenly incorrect in the original commit. This
fix is required for i2c dependent hardware to function
correctly, i.e. audio codecs.

Tested on J613 (MacBook Air M3).

Fixes: c65ab4905e58 ("arm64: dts: apple: Initial t8122 (M3) device trees")
Signed-off-by: Michael Reeves <michael.reeves077@gmail.com>
---
 arch/arm64/boot/dts/apple/t8122.dtsi | 30 +++++++++++++++---------------
 1 file changed, 15 insertions(+), 15 deletions(-)

diff --git a/arch/arm64/boot/dts/apple/t8122.dtsi b/arch/arm64/boot/dts/apple/t8122.dtsi
index c6196225e96e..1ee61c5b3409 100644
--- a/arch/arm64/boot/dts/apple/t8122.dtsi
+++ b/arch/arm64/boot/dts/apple/t8122.dtsi
@@ -186,12 +186,12 @@ soc {
 		/* Required to get >32-bit DMA via DARTs */
 		dma-ranges = <0 0 0 0 0xffffffff 0xffffc000>;
 
-		i2c0: i2c@235010000 {
+		i2c0: i2c@2a1010000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
-			reg = <0x2 0x35010000 0x0 0x4000>;
+			reg = <0x2 0xa1010000 0x0 0x4000>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 761 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <AIC_IRQ 780 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c0_pins>;
 			pinctrl-names = "default";
 			#address-cells = <0x1>;
@@ -200,12 +200,12 @@ i2c0: i2c@235010000 {
 			status = "disabled";
 		};
 
-		i2c1: i2c@235014000 {
+		i2c1: i2c@2a1014000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
-			reg = <0x2 0x35014000 0x0 0x4000>;
+			reg = <0x2 0xa1014000 0x0 0x4000>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 762 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <AIC_IRQ 781 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c1_pins>;
 			pinctrl-names = "default";
 			#address-cells = <0x1>;
@@ -214,12 +214,12 @@ i2c1: i2c@235014000 {
 			status = "disabled";
 		};
 
-		i2c2: i2c@235018000 {
+		i2c2: i2c@2a1018000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
-			reg = <0x2 0x35018000 0x0 0x4000>;
+			reg = <0x2 0xa1018000 0x0 0x4000>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 763 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <AIC_IRQ 782 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c2_pins>;
 			pinctrl-names = "default";
 			#address-cells = <0x1>;
@@ -228,12 +228,12 @@ i2c2: i2c@235018000 {
 			status = "disabled";
 		};
 
-		i2c3: i2c@23501c000 {
+		i2c3: i2c@2a101c000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
-			reg = <0x2 0x3501c000 0x0 0x4000>;
+			reg = <0x2 0xa101c000 0x0 0x4000>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 764 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <AIC_IRQ 783 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c3_pins>;
 			pinctrl-names = "default";
 			#address-cells = <0x1>;
@@ -242,12 +242,12 @@ i2c3: i2c@23501c000 {
 			status = "disabled";
 		};
 
-		i2c4: i2c@235020000 {
+		i2c4: i2c@2a1020000 {
 			compatible = "apple,t8122-i2c", "apple,t8103-i2c";
-			reg = <0x2 0x35020000 0x0 0x4000>;
+			reg = <0x2 0xa1020000 0x0 0x4000>;
 			clocks = <&clkref>;
 			interrupt-parent = <&aic>;
-			interrupts = <AIC_IRQ 765 IRQ_TYPE_LEVEL_HIGH>;
+			interrupts = <AIC_IRQ 784 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-0 = <&i2c4_pins>;
 			pinctrl-names = "default";
 			#address-cells = <0x1>;

---
base-commit: dc59e4fea9d83f03bad6bddf3fa2e52491777482
change-id: 20260629-t8122-i2c-fix-f37dc954a8ad

Best regards,
-- 
Michael Reeves <michael.reeves077@gmail.com>



