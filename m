Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA39E6F060
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  1 Nov 2024 14:31:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+g5zscsCZ9HNh2uooTO1VH1ohwqoUi9dUWlAaeKGxYY=; b=jBidAAC/lNP3vPXFNmEKzCFetg
	xQsPArYekR7OUS9Wf+sOSR3hM922XHzgw9IZvbd7EZ+JgEU2ST24Ssg4/RYnTghLMY8oWpBhHEt3X
	I2pZoN8dghdEUDk83+/lF2iSzeUKC4d0qL0uxyTraCxj3F7gJAEbKpXz7QFnGoSeoTQVbWtS6a/xr
	gEcDgAq6a1vCwClZ3YNH8YnPWU5driyV5Sokv1gRwDrM+V8bnS/Ov/c8r3Hgjr5OVVdqlXRwIeHYp
	Za+QSzwyXzqCMJA3BSWLXHUTOss2w3ceTNgInZllkxm+XVAxMsGA6TngenLoGTyC3Ght7DOlfsDIB
	Yy9t3lKQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t6sgj-00000007LmL-2fCP;
	Fri, 01 Nov 2024 14:31:45 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t6saV-00000007KPu-3buc
	for linux-arm-kernel@lists.infradead.org;
	Fri, 01 Nov 2024 14:25:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6A81C5C1053;
	Fri,  1 Nov 2024 14:24:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB8B6C4CED8;
	Fri,  1 Nov 2024 14:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730471118;
	bh=7vrEPIQ4bAMycnZ9O2SmDP1fd541LGxGZlIiiqJbkww=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=b/8qkiaOffx0IirFn8jZgYKZXIUobR4UZ8A0xFNEVLIpSzpuGrqezzvaUTmOcvZNK
	 oxMPvlPg5VFiG0Pt8/0dDHRllyR6WaAanyb1+nBZ66PQ79gCAVsn1wakw32dSc+HW4
	 7KELuhWKIUZBv7Y4i4AItAOvHgjVzjvwyOCYYKO5bx+hZDyRMkr9H1H/iV42ASfj5A
	 6FqioZguuabaomlgZAD9GcVHoOrqvhMveAelGzGdtpFHtd9eDZr+UIkyadO+KhOOY6
	 EZoP25wuFEv7Uu3DP4DqrSOxa9E7j1i2WB3jdoNfMWCK264cw8EMHiLL2OxGH0NnSQ
	 i7701mJAY63tA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9574EE6F063;
	Fri,  1 Nov 2024 14:25:18 +0000 (UTC)
From: Janne Grunau via B4 Relay <devnull+j.jannau.net@kernel.org>
Date: Fri, 01 Nov 2024 15:25:05 +0100
Subject: [PATCH v2 3/3] MAINTAINERS: Add apple-spi driver & binding files
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241101-asahi-spi-v2-3-763a8a84d834@jannau.net>
References: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
In-Reply-To: <20241101-asahi-spi-v2-0-763a8a84d834@jannau.net>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Mark Brown <broonie@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Janne Grunau <j@jannau.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1316; i=j@jannau.net;
 s=yk2024; h=from:subject:message-id;
 bh=wbyAeXiak8ymhiqSGZePVuZ0IdBpI3guim8H/E8/EiU=;
 b=owGbwMvMwCW2UNrmdq9+ahrjabUkhnSVJ2cO5nswZ9Wq7uuQuBKUHqDHVLRqzn3RBfuYhYR9x
 GdLmFR0lLIwiHExyIopsiRpv+xgWF2jGFP7IAxmDisTyBAGLk4BmIjELEaGVat5HtlL5F456etw
 xI/xsAf//aAky1lcQkbzNZX539R/Z/hnLyJ0evtEEa4eJVZT+8CAuBnT/bcsX1P5J3dv2PJZx13
 5AA==
X-Developer-Key: i=j@jannau.net; a=openpgp;
 fpr=8B336A6BE4E5695E89B8532B81E806F586338419
X-Endpoint-Received: by B4 Relay for j@jannau.net/yk2024 with auth_id=264
X-Original-From: Janne Grunau <j@jannau.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241101_072520_051990_C34E45A2 
X-CRM114-Status: UNSURE (   9.60  )
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
Reply-To: j@jannau.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Hector Martin <marcan@marcan.st>

This Apple SPI controller is present on Apple ARM SoCs (t8103/t6000).

Splitting this change from the binding/driver commits to avoid merge
conflicts with other things touching this section, as usual.

Signed-off-by: Hector Martin <marcan@marcan.st>
Signed-off-by: Janne Grunau <j@jannau.net>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index cc40a9d9b8cd10e2e00caa5a5881381cd40c0d9a..552febcb12a95766ff502960782941d9d016d5e0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2068,6 +2068,7 @@ F:	Documentation/devicetree/bindings/pci/apple,pcie.yaml
 F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml
 F:	arch/arm64/boot/dts/apple/
 F:	drivers/bluetooth/hci_bcm4377.c
@@ -2085,6 +2086,7 @@ F:	drivers/nvmem/apple-efuses.c
 F:	drivers/pinctrl/pinctrl-apple-gpio.c
 F:	drivers/pwm/pwm-apple.c
 F:	drivers/soc/apple/*
+F:	drivers/spi/spi-apple.c
 F:	drivers/watchdog/apple_wdt.c
 F:	include/dt-bindings/interrupt-controller/apple-aic.h
 F:	include/dt-bindings/pinctrl/apple.h

-- 
2.47.0



