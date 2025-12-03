Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1407D12D4F
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 11:45:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+/k9kNIvWcWRdGPj7CY9lHUttkgdcQL9M8tMyEK4QsM=; b=VUCe1XRgIEXZ3zmOsFHmnsEqHX
	a2ROpG3q/nitpMq8tdjbixeUCOJVZXmILgnU0smN8XIQn4yCMnM1/E4FoPYkjSe/thQlzfFu9J1Xj
	lcmJryiGJJJER+ioF3jQ6uqDXslSO+EzTk8xCOIp5GB8aedJ4CRiGsR2D9G6M9EGQ1/VC+Lm4CzEL
	eSVGgKA850IlG1H+ZzpErlTH0gCVB9pCXTsCc1oaHyM+lgjfUU6vDrq1Znz5eSjp59whyEun7XewA
	UMdQi3NX4ALH+6dvNKwlK5PWa1wWSK/IFYv857eh0/gEmDMl2+DASEl17OJIldH1oRtxUyzB6wkXV
	XoFZPTcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIu-00000006W8Y-2Qtw;
	Wed, 03 Dec 2025 11:45:52 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQlIq-00000006W6N-49yi;
	Wed, 03 Dec 2025 11:45:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764762345;
	bh=rSrS/g3GzIPfmw34zxW71s8tJc9N+7opnT4NQUPvLbs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kUIP8m03uVX3YSkENNi5EZ9TI0ShKToihyvXNkhsKuGWkf9B4oEYeHoRdyZ/irGN+
	 KHs0/oSDbnRpTltz83vxJxrUyFofIZH72R0Ug9Kf0vv3JIiIRFMfDHpfG/xDoHq8Uz
	 9X2BBYqi1/StLLB1Who3syAAcJoP0DB3LB0sf2AuE9b3i589Udcubh++27YErifIxi
	 1X6vUvDxVev3gYRtPeypYtHM2P9tldNbHzKd40XuIK1moa+IjHKlVn8wbWYrHWk5ox
	 8giMK9u6cps6JpTE1yJMPaKnuPhsmSYDZiwvYq59OXZYTlVKxlAiyJE+H416umVzTq
	 whGHDNq75H1GA==
Received: from yukiji.home (amontpellier-657-1-116-247.w83-113.abo.wanadoo.fr [83.113.51.247])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F1DBA17E1339;
	Wed,  3 Dec 2025 12:45:44 +0100 (CET)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 03 Dec 2025 12:45:34 +0100
Subject: [PATCH 1/3] dt-bindings: mmc: mtk-sd: Add support for MT8189 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251203-mt8189-add-mmc-support-v1-1-f5ce43212fe9@collabora.com>
References: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
In-Reply-To: <20251203-mt8189-add-mmc-support-v1-0-f5ce43212fe9@collabora.com>
To: Chaotian Jing <chaotian.jing@mediatek.com>, 
 Ulf Hansson <ulf.hansson@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Wenbin Mei <wenbin.mei@mediatek.com>
Cc: kernel@collabora.com, linux-mmc@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764762344; l=1508;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=rSrS/g3GzIPfmw34zxW71s8tJc9N+7opnT4NQUPvLbs=;
 b=qLmM9GZBF3m4ar3KUTOZb9GLigL1SpHLreXl0Q6p5wNsluo9feCpmh2tnL9pj5Hc2vU5b+qcK
 /V9eWbtSqbWARtj8OPkzNOQb95BKu4x7Yi34jDqPq2o5Le2P3WyCEyC
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_034549_179276_7E63258F 
X-CRM114-Status: UNSURE (   9.85  )
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

Add a new compatible for MMC IP in MT8189 SoC.
Even though this is partially compatible with the one found in MT8196
SoC, the MT8189 SoC register layout has some slight differences and
additional features.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 Documentation/devicetree/bindings/mmc/mtk-sd.yaml | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
index 6dd26ad314916a3e40cf55ff69a7d93ed63dbdd4..eb3755bdfdf7e001602c3eb870898275085df3e6 100644
--- a/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
+++ b/Documentation/devicetree/bindings/mmc/mtk-sd.yaml
@@ -25,6 +25,7 @@ properties:
           - mediatek,mt8135-mmc
           - mediatek,mt8173-mmc
           - mediatek,mt8183-mmc
+          - mediatek,mt8189-mmc
           - mediatek,mt8196-mmc
           - mediatek,mt8516-mmc
       - items:
@@ -192,6 +193,7 @@ allOf:
             - mediatek,mt8183-mmc
             - mediatek,mt8186-mmc
             - mediatek,mt8188-mmc
+            - mediatek,mt8189-mmc
             - mediatek,mt8195-mmc
             - mediatek,mt8196-mmc
             - mediatek,mt8516-mmc
@@ -240,6 +242,7 @@ allOf:
               - mediatek,mt7986-mmc
               - mediatek,mt7988-mmc
               - mediatek,mt8183-mmc
+              - mediatek,mt8189-mmc
               - mediatek,mt8196-mmc
     then:
       properties:

-- 
2.52.0


