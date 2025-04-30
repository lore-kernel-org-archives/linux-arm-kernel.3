Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 161ECC369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 09:57:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NwIijcapvWYEPPV7KzPc33CcM9zoBMkqFHf3vGam9WU=; b=YHQvfAxLBgiK27nNoVREV3lHWK
	Ce3KdLPS/HlkBh1QvA9q4qL9Z97hve8MxyVe07Q2AHwVUf2nPxb3OLpKxUBx9nW0NtFiuxHRqBJJa
	AUpxI46gkVmKjMVUunEAaJ08LalFhmut1E8xV/TF+ClgMzrhj1CLx1cCG1a/UYXjHI13HAnHEUmsV
	Fxs3den/R/G+c9tbufzPs6W94/Pg4UcaiwEASmskjvEDywqHrn2shV+p7T0MZ9gZ1ILnVFmI8M7vR
	jhL0ywUTC22z3khslI1jXO89oLZzGAHJA3rnmhKI7ZhDuY8FLf1N5shGGwXTIZ3R/yAsPLff341b3
	a4M7pZvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4BV-0000000CS0y-09UD;
	Wed, 30 Apr 2025 09:56:57 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA3jP-0000000CMQg-0plV;
	Wed, 30 Apr 2025 09:27:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=NwIijcapvWYEPPV7KzPc33CcM9zoBMkqFHf3vGam9WU=; b=MMoHrpL4/95i6KVOdqhZy3lbSk
	0KL0c34ArpZzd+Vr5CfBRx82L6OP/zEs3U8WfVU0pptC2jYGM8g15tQ3MQFGezarQOi1SwgHDiqOq
	i1xUStkdTt6xHPpEBcszmtgph11/WS01jGHGOyG80QtEN4QmAuZm3vfnTuCvC3JvRrYSw9QQOvh+q
	pz2EjfDOFBkVezeJvqY8p99BMpgurZKhH4xcYZhf+ebtS4/wpmjgJVV9wpE5s+Tei+rcwZ3bivHP3
	N+1M793lDr0O/ev2eXFAE0K+eBAbpuHt3Oo7kFPxPFGFoZbfe7pBNlw49iEJe7ToLcsg+h9MmLtBf
	ygoC4zjQ==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1uA3jJ-0000000Dl3B-1he1;
	Wed, 30 Apr 2025 09:27:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id B25B3A48576;
	Wed, 30 Apr 2025 09:22:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 16674C4CEFE;
	Wed, 30 Apr 2025 09:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746005265;
	bh=1JY5Kch+vJi3PIKRKEuB3y7dFPwqgKkQ6v2sS1NBf3o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sLhGqNTYvkvz9nZFVPbw00xfeJ7k1ZQarEeX3wrWJC7rtpr0KgMCRtYfR4rz4HstZ
	 BFi8PSKPrMhV9iHXKdABO7Q+71+sB7ilVJyZhY42JVSBNIPGIL/ygQJGASnUNTY5lG
	 7OzDQwdOpHJ/KDmLFnmtrfiRZRICV1Qzc2494a6Fu9rYpEcaCjN08p4xkn/vgmrdjG
	 8vISe0lzhWU7BI9sAe/Vfx21ZwtTGwluTebSvNr5fDJVGTQ6YuHyVHgbO8gtzRU6bc
	 qn3+Id1b4ey6wehQ6BwkJ34dXPQsA4XANFOCBNY8AUoujuCUAZTEonri3rhNEu/LEU
	 XPpVYztnJOF1w==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0D3A1C3ABA9;
	Wed, 30 Apr 2025 09:27:45 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 30 Apr 2025 11:15:56 +0200
Subject: [PATCH v6 07/13] media: rockchip: rkcif: add driver for mipi csi-2
 receiver
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v6-7-d2f5fbee1551@collabora.com>
References: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v6-0-d2f5fbee1551@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>, 
 Kever Yang <kever.yang@rock-chips.com>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Sebastian Reichel <sebastian.reichel@collabora.com>, 
 Collabora Kernel Team <kernel@collabora.com>, 
 Paul Kocialkowski <paulk@sys-base.io>, 
 Alexander Shiyan <eagle.alexander923@gmail.com>, 
 Val Packett <val@packett.cool>, Rob Herring <robh@kernel.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, 
 Sakari Ailus <sakari.ailus@linux.intel.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Michael Riesch <michael.riesch@wolfvision.net>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1746004564; l=20544;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=ZZHJDk0wn/yQ5gJzCKt7Rutiou4UUqSs9cWQYEkDr4A=;
 b=+VNYbWNYdDe8yt2f/hnm908d6n88hEjGe7HJOEHqzQin+7PdfjgMtQttTkOzjuuQ2KkNAzPd1
 ln2IuoSFhbBDCIGBDnru6VWElq1ZvfXAPMcVdFZvCOkrLu0hclEZI2b
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_102750_026445_8220EF44 
X-CRM114-Status: GOOD (  23.61  )
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

