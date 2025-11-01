Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA4DBCCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:33:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vpRm7H3ats3VSCshOMgAxdJtpGSjOt8cVbFUvqTLU3E=; b=w0bAn/bgA1uEs7pwhpaspcqtct
	EVfHPfL/AlxCSnMashaRzTlIyyVkzkbeSmc38ZWugnaLqmFroEt9qnMuvZM5INlulzg8JRGKePG4R
	Itc9in6UUtRg9hxl5otSuDiqEzFHwVsub5BVqKj6jgwCqruBAU40px2LL7K/FxH8MPXF0tnxEKPsl
	C9aiu3jcPLkaXdzwPlbPUJzwigomqReJfByJTo0v1Co1Pr6yO7KWWvC/gS1H5O9iy/WHYnaCMd55B
	U056/57c3Y1qwyfcNYSSq7weEDavP/l9bKSOxUfggXsjO0/2WH1d4tGXQo8jDW47Ph8CFi7q/fqlH
	Xm6TuM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBjL-00000007mWk-0lRj;
	Sat, 01 Nov 2025 13:33:19 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBjC-00000007m9t-0lOl;
	Sat, 01 Nov 2025 13:33:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762003979;
	bh=mwUsAqDXLhSK6Bwu6bjcHXmDkab3b6jje8hKF/ZG+zg=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aom+jkmTgB6Zf3By+bqgUNXiJr6t5Oj545GPD4dfS4frsjZpmTO5OYdZb+1wMOtwQ
	 OZ1n5EsAAQlC5HDjcUamwUdg3PEb/sYLxV/y65RtEIojYRe57zXxmJUFC51jRWdM+/
	 Ie9lH5NSF3g0QEcrAPNNPIScjVFskrqwv2CvCUr1djqW71xqnioT5yV0WMyMT1s5dB
	 tw+asN0zosTdtxlwhWgHoIgKp8K7hDr42MxSPfAiHKx7WTJ7Q6/1gSx/XvTXwhmVIU
	 JLH/56y87I5X8XXgvIgi/gKdM3S+RH95jSnloVC7PFKXylHb4MrIx7u+r/6guP+ehu
	 w2BkDAgzvtEwA==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A28A317E15C7;
	Sat,  1 Nov 2025 14:32:59 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id AE2A910E9D038; Sat, 01 Nov 2025 14:32:58 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 01 Nov 2025 14:32:53 +0100
Subject: [PATCH v2 08/15] dt-bindings: net: mediatek,net: Correct bindings
 for MT7981
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-openwrt-one-network-v2-8-2a162b9eea91@collabora.com>
References: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
In-Reply-To: <20251101-openwrt-one-network-v2-0-2a162b9eea91@collabora.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Ryder Lee <ryder.lee@mediatek.com>, 
 Jianjun Wang <jianjun.wang@mediatek.com>, 
 Bjorn Helgaas <bhelgaas@google.com>, 
 Lorenzo Pieralisi <lpieralisi@kernel.org>, 
 =?utf-8?q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
 Manivannan Sadhasivam <mani@kernel.org>, 
 Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Kishon Vijay Abraham I <kishon@kernel.org>, Lee Jones <lee@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Lorenzo Bianconi <lorenzo@kernel.org>, Felix Fietkau <nbd@nbd.name>
Cc: kernel@collabora.com, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, linux-pci@vger.kernel.org, 
 linux-phy@lists.infradead.org, netdev@vger.kernel.org, 
 Daniel Golle <daniel@makrotopia.org>, Bryan Hinton <bryan@bryanhinton.com>, 
 Sjoerd Simons <sjoerd@collabora.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_063310_528678_9BE5CB44 
X-CRM114-Status: UNSURE (   9.73  )
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

Different SoCs have different numbers of Wireless Ethernet
Dispatch (WED) units:
- MT7981: Has 1 WED unit
- MT7986: Has 2 WED units
- MT7988: Has 2 WED units

Update the binding to reflect these hardware differences. The MT7981
also uses infracfg for PHY switching, so allow that property.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V1 -> V2: Only overwrite constraints that are different from the default
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index b45f67f92e80d..04224e0ff408e 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -112,7 +112,7 @@ properties:
 
   mediatek,wed:
     $ref: /schemas/types.yaml#/definitions/phandle-array
-    minItems: 2
+    minItems: 1
     maxItems: 2
     items:
       maxItems: 1
@@ -338,12 +338,13 @@ allOf:
             - const: netsys0
             - const: netsys1
 
-        mediatek,infracfg: false
-
         mediatek,sgmiisys:
           minItems: 2
           maxItems: 2
 
+        mediatek,wed:
+          maxItems: 1
+
   - if:
       properties:
         compatible:
@@ -385,6 +386,9 @@ allOf:
           minItems: 2
           maxItems: 2
 
+        mediatek,wed:
+          minItems: 2
+
   - if:
       properties:
         compatible:
@@ -429,6 +433,9 @@ allOf:
             - const: xgp2
             - const: xgp3
 
+        mediatek,wed:
+          minItems: 2
+
 patternProperties:
   "^mac@[0-2]$":
     type: object

-- 
2.51.0


