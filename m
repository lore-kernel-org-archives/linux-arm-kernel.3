Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B4B6D10392
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 08:26:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:CC:To:In-Reply-To:References
	:Message-ID:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p1a16dCHqSoV1bGYQwsQfBHDNzGYIAnms9DNH2Gqpd4=; b=zxp/kQ9POxxtfAYemBf4Pcyjzp
	Zk5IdnFxhTFRT8isOVt3xqJL6EsDzCRFsYjGl0RWUzXDNbEHIdl2dlMvhZ+OizuvmYTv2czG36knC
	9gfvnBfvbtMOMJLo5n76JuXFZAOnWta/oYvSc6RdxpIMcAQNj3CmBv5+WL9n9Iyr4cfGQaJvP3/iq
	JUJ/ymyNEdPFmTgb6Kq6sik1pVi4M3S8SEX9WC1/uu2CGl+CA2g1KEPxJx1qkiqksH/FFsP/iuB/8
	eKiwBw+iuYkgo9eY9tvZ1i6Wmc+p58DjBDV73qsArIFomFjoadElVdxx6hjqSTe3g2FH/W2KIa4nB
	BiM6ItWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOArU-0000000EbN2-3wdI;
	Wed, 26 Nov 2025 08:26:52 +0000
Received: from mail.aspeedtech.com ([211.20.114.72] helo=TWMBX01.aspeed.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOArP-0000000EbKy-1OzD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Nov 2025 08:26:48 +0000
Received: from TWMBX01.aspeed.com (192.168.0.62) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.10; Wed, 26 Nov
 2025 16:26:30 +0800
Received: from [127.0.1.1] (192.168.10.13) by TWMBX01.aspeed.com
 (192.168.0.62) with Microsoft SMTP Server id 15.2.1748.10 via Frontend
 Transport; Wed, 26 Nov 2025 16:26:30 +0800
From: Ryan Chen <ryan_chen@aspeedtech.com>
Date: Wed, 26 Nov 2025 16:26:30 +0800
Subject: [PATCH 1/2] dt-bindings: usb: aspeed,usb-vhub: Add ast2700 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-ID: <20251126-upstream_vhub-v1-1-910709937ee0@aspeedtech.com>
References: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
In-Reply-To: <20251126-upstream_vhub-v1-0-910709937ee0@aspeedtech.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Rob Herring
	<robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
	<conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, Andrew Jeffery
	<andrew@codeconstruct.com.au>, Benjamin Herrenschmidt
	<benh@kernel.crashing.org>, Philipp Zabel <p.zabel@pengutronix.de>
CC: <linux-usb@vger.kernel.org>, <devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-aspeed@lists.ozlabs.org>,
	<linux-kernel@vger.kernel.org>, Ryan Chen <ryan_chen@aspeedtech.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764145590; l=1317;
 i=ryan_chen@aspeedtech.com; s=20251126; h=from:subject:message-id;
 bh=HEzWWYIHW1xKDw5/cUq64msPdNcRWYQ7CNoSj8s7Tc0=;
 b=/akVg1W5dYhU+EFX3V4YbmlsHawqShE/aW/7otTU9xNBzwfv2BAVdGtZjeZCZLSeEanHdxVzb
 hGiaFh5PeyOAdlM0Qi8k8o2S393xmdPTdzTBUGRyQozqnU+4MNQoe0D
X-Developer-Key: i=ryan_chen@aspeedtech.com; a=ed25519;
 pk=Xe73xY6tcnkuRjjbVAB/oU30KdB3FvG4nuJuILj7ZVc=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_002647_376767_1B113C5B 
X-CRM114-Status: UNSURE (   8.77  )
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

Add the "aspeed,ast2700-usb-vhub" compatible. The ast2700 vhub
controller requires an reset, so make the "resets" property
mandatory for this compatible to reflect the hardware requirement.

Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
---
 Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml | 14 ++++++++++++++
 1 file changed, 14 insertions(+)

diff --git a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
index 7f22f9c031b2..c9ebb6e004d1 100644
--- a/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
+++ b/Documentation/devicetree/bindings/usb/aspeed,usb-vhub.yaml
@@ -26,6 +26,7 @@ properties:
       - aspeed,ast2400-usb-vhub
       - aspeed,ast2500-usb-vhub
       - aspeed,ast2600-usb-vhub
+      - aspeed,ast2700-usb-vhub
 
   reg:
     maxItems: 1
@@ -33,6 +34,9 @@ properties:
   clocks:
     maxItems: 1
 
+  resets:
+    maxItems: 1
+
   interrupts:
     maxItems: 1
 
@@ -107,6 +111,16 @@ required:
   - aspeed,vhub-downstream-ports
   - aspeed,vhub-generic-endpoints
 
+if:
+  properties:
+    compatible:
+      contains:
+        const: aspeed,ast2700-usb-vhub
+
+then:
+  required:
+    - resets
+
 additionalProperties: false
 
 examples:

-- 
2.34.1


