Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBCA7C88E78
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 13:47:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=; b=E5MTW3/j0fxWFl9GW7P5CNC3ZV
	Cb9qjyqrgE08Y6IFmlo79ND3Xkv6pMLq/TLq4n5aG8tq4UZI8i+8eXhkc3SyXV5+hXS8z9cCyeTHm
	jRkWCk0u/ZFowcnFzOWeYKywxO8CGWYir5eGEY0rLLv/yjRO8ZK/eiF6esgHv1CQoZDS8mTAjPcuh
	ucMWweYuJETLGkFj5qL7RgE+OVU0mNGCy+AvYAKtGw/GWO2JKSiNjy9R2Cr3FnT2ctufgqwU2heDh
	z1kpxrCjo2MbYIXXBJmy9NieCgzR/Z/zYtUMUBrDxyfGdoQXrV2Qf4z/ZS/bsAuCrAALuorFNb6EZ
	zXhG+feg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671a-00000003q73-34P9;
	Mon, 14 Sep 2026 13:47:10 +0000
Received: from mail.fris.de ([116.203.77.234])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x671Q-00000003pzj-3NQR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 13:47:02 +0000
From: Frieder Schrempf <frieder@fris.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=fris.de; s=mail;
	t=1789393612;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ddjlJDo16j6gyKZ/QxfYpcaKugYWnJGVhK4hU7DDRFQ=;
	b=r3QkOTPWyE013mnNLKuquYTC3vqSQci0rbYLNlpDomAOoKpLmC9d2l2aMkZPDYiznWwTLq
	uEObAtBt+nM7hjw7cU+1HpjzabeyJVrpppgw+pjRCE0c7I8XBIHXx5bdpughqMYD5EnUWm
	N+SReJuMnFxVwV/0/a6++77CV+MX44gCmGb/0TXQLM7y+McUgUfG3sXQdHgneXnfBnqYfp
	S8UFgJzw+V/uWlnPnpy06Bm0ybkRKQq3GItHe6s+elEqy4KQvIXg6dGv1A46oZG7a7dAyg
	ivWRB7U3Lqy57Gak3C9CvJRfeUBdS7RmgiKiLYffURrfSkrqTmMwJeS816LMNw==
Date: Mon, 14 Sep 2026 15:46:14 +0200
Subject: [PATCH v2 6/9] arm64: dts: imx8mm-kontron: Describe the ethernet
 PHY LEDs
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-6-8e12bc5f1f10@kontron.de>
References: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
In-Reply-To: <20260914-upstreaming-v7-2-imx-dt-improvements-08-26-v2-0-8e12bc5f1f10@kontron.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, 
 Frieder Schrempf <frieder.schrempf@kontron.de>, 
 Shawn Guo <shawnguo@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
X-Developer-Signature: v=1; a=openpgp-sha256; l=1413;
 i=frieder.schrempf@kontron.de; h=from:subject:message-id;
 bh=3o8FkH+94Gp91Ts9hc9WE4bcbXn8u9fadCMq2uRk+Xc=;
 b=owGbwMvMwCWWWSatKlDTJMZ4Wi2JIWv5r1NLJsp9KN+q4FaZcPo2E6sG9xWdwzHHjxx98GXj/
 HrulwLnO0pZGMS4GGTFFFmk+C1e25rF+sgfq46CmcPKBDKEgYtTACYiOIWRYc5lA1mB6veGe5en
 uy+9v/10Z1349NDX8bM/1ciqFxs69zH8FZv56l2w9WOlX+aKGz4qmC3c9KBP2OXVv08TGsqt2m/
 e4QMA
X-Developer-Key: i=frieder.schrempf@kontron.de; a=openpgp;
 fpr=1A0F38EB3D365D4C1FC67B5A69761B25107C8216
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_064701_078138_7C6C01CE 
X-CRM114-Status: UNSURE (   8.91  )
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

From: Frieder Schrempf <frieder.schrempf@kontron.de>

The RJ45 of the BL i.MX8MM has two LEDs wired to LED0 and LED1 of
the VSC8531 PHY. Describe them using the standard LED subnodes of
the ethernet PHY binding, so that they show up as LED class devices
and can be driven by the netdev trigger.

Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
---
 arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
index dd59af0ebaae..1f3d0577f10c 100644
--- a/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mm-kontron-bl.dts
@@ -5,6 +5,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/leds/common.h>
 #include "imx8mm-kontron-sl.dtsi"
 
 / {
@@ -139,6 +140,25 @@ ethphy: ethernet-phy@0 {
 			reset-assert-us = <1>;
 			reset-deassert-us = <15000>;
 			reset-gpios = <&gpio4 27 GPIO_ACTIVE_LOW>;
+
+			leds {
+				#address-cells = <1>;
+				#size-cells = <0>;
+
+				led@0 {
+					reg = <0>;
+					color = <LED_COLOR_ID_GREEN>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+
+				led@1 {
+					reg = <1>;
+					color = <LED_COLOR_ID_YELLOW>;
+					function = LED_FUNCTION_LAN;
+					linux,default-trigger = "netdev";
+				};
+			};
 		};
 	};
 };

-- 
2.55.0


