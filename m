Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7692ACCF2DD
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 15:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJiMd/bvt8Mwi0Gb2O2U04dAbu/4XAgEuxYlKkUS/zg=; b=kjZ+Yr2RwIQpO0PdtxRQ2bgmvh
	KOwVgdISz6Q4vt1QMyvKh1c3XLZ+MjgON/JZBzekgvTq0pimaDy5IiVvZ0BNKLK/WP9AaKeMe5Gc+
	faN4DPiHz8q6494YJHGExjBZn2Q0oZWj04XeBU6bn9+TgVJuQQrsRQK4mMkIkFiemBlF6roTxShif
	psCJDfsT9Zi5+Sc2IKJS1fQ7A6x93+0cTaSCpQmKu3BIAHCRcNp8XNDsIhW0NQ0j1xa9cWwmhflw3
	ZxzdP3V4TO1aHueQ1MWmnMxZxfbl3HUJ9bcOSSGNCFh6A7vFHBD0SCqxsGIpxZrQGZ9Dw16cIKBt5
	djZapMHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDuq-0000000466b-2ZCE;
	Tue, 20 Jan 2026 15:45:12 +0000
Received: from mail.thorsis.com ([217.92.40.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viDun-0000000464O-1lXB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 15:45:10 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A0A0F148AD3B;
	Tue, 20 Jan 2026 16:45:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=thorsis.com; s=dkim;
	t=1768923907; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=BJiMd/bvt8Mwi0Gb2O2U04dAbu/4XAgEuxYlKkUS/zg=;
	b=GeGBCJCNeA38ZnReG8PKPscvRJKfw0WoQ5SoNVwcQyx3rSWA66Plz8oX3ux0PBnWJHHULV
	kc1arm6/QDw69IgLwN2GzqCFeFBGZfnPeijWhc+vNKUrzHI1PszjUMQFAxZm+R0BIGg2Aa
	tYLlnZVPlPEMIE+P31gjBNJCnvgd/mGi3NEOEv57WKyXJjESjnn4J4aCDCVUdbTeaoAecY
	3dz8yuEnnnyzg9nq+PhkVHzKkvtO2m92dIWYoBJ/iFDR9180ewS4pB9Q3cpCpDSqhdKX3v
	MSBhagsffZf36pWmP+NKMtctz+JAQqqrsS7gaYhG7nRPAMI6KoJMX4UCZ96TAQ==
From: Alexander Dahl <ada@thorsis.com>
To: Claudiu Beznea <claudiu.beznea@tuxon.dev>
Cc: Nicolas Ferre <nicolas.ferre@microchip.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Ryan Wanner <ryan.wanner@microchip.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Subject: [PATCH v3 08/19] dt-bindings: nvmem: microchip-otpc: Add compatible for SAM9X60
Date: Tue, 20 Jan 2026 16:44:42 +0100
Message-ID: <20260120154502.1280938-2-ada@thorsis.com>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260120154502.1280938-1-ada@thorsis.com>
References: <20260120143759.904013-1-ada@thorsis.com>
 <20260120154502.1280938-1-ada@thorsis.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_074509_615929_757A5B01 
X-CRM114-Status: UNSURE (   9.81  )
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

The SAM9X60 SoC family has a similar, but slightly different OTPC to the
SAMA7G5 family.

Signed-off-by: Alexander Dahl <ada@thorsis.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---

Notes:
    v3:
    - Added Acked-by trailer
    
    v2:
    - Fix dt_binding_check warnings

 .../devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml     | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
index cc25f2927682e..9a7aaf64eef32 100644
--- a/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
+++ b/Documentation/devicetree/bindings/nvmem/microchip,sama7g5-otpc.yaml
@@ -21,7 +21,9 @@ allOf:
 properties:
   compatible:
     items:
-      - const: microchip,sama7g5-otpc
+      - enum:
+          - microchip,sam9x60-otpc
+          - microchip,sama7g5-otpc
       - const: syscon
 
   reg:
-- 
2.47.3


