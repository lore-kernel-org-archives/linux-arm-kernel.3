Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ED71CCDE00C
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Jun 2026 00:09:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WfQwuydOeK6V1CoXII0HfYiJOqqMtVXHj9rKHdfI+eg=; b=zsJQlSYE3ROQqGAKGxAl0J0mk7
	RlEoBiw7y5mGNbLEtU0qfY+0GGgJxc4gQhbkI3ZpwXboHKS8r8DC1mX8zGQV7UWPVzWxKi43sn7Oq
	J9Bv0xyCXXOVQ/oln+Um5RHFGHndLXIu2Ufbik0g8DNoV6tYLKkJyjciVILz7Ix2cGZ1J/g1hNgqf
	LgeiRaReKYnenJeE28tKqRIkIyl9K23IhlsgK+cS/LB8Merz4UFuTsoBemjyDqfoEjksVKdEvLIXl
	Gmr0wctFJA6mlWdnI+9jp8paduSYgrENvh3EEW+H7q4/UdeeMTZj/ngmHgaIOEgVlkmU7yNgUErxd
	GTThWbUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcu8E-0000000A1LI-2O7s;
	Fri, 26 Jun 2026 00:09:18 +0000
Received: from ci-2003a-snip4-10.eps.apple.com ([57.103.91.140] helo=outbound.ci.icloud.com)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcu8C-0000000A1Jc-0h7A
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Jun 2026 00:09:17 +0000
Received: from outbound.ci.icloud.com (unknown [127.0.0.2])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPS id 3FC281800B08;
	Fri, 26 Jun 2026 00:09:12 +0000 (UTC)
X-ICL-RepId: 019f0142-54d8-7cc3-9bf6-c6bc3c533f8e
X-ICL-Out-Info: HUtFAUMEWwJACUgATUQeDx5WFlZNRAJCTQhPAEMGXAVeC1YBXwFLVxQEDloDVA5cBBcbXwJCH1sVSzhaDlsERxQXG1wAFw1WTVAbXwJCDxwTVhUTH1RWA0UZEFYBWFZdBU0aXBhZDxwTUFZaDlsERxQXG1wAFxtGAgQjAl8ARQJeCVYBMBcPVk1QG18CQg8cE1YVEwBeDw9MC0gBWwddAEYJSANaBl4cQQhJAlUHWB9FFA5aA1QOXAQXG18CQh9bFUs4Wg5bBEcUFxtcAAlLRglJHQ4EVAddBV0=
Dkim-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com; s=1a1hai; t=1782432555; x=1785024555; bh=WfQwuydOeK6V1CoXII0HfYiJOqqMtVXHj9rKHdfI+eg=; h=From:To:Subject:Date:Message-ID:MIME-Version:x-icloud-hme; b=L69HB4MCg0HDPreoq2LHPf0xAJ+dfR1uzlRAVLK4LD3n8ef6YRgK6apKDl/HPxKNaBZPhUIlO2znat5lGJVqiD9eTqxSTb7joiABBqKvp1aBKoeCgaUVR+CQQibKFbrTanpvEAFpdMTLJ81KTjTLQYVXpFtbvmyp9klnzOnHVrUVBwLVysRN8ksp/J5JiAOfL+aUTIWrGHbkY4u37GmEQnL+rk0jycgZxiDgF+yMDXmFOSWAsSAIfzzzsdMrEtEiZe5J1oS/hXXGnV3yrfvGVoRtgD46H8ZkQdw0ZkbxRoO7DVtTPLMpqLh6Wgtd/sy35YQ/kYIx1NXzZh6CuGBReg==
Received: from bigre.localdomain (unknown [17.57.156.36])
	by p00-icloudmta-asmtp-us-central-1k-10-percent-2 (Postfix) with ESMTPSA id C80A01800297;
	Fri, 26 Jun 2026 00:09:10 +0000 (UTC)
From: Vincent Cloutier <vincent.cloutier@icloud.com>
To: linux-media@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org,
	linux-imx@nxp.com,
	kernel@puri.sm,
	Vincent Cloutier <vincent@cloutier.co>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	imx@lists.linux.dev
