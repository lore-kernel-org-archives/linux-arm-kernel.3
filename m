Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DBF4ACCF9E0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 21:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZP3HF3vhyPnUe3LHUw0OBghtNlsRW3cMocp4zcxxEFM=; b=CcWMplRaz1v4XIPXt3MxAu4NpX
	FZ23z2Mzsvzq4v+jRrnx8foe/hXG6LeVpJN1IoyDIRnP0DeT8fODwfEY70MGWuMjbTvED9xUZvER0
	CMWJZCSuuUuYctnkSAZhNa+0RyejHz21GwHFTqD7n/wxKikZ+SBYXk5TfTdGHRVJgwqcc//wlrVPm
	U78ovx1p1w3XMzv63dqNV8BcYHOQdOCM0xTHVWrJAWZq7SkMrs3+aGMdkL9yejgVhHZrc9Cg7WNNk
	kPm94RcBTJEYOgQHdtCN+lorJUpmc6+BjEkxn+/P7E26Vk8A8LLZglpIOcTSojQfobi5bMA8nH//5
	xfeD2A4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC35s-00000007fab-0zdb;
	Thu, 23 Oct 2025 21:43:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC35j-00000007fL5-0nuo;
	Thu, 23 Oct 2025 21:43:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=ZP3HF3vhyPnUe3LHUw0OBghtNlsRW3cMocp4zcxxEFM=; b=iU7qCm8MNExSR2X6BBgYozhoKL
	cK/SpHPxumZSLBtSJGXZK5T/gEO+hIo4GELz09xM9hI8Pdh3lacMIVgZr5MGpJEm3VnzdoL2A+jqC
	nrR23Hkh9LAv5QlSL9OjG96smkcO8Fxk61/hy3+o9YFdrWS0vTt4wpoRlf4LAPFjxsU426WpFf7w/
	dk548JUcgsO5a0bV2jpsyZsFAVYGqUTGojfTPkJ6vZXbFloHs0p00sWr1wFcMa2x+uPVPyYGel4Wc
	EUNVdfkGVwsaIfTiG1oyXz0Bp8ybgYlMb1eXk+ZPg4ov7hUoi4Je3qDW8E0J8wi/JWUUtdnyKvxpm
	ujg9JZ2w==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vC2E1-00000001n1N-3IAj;
	Thu, 23 Oct 2025 20:47:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761255802;
	bh=JQ27WDs4Qs+Tw1yXgxp2LvpgPLap1W5A/SH5OYrxPFk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=eR3i1XyT33dfWDROeudnIezrRAQmQ32KCotBoBGKZZUenvFsjProAcdbrsAAdj5G8
	 nowV4Wkw4Lwr/YKJ1jQs7n8Jp7WXrtog9dYTc4Md9J5fMo88y1jRrtWGwoZ9AGtP/m
	 izlKHOPsmsEWj9c2pC58gqZsAIySATJtelts5Qco80G3phruk18+v0c1yLViuH6OXp
	 tXkxd9N+jcQWavKfWFsUTjXcNDzTf6xAhhxq1awkME7q/OLDepjmOri/LWK8RQCbOp
	 nurFxILw3N+Oplw9NBWPeyY7vzfJqtHWbM0hPPVjWU0et+MQTesRVr60RQoiY3srBp
	 MZpajKGV/jrBA==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F2BD317E0964;
	Thu, 23 Oct 2025 23:43:19 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
To: linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Detlev Casanova <detlev.casanova@collabora.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Heiko Stuebner <heiko@sntech.de>,
	Ricardo Ribalda <ribalda@chromium.org>,
	Hans Verkuil <hverkuil@kernel.org>,
	Hans de Goede <hansg@kernel.org>,
	Yunke Cao <yunkec@google.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	James Cowgill <james.cowgill@blaize.com>,
	linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>,
	Diederik de Haas <didi.debian@cknow.org>
Subject: [PATCH v5 10/15] media: rkvdec: Support per-variant interrupt handler
Date: Thu, 23 Oct 2025 17:42:41 -0400
Message-ID: <20251023214247.459931-11-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251023214247.459931-1-detlev.casanova@collabora.com>
References: <20251023214247.459931-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_214757_952917_FA76689D 
X-CRM114-Status: GOOD (  12.70  )
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

Prepare for supporting different variants with different interrupt
managers.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 17 ++++++++++++++---
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 028ce8e1c4ca..36193cff6448 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
@@ -1218,10 +1218,9 @@ static void rkvdec_iommu_restore(struct rkvdec_dev *rkvdec)
 	}
 }
 
-static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
 {
-	struct rkvdec_dev *rkvdec = priv;
-	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	struct rkvdec_dev *rkvdec = ctx->dev;
 	enum vb2_buffer_state state;
 	u32 status;
 
@@ -1242,6 +1241,15 @@ static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
 	return IRQ_HANDLED;
 }
 
+static irqreturn_t rkvdec_irq_handler(int irq, void *priv)
+{
+	struct rkvdec_dev *rkvdec = priv;
+	struct rkvdec_ctx *ctx = v4l2_m2m_get_curr_priv(rkvdec->m2m_dev);
+	const struct rkvdec_variant *variant = rkvdec->variant;
+
+	return variant->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1261,6 +1269,7 @@ static const struct rkvdec_variant rk3288_rkvdec_variant = {
 	.num_regs = 68,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 	.capabilities = RKVDEC_CAPABILITY_HEVC,
 };
 
@@ -1268,6 +1277,7 @@ static const struct rkvdec_variant rk3328_rkvdec_variant = {
 	.num_regs = 109,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
@@ -1278,6 +1288,7 @@ static const struct rkvdec_variant rk3399_rkvdec_variant = {
 	.num_regs = 78,
 	.coded_fmts = rkvdec_coded_fmts,
 	.num_coded_fmts = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 	.capabilities = RKVDEC_CAPABILITY_HEVC |
 			RKVDEC_CAPABILITY_H264 |
 			RKVDEC_CAPABILITY_VP9,
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 77c0950a465d..0c36e8e9b0a3 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -77,6 +77,7 @@ struct rkvdec_variant {
 	size_t num_coded_fmts;
 	const struct rcb_size_info *rcb_sizes;
 	size_t num_rcb_sizes;
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
 	unsigned int capabilities;
 	unsigned int quirks;
 };
-- 
2.51.1.dirty


