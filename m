Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48893D59F65
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:58:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l77XOUJUw+siBdLkNkL/6nxwP2TBf85O5sQ3l2Iab84=; b=pvHHa6X+P8r8Irs2z2n4QQynYB
	o4Q3LUTgbX0s+u9ljbS/ooGm73K2/6LKqN9J3n3GmJ7aDMrj1Fy4e/dVj0a2aJNI+PY515lF6de1n
	2Kp6mKWt3D9iTUex0lukqzPQes+CXIJFgKt9e65TqwdEDL96QzjrW0bt7QNQ0lzbrwx8DEI117Lyb
	8Yj8tX7OB0+OCBZ+J1sPrCTzC0HtETPglFnE7tPDgEFk+SSZkhP8Vrtqgch43inXflRYdxWRdHGvh
	PAWfhZud46qkWKtNVu8uSn8Zz07EqKnE1SfYL5DAgyeqvv2z8R+N1yQL8p+/er5wXxqSeRHFSrCjw
	ebUDCn2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpe-00000001KjP-30mC;
	Sat, 13 Dec 2025 02:58:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpD-00000001KId-30am;
	Sat, 13 Dec 2025 02:57:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=l77XOUJUw+siBdLkNkL/6nxwP2TBf85O5sQ3l2Iab84=; b=Hv/t+UpoSuCBOL0e3ShiYE756S
	iXNV0nZsVnnUU8c5A9G2uUTIAIp7K84Vp8CsnSW9n0GqxTJ9rZoOpA5tjlIQy5mvSfeqFdpS7QV6d
	55y5t8bP8ymR3A/+ZWP6zoubX9hRwuU8vrF3PwTJR88K08sXM9+k3oNF34oCINcO6FMEgkJy90Tjl
	Qh/X9gNnCuyKTFQUFf4XnsWC2+3X9skibbxXVyXCtZFD5vGUCMn8iR78ZiEyAWtosZJnDg0E6RBIw
	Wk7olWN7bdxDupxKnb+o4vBTE6Oq8X9Jv7U0vc/cXgPyDvPDUvPQveVQTDMZo4yFh8Ln+CcWrZFgV
	b7Fmbyzg==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMLwB-0000000GL9j-25fT;
	Fri, 21 Nov 2025 07:52:14 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5AL8j5U513255890, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763714705; bh=l77XOUJUw+siBdLkNkL/6nxwP2TBf85O5sQ3l2Iab84=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=jy2YRFzQUsghN3uqCyyfS3YaW9kknkzWySQnufaPq4sXZzGkXY1AvEQXQcb7iBkp5
	 hNoc9+gQ3b6hkcLX8EU9TYkc/SnIbJ3kzKWFeeQDGoC9wLX1Sp3gAM9l0A/eviDS24
	 9O2WxwHQWisNsWnTPLnqCFNIQpxqYp5ajyJC3PdkLO4fK3JCXb22+yiWuqh9f3VU+z
	 RDIyQXocoDQryvQmQfqJI5LMEHhzllxd/yXxr32OQ1DgzK5h1Mi6VARe53hPKogNon
	 ujIr4Ftk67IU8pPF//Mfp6MC/ga5LfiX/adqPXt+gdnNFj6Ac9SixmYL7RyPpmqm0c
	 1uf8ohA6cqebw==
Received: from mail.realtek.com (rtkexhmbs02.realtek.com.tw[172.21.6.41])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5AL8j5U513255890
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Fri, 21 Nov 2025 16:45:05 +0800
Received: from RTKEXHMBS01.realtek.com.tw (172.21.6.40) by
 RTKEXHMBS02.realtek.com.tw (172.21.6.41) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:45:06 +0800
Received: from RTKEXHMBS04.realtek.com.tw (10.21.1.54) by
 RTKEXHMBS01.realtek.com.tw (172.21.6.40) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Fri, 21 Nov 2025 16:45:05 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS04.realtek.com.tw
 (10.21.1.54) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Fri, 21 Nov 2025 16:45:05 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lee@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v3 1/2] dt-bindings: arm: realtek: Add Kent Soc family compatibles
Date: Fri, 21 Nov 2025 16:45:04 +0800
Message-ID: <20251121084505.3200-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251121084505.3200-1-eleanor.lin@realtek.com>
References: <20251121084505.3200-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251121_075212_119803_A3A7F03F 
X-CRM114-Status: UNSURE (   8.24  )
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

Define compatible strings for Realtek RTD1501s, RTD1861b and RTD1920s.

Additionally, convert legacy DTS-style comments to YAML description
properties, following the pattern from the ARM bindings conversion series
[1].

[1] https://lore.kernel.org/lkml/20200622125527.24207-2-afaerber@suse.de/

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
---
 .../devicetree/bindings/arm/realtek.yaml      | 42 +++++++++++++------
 1 file changed, 30 insertions(+), 12 deletions(-)

diff --git a/Documentation/devicetree/bindings/arm/realtek.yaml b/Documentation/devicetree/bindings/arm/realtek.yaml
index ddd9a85099e9..be529490640c 100644
--- a/Documentation/devicetree/bindings/arm/realtek.yaml
+++ b/Documentation/devicetree/bindings/arm/realtek.yaml
@@ -14,21 +14,21 @@ properties:
     const: '/'
   compatible:
     oneOf:
-      # RTD1195 SoC based boards
-      - items:
+      - description: RTD1195 SoC based boards
+        items:
           - enum:
               - mele,x1000 # MeLE X1000
               - realtek,horseradish # Realtek Horseradish EVB
           - const: realtek,rtd1195
 
-      # RTD1293 SoC based boards
-      - items:
+      - description: RTD1293 SoC based boards
+        items:
           - enum:
               - synology,ds418j # Synology DiskStation DS418j
           - const: realtek,rtd1293
 
-      # RTD1295 SoC based boards
-      - items:
+      - description: RTD1295 SoC based boards
+        items:
           - enum:
               - mele,v9 # MeLE V9
               - probox2,ava # ProBox2 AVA
@@ -36,25 +36,43 @@ properties:
               - zidoo,x9s # Zidoo X9S
           - const: realtek,rtd1295
 
-      # RTD1296 SoC based boards
-      - items:
+      - description: RTD1296 SoC based boards
+        items:
           - enum:
               - synology,ds418 # Synology DiskStation DS418
           - const: realtek,rtd1296
 
-      # RTD1395 SoC based boards
-      - items:
+      - description: RTD1395 SoC based boards
+        items:
           - enum:
               - bananapi,bpi-m4 # Banana Pi BPI-M4
               - realtek,lion-skin # Realtek Lion Skin EVB
           - const: realtek,rtd1395
 
-      # RTD1619 SoC based boards
-      - items:
+      - description: RTD1501s SoC based boards
+        items:
+          - enum:
+              - realtek,phantom # Realtek Phantom EVB (8GB)
+          - const: realtek,rtd1501s
+
+      - description: RTD1619 SoC based boards
+        items:
           - enum:
               - realtek,mjolnir # Realtek Mjolnir EVB
           - const: realtek,rtd1619
 
+      - description: RTD1861b SoC based boards
+        items:
+          - enum:
+              - realtek,krypton # Realtek Krypton EVB (8GB)
+          - const: realtek,rtd1861b
+
+      - description: RTD1920s SoC based boards
+        items:
+          - enum:
+              - realtek,smallville # Realtek Smallville EVB (4GB)
+          - const: realtek,rtd1920s
+
 additionalProperties: true
 
 ...
-- 
2.34.1


