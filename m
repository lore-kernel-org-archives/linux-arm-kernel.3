Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8AF9C5B56C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 15:22:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HD1FDR7FrwkefFaAeKqG8Z79NYbBvICmEPDGXWLkPVs=; b=lb3/3pl378pH8cz8s5p6BStgmc
	VogLhHxPs2rSiXEq5gkxQW4NFCW7x2OjKQR0yppE8Gm+AvZzGJxnmZQHiy2Kcr/RwUiUD/cVlwFaQ
	ohSuNv6KQ+J1xW7UZM/sSYvpYd6PrFMJhDtB2twmAxZK5E4fmySLioIuD+j/hpAWnnMlOH5tQuxit
	f8zKbxQZ3Li7ekUIrjo4sp2MssyYiRyCEUSuccntazxjZZ6mekGRLJc+GaLfHKiUQ6ZTjSC8f+duo
	Otz5UxFHul6skotr90LX9im7GD9jKJlix8KRy15qTqbVolsDnTJwFqWKNar1z4M7tzmHovMt7WRSK
	wS+4aMrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRpB-0000000CD3j-1WGn;
	Mon, 10 Aug 2026 15:22:01 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtRp2-0000000CCy5-3EXT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 15:21:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 10F9160A61;
	Mon, 10 Aug 2026 15:21:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id ADCF4C2BCF7;
	Mon, 10 Aug 2026 15:21:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786375311;
	bh=NnOq+xRUSpOQqEwshprztuziPWpVBsyCAlS5zdxPx2U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=MX/rg2eeG0tiyl/TetG/EE/gFCNJ4H/7xSRCHsdyYHwjoTmveLyJK0AhcMyZHCR1m
	 7RRpX42OtCU7sYtpfUvHrJJSF4PvoMBY41d2abxbrsQgq4pma1mahOOA2SmwH0Q/Wn
	 ZV5UTAxIkVRoLXGGhd49g31JfyMjaSwnebGWKPCH2e0UXyFuk/icukb81+en+SEyDn
	 /fjc99Pc94DWEBG/bAC3yp9JTdOSYoVl5txyQlulCrn++4cdfOE9rVQZLRGVoHho81
	 jftYZJmqdzchnjE/IELfRniX4OCECefQKpgcx1Fk3I7Q8isQsrmrw07XzewcOXtpeB
	 l3ThcbPVcTNig==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 89A7BC5AD7B;
	Mon, 10 Aug 2026 15:21:51 +0000 (UTC)
From: David Heidelberg via B4 Relay <devnull+david.ixit.cz@kernel.org>
Date: Mon, 10 Aug 2026 17:21:40 +0200
Subject: [PATCH v5 1/3] dt-bindings: input: touchscreen: st,stmfts:
 Introduce STM FTS5
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-stmfts5-v5-1-0c737d929976@ixit.cz>
References: <20260810-stmfts5-v5-0-0c737d929976@ixit.cz>
In-Reply-To: <20260810-stmfts5-v5-0-0c737d929976@ixit.cz>
To: Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: Petr Hodina <petr.hodina@protonmail.com>, linux-input@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Krzysztof Kozlowski <krzk@kernel.org>, devicetree@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, phone-devel@vger.kernel.org, 
 David Heidelberg <david@ixit.cz>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2705; i=david@ixit.cz;
 h=from:subject:message-id;
 bh=pbzOh5CHeD/4F3W1fha7bB0ZUX+yDlqPPUvexzr6fCU=;
 b=kA0DAAgBYAI/xNNJIHIByyZiAGp57I3IP2mpY8lVDjCIfw+g6pZDCkiOc2JP5CjvTBtEUIwj8
 okCMwQAAQgAHRYhBNd6Cc/u3Cu9U6cEdGACP8TTSSByBQJqeeyNAAoJEGACP8TTSSBymZ4QALzQ
 6biV6SFE0Y4otRuVQug8WueL8v9Ox9H1fJqU8WuzkKAA91X5Geb6GXas3RSrmth9VfXuI1Ack4b
 OKS77UpArwpgW+iBfV1xKLUpg9b4q/karlAfQW57PN8DttKwedCPkx1K4VlXzyOcB0j/4abIj2w
 ivkigPhaVFNdyzygA6TFXChhGmHfzKlRKzjV3zcrqj/QHcu+UyeuAzDCDHo2MeMSal/bgeJLbZv
 HYO0jvmfO1gh5hCKhmP27BI9U9YetN5+/xKE/AM+JZC5JYVOoTFBU9cPes82J2mYHNctxwowFTe
 IUZlRaItwOpQkh0m1irpHMinAupdPHwq8Zge9V5PfxjsHtpuoYdctPg//yIrKKKPGFWiKKjvhw5
 Nk3nK7bqOFktWgj5RFOeKNRpnlcVJFRDgIFkOIekKqyhMvL5wYut3Af/4Qmjp2HDwa8HtX6Uu5t
 EnycZcKII5oQwNcp4hJ6avm/ijSqiZK6vWH7LY6WunOC2xkXus9gqIzEHVCmqb1Rm3F3N4pBLSu
 ZH4BGTMjMthvvhhOn3tdbzeJvbVlAFY9q0QDRMXTPE6Sr/QeXdlPwLOnM3M+E353l5jAiNbIkXE
 ErP48hU9cMUo2g+WxMNvZQH3MMVtGALfKZq9Dv2dP2B7Nh2VkSsKLrmVIuKof89oQ2XycTxUf0p
 MkiAv
