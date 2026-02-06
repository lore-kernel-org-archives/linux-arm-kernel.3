Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA8CCEE2085
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 10:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GTZLfJ/3qdjGUE6E2z4l7xoUwES5wrxw9Ev3wIXdQ9U=; b=kEcvbj3/kkwqlYf3FNQLEaeWEP
	dZZpLc4CFYWUhEBRzMX+ydOcZOkOMKrUv25bfTW1I/iztSyxQkBR0vVg1uhARUaRL7SV2GNj1pWDw
	ZKmYO3qlm0bI9NpfRCBwcS6wPXHqGoNeD/J7zTuANiXEz+8wo2tJKVxGzvQm5p5RAyrPhcd1SqbpG
	cflnBuamLsBFTmCXENn1A6h7uEmh31WpbXHQzQKhY85IIVSpvuafcnC9h82LwGkjK5WppRC/fZOdZ
	B6lSafPICQpfuFOzZWPHEqPt7X4n4ttIMz4EjlcL9Sw7bLVWc2bqrZe2A7vOt2CPbrZiHf4hEKXzI
	OpCymh+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIxQ-0000000BAWx-0usu;
	Fri, 06 Feb 2026 10:21:00 +0000
Received: from ahti.lucaweiss.eu ([128.199.32.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voIxN-0000000BAVZ-0NbI;
	Fri, 06 Feb 2026 10:20:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=lucaweiss.eu; s=s1;
	t=1770373253; bh=bb8AkHZnGIuJ+7cT+GCvgzq7B3H5p2MohzntibPFGLo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc;
	b=Bitv0eth9udeuN4/o0MSc/pUM1TUsF/2YJRHeb7drQGu4DwoXoE2rZscU4f1qe/5G
	 9UYbiJBXLd7pA4nWXUH8r6oW8koEkRVVrmX84L1aZeXOhqaHeE5+MZTxOxsnMZxOeq
	 FNYb+PEs9n0E43PfLT86hvHMO9jNPgUEJyRplOT4=
From: Luca Weiss <luca@lucaweiss.eu>
Date: Fri, 06 Feb 2026 11:20:48 +0100
Subject: [PATCH 1/2] dt-bindings: mfd: syscon: Add mt8516-syscfg
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260206-mt8516-syscfg-syscon-v1-1-96dcb37acdb4@lucaweiss.eu>
References: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
In-Reply-To: <20260206-mt8516-syscfg-syscon-v1-0-96dcb37acdb4@lucaweiss.eu>
To: ~postmarketos/upstreaming@lists.sr.ht, Lee Jones <lee@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Matthias Brugger <matthias.bgg@gmail.com>, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 phone-devel@vger.kernel.org
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
 Luca Weiss <luca@lucaweiss.eu>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1132; i=luca@lucaweiss.eu;
 h=from:subject:message-id; bh=bb8AkHZnGIuJ+7cT+GCvgzq7B3H5p2MohzntibPFGLo=;
 b=owEBbQKS/ZANAwAKAXLYQ7idTddWAcsmYgBphcCDzskBqy9v4qpP4BZJ+QhF2ite7JcmFWQ47
 Rf5eqBdO7KJAjMEAAEKAB0WIQQ5utIvCCzakboVj/py2EO4nU3XVgUCaYXAgwAKCRBy2EO4nU3X
 Vpm3EADKOM4gT8umZZLojsk3B6h0DJE7Tej45JE3RwK1GLaTnTzhgGCasz0NlSlBf6QHbbuys0y
 tinBkBWQZe1LQ2kaq8lmggjVRouB2fpwr3ZnbtAcYpe4Kd0rwzsiFIrJ7U8cN8knxEv7Rv2L2U4
 PCjoJQ/buOzxweAfRGYjx/2lVhUm0yRZO1iN6eQEu57fvYX3S03VzVdLnQTL1uj05+jd/drdI4U
 icjTUrLEpyzA9dAUiZu/vUfFaPJIOuoBIjejKUgol90NE7ZMAQwSCdwO0WYlDGlCXdBg4MxBtmk
 CIZ9RS4kyeVp8WKSoFPcMDz4Vcv0JJalNj7lH85rTH55b0Z6erVJOJ6kjRMUh5jv6h+wbzHupDL
 u1LaYV8QTD8eiAMP56ojtZg07c4DdpVlV5dQHVC8XP5v34g1brVQAvux4Gnq/aYCKieMaLDIXj9
 6BEiu8pqNT9R4xrgDtMEJAtw8BrC0YpTZJRBj5bIItcHAmTM02pKXD8a3EEZmRj3pV7x/mgoM0e
 FMEaH90ItwQuWzDDxyQR7EWoTrqJuDWoTRRw/aUaEf3hVAFNIOfVMGL6Se/AEP+8gNGXteaNaGm
 NS6lbPpPUMyRQYL1MqsJzOUxjvBLtf/rz4qQ1IZfzOOCWY9fx6sSaQ2p2UFeciWFeT48vVuYRqb
 svPYqQfRynsGScg==
X-Developer-Key: i=luca@lucaweiss.eu; a=openpgp;
 fpr=BD04DA24C971B8D587B2B8D7FAF69CF6CD2D02CD
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_022057_267609_31757519 
X-CRM114-Status: UNSURE (   7.24  )
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

Document the Mediatek mt8516-syscfg.

Signed-off-by: Luca Weiss <luca@lucaweiss.eu>
---
 Documentation/devicetree/bindings/mfd/syscon.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/syscon.yaml b/Documentation/devicetree/bindings/mfd/syscon.yaml
index e57add2bacd3..a67699f1faee 100644
--- a/Documentation/devicetree/bindings/mfd/syscon.yaml
+++ b/Documentation/devicetree/bindings/mfd/syscon.yaml
@@ -91,6 +91,7 @@ select:
           - mediatek,mt8135-pctl-b-syscfg
           - mediatek,mt8173-pctl-a-syscfg
           - mediatek,mt8365-syscfg
+          - mediatek,mt8516-syscfg
           - microchip,lan966x-cpu-syscon
           - microchip,mpfs-control-scb
           - microchip,mpfs-sysreg-scb
@@ -204,6 +205,7 @@ properties:
               - mediatek,mt8173-pctl-a-syscfg
               - mediatek,mt8365-infracfg-nao
               - mediatek,mt8365-syscfg
+              - mediatek,mt8516-syscfg
               - microchip,lan966x-cpu-syscon
               - microchip,mpfs-control-scb
               - microchip,mpfs-sysreg-scb

-- 
2.52.0


