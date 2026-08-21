Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40768C5DF7D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Aug 2026 12:02:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+agO6TdvOz2SybIn1p2t9uIRwAX0ziNv9FGKQr32CKw=; b=ouYdkZh9B7x/OVXuCcBH+gtWse
	e15u0Blky1pLy3JdHf2DuxHNRGfuWnihjmuEEsaE6dT5uCoNQrPAiu+v65PDANI+k/aFNloeNrmIJ
	EurOpFUu/EYEVd3H8FplQaddPP26JT+x1ATbZYKVzc2XbtYEHpWK/3RWS+qgmsi7sJWcTZudvTyFZ
	AIHDv9cJvgH4cV6OE4wtG7GY9GrGkJFpv8b6XKIkMYQXTZJoukyVLEkMRZS06cw7cqoiaXFctCGr7
	X/WVPvLGiQuZwwbueP3z+//1mg+k9jxZbn5fSWScQ3GIyon0KLOgERhdztiVnrMHOo0atSUb5ay5o
	oWl7l/vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxF-0000000DFxa-2ytV;
	Fri, 21 Aug 2026 12:02:37 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wxNxE-0000000DFvr-03WH;
	Fri, 21 Aug 2026 12:02:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 95EB944006;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6F9A6C2BCB3;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1787313755;
	bh=7wJCJfN4pMWX9++KJykYlazzN3vmq3alpryAcGcQgv8=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=r6F2DXKVZHScJMmdTC3oEPfRertr+qgZlEzikRXkEDoIomjcbKPvasQjziwl+tGBQ
	 Mlz151reb0G3CdzxYBgccWYDGv/9WpnSAsWWHYkVK9mnMsROC4ukTPfz0H3FoCwb6f
	 2r7bNf9Hmhbju7PxJlpDKUuWQwKemNTFSdmfWvC8wRD/K3W/C6Mkd0o0U+FchTYL1y
	 pbSP4q3I8x/Y1kH0By1PgqhLU020k7xZtotC9xTmgGoCoYjPep13OisO/3CqI7AY9v
	 uSRMFrMspPWiVelxxv4oXEzKTzEUiuFnJ0q1UF/Fo1FHqXGdN1c5HWxpXyz4s0/ubD
	 5QK7VpAHtpqiQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5CD24C5DF7D;
	Fri, 21 Aug 2026 12:02:35 +0000 (UTC)
From: Jason Yang via B4 Relay <devnull+jason98166.gmail.com@kernel.org>
Date: Fri, 21 Aug 2026 20:02:30 +0800
Subject: [PATCH v4 2/7] dt-bindings: phy: rockchip,rk3588-mipi-dcphy: Allow
 DSI and CSI consumers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260821-dcphy-rx-v1-v4-2-f1797634233d@gmail.com>
References: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
In-Reply-To: <20260821-dcphy-rx-v1-v4-0-f1797634233d@gmail.com>
To: Vinod Koul <vkoul@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Guochun Huang <hero.huang@rock-chips.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Michael Riesch <michael.riesch@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 linux-kernel@vger.kernel.org, Jason Yang <jason98166@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1787313753; l=2834;
 i=jason98166@gmail.com; s=20260721; h=from:subject:message-id;
 bh=0WXE/NlokgeSzl3fI3FkObkaA99tQXSoViMQEwXn3Mg=;
 b=3fWLRGuGuybNGBytIyM/G6LIROaQhrm/OnU6jbpr61L/vqpD0BxsqQjQbLKj7ESlidWA1ofMj
 WHjKv6jee5gBN9kUaAFSAyTOjjemDaF2a8QehcS5jjweyzVlkUv3vrs
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

The Samsung MIPI D-/C-PHY block on RK3588 and RK3576 has a transmitter
(DSI) and a receiver (CSI) on the same PHY, and two drivers can use them
at the same time. The single cell this binding has selects the mode, so
it cannot tell whether a consumer wants the transmitter or the receiver.

Allow a second cell that selects the transmitter or the receiver. With
D-PHY:

	/* the MIPI DSI host, driving the transmitter */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_DSI>;

	/* the MIPI CSI-2 host, driving the receiver */
	phys = <&mipidcphy0 PHY_TYPE_DPHY PHY_TYPE_CSI>;

and with C-PHY:

	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_DSI>;
	phys = <&mipidcphy0 PHY_TYPE_CPHY PHY_TYPE_CSI>;

The transmitter and the receiver cannot operate in different modes [1],
so the first cell must match in both consumers.

A board that wires up both sets '#phy-cells = <2>'. A board that only
wires up the transmitter keeps '#phy-cells = <1>', so existing device
trees are unaffected.

[1] RK3588 TRM: section 22.1 (overview): "The TX and RX only support
    operate in the same PHY mode."

Signed-off-by: Jason Yang <jason98166@gmail.com>
---
 .../bindings/phy/rockchip,rk3588-mipi-dcphy.yaml     | 20 +++++++++++++++++---
 1 file changed, 17 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
index c8ff5ba22a86..595a71a51ee6 100644
--- a/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
+++ b/Documentation/devicetree/bindings/phy/rockchip,rk3588-mipi-dcphy.yaml
@@ -20,11 +20,25 @@ properties:
     maxItems: 1
 
   "#phy-cells":
-    const: 1
+    enum: [1, 2]
     description: |
-      Argument is mode to operate in. Supported modes are:
+      A single cell selects the mode to operate in and refers to the
+      transmitter:
         - PHY_TYPE_DPHY
         - PHY_TYPE_CPHY
+
+      Two cells select the mode and then the transmitter (DSI) or the
+      receiver (CSI), so that both can be described as independent
+      consumers of the same PHY:
+        - PHY_TYPE_DPHY PHY_TYPE_DSI
+        - PHY_TYPE_DPHY PHY_TYPE_CSI
+        - PHY_TYPE_CPHY PHY_TYPE_DSI
+        - PHY_TYPE_CPHY PHY_TYPE_CSI
+
+      The transmitter (DSI) and the receiver (CSI) cannot operate in
+      different modes, so when both are described, the first cell must
+      match in both consumers.
+
       See include/dt-bindings/phy/phy.h for constants.
 
   clocks:
@@ -82,6 +96,6 @@ examples:
                  <&cru SRST_S_MIPI_DCPHY0>;
         reset-names = "m_phy", "apb", "grf", "s_phy";
         rockchip,grf = <&mipidcphy0_grf>;
-        #phy-cells = <1>;
+        #phy-cells = <2>;
       };
     };

-- 
2.43.0



