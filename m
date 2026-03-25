Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42B8CFEA824
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Mar 2026 10:25:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fnsD/p0+GwUsorVEgUyzZsm/hEq4BajUaOKQ/Hx5slU=; b=ApejZF6lDQ2x71sk+1nA9CPviC
	fsTcZRPIF02tYKgYN0wTSJle2NYFUsJ6bduGCcH73RCnBGkvl9S2EgIlchZBrYdjTlwChaHXrbvz6
	w0ZkWZxU9rFdvaJHevFLlQoekvIv6nT42zXaonTj50FDK09t65agzXocLgaAa3Bxfdmvw6EbGAVmo
	FXS0i8aH1aolV2/P0d8Q/6VNPZ6HVOMhHhdGWP9QqXJwxwFfS0fvixQjXNx+P8siFSTVGMB/mrul+
	6CaWK3BNWwCPJBMCGVOt1SAedMbgt/Oon7apJBwyrZA9uA7YSbaQE8mnC8HiIRncqg7wEpGy+0kCd
	f+BT48AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LQg-00000003907-2oxW;
	Wed, 25 Mar 2026 10:25:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5LQe-000000038ym-25S5;
	Wed, 25 Mar 2026 10:25:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D749141B39;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id A9BF0C2BC9E;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774434335;
	bh=0A+FO9I7wqWwUKymAMAGNR/lvQFbkwTdv/HUEYMMEm0=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=BiWuMChIMPl4158xNK3qhrBvdz3GDzOiualP1tZWZn3JO3J/10v4du0ZCBTlZHgzY
	 AtqrTmd9gnSxtdS4b0x4cgYeAmE1nrCJgT0zsqVNXg+0E59apnHQtls59ziqJEGvgG
	 I4qzO5bDSvUJ6pnfUlcBaarajcP4oarPfaUMdFKDNIrVdPNaV4xVn5s6a48N9tu/Sl
	 lOS6CZ+ub3XD+xNv2gvaPrFE+lVCWkazXGY+BdOh4QmCAWGxROUD9rC7fcc+oHaIor
	 xfLdHJYYxwNKHEscl9f3WQ/FuE6QuJdil6dr/vrsvNDYP/R6oXIuY31v0UngMZ6ruD
	 WL2LF39hYBR1Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 99CF2FEA83B;
	Wed, 25 Mar 2026 10:25:35 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 25 Mar 2026 11:25:34 +0100
Subject: [PATCH v3 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v3-1-754473981f39@collabora.com>
References: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v3-0-754473981f39@collabora.com>
To: Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Frank Li <Frank.li@nxp.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Collabora Kernel Team <kernel@collabora.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1774434334; l=1172;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=owyE6wPADpqjuuesWZuMBWZ6EdPbmZuvga8S3U6flcM=;
 b=vJ7Fc1HpYevNzycH9GPwR2MEat6rddJFIgnGVIbLdAj0wy70xJFjCv/94lQ+E3/1r18HOl2o5
 GxIb0ohLW22C1BGoOMjeQ3ooDOv2wZ6VpNMUkuHoFsYYIePiWgB6LLK
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260325_032536_583430_93B2D32E 
X-CRM114-Status: GOOD (  10.46  )
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
Reply-To: michael.riesch@collabora.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Michael Riesch <michael.riesch@collabora.com>

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
the RK3568.
Introduce a list of compatible variants and add the RK3588 variant to
it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml   | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..3d3b3cd78884 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,9 +16,13 @@ description:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx93-mipi-csi2
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - const: fsl,imx93-mipi-csi2
+      - const: rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



