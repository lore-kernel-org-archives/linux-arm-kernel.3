Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7865C61DB2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3ftL4BF586/DJx9bVaSYqrCqMYQWKuYBL6A7TcAsvAs=; b=tcvmqiBxswaf9VsCi/XhooTSDY
	GmFv77sLrGMjiiUxc86NTkbnaEUhxu0owgHr26w2WfUAzj3vMAszfzx64Ax438668RGgUCo1er8af
	TrDH7DBr4m2FkLyetl5S9MBWh5WSsIMUtA8LpRMquKCVk09OPjTRSF/fG+kuIpFlT/Oo9dJ2Gj65H
	bkC6IsOIlZGA8aLebwWepd5zB1tc/ZBfIe2dj8qHpZUNQ1no6tLNjkjkwxx0wkE75BPb+0Oft1c+w
	uMU88S21yI3mEv3L/XmsqsuYHJshzezSAC1XD4JqV3IXJ1IV23BIHDy7iiBF4XhiMrbms296/Ki+t
	0ibAS+5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7l9-00000008EbB-3eqC;
	Tue, 10 Jun 2025 22:47:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Ym-00000007QoO-144k
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 10 Jun 2025 16:10:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=3ftL4BF586/DJx9bVaSYqrCqMYQWKuYBL6A7TcAsvAs=; b=Z9fM8BNF96evw1hfhEug6K2lK/
	EZATycb4v4W+82Y3rn0IqXkjxpM/pT20V0ONi4Uw5oo0mpKuVLM+1r1vaV9eQn9nNMQt2815x/RBL
	nLTpvErk1iFi4aCkaxLhVQG467iE2uifuDyXWDGaOTiLrBZ8QV/O85XihyxKNHhRZd2hCDvhiCJxR
	aXK43V/1o6bcFiw3zjKqB8uHhWp1A5/UgXeoJ0bKbPyjrgGyMfaIHLzNf+/hAP4IMxT8wrerfGeFb
	2Ke1Gm+V2UJoAxs8fsBNaRe7zvYSE3qbPQp2dVT7ujBcZsG/8+/OzjrNvh/TevbR1TCcTc2UnakRF
	NU1B64/g==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP1Yi-00000001vWy-0X7m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 16:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 085235C5756;
	Tue, 10 Jun 2025 16:08:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 58DAEC4CEF1;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749571839;
	bh=KS5KZh83WhFoHDXQ2W/EWKz/ArbrhyBg7ZBRgDlrWe0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pRNaShsw9P/X545nF4QHLzjKgNg+/bfrWYi9K41GQwFLdXCk68IqRKuikjRKzqeB+
	 UHKYuSlHn9H8QN2vwHQKk5JISMQpGQj/X93MxMJZ1GTmoyMERNt4zPvlfiEOHKM4jD
	 oXOTcF8aDb9QoGix11vYnWyxDu6TA1vsXpF1TutFc7xQyj+uWSMmFI91BaFEB7HhNJ
	 P/C45cJkhGq4nVLSA43bJqRzB3OwE7UMoCMtMR78oBM5YqRNV8Pa+rW1UUD12T8C8f
	 LAwwCziocHCt5d/EyafqSOYJROSnU1MrfGKhri7FBaIk8ebPurP7df7OPhttFhBF53
	 JQzDjLiZmoZqw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46AD6C71130;
	Tue, 10 Jun 2025 16:10:39 +0000 (UTC)
From: Sven Peter <sven@kernel.org>
Date: Tue, 10 Jun 2025 15:29:42 +0000
Subject: [PATCH v7 01/10] dt-bindings: gpio: Add Apple Mac SMC GPIO block
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250610-smc-6-15-v7-1-556cafd771d3@kernel.org>
References: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
In-Reply-To: <20250610-smc-6-15-v7-0-556cafd771d3@kernel.org>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2261; i=sven@kernel.org;
 h=from:subject:message-id;
 bh=Dle4XqGGzX04NP6gmHjHUQRP+Y2skcv80CBrmz9twWY=;
 b=owGbwMvMwCHmIlirolUq95LxtFoSQ4aHf2FxrPtsXTfRtF9zLz97Kjp3MbOF5JIFWtfZo/0r1
 L9IdUV3lLIwiHEwyIopsmzfb2/65OEbwaWbLr2HmcPKBDKEgYtTACaSMI2R4VW24cJNwnt/hBxU
 aeIp8jb7vXZzVKTTV4Y61ymzzMU+eDAytFS+z+e/J7JwtaxUi5STrOVchvxP+/K6jthZHfy0rlW
 TEQA=
X-Developer-Key: i=sven@kernel.org; a=openpgp;
 fpr=A1E3E34A2B3C820DBC4955E5993B08092F131F93
X-Endpoint-Received: by B4 Relay for sven@kernel.org/default with
 auth_id=407
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_171044_533464_B107BD0A 
X-CRM114-Status: GOOD (  11.76  )
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

From: "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>

Add the DT binding for the Apple Mac System Management Controller GPIOs.

Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>
Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
---
 .../devicetree/bindings/gpio/apple,smc-gpio.yaml   | 29 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 2 files changed, 30 insertions(+)

diff --git a/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..42b1bc0a10c97a5586c435413b3c3ef1bb9fc797
--- /dev/null
+++ b/Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
@@ -0,0 +1,29 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/gpio/apple,smc-gpio.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple Mac System Management Controller GPIO
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+description:
+  Apple Mac System Management Controller GPIO block.
+
+properties:
+  compatible:
+    const: apple,smc-gpio
+
+  gpio-controller: true
+
+  '#gpio-cells':
+    const: 2
+
+required:
+  - compatible
+  - gpio-controller
+  - '#gpio-cells'
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index a92290fffa163f9fe8fe3f04bf66426f9a894409..68097b1a44251b076bfd55cc07cffa5d0e3e83c5 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2331,6 +2331,7 @@ F:	Documentation/devicetree/bindings/arm/apple/*
 F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
+F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.34.1