X-Developer-Key: i=david@ixit.cz; a=openpgp;
 fpr=D77A09CFEEDC2BBD53A7047460023FC4D3492072
X-Endpoint-Received: by B4 Relay for david@ixit.cz/default with auth_id=355
X-Original-From: David Heidelberg <david@ixit.cz>
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
Reply-To: david@ixit.cz
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: David Heidelberg <david@ixit.cz>

Introduce more recent STM FTS5 touchscreen support.

Signed-off-by: David Heidelberg <david@ixit.cz>
---
 .../bindings/input/touchscreen/st,stmfts.yaml      | 29 ++++++++++++++++------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
index 64c4f24ea3dd0..3de4bc5cd3f78 100644
--- a/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
+++ b/Documentation/devicetree/bindings/input/touchscreen/st,stmfts.yaml
@@ -9,22 +9,21 @@ title: ST-Microelectronics FingerTip touchscreen controller
 maintainers:
   - Krzysztof Kozlowski <krzk@kernel.org>
 
 description:
   The ST-Microelectronics FingerTip device provides a basic touchscreen
   functionality. Along with it the user can enable the touchkey which can work
   as a basic HOME and BACK key for phones.
 
-allOf:
-  - $ref: touchscreen.yaml#
-
 properties:
   compatible:
-    const: st,stmfts
+    enum:
+      - st,stmfts
+      - st,stmfts5
 
   reg:
     maxItems: 1
 
   avdd-supply:
     description: Analogic power supply
 
   interrupts:
@@ -35,42 +34,56 @@ properties:
 
   touch-key-connected:
     type: boolean
     description: The touchkey feature is connected
 
   vdd-supply:
     description: Power supply
 
+  mode-switch-gpios:
+    description: Optional switch between touchscreen SLPI and AP mode.
+    maxItems: 1
+
   reset-gpios:
     description: Reset GPIO (active-low)
     maxItems: 1
 
 required:
   - compatible
   - reg
   - avdd-supply
   - interrupts
   - vdd-supply
 
+allOf:
+  - $ref: touchscreen.yaml#
+  - if:
+      not:
+        properties:
+          compatible:
+            const: st,stmfts5
+    then:
+      properties:
+        mode-switch-gpios: false
+
 unevaluatedProperties: false
 
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
 
     i2c {
         #address-cells = <1>;
         #size-cells = <0>;
 
         touchscreen@49 {
             compatible = "st,stmfts";
             reg = <0x49>;
-            interrupt-parent = <&gpa1>;
-            interrupts = <1 IRQ_TYPE_LEVEL_LOW>;
-            touchscreen-size-x = <1599>;
-            touchscreen-size-y = <2559>;
+            interrupts-extended = <&gpa1 1 IRQ_TYPE_LEVEL_LOW>;
+            touchscreen-size-x = <1600>;
+            touchscreen-size-y = <2560>;
             touch-key-connected;
             avdd-supply = <&ldo30_reg>;
             vdd-supply = <&ldo31_reg>;
             ledvdd-supply = <&ldo33_reg>;
         };
     };

-- 
2.55.0



