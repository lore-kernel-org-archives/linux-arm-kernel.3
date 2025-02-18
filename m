Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBA50C021AD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 19:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=juKhpwPkyj+apcj8cVAN3J2Hq3na0QmWLq7Zw6ghI0E=; b=aolmzEJoewNf07Qlpt2VeEXIjN
	EFRUfgpJF3LSEBD8BVn1Y+D5G1A4le/C2ocyeRBQ7lp3WSDn75PmGwHpsx6pigK99C/vH8CEEfERY
	9pailpsdD1e+Qr04LhVTr8GvgUtRYfzjcSqcv6Un7M+8lc/0FBHOF2XaoX29kSWAsuS8kAVstX1/9
	fsZcGUgeZgeivCYwqxDgc4I5mb1Ta/rCEe2+xp3EDc6Zgi0ar96MlANAdih9CLn3kklISxxyMGMa5
	DdMFFLe9wzUvsqud/ninO3nw3JMpvlrRy5sR6dDWWa4/QbastGAj9a3XWmjBTV7MAVBToC8JZC9HK
	Xm7UKQJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkTRf-00000009c5L-1n1e;
	Tue, 18 Feb 2025 19:39:51 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSlf-00000009Sc2-0j1G;
	Tue, 18 Feb 2025 18:56:28 +0000
Received: from mail01.disroot.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id DCB54234ED;
	Tue, 18 Feb 2025 19:56:25 +0100 (CET)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id TgTc3t3JTpUC; Tue, 18 Feb 2025 19:56:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1739904985; bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=NmOv0rMLzLKJ0t4ajPMdCYXOiFebxZDE1UbU3VGbK+58hT2+1cDEfYi0Pc1gEwDKT
	 o7kzvn8eVbfhp7mZAR7MDOeHucLkidIx/D5VTua1DfHXlaFTKWETK7E0TUNj2idl4E
	 DYOIFrd8pbCxb3++1vn2UBUDkYIRFVxLbyRNBfopexx4vQCltw68wuduxphUN1NeJB
	 lYrAaJ11f2HYlzj/HG7YCUFUbbqWXQxQo5qjcilYn+pupKBAW/8vO2XTiZPjtepEbj
	 t47h2S8fC1kuCXNZxTTMFcBYCgUU2aVooQOVu3oe9yKUBhmQPhBVtgivjKx9pyicCc
	 OMyTWh6611exQ==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Date: Wed, 19 Feb 2025 00:25:39 +0530
Subject: [PATCH v2 2/3] dt-bindings: phy: samsung,usb3-drd-phy: add
 exynos7870-usbdrd-phy compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250219-exynos7870-usbphy-v2-2-b8ba4e7a72e9@disroot.org>
References: <20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org>
In-Reply-To: <20250219-exynos7870-usbphy-v2-0-b8ba4e7a72e9@disroot.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739904968; l=1340;
 i=kauschluss@disroot.org; s=20250202; h=from:subject:message-id;
 bh=PP3DCHqwLcZBhlL6HzF9BzcTsUdEqSATe5Wcseoe4L4=;
 b=FzjRkqLCgmuuUp/L0aAr50PIiGfxzbyKAXwYztUOKuIlz4Kxs4ZG/eoWZtSN40WhTZhuYqsmp
 7zV5bLbW569BMX3JuOr+lx1VrMzdmfcIazYPg8lvswRxRiucKyf64lE
X-Developer-Key: i=kauschluss@disroot.org; a=ed25519;
 pk=h2xeR+V2I1+GrfDPAhZa3M+NWA0Cnbdkkq1bH3ct1hE=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_105627_349787_04BE70A3 
X-CRM114-Status: UNSURE (   7.47  )
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
2.48.1


