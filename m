Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BE5C5AC82
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 12:10:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=szUxV1jRweINvndShBT2qiQrzCD1ASOYo9MGXV1YW9o=; b=yzIHEzFXe37/piiXrzVA7zs/kV
	myIXQIfYBQgehvrRnAzCBQvEip8hdcOtmFEMGqrT/Cbn4wq3y16Oqc2cywLEuX7v0GGrf/A+cHAnG
	Zf0+pQeJOAAt2nYFT1H0AIF1hf3iP5T6JiyvjZCScn8/em/dD88PaHQI0aqDX7t0PPOUdeARb2gdD
	VC8/iCGy8bVzrQyyHSGDPxZncT+JhdOb5ngTR8tyoIXGRRyBdE/TvSlJf+kwy3ViMxjhlEbOX6boZ
	AVSqrQzOPKg4SqDAdPt4UZmb/nZ9jWTWucgsYQKJeVk442exMhSB8dChYQpDEzut/SiWW9heaaJMm
	LWvIaAog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOpY-0000000Bh8o-3Tk7;
	Mon, 10 Aug 2026 12:10:12 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtOpW-0000000Bh7O-3jEs;
	Mon, 10 Aug 2026 12:10:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6403143E28;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 0AE48C2BCF4;
	Mon, 10 Aug 2026 12:10:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1786363810;
	bh=u/xE6kMTpgEqTDti8OA+5hTsroD4qAS6oCcbdy5lRqw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=CRmerNKTIVlgXXoc1sg3jZ4F3ZaSDEWR2FrzIU8dzo3Kr6IWt73er7K7CmA9piORP
	 PBWN+BKsEiiC62ARY01mxExrk/Vx2MXT5D611VvG6jU1Y6KvQ2x5/E9wGtx1bdxmBO
	 g1+jIDUlHGCMSlXfUN5xVDdd6JB/WrRNZdvJN1QXlMzk2PEXpUas5Tmmfs/I0sS40A
	 fueOf4B8B/leZKrAyYYam8fVa6VF3+VMdB9oBM3BG6gCfl2+gtsYRKni9kbub7AUfD
	 y+hcm0bZAt+lzP0qiwL4+HjHIkTiUXeFwy6d01DKVcmG8wdwROAbCk+jHa4QCqyr0G
	 me3VOAi32wb2w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEE7FC5AC82;
	Mon, 10 Aug 2026 12:10:09 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Mon, 10 Aug 2026 20:10:10 +0800
Subject: [PATCH v3 2/5] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: allow
 DSI and CSI consumers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260810-dcphy-rx-v1-v3-2-a2d25c29adfc@gmail.com>
References: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
In-Reply-To: <20260810-dcphy-rx-v1-v3-0-a2d25c29adfc@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1786363808; l=1904;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=L0YFn/UorcpfoUu13dEjPV7h6qsLNW5q4tce+B7/JmY=;
 b=2pBufMxgPOxO3btd9FczwqemLe23DIEutco22KEz5ID7y3QW4jQ/bxM0oeyYGZqlsKxMMvIKo
 dJ0U+RwUZ62C2KJvvdxYPdF18H7iJdfnViN38Rwc1YIVucNEv2800w5
X-Developer-Key: i=jason98166@gmail.com; a=ed25519;
 pk=xQmD001Q/ooHl39PxyQtusbUQmgbOsSfpFryRVWZ/k4=
X-Endpoint-Received: by B4 Relay for jason98166@gmail.com/20260721 with
 auth_id=887
X-Original-From: Jason Yang <jason98166@gmail.com>
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
Reply-To: jason98166@gmail.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Jason Yang <jason98166@gmail.com>

The Samsung MIPI D-/C-PHY block on RK3588 drives a MIPI DSI
transmitter and, on the same PHY, can receive from a MIPI CSI camera.
Describing both as independent consumers of one PHY requires the
devicetree to tell them apart.

Let the existing single cell also take PHY_TYPE_DSI or PHY_TYPE_CSI,
selecting the PHY by the protocol the consumer speaks. PHY_TYPE_DPHY
stays accepted and equivalent to PHY_TYPE_DSI so shipped device trees
remain valid, and PHY_TYPE_CPHY keeps selecting a C-PHY transmitter.
The receiver support added by this series is D-PHY only.

Signed-off-by: Jason Yang <jason98166@gmail.com>
Assisted-by: Claude:claude-fable-5
---
 .../devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml   | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..1f7c2e2ddfc1 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -22,9 +22,14 @@ properties:
   "#phy-cells":
     const: 1
     description: |
-      Argument is mode to operate in. Supported modes are:
-        - PHY_TYPE_DPHY
-        - PHY_TYPE_CPHY
+      The block contains a MIPI transmitter and a MIPI receiver, which
+      can be referenced independently. The argument selects one of
+      them:
+        - PHY_TYPE_DSI: the transmitter, for a MIPI DSI host
+        - PHY_TYPE_CSI: the receiver, for a MIPI CSI-2 host
+        - PHY_TYPE_DPHY: the transmitter in D-PHY mode; equivalent to
+          PHY_TYPE_DSI and kept for existing device trees
+        - PHY_TYPE_CPHY: the transmitter in C-PHY mode
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:

-- 
2.43.0



