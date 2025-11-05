Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B65CCFA0D
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 21:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U/HWjTcrTykICPk85BFLbniT6AbycVyNQZ2wskKa2+Y=; b=yIQc6Gmzk/P/usKLzpMjEhO5uL
	JZFTk2HfV+Ld1cZLZUmpTCe4kKZ7dDeue34aAW+Gllz3KTNuBd2+8MGwvBp9JAOsOwInTGCinoH0Y
	v4rGduUTtSxjdp18c5UQbxxxBNSl/KtfkkqsuGYSWsCUD1ZQsrcN/GUTtl6fvTVoLRlKUI0q9/A4J
	BVgywLK+pVcKDnutm/zR5bry6ABOtSenTx0amHNT+FAT6J3wdcJQ67tBseJTI5NzzE78VdZZRSgj4
	OPU6ZoWwptKmdXUbAPHtEh2I0HnIWovo2LhBdPsQnyLSfblBOFxKJjH3dL94xaFZusU9ofTJcXdbm
	foXl3u6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGku4-0000000EUGW-2X5J;
	Wed, 05 Nov 2025 21:18:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGktu-0000000EU01-3nAf;
	Wed, 05 Nov 2025 21:18:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762377516;
	bh=awDSMBDJzPPS4EnVp8+B6nVYbJz7nRdZNkEF4vHPpPs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ci42NPe8j7NJSLA1jJMH0sd/AmJryok+Vl512uKMGj5mF2Kxb3nn2pL+6hJVPtci6
	 ZZkmTVlO1SqVesFxzX+Q4zRKCSPVZeCb7E01Cdng8wUwBesuwK9m0Tn2PfSzaN4oDo
	 fKbUfb5awtUm/uQeA2LTeJgBs9vIHwaBI8zxpWSsM6pXLyiBIHKqlnnW3zA9NjO1i/
	 ZuSqud86yIDPzsXOaxa3W11u+/4aMukzxMhNeOP9SWxZTMBWKM9ln5DhMMsdFaT1m0
	 abYnXSsuUk+88l4wwcitMfj6JmgzN8RAJhIpUuBOXP3w4aG5Tl1kvPzmbFApEnf0/2
	 KMjrOAZnCGYig==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0997B17E1465;
	Wed,  5 Nov 2025 22:18:36 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id B56D010F352E9; Wed, 05 Nov 2025 22:18:34 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Wed, 05 Nov 2025 22:18:03 +0100
Subject: [PATCH v3 08/13] dt-bindings: net: mediatek,net: Correct bindings
 for MT7981
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251105-openwrt-one-network-v3-8-008e2cab38d1@collabora.com>
References: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
In-Reply-To: <20251105-openwrt-one-network-v3-0-008e2cab38d1@collabora.com>
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
X-CRM114-CacheID: sfid-20251105_131843_168278_91D1058F 
X-CRM114-Status: GOOD (  10.93  )
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

Different SoCs can have different numbers of Wireless Ethernet
Dispatch (WED) units, specifically the MT7981 only has a single WED.
Furthermore the MT7981 uses infracfg for PHY switching. Adjust bindings
to match both aspects.

Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
V2 -> V3: Only update MT7981 constraints rather then defaults
V1 -> V2: Only overwrite constraints that are different from the default
---
 Documentation/devicetree/bindings/net/mediatek,net.yaml | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/net/mediatek,net.yaml b/Documentation/devicetree/bindings/net/mediatek,net.yaml
index b45f67f92e80d..c49871438efc7 100644
--- a/Documentation/devicetree/bindings/net/mediatek,net.yaml
+++ b/Documentation/devicetree/bindings/net/mediatek,net.yaml
@@ -338,12 +338,14 @@ allOf:
             - const: netsys0
             - const: netsys1
 
-        mediatek,infracfg: false
-
         mediatek,sgmiisys:
           minItems: 2
           maxItems: 2
 
+        mediatek,wed:
+          minItems: 1
+          maxItems: 1
+
   - if:
       properties:
         compatible:

-- 
2.51.0


