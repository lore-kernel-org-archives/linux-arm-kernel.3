Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99C3C3ABB0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 13:29:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NAHsnYNew+xmwzeCgxO64o95GIR1n9S8jcUckZIFtcI=; b=vQH+CPb0OVGAIECfb20WxG+oe+
	WRlNk/h6K8ix0K7iVzyAEatQvU/XmgpZA3YvC6zQwlCA8+Tc9LNVJpqR9/fxJCOCr9GagKBMot1N7
	j/AxUA/o62TBZXl9rWeSIiXslqc5y1y+lm3XXLA0TmhxNR6P3CKTN97H0eTR0mwyhuLIEqV5cb3Zr
	swCFTjrqql2tICTxFMeFcuMScKONTGyeZZQzQ7PAC/EihYxrWZ5u88WxgiDgwl8C1Ty6UiDQQ750S
	dYp9gM2CyiSu9nRO67xscP9VrET365oJrad1I2wc2kyu4GVCJdXkSuMnpqV/ZMZ1miqq+LMqTBltc
	Mv6UC3Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvsp-00000007UvL-0vdB;
	Mon, 05 May 2025 13:29:23 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBvnW-00000007U1v-2bIZ;
	Mon, 05 May 2025 13:23:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1746451433;
	bh=HggPxWEvci0Nw3XAAZKOgbcYb9Y2yMgNjUUita5XUCo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=HUfr6toVPCb2SnWE9VrHyTk2xrXVXTrZlrlQW2m6hLe64AEUaAb7mw51ftkQOpdD4
	 cLy1Laj9ZY4Ctp/ElIDwr7HZPcGFitvBGFiYZRq7LlYYYDTbFHcJeq4jVLrNpE5zm9
	 bvsB7p+TMmuq24KAhyO2XuKEIRVVaJo+J+wATKPgwyDH4D6xo8DTIIhS1HOTHNdg6U
	 r22JS7do5w8XzJ4RuFJ2uvNcUQYlwCI9V1ZX6DKHs0Y6xMFSNaPPOYPKjJHc7P/orQ
	 IrLkcFOOtyofx2PD5OIeZR6DpGM+UHAvOaDP0jGCDjxhhgyEJvlJIXscF2mtAlK1pc
	 uzZ+wud4+mF6A==
Received: from apertis-1.home (2a01cb0892F2D600C8f85CF092d4aF51.ipv6.abo.wanadoo.fr [IPv6:2a01:cb08:92f2:d600:c8f8:5cf0:92d4:af51])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmassot)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 34BF217E07F2;
	Mon,  5 May 2025 15:23:52 +0200 (CEST)
From: Julien Massot <julien.massot@collabora.com>
Date: Mon, 05 May 2025 15:23:37 +0200
Subject: [PATCH 1/4] dt-bindings: mfd: mediatek: mt6397: Add
 #sound-dai-cells property
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-mt8395-dtb-errors-v1-1-9c4714dcdcdb@collabora.com>
References: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
In-Reply-To: <20250505-mt8395-dtb-errors-v1-0-9c4714dcdcdb@collabora.com>
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
X-CRM114-CacheID: sfid-20250505_062354_805728_23EB4DA0 
X-CRM114-Status: UNSURE (   9.71  )
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
 Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
index 6a89b479d10fad3c8b61cab5a3af1453baca4d1a..86fc1b5db3b075ea0f6e35f58ecbca7956d230c4 100644
--- a/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
+++ b/Documentation/devicetree/bindings/mfd/mediatek,mt6397.yaml
@@ -53,6 +53,9 @@ properties:
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


