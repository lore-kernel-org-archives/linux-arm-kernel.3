Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8FCA3CD4F25
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 15 May 2026 01:17:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AZ88vA5kaXWtTMcNZhaVk3NXcIeko4MphEr3/WPcG0=; b=KQR3Rnm29BIAx6dcZSBwcZGA/s
	+Ndk+Ct5HJ9EQ3vr+GkeSmRe6a9q6CqAYy/UeGnXzfD2xgo+0CWecsjqdyf0Xd2q2ioQLvxsAdej1
	hoMN3cNpwJdfB4/oaKxEcwWfbjmvaP765Ke3og6MhiIObo/Bja1uOi4oY0C9MPY4yQedIBtopfSh9
	7/3qOutBA0Bbm+U9Gj7sutgNKd8i1/csEvzHWNjVbXtavy9JyiToFuphCyxGCrBR26D6RLIV1L0da
	H1Q1iyxCxqtC19hKKGthJCy5KzqaJAcYsrjI52krgcJIQQLubBegdyDBmi27n7lqmgQfu633ET1LL
	Bg1V9asw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBK-00000006zPb-2She;
	Fri, 15 May 2026 01:17:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNhBI-00000006zOu-0O2a
	for linux-arm-kernel@lists.infradead.org;
	Fri, 15 May 2026 01:17:37 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id B83BD63C;
	Fri, 15 May 2026 03:17:24 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778807845;
	bh=h/ota8ZICpneGEg7HYAsUvcywQO1053BXvd14aLcQeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=GmWj7nPrLdeKwf+DA4KqFN0fRJzKo5CiD7UK1+4/8+gbMFrrW7ewB2shpNpaM1UmD
	 Qt8Nyu71Q5Pgl78leq2bFN2Z6v6159AW9PbZUbKy1G5AVBTRJD4/QTLsL2dWYRZyRW
	 XowbvouksCN5h8qDQmw2O60lt+PVS4kt8T8CNEFs=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Fri, 15 May 2026 06:46:37 +0530
Subject: [PATCH v2 2/4] arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1
 mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260515-beagley-cameras-v2-2-f6acb66c9995@ideasonboard.com>
References: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
In-Reply-To: <20260515-beagley-cameras-v2-0-f6acb66c9995@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1566;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=h/ota8ZICpneGEg7HYAsUvcywQO1053BXvd14aLcQeI=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBnQa7QrkIZLD4EBwShqDWisHOXrIQDLE+LsHm
 Ch9PUjxjLSJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagZ0GgAKCRBD3pH5JJpx
 RXwGEADQ3vxqTgM9dX0LeVMmriAqKYwj0lh0dtRhfUCieeO85k1yKw0WiBxZPZLW1t0MdAb6ng7
 jp1/qtEpS9wn27Uzu7duljv9Qutqo1sLKABwtmhlCOLrWTB5k/2vPf7nKBsjZBHl5VQLeZB/N3M
 R9DlxlyOO9oIGnpg18zwfSyiMiA46ugna+yxWMUG25UwPtmc5K7MUz2JRmcilYKzm4IZavVYRaM
 OZBbOYvx/IFE4F5JLq6NooAvTrBRJUQcpH4onEVZLfNxe/SAKVqwJ4AyanZOlxK3ayWt4BFx+J0
 n0l0jbdGrjYyHMPxK23fPueOln15T/zW/HRwjEJf2BSyONbgEsjER9hR+ln8Xkslm4oj7HIuwRT
 k8BysB57z7Qjr+N3XMpn67Db/PWV0jam02vZfTEwb5HnUUrA/XJjCfFjTK+FbKDP8+AB2SKU9KV
 fXYeZBitZHaeibIza6X8pRAczi0cbST0CjANj072LgdY571qk15Z2E25/GGXHtGU11OE7GPnIxd
 hlEZOQfM+Qem/3FQQcK6YPWlgYqphQPEXtUYFecb4wDK3/8jS3RguXlv1Y7oyQYZ759Tp6tMaJw
 Cgmj+uS++W4bvXBRN31nuwPxaTHFKNgBiYJ4sWvnbyBIFRD0UrGbDyoe0PWWqlVz+/1J3lg8nHV
 jNTITDd8HGIqycQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_181736_266627_D85BFFCA 
X-CRM114-Status: UNSURE (   8.00  )
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

The DSI0 connector is shared withe CSI1 and selectable via the TMUX646
switch present on the board. Model it using a gpio-mux so that camera
sensor or DSI panel overlays can override it.

Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 06aac02a7668..041aee2cd5b1 100644
--- a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
+++ b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
@@ -146,6 +146,19 @@ led-1 {
 			default-state = "on";
 		};
 	};
+
+	dsi_csi_mux: mux-controller {
+		compatible = "gpio-mux";
+		#mux-state-cells = <1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&dsi_csi_mux_pins_default>;
+
+		mux-gpios = <&main_gpio0 2 GPIO_ACTIVE_HIGH>,
+			    <&main_gpio0 1 GPIO_ACTIVE_HIGH>;
+
+		/* state = SEL + 2*OE : 0 = DSI0, 1 = CSI1, 2,3 = off */
+		idle-state = <2>;
+	};
 };
 
 &main_pmx0 {
@@ -199,6 +212,13 @@ J722S_IOPAD(0x015c, PIN_INPUT, 0) /* (AD25) MDIO0_MDIO */
 		>;
 	};
 
+	dsi_csi_mux_pins_default: dsi-csi-mux-default-pins {
+		pinctrl-single,pins = <
+			J722S_IOPAD(0x0004, PIN_OUTPUT, 7) /* (L23) OSPI0_LBCLKO.GPIO0_1 */
+			J722S_IOPAD(0x0008, PIN_OUTPUT, 7) /* (L22) OSPI0_DQS.GPIO0_2 */
+		>;
+	};
+
 	rgmii1_pins_default: rgmii1-default-pins {
 		pinctrl-single,pins = <
 			J722S_IOPAD(0x014c, PIN_INPUT, 0) /* (AC25) RGMII1_RD0 */

-- 
2.54.0


