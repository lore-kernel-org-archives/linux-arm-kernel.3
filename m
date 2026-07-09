Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6415C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Jul 2026 13:43:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=phurx5b9IfTAk44gQBSYx973C9HsnonxDQwo/dcri38=; b=1HQTqJMGCZNKErzAiOmAZE/SRq
	y/cpcIW3NW7NbWKz3f/f780bmesnewMwrHt/5KZNqvqK3QWlorHt6wTJE+NuGBvIlyp75Gn4oVk+x
	p/wkB+JNBWQxRALVNv/Kc5T7OaZvYX/9k2KiMQV9ifuUN5oOlNMwk6bwEIhjziQcobqiu0tD+qwjH
	aSt0pb4x4WeucFhRQZcmlJc1PAKguyn5ABGiynmIEBPYZVGflmHFt8BooGn5dj+J8UI+U+jaTsph4
	bOH8jdor/VMiZCdq5/fO7vL/3drb5IVfivitgO4ZuJWfiVW9dWk2wxmq25j4pr1lr5vPJUGzS7f/U
	QgtLjmtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp1y-00000002ax7-1zCd;
	Thu, 09 Jul 2026 13:43:10 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whp1t-00000002ano-0eAp;
	Thu, 09 Jul 2026 13:43:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783604580;
	bh=Vzul1Dau7HnyUjS7eHhVbzTIRBW+63VNmie+QWlSG1I=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=pWUYlofpjuLfgAvasn42m3FDmVl+KtQl5w5aqq/t6N69hmsn+6DoNjnr5JtF41Gln
	 K1Df/QCoOu8//eN5h2AsN45s1hCFfu8roXfMhFU10wTxaBOKXWOc30FpID8XzIFEDQ
	 R3pWjnswWmcRXGH4xZTYSLXUnwyxkXrFpyg+dO7hSSdPoQK8GmUbbzrVl1Aym3QHvP
	 9wRfbpKZGoseL3R65RNOa0LIe7B2feTo56Aw2pDYsp4LoiMGUq86vdm0FyC2XLer2B
	 Qx2hm6qWpz/+m1G3yK9ehqGgSKVV01/O53g1DRkGIrSdqfGviPyRE4N3eWUTkzNiL6
	 SKFNy2BJWosTA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D6FCF17E0E04;
	Thu, 09 Jul 2026 15:42:59 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Thu, 09 Jul 2026 15:42:44 +0200
Subject: [PATCH v2 04/18] dt-bindings: clock: mediatek: reorder MT8186
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260709-mt8189-clocks-system-base-v2-4-2926da3db6cf@collabora.com>
References: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
In-Reply-To: <20260709-mt8189-clocks-system-base-v2-0-2926da3db6cf@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1783604575; l=2425;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=Vzul1Dau7HnyUjS7eHhVbzTIRBW+63VNmie+QWlSG1I=;
 b=7d6Rd1fCrtfU8WLljqhSj9/wOSKJmYYEKFhK9NcUuSxN9uPtJ76dc/HuVNOQniABwVCUP3QCj
 6ItDzNW5nNQAlSZ7vIuxThCM4yAj0aJ+pQzvrFi4w+k/J1Fr/l8pHs4
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260709_064305_453761_B608573B 
X-CRM114-Status: UNSURE (   8.95  )
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

In order to prepare regrouping several Mediatek SoC clock controller
dt-bindings files into the MT8186 ones, reorder the MT8186 clock
controller compatibles so they are sorted alphanumerically.

Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
---
 .../bindings/clock/mediatek,mt8186-clock.yaml           | 17 +++++++++--------
 .../bindings/clock/mediatek,mt8186-sys-clock.yaml       |  4 ++--
 2 files changed, 11 insertions(+), 10 deletions(-)

diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
index 539149c945d0..756b937bb7c4 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-clock.yaml
@@ -23,18 +23,19 @@ properties:
   compatible:
     items:
       - enum:
-          - mediatek,mt8186-imp_iic_wrap
-          - mediatek,mt8186-mfgsys
-          - mediatek,mt8186-wpesys
-          - mediatek,mt8186-imgsys1
-          - mediatek,mt8186-imgsys2
-          - mediatek,mt8186-vdecsys
-          - mediatek,mt8186-vencsys
           - mediatek,mt8186-camsys
           - mediatek,mt8186-camsys_rawa
           - mediatek,mt8186-camsys_rawb
-          - mediatek,mt8186-mdpsys
+          - mediatek,mt8186-imgsys1
+          - mediatek,mt8186-imgsys2
+          - mediatek,mt8186-imp_iic_wrap
           - mediatek,mt8186-ipesys
+          - mediatek,mt8186-mdpsys
+          - mediatek,mt8186-mfgsys
+          - mediatek,mt8186-vdecsys
+          - mediatek,mt8186-vencsys
+          - mediatek,mt8186-wpesys
+
   reg:
     maxItems: 1
 
diff --git a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
index f8acc02cafee..6733dafbde16 100644
--- a/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
+++ b/Documentation/devicetree/bindings/clock/mediatek,mt8186-sys-clock.yaml
@@ -27,10 +27,10 @@ properties:
   compatible:
     items:
       - enum:
+          - mediatek,mt8186-apmixedsys
+          - mediatek,mt8186-infracfg_ao
           - mediatek,mt8186-mcusys
           - mediatek,mt8186-topckgen
-          - mediatek,mt8186-infracfg_ao
-          - mediatek,mt8186-apmixedsys
       - const: syscon
 
   reg:

-- 
2.55.0


