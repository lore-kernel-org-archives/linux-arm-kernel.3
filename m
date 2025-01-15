Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A97FEC02183
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 22:47:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hu8tlV+AImA7XSKCrIANalfshktTpBGCYwDBJTyvc6c=; b=LVTSjm6Ukebu6K4/cLNdx34kW5
	uXCXIHZZ/Jd5NxFOAhCHmBd/1wYk4i65rpltUiEBwFpRIOEWDDIKDQBzUkSsY0wjYt1LcqdWnSg9K
	o84hvG80LYjbHpqqsgDMu2U5yZT5jRy742TGgxo34OEsLOLrPV4TQRPAas6UAKfSqoZxN5OB+Ov9n
	YuMuo+/V/T9IqkUZdaWegyzCas7vYRnd31PvoFr2x7v/8YvABDfKrDMiFps3850NjXcD4r2cYeme+
	zVT6aCQEpofxTxIiwX9WtTr5E41W2EmrnRtel8whHCfHJx8InwXsPKAtAvao6TmUMfrXq6gO4Ytdz
	YVXWOt9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYCAg-0000000DHKl-48am;
	Wed, 15 Jan 2025 22:47:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYC9O-0000000DH1U-0HRT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jan 2025 22:46:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B90985C5F32;
	Wed, 15 Jan 2025 22:45:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id CB044C4AF0E;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736981172;
	bh=mfzps7MrY/bcz2UOrFkJP6HwpcWdEzOi6VXm2UtiSLM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=uyTzjWpdC5SB7jXP4WHm60MmDCUZJyPhf9ctjTPiPuypXzFowfNIPkvyldO5uf6XX
	 YbFtpz3IE5Dw1UEehGaYecwPPTUPHLC3rGIdlXbwVicjqwo+CwRaiK148EOfeCqXSS
	 LLS6ofC1OFpJN2Ql1yZtI9VGrgwGmX+vEx0xNQbVXy37aS9HxzvCbqP9XT7DOE6L+A
	 fxF/l9hnFzhXJ35uAOkgFVUOYPCKJxymiHFVKty6w2mIbsfxgzAjcfmQbS9Zm8p+ZC
	 pXdSUnV65zbb2Ar59GN+KmMDhzpRVigYNEJv6qNhYrfX0elbVXRrg4x+2Odj7X6Iue
	 49w5/8UH4AP1A==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B93C4C02185;
	Wed, 15 Jan 2025 22:46:12 +0000 (UTC)
From: Sasha Finkelstein via B4 Relay <devnull+fnkl.kernel.gmail.com@kernel.org>
Date: Wed, 15 Jan 2025 23:46:08 +0100
Subject: [PATCH v4 4/4] MAINTAINERS: Add entries for Apple Z2 touchscreen
 driver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250115-z2-v4-4-d7361ab16ba0@gmail.com>
References: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
In-Reply-To: <20250115-z2-v4-0-d7361ab16ba0@gmail.com>
To: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Sasha Finkelstein <fnkl.kernel@gmail.com>, 
 Neal Gompa <neal@gompa.dev>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736981170; l=1260;
 i=fnkl.kernel@gmail.com; s=20241124; h=from:subject:message-id;
 bh=DolVP44jd1KXaKyL604wEY81MMwwSbO5gUWo7+wphsY=;
 b=XlRk+bLP9zEGiCp9eJLiEMa05qHY5eHk0W5DNCv7FcaOdlW1QLmRgMgO2apg7DUctcOuZtl7p
 i0r0nBjdRVHB2/YAZGEfpwWUhtwBdaNfvKkTTF5+fcAup8RX8Byxn88
X-Developer-Key: i=fnkl.kernel@gmail.com; a=ed25519;
 pk=aSkp1PdZ+eF4jpMO6oLvz/YfT5XkBUneWwyhQrOgmsU=
X-Endpoint-Received: by B4 Relay for fnkl.kernel@gmail.com/20241124 with
 auth_id=283
X-Original-From: Sasha Finkelstein <fnkl.kernel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250115_144614_163000_C568D131 
X-CRM114-Status: UNSURE (   9.30  )
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
Reply-To: fnkl.kernel@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Sasha Finkelstein <fnkl.kernel@gmail.com>

Add the MAINTAINERS entries for the driver

Reviewed-by: Neal Gompa <neal@gompa.dev>
Signed-off-by: Sasha Finkelstein <fnkl.kernel@gmail.com>
---
 MAINTAINERS | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a87ddad78e26f28ffd0f3433560d6db1518f9f95..8b3776eb748e128f87c44886b117e0652447fb37 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2191,6 +2191,7 @@ F:	Documentation/devicetree/bindings/clock/apple,nco.yaml
 F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
+F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*
 F:	Documentation/devicetree/bindings/iommu/apple,dart.yaml
 F:	Documentation/devicetree/bindings/iommu/apple,sart.yaml
@@ -2211,6 +2212,7 @@ F:	drivers/dma/apple-admac.c
 F:	drivers/pmdomain/apple/
 F:	drivers/i2c/busses/i2c-pasemi-core.c
 F:	drivers/i2c/busses/i2c-pasemi-platform.c
+F:	drivers/input/touchscreen/apple_z2.c
 F:	drivers/iommu/apple-dart.c
 F:	drivers/iommu/io-pgtable-dart.c
 F:	drivers/irqchip/irq-apple-aic.c

-- 
2.48.0



