Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F7B3D59F5F
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 02:57:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Zy5apByidqVRyU1EIe9uThrEnboWXIyQcCq8pfihxpA=; b=VzIJZ4fwU9jVbj7tWgUgOlW+Q8
	0Ry7cgECYDW8UzH+kUmPNjiGfjcumjEGFkGErGYABMq41mf5B7ReI/wUAPLjSij6R6vSuYa16TV5N
	kOrAtrmT6WUUL0GwB6DfIfyfqbRf/SOjH/t2hAwco1tvcrvxGrHD/q28+ZZeSURqMCQtQicvJY+BQ
	C3fEn3fU3GmlFmwRfAG6GrSqERbOg5HiU9RB9sYu71+vhaaWVaJ9GHCaJc7jaHM5tjJPQ2ai8zk+D
	4v8kttAyLelWuAboKaUKmDwLeX849mO/EjHtDnmZOnhpzu9uz/0CXLmgpJYw+/QfESl725yH8M7jF
	Z5id/hfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFpE-00000001KKV-2HWO;
	Sat, 13 Dec 2025 02:57:40 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUFp4-00000001KBI-1WdJ;
	Sat, 13 Dec 2025 02:57:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Zy5apByidqVRyU1EIe9uThrEnboWXIyQcCq8pfihxpA=; b=BqoCpBKcV1XG32uA5gAbuTu+Y1
	x/VRx8CRaQ2zi3CB3ovEw5CACO7qzxdEmb+ktfQzXvwTSt/TROQZXLHaDtGTWPE0v+4X1eWVokhi2
	0Ve9QOl8+Q9eXuUOnMmgGuJ1c6Eq+wAMt1CB+bsVn26QOsUb3eJZCjR8gIM+2mecYlwog9qb1DGZN
	3I0hBg3VMrO8XnNL1BtWObyI0WJ92H/hJqVXDPAcFlTceZrPnOBKszemCxKnHHAN6+pBoUI6khJFF
	/eBk1lzOIM7p54BPPB7fzmXMt7B0bDqsT66XoNPKKjq8uNUSAxt4tW8c/yfeZOLv/Hax51L4+p8JF
	ih5GR3zw==;
Received: from rtits2.realtek.com ([211.75.126.72] helo=rtits2.realtek.com.tw)
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJVds-0000000091e-3YB0;
	Thu, 13 Nov 2025 11:37:37 +0000
X-SpamFilter-By: ArmorX SpamTrap 5.80 with qID 5ADCUAw943591310, This message is accepted by code: ctloc85258
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=realtek.com; s=dkim;
	t=1763037010; bh=Zy5apByidqVRyU1EIe9uThrEnboWXIyQcCq8pfihxpA=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:Content-Type;
	b=CPx2QlpjGF+vgI8ej3jv7Pjz00IQVQe4v/9O9Eh96t1T80m1/hP6gwSNnoj2aMXp+
	 BRhWyRf7BqHkfdD+kfqye9EGwF3J1lDARGs9LFt22Gftr2CDXOJXSo1h4VLOfPyzx3
	 5XGWqh0RDIlUEBJzi8p180C8zaXRCdDqU1ThOPd+4Xwfm1dSd6KqQzp+5HGoCupK+F
	 YmG1EThtXoLtcJmXSryi0YEw5H0VZDPpGnX5l4paImqxX1IHEChPKLlymBaEkyq0np
	 cxo16bs5Nb/m3wD79cwWsh2oPZgm5JDmSwdOe2FqdhKeqSc9leMUeP0FzpL7oCUHcx
	 6oy4hyyDbTMZw==
Received: from mail.realtek.com (rtkexhmbs03.realtek.com.tw[10.21.1.53])
	by rtits2.realtek.com.tw (8.15.2/3.21/5.94) with ESMTPS id 5ADCUAw943591310
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 13 Nov 2025 20:30:10 +0800
Received: from RTKEXHMBS05.realtek.com.tw (10.21.1.55) by
 RTKEXHMBS03.realtek.com.tw (10.21.1.53) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 13 Nov 2025 20:30:10 +0800
Received: from RTKEXHMBS03.realtek.com.tw (10.21.1.53) by
 RTKEXHMBS05.realtek.com.tw (10.21.1.55) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.27; Thu, 13 Nov 2025 20:30:10 +0800
Received: from cn1dhc-k02 (172.21.252.101) by RTKEXHMBS03.realtek.com.tw
 (10.21.1.53) with Microsoft SMTP Server id 15.2.1544.27 via Frontend
 Transport; Thu, 13 Nov 2025 20:30:10 +0800
From: Yu-Chun Lin <eleanor.lin@realtek.com>
To: <afaerber@suse.de>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <lee@kernel.org>, <james.tai@realtek.com>
CC: <linux-arm-kernel@lists.infradead.org>,
        <linux-realtek-soc@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <cy.huang@realtek.com>,
        <stanley_chang@realtek.com>, <eleanor.lin@realtek.com>
Subject: [PATCH v2 1/3] dt-bindings: arm: realtek: Add Kent Soc family compatibles
Date: Thu, 13 Nov 2025 20:30:07 +0800
Message-ID: <20251113123009.26568-2-eleanor.lin@realtek.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20251113123009.26568-1-eleanor.lin@realtek.com>
References: <20251113123009.26568-1-eleanor.lin@realtek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_113734_080691_E987F8A4 
X-CRM114-Status: UNSURE (   7.65  )
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


