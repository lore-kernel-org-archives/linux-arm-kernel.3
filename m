Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74E6DCD6E60
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Jun 2026 13:01:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3wlecJb0+xgs2214SXJSorEGWwXBaQDgZMhw8t7wPv8=; b=spvfCaRpQ6r/b5tpLMUmb5gIji
	2c+FhbW3LkjUdXAHosmEplCNaDSOxnooUNA3siylljSMQHqWaVKIvnXcc73p/gg6QbQ8Ar8DYKV7U
	rHweuByVi+aKing9YKyruYLe6bwT8OrRj0Fjhnprq4xZN+Dub3yuoP2MGsaNcL9ufMMBN1OTI/Q4u
	C1Z8BXnXr4uav0q51wA+EC6PgsMZxIN3N/F9TJsIi/wxOyig6aAqmz1vVRMGbPiS4PrKVLq2HKkjt
	DnbcdBe9FKpCy029gUvq9jNC1rmpMUFaT2+bkz/t49u/IpKouZ16phK7CDBZ7UUD1g/Hy/bI6dkNH
	DINseAYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOk7-0000000D2Cc-3dFK;
	Tue, 02 Jun 2026 13:01:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wUOk4-0000000D2B2-2ToT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Jun 2026 13:01:14 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c66:476d:c684:fe78:389f:7375])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DD856103F;
	Tue,  2 Jun 2026 15:00:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780405247;
	bh=1IoQSXUWgYTEVd953ETp499G6a1vtRSc22m4J2jdDQU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=rG7h38c+vMd0Ib16WyhDsKk6qnxiYaBxxlZduj5hhJpQbVVIXTWpgYxp2Off2WXQM
	 BMuirNiMKu0iJaUAbyQFwP/m+ZXVKFlpGHzw/4xv8QbI5EJti3AV+IglMR0YgmvxAQ
	 9FgDb5OEpwNelaEquu/+RtII0ch8hFvSnmynVtuE=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Tue, 02 Jun 2026 18:29:28 +0530
Subject: [PATCH v3 2/4] arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1
 mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260602-beagley-cameras-v3-2-fe6ae35b7eda@ideasonboard.com>
References: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
In-Reply-To: <20260602-beagley-cameras-v3-0-fe6ae35b7eda@ideasonboard.com>
To: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Robert Nelson <robertcnelson@gmail.com>, Andrew Davis <afd@ti.com>, 
 Devarsh Thakkar <devarsht@ti.com>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Rishikesh Donadkar <r-donadkar@ti.com>, 
 Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Jai Luthra <jai.luthra@ideasonboard.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1833;
 i=jai.luthra@ideasonboard.com; h=from:subject:message-id;
 bh=1IoQSXUWgYTEVd953ETp499G6a1vtRSc22m4J2jdDQU=;
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqHtQD8e+Qn7Exk8nQGthzX0JeBnZTt8f6Wf+63
 feVLEpGkbiJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCah7UAwAKCRBD3pH5JJpx
 RV+pEADQRDG4llqs4sWLC7epusLmybE+P1he8AjvpbEXFM5aSda3HDcEABL7J4dycoSeri0tQiG
 dGCqOZ1JuKNXjBCBkhyF/1knNbQNnSy0aPJ4Ii0CcBiFGq0iWwFRo+YpqJ0z6pb7rutTfMwPoFQ
 Rm4IjOaRvaIa4rTdu6Nu0B3r7FogEOA/ADLkKSH8VYVe5IaCxnLrLlCTv81x8v1OdPae3ey3cHR
 j/a2v1ZZTRU3/HwftcA0uYHDl7ffODRBOB/ByHMVPt21JU527YESEQ5AiCXGLKUWWAODKUaBnqo
 Gyh2LKBSYeFxwOkorDNg/6OF6lqfI1VBNEgJT/doN0GflMCDwG9JjvebZyrHewm3ufwnbO1rgPx
 cC9JI6IJ354NX9iLuNxy1/3NM4q9uXmG3m5s8DeEzq3bsNAP158SMoRTtEysl5hElt8rp2ne29B
 O9SOnBfwYBwIx1uBqS429GCQHQZc7g7DI7CfvpQ0J8RpPUe5XESZKd1NiatJSXONcqvo0lrZdRG
 GeQHDkgIhwkx23qhNw8H3so9NeCJLDLQFPIQWI9EiG9xPH48C+kCSCDaqvyDPu3KQVrnXuOu96L
 LsLkgtdnbeicZ9A6UjpO2SDtPrC3NeFIqXkkko6+Of+7NLU0AcQJ2ryy4R5mMI+3JIPq5/YGLIT
 PlFcsVBM5HBqF5w==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260602_060112_779347_0F41D28E 
X-CRM114-Status: UNSURE (   8.95  )
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

The DSI0 connector is shared with the CSI1 and selectable via the
TMUX646 switch present on the board. Model it using a gpio-mux so that
camera sensor or DSI panel overlays can override it.

Link: https://docs.beagle.cc/boards/beagley/ai/03-design.html#dsi
Reviewed-by: Rishikesh Donadkar <r-donadkar@ti.com>
Signed-off-by: Jai Luthra <jai.luthra@ideasonboard.com>
---
Changes in v3:
- Add Rishikesh's R-by
- Add Link to BeagleY schematics for the DSI0 connector and mux
- No changes in the patch itself
---
 arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts | 20 ++++++++++++++++++++
 1 file changed, 20 insertions(+)

diff --git a/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts b/arch/arm64/boot/dts/ti/k3-am67a-beagley-ai.dts
index 890d3a745375..bb1db8c6a91f 100644
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


