Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34184108E1FB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 12:01:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=4yAGIAy+KG+0AIrq04eal6s8C2PIhjqa+Yq0Lu/dCiw=; b=22gG8nJYm9GwdSCsrSTPAV2ew3
	qCr1Cesg878Jkr60+0wQLt+Uu2A8Uhf3sVxQHf09ByHUiEiphzSc11TqZ4pugWOumT1ZMKDK4g1GB
	p56o/jnPGrdHtgcT0EbH7XB7aPXSkkI5nFF5YR6OCwcEbRj5BnVPi3uFR7lD+w6EiEXwvWSCgjQHL
	mkQgv3F7I5yQtRNjDpX/t1bCycGBmKY8Q+pClkTOAGJawvvsKZZJCz+Q5c/rh2QEg0NDc3kAIR/HT
	PWSGxOQfeHDLCBC95esK4VCgxqHCis9larpKG2u4znYYsN6Yy406xcXsY+CifQb8XKYJH88GDLuZA
	vcJn3nbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C4S-0000000Aa33-27fA;
	Thu, 19 Mar 2026 12:01:48 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3C4Q-0000000Aa2j-0osr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 12:01:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E2FC0439CC;
	Thu, 19 Mar 2026 12:01:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 512A9C2BCB0;
	Thu, 19 Mar 2026 12:01:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773921705;
	bh=FI2RzMl4vqwoOgQ284Xq5uO4APyYsWh2CfzxL2lSpqE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=gPMVbTTTZDpZo1uqG/bHPeCytbq7RlFU4/vESVAGuVRtsh0kgjgPfdB7qBS4C+nB3
	 l4TCCivwe+4mf0KRA2pD5TzDjn2VF9CoVJ12VdqAK+VgEBJbm5QEgNrkFVsuRzBu/j
	 79TT/RsWbhFFxDOL1F9tuDeQFNcMl0AaHj0byrwc=
Subject: Patch "drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free" has been added to the 6.6-stable tree
To: aha310510@gmail.com,airlied@gmail.com,alim.akhtar@samsung.com,dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,inki.dae@samsung.com,krzk@kernel.org,kyungmin.park@samsung.com,linux-arm-kernel@lists.infradead.org,simona@ffwll.ch,sw0312.kim@samsung.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 13:01:24 +0100
In-Reply-To: <20260227045953.165751-4-aha310510@gmail.com>
Message-ID: <2026031923-decimal-gulp-13b4@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_050146_301345_29B5CAAB 
X-CRM114-Status: GOOD (  22.03  )
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

    drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-exynos-vidi-use-ctx-lock-to-protect-struct-vidi_context-member-variables-related-to-memory-alloc-free.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-219911-greg=kroah.com@vger.kernel.org Fri Feb 27 06:01:30 2026
From: Jeongjun Park <aha310510@gmail.com>
Date: Fri, 27 Feb 2026 13:59:53 +0900
Subject: drm/exynos: vidi: use ctx->lock to protect struct vidi_context member variables related to memory alloc/free
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Inki Dae <inki.dae@samsung.com>, Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park <kyungmin.park@samsung.com>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Krzysztof Kozlowski <krzk@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org, Jeongjun Park <aha310510@gmail.com>
Message-ID: <20260227045953.165751-4-aha310510@gmail.com>

From: Jeongjun Park <aha310510@gmail.com>

[ Upstream commit 52b330799e2d6f825ae2bb74662ec1b10eb954bb ]

Exynos Virtual Display driver performs memory alloc/free operations
without lock protection, which easily causes concurrency problem.

For example, use-after-free can occur in race scenario like this:
```
	CPU0				CPU1				CPU2
	----				----				----
  vidi_connection_ioctl()
    if (vidi->connection) // true
      drm_edid = drm_edid_alloc(); // alloc drm_edid
      ...
      ctx->raw_edid = drm_edid;
      ...
								drm_mode_getconnector()
								  drm_helper_probe_single_connector_modes()
								    vidi_get_modes()
								      if (ctx->raw_edid) // true
								        drm_edid_dup(ctx->raw_edid);
								          if (!drm_edid) // false
								          ...
				vidi_connection_ioctl()
				  if (vidi->connection) // false
				    drm_edid_free(ctx->raw_edid); // free drm_edid
				    ...
								          drm_edid_alloc(drm_edid->edid)
								            kmemdup(edid); // UAF!!
								            ...
```

To prevent these vulns, at least in vidi_context, member variables related
to memory alloc/free should be protected with ctx->lock.

Cc: <stable@vger.kernel.org>
Signed-off-by: Jeongjun Park <aha310510@gmail.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/exynos/exynos_drm_vidi.c |   43 +++++++++++++++++++++++++------
 1 file changed, 35 insertions(+), 8 deletions(-)

