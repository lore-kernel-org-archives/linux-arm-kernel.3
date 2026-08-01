Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 43671C55172
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  1 Aug 2026 11:21:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxC1M/tdYdJGtRmXFQtTEmCh3s7ouo0vpWRbZF137vk=; b=i8RKhOx8/ntK7K9ssn6FK/EFIX
	Xpttk6YQFQgin1eI+Xp1/9qL4PGBmaAkWDWNM/1uHBan9dF7vSUDOq/nwFm4lbx+EAO9PBtR3QZox
	dGnmsyabBUUAeR0IMnuk+OnDmbGYFi4gfAUWPFX8yS63Iji5t3NFKq4mVyXfi+pPrNaJOZq/XYKGu
	QYopGsT2/aerLjeCo44foJ8SMqnEoDoT7bDPcH/R4gZm0LGyyhY9II1hHiWYM8i6ZstJIdPLjXsyF
	ftzUd6LBi9Wf8zpa/wnEr6ujX5gdqmTkDvD63Q4H14reZ7opUpH7VaJ1AK2Dr6x/7hN5jSMl5RsAw
	arFXalCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mP-0000000EDAV-2CvG;
	Sat, 01 Aug 2026 11:21:25 +0000
Received: from [148.251.105.195] (helo=bali.collaboradmins.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wq7mM-0000000ED4C-0taR;
	Sat, 01 Aug 2026 11:21:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785583267;
	bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Jv3YpqW2ECYptkFI0PAhuchWqWSlYBTBoRmlkegG1bvjPiDvSG/cFWQ/qrlSjxAPe
	 uRwOm2lozMBd93d/u2IYOw6Ml9bXrz7CitpO0FRdH8aGdvPj7ERstxz5keTzQhzRhp
	 8KODeaksu+MM9rhsW7dEEZsPN832GWXffMfWqjo1BvqSYrdeGdNCb5jvSNYCUvX4UB
	 p6Ya9wwa0O187fBUuBkWo4Ssdkmj1J9+N6yxTkmZIqySJeATd9lWoFDYhq9uQLwXVm
	 4v4FEXAeZk2+pG0wL+6IB18c7O04lu5dsoUX5athR1JEetC6+xLiVb4vqo2LUjcGfS
	 5M7rwymmUz+eA==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3627017E092F;
	Sat, 01 Aug 2026 13:21:06 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Sat, 01 Aug 2026 13:20:50 +0200
Subject: [PATCH v5 04/25] dt-bindings: clock: mediatek: reorder MT8186
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260801-mt8189-clocks-system-base-v5-4-ac4410697cc2@collabora.com>
References: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
In-Reply-To: <20260801-mt8189-clocks-system-base-v5-0-ac4410697cc2@collabora.com>
To: Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 Chun-Jie Chen <chun-jie.chen@mediatek.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Edward-JW Yang <edward-jw.yang@mediatek.com>, 
 Richard Cochran <richardcochran@gmail.com>, 
 Chen-Yu Tsai <wenst@chromium.org>
Cc: kernel@collabora.com, linux-clk@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 netdev@vger.kernel.org, Conor Dooley <conor.dooley@microchip.com>, 
 Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785583260; l=2561;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
 b=59pJs8Kia0flL4xjKwMxK7V+dUPC+BTgsF0gIJ5yFKHxZ2ceM+oww/JeK+SCt1xsHkwAxpggc
 bX70HKm6yS4AhD5xNivBf7EYY4THJ9YqTR8JXNSGrcuHvhL1MqyEJM/
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260801_042122_456919_C579DF65 
X-CRM114-Status: UNSURE (   8.96  )
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
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


