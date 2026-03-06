Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17F7FF01832
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Mar 2026 13:28:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8/r4xO5YttV8Ws66dCM6AEC/5b5RRrNQdB93RWcT9I=; b=YCPhTOvO5DRczFNqY5SnvzaCDM
	0czmsFDkvg3Zzp79cUWkbgZlTPR5MBIncJb/+jy5Xdtc7qlj0etjiN/GtD0mAnJ01tS1zBgovmYX5
	hYZZUCXw4ZCshKh4cR5Ie88vOhxna72gtD2OtoIGRgL3GnvOhbfl67VeOIiO+i7dM/aSblcc/04Xx
	s2rw/mjT2sGEKTfUXixO2j5BoecIuMueHwWmstsSYP+JBEZh1VMNoQgrUZpUqBZh6jMWrBfha5/8Y
	iccgea64blPZH4DY++PfO7Q1UDcT3NNyXWiMlgSPAQjJ3tG45jOouA1hTI4RX5QvUJscEdzVmufG1
	YWwaDScw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVEE-00000003mqC-2L2w;
	Fri, 06 Mar 2026 13:28:30 +0000
Received: from inva021.nxp.com ([92.121.34.21])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vyVE0-00000003mVX-0CHg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Mar 2026 13:28:23 +0000
Received: from inva021.nxp.com (localhost [127.0.0.1])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 2805820010A;
	Fri,  6 Mar 2026 14:28:14 +0100 (CET)
Received: from inva024.eu-rdc02.nxp.com (inva024.eu-rdc02.nxp.com [134.27.226.22])
	by inva021.eu-rdc02.nxp.com (Postfix) with ESMTP id 0A3CB2000F2;
	Fri,  6 Mar 2026 14:28:14 +0100 (CET)
Received: from lsv15149.swis.ro-buh01.nxp.com (lsv15149.swis.ro-buh01.nxp.com [10.162.246.145])
	by inva024.eu-rdc02.nxp.com (Postfix) with ESMTP id 932C520270;
	Fri,  6 Mar 2026 14:28:12 +0100 (CET)
From: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
Date: Fri, 06 Mar 2026 15:27:26 +0200
Subject: [PATCH v2 9/9] arm64: dts: imx95: Add Neutron node
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260306-neutron-v2-9-3019bd8c91ef@nxp.com>
References: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
In-Reply-To: <20260306-neutron-v2-0-3019bd8c91ef@nxp.com>
To: Oded Gabbay <ogabbay@kernel.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sumit Semwal <sumit.semwal@linaro.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Jiwei Fu <jiwei.fu@nxp.com>, 
 Forrest Shi <xuelin.shi@nxp.com>, Alexandru Taran <alexandru.taran@nxp.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, 
 Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1772803681; l=1721;
 i=ruxandra.radulescu@nxp.com; s=20260204; h=from:subject:message-id;
 bh=5zOyy+AMeXBPkio/p9NoYrjyHvyyen4DLCE4ay6mQVI=;
 b=19SjmLRX/9Q516pJ+/gR8uJNtcM+iHTVCL+RnzhTJedKl/ISz9Jw+WnRgi8WmfTiH85LemNGZ
 yWz8j+uOTBFDdlgpFRf5eQCHSpHMIpfNu7FS56FxJG24iNwnrjqyKLs
X-Developer-Key: i=ruxandra.radulescu@nxp.com; a=ed25519;
 pk=zoq4b4OYR0c4faAH97xoTxdr6vfR8OvPbS+Cx0XhIBY=
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260306_052816_485267_587D7D72 
X-CRM114-Status: UNSURE (   8.88  )
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

Add the node for Neutron NPU. Also add a reserved memory region
for allocating Neutron buffers, which have a 1MB alignment
constraint.

Signed-off-by: Jiwei Fu <jiwei.fu@nxp.com>
Signed-off-by: Ioana Ciocoi-Radulescu <ruxandra.radulescu@nxp.com>
---
v2: Match changes in dt bindings
---
 arch/arm64/boot/dts/freescale/imx95.dtsi | 28 ++++++++++++++++++++++++++++
 1 file changed, 28 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/imx95.dtsi b/arch/arm64/boot/dts/freescale/imx95.dtsi
index 55e2da094c88..1c6865a8d482 100644
--- a/arch/arm64/boot/dts/freescale/imx95.dtsi
+++ b/arch/arm64/boot/dts/freescale/imx95.dtsi
@@ -336,6 +336,19 @@ sram1: sram@204c0000 {
 		#size-cells = <1>;
 	};
 
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		neutron_pool: neutron-pool {
+			compatible = "shared-dma-pool";
+			size = <0x0 0x8000000>;
+			alignment = <0x0 0x100000>;
+			reusable;
+		};
+	};
+
 	firmware {
 		scmi {
 			compatible = "arm,scmi";
@@ -2181,5 +2194,20 @@ ddr-pmu@4e090dc0 {
 			reg = <0x0 0x4e090dc0 0x0 0x200>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 		};
+
+		neutron: npu@4ab00000 {
+			compatible = "nxp,imx95-neutron";
+			reg = <0x0 0x4ab00000 0x0 0x00000400>,
+			      <0x0 0x4ab10000 0x0 0x00010000>,
+			      <0x0 0x4ab08000 0x0 0x00008000>;
+			reg-names = "regs", "itcm", "dtcm";
+			memory-region = <&neutron_pool>;
+			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk IMX95_CLK_NPU>,
+				 <&scmi_clk IMX95_CLK_NPUAPB>;
+			clock-names = "core", "apb";
+			power-domains = <&scmi_devpd IMX95_PD_NPU>;
+			iommus = <&smmu 0xd>;
+		};
 	};
 };

-- 
2.34.1


