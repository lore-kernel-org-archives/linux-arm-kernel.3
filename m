Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B0D2CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 14:57:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1AZ88vA5kaXWtTMcNZhaVk3NXcIeko4MphEr3/WPcG0=; b=RBhfhWvUuXXJ6iAPnzx+jyOLEH
	/cqXxO8PvHx2jHtvd13gD1mArJz5NXynJPoT0htNZKXjokgnW71VLRTUzu/7iO/6c16RHkFqhRnWj
	6hGL3TktpJ7a3NBUMMZHOZMMHNZXx3E9jT1hgr8GsdcqvKmTllZCR74dd6sixWoZDV9K26iN35I7W
	x1lme4Q/5XMsw80V1P46tJB+V+ZE5PTvDAmXBHBzbOSBOdHdyiaietaH64X3St+hCMK7+f+Tz3lac
	P7pkobIjvlYwgiySWKIHcilDR6uszVN220lidbb6RIUh9iLxly96incJYBnrMYF1bb9AOBYdXukwr
	jyPHoySQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXV3-00000005oIu-3rxG;
	Thu, 14 May 2026 14:57:21 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNXV0-00000005oHG-329Z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 14:57:19 +0000
Received: from mail.ideasonboard.com (unknown [IPv6:2401:4900:1c69:1da4:3c70:f102:9ea:5df7])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id AB5516A2;
	Thu, 14 May 2026 16:57:07 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1778770628;
	bh=h/ota8ZICpneGEg7HYAsUvcywQO1053BXvd14aLcQeI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=ai2bxz6RzCF8CF9ks7ccm1uLpuL4HIaoeNCMXNvjcxlKcsDx/TrE0Pe8UwBEkzoS2
	 IicDZw9KTQIeHGL6GUPZR0bTX3BsQdZlLC47O1DZOfhT9o0LCya3BCZZjE+6dsqKPW
	 j48vMLBJvUafgTaAIlHqp7VEFUNKVTaqhTIQO6Q4=
From: Jai Luthra <jai.luthra@ideasonboard.com>
Date: Thu, 14 May 2026 20:26:28 +0530
Subject: [PATCH 2/4] arm64: dts: ti: k3-am67a-beagley-ai: Add DSI0/CSI1 mux
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260514-beagley-cameras-v1-2-5c3500b5a436@ideasonboard.com>
References: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
In-Reply-To: <20260514-beagley-cameras-v1-0-5c3500b5a436@ideasonboard.com>
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
 b=owEBbQKS/ZANAwAKAUPekfkkmnFFAcsmYgBqBeK5WdGh8l+48cJNE3/EiTA0Hc7CbjaxhnNpr
 tNBgRqMKvyJAjMEAAEKAB0WIQRN4NgY5dV16NRar8VD3pH5JJpxRQUCagXiuQAKCRBD3pH5JJpx
 RdUzEACUj2airjEX+eYgJnX/lZjxT3JGNRtIvhmOttNt7XZVh49EUT4PCkcKHd1HxtHawRypxrE
 y95YjxZf+9A+46Zp7VBhukZUdJD54ofjW6I703hPsyiSQrzFI3KMa3di8a+NzSgGKWYIi0TrLUE
 r0gjLXgMlleuZrTwnipe9KIXnyZr7nIEkvyjOCzgS7JOtpVi1XvbBRmQlTOg555NiOTGBWKRI97
 LDG5Q29rPfV4bhuaHqVTphuXWE2euKy2aMmGSMyjkUDnCfvkA9HsnjnsQPLsCB9PvZGM41I8sh1
 qNf0PpCpnm6x76LzThMjy86TQHxQz1ZuY0FvBlZqVpMDedeJ+nyFdBIoDD55BCbTKpAcTjwyAbm
 f5BsEIAVRHRzcA/MGvpomrE/bnvyIYJ94VStU61L4ulECSWm/gKW/b46PJPo8CpzHKkqkW6y0um
 WTp98tp4psQPxA328RFTMu/Zyei10aY+NHd8FEwsJI9As0cx9Ic5CZbb3iCRbsQFzP8f5UNfncv
 4fu/SVmmZjg4jCTa2K81oP1F0LVVNXFttGrjq6YVX2XYTgq24t0jQyoRIsmKePYSWfJlGEQ7bSu
 aHr8rKOx6r13Vlp6ZucZXr1ughu9x9PNWeiLV3mujhsdmEiBOVCPqkp9TnaY6D1cUg5qHdc52WB
 BX8YOlU7mv/eJmQ==
X-Developer-Key: i=jai.luthra@ideasonboard.com; a=openpgp;
 fpr=4DE0D818E5D575E8D45AAFC543DE91F9249A7145
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_075718_918991_6B66956E 
X-CRM114-Status: UNSURE (   8.02  )
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


