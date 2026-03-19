Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8927A108E1FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:02:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=JoUlc0LSTo8dF6uEFuOUop2suPubSMHvGXGv34UfM00=; b=Ty9E1Yw+DkGJtGErheEougKnCD
	grRRHiPuoxlBTkXByR2tq49+h54u4LewHvez1WIur0iOwgkg2YtY9nWA4b2YtOFqomMcPLpM9WTKB
	83d/24ztJKKui3+ZtdlUJRDxqg5TTMjlWcXoqnQOyVo63aIwr8XNBTuSn7cCIi+KLThmCinpb6A8N
	T5A4CZBC5caMLL7JmR8feMkHV0Pm08V0MNFFZQw+y+xXx+C09roxcA/aWx1Wc2rDixHA7BesFPZEc
	mvq6muSmPhUB1E4QgQLPcGslDie490/yf+gmod03hPBluMuJyESB2vjnONgf9ffoEDB9GVgJ4ckuq
	EQrLoC1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C4b-0000000Aa5Y-2XC3;
	Thu, 19 Mar 2026 12:01:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C4Z-0000000Aa59-3rKs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:01:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E437B60134;
	Thu, 19 Mar 2026 12:01:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2F002C19424;
	Thu, 19 Mar 2026 12:01:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773921714;
	bh=8ze3C6q5LllnGGEI1XV0OfHvePlkpUv69gmHwnNnuWQ=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=J7E6P12/KI1uf7uFgZV/A/0+fxIV2yoz67pmaiSoizvS81f2un+C6TpzVxUBgnGwR
	 TWlfM5rSXWQcfsuLJ9UVUfbeqo7fNafGV67YzFdzyafLr75Hrg3rjR0PyYsNgVR9tI
	 3cYw8yYVrtmD/k1p0I4dHvX0jMzung2sfswxpyZU=
Subject: Patch "drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()" has been added to the 6.6-stable tree
To: aha310510@gmail.com,airlied@gmail.com,alim.akhtar@samsung.com,dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,inki.dae@samsung.com,krzk@kernel.org,kyungmin.park@samsung.com,linux-arm-kernel@lists.infradead.org,simona@ffwll.ch,sw0312.kim@samsung.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 13:01:24 +0100
In-Reply-To: <20260227045953.165751-2-aha310510@gmail.com>
Message-ID: <2026031924-trouble-online-c7cf@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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


This is a note to let you know that I've just added the patch titled

    drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-exynos-vidi-use-priv-vidi_dev-for-ctx-lookup-in-vidi_connection_ioctl.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-219909-greg=kroah.com@vger.kernel.org Fri Feb 27 06:00:30 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 27 Feb 2026 13:59:51 +0900
Subject: drm/exynos: vidi: use priv->vidi_dev for ctx lookup in vidi_connection_ioctl()
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Message-ID: <20260227045953.165751-2-aha310510@gmail.com>

From: Jeongjun Park <aha310510@gmail.com>

[ Upstream commit d3968a0d85b211e197f2f4f06268a7031079e0d0 ]

vidi_connection_ioctl() retrieves the driver_data from drm_dev->dev to
obtain a struct vidi_context pointer. However, drm_dev->dev is the
exynos-drm master device, and the driver_data contained therein is not
the vidi component device, but a completely different device.

This can lead to various bugs, ranging from null pointer dereferences and
garbage value accesses to, in unlucky cases, out-of-bounds errors,
use-after-free errors, and more.

To resolve this issue, we need to store/delete the vidi device pointer in
exynos_drm_private->vidi_dev during bind/unbind, and then read this
exynos_drm_private->vidi_dev within ioctl() to obtain the correct
struct vidi_context pointer.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/exynos/exynos_drm_drv.h  |    1 +
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |   14 +++++++++++++-
 2 files changed, 14 insertions(+), 1 deletion(-)

--- a/drivers/gpu/drm/exynos/exynos_drm_drv.h
+++ b/drivers/gpu/drm/exynos/exynos_drm_drv.h
@@ -199,6 +199,7 @@ struct drm_exynos_file_private {
 struct exynos_drm_private {
 	struct device *g2d_dev;
 	struct device *dma_dev;
+	struct device *vidi_dev;
 	void *mapping;
 
 	/* for atomic commit */
--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -224,9 +224,14 @@ ATTRIBUTE_GROUPS(vidi);
 int vidi_connection_ioctl(struct drm_device *drm_dev, void *data,
 				struct drm_file *file_priv)
 {
-	struct vidi_context *ctx = dev_get_drvdata(drm_dev->dev);
+	struct exynos_drm_private *priv = drm_dev->dev_private;
+	struct device *dev = priv ? priv->vidi_dev : NULL;
+	struct vidi_context *ctx = dev ? dev_get_drvdata(dev) : NULL;
 	struct drm_exynos_vidi_connection *vidi = data;
 
+	if (!ctx)
+		return -ENODEV;
+
 	if (!vidi) {
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "user data for vidi is null.\n");
@@ -386,6 +391,7 @@ static int vidi_bind(struct device *dev,
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
 	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 	struct drm_encoder *encoder = &ctx->encoder;
 	struct exynos_drm_plane *exynos_plane;
 	struct exynos_drm_plane_config plane_config = { 0 };
@@ -393,6 +399,8 @@ static int vidi_bind(struct device *dev,
 	int ret;
 
 	ctx->drm_dev = drm_dev;
+	if (priv)
+		priv->vidi_dev = dev;
 
 	plane_config.pixel_formats = formats;
 	plane_config.num_pixel_formats = ARRAY_SIZE(formats);
@@ -438,8 +446,12 @@ static int vidi_bind(struct device *dev,
 static void vidi_unbind(struct device *dev, struct device *master, void *data)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
+	struct drm_device *drm_dev = data;
+	struct exynos_drm_private *priv = drm_dev->dev_private;
 
 	del_timer_sync(&ctx->timer);
+	if (priv)
+		priv->vidi_dev = NULL;
 }
 
 static const struct component_ops vidi_component_ops = {


Patches currently in stable-queue which might be from aha310510@gmail.com are

queue-6.6/drm-exynos-vidi-use-ctx-lock-to-protect-struct-vidi_context-member-variables-related-to-memory-alloc-free.patch
queue-6.6/drm-exynos-vidi-use-priv-vidi_dev-for-ctx-lookup-in-vidi_connection_ioctl.patch
queue-6.6/drm-exynos-vidi-fix-to-avoid-directly-dereferencing-user-pointer.patch

