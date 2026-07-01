Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A442C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Jul 2026 16:36:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RtPQlQrZov/zkGKA7uwlPLZLjOn2oC2q3fD+FUbnQho=; b=OEvhGxmf0X5x57UUiT4kZM+gex
	kwOLihXu0svoIa2AeWuAGiifLIujXbqiRywE0z/kJ+dSoSZQsalqYm0/g96dBdSPY5cPED76dJinu
	rOst36zLEK55P+oKpjL12XPowb0h4mKt2On46W+Z6VDPD2ssLHAh+Ylw4uZK/Aq0kKchp74nl+saj
	2p9RuscSW4NJoipw7MjauUyGjnfrrVZipxZJVF20UTbcSFoFRs1cE9+JBjrnM5F67BMFeOChoEhg2
	Gj5DwhHq8b01RibnHm50VT2IpB6N+NoMKDaj+jfOuaHBun+h9qEVNNIbM7gnNkL9Jd/q0jY4cjjZL
	QVIHQzqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexvO-00000002Xvp-3Pl4;
	Wed, 01 Jul 2026 16:36:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wexvM-00000002Xsr-16xg;
	Wed, 01 Jul 2026 16:36:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1782923790;
	bh=TkdNd+UM1kxWuv7MwsIu8de873TDJw/wfTZ4TUm/G1o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lMegUmqQv3k/gBeRqNmZCL429M4BPfnw25Lwrw+brUsyykdwzKIaxYy+bu8uHiKWz
	 n6IZbNclydFqSPo71jFxsjncm5hI6lvgby/V3dwfX3Zoz4O1Xktr6YdnXDdEpWXkdZ
	 Rps508P90zRhUP7fg1gu+bnfI4ernAFYiuRv+0OIusLFPqIn0HGaLKbwR3e886pVDS
	 ffaVT0oPr74v37M+ejZoFF/6i3dLv0jJeXmplwpEVYq+6bDt1iIPxMYOSMYXfFGkoC
	 D9SqHPhC4Wvd71IgjW+fOzUmpnbHxKJO4aD7xoAmSCu5G4Bh5mENH6TTAemFS7nOyB
	 t9b5xK51kUKWA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5926E17E0D72;
	Wed,  1 Jul 2026 18:36:29 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 01 Jul 2026 18:35:20 +0200
Subject: [PATCH v2 2/4] dt-bindings: arm: mediatek: add Mediatek Genio
 520/720-EVK boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260701-add-mediatek-genio-520-720-evk-v2-2-19d5da4ef984@collabora.com>
References: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
In-Reply-To: <20260701-add-mediatek-genio-520-720-evk-v2-0-19d5da4ef984@collabora.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jiri Slaby <jirislaby@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Sean Wang <sean.wang@mediatek.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-serial@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1782923787; l=1540;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=TkdNd+UM1kxWuv7MwsIu8de873TDJw/wfTZ4TUm/G1o=;
 b=HM+q6wzeUBq6NnEMQuShX1Ctas9iIuMKj5N6nxjO+bp+15E4aouMO4aVDHCc7oA5tevxiws0f
 yYmZOAiR6P8CQrwvYc7L/pHF6int56J3/x4eMJ9OggzRMTUWOcbEcww
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260701_093632_454685_EB77650D 
X-CRM114-Status: UNSURE (   9.04  )
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

Add compatible strings for the Mediatek Genio 520-EVK (based on
MT8371 SoC) and Mediatek Genio 720-EVK (based on MT8391 SoC) boards.
MT8391 and MT8371 SoC are less powerful variants of MT8189 SoC,
with identical hardware register maps.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 382d0eb4d0af..1dd32219f68f 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -443,6 +443,11 @@ properties:
               - mediatek,mt8370-evk
           - const: mediatek,mt8370
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8371-evk
+          - const: mediatek,mt8371
+          - const: mediatek,mt8189
       - items:
           - enum:
               - ezurio,mt8390-tungsten-smarc
@@ -450,6 +455,11 @@ properties:
               - mediatek,mt8390-evk
           - const: mediatek,mt8390
           - const: mediatek,mt8188
+      - items:
+          - enum:
+              - mediatek,mt8391-evk
+          - const: mediatek,mt8391
+          - const: mediatek,mt8189
       - items:
           - enum:
               - kontron,3-5-sbc-i1200

-- 
2.54.0