--- a/drivers/gpu/drm/exynos/exynos_drm_vidi.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_vidi.c
@@ -186,15 +186,17 @@ static ssize_t vidi_store_connection(str
 				const char *buf, size_t len)
 {
 	struct vidi_context *ctx = dev_get_drvdata(dev);
-	int ret;
+	int ret, new_connected;
 
-	ret = kstrtoint(buf, 0, &ctx->connected);
+	ret = kstrtoint(buf, 0, &new_connected);
 	if (ret)
 		return ret;
 
-	if (ctx->connected > 1)
+	if (new_connected > 1)
 		return -EINVAL;
 
+	mutex_lock(&ctx->lock);
+
 	/* use fake edid data for test. */
 	if (!ctx->raw_edid)
 		ctx->raw_edid = (struct edid *)fake_edid_info;
@@ -202,14 +204,21 @@ static ssize_t vidi_store_connection(str
 	/* if raw_edid isn't same as fake data then it can't be tested. */
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		DRM_DEV_DEBUG_KMS(dev, "edid data is not fake data.\n");
-		return -EINVAL;
+		ret = -EINVAL;
+		goto fail;
 	}
 
+	ctx->connected = new_connected;
+	mutex_unlock(&ctx->lock);
+
 	DRM_DEV_DEBUG_KMS(dev, "requested connection.\n");
 
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return len;
+fail:
+	mutex_unlock(&ctx->lock);
+	return ret;
 }
 
 static DEVICE_ATTR(connection, 0644, vidi_show_connection,
@@ -244,11 +253,14 @@ int vidi_connection_ioctl(struct drm_dev
 		return -EINVAL;
 	}
 
+	mutex_lock(&ctx->lock);
 	if (ctx->connected == vidi->connection) {
+		mutex_unlock(&ctx->lock);
 		DRM_DEV_DEBUG_KMS(ctx->dev,
 				  "same connection request.\n");
 		return -EINVAL;
 	}
+	mutex_unlock(&ctx->lock);
 
 	if (vidi->connection) {
 		struct edid *raw_edid;
@@ -271,20 +283,27 @@ int vidi_connection_ioctl(struct drm_dev
 					  "failed to allocate raw_edid.\n");
 			return -ENOMEM;
 		}
+		mutex_lock(&ctx->lock);
 		ctx->raw_edid = raw_edid;
+		mutex_unlock(&ctx->lock);
 	} else {
 		/*
 		 * with connection = 0, free raw_edid
 		 * only if raw edid data isn't same as fake data.
 		 */
+		mutex_lock(&ctx->lock);
 		if (ctx->raw_edid && ctx->raw_edid !=
 				(struct edid *)fake_edid_info) {
 			kfree(ctx->raw_edid);
 			ctx->raw_edid = NULL;
 		}
+		mutex_unlock(&ctx->lock);
 	}
 
+	mutex_lock(&ctx->lock);
 	ctx->connected = vidi->connection;
+	mutex_unlock(&ctx->lock);
+
 	drm_helper_hpd_irq_event(ctx->drm_dev);
 
 	return 0;
@@ -299,7 +318,7 @@ static enum drm_connector_status vidi_de
 	 * connection request would come from user side
 	 * to do hotplug through specific ioctl.
 	 */
-	return ctx->connected ? connector_status_connected :
+	return READ_ONCE(ctx->connected) ? connector_status_connected :
 			connector_status_disconnected;
 }
 
@@ -321,22 +340,24 @@ static int vidi_get_modes(struct drm_con
 	struct vidi_context *ctx = ctx_from_connector(connector);
 	struct edid *edid;
 	int edid_len;
-	int count;
+	int count = 0;
 
 	/*
 	 * the edid data comes from user side and it would be set
 	 * to ctx->raw_edid through specific ioctl.
 	 */
+
+	mutex_lock(&ctx->lock);
 	if (!ctx->raw_edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "raw_edid is null.\n");
-		return 0;
+		goto fail;
 	}
 
 	edid_len = (1 + ctx->raw_edid->extensions) * EDID_LENGTH;
 	edid = kmemdup(ctx->raw_edid, edid_len, GFP_KERNEL);
 	if (!edid) {
 		DRM_DEV_DEBUG_KMS(ctx->dev, "failed to allocate edid\n");
-		return 0;
+		goto fail;
 	}
 
 	drm_connector_update_edid_property(connector, edid);
@@ -345,6 +366,8 @@ static int vidi_get_modes(struct drm_con
 
 	kfree(edid);
 
+fail:
+	mutex_unlock(&ctx->lock);
 	return count;
 }
 
@@ -490,11 +513,15 @@ static int vidi_remove(struct platform_d
 {
 	struct vidi_context *ctx = platform_get_drvdata(pdev);
 
+	mutex_lock(&ctx->lock);
+
 	if (ctx->raw_edid != (struct edid *)fake_edid_info) {
 		kfree(ctx->raw_edid);
 		ctx->raw_edid = NULL;
 	}
 
+	mutex_unlock(&ctx->lock);
+
 	component_del(&pdev->dev, &vidi_component_ops);
 
 	return 0;


Patches currently in stable-queue which might be from aha310510@gmail.com are

queue-6.6/drm-exynos-vidi-use-ctx-lock-to-protect-struct-vidi_context-member-variables-related-to-memory-alloc-free.patch
queue-6.6/drm-exynos-vidi-use-priv-vidi_dev-for-ctx-lookup-in-vidi_connection_ioctl.patch
queue-6.6/drm-exynos-vidi-fix-to-avoid-directly-dereferencing-user-pointer.patch

