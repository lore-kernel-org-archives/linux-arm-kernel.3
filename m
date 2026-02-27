Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 624CBFEFB70
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 18:16:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:From:
	To:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GYNWoyNeM61dMX+Jlp03IYq35smbPMrmiwnNODDRNgM=; b=z1jIcSl+JPmOl0YMBDC7AFAcfY
	IFY/tGfPAE+easPowaZ6k+4YtrcauOb3I0PZ2qdDUE1+qLxgfDvIOtMuHI6Kv9o4evdydzGys098q
	OhXo/TewX9R4eOvNw7sNel7RYAfvischSqwwUA6TwhPBlkJF1Z19pueydRYHOyAsV+DUy2TKO43G4
	GTu8Iiro5ZFBtoQ9yjo8MReFX3zj0Z7gkVRh1iqo9G0bkC1M2D7XJGLgwnTwKlj8wFHrcSGvuIrog
	93XpqN4RYPhh4fiVKPSjJFEbO8ysX/KnmiFIAQ9FqdOPEWxNSDzDJWYrFft9UZsLQUrUCFC2Xy28b
	2HHC6lJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2Nb-00000008uDn-3RAu;
	Fri, 27 Feb 2026 18:15:59 +0000
Received: from mail-43100.protonmail.ch ([185.70.43.100])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vw2NX-00000008uCC-3mFA
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 18:15:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1772216153; x=1772475353;
	bh=GYNWoyNeM61dMX+Jlp03IYq35smbPMrmiwnNODDRNgM=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=iRCns1pQxEIUw84b42Lohz//YaJ7C7QUqmTO7tGYWh/R5j5jRnFY3yzJdrB1eDl04
	 Zyuan9c7BCA1gIT4O4YZHQwONNiG8ImT5F+Opay0qTjgqrfFZvanelEkjQrdpKAXZP
	 m6XcslYnv28U7bDHX3eCtci53PF8B3siLdNBvqCBXLT0CtpSWzSIkJbQ1GWQ8lrSQC
	 zRT5V2YRBrtnKPLIR2z5p7WYyFCZDGXjXUI2RE5ntoJ0326oqGnp57gMxsz62nqFkD
	 bN9ymR5kZHgmF9BIZPPrRH5EIsCo1NUgkTM/RHWpAcSU4NAjsjoNr0kyllPRxXEdlk
	 Me3YW6YQblRXw==
Date: Fri, 27 Feb 2026 18:15:49 +0000
To: Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Michal Simek <michal.simek@amd.com>
From: Harry Austen <hpausten@protonmail.com>
Cc: Shubhrajyoti Datta <shubhrajyoti.datta@amd.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Harry Austen <hpausten@protonmail.com>, Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v5 1/2] dt-bindings: clock: xilinx: add description of user monitor interrupt
Message-ID: <20260227181507.19890-2-hpausten@protonmail.com>
In-Reply-To: <20260227181507.19890-1-hpausten@protonmail.com>
References: <20260227181507.19890-1-hpausten@protonmail.com>
Feedback-ID: 53116287:user:proton
X-Pm-Message-ID: 4b6ac4651e9d8cd4d080f05b8b64032d3422bbe5
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_101556_191715_95EF4503 
X-CRM114-Status: UNSURE (   7.10  )
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
v4 -> v5: Add Krzysztof's R-b tag
v3 -> v4: Remove allOf and rebase, removing Krzysztof's R-b tag
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



