Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46DC5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 06:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R4vXmBoQx455fo8nzfOTmc1R6/NEVlJfu7yo2Iqr0h4=; b=nAWH6/bqBhxMH/lo44m3W/bGMq
	AEwI7HywD2g3RAu6ctdenPgOHHsSDMXbfP0xEqvj+sa6359kaqO1rJIUpJ5HnuzjlcptK6FaY7YP8
	n5C84iqto/8jZgkYWFtloYaaMRsaQ9jdy4hksSwvtyFyBGSsoj3MjlL/q5wHHlSGKNtIcoAuexjU0
	gvRH70CEFjmG/3iB3YV2cgfqs25Tg+h32VWHiMGRn75CBm45RR17sSyEOLEw64v8W1wxK0oYZBi/h
	VA7Vi8iEHP0P+kRlHdm+65G4dUpC6yYlT3zpdZ0WXt+Wc+KigD762v7Foa8QEe29Fdu/GywH9YtfC
	0B5QXYiw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upLaG-00000001jvs-0gpZ;
	Fri, 22 Aug 2025 06:49:08 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upFdV-000000012Om-2pjy
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 00:28:06 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id CA5B7C75;
	Fri, 22 Aug 2025 02:27:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1755822425;
	bh=YoV9+i/MtGnwkLtaVKn2vEwNBz3kbWJgjgwWtrTpX7w=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lmVofQjldVwrmGpmKLa317MtNR5+7WuYpERuYvdTNpEeE4lqjhtHXn/BPFmQokXb0
	 t2yBakrWiOC9UOklyScbD5RsJdPX3W9kGSSu7R0dCZ/a0U9F9isre8TWg2A+sDqNzi
	 iZODXOb/Fx+Pt8Pdsl5Ap8cnsp2BRE2jOlg5SCwg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-media@vger.kernel.org
Cc: Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Inbaraj E <inbaraj.e@samsung.com>,
	Isaac Scott <isaac.scott@ideasonboard.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Martin Kepplinger <martink@posteo.de>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Purism Kernel Team <kernel@puri.sm>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v3 04/13] media: imx-mipi-csis: Shorten name of subdev state variables
Date: Fri, 22 Aug 2025 03:27:24 +0300
Message-ID: <20250822002734.23516-5-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.49.1
In-Reply-To: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
References: <20250822002734.23516-1-laurent.pinchart@ideasonboard.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_172805_852985_499DFBC4 
X-CRM114-Status: GOOD (  13.32  )
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

Rename sd_state to state to standardize the naming of the subdev state
variables and help shortening lines.

No functional change is intended.

Signed-off-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Reviewed-by: Frank Li <Frank.Li@nxp.com>
---
 drivers/media/platform/nxp/imx-mipi-csis.c | 16 ++++++++--------
 1 file changed, 8 insertions(+), 8 deletions(-)

diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
index 0f0863011230..894d12fef519 100644
--- a/drivers/media/platform/nxp/imx-mipi-csis.c
+++ b/drivers/media/platform/nxp/imx-mipi-csis.c
@@ -996,7 +996,7 @@ static int mipi_csis_s_stream(struct v4l2_subdev *sd, int enable)
 }
 
 static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
-				    struct v4l2_subdev_state *sd_state,
+				    struct v4l2_subdev_state *state,
 				    struct v4l2_subdev_mbus_code_enum *code)
 {
 	/*
@@ -1009,7 +1009,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 		if (code->index > 0)
 			return -EINVAL;
 
-		fmt = v4l2_subdev_state_get_format(sd_state, code->pad);
+		fmt = v4l2_subdev_state_get_format(state, code->pad);
 		code->code = fmt->code;
 		return 0;
 	}
@@ -1026,7 +1026,7 @@ static int mipi_csis_enum_mbus_code(struct v4l2_subdev *sd,
 }
 
 static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
-			     struct v4l2_subdev_state *sd_state,
+			     struct v4l2_subdev_state *state,
 			     struct v4l2_subdev_format *sdformat)
 {
 	const struct csis_pix_format *csis_fmt;
@@ -1038,7 +1038,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	 * modified.
 	 */
 	if (sdformat->pad == CSIS_PAD_SOURCE)
-		return v4l2_subdev_get_fmt(sd, sd_state, sdformat);
+		return v4l2_subdev_get_fmt(sd, state, sdformat);
 
 	if (sdformat->pad != CSIS_PAD_SINK)
 		return -EINVAL;
@@ -1076,7 +1076,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 			      &sdformat->format.height, 1,
 			      CSIS_MAX_PIX_HEIGHT, 0, 0);
 
-	fmt = v4l2_subdev_state_get_format(sd_state, sdformat->pad);
+	fmt = v4l2_subdev_state_get_format(state, sdformat->pad);
 
 	fmt->code = csis_fmt->code;
 	fmt->width = sdformat->format.width;
@@ -1090,7 +1090,7 @@ static int mipi_csis_set_fmt(struct v4l2_subdev *sd,
 	sdformat->format = *fmt;
 
 	/* Propagate the format from sink to source. */
-	fmt = v4l2_subdev_state_get_format(sd_state, CSIS_PAD_SOURCE);
+	fmt = v4l2_subdev_state_get_format(state, CSIS_PAD_SOURCE);
 	*fmt = sdformat->format;
 
 	/* The format on the source pad might change due to unpacking. */
@@ -1130,7 +1130,7 @@ static int mipi_csis_get_frame_desc(struct v4l2_subdev *sd, unsigned int pad,
 }
 
 static int mipi_csis_init_state(struct v4l2_subdev *sd,
-				struct v4l2_subdev_state *sd_state)
+				struct v4l2_subdev_state *state)
 {
 	struct v4l2_subdev_format fmt = {
 		.pad = CSIS_PAD_SINK,
@@ -1147,7 +1147,7 @@ static int mipi_csis_init_state(struct v4l2_subdev *sd,
 		V4L2_MAP_QUANTIZATION_DEFAULT(false, fmt.format.colorspace,
 					      fmt.format.ycbcr_enc);
 
-	return mipi_csis_set_fmt(sd, sd_state, &fmt);
+	return mipi_csis_set_fmt(sd, state, &fmt);
 }
 
 static int mipi_csis_log_status(struct v4l2_subdev *sd)
-- 
Regards,

Laurent Pinchart


