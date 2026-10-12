Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 661A6CA9ED1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Oct 2026 11:53:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2uSr6m5IUUmdJMVXqWyhLpSygHVE/kttYLhxfsdJVqg=; b=VOOX/5oMV+RpiReG8+TwFG3kS5
	p3iKKJJtK7Pb4ufYxLDxip1UYoDy0c69BTe+9e7mdCYt0dXCXVvsD2JKysHQwnYKm3CYFAYWbQRig
	tMP36DUTYzIMf4qtoRq8uXGC9pmUASMJuOBhFvKELj+Zy1PqIRc5TmttIRWeDY7DBapgHLxoUzv2M
	HCT7YTUdbeJp0+DfDxp6JleN2EOSt3GTDYEE5+ZrxugO5mHeKshlX93N/HJX35zwCNoIw5j8xJ8/d
	EhPquBWlHRBriP5GLl3L8Wc5CzXer9Gb8B3BnGQ0ftPyphlIuzyLKkElRiFUnGCT0DQWVDRz66zKN
	vjZpgPKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaS-0000000ANnG-1eMm;
	Mon, 12 Oct 2026 11:53:00 +0000
Received: from mail.cyberchaos.dev ([195.39.247.168])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGEaH-0000000ANj0-3GYz
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Oct 2026 11:52:53 +0000
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1791805963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2uSr6m5IUUmdJMVXqWyhLpSygHVE/kttYLhxfsdJVqg=;
	b=Wp7KX2VLLuZAs3LTcrC7KEjIJ4XLO/WSyu1zfa9D5A8/o46sENRr4dQ8ijiZBhAFRbpg1+
	/rkv6TjIIeJ3O4oGzZXvfglHiqsgO5KT85VMFhuWKC2wAaUxXyCKv6QvG1uDFI3f8MVMpn
	abTQ36GvOj81eXhH57dgy+geFgtDmJo=
Date: Mon, 12 Oct 2026 13:52:36 +0200
Subject: [PATCH 5/5] arm64: dts: apple: t8140: Add i2c nodes
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-5-6c757966a99e@cyberchaos.dev>
References: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
In-Reply-To: <20261012-apple-a18-pro-dt-pinctrl-i2c-v1-0-6c757966a99e@cyberchaos.dev>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andi Shyti <andi.shyti@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-i2c@vger.kernel.org, Yureka Lilian <yureka@cyberchaos.dev>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261012_045250_036834_8907716F 
X-CRM114-Status: UNSURE (   8.33  )
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

Add the i2c nodes in the Apple Silicon T8140 (A18 Pro) SoC. In the
MacBook Neo, i2c0 is used for the audio chip while the internal USB hub
and mux are connected to i2c2.

Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
 arch/arm64/boot/dts/apple/t8140.dtsi | 40 ++++++++++++++++++++++++++++++++++++
 1 file changed, 40 insertions(+)

diff --git a/arch/arm64/boot/dts/apple/t8140.dtsi b/arch/arm64/boot/dts/apple/t8140.dtsi
index 339a6b4f283d..3b4f7695552b 100644
--- a/arch/arm64/boot/dts/apple/t8140.dtsi
+++ b/arch/arm64/boot/dts/apple/t8140.dtsi
@@ -297,6 +297,46 @@ pinctrl_ap: pinctrl@31a000000 {
 			             <AIC_IRQ 269 IRQ_TYPE_LEVEL_HIGH>;
 
 			apple,npins = <216>;
+
+			i2c0_pins: i2c0-pins {
+				pinmux = <APPLE_PINMUX(171, 1)>,
+				         <APPLE_PINMUX(170, 1)>;
+			};
+
+			i2c2_pins: i2c2-pins {
+				pinmux = <APPLE_PINMUX(165, 1)>,
+				         <APPLE_PINMUX(164, 1)>;
+			};
+		};
+
+		i2c0: i2c@385010000 {
+			compatible = "apple,t8140-i2c", "apple,t8103-i2c";
+			reg = <0x3 0x85010000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1108 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c0_pins>;
+			pinctrl-names = "default";
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+			power-domains = <&ps_i2c0>;
+
+			status = "disabled";
+		};
+
+		i2c2: i2c@385018000 {
+			compatible = "apple,t8140-i2c", "apple,t8103-i2c";
+			reg = <0x3 0x85018000 0x0 0x4000>;
+			clocks = <&clkref>;
+			interrupt-parent = <&aic>;
+			interrupts = <AIC_IRQ 1110 IRQ_TYPE_LEVEL_HIGH>;
+			pinctrl-0 = <&i2c2_pins>;
+			pinctrl-names = "default";
+			#address-cells = <0x1>;
+			#size-cells = <0x0>;
+			power-domains = <&ps_i2c2>;
+
+			status = "disabled";
 		};
 
 		serial0: serial@385200000 {

-- 
2.55.0


