Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF570D6552F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Dec 2025 10:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AL+98R/PA42uBT20XzjISUWFZpcpnUEZaWpkgz2O4NU=; b=l+GQdLbHd7vi9cw7dz4clvVbrO
	tB0z2mNMa8mvYFw6n7zxYzoiQ6+PdkSgYVUqHYXO+sQhyuTnEHulVRprkeAPVvvx3IYOwgZzmS5Ed
	S+P6Ah4gBzvN8/sFS1ijHQDFF39AH+i5ucMMpLrzFVgpXb39wEURRcBqmFGR/Mje/jE9tT1DaMnzC
	QrC+j3hIloOKG364NmeqOFUVEis6dvZXZjd/AEQkPGCbbBo+RHWoCgw4YbY+2uIpFlWjOKWI5DutD
	S1UrI6q6OOhjVh8zzBEXFZwxnIULzlPtfcs4ZjvqNgyt/dbn5RvjZROBPfdrR29JFkFGf3w1VODh2
	dabwyb4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodM-00000006bOS-22le;
	Wed, 17 Dec 2025 10:19:52 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVodB-00000006bC6-32Z4;
	Wed, 17 Dec 2025 10:19:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765966778;
	bh=gqLoSDWv4cr26CDJ+gJOR8MLYYb12/Sg3eKXidGaIU0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=cAk8INtJ10fE97TZGFrql0Q0hZPMTk7ue0iGSZvxa89bDF1dDNFQtN/LR2D0Zhk8y
	 HoCTUewfVkyXKd29lIAt8+kCZ35L/9m57cLmF1zhk/CyazUqPSX8VnBmXUMIW5Hgis
	 XCynkCw/FnHmIMuIp+TE9SwFyYbvTjGrkeshaiLHfgLF/IponcAaZI/6fgJgCYo0FP
	 W3XKLfVGiuYeD/3OUMSdPZULM3+AZR5o2+S+P3zUNIMMuA4Q8UDfGQJkUIAs9PZXd7
	 JlbkFXZa31THkABNFJhQHeHy9yhbg+RHVXJG8jnBY6PKbwZLLBlpJZJTouSmO9A7I7
	 svRNcCg40sGYw==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B13E317E1146;
	Wed, 17 Dec 2025 11:19:37 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 17 Dec 2025 11:19:01 +0100
Subject: [PATCH v2 02/12] dt-bindings: phy: mediatek,hdmi-phy: Add support
 for MT8188 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251217-mtk-genio-evk-hdmi-support-v2-2-a994976bb39a@collabora.com>
References: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
In-Reply-To: <20251217-mtk-genio-evk-hdmi-support-v2-0-a994976bb39a@collabora.com>
To: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Guillaume Ranquet <granquet@baylibre.com>
Cc: kernel@collabora.com, Krzysztof Kozlowski <krzk@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1765966775; l=1077;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=gqLoSDWv4cr26CDJ+gJOR8MLYYb12/Sg3eKXidGaIU0=;
 b=dkjnWJXAfZcZC1z74WVh6/Lub5XXCFeWY01+Hrw1baZdaesZ+NuS8nHD8Kj2wq9Gb9IvzbMp4
 9fIBi+a/2tGCyy33u0jnukUSN7m3WEHEPW+IwQgXQ+P8FHjARn5jvqM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251217_021941_921154_8AC9272E 
X-CRM114-Status: UNSURE (   8.48  )
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

Add compatible string for the HDMI PHY IP on MT8188 SoC, that is
compatible with the one found on MT8195 SoC.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
index 10f1d9326f18dba85b92b4c88f4c0f6cdddc4c25..cd4ac42ee45e4648ed512f68f6f28d1f3f2e1116 100644
--- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
+++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
@@ -26,6 +26,10 @@ properties:
           - enum:
               - mediatek,mt7623-hdmi-phy
           - const: mediatek,mt2701-hdmi-phy
+      - items:
+          - enum:
+              - mediatek,mt8188-hdmi-phy
+          - const: mediatek,mt8195-hdmi-phy
       - const: mediatek,mt2701-hdmi-phy
       - const: mediatek,mt8173-hdmi-phy
       - const: mediatek,mt8195-hdmi-phy

-- 
2.52.0


