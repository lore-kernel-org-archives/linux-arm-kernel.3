Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7280FC3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 11 May 2025 08:33:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5gwPPBtOpIpp++16NBhzvhToSvAONPhVfZ9C/Q8+lYk=; b=spfQyJhRgcQ+yCGtYHKGmroGNZ
	NSHuUz5nJVHmrbtfSUkZX/2YDJkz9C2PDLuIeAbItmFdsDYTmeyW8lukM3VgPHFRd7Sn3+g1Ug/6O
	Ije+g5DFcEonKSeAfEEQ7V0LXwZePt/p+MzNFXRN+vuAo9bhEUFobFwdLmlreyoYj+kzcNCSqM7aR
	kMbtrkcC5qguWCzR75MEKIxRoAsjCtW+FTFTr4v7z7RsO6vx8dNrk/nenLGYCFCNP58G9wrmSKGxl
	b8/Sy5hePsM4cnYyhCLm3vZcXMC+8+cV2WaIncaD/mXgyA3ftk69tqpANb9c5iiOMC46nix+upB1Y
	WxstKCFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE27t-00000006x12-3rGM;
	Sun, 11 May 2025 08:33:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uE1tv-00000006vjp-35HA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 11 May 2025 08:19:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0CD044A86B;
	Sun, 11 May 2025 08:19:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AEDF1C116D0;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746951549;
	bh=gFsJ3sO48WGZPCtwcEY+er9dS43pV/euPP5vmSeW+Fw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=dDIXU9Z0CgYjmYOoiowUnW2MNxMk7dEI8bgqLVoohgftkMzrNgprNDiGHca0KzM0O
	 C9LJkGSjA2WAt2m9FpQTgEZra/NPe5h8OtTrLwpZkfOqRzXTywDAPsZFhjmQ/XdhB/
	 GnZQECORrG9AYdk7erhZBcrNlu8qiEZ3Qqj+STfs2m9a8LgbvxIr1yZ6xoKXE6B59S
	 +g5C5vJi4VRznzP/H78v2dGeePc5WunWbw7wCEg9Ltaob2L+T9ZWLzOBr3wVbqlVFc
	 4mNTftbazOWSSaoNZv/ZV08Q3RbF+VNUN71TsihPygi7F0cxCBdjpVyP9LpCifLbzQ
	 Lc6Od2hCrU+QQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A5B0AC3ABC3;
	Sun, 11 May 2025 08:19:09 +0000 (UTC)
From: Sven Peter via B4 Relay <devnull+sven.svenpeter.dev@kernel.org>
Date: Sun, 11 May 2025 08:18:45 +0000
Subject: [PATCH v5 10/10] arm64: dts: apple: t600x: Add SMC node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250511-smc-6-15-v5-10-f5980bdb18bd@svenpeter.dev>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1906; i=sven@svenpeter.dev;
 h=from:subject:message-id;
 bh=92m9tjkE/9fmIrwCKyHzSWjjFycxwyBc2n6Mji86KpA=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4ZCbNX/meHWDVVVucqnriznUl5kzrDinn9/j4zdasbNl
 5StDaQ6SlkYxDgYZMUUWbbvtzd98vCN4NJNl97DzGFlAhnCwMUpABN5f4aR4VbwjPpv98IVwjZx
 xW91NTbNb2deJLmmYrZR537FUyf5jRj+WT94s3fJVpc0j91Wy6+fnKv7uvbFFsOPahw3ls4Lkuv
 XZQEA
X-Developer-Key: i=sven@svenpeter.dev; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@svenpeter.dev/default with
 auth_id=167
X-Original-From: Sven Peter <sven@svenpeter.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250511_011911_885263_31F9855F 
X-CRM114-Status: UNSURE (   8.12  )
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
Reply-To: sven@svenpeter.dev
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

Signed-off-by: Hector Martin <marcan@marcan.st>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Signed-off-by: Sven Peter <sven@svenpeter.dev>
---
 arch/arm64/boot/dts/apple/t600x-die0.dtsi | 35 +++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t600x-die0.dtsi b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
index 110bc6719512e334e04b496fb157cb4368679957..4993a8ace87b2fc7e645b08c19fcd9b0c21896aa 100644
--- a/arch/arm64/boot/dts/apple/t600x-die0.dtsi
+++ b/arch/arm64/boot/dts/apple/t600x-die0.dtsi
@@ -24,6 +24,41 @@ aic: interrupt-controller@28e100000 {
 		power-domains = <&ps_aic>;
 	};
 
+	smc: smc@290400000 {
+		compatible = "apple,t6000-smc", "apple,smc";
+		reg = <0x2 0x90400000 0x0 0x4000>,
+			<0x2 0x91e00000 0x0 0x100000>;
+		reg-names = "smc", "sram";
+		mboxes = <&smc_mbox>;
+
+		smc_gpio: gpio {
+			compatible = "apple,smc-gpio";
+			gpio-controller;
+			#gpio-cells = <2>;
+		};
+
+		smc_reboot: reboot {
+			compatible = "apple,smc-reboot";
+			nvmem-cells = <&shutdown_flag>, <&boot_stage>,
+				<&boot_error_count>, <&panic_count>, <&pm_setting>;
+			nvmem-cell-names = "shutdown_flag", "boot_stage",
+				"boot_error_count", "panic_count", "pm_setting";
+		};
+	};
+
+	smc_mbox: mbox@290408000 {
+		compatible = "apple,t6000-asc-mailbox", "apple,asc-mailbox-v4";
+		reg = <0x2 0x90408000 0x0 0x4000>;
+		interrupt-parent = <&aic>;
+		interrupts = <AIC_IRQ 0 754 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 755 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 756 IRQ_TYPE_LEVEL_HIGH>,
+			<AIC_IRQ 0 757 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-names = "send-empty", "send-not-empty",
+			"recv-empty", "recv-not-empty";
+		#mbox-cells = <0>;
+	};
+
 	pinctrl_smc: pinctrl@290820000 {
 		compatible = "apple,t6000-pinctrl", "apple,pinctrl";
 		reg = <0x2 0x90820000 0x0 0x4000>;

-- 
2.34.1



