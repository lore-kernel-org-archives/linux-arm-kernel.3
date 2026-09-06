Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B915C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Sep 2026 16:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vGxSB4uIRo901iV2Ue3ZSTjqSGcYIZAfcN+sTvDiZmQ=; b=NNKiYA3gBm8Pt0usIjDCFU15xI
	Jsb/8gxM2Z949ZkYZbxFy9ArSdWYdIqNCUbXVV+2mBxVNgfy7Ek2vrLH8Xw71th4WfE1hQUKr8zsO
	fETkesG6nbF1vPQFzyOOo7/cnudBK58aTtSBBmeMsvDCIsOmf3E1A6vuq5rlu5XLelLVc/ihZGnxl
	JbvIcFfEQ+47tRrk1x3CwTtrDuVsDLvJ9hvYeIg24Bp5ivwN5wV/G9Jic6kqmiAE/OtVUkiY5Rr00
	issU6lv4OlzUhzg5AlYsdvZCTRv3z/2Ccsuiwqy9Lpi9Ci/shA8wEPittXq3sCZCTepLKSmvCm7a1
	oq8AGKWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FNb-00000005AI5-0W51;
	Sun, 06 Sep 2026 16:06:03 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3FNZ-00000005AHl-0vId
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Sep 2026 16:06:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6FCC043C59;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0CA39C2BCF5;
	Sun,  6 Sep 2026 16:06:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1788710760;
	bh=Q/g45COEM8Wm11Scr+Scf3fRTTgH3HBagUeaOFrwkL4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=VG51rxJHOxalx7mGLKpPzvFfi6vXUWx9trBvM4afymB1X+IE6I9pFWQ7aWMzreq3L
	 z4LruBup/CNEFNdMJoUpgPuAK3dw5eCQKQq6XXIvFODxbK4KtxveZHCxjqCW+51qN0
	 UprVerPiflp4NJ1t0LdjXi8dBAe4T6D4sDXF/dPgXkmPckoMtC0eICBOe71uMTZK8Q
	 oPVNZOyOEWY5s3ZCT4IO3ajz9X7O2B02jTXZyp2tts/3eTaBCfAxQs0Fz009FxEQTv
	 VkpglMrE+8u3AmHzhx2XEJ+skSWIumkFYvoM85UbfUgCRVZ8ouXROnTqMU6dVrmBvq
	 8b0o0YFG2G+BQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0210C79F85;
	Sun,  6 Sep 2026 16:05:59 +0000 (UTC)
From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado_via_B4_Relay?= <devnull+jcarlosgl96.proton.me@kernel.org>
Date: Sun, 06 Sep 2026 16:05:49 +0000
Subject: [PATCH 1/2] dt-bindings: arm: sunxi: Add SPC Glee 10.1 A64
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20260906-b4-spc-glee-a64-v1-v1-1-621df2155e31@proton.me>
References: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
In-Reply-To: <20260906-b4-spc-glee-a64-v1-v1-0-621df2155e31@proton.me>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1788710758; l=1596;
 i=jcarlosgl96@proton.me; s=20260906; h=from:subject:message-id;
 bh=2sTHkEIZ9R2X36In5QhZ4ozs/BXQZzuqStbGUoIn0/8=;
 b=PawChL5wDUDLG0nHuI8bLkcI2Gg3HO3qY1ESyyPWDgu6r45I1S1MpUoJUa6l9YXdauMIgVMc7
 X1s/4Mi5jOoAwlVfDq1T1ChCyDXymDo/1kiBnR7NAZ86NrBE3zXxddB
X-Developer-Key: i=jcarlosgl96@proton.me; a=ed25519;
 pk=2/GzZfrbHAiuUrsA5A4A9ixfHKnypfDfzyE+fToY4Io=
X-Endpoint-Received: by B4 Relay for jcarlosgl96@proton.me/20260906 with
 auth_id=1008
X-Original-From: =?utf-8?q?Juan_Carlos_Guti=C3=A9rrez_Lavado?= <jcarlosgl96@proton.me>
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
Reply-To: jcarlosgl96@proton.me
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>

Add the Smart Products Connection vendor prefix and the board
compatible for the SPC Glee 10.1 tablet based on the Allwinner A64.

Signed-off-by: Juan Carlos Gutiérrez Lavado <jcarlosgl96@proton.me>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml       | 5 +++++
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 2 files changed, 7 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index f04db28c6..ce425938c 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -902,6 +902,11 @@ properties:
           - const: allwinner,suniv-f1c200s
           - const: allwinner,suniv-f1c100s
 
+      - description: SPC Glee 10.1 A64 tablet
+        items:
+          - const: spc,glee-10-1-a64
+          - const: allwinner,sun50i-a64
+
       - description: SL631 Action Camera with IMX179
         items:
           - const: allwinner,sl631-imx179
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969..ff462d6f0 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1603,6 +1603,8 @@ patternProperties:
     description: Spansion Inc.
   "^sparkfun,.*":
     description: SparkFun Electronics
+  "^spc,.*":
+    description: Smart Products Connection S.A.
   "^spinalhdl,.*":
     description: SpinalHDL
   "^sprd,.*":

-- 
2.55.0



