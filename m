Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E442ECCFA00
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Nov 2025 13:33:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YTHvtBL+VZnUTHjrz6ClSw7+XPBkv6t8SxYxsbAo8Ew=; b=Os3axZYPokhEvwPIdkyrLyNU9m
	Xv1mRHBsbLeO7DQUSl8yGH4FB/Yb+H0THTSGjQOiuX+noJdGIkw9UjwuzPmcGkY2sZQfNaoyG6GTZ
	BexZOH0TSagj6VXVWlJGBfPsEGZQBiwLXDufs7fYHOH5HUZxzHAKWb8QKxIryGDpKMnLvopK8AXUm
	di8pG7xRK9QfuU7iesxt8a1FG31OA8LBgoSzX3qrTJMqR9CfTUbvLgl5S0I9BBDLDEzR59cl0qOUa
	bvZUOhaXbKYpFW5UQRkgUrRH91H8aqmSg+guWQ3TLS9kiB/xmrordyMm8g2Ap6Ze6Gr+Te0uW2fsX
	OHc0OuqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBjA-00000007mBK-37bt;
	Sat, 01 Nov 2025 13:33:08 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFBj6-00000007m6D-2C8c;
	Sat, 01 Nov 2025 13:33:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762003979;
	bh=BNloXSmxfui+A+UD0vb6639VkVLh4h7qFS1iqqJUbUo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Exv0LA1+cm4tyucEYwLSVQ2e31o0Ds9n13t8MWxGhKlyq8fbibv7MZTjR5SfEjP2a
	 yKW2bOQNgifi80y3258kT7WHFFw8nAJLOKi0l53xZMfj5fk8E/FQ2Eu7bfjvbOYjyg
	 jjp5R8fGy8PbAVI0slWBAd94x7Jz7lodS+1i1CptPHTLm+Nh96RTxcDNEqyB5Mts6g
	 k0C1t1uNIBP5QW5TCOiSXIXAf7IhknDpnDzEqQLro+71V4Cq+zT1yDHL4wq7RsYp64
	 pqk/4iaiRbj5qDwU+k/ixNWluxakcscVMdZgjcnWWsBQjBQKaY1W1YVfqugnVKT14Q
	 DLBznDNB1sFXw==
Received: from beast.luon.net (unknown [IPv6:2a10:3781:2531::8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: sjoerd)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id E56DE17E1402;
	Sat,  1 Nov 2025 14:32:58 +0100 (CET)
Received: by beast.luon.net (Postfix, from userid 1000)
	id 942EC10E9D02E; Sat, 01 Nov 2025 14:32:58 +0100 (CET)
From: Sjoerd Simons <sjoerd@collabora.com>
Date: Sat, 01 Nov 2025 14:32:48 +0100
Subject: [PATCH v2 03/15] dt-bindings: mfd: syscon: Add mt7981-topmisc
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251101-openwrt-one-network-v2-3-2a162b9eea91@collabora.com>
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
 Sjoerd Simons <sjoerd@collabora.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251101_063304_760481_583C600D 
X-CRM114-Status: UNSURE (   8.58  )
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

This hardware block amongst other things includes a multiplexer for a
high-speed Combo-Phy. This binding allows exposing the multiplexer

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Sjoerd Simons <sjoerd@collabora.com>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index 657c38175fba2..51511078c4c3b 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -193,6 +193,7 @@ properties:
           - mediatek,mt2701-pctl-a-syscfg
           - mediatek,mt2712-pctl-a-syscfg
           - mediatek,mt6397-pctl-pmic-syscfg
+          - mediatek,mt7981-topmisc
           - mediatek,mt7988-topmisc
           - mediatek,mt8135-pctl-a-syscfg
           - mediatek,mt8135-pctl-b-syscfg

-- 
2.51.0


