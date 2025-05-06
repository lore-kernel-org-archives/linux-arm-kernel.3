Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80BD8C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 May 2025 05:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=TKkIVq0b/1tTt8YAQcU0dqkKugDarEKYNFwGGMZbSJo=; b=WxJRUqmF0MPU1Z8xvjNhA76kbX
	FngOSyMuxNH0BW7pOWw2pOKfhUAmtSi6os+vLKvhhCaZju/Zs9uR3di0500rXU7I9KUQyQatMCK25
	rbu00q6UvooK/Fe/eXU5g9hI4b3zOtyEBl3dsJArN+mRowZ+mdxe/CluJxH8d+jSiSs3jilLBShVE
	4F9nOILCIdTDV21rXzwoH77vMNc4tmxJJwWJ6m991xDrxcgd+CUb0UOEf9KxaRj0WYYmbmUn5Rfn7
	IdxbVWSPbLbZ0Fs4hvCgryBSCXJt83MI/f2dpFaFXsvFoLzsbUZ4WyyOFF1o4oT4l6Z8AtbC59J43
	f5QvNUqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCAmy-0000000AQMj-1N79;
	Tue, 06 May 2025 05:24:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uC7x6-00000009j8T-0gtA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 May 2025 02:22:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B02D449DFF;
	Tue,  6 May 2025 02:22:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DB0C4CEE9;
	Tue,  6 May 2025 02:22:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746498155;
	bh=EMvHJm6AlZw7vnabYT6ymwxOGXfXeVxYv1w37tTq9J0=;
	h=From:To:Cc:Subject:Date:From;
	b=EUcpS5c6eg3gU0f+X9VzsnwVt0utXOzG5yD7Cap00EXM+Bl7sgzcXdaAxiPdtjiDJ
	 WVUfEAntQSmaylLM/ydMklMceDgX2n/kYSHdsNoNYJrkAGrlSeqpm/A5Pqgm3x2xY6
	 WA+lGR15Psucq5Ucf6MnGDUkE98Gd9rmEWqXUU+ozJ5TlKA//rPVbCYo3T0T2jVeB4
	 T1ztMsvZY5NSPWaSiRHV2lbxodLevHHZbD/G4wcSkBuK54ColdVVxVJKA+rAuaBn2G
	 LU7rlIleXIY+ru3cGZJd6cLlarT18QNina/fReoRucIXHEch0o07LSYscC4kWmE9IK
	 JrhgrsJdV2AoA==
From: "Rob Herring (Arm)" <robh@kernel.org>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Baruch Siach <baruch@tkos.co.il>
Cc: linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH] dt-bindings: timer: Convert cnxt,cx92755-timer to DT schema
Date: Mon,  5 May 2025 21:22:31 -0500
Message-ID: <20250506022232.2587186-1-robh@kernel.org>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_192236_244558_D31D1ACD 
X-CRM114-Status: GOOD (  13.69  )
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

Convert the Conexant Digicolor SoCs Timer binding to DT schema format.
It's a straight-forward conversion.

Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
---
 .../bindings/timer/cnxt,cx92755-timer.yaml    | 49 +++++++++++++++++++
 .../bindings/timer/digicolor-timer.txt        | 18 -------
 2 files changed, 49 insertions(+), 18 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/timer/digicolor-timer.txt

diff --git a/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
new file mode 100644
index 000000000000..8f1a5af32a36
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/cnxt,cx92755-timer.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/cnxt,cx92755-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Conexant Digicolor SoCs Timer Controller
+
+maintainers:
+  - Baruch Siach <baruch@tkos.co.il>
+
+properties:
+  compatible:
+    const: cnxt,cx92755-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Contains 8 interrupts, one for each timer
+    items:
+      - description: interrupt for timer 0
+      - description: interrupt for timer 1
+      - description: interrupt for timer 2
+      - description: interrupt for timer 3
+      - description: interrupt for timer 4
+      - description: interrupt for timer 5
+      - description: interrupt for timer 6
+      - description: interrupt for timer 7
+
+  clocks:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - clocks
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@f0000fc0 {
+      compatible = "cnxt,cx92755-timer";
+      reg = <0xf0000fc0 0x40>;
+      interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
+      clocks = <&main_clk>;
+    };
diff --git a/Documentation/devicetree/bindings/timer/digicolor-timer.txt b/Documentation/devicetree/bindings/timer/digicolor-timer.txt
deleted file mode 100644
index d1b659bbc29f..000000000000
--- a/Documentation/devicetree/bindings/timer/digicolor-timer.txt
+++ /dev/null
@@ -1,18 +0,0 @@
-Conexant Digicolor SoCs Timer Controller
-
-Required properties:
-
-- compatible : should be "cnxt,cx92755-timer"
-- reg : Specifies base physical address and size of the "Agent Communication"
-  timer registers
-- interrupts : Contains 8 interrupts, one for each timer
-- clocks: phandle to the main clock
-
-Example:
-
-	timer@f0000fc0 {
-		compatible = "cnxt,cx92755-timer";
-		reg = <0xf0000fc0 0x40>;
-		interrupts = <19>, <31>, <34>, <35>, <52>, <53>, <54>, <55>;
-		clocks = <&main_clk>;
-	};
-- 
2.47.2