Subject: [PATCH RFC 4/4] arm64: dts: imx8mq-librem5: Add rear camera
Date: Thu, 25 Jun 2026 20:07:00 -0400
Message-ID: <20260626000715.1111803-5-vincent.cloutier@icloud.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
References: <20260626000715.1111803-1-vincent.cloutier@icloud.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 2VvdWmrPWZdVNub0KeMOgqvRQKO-UmiH
X-Proofpoint-ORIG-GUID: 2VvdWmrPWZdVNub0KeMOgqvRQKO-UmiH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDIwOSBTYWx0ZWRfX30fSeoAsy88h
 z+ommw0lPDcP7hqzDJybEmAMMSjEGEBPrqEdZqjjChFRVijo4CJ+dxakwKlT/Fy9wXUStcHuXRS
 bPqEmHiKavWmrYqIBt5h6ohtJ/ydrjOrp/1aV9nDSXXBEkSvMBnK29zxQ/nivIVPxeYDWCfdit1
 QHiXtCrVlw4n/dGiir537bW2bPpFGcJpY6yhYRYBwo5ADth3jPucnsIndhFiclJ+0olLIh7tvm2
 9GlW2uXCZlsL8iwpAUwZfT9NJo/Rz7coiv99ZXBZMS6tUWYVsQkv3GpqmT8x5iGuG77ewqqHVBn
 DqCNXzqlD5o7h5zC3V/
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260625_170916_264842_225B1087 
X-CRM114-Status: UNSURE (   9.76  )
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

From: Vincent Cloutier <vincent@cloutier.co>

Add the Librem 5 rear camera sensor node and enable the second CSI-2
capture path that receives data from it.

Describe the Samsung S5K3L6 sensor with the upstream binding property
names, including reset-gpios and the link frequencies used by the initial
two-lane RAW8/RAW10 driver modes.

Signed-off-by: Vincent Cloutier <vincent@cloutier.co>
Assisted-by: OpenCode:gpt-5.5
---
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi | 51 +++++++++++++++++++++++
 1 file changed, 51 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
index f5d529c5baf3..12d5fb3440c5 100644
--- a/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi
@@ -318,6 +318,10 @@ &csi1 {
 	status = "okay";
 };
 
+&csi2 {
+	status = "okay";
+};
+
 &ddrc {
 	operating-points-v2 = <&ddrc_opp_table>;
 	status = "okay";
@@ -434,6 +438,13 @@ MX8MQ_IOMUXC_ENET_RXC_GPIO1_IO25	0x83
 		>;
 	};
 
+	pinctrl_csi2: csi2grp {
+		fsl,pins = <
+			/* CSI2_NRST */
+			MX8MQ_IOMUXC_ENET_RD0_GPIO1_IO26	0x83
+		>;
+	};
+
 	pinctrl_charger_in: chargeringrp {
 		fsl,pins = <
 			/* CHRG_INT */
@@ -1175,6 +1186,31 @@ vcm@c {
 		vcc-supply = <&reg_csi_1v8>;
 	};
 
+	camera_rear: camera@2d {
+		compatible = "samsung,s5k3l6";
+		reg = <0x2d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_csi2>;
+		clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clocks = <&clk IMX8MQ_CLK_CLKO2>;
+		assigned-clock-rates = <25000000>;
+		reset-gpios = <&gpio1 26 GPIO_ACTIVE_LOW>;
+		vdda-supply = <&reg_vcam_2v8>;
+		vddd-supply = <&reg_vcam_1v2>;
+		vddio-supply = <&reg_csi_1v8>;
+		rotation = <270>;
+		orientation = <1>;
+
+		port {
+			camera2_ep: endpoint {
+				data-lanes = <1 2>;
+				link-frequencies = /bits/ 64
+					<537500000 600000000 625000000>;
+				remote-endpoint = <&mipi2_sensor_ep>;
+			};
+		};
+	};
+
 	bat: fuel-gauge@36 {
 		compatible = "maxim,max17055";
 		reg = <0x36>;
@@ -1226,6 +1262,21 @@ mipi1_sensor_ep: endpoint {
 	};
 };
 
+&mipi_csi2 {
+	status = "okay";
+
+	ports {
+		port@0 {
+			reg = <0>;
+
+			mipi2_sensor_ep: endpoint {
+				remote-endpoint = <&camera2_ep>;
+				data-lanes = <1 2>;
+			};
+		};
+	};
+};
+
 &mipi_dsi {
 	#address-cells = <1>;
 	#size-cells = <0>;
-- 
2.53.0

