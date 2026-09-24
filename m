Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B5EBC9830E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 08:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T6Lvb32mrK0oQ9gSU/WaSMqvyL4dYKWhcMXOjEFz1w4=; b=c+Ij3ZvYoYkNpixEZu6iiHuCaG
	fNrvPBlRDFZpS/rhjAJ5p9Ml13uiXVQSyylD71cl4uQTg0M8QAI34R4p8DbDqjkqar7gI4+7FXC4h
	IfpJ6bryIjSl39DlyqbhHvQjgeNPh6PNNmaLvvFGRaB920MhtqIX4R8G4k6QIn7OkWzXhgYXnb2eW
	Zb3nAJJNyFakTpGU45mMWgh/OPw9HHS9OIzcKrfSE/O/AGgUeKfIeTkM79RLRrQXAwb8OpsNd6Cnf
	GOhugZTmvjPXmV0LVMUrXMhBZJ1jq7OBs+vDs/lbpXHQ8dSCmbzHxlC1/p1CakpMd/kNDr9vTGk3O
	CwkEkUCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezu-0000000ASpP-0nEi;
	Thu, 24 Sep 2026 08:40:06 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9ezn-0000000ASiW-3X7s;
	Thu, 24 Sep 2026 08:39:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=T6Lvb32mrK0oQ9gSU/WaSMqvyL4dYKWhcMXOjEFz1w4=; b=KYg1DTXBzNO1fXIhVdR1mtiq1x
	P618FBW/zbYyLtGGYIgIQrgIrM76kEfr6pLCiJALRjfqadDmMejugLksclP+CSckTcbbQ3HcR1oGJ
	5iwcHJRoeyFjNRSdS3bXfVgynPocUDCk9YlG2asqHwbyWQPnVHQFBEikVF5nI9xfKsrXI5HF2pTf8
	HCriI8WDrenzViZq5lKbex/ehCf/lxEhWM41wqMVM42g6TIihfTkIAqnZCuCLXoKBNS1l8yYA8sc+
	pXJ5Vi+eC5emHtqS6LpcWTLQsQFf3Ct0OhaY/HPveVnWjvc1eu0NsL1aCMyD4YAn963ZAHwJWAYlM
	LJcv0Fjg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9ezi-0000000Fk8A-2QPj;
	Thu, 24 Sep 2026 08:39:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1790239186;
	bh=RlbXQftjDrzhO20EJi3wz+0Try3sBhIBS8ovCMKw7j8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DqDrNBNqqOoOSbolYQM4mPRjpKncTUZpLrwN7rg2N8Zses4Ffci2UPINvfSJyq0hB
	 Q8YaQB+QLfbUNa62CEw6pURcNpsIF8lPYHSlKspC6vvm9W1w0VGivn16lrDymCbL9s
	 /YWROhRHnwfELTHugfPXFYi0iMxOIi+CFSFj2ScaIyLn9R6d5hO/VG+v7vCGUt58Ft
	 J20RnxmhnqzrZGll2klvHdARHa43WZtnfhIAwTNN2kqYelK/rlLhCp3OhN4xZjGMFY
	 vDlMMkbceOGUTZykCLD6W3zmAAoOajFtfD/0GWN0z0tP9JZBGpz88gayY8VlBEMv74
	 4cy5BruxToqig==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 92F0B17E0A66;
	Thu, 24 Sep 2026 10:39:45 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 24 Sep 2026 10:38:11 +0200
Subject: [PATCH v3 2/4] dt-bindings: arm: mediatek: add Mediatek Genio
 520/720-EVK boards
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260924-add-mediatek-genio-520-720-evk-v3-2-2ec5c80677d4@collabora.com>
References: <20260924-add-mediatek-genio-520-720-evk-v3-0-2ec5c80677d4@collabora.com>
In-Reply-To: <20260924-add-mediatek-genio-520-720-evk-v3-0-2ec5c80677d4@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790239184; l=1623;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=RlbXQftjDrzhO20EJi3wz+0Try3sBhIBS8ovCMKw7j8=;
 b=Nc52S+/1q1xqeNFDx2eJFz9ixwipZS+krqdFKd/Acfp34dz95IJeVEqpNR64YlL94l9/k5hE7
 2oc+wG1Z092DD3wEkVRtV0rU1ETejwLzxtF/Pt8oVAuTqe+RN/ZCVeM
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_093956_311348_744FFBD3 
X-CRM114-Status: UNSURE (   8.78  )
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
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/arm/mediatek.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/mediatek.yaml b/Documentation/devicetree/bindings/arm/mediatek.yaml
index 180e6e4948e7..5a4779d9b06c 100644
--- a/Documentation/devicetree/bindings/arm/mediatek.yaml
+++ b/Documentation/devicetree/bindings/arm/mediatek.yaml
@@ -444,6 +444,11 @@ properties:
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
@@ -451,6 +456,11 @@ properties:
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
2.55.0


