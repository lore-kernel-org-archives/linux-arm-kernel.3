Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC61ACAC5A0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 15:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6FnFYkfkmJ0w06enclWIqusB6MtTKlmqKYiEnLDbDuw=; b=bVgbBeS4xkP7ZvXhxjBWM/O1d7
	gpslggCGvhl8eEeMDyHUlBBMeMCOeYmMYOulWzgg/T0ph6mNRr+Ir1XTnNwdlSmlTH6qbUxgsxQhY
	yidSoFSZZRrqv1Zhb1RSJB0S18DFwrJeJJQtiqmuaYhTyj+nnJe6njjcr0MVMIcs/t+yOQLTstuld
	g2zE6TcBih1XJXr/P12rqMP4Vgyvu33CboVDaW2AKtoEyuaJrmLiYOLu/jE7TCokC4k277GyAaeii
	8O7915aejNoMmsnJd9CA9/f6GV9YmRWdTEQUwbE6m2YECJqUB0PrkgVM/c6iYNQJko6LQSVi181NK
	aeVVvpFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuFx-0000000CndO-1RYi;
	Wed, 17 Sep 2025 15:39:41 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuFP-0000000CmZT-1EaO;
	Wed, 17 Sep 2025 15:39:07 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Reply-To:Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Content-ID:Content-Description;
	bh=6FnFYkfkmJ0w06enclWIqusB6MtTKlmqKYiEnLDbDuw=; b=m74qlbmKtNpMhEZSAPvmDIVBUS
	kGK4VPIGUWoJPB2TaJLjnTLR8+UtbjjpyafqRXXmsBmiJaJpf9HihrySAkCTqQLZ5xKy4VqKJKVi2
	Mamc+Wg6Lgu4xkpYRk4dp3J8qF2Lz+PfEzgsW/v+DVkvMpowtoUMJ/0HHTNXgcmE+SC5t+og0WD21
	ApmffqQ8fo/54hPeQpK8ZljLqXU47Lyz04nIhRGsPIfL/lgQ145Grs1x1uFnNMFQIeZxoOg1z7vHI
	1n/9MqYNCaIj3up2gQqENt3E8NOM9ewVeAiv3bBmHmAxF/nVY+rH7uOZoy2TV9jbEp+9aDv9bIIXU
	iGK1ceiA==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyuFJ-00000007RjR-1hGF;
	Wed, 17 Sep 2025 15:39:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AAEC144FBD;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 8B799C4CEF7;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758123533;
	bh=YxOEcvQQWWkMACYStLCgwlZ26jl+y58raHJAzO/2ZTI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=J28jlxjHMkCnrm0FeFg0EKmLlqfvMYqgj2okrIsiFXy1+Q9qmvktqZJO8uzyzQeWP
	 sMGOh0dhV7J9O63/9m8x+430GEr7pcd5DODbawPPXGVcse+9peas8b3NfI6rtSGGLS
	 W5GEmrYZXnf7geFB+HC0SVINGbd2zWb6p9vt9vLu69CbR8HZ3KXgrWTkvfelJTo1dT
	 xbKLUBU38zkNgdEi54wyRXD8ZEE8MzJufNfzVM9f/OxVQNS77bG2dofX+Itoy+d2ET
	 P403d5GiCF3oreO3XYJq/RO4+MhYzO0VV/yhq7zyp7FNHnYo6uo01lax/6mmHH2nH7
	 2YmlSCabztXnw==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 81B8CCAC5A0;
	Wed, 17 Sep 2025 15:38:53 +0000 (UTC)
From: Michael Riesch via B4 Relay <devnull+michael.riesch.collabora.com@kernel.org>
Date: Wed, 17 Sep 2025 17:38:51 +0200
Subject: [PATCH v11 11/17] media: rockchip: rkcif: add support for rk3568
 vicap dvp capture
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-rk3568-vicap-v11-11-af0eada54e5d@collabora.com>
References: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
In-Reply-To: <20240220-rk3568-vicap-v11-0-af0eada54e5d@collabora.com>
To: Mehdi Djait <mehdi.djait@linux.intel.com>, 
 Maxime Chevallier <maxime.chevallier@bootlin.com>, 
 =?utf-8?q?Th=C3=A9o_Lebrun?= <theo.lebrun@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 Gerald Loacker <gerald.loacker@wolfvision.net>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Markus Elfring <Markus.Elfring@web.de>, 
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
 Michael Riesch <michael.riesch@collabora.com>, 
 Michael Riesch <michael.riesch@collabora.com>
X-Mailer: b4 0.12.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758123529; l=10752;
 i=michael.riesch@collabora.com; s=20250410; h=from:subject:message-id;
 bh=1x5UJSLw8qZEJq2/QAMKa4q6rbg+hwbsVpGT/G39Adw=;
 b=tH5n0DaSEZtaA9P/M/Ex2KkBsif2DsyPxmBGUW6+pfhyoyAUI/1iksaM8LGir0yLy7ZcsB+a3
 vU0rP2ZrXhoD6p++m/uiaRr99/Pqp1uH33t5cTiiwAzJglDJPjzIIQ6
X-Developer-Key: i=michael.riesch@collabora.com; a=ed25519;
 pk=+MWX1fffLFZtTPG/I6XdYm/+OSvpRE8D9evQaWbiN04=
X-Endpoint-Received: by B4 Relay for michael.riesch@collabora.com/20250410
 with auth_id=371
X-Original-From: Michael Riesch <michael.riesch@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_163902_368461_C3E0C332 
X-CRM114-Status: GOOD (  13.71  )
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

The RK3568 Video Capture (VICAP) unit features a Digital Video Port
(DVP). Add support for it.

