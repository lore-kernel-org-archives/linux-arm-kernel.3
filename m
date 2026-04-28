Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D8FFFF885D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 07:27:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fJhktaUzc3SWAM+3dflXIbuT36VkwDCv5TtdMbNUHjU=; b=VDbo7DbD/Z9hqnXuoKvoGXMI/U
	Z87A0nSgksBajyEYLVB6VHKe4lkUGp1YS7KeStrJgUuS/FZImbx9S9dvQVDRQUq+HOwaf84PC9oaz
	gOVIj9XWzd33ttTS8sfGafpCWpLWwyEXzpborRSoRKtZhdDISzZBolS12cgUguXelytmiGOAkYQjK
	AFWpe8GyrcjENMmIglYLgsz9OWnUVfcGyCaKlSgK4pW89JoIEHulQIOpP61YCz2nZzYnEnvsOUYHf
	LUb7264M4ipl/SrMGFOfsDveZz6piwv+DHzZ+FewE5DlKzXcq0J+L+G7zlbS1XSh6zcPFlfrwAuVk
	mgb19i7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcqy-00000000llt-1oz3;
	Tue, 28 Apr 2026 07:27:32 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHcqt-00000000lj5-0ava;
	Tue, 28 Apr 2026 07:27:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DD47C43FD6;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 81356C2BCB6;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777361245;
	bh=TzpagB1WrVu5fYLHpAyf1y+q9VM2RLONipbjC/t0ve8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=DxoLDwAv+40sBf8CO5rIugNmwF8UPSAl3EglCx7pOdgUpUl25sdvmQAx1S2ftTZcN
	 S/8obsiIubVvSVq/rCGxPEhPtq5ANY+B/qhvljHkdW7LQGDmtzzvnrp26kmPwywasB
	 XMTL+rcOIr6XZpNwdIph9f5RI2eAyyUPiEpu67oD3N/VhJl5pU5CwKb3sLJIy+pqag
	 iOxMS4SZzjdRTO/GAC1lcXfRhnRA62/n8F1YzcjcorCCjE1OXESMoQsZsLpdOGx92G
	 nuR7tceeDu7pEWlvpe8AmoxaIolwxfA9mAYjHQDg7Th8fup8QAwNaFl0mVioZW5Qri
	 j2lKI+ykRk3pA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 716F4FF885A;
	Tue, 28 Apr 2026 07:27:25 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Tue, 28 Apr 2026 09:27:23 +0200
Subject: [PATCH v5 1/2] media: dt-bindings: rockchip,rk3568-mipi-csi2: add
 rk3588 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-rk3588-csi2rx-v5-1-3b7061d043ea@collabora.com>
References: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
In-Reply-To: <20260305-rk3588-csi2rx-v5-0-3b7061d043ea@collabora.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1777361244; l=1181;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=3TFnv9jZJHx3KielBqkTXBZA/OzvBwjOjzm/HycqX7Y=;
 b=LOfsEque3uFY0iPZ7ZEm7rPYYPcYNnE+Vx2+6d9h7128ksPQXRUj+QLjIX7yWCPq3qfLrG0gJ
 9iYL8AInDACCefoS9vFUprB073RWSMpEQq5ravShDKZb3PEhp5VDt3w
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260428_002727_228333_D75F8D2A 
X-CRM114-Status: GOOD (  10.15  )
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

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in the
RK3568. Introduce a list of compatible variants and add the RK3588 variant
to it.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml  | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 4ac4a3b6f406..fbcf28e9e1da 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,9 +16,14 @@ description:
 
 properties:
   compatible:
-    enum:
-      - fsl,imx93-mipi-csi2
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - enum:
+          - fsl,imx93-mipi-csi2
+          - rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



