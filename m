Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C82D9EF584C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Feb 2026 18:10:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rwsnzH8jOGlUyiBNnOHeUfIy3Fa0IVng/RKkWIkfN6c=; b=mbx90GMyYpX/ggNaKMRF76fHVw
	zIHAVZx0v6cCR1zqC+fSWhMJVNRiCsDc+4NrtSgOq7a4iUax0O8E3cXrwjcP5kS/OqNDd6oXWH/fu
	O8gOe+Czg1B7limhkJjy1zgvGiwGV9eGTpj8u/ji0jumgbQrxuJqNzVVCRcX19Lzwpw6h/UogSDrI
	HtyLQG50JPRX9m+czPpCKhOtUIM0r6WkQc3DLBUNkQNGkrIQidZK4EQ3Cncj8QmheU8opTwM6LMAM
	AwovCkDVWnOeQ0AqHlAB5c5CXkSDlbXmc+XnBv+dn1Mi+0ByEF45uVAUfrMlz6Kx2EaiWUXueKHQf
	nKQuldMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrK6E-00000004pCV-0VFr;
	Sat, 14 Feb 2026 18:10:34 +0000
Received: from mail-106118.protonmail.ch ([79.135.106.118])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrK68-00000004pBr-1JeB
	for linux-arm-kernel@lists.infradead.org;
	Sat, 14 Feb 2026 18:10:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1771092624; x=1771351824;
	bh=rwsnzH8jOGlUyiBNnOHeUfIy3Fa0IVng/RKkWIkfN6c=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=Tj6+zAEZlGr5eJXYuhw8QYFrTTTtk+TizrUM0X1sSioH79T+zvkIYr39lm73vLh8p
	 F8IiLRU1SFgqXIzJzQf0G3diKLzB226f72p2POG66gqQ5i+XwubFZNHGnSCYT7eV+M
	 Ltx+FFg/7P0wFD3zsvoXVO1yMIeR0yMEYofoqtPohespQDc4FxiB3FbQYLOLcIRWam
	 6MaLgqO3ROhIVSCYkKJbvkpMb5Wmjpt6clNfAfXIAL1r4dmJl2k7ING/SgJig2PAnW
	 8zXbv0V0cTP+0LEVilcY9NFW3jhCPNE31nrRyOmHsrzmVQqGT9oA78kqoTLPAK+91n
	 lUVR/ugjDWbpw==
Date: Sat, 14 Feb 2026 18:10:16 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>
Subject: [PATCH v4 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <20260214180933.42143-2-hpausten@protonmail.com>
In-Reply-To: <20260214180933.42143-1-hpausten@protonmail.com>
References: <20260214180933.42143-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 7e6743f472392713e83bb028a7961a7e4545dc21
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260214_101029_659267_BB607ECB 
X-CRM114-Status: UNSURE (   7.21  )
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

This Xilinx clocking wizard IP core outputs this interrupt signal to
indicate when one of the four optional user clock inputs is either
stopped, overruns, underruns or glitches.

This functionality was only added from version 6.0 onwards, so restrict
it to particular compatible strings.

Signed-off-by: Harry Austen <hpausten@protonmail.com>
---
v3 -> v4: Slight rework and rebase, removing Krzysztof's R-b tag
v2 -> v3: Add Krzysztof's R-b tag
v1 -> v2: Fix binding errors by moving interrupts up front, restrict later

 .../bindings/clock/xlnx,clocking-wizard.yaml  | 24 ++++++++++++++++++-
 1 file changed, 23 insertions(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.y=
aml b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
index b497c28e8094f..7688601f1f31b 100644
--- a/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
+++ b/Documentation/devicetree/bindings/clock/xlnx,clocking-wizard.yaml
@@ -38,6 +38,14 @@ properties:
       - const: clk_in1
       - const: s_axi_aclk
=20
+  interrupts:
+    items:
+      - description: user clock monitor interrupt
+
+  interrupt-names:
+    items:
+      - const: monitor
+
   xlnx,static-config:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -66,12 +74,24 @@ required:
   - xlnx,speed-grade
   - xlnx,nr-outputs
=20
+if:
+  properties:
+    compatible:
+      enum:
+        - xlnx,clocking-wizard
+        - xlnx,clocking-wizard-v5.2
+then:
+  properties:
+    interrupts: false
+    interrupt-names: false
+
 additionalProperties: false
=20
 examples:
   - |
+    #include <dt-bindings/interrupt-controller/irq.h>
     clock-controller@b0000000  {
-        compatible =3D "xlnx,clocking-wizard";
+        compatible =3D "xlnx,clocking-wizard-v6.0";
         reg =3D <0xb0000000 0x10000>;
         #clock-cells =3D <1>;
         xlnx,static-config;
@@ -79,5 +99,7 @@ examples:
         xlnx,nr-outputs =3D <6>;
         clock-names =3D "clk_in1", "s_axi_aclk";
         clocks =3D <&clkc 15>, <&clkc 15>;
+        interrupts-extended =3D <&intc 52 IRQ_TYPE_EDGE_RISING>;
+        interrupt-names =3D "monitor";
     };
 ...
--=20
2.53.0



