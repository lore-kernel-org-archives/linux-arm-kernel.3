Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82060C36002
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Mar 2025 20:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GS0DTW8urIe1mVBYAFT1ILELcujA8A8LqLBoIuElaRI=; b=E0v/Yzi7oQQ/rF847UG51on25p
	hVRG1QlIGQrG/My/U4dB9h9CG9dup4B48QTXIdIf3zzla4MvjgSdiw6lgxe4ubJFXBv5PFh0JnRty
	KlFYDj/ljV36m3+9y7s2ct7M4P51dYEqe6iQUt3FDV5jVZc39gSLEPRwSxBqIVgoz0nwzkjKNTx1q
	NxNBExiVTJ+pa3RF2n671MZmvF5uYgqQ2op0AExMNtZwBMcvJHzwbYQwUhF0NoXZcBYj1YfS1ryob
	67koYapHl9qi5y0O5f5cuVUnAvTb8DXKdxQkxEr0SSnjTSX5W8/Zc8nUIYD/g4Ttz3R1ybMW8/mGk
	WKtoZ8MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tviz3-0000000GAN3-1A76;
	Fri, 21 Mar 2025 20:28:49 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvieT-0000000G7gD-1KKP
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 21 Mar 2025 20:07:33 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=GS0DTW8urIe1mVBYAFT1ILELcujA8A8LqLBoIuElaRI=; b=IBZxlerDDrV7uABf+vzrqRioAj
	UMpanY4jmPTEaw12wAfuXnv6hw6ygPQl+eA7kOIc4h1L0yvFgV0e24oM0h/wTCIsTgGXfRH/5Ip5a
	mwZkM7abmdHNozAs/BzFB8kn0S17+v4bmd6LXxRgdbe87SvVFPlljIFQn2Q93GphP8v5gGqnRdZNz
	1bMNDzrDfiU/V5XYSzjko/Bs0ab0RFk9zw/HEnJStXGsIi//Ny1GGS40JI4/UsOhKEojvq8S8Wgea
	/wpLUDGfe7LGxpPICYk6PCr5qGCXnQv3t+6z4oCyKYaOywIxsmdMW5iIDUDPK0r7yElW33a3BQsm4
	oktPaWtg==;
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tvieP-00000004Wgt-43ue
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Mar 2025 20:07:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CA41810206773;
	Fri, 21 Mar 2025 21:07:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1742587639; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=GS0DTW8urIe1mVBYAFT1ILELcujA8A8LqLBoIuElaRI=;
	b=ZTaqmbiV6GWUzLqpmKiQCW+8deNpU3TNxYAvqgUb7GivfibYqRoLRFU7PmdpUX76XNtTK5
	SsibKYYtGFj43qbQFVnk0uXJyKU9CvCpK+v3dVs4Mo/4qAwjrjl8ksdLqU2gc5J1AywDNu
	5uk8lCJX1YrocnlB8JiVOY8Sx9V0jsCqytMNWA2gvowfl2tOJf2JAk43csHcflGkVdsBGE
	JmTS3mAZN7uC9Abcer6W4v2467gw1c7FPB2z9WbK0PjclcjS6cSDLCJjkl3XNpglOEn96n
	C7vznTE7eMXWzkUTOekiR4GJhiqfh+UqV+Idw2QiC8TPZni718gVWjwx1L8Z0A==
From: Marek Vasut <marex@denx.de>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@denx.de>,
	Frank Li <Frank.Li@nxp.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Conor Dooley <conor+dt@kernel.org>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Sebastian Reichel <sre@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Simona Vetter <simona@ffwll.ch>,
	Steven Price <steven.price@arm.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev
Subject: [PATCH v2 8/9] drm/panthor: Add i.MX95 support
Date: Fri, 21 Mar 2025 21:05:58 +0100
Message-ID: <20250321200625.132494-9-marex@denx.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250321200625.132494-1-marex@denx.de>
References: <20250321200625.132494-1-marex@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250321_200730_219706_9749F958 
X-CRM114-Status: GOOD (  14.18  )
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

The instance of the GPU populated in Freescale i.MX95 is the
Mali G310, add support for this variant.

Reviewed-by: Frank Li <Frank.Li@nxp.com>
Signed-off-by: Marek Vasut <marex@denx.de>
---
Cc: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Liviu Dudau <liviu.dudau@arm.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Sebastian Reichel <sre@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Steven Price <steven.price@arm.com>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
V2: - Add RB from Frank
    - Switch from fsl, to nxp, vendor prefix
    - Fix up GPU_MODEL(g310, 0, 0) to GPU_MODEL(g310, 10, 4)
    - Remove code comments about MX95 and G310
---
 drivers/gpu/drm/panthor/panthor_drv.c | 1 +
 drivers/gpu/drm/panthor/panthor_gpu.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/panthor/panthor_drv.c b/drivers/gpu/drm/panthor/panthor_drv.c
index 06fe46e320738..299ec8bafdd17 100644
--- a/drivers/gpu/drm/panthor/panthor_drv.c
+++ b/drivers/gpu/drm/panthor/panthor_drv.c
@@ -1591,6 +1591,7 @@ static struct attribute *panthor_attrs[] = {
 ATTRIBUTE_GROUPS(panthor);
 
 static const struct of_device_id dt_match[] = {
+	{ .compatible = "nxp,imx95-mali" },
 	{ .compatible = "rockchip,rk3588-mali" },
 	{ .compatible = "arm,mali-valhall-csf" },
 	{}
diff --git a/drivers/gpu/drm/panthor/panthor_gpu.c b/drivers/gpu/drm/panthor/panthor_gpu.c
index 0f07ef7d9aea7..59fc1cacefcfe 100644
--- a/drivers/gpu/drm/panthor/panthor_gpu.c
+++ b/drivers/gpu/drm/panthor/panthor_gpu.c
@@ -67,6 +67,7 @@ struct panthor_model {
 }
 
 static const struct panthor_model gpu_models[] = {
+	GPU_MODEL(g310, 10, 4),
 	GPU_MODEL(g610, 10, 7),
 	{},
 };
-- 
2.47.2


