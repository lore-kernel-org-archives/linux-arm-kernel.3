Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A347BC369A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 08:56:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u0xpYQrtot3XWIu/z6TMeddZpdhOUo0w93hRWb8pM8E=; b=MY6tO7UoFj1K2kGzvbTCYOuEYT
	Li+zHBs4XugLQowgws+RN+pDYNhoMc2dpM/Sez4xTXwI4tvYahe3WtOO4beCTDcxabdXzcuHb5Aw8
	ow66s9hoj3oY1HlKxd2wWADOynZXYaMEqoV3Lhf978V1yUL1ri/EPyVES9O2eBZkk4JnddRHBv3Lc
	b9Llxt/JxHtPtJ495+TaG9zlTOCs5YAHY7f6Ku/Kmfz6lCGKsko+pl8Zw2r+G2+sWdGSbAodFo7vV
	Bs7lHlZYziZUCTxTANIOPyArLUWJFVQfsZxwU32C9ndeIviywZGAfTIJKRTIydSER1s2L4SpTrs1E
	1Ptrq6Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nhQ-00000009pYj-3HGu;
	Thu, 10 Apr 2025 08:55:52 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2nKd-00000009l7Q-2yCl;
	Thu, 10 Apr 2025 08:32:21 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id 6007B2591A;
	Thu, 10 Apr 2025 10:32:18 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id U-DXZHkkyRaR; Thu, 10 Apr 2025 10:32:17 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1744273937; bh=WPe1sxDRW4Ck8whEWKonZDCvZ3gDCa3iKSd6Shbmxhg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=FgkLgtHl0hs2IU4IIsD64hCGhyXRNvFQKedDzx9aZmvUzVEdLpzM2Up4PZsS0cCo/
	 y5txzpb6bSJt7Me2tQdEvtJYtZgAOxiZ3lPpskBJhrA8Sp+sxl9zOSMIh+KJgJtIEi
	 8bn8sPQfUxPNbXTZDvMccg7TI6KJFEz96MhSwB9ZhgdItfA9BDvP7OJ5JgrRQcPNMy
	 WOYD52L9Hsj7msQPSfT7ljS7gvRFzmkRvn+Pv557a5frChz+I9xScGyjBeu7bHE7qy
	 nYByO9Q1xRNA5C1REvgW/63swu9fXhT/iCPkMMJa8I0VXrpS7vYhjAUD9WNhP3DgQd
	 5xjath69YzYBQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Thu, 10 Apr 2025 14:01:13 +0530
Subject: [PATCH RESEND v2 2/3] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250410-exynos7870-usbphy-v2-2-2eb005987455@disroot.org>
References: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
In-Reply-To: <20250410-exynos7870-usbphy-v2-0-2eb005987455@disroot.org>
To: Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Sylwester Nawrocki <s.nawrocki@samsung.com>
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Kaustabh Chakraborty <kauschluss@disroot.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Developer-Signature: v=1; a=ed25519-sha256; t=1744273913; l=1340;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=WPe1sxDRW4Ck8whEWKonZDCvZ3gDCa3iKSd6Shbmxhg=;
 b=jTKXsnDqVe+aHRgxlxi3cjhFZ8/IkqodvnhJvdmGnCDqMfCDlJe2rlgOS3OjaqXBlxMmK0B3J
 51yQLKU+PGmCjSTYe+6egWhms52klyVK4mrglyGOwxbMc5OZOF55oKL
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_013219_881076_C7547446 
X-CRM114-Status: UNSURE (   6.10  )
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

Add the compatible string "samsung,exynos7870-usbdrd-phy" to the
documentation. The devicetree node requires two clocks, named "phy" and
"ref" (same as clocks required by Exynos5).

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
index 27295acbba7674f6cdc402f18ff4c505bd8760f6..fdddddc7d611364ce17870b5b8963b5a0c0c9668 100644
--- a/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/samsung,usb3-drd-phy.yaml
@@ -30,6 +30,7 @@ properties:
       - samsung,exynos5420-usbdrd-phy
       - samsung,exynos5433-usbdrd-phy
       - samsung,exynos7-usbdrd-phy
+      - samsung,exynos7870-usbdrd-phy
       - samsung,exynos850-usbdrd-phy
 
   clocks:
@@ -184,6 +185,7 @@ allOf:
             enum:
               - samsung,exynos5250-usbdrd-phy
               - samsung,exynos5420-usbdrd-phy
+              - samsung,exynos7870-usbdrd-phy
               - samsung,exynos850-usbdrd-phy
     then:
       properties:

-- 
2.49.0


