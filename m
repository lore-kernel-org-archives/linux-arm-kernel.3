Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC82FCD343B
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 17:04:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7ZZa2fA4GJyEXrtVvhdL02eBrNP1m57y2wG+TdNGvk=; b=rFO5WIafV2EfINmrGRAn7xwSOI
	QZN+1GPTmNkW3jwNNlR7AWtF4tUmWOOpEbAAWfMHDXsN+cKNRyDBccvSfTUOg1qdGhOqJrcYch6jx
	tto494J1MY4hIO8fCXU8Bbvx39wnuFtyiFNogunsdNm75kcDL9ZxMz1XZ+hXgZDiPkwlZgC64D74w
	oqFW2eZLojLGgc5Da1UhU52tenHrqAyPdxJNbfpGKvM7rpWZsO4oY8qN88yb/w/qe7BfSp1HPOZBW
	Hy3Jx0g8Th8Hhqz5zg+FmFV70dhJ4mUGOGxw3GBhQEnadgam3uvyw7lMmmjOCdrtOlC495KoPwf24
	odyQAbOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJCE-0000000GzFs-3h3C;
	Tue, 05 May 2026 17:04:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJCB-0000000GzAy-2waG;
	Tue, 05 May 2026 17:04:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=a7ZZa2fA4GJyEXrtVvhdL02eBrNP1m57y2wG+TdNGvk=; b=qZWwVxedLGGe4XD/tHTt2y07HR
	aajWx9DstqdFIC7RATGfMSgO4onccRcueTfqDc0BIUUAit05PQV4wH4dhcgBIWF3H8CXsUJjSj9g9
	+7Td+q4mddQ82v43/cQTqqwD3N2v4X9Rgl1bjo5un9nNO5IPKQOtwjDWRalnaeB64LKU3S6nGe5aw
	Iro4xmOTW1mYo0muSzLgNVPMwnBJITmunxjQIJvo4SZtxBkR8LvfrsP4FVu0UIL+nJHXzTdQwphad
	MQaVgOYIiaqK09oPPhenZ1MMUwxljouqghiylTbcIN+L6B+7gA0OsCUwomwFIzy3ocFflaN68PKq9
	BwIAsWqg==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKJC8-0000000E6jD-3IFf;
	Tue, 05 May 2026 17:04:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type;
	bh=a7ZZa2fA4GJyEXrtVvhdL02eBrNP1m57y2wG+TdNGvk=; b=LLQKluJeH1HhlGVbCfL3AwRHIL
	sGFth6sZmW2GTqGnBYAF6i2nMdbP7RRxIvmt5IFOXxB112Me+NrmXsauMNVtPzaz/tpAZFMG3tDMu
	FwOkbkx7DcaiuWJpkzOF9VSClFLex+iE3d2sLB0EY5b8idLV3P4z57nwer+oT5MpPT8tNFCt/3zqA
	bR8CA6eCG89onkgWH84Rx/zULqhTBVccH8kRucH7UP/wO+w3X0o/zE5kzJ2MOa0wAbd0TNsrZIU6N
	Dvl8wS/e4kDXmYgQY9AV6KH9MG68uKfw23rhWkYnr3Hcn6EPc+9CqeQ5Lc3BGvGo3lgVDMp8On3uW
	9vOS9W6g==;
From: Heiko Stuebner <heiko@sntech.de>
To: vkoul@kernel.org
Cc: neil.armstrong@linaro.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	jonas@kwiboo.se
Subject: [PATCH v2 3/5] dt-bindings: phy: rockchip,inno-usb2phy: Add compatible for RK3528
Date: Tue,  5 May 2026 19:04:08 +0200
Message-ID: <20260505170410.3265305-4-heiko@sntech.de>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260505170410.3265305-1-heiko@sntech.de>
References: <20260505170410.3265305-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_180428_975985_251DC529 
X-CRM114-Status: GOOD (  10.38  )
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

From: Jonas Karlman <jonas@kwiboo.se>

The embedded USB2 PHY on RK3528 is very similar to the one in RK3568,
the main difference being that it only uses two clocks instead of three.

Add compatible to support the USB2 PHY in RK3528.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 .../bindings/phy/rockchip,inno-usb2phy.yaml   | 30 ++++++++++++++++---
 1 file changed, 26 insertions(+), 4 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
index b95c9e3e44fe..f50fc69fbbe4 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,inno-usb2phy.yaml
@@ -20,6 +20,7 @@ properties:
       - rockchip,rk3328-usb2phy
       - rockchip,rk3366-usb2phy
       - rockchip,rk3399-usb2phy
+      - rockchip,rk3528-usb2phy
       - rockchip,rk3562-usb2phy
       - rockchip,rk3568-usb2phy
       - rockchip,rk3576-usb2phy
@@ -41,11 +42,15 @@ properties:
     maxItems: 3
 
   clock-names:
-    minItems: 1
-    items:
+    oneOf:
       - const: phyclk
-      - const: aclk
-      - const: aclk_slv
+      - items:
+          - const: phyclk
+          - const: pclk
+      - items:
+          - const: phyclk
+          - const: aclk
+          - const: aclk_slv
 
   assigned-clocks:
     description:
@@ -65,6 +70,9 @@ properties:
     description: Muxed interrupt for both ports
     maxItems: 1
 
+  power-domains:
+    maxItems: 1
+
   resets:
     maxItems: 2
 
@@ -150,6 +158,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - rockchip,rk3528-usb2phy
               - rockchip,rk3568-usb2phy
               - rockchip,rv1108-usb2phy
     then:
@@ -218,6 +227,19 @@ allOf:
         clock-names:
           maxItems: 1
 
+  - if:
+      properties:
+        compatible:
+          contains:
+            enum:
+              - rockchip,rk3528-usb2phy
+    then:
+      properties:
+        clocks:
+          minItems: 2
+        clock-names:
+          minItems: 2
+
   - if:
       properties:
         compatible:
-- 
2.47.3


