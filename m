Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1F236C3ABAC
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 May 2025 15:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o0mruKA5vtuLR7OPARAzO4LhP2JZFjTk7hcdr3TCKcU=; b=Qa8PRFW7Pxhnh9YBdbApixgbBt
	4tWNXU3F7kZ+We1f1IOiqiF4CBgXlDhIb9t57qOejpVoIQy2lZ+4z5HpVH1k0ZOX+dCCo6IDwK3fV
	BIA6BtvhG9MTR6/CS9jLMiU68uxTbqqsfG2dJQ3n75kP7Y3B59qWV1S7h8sRINGkSSFc8ZtvY3VQ3
	QrZr8qXIGmUGBxzHe/nwgqCQ5uHLaguKjnFlaYfV+z10n8OE+O8rTrBnXtap0g/U0hQPxA0fxJaWn
	Gbu2GgpKKGIoWseuCEqb9cc/L8m1LI9YEVkaROcyY25B2t+HGxVVx4nLPKk8EBIJGzyDpnRKCb7PT
	HbG9cH6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAs98-00000002JJi-0hEq;
	Fri, 02 May 2025 15:17:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uAryk-00000002Ho7-2ZeM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 May 2025 15:07:08 +0000
Received: from dude02.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::28])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.felsch@pengutronix.de>)
	id 1uAryU-0004HG-7G; Fri, 02 May 2025 17:06:50 +0200
From: Marco Felsch <m.felsch@pengutronix.de>
To: nicolas.dufresne@collabora.com,
	benjamin.gaignard@collabora.com,
	p.zabel@pengutronix.de,
	mchehab@kernel.org,
	shawnguo@kernel.org,
	Sascha Hauer <s.hauer@pengutronix.de>,
	kernel@pengutronix.de,
	festevam@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	paulk@sys-base.io,
	hverkuil@xs4all.nl,
	laurent.pinchart@ideasonboard.com,
	sebastian.fricke@collabora.com,
	ming.qian@nxp.com
Cc: linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	Michael Tretter <m.tretter@pengutronix.de>
Subject: [RFC PATCH 04/11] media: uapi: add more V4L2_H264_ENCODE_FLAGs
Date: Fri,  2 May 2025 17:05:07 +0200
Message-Id: <20250502150513.4169098-5-m.felsch@pengutronix.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250502150513.4169098-1-m.felsch@pengutronix.de>
References: <20250502150513.4169098-1-m.felsch@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:1101:1d::28
X-SA-Exim-Mail-From: m.felsch@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250502_080706_660175_6F1FACBA 
X-CRM114-Status: GOOD (  10.53  )
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

From: Michael Tretter <m.tretter@pengutronix.de>

The encode flags may be written into the slice header by the hardware
encoder. User space decides if the flags are set and which features are
used, but the driver has to write it into the registers.

Signed-off-by: Michael Tretter <m.tretter@pengutronix.de>
---
 include/uapi/linux/v4l2-controls.h | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
index a8df393c9ead..152b6b0cfe78 100644
--- a/include/uapi/linux/v4l2-controls.h
+++ b/include/uapi/linux/v4l2-controls.h
@@ -1774,6 +1774,9 @@ struct v4l2_ctrl_h264_encode_params {
 #define V4L2_H264_ENCODE_FLAG_ENTROPY_CODING_MODE	0x01
 #define V4L2_H264_ENCODE_FLAG_TRANSFORM_8X8_MODE	0x02
 #define V4L2_H264_ENCODE_FLAG_CONSTRAINED_INTRA_PRED	0x04
+#define V4L2_H264_ENCODE_FLAG_NUM_REF_IDX_OVERRIDE	0x08
+#define V4L2_H264_ENCODE_FLAG_NO_OUTPUT_OF_PRIOR_PICS	0x10
+#define V4L2_H264_ENCODE_FLAG_LONG_TERM_REFERENCE	0x20
 
 #define V4L2_CID_STATELESS_H264_ENCODE_RC	(V4L2_CID_CODEC_STATELESS_BASE + 9)
 
-- 
2.39.5


