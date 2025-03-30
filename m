Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C83CAC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 30 Mar 2025 19:49:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mSMSevEquPmIXFY3ygGy/B0TyHq4Oq06KRAtU/3yieY=; b=rqWhaNpiXsEfVekN774DCdViEu
	iGbBne9Rmbeni1r8AnjNMfCO8Z5TeicXyXY5xIEB5g6MFmIoHot0tmW0aUcWgFKWKo24PMtQ3x/12
	HZzypiZVHT4NkQpS1bt6zBrFxkuNgQwTBREiR7wATeVGkgBpsQYEIheSYt5XNPOZvof7bcW6I0Es8
	xa3XriJy+pmSD97cc9e9YVilAnBQJ/GwIICNm+g5hFDKYhkKLZqrg1xC55JWAip1zyA6aAD1KueXO
	EvcjilZlljH8csVTbdXGQ9EkIXvXyembJdaWTRHKx33xWvQ0dpYu+OcisTT6AB7A4Ao/YOfw/V7Nc
	eE8w5rWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyfB-0000000Gbvo-2I6H;
	Sun, 30 Mar 2025 19:49:45 +0000
Received: from zeus03.de ([194.117.254.33] helo=mail.zeus03.de)
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyyV2-0000000GbBg-07tE
	for linux-arm-kernel@lists.infradead.org;
	Sun, 30 Mar 2025 19:39:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	sang-engineering.com; h=from:to:cc:subject:date:message-id
	:in-reply-to:references:mime-version:content-transfer-encoding;
	 s=k1; bh=mSMSevEquPmIXFY3ygGy/B0TyHq4Oq06KRAtU/3yieY=; b=B8kz23
	t8UDQP+FLmWHJf+SCP+e5KSY805+BZqdlT8K2d790fPrrQANQTJ5zU38Hqy0jqIf
	8qNlvhxYn+0rXq2looAXsiBTisC1Lz1U/ONFf1P+epIVBlM/kLbfEy99cOuZY/cm
	IBsL4hl+z4gIAWgGxSSyE+iP8FjK1A3pVXLKTWnu9Vxgu8o2QBJKylROZmP+GWZo
	bXs+99SI5Jgj7LsYWWueby4tSAHEa6fobxrfWLPuTeoskCi9U5adYdB0ft+ZKUqY
	y8g6V90BJHapoPyLJWd/sp3oKlus/sA/hrjRM1Hg+fW2c1uCFl7tWR/8MTSKF9KZ
	ePTIwPKuOm0zx79w==
Received: (qmail 964949 invoked from network); 30 Mar 2025 21:39:09 +0200
Received: by mail.zeus03.de with UTF8SMTPSA (TLS_AES_256_GCM_SHA384 encrypted, authenticated); 30 Mar 2025 21:39:09 +0200
X-UD-Smtp-Session: l3s3148p1@TXwSdZQxCKxQ8qei
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Alexey Charkov <alchark@gmail.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org
Subject: [PATCH v2 5/5] ARM: dts: vt8500: use correct ohci/ehci node names
Date: Sun, 30 Mar 2025 21:38:36 +0200
Message-ID: <20250330193833.21970-12-wsa+renesas@sang-engineering.com>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
References: <20250330193833.21970-7-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250330_123916_345850_A140F56D 
X-CRM114-Status: UNSURE (   9.52  )
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

They should be named "usb@".

Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
---
 arch/arm/boot/dts/vt8500/vt8500.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8505.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8650.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8750.dtsi | 2 +-
 arch/arm/boot/dts/vt8500/wm8850.dtsi | 2 +-
 5 files changed, 5 insertions(+), 5 deletions(-)

diff --git a/arch/arm/boot/dts/vt8500/vt8500.dtsi b/arch/arm/boot/dts/vt8500/vt8500.dtsi
index f23cb5ee11ae..09f5ed3e6821 100644
--- a/arch/arm/boot/dts/vt8500/vt8500.dtsi
+++ b/arch/arm/boot/dts/vt8500/vt8500.dtsi
@@ -109,7 +109,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
diff --git a/arch/arm/boot/dts/vt8500/wm8505.dtsi b/arch/arm/boot/dts/vt8500/wm8505.dtsi
index d9e1280372c5..c81810b967bb 100644
--- a/arch/arm/boot/dts/vt8500/wm8505.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8505.dtsi
@@ -207,7 +207,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007100 {
+		usb@d8007100 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007100 0x200>;
 			interrupts = <1>;
diff --git a/arch/arm/boot/dts/vt8500/wm8650.dtsi b/arch/arm/boot/dts/vt8500/wm8650.dtsi
index 35d12d77efc0..555008120a3e 100644
--- a/arch/arm/boot/dts/vt8500/wm8650.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8650.dtsi
@@ -179,7 +179,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <43>;
diff --git a/arch/arm/boot/dts/vt8500/wm8750.dtsi b/arch/arm/boot/dts/vt8500/wm8750.dtsi
index b292f85d4e69..309f6e5129fb 100644
--- a/arch/arm/boot/dts/vt8500/wm8750.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8750.dtsi
@@ -251,7 +251,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
diff --git a/arch/arm/boot/dts/vt8500/wm8850.dtsi b/arch/arm/boot/dts/vt8500/wm8850.dtsi
index c61717ebb4f1..3f4a514d65e2 100644
--- a/arch/arm/boot/dts/vt8500/wm8850.dtsi
+++ b/arch/arm/boot/dts/vt8500/wm8850.dtsi
@@ -238,7 +238,7 @@ timer@d8130100 {
 			interrupts = <36>;
 		};
 
-		ehci@d8007900 {
+		usb@d8007900 {
 			compatible = "via,vt8500-ehci";
 			reg = <0xd8007900 0x200>;
 			interrupts = <26>;
-- 
2.47.2


