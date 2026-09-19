Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E058C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 19 Sep 2026 19:44:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/HlBpXCv8M0uwIibFiKeKZGWRn4rgDPA2sB0MAse190=; b=mkNAYxeGfGzJb59C1CnQ8rJYue
	m/yBMszYLqE1qJq3nxPSwu53UXod3W2u8L35ypVwyzVgC6fQTiYVwQWwkqfXvLo49KBdpj+9Vnf0/
	dj+ovZWV2tv/OuqhGK9xXKB0X6jl1vlFzFgVMsoPKgydXYpXT+oEegHdjMmz84coYc9T/Y0iGeQQj
	zTdS6oHxbkroWbflYegY9D6BDhbO8eQje1onfAi4MH43U/B4UIA+5ragCcCpc6eS1JxciLN5QF+wk
	XULhjQmp5ERktvieh0xznStmrt1W8fude9r4Fj0rQmPrJ8PvBv/HZKYN5IVTW2XNXofh1SJn5P2w0
	12qFgkcg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000Gbbq-3Z6N;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x80yy-0000000GbbL-05vZ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 19 Sep 2026 19:44:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5430560AA7;
	Sat, 19 Sep 2026 19:44:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id BDD17C2BCF7;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1789847058;
	bh=hdT+L3Aro+iyRTysKZmeSdAuyXa1BuaAuONMoFRlMqE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=mX52mtlVM7ixtOXQ/RkMcfxTI0Yk2HwZqMg/KRn15jrL7OKIwtNuKV4jEQ3enOXDh
	 5dQzGsRsP5VIYhi1VyFNRyu5Z7GlxMd16nxqXY/tjl0xDiDpHGONh+XpGSIXuxObJ+
	 G1josAgbfQMFCZ0ZfZJmfzom4smFznYADy8sw9qrDWQG3V/1agtoyHxeStnNxA+7P2
	 /+CEWX3Ownbkb89XEbd/68y5gQULHBjB+vyDPTsAdjL4K3R2sAPTwVXPpGeleEDQky
	 7PZdZ5BNOqa8UdBlm6Wc+4w7F7ixm8GlndYkd4eis8x1hbRKvlxEYVrPUt1y8b080A
	 RnoClnY1dEFEg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9C89AC982DF;
	Sat, 19 Sep 2026 19:44:18 +0000 (UTC)
From: Nicolo Giuliani via B4 Relay <devnull+nicolo.giuliani6.studio.unibo.it@kernel.org>
Date: Sat, 19 Sep 2026 21:44:18 +0200
Subject: [PATCH 2/3] dt-bindings: arm: marvell: Add Sophos XGS 107w NPU
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260919-send-dt-v1-2-365615a74ef3@studio.unibo.it>
References: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
In-Reply-To: <20260919-send-dt-v1-0-365615a74ef3@studio.unibo.it>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Andrew Lunn <andrew@lunn.ch>, 
 Gregory Clement <gregory.clement@bootlin.com>, 
 Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, 
 Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1789847056; l=1405;
 i=nicolo.giuliani6@studio.unibo.it; s=20260919; h=from:subject:message-id;
 bh=y6YYIBXvEGJH8GoEFsgQ5cuo4swCennTIRdUH242hhU=;
 b=GQWGJk6JAc+bnFpLomU6YmOR4xCP05ObW/ztx++Epil5oUxUZYiCJVhDkAp3xu229+AffPwlP
 5HCFyvyFB+2Cnb+6gTaeNXUoLJlWmfQ7EDjRBkCRgnG5pdhRqI3zIBD
X-Developer-Key: i=nicolo.giuliani6@studio.unibo.it; a=ed25519;
 pk=D652ecdT01GkA1eoFWNFNX85xIg5ZnFwUWyjfestgQw=
X-Endpoint-Received: by B4 Relay for
 nicolo.giuliani6@studio.unibo.it/20260919 with auth_id=1040
X-Original-From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
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
Reply-To: nicolo.giuliani6@studio.unibo.it
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>

The Sophos XGS 87/107 desktop firewalls combine an AMD x86 host with a
separate network processing unit (NPU). The NPU is a Marvell Armada CN9130
SoC with its own eMMC and SPI NOR flash, connected to the x86 host over
PCIe. It serves the front panel ports through a Marvell 88E6193X switch.

Document the compatible string of the NPU board, with the CN9130 SoC
compatibles as fallbacks.

Assisted-by: LLM
Signed-off-by: Nicolo Giuliani <nicolo.giuliani6@studio.unibo.it>
---
 Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
index 7e77310da6..2e114139f1 100644
--- a/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
+++ b/Documentation/devicetree/bindings/arm/marvell/armada-7k-8k.yaml
@@ -136,4 +136,13 @@ properties:
           - const: solidrun,cn9132-sr-cex7
           - const: marvell,cn9130
 
+      - description:
+          Sophos XGS 87/107 network processing unit (Armada CN9130 SoC
+          with an 88E6193X switch)
+        items:
+          - const: sophos,xgs107w-npu
+          - const: marvell,cn9130
+          - const: marvell,armada-ap807-quad
+          - const: marvell,armada-ap807
+
 additionalProperties: true

-- 
2.48.1