From: Michael Riesch <michael.riesch@wolfvision.net>

The Rockchip RK3568 MIPI CSI-2 Receiver is a CSI-2 bridge with one
input port and one output port. It receives the data with the help
of an external MIPI PHY (C-PHY or D-PHY) and passes it to the
Rockchip RK3568 Video Capture (VICAP) block.

Add a V4L2 subdevice driver for this unit.

Signed-off-by: Michael Riesch <michael.riesch@wolfvision.net>
Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 drivers/media/platform/rockchip/rkcif/Makefile     |   3 +
 .../rockchip/rkcif/rkcif-mipi-csi-receiver.c       | 731 +++++++++++++++++++++
 2 files changed, 734 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/Makefile b/drivers/media/platform/rockchip/rkcif/Makefile
index 818424972c7b..a5c18a45c213 100644
--- a/drivers/media/platform/rockchip/rkcif/Makefile
+++ b/drivers/media/platform/rockchip/rkcif/Makefile
@@ -5,3 +5,6 @@ rockchip-cif-objs += rkcif-dev.o \
 	rkcif-capture-mipi.o \
 	rkcif-interface.o \
 	rkcif-stream.o
+
+obj-$(CONFIG_VIDEO_ROCKCHIP_CIF) += rockchip-mipi-csi.o
+rockchip-mipi-csi-objs += rkcif-mipi-csi-receiver.o
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-receiver.c b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-receiver.c
new file mode 100644
index 000000000000..81489f70490f
--- /dev/null
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-mipi-csi-receiver.c
@@ -0,0 +1,731 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Rockchip MIPI CSI-2 Receiver Driver
+ *
+ * Copyright (C) 2019 Rockchip Electronics Co., Ltd.
+ * Copyright (C) 2025 Michael Riesch <michael.riesch@wolfvision.net>
+ */
+
+#include <linux/clk.h>
+#include <linux/delay.h>
+#include <linux/io.h>
+#include <linux/module.h>
+#include <linux/of.h>
+#include <linux/of_graph.h>
+#include <linux/of_platform.h>
+#include <linux/phy/phy.h>
+#include <linux/platform_device.h>
+#include <linux/pm_runtime.h>
+#include <linux/reset.h>
+
+#include <media/mipi-csi2.h>
+#include <media/v4l2-ctrls.h>
+#include <media/v4l2-fwnode.h>
+#include <media/v4l2-subdev.h>
+
+#define CSI2HOST_N_LANES     0x04
+#define CSI2HOST_CSI2_RESETN 0x10
+#define CSI2HOST_PHY_STATE   0x14
+#define CSI2HOST_ERR1	     0x20
+#define CSI2HOST_ERR2	     0x24
+#define CSI2HOST_MSK1	     0x28
+#define CSI2HOST_MSK2	     0x2c
+#define CSI2HOST_CONTROL     0x40
+
+#define SW_CPHY_EN(x)	     ((x) << 0)
+#define SW_DSI_EN(x)	     ((x) << 4)
+#define SW_DATATYPE_FS(x)    ((x) << 8)
+#define SW_DATATYPE_FE(x)    ((x) << 14)
+#define SW_DATATYPE_LS(x)    ((x) << 20)
+#define SW_DATATYPE_LE(x)    ((x) << 26)
+
+#define RKCIF_CSI_CLKS_MAX   1
+
+enum {
+	RKCIF_CSI_PAD_SINK,
+	RKCIF_CSI_PAD_SRC,
+	RKCIF_CSI_PAD_MAX,
+};
+
+struct rkcif_csi_format {
+	u32 code;
+	u8 depth;
+	u8 csi_dt;
+};
+
+struct rkcif_csi_device {
+	struct device *dev;
+
+	void __iomem *base_addr;
+	struct clk_bulk_data *clks;
+	unsigned int clks_num;
+	struct phy *phy;
+	struct reset_control *reset;
+
+	const struct rkcif_csi_format *formats;
+	unsigned int formats_num;
+
+	struct media_pad pads[RKCIF_CSI_PAD_MAX];
+	struct v4l2_async_notifier notifier;
+	struct v4l2_fwnode_endpoint vep;
+	struct v4l2_subdev sd;
+
+	struct v4l2_subdev *source_sd;
+	u32 source_pad;
+};
+
+static const struct v4l2_mbus_framefmt default_format = {
+	.width = 3840,
+	.height = 2160,
+	.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+	.field = V4L2_FIELD_NONE,
+	.colorspace = V4L2_COLORSPACE_RAW,
+	.ycbcr_enc = V4L2_YCBCR_ENC_601,
+	.quantization = V4L2_QUANTIZATION_FULL_RANGE,
+	.xfer_func = V4L2_XFER_FUNC_NONE,
+};
+
+static const struct rkcif_csi_format formats[] = {
+	/* YUV formats */
+	{
+		.code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	{
+		.code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.depth = 16,
+		.csi_dt = MIPI_CSI2_DT_YUV422_8B,
+	},
+	/* RGB formats */
+	{
+		.code = MEDIA_BUS_FMT_RGB888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	{
+		.code = MEDIA_BUS_FMT_BGR888_1X24,
+		.depth = 24,
+		.csi_dt = MIPI_CSI2_DT_RGB888,
+	},
+	/* Bayer formats */
+	{
+		.code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.depth = 8,
+		.csi_dt = MIPI_CSI2_DT_RAW8,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.depth = 10,
+		.csi_dt = MIPI_CSI2_DT_RAW10,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+	{
+		.code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.depth = 12,
+		.csi_dt = MIPI_CSI2_DT_RAW12,
+	},
+};
+
+static inline struct rkcif_csi_device *to_rkcif_csi(struct v4l2_subdev *sd)
+{
+	return container_of(sd, struct rkcif_csi_device, sd);
+}
+
+static inline __maybe_unused void
+rkcif_csi_write(struct rkcif_csi_device *csi_dev, unsigned int addr, u32 val)
+{
+	writel(val, csi_dev->base_addr + addr);
+}
+
+static inline __maybe_unused u32
+rkcif_csi_read(struct rkcif_csi_device *csi_dev, unsigned int addr)
+{
+	return readl(csi_dev->base_addr + addr);
+}
+
+static const struct rkcif_csi_format *
+rkcif_csi_find_format(struct rkcif_csi_device *csi_dev, u32 mbus_code)
+{
+	const struct rkcif_csi_format *format;
+
+	WARN_ON(csi_dev->formats_num == 0);
+
+	for (int i = 0; i < csi_dev->formats_num; i++) {
+		format = &csi_dev->formats[i];
+		if (format->code == mbus_code)
+			return format;
+	}
+
+	return NULL;
+}
+
+static int rkcif_csi_start(struct rkcif_csi_device *csi_dev)
+{
+	enum v4l2_mbus_type bus_type = csi_dev->vep.bus_type;
+	union phy_configure_opts opts;
+	s64 link_freq;
+	u32 lanes = csi_dev->vep.bus.mipi_csi2.num_data_lanes;
+	u32 control = 0;
+
+	if (lanes < 1 || lanes > 4)
+		return -EINVAL;
+
+	/* set mult and div to 0, thus completely rely on V4L2_CID_LINK_FREQ */
+	link_freq = v4l2_get_link_freq(csi_dev->source_sd->ctrl_handler, 0, 0);
+	if (link_freq <= 0)
+		return -EINVAL;
+
+	if (bus_type == V4L2_MBUS_CSI2_DPHY) {
+		struct phy_configure_opts_mipi_dphy *cfg = &opts.mipi_dphy;
+
+		phy_mipi_dphy_get_default_config_for_hsclk(link_freq * 2, lanes,
+							   cfg);
+		phy_set_mode(csi_dev->phy, PHY_MODE_MIPI_DPHY);
+		phy_configure(csi_dev->phy, &opts);
+
+		control |= SW_CPHY_EN(0);
+
+	} else if (bus_type == V4L2_MBUS_CSI2_CPHY) {
+		control |= SW_CPHY_EN(1);
+
+		/* TODO: implement CPHY configuration */
+	} else {
+		return -EINVAL;
+	}
+
+	control |= SW_DATATYPE_FS(0x00) | SW_DATATYPE_FE(0x01) |
+		   SW_DATATYPE_LS(0x02) | SW_DATATYPE_LE(0x03);
+
+	rkcif_csi_write(csi_dev, CSI2HOST_N_LANES, lanes - 1);
+	rkcif_csi_write(csi_dev, CSI2HOST_CONTROL, control);
+	rkcif_csi_write(csi_dev, CSI2HOST_CSI2_RESETN, 1);
+
+	phy_power_on(csi_dev->phy);
+
+	return 0;
+}
+
+static void rkcif_csi_stop(struct rkcif_csi_device *csi_dev)
+{
+	phy_power_off(csi_dev->phy);
+
+	rkcif_csi_write(csi_dev, CSI2HOST_CSI2_RESETN, 0);
+	rkcif_csi_write(csi_dev, CSI2HOST_MSK1, ~0);
+	rkcif_csi_write(csi_dev, CSI2HOST_MSK2, ~0);
+}
+
+static const struct media_entity_operations rkcif_csi_media_ops = {
+	.link_validate = v4l2_subdev_link_validate,
+};
+
+static int rkcif_csi_enum_mbus_code(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_mbus_code_enum *code)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+
+	if (code->pad == RKCIF_CSI_PAD_SRC) {
+		const struct v4l2_mbus_framefmt *sink_fmt;
+
+		if (code->index)
+			return -EINVAL;
+
+		sink_fmt = v4l2_subdev_state_get_format(sd_state,
+							RKCIF_CSI_PAD_SINK);
+		code->code = sink_fmt->code;
+
+		return 0;
+	} else if (code->pad == RKCIF_CSI_PAD_SINK) {
+		if (code->index > csi_dev->formats_num)
+			return -EINVAL;
+
+		code->code = csi_dev->formats[code->index].code;
+		return 0;
+	}
+
+	return -EINVAL;
+}
+
+static int rkcif_csi_set_fmt(struct v4l2_subdev *sd,
+			     struct v4l2_subdev_state *state,
+			     struct v4l2_subdev_format *format)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	const struct rkcif_csi_format *fmt;
+	struct v4l2_mbus_framefmt *sink, *src;
+
+	/* the format on the source pad always matches the sink pad */
+	if (format->pad == RKCIF_CSI_PAD_SRC)
+		return v4l2_subdev_get_fmt(sd, state, format);
+
+	sink = v4l2_subdev_state_get_format(state, format->pad, format->stream);
+	if (!sink)
+		return -EINVAL;
+
+	fmt = rkcif_csi_find_format(csi_dev, format->format.code);
+	if (fmt)
+		*sink = format->format;
+	else
+		*sink = default_format;
+
+	/* propagate the format to the source pad */
+	src = v4l2_subdev_state_get_opposite_stream_format(state, format->pad,
+							   format->stream);
+	if (!src)
+		return -EINVAL;
+
+	*src = *sink;
+
+	return 0;
+}
+
+static int rkcif_csi_set_routing(struct v4l2_subdev *sd,
+				 struct v4l2_subdev_state *state,
+				 enum v4l2_subdev_format_whence which,
+				 struct v4l2_subdev_krouting *routing)
+{
+	int ret;
+
+	ret = v4l2_subdev_routing_validate(sd, routing,
+					   V4L2_SUBDEV_ROUTING_ONLY_1_TO_1);
+	if (ret)
+		return ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, routing,
+					       &default_format);
+	if (ret)
+		return ret;
+
+	return 0;
+}
+
+static int rkcif_csi_enable_streams(struct v4l2_subdev *sd,
+				    struct v4l2_subdev_state *state, u32 pad,
+				    u64 streams_mask)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi_dev->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[RKCIF_CSI_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_CSI_PAD_SINK,
+					       RKCIF_CSI_PAD_SRC,
+					       &streams_mask);
+
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		goto err;
+
+	ret = rkcif_csi_start(csi_dev);
+	if (ret) {
+		dev_err(dev, "failed to enable CSI hardware\n");
+		goto err_pm_runtime_put;
+	}
+
+	ret = v4l2_subdev_enable_streams(remote_sd, remote_pad->index, mask);
+	if (ret)
+		goto err_csi_stop;
+
+	return 0;
+
+err_csi_stop:
+	rkcif_csi_stop(csi_dev);
+err_pm_runtime_put:
+	pm_runtime_put_sync(dev);
+err:
+	return ret;
+}
+
+static int rkcif_csi_disable_streams(struct v4l2_subdev *sd,
+				     struct v4l2_subdev_state *state, u32 pad,
+				     u64 streams_mask)
+{
+	struct rkcif_csi_device *csi_dev = to_rkcif_csi(sd);
+	struct v4l2_subdev *remote_sd;
+	struct media_pad *sink_pad, *remote_pad;
+	struct device *dev = csi_dev->dev;
+	u64 mask;
+	int ret;
+
+	sink_pad = &sd->entity.pads[RKCIF_CSI_PAD_SINK];
+	remote_pad = media_pad_remote_pad_first(sink_pad);
+	remote_sd = media_entity_to_v4l2_subdev(remote_pad->entity);
+
+	mask = v4l2_subdev_state_xlate_streams(state, RKCIF_CSI_PAD_SINK,
+					       RKCIF_CSI_PAD_SRC,
+					       &streams_mask);
+
+	ret = v4l2_subdev_disable_streams(remote_sd, remote_pad->index, mask);
+
+	rkcif_csi_stop(csi_dev);
+
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_put_autosuspend(dev);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_pad_ops rkcif_csi_pad_ops = {
+	.enum_mbus_code = rkcif_csi_enum_mbus_code,
+	.get_fmt = v4l2_subdev_get_fmt,
+	.set_fmt = rkcif_csi_set_fmt,
+	.set_routing = rkcif_csi_set_routing,
+	.enable_streams = rkcif_csi_enable_streams,
+	.disable_streams = rkcif_csi_disable_streams,
+};
+
+static const struct v4l2_subdev_ops rkcif_csi_ops = {
+	.pad = &rkcif_csi_pad_ops,
+};
+
+static int rkcif_csi_init_state(struct v4l2_subdev *sd,
+				struct v4l2_subdev_state *state)
+{
+	struct v4l2_subdev_route routes[] = {
+		{
+			.sink_pad = RKCIF_CSI_PAD_SINK,
+			.sink_stream = 0,
+			.source_pad = RKCIF_CSI_PAD_SRC,
+			.source_stream = 0,
+			.flags = V4L2_SUBDEV_ROUTE_FL_ACTIVE,
+		},
+	};
+	struct v4l2_subdev_krouting routing = {
+		.len_routes = ARRAY_SIZE(routes),
+		.num_routes = ARRAY_SIZE(routes),
+		.routes = routes,
+	};
+	int ret;
+
+	ret = v4l2_subdev_set_routing_with_fmt(sd, state, &routing,
+					       &default_format);
+
+	return ret;
+}
+
+static const struct v4l2_subdev_internal_ops rkcif_csi_internal_ops = {
+	.init_state = rkcif_csi_init_state,
+};
+
+static int rkcif_csi_notifier_bound(struct v4l2_async_notifier *notifier,
+				    struct v4l2_subdev *sd,
+				    struct v4l2_async_connection *asd)
+{
+	struct rkcif_csi_device *csi_dev =
+		container_of(notifier, struct rkcif_csi_device, notifier);
+	int source_pad;
+
+	source_pad = media_entity_get_fwnode_pad(&sd->entity, sd->fwnode,
+						 MEDIA_PAD_FL_SOURCE);
+	if (source_pad < 0) {
+		dev_err(csi_dev->dev, "failed to find source pad for %s\n",
+			sd->name);
+		return source_pad;
+	}
+
+	csi_dev->source_sd = sd;
+	csi_dev->source_pad = source_pad;
+
+	return media_create_pad_link(&sd->entity, source_pad,
+				     &csi_dev->sd.entity, RKCIF_CSI_PAD_SINK,
+				     MEDIA_LNK_FL_ENABLED);
+}
+
+static const struct v4l2_async_notifier_operations rkcif_csi_notifier_ops = {
+	.bound = rkcif_csi_notifier_bound,
+};
+
+static int rkcif_csi_register_notifier(struct rkcif_csi_device *csi_dev)
+{
+	struct v4l2_async_connection *asd;
+	struct v4l2_async_notifier *ntf = &csi_dev->notifier;
+	struct v4l2_fwnode_endpoint *vep = &csi_dev->vep;
+	struct v4l2_subdev *sd = &csi_dev->sd;
+	struct device *dev = csi_dev->dev;
+	struct fwnode_handle *ep;
+	int ret = 0;
+
+	ep = fwnode_graph_get_endpoint_by_id(dev_fwnode(dev), 0, 0, 0);
+	if (!ep)
+		return dev_err_probe(dev, -ENODEV, "failed to get endpoint\n");
+
+	vep->bus_type = V4L2_MBUS_UNKNOWN;
+	ret = v4l2_fwnode_endpoint_parse(ep, vep);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to parse endpoint\n");
+		goto out;
+	}
+
+	if (vep->bus_type != V4L2_MBUS_CSI2_DPHY &&
+	    vep->bus_type != V4L2_MBUS_CSI2_CPHY) {
+		ret = dev_err_probe(dev, -EINVAL,
+				    "invalid bus type of endpoint\n");
+		goto out;
+	}
+
+	v4l2_async_subdev_nf_init(ntf, sd);
+	ntf->ops = &rkcif_csi_notifier_ops;
+
+	asd = v4l2_async_nf_add_fwnode_remote(ntf, ep,
+					      struct v4l2_async_connection);
+	if (IS_ERR(asd)) {
+		ret = PTR_ERR(asd);
+		goto err_nf_cleanup;
+	}
+
+	ret = v4l2_async_nf_register(ntf);
+	if (ret) {
+		ret = dev_err_probe(dev, ret, "failed to register notifier\n");
+		goto err_nf_cleanup;
+	}
+
+	goto out;
+
+err_nf_cleanup:
+	v4l2_async_nf_cleanup(ntf);
+out:
+	fwnode_handle_put(ep);
+	return ret;
+}
+
+static int rkcif_csi_register(struct rkcif_csi_device *csi_dev)
+{
+	struct media_pad *pads = csi_dev->pads;
+	struct v4l2_subdev *sd = &csi_dev->sd;
+	int ret;
+
+	ret = rkcif_csi_register_notifier(csi_dev);
+	if (ret)
+		goto err;
+
+	v4l2_subdev_init(sd, &rkcif_csi_ops);
+	sd->dev = csi_dev->dev;
+	sd->entity.ops = &rkcif_csi_media_ops;
+	sd->entity.function = MEDIA_ENT_F_VID_IF_BRIDGE;
+	sd->flags |= V4L2_SUBDEV_FL_HAS_DEVNODE | V4L2_SUBDEV_FL_STREAMS;
+	sd->internal_ops = &rkcif_csi_internal_ops;
+	sd->owner = THIS_MODULE;
+	snprintf(sd->name, sizeof(sd->name), "rockchip-mipi-csi %s",
+		 dev_name(csi_dev->dev));
+
+	pads[RKCIF_CSI_PAD_SINK].flags = MEDIA_PAD_FL_SINK |
+					 MEDIA_PAD_FL_MUST_CONNECT;
+	pads[RKCIF_CSI_PAD_SRC].flags = MEDIA_PAD_FL_SOURCE;
+	ret = media_entity_pads_init(&sd->entity, RKCIF_CSI_PAD_MAX, pads);
+	if (ret)
+		goto err_notifier_unregister;
+
+	ret = v4l2_subdev_init_finalize(sd);
+	if (ret)
+		goto err_entity_cleanup;
+
+	ret = v4l2_async_register_subdev(sd);
+	if (ret) {
+		dev_err(sd->dev, "failed to register CSI subdev\n");
+		goto err_subdev_cleanup;
+	}
+
+	return 0;
+
+err_subdev_cleanup:
+	v4l2_subdev_cleanup(sd);
+err_entity_cleanup:
+	media_entity_cleanup(&sd->entity);
+err_notifier_unregister:
+	v4l2_async_nf_unregister(&csi_dev->notifier);
+	v4l2_async_nf_cleanup(&csi_dev->notifier);
+err:
+	return ret;
+}
+
+static void rkcif_csi_unregister(struct rkcif_csi_device *csi_dev)
+{
+	struct v4l2_subdev *sd = &csi_dev->sd;
+
+	v4l2_async_unregister_subdev(sd);
+	v4l2_subdev_cleanup(sd);
+	media_entity_cleanup(&sd->entity);
+	v4l2_async_nf_unregister(&csi_dev->notifier);
+	v4l2_async_nf_cleanup(&csi_dev->notifier);
+}
+
+static const struct of_device_id rkcif_csi_of_match[] = {
+	{
+		.compatible = "rockchip,rk3568-mipi-csi",
+	},
+	{}
+};
+MODULE_DEVICE_TABLE(of, rkcif_csi_of_match);
+
+static int rkcif_csi_probe(struct platform_device *pdev)
+{
+	struct device *dev = &pdev->dev;
+	struct rkcif_csi_device *csi_dev;
+	int ret;
+
+	csi_dev = devm_kzalloc(dev, sizeof(*csi_dev), GFP_KERNEL);
+	if (!csi_dev)
+		return -ENOMEM;
+	csi_dev->dev = dev;
+	dev_set_drvdata(dev, csi_dev);
+
+	csi_dev->base_addr = devm_platform_ioremap_resource(pdev, 0);
+	if (IS_ERR(csi_dev->base_addr))
+		return PTR_ERR(csi_dev->base_addr);
+
+	ret = devm_clk_bulk_get_all(dev, &csi_dev->clks);
+	if (ret != RKCIF_CSI_CLKS_MAX)
+		return dev_err_probe(dev, -ENODEV, "failed to get clocks\n");
+	csi_dev->clks_num = ret;
+
+	csi_dev->phy = devm_phy_get(dev, NULL);
+	if (IS_ERR(csi_dev->phy))
+		return dev_err_probe(dev, PTR_ERR(csi_dev->phy),
+				     "failed to get MIPI CSI PHY\n");
+
+	csi_dev->reset = devm_reset_control_array_get_exclusive(dev);
+	if (IS_ERR(csi_dev->reset))
+		return dev_err_probe(dev, PTR_ERR(csi_dev->reset),
+				     "failed to get reset\n");
+
+	csi_dev->formats = formats;
+	csi_dev->formats_num = ARRAY_SIZE(formats);
+
+	pm_runtime_enable(dev);
+
+	ret = phy_init(csi_dev->phy);
+	if (ret) {
+		ret = dev_err_probe(dev, ret,
+				    "failed to initialize MIPI CSI PHY\n");
+		goto err_pm_runtime_disable;
+	}
+
+	ret = rkcif_csi_register(csi_dev);
+	if (ret)
+		goto err_phy_exit;
+
+	return 0;
+
+err_phy_exit:
+	phy_exit(csi_dev->phy);
+err_pm_runtime_disable:
+	pm_runtime_disable(dev);
+	return ret;
+}
+
+static void rkcif_csi_remove(struct platform_device *pdev)
+{
+	struct rkcif_csi_device *csi_dev = platform_get_drvdata(pdev);
+	struct device *dev = &pdev->dev;
+
+	rkcif_csi_unregister(csi_dev);
+	phy_exit(csi_dev->phy);
+	pm_runtime_disable(dev);
+}
+
+static int rkcif_csi_runtime_suspend(struct device *dev)
+{
+	struct rkcif_csi_device *csi_dev = dev_get_drvdata(dev);
+
+	clk_bulk_disable_unprepare(csi_dev->clks_num, csi_dev->clks);
+
+	return 0;
+}
+
+static int rkcif_csi_runtime_resume(struct device *dev)
+{
+	struct rkcif_csi_device *csi_dev = dev_get_drvdata(dev);
+	int ret;
+
+	reset_control_assert(csi_dev->reset);
+	udelay(5);
+	reset_control_deassert(csi_dev->reset);
+
+	ret = clk_bulk_prepare_enable(csi_dev->clks_num, csi_dev->clks);
+	if (ret) {
+		dev_err(dev, "failed to enable clocks\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static const struct dev_pm_ops rkcif_csi_pm_ops = {
+	.runtime_suspend = rkcif_csi_runtime_suspend,
+	.runtime_resume = rkcif_csi_runtime_resume,
+};
+
+static struct platform_driver rkcif_csi_drv = {
+	.driver = {
+		   .name = "rockchip-mipi-csi",
+		   .of_match_table = rkcif_csi_of_match,
+		   .pm = &rkcif_csi_pm_ops,
+	},
+	.probe = rkcif_csi_probe,
+	.remove = rkcif_csi_remove,
+};
+module_platform_driver(rkcif_csi_drv);
+
+MODULE_DESCRIPTION("Rockchip MIPI CSI-2 Receiver platform driver");
+MODULE_LICENSE("GPL");

-- 
2.39.5



