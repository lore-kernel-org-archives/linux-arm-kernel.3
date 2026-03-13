Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2398D103E300
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 15:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q6kLDmixipbRPTZEMKqVu9x3tvNzWSMoXyK+NqiU0fM=; b=OMS6Ih1aQTOu+cOXY5fpD/1VlE
	i0vhC8SFVsTGmnHexctwCg0/hDAezUQ2/h96cYYkajhYqJ++7NiVCf25RLWqzLVxu/Q7/Gjag/XqB
	NeGdQ3bTcSZtv1j9WOmBZVFJstfvV+rT0F9izrfcSI5rKjEXwkkV4BmHxXd0jy3hDEDlQCAdl60Zf
	d+tZ1DPaZJTcghtAOcULVh/YmEW1ewmUBlBs6H3SID8+VE0xFahJMsxzY0TRIbNqj/15EBmY0ftey
	x0i1MnIs3Mn8J8Nx+kD9pzmSe2sWmy9pNZKq6grpI2K864EZwKD9J+EmFRoRbhpehECxvG2yKLziE
	PfaBNCOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14KC-00000000Wgv-3uwx;
	Fri, 13 Mar 2026 15:21:16 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w14Jj-00000000WS6-2Xd2;
	Fri, 13 Mar 2026 15:20:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AD2624344A;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 5FEE8C2BCB3;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773415246;
	bh=160P6WISh+Fsx9Mux8forF424XDx9Hb/XbWBrIa5OIs=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=Uf+N5EOJGPvbdBeojJq11B0LG6+BKqmmApSATXFPLfZi/dS3hexgtgE6/3xedTuh8
	 M25xX2Eu3d8wNdPzEY5DfJJ38cK0pG4IX2VaUSMr6ofEyIBsNSfZGkcEgnyk87VbOC
	 0k60OBP856DHWZY7tM0rLK9nsKauKtBrsyQH0S6bnpWNw7aQKTfV7uj0NWR2vjB0pp
	 /HoAyLKrVcCKGNDaHh6F90z7lGB52qrxI2FwFJ8zcZGYZo3lBbWDTz1LVR65aovSDK
	 R6RiwfC33oHgXao1Ti0k3wjNz4o0nFwZunfmEtx6tBvB2wUz+4SiSNO8Wx9tqER0QD
	 nk+CCW7IQJBdg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57967105F7B9;
	Fri, 13 Mar 2026 15:20:46 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Fri, 13 Mar 2026 16:20:46 +0100
Subject: [PATCH DONOTMERGE 4/9] media: dt-bindings:
 rockchip,rk3568-mipi-csi2: add rk3588 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250430-rk3588-vicap-v1-4-b3bddf749914@collabora.com>
References: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
In-Reply-To: <20250430-rk3588-vicap-v1-0-b3bddf749914@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 =?utf-8?q?=D0=9A=D1=83=D0=B7=D0=BD=D0=B5=D1=86=D0=BE=D0=B2_=D0=9C=D0=B8=D1=85=D0=B0=D0=B8=D0=BB?= <mai.kuznetsov.misha@gmail.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773415244; l=1219;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=/GzYE6Y65z4sqAFCGq0r5VgZhg70cR93RCV+j70gjCI=;
 b=9WcrQ1wEojPsvPbtv4dE9TIS+9CX/XGYXX4ZBjZ/jW2cBguysrnhpb6cYIVbg8XvxsAjjWgF+
 4KuodK+vH73AoWHDqPS+Tur1kVsxAmgsDtI0mCANxOmCnZsxF0qFFzw
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260313_082047_694029_89E5D0CA 
X-CRM114-Status: GOOD (  10.60  )
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

This patch is discussed over at
https://lore.kernel.org/all/20260305-rk3588-csi2rx-v2-0-79d01b615486@collabora.com
included here for testing purposes only.

The RK3588 MIPI CSI-2 receivers are compatible to the ones found in
the RK3568.
Introduce a list of compatible variants and add the RK3588 variant to
it.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml      | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
index 2c2bd87582eb..5e864e92f8a8 100644
--- a/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
+++ b/Documentation/devicetree/bindings/media/rockchip,rk3568-mipi-csi2.yaml
@@ -16,8 +16,12 @@ description:
 
 properties:
   compatible:
-    enum:
-      - rockchip,rk3568-mipi-csi2
+    oneOf:
+      - const: rockchip,rk3568-mipi-csi2
+      - items:
+          - enum:
+              - rockchip,rk3588-mipi-csi2
+          - const: rockchip,rk3568-mipi-csi2
 
   reg:
     maxItems: 1

-- 
2.39.5



