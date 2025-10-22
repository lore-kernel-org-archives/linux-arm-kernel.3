Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3F862CCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 16:26:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cK1eDvvGVCthDQjIbvy+AuM46tt4+Wtv0wBKdN4cB8s=; b=ApOwKKitgvLICmBpof5sGNMi0/
	HgmOGamoehCJ3WnHHOcVbtSmydXcywC6Br/3vT4o5b46026+FzihGUOdqKnIuiB1BG+criPr6Xwtv
	znfZ4DcEEO4ZgE3f3BUw3LYykgUc18munzmXvCMfn9efRbGAFWzKdxqJ7UsImI7WXuCtplAU5+hVq
	D6Zdt/059rHROG/ahG2KuGu9fZuzRANZcLC2dVoR3l2TtzKqMXaTTMuCJgOPaAJG98CqBuw200ZQg
	jI33YUrY6JobWtcxm3oJ4HLgKMdY6QqVfbKw4bAt7zfF746R7U/1BjukgG4gita1GqMgk7OuOr6rM
	GATrabgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbfK-00000003ZFi-1Sln;
	Wed, 22 Oct 2025 16:26:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBbf4-00000003Yrt-0hII;
	Wed, 22 Oct 2025 16:26:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=cK1eDvvGVCthDQjIbvy+AuM46tt4+Wtv0wBKdN4cB8s=; b=Nr9uHdY2RGEnrZUm5qX2DgCS9a
	1IiD+Pi+SVF9ONT+xEcp9/BvoPHSsOUt/O3GUKhpdJpTXRblslPr9U1t+7wkSePwyzAzOAXvuH28T
	OJoQEl/e6lMi//MHtGOTSPRi8KyarzJ+PRHAoBh4lJBZLtwbsht3GD4fQQlOHSI5rQWL7HLmMfMwJ
	Vbit2qs15wQ6gTcBCTH/79cVMARllFau9q9r8RoDYa3ConT+mrpqwQMkBYhCpeNy+BZrRI76pBmfz
	W7rKq+E7jkATTiQg4HnEvqxOPdx6TElb0CHsLqdenr7Vb1j2gMEeLJ4ssS+TL8wGZscMpw7BJGjcF
	1kaJrEqg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBanJ-00000000gQM-2dSe;
	Wed, 22 Oct 2025 15:30:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761150358;
	bh=dAFQDps3eAP+w+7ZBAZcwTH8VtKHFGKFfeZJsJy7sx0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=lpVGl9kx/30E9ellazr/4+Sc+PKcpbRIBmSqb/WJXovq8sHym+ht6G3Rc5gje7rtt
	 cEJwqOkZepVREbBztWFTu8Cvgf+aJJLx5bW48mSZ+/J8yZt+CepAScyJswLGqVkNLW
	 hv3wAsrPsK5CL1CI3Q1hGnO99snrHe8pmO+MHkoOt1eNMLSX8lgIthNK1SIPvu4Rod
	 qiKWE4b5gpA4Wf5Ypx180nS4Jbg00TNm8aT7ebty0FWJ6UpSllxKY9U+rWOPEXtwP9
	 tz9iJ9DTC9GFv+jmmTkWgFE/0VFJ5UN6XP0T/GogDsJUCwpCUvvcwEOwoH4D6oEp54
	 r0+lGezxyLQ5g==
Received: from trenzalore (unknown [23.233.251.139])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 999BD17E1407;
	Wed, 22 Oct 2025 18:25:55 +0200 (CEST)
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
Subject: [PATCH v3 10/15] media: rkvdec: Support per-variant interrupt handler
Date: Wed, 22 Oct 2025 12:22:09 -0400
Message-ID: <20251022162459.271603-11-detlev.casanova@collabora.com>
X-Mailer: git-send-email 2.51.1.dirty
In-Reply-To: <20251022162459.271603-1-detlev.casanova@collabora.com>
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251022_163033_883839_D1E41218 
X-CRM114-Status: GOOD (  13.19  )
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

Preparation commit for supporting different variants with different
interrupt management.

Tested-by: Diederik de Haas <didi.debian@cknow.org>  # Rock 5B
Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/platform/rockchip/rkvdec/rkvdec.c | 15 ++++++++++++---
 drivers/media/platform/rockchip/rkvdec/rkvdec.h |  1 +
 2 files changed, 13 insertions(+), 3 deletions(-)

diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
index 5dd486edd64d..b0e90c9b826e 100644
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
+	const struct rkvdec_config *cfg = rkvdec->variant->config;
+
+	return cfg->irq_handler(ctx);
+}
+
 static void rkvdec_watchdog_func(struct work_struct *work)
 {
 	struct rkvdec_dev *rkvdec;
@@ -1260,6 +1268,7 @@ static void rkvdec_watchdog_func(struct work_struct *work)
 static const struct rkvdec_config config_rkvdec = {
 	.coded_fmts = rkvdec_coded_fmts,
 	.coded_fmts_num = ARRAY_SIZE(rkvdec_coded_fmts),
+	.irq_handler = rk3399_irq_handler,
 };
 
 static const struct rkvdec_variant rk3288_rkvdec_variant = {
diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.h b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
index 74f71542e031..dfafb2c2cbc1 100644
--- a/drivers/media/platform/rockchip/rkvdec/rkvdec.h
+++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.h
@@ -121,6 +121,7 @@ struct rkvdec_config {
 	size_t coded_fmts_num;
 	const struct rcb_size_info *rcb_size_info;
 	size_t rcb_num;
+	irqreturn_t (*irq_handler)(struct rkvdec_ctx *ctx);
 };
 
 struct rkvdec_dev {
-- 
2.51.1.dirty


