Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7F70FF588F7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 16:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:To:From:Date:Reply-To:Cc:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=e/Du74EJttRYzocAt0aYwsBrBN+xYnBNbkIiSv+PCto=; b=N8tsxzIyEDXttdfHKI7+bzHhn2
	pjR55xpX8+/vYlCc6W4Xd83IUYbAYGs0/S20Y2/amcZFm1XNCZtBvn96T5mYarhuKnaF2AFo/tqEf
	KVUp1AmRr35ehY1qsMq6HeP6wCNxuNwWq2t9RFibGzHADLrTaTjGvibKWCxD03TEtx+X48Rr/fpCF
	LVeleWPO6WAV8ETBCNI0IKTUZWEw/b7ShPiYEHCD+tM82rp+MfuH4kRAx3gJka4hWtltFkOl97Jdu
	EINvmEawVn9jq1gYNGyta8CdRTh8E0wFwMwiv2Bw5Mq2Rf4HRplG4Z5IkcIQsm5qhnHmhQnaAqFfR
	+1clvfYw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEraR-00000007RHd-3Bgp;
	Mon, 20 Apr 2026 16:35:03 +0000
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEraP-00000007RGl-3X3r;
	Mon, 20 Apr 2026 16:35:03 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.99)
	(envelope-from <daniel@makrotopia.org>)
	id 1wEraC-000000001Bl-1o7A;
	Mon, 20 Apr 2026 16:34:48 +0000
Date: Mon, 20 Apr 2026 17:34:45 +0100
From: Daniel Golle <daniel@makrotopia.org>
To: Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Daniel Golle <daniel@makrotopia.org>, linux-crypto@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [PATCH v4 1/3] dt-bindings: rng: mtk-rng: fix style problems in
 example
Message-ID: <912fe579eccf577f3064b69d6c945e2c9087cab8.1776702734.git.daniel@makrotopia.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_093501_886671_B9AB29F8 
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

Use 4 spaces for each level indentation, remove unused label, and add
missing empty line between header include and body.

Signed-off-by: Daniel Golle <daniel@makrotopia.org>
---
v4: new patch

 Documentation/devicetree/bindings/rng/mtk-rng.yaml | 11 ++++++-----
 1 file changed, 6 insertions(+), 5 deletions(-)

diff --git a/Documentation/devicetree/bindings/rng/mtk-rng.yaml b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
index 7e8dc62e5d3a6..8f2f4c32a0cfc 100644
--- a/Documentation/devicetree/bindings/rng/mtk-rng.yaml
+++ b/Documentation/devicetree/bindings/rng/mtk-rng.yaml
@@ -47,9 +47,10 @@ additionalProperties: false
 examples:
   - |
     #include <dt-bindings/clock/mt2701-clk.h>
-    rng: rng@1020f000 {
-            compatible = "mediatek,mt7623-rng";
-            reg = <0x1020f000 0x1000>;
-            clocks = <&infracfg CLK_INFRA_TRNG>;
-            clock-names = "rng";
+
+    rng@1020f000 {
+        compatible = "mediatek,mt7623-rng";
+        reg = <0x1020f000 0x1000>;
+        clocks = <&infracfg CLK_INFRA_TRNG>;
+        clock-names = "rng";
     };
-- 
2.53.0