Signed-off-by: Michael Riesch <michael.riesch@collabora.com>
---
 .../platform/rockchip/rkcif/rkcif-capture-dvp.c    | 276 +++++++++++++++++++++
 .../platform/rockchip/rkcif/rkcif-capture-dvp.h    |   1 +
 drivers/media/platform/rockchip/rkcif/rkcif-dev.c  |   1 +
 3 files changed, 278 insertions(+)

diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
index 35e2b685a4d8..6b463d232283 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.c
@@ -331,6 +331,282 @@ const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data = {
 	},
 };
 
+static const struct rkcif_input_fmt rk3568_dvp_in_fmts[] = {
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_UYVY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_2X8,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_VYUY,
+		.fmt_type = RKCIF_FMT_TYPE_YUV,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
+			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YUYV8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
+			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_YVYU8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
+			       RKCIF_FORMAT_BT1120_YC_SWAP |
+			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_UYVY8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YUYV |
+			       RKCIF_FORMAT_BT1120_YC_SWAP |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120 |
+			       RKCIF_FORMAT_BT1120_YC_SWAP |
+			       RKCIF_FORMAT_BT1120_TRANSMIT_PROGRESS,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_VYUY8_1X16,
+		.dvp_fmt_val = RKCIF_FORMAT_YUV_INPUT_422 |
+			       RKCIF_FORMAT_YUV_INPUT_ORDER_YVYU |
+			       RKCIF_FORMAT_BT1120_YC_SWAP |
+			       RKCIF_FORMAT_INPUT_MODE_BT1120,
+		.field = V4L2_FIELD_INTERLACED,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SBGGR12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGBRG12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SGRBG12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_SRGGB12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_RGB888_1X24,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y8_1X8,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_8,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y10_1X10,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_10,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+	{
+		.mbus_code = MEDIA_BUS_FMT_Y12_1X12,
+		.dvp_fmt_val = RKCIF_FORMAT_INPUT_MODE_RAW |
+			       RKCIF_FORMAT_RAW_DATA_WIDTH_12,
+		.fmt_type = RKCIF_FMT_TYPE_RAW,
+		.field = V4L2_FIELD_NONE,
+	},
+};
+
+static void rk3568_dvp_grf_setup(struct rkcif_device *rkcif)
+{
+	u32 con1 = RK3568_GRF_WRITE_ENABLE(RK3568_GRF_VI_CON1_CIF_DATAPATH |
+					   RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM);
+
+	if (!rkcif->grf)
+		return;
+
+	con1 |= rkcif->interfaces[RKCIF_DVP].dvp.dvp_clk_delay &
+		RK3568_GRF_VI_CON1_CIF_CLK_DELAYNUM;
+
+	if (rkcif->interfaces[RKCIF_DVP].vep.bus.parallel.flags &
+	    V4L2_MBUS_PCLK_SAMPLE_DUALEDGE)
+		con1 |= RK3568_GRF_VI_CON1_CIF_DATAPATH;
+
+	regmap_write(rkcif->grf, RK3568_GRF_VI_CON1, con1);
+}
+
+const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data = {
+	.in_fmts = rk3568_dvp_in_fmts,
+	.in_fmts_num = ARRAY_SIZE(rk3568_dvp_in_fmts),
+	.out_fmts = dvp_out_fmts,
+	.out_fmts_num = ARRAY_SIZE(dvp_out_fmts),
+	.setup = rk3568_dvp_grf_setup,
+	.has_scaler = false,
+	.regs = {
+		[RKCIF_DVP_CTRL] = 0x00,
+		[RKCIF_DVP_INTEN] = 0x04,
+		[RKCIF_DVP_INTSTAT] = 0x08,
+		[RKCIF_DVP_FOR] = 0x0c,
+		[RKCIF_DVP_LINE_NUM_ADDR] = 0x2c,
+		[RKCIF_DVP_FRM0_ADDR_Y] = 0x14,
+		[RKCIF_DVP_FRM0_ADDR_UV] = 0x18,
+		[RKCIF_DVP_FRM1_ADDR_Y] = 0x1c,
+		[RKCIF_DVP_FRM1_ADDR_UV] = 0x20,
+		[RKCIF_DVP_VIR_LINE_WIDTH] = 0x24,
+		[RKCIF_DVP_SET_SIZE] = 0x28,
+		[RKCIF_DVP_CROP] = 0x34,
+		[RKCIF_DVP_FRAME_STATUS] = 0x3c,
+		[RKCIF_DVP_LAST_LINE] = 0x44,
+		[RKCIF_DVP_LAST_PIX] = 0x48,
+	},
+};
+
 static inline unsigned int rkcif_dvp_get_addr(struct rkcif_device *rkcif,
 					      unsigned int index)
 {
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
index 5c58088dd348..4bd72d41ec2f 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-capture-dvp.h
@@ -13,6 +13,7 @@
 #include "rkcif-common.h"
 
 extern const struct rkcif_dvp_match_data rkcif_px30_vip_dvp_match_data;
+extern const struct rkcif_dvp_match_data rkcif_rk3568_vicap_dvp_match_data;
 
 int rkcif_dvp_register(struct rkcif_device *rkcif);
 
diff --git a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
index 285676445e44..44566d7e58d7 100644
--- a/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
+++ b/drivers/media/platform/rockchip/rkcif/rkcif-dev.c
@@ -47,6 +47,7 @@ static const char *const rk3568_vicap_clks[] = {
 static const struct rkcif_match_data rk3568_vicap_match_data = {
 	.clks = rk3568_vicap_clks,
 	.clks_num = ARRAY_SIZE(rk3568_vicap_clks),
+	.dvp = &rkcif_rk3568_vicap_dvp_match_data,
 };
 
 static const struct of_device_id rkcif_plat_of_match[] = {

-- 
2.39.5



