Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9216CD98C5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Jun 2026 09:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kLGj5B/TOcV+vR2/QJsvRdnlMsXkBK9C6ZQM0/uB0FE=; b=X7WYNito0OheujW0xXriJfJWP9
	NGXVI8s4dp3wPoHOu8cRrZLg8+Srr7ac6/9Xm/uPGAchOswc6EqTAAGtAVcT5FWtyAEZhinUTTt7/
	0UxsIRFmQdGYrVGR1wRNyfHOK3zlMHfVBa6jLlYZRynaQSENK4Rh49z3CQAgNStL6zfxaFR5/ALPu
	nGf4y3rXxcTQpq13T4oRnK3RV5+SBIuv8VPEedata7w1CWO40hGfBFG5nqSAFXq9BxK0USxIQfxyX
	k1NyX/d0B/0RMe6YnbHfRKRR4KUP8hPuent5vYAQwyW54DjKL6kgVujUfKTA7BAJcg563mAJt7IpN
	SPG6TTuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKsY-0000000C8Q9-3MeR;
	Sat, 13 Jun 2026 09:42:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wYKsX-0000000C8PO-3Jzj
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Jun 2026 09:42:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8CB1E444DB;
	Sat, 13 Jun 2026 09:42:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 574B5C2BCB7;
	Sat, 13 Jun 2026 09:42:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1781343733;
	bh=hP2JkIrZctPbTnRpe+Zy7+t9wd8M+gb11xmJHpExrYE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=aw6+l6FppVdYNcjSfW/E4tviNWPc6zVdUKDNs2KfRPTmoiEvr00UsbgRj9V6V+aut
	 4w1CJR0+Va00Y+htR+5bQ1pBuh60tO6FP1yCSrujO2Dyo42V4OR6PK3NnzslAFc9gO
	 Y9rXFOi4bO5vemqWHP8aDmFgrUbbK2Zt3EJVyc6+2Q5VMVvL2ZrE0Q2lKGL69W/rs7
	 C2eT34pJ0VIsQPXhqxrx/HAdkY85m3ynm2TXRFVms2OmutLv9GsrRHiSbsvLzwz8Cv
	 kV/x3uJM/yK7ILUEvlM+sv+3yIAO8/oUgor6SYQ0ERpRT56+gSs0uzBAzs4T1Nrk59
	 t+cpvoUSYlQbA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44216CD8CA8;
	Sat, 13 Jun 2026 09:42:13 +0000 (UTC)
From: Enzo Adriano via B4 Relay <devnull+enzo.adriano.code.gmail.com@kernel.org>
Date: Sat, 13 Jun 2026 05:42:13 -0400
Subject: [PATCH 1/4] dt-bindings: arm: sunxi: add Radxa Cubie A7S
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260613-a733-dts-v1-public-ready-v1-1-7787c94681db@gmail.com>
References: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
In-Reply-To: <20260613-a733-dts-v1-public-ready-v1-0-7787c94681db@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>, 
 Ulf Hansson <ulfh@kernel.org>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
 linux-mmc@vger.kernel.org, Enzo Adriano <enzo.adriano.code@gmail.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1781343732; l=870;
 i=enzo.adriano.code@gmail.com; s=a733-cubie-a7s;
 h=from:subject:message-id;
 bh=i6WAYnG2+hwZK3Eb/pK94tZG5A16TibjSeWXfvrfG5Q=;
 b=5BARvAPMpbKPU18jBrRxIKm7WodlM6Gk6MSwlfRJ27A2ff7vIgRd1LEXPKA4Y2YrCF8MS/5C9
 EJzXnC/1/kBBJVnh2a/D4waItyqVfHitw2Wm55132Zfn98+LESXjRpj
X-Developer-Key: i=enzo.adriano.code@gmail.com; a=ed25519;
 pk=5S3Wmdqa4XfCdeZF/HfeYqnQF8GN9JGt3SE1cxqSX8E=
X-Endpoint-Received: by B4 Relay for
 enzo.adriano.code@gmail.com/a733-cubie-a7s with auth_id=820
X-Original-From: Enzo Adriano <enzo.adriano.code@gmail.com>
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
Reply-To: enzo.adriano.code@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Enzo Adriano <enzo.adriano.code@gmail.com>

Document the Radxa Cubie A7S board compatible for the Allwinner A733 SoC.

Signed-off-by: Enzo Adriano <enzo.adriano.code@gmail.com>
---
 Documentation/devicetree/bindings/arm/sunxi.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/sunxi.yaml b/Documentation/devicetree/bindings/arm/sunxi.yaml
index e6443c266fa1..9f603681c78e 100644
--- a/Documentation/devicetree/bindings/arm/sunxi.yaml
+++ b/Documentation/devicetree/bindings/arm/sunxi.yaml
@@ -850,6 +850,11 @@ properties:
           - const: radxa,cubie-a5e
           - const: allwinner,sun55i-a527
 
+      - description: Radxa Cubie A7S
+        items:
+          - const: radxa,cubie-a7s
+          - const: allwinner,sun60i-a733
+
       - description: Remix Mini PC
         items:
           - const: jide,remix-mini-pc

-- 
2.53.0



