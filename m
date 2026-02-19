Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DCFFC531E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:55:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=rb4auJXP+QCfWH3ANOoL4dRGEJWizRw0Mek7tVIJigs=; b=T0g0NuJLU1cY8X4UX6XlpJNpvD
	beGb578imPi9Z4CFgw7T4hPao3ky1j+VAIb6tTID3M02L3sqdxgBpnXRMdMnHGV1zO+6UF9+ru9z/
	ctvT/l1ws+kuFSN7xW/TViuqmaLNuDBliVuC0LX2zdSvRyZMh9rYgiiRxyC/TKwKWt3YFob4ZpYPH
	rvWkoEfSAHCMDhXqCGPSKdr1xRRPAnZMDIGCLZcM4ABnKR/3Yr+/AZr9AzhJS5kM2ljXPbFGJiB62
	xfsc7JBpJBpJy0BQFFMShjqoKR0w2hfUR9CgQvjjS2tVqSvh6yM61pcDpFm5lRlrzIIxen7q6kvMV
	q9rXDodw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBzZ-0000000C7CC-25Im;
	Thu, 19 Feb 2026 21:55:25 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBzZ-0000000C7Bz-0Is4;
	Thu, 19 Feb 2026 21:55:25 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH v2] drm/sun4i: fix kernel-doc warnings in sunxi_engine.h
Date: Thu, 19 Feb 2026 13:55:24 -0800
Message-ID: <20260219215524.468142-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Correct the kernel-doc notation, add a missing struct member comment,
and add a missing "Returns:" function comment to eliminate kernel-doc
warnings:

Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:116 Incorrect use of
 kernel-doc format: * @mode_set
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:125 struct member 'mode_set'
 not described in 'sunxi_engine_ops'
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:144 struct member 'list'
 not described in 'sunxi_engine'
Warning: drivers/gpu/drm/sun4i/sunxi_engine.h:168 No description found
 for return value of 'sunxi_engine_layers_init'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
---
v2: add Reviewed-by & resend

Cc: Chen-Yu Tsai <wens@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: Samuel Holland <samuel@sholland.org>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-sunxi@lists.linux.dev
---
 drivers/gpu/drm/sun4i/sunxi_engine.h |    7 +++++--
 1 file changed, 5 insertions(+), 2 deletions(-)

--- linux-next-20260218.orig/drivers/gpu/drm/sun4i/sunxi_engine.h
+++ linux-next-20260218/drivers/gpu/drm/sun4i/sunxi_engine.h
@@ -114,7 +114,7 @@ struct sunxi_engine_ops {
 	void (*vblank_quirk)(struct sunxi_engine *engine);
 
 	/**
-	 * @mode_set
+	 * @mode_set:
 	 *
 	 * This callback is used to set mode related parameters
 	 * like interlacing, screen size, etc. once per mode set.
@@ -131,6 +131,7 @@ struct sunxi_engine_ops {
  * @node:	the of device node of the engine
  * @regs:	the regmap of the engine
  * @id:		the id of the engine (-1 if not used)
+ * @list:	engine list management
  */
 struct sunxi_engine {
 	const struct sunxi_engine_ops	*ops;
@@ -140,7 +141,6 @@ struct sunxi_engine {
 
 	int id;
 
-	/* Engine list management */
 	struct list_head		list;
 };
 
@@ -163,6 +163,9 @@ sunxi_engine_commit(struct sunxi_engine
  * sunxi_engine_layers_init() - Create planes (layers) for the engine
  * @drm:	pointer to the drm_device for which planes will be created
  * @engine:	pointer to the engine
+ *
+ * Returns: The array of struct drm_plane backing the layers, or an
+ *		error pointer on failure.
  */
 static inline struct drm_plane **
 sunxi_engine_layers_init(struct drm_device *drm, struct sunxi_engine *engine)

