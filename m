Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A056DC3ABDE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 08:55:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OXtyqhKAYQ7rzIf1VKLFznWJ4YGo/ohp21RFYJSCNLc=; b=1zlx8p2HG/N/noho5Osg4uwKRl
	wqhYOKsZkad463+5arKmp40P4aJ51Z5MxwiJ2RYSPUfix07hTzyVOwdlYNDjTa8VfWb4m154754dV
	90cJNOEQFDvmo1fTF6SmckVqLPUK8D659/ZYrDE5wtURnvS/I+10rCZ5scxc6+n1A1g3QTguzUh32
	bMrj3aH7yI2AVCDJO52LzB3KS2N7sIT6zHRbz6ErQbYH6Et7PD4vRFvhKYTrhb7f0RxWQum8I35js
	/xp1LgOz/lkk84g5HDwa5YxpmbeXWnDmPzAh2eY9862xmg29H+jVZ0IxDM3zJrG9Hbwh9nLZKkZGE
	6tS/JkpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7tK-0000000EaGt-2sZp;
	Wed, 14 May 2025 08:55:06 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uF7LV-0000000EThn-3NL6;
	Wed, 14 May 2025 08:20:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1747210808;
	bh=eVS8ASAPWXFPs7zmXnVv2z4AjK5YrBRmxmYDS53TpiE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=VuKgwCUPuoiMh63fAsWJcXFb+WTCyzT4zkxvrNgRY9oEZFDc9cmfr2oKNbD4dKlbQ
	 2KWMQka1r81eUxmi4+Fpss7PUUi5XIy8XEFbnwEbeuB3cI+7cFSpwEKWNV4oX/puZC
	 ERSGUAucgOHC5yL4wIornVzg5z8bpXuFnh+To4fJHnsdXJ0M9Z0wYf7gdJIqkblSM2
	 mRhdQ1D9oyGxnUcIRH+0e2zIyRYqPgIWwUsYhZlrNqqJ2vDlXIy1ZpKgwuUCa0AcfP
	 ocVCkuCm50Q6JLHXBXOEpJKS+D08SlNucQJKi7C7PK2XCCpM4sWB9SprBVGBVJS1CV
	 212ICctrS7Nkg==
Received: from apertis-1.home (2a01cb0892F2D600c8F85Cf092d4AF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2729417E07C9;
	Wed, 14 May 2025 10:20:07 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Wed, 14 May 2025 10:19:56 +0200
Subject: [PATCH v2 1/3] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250514-mt8395-dtb-errors-v2-1-d67b9077c59a@collabora.com>
References: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
In-Reply-To: <20250514-mt8395-dtb-errors-v2-0-d67b9077c59a@collabora.com>
To: kernel@collabora.com, Sen Chu <sen.chu@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, Macpaul Lin <macpaul.lin@mediatek.com>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 =?utf-8?q?N=C3=ADcolas_F=2E_R=2E_A=2E_Prado?= <nfraprado@collabora.com>, 
 Hui Liu <hui.liu@mediatek.com>, Yong Wu <yong.wu@mediatek.com>, 
 Joerg Roedel <joro@8bytes.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, 
 Tinghan Shen <tinghan.shen@mediatek.com>
Cc: linux-pm@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-mediatek@lists.infradead.org, iommu@lists.linux.dev, 
 Julien Massot <julien.massot@collabora.com>
X-Mailer: b4 0.14.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_012010_729256_E10EF71B 
X-CRM114-Status: UNSURE (   9.69  )
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

The 'mt6359.dtsi' file already uses the '#sound-dai-cells' property.
Add the corresponding property to the binding to fix the following
dtb-check error:

mediatek/mt8395-radxa-nio-12l.dtb: pmic: '#sound-dai-cells', 'mt6359rtc' do not match any of the regexes: 'pinctrl-[0-9]+'
from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml#

Fixes: 9bc8353be720 ("arm64: dts: mt6359: Add #sound-dai-cells property")
Signed-off-by: Julien Massot <julien.massot@collabora.com>
---
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..9580c4ec1ae00f1dd1182357d8b0a5035a1b7f82 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -30,6 +30,9 @@ description: |
   See the following for pwrap node definitions:
   Documentation/devicetree/bindings/soc/mediatek/mediatek,pwrap.yaml
 
+allOf:
+  - $ref: /schemas/sound/dai-common.yaml#
+
 properties:
   compatible:
     oneOf:
@@ -53,6 +56,9 @@ properties:
   "#interrupt-cells":
     const: 2
 
+  '#sound-dai-cells':
+    const: 1
+
   rtc:
     type: object
     $ref: /schemas/rtc/rtc.yaml#

-- 
2.49.0


