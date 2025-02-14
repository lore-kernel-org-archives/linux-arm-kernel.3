Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F34E3C02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 18:38:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:Message-Id:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=wSQy/K7pIT6YNEc+07Jla6VOaT3z0ssPzPl+wbi1MtI=; b=tRU2GuvhMhjeDJWV07r+dQq6eq
	hjLFsdgf/sAN64CEWQi6VwqTGTcMin+5mq69fMwZsgoEeLCNjeAD1gkMSd6sYw3Tye97mSCVbyTK2
	7/bPOUo7TztMDu21gZUfIrYSdIPMnD0t6o4Je+EImV0zoiIWrUjbOxMDpNUVhjn/ABfFjG5uRckWP
	/+sMEDtDOqROwlxjwvEtkYil90UTjlDjauxtuUeID8m/VW9iZYG6KZKjsirVpMR/AMNtpHafPFtHX
	BEqsmNfAg+0UlVzMnn30ZVYsW2/m5J+Dfr9qSYRu8V6Jw+L3McHltJu6W+zmocUBaJaPFZMr89vC7
	K/cgbkYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tj0a3-0000000Fu45-1Ldj;
	Fri, 14 Feb 2025 18:38:27 +0000
Received: from sendmail.purelymail.com ([34.202.193.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiznl-0000000FmCv-3Cbx
	for linux-arm-kernel@lists.infradead.org;
	Fri, 14 Feb 2025 17:48:34 +0000
Authentication-Results: purelymail.com; auth=pass
DKIM-Signature: a=rsa-sha256; b=xnODtEQPIh/VEXOsU16HCVaa9NNEu1CsH4Jd3yTVsHaqS+hIB2UOU8xwUUTTaRLh18Hy/WeY+RyuGFSnI0RHV5GUPnFGL6daf6b4sWhF0jj0CEj6D8uEIJr+wllqG48MVilsxa/glMI9jLVKSCh3Cz7+bnCQSB3SAua59e61b2E0qAeo75pRO6d1Qq8rnD22VE0wkbYf/BGZxTCKlmLyV2TbP/YIyYFbPrBVAm+bgVgH8n8kn9ZcshBQ8hFBwrWYZgGYQJcjypjV4O458HIEko73UUmWc6OeyEZtYGmQYrejnfmdotHdwowqfS1gdElBuMVqsp+d+1McLRLIXBu8Jg==; s=purelymail3; d=purelymail.com; v=1; bh=OFAPAVOqVuoi9a1p+QX8ZWSN2oGBayyv39emGYuW7Sk=; h=Feedback-ID:Received:From:Date:Subject:To;
Feedback-ID: 68247:10037:null:purelymail
X-Pm-Original-To: linux-arm-kernel@lists.infradead.org
Received: by smtp.purelymail.com (Purelymail SMTP) with ESMTPSA id 893203092;
          (version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384);
          Fri, 14 Feb 2025 17:36:56 +0000 (UTC)
From: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Date: Fri, 14 Feb 2025 18:36:49 +0100
Subject: [PATCH] dt-bindings: usb: samsung,exynos-dwc3 Add exynos990
 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250214-exynos990-bindings-usb3-v1-1-3e5d2721c98c@mentallysanemainliners.org>
X-B4-Tracking: v=1; b=H4sIADB/r2cC/x3MPQ6DMAxA4asgz7WUH1pIr4IYSONQLwbFAoEQd
 2/U8Rveu0CpMCm8mwsK7ay8SIV9NPD5TjITcqoGZ9zTONsiHacsGoLByJJYZsVNo8dX7k3ubGi
 t76DWa6HMx/88jPf9A7LqK+RpAAAA
X-Change-ID: 20250214-exynos990-bindings-usb3-6f80f7194137
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-usb@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Igor Belwon <igor.belwon@mentallysanemainliners.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739554614; l=1615;
 i=igor.belwon@mentallysanemainliners.org; s=20241206;
 h=from:subject:message-id; bh=OFAPAVOqVuoi9a1p+QX8ZWSN2oGBayyv39emGYuW7Sk=;
 b=uTaLuSG+epbVxDmg8aBZu28KGGGb2BkzA1eUtYOg78i++a0yLgSiKU1KhRpWn5Xx7FQI4+tZY
 D9YY22xxBWcBIOPqsdbbsJRS79i5ifu17aOBbWCNqJbd7wfh3IhOykU
X-Developer-Key: i=igor.belwon@mentallysanemainliners.org; a=ed25519;
 pk=qKAuSTWKTaGQM0vwBxV0p6hPKMN4vh0CwZ+bozrG5lY=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_094833_875621_5598C4D7 
X-CRM114-Status: GOOD (  10.37  )
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

Add a compatible for the exynos990-dwusb3 node. It's compatible with the
exynos850 variant when using the highspeed mode.

Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
---
The Exynos990 SoC embeds a DWC3 USB3 DRD controller.

The controller's design is compatible with the Exynos850 design
for high-speed mode.

This patchset adds in the new exynos990-dwusb3 compatible.
---
 Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
index 2b3430cebe99106f3b6201ab31d4d9e3fcc55627..136b14eecfe951dbc20377bffba1039fb1429f16 100644
--- a/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
+++ b/Documentation/devicetree/bindings/usb/samsung,exynos-dwc3.yaml
@@ -17,6 +17,7 @@ properties:
       - samsung,exynos5433-dwusb3
       - samsung,exynos7-dwusb3
       - samsung,exynos850-dwusb3
+      - samsung,exynos990-dwusb3
 
   '#address-cells':
     const: 1
@@ -124,7 +125,9 @@ allOf:
       properties:
         compatible:
           contains:
-            const: samsung,exynos850-dwusb3
+            enum:
+              - samsung,exynos850-dwusb3
+              - samsung,exynos990-dwusb3
     then:
       properties:
         clocks:

---
base-commit: 5cbcf2652f4cd84eac21f5e88fe2a0baecc601fb
change-id: 20250214-exynos990-bindings-usb3-6f80f7194137

Best regards,
-- 
Igor Belwon <igor.belwon@mentallysanemainliners.org>


