Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB05EC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:03:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxC1M/tdYdJGtRmXFQtTEmCh3s7ouo0vpWRbZF137vk=; b=tC22RvgcKFNQJMW8CMD+6NmwFT
	kiiy00HLHvENkAVSE68lEOJSv0NegdrmFdmozLjwVBNP64UTiAmn/pOGIBQhF6AcAwODtZtUB/Dug
	vFc/HtSEEQYPR85PJ05HDaekNOD5YmFUh01Y9uRPUg/6vYJJ9fgOkv39b3EDNwaKQIWsJq8l3hvkr
	51qBJ1rr23blKs20QMkwAFEqeHZgxRIQMRw21bWWmJjYT+l+TRVVhSyyan8R+1+PpwhHo15mAQoMC
	xENlNp/zsLrSMiE6Suwx6jfwEqSKvAyjncGwwuehT1K66EO6bvDz0krohrWIb3l7DBpbo3KRLeDXN
	387n9QKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp18U-00000007SGl-1YC5;
	Wed, 29 Jul 2026 10:03:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp188-00000007S12-3bts;
	Wed, 29 Jul 2026 10:03:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785319394;
	bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=lEN91WhinsLffcKUXOHiPNC3DN8jHGHdHjgNf7uyC1qmo/M33CX8DYXHphObtiSI2
	 EG5grcWOXAH3wa4XMXH6RN7V3DZefH4irCsVX2OJyyNSp8GIxauKASOm/yWibyFFDT
	 MLJuWzvtZmAd2mZD/naRxjRhdUlve7PQf6PJGFNI39Kt4idVF3ghX022ZOs1ZSgHso
	 f0TogkDzLLjFzGJiXSiTauwlJ1fWBfw92II7MrEqs7/5i8/FHTtmz/2B03oNZMR17b
	 fnXYsGeYCbtpXFWD8LNj8q6RkQnDL8gg4i0FQjqbtLJlLzkhH13WLIGBYoF3DYE2LA
	 HbxtW5Z6TQKbw==
Received: from yukiji.home (unknown [100.64.0.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: laeyraud)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2344C17E08A2;
	Wed, 29 Jul 2026 12:03:13 +0200 (CEST)
From: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Date: Wed, 29 Jul 2026 12:02:48 +0200
Subject: [PATCH v4 04/24] dt-bindings: clock: mediatek: reorder MT8186
 compatibles
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260729-mt8189-clocks-system-base-v4-4-e356b813a64c@collabora.com>
References: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
In-Reply-To: <20260729-mt8189-clocks-system-base-v4-0-e356b813a64c@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1785319387; l=2561;
 i=louisalexis.eyraud@collabora.com; s=20250113; h=from:subject:message-id;
 bh=3HvR2i0TeyW7ntE6wt26ah4Fl34lpJceNTjjoyWnRHM=;
 b=irEGvJdiJBy8F5Nc6satMhKeIoTPr9QxNq4YfngJ0JWgZQm8GYVAVvmboBSo3+HThK/AJDXnj
 b1CqN0I8bRSDAq3H8zoYbhbUC8IH8hNKBIdudJsa35y3ReDHtkhIuYk
X-Developer-Key: i=louisalexis.eyraud@collabora.com; a=ed25519;
 pk=CHFBDB2Kqh4EHc6JIqFn69GhxJJAzc0Zr4e8QxtumuM=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_030317_107577_36ECFED8 
X-CRM114-Status: UNSURE (   9.28  )
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


