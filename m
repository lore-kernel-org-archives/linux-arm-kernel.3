Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A316C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:46:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=B6ggq/pyh8BruG6Tby5lwo74ycAmxn0aHxBaO86kD1g=; b=DvUyPxya6mQ63JdBMhC2Xz1PxL
	3lQoiiMgRuyGZRGpOH6BOoZEpmlRbdI+kWxGegnXL37bSJYdo2zp+gOWmbx80m1srppLGC6Y54ZF7
	CcL49TS+Dfq3YD7MUlgqps8wrFUWfF6M+yl0eujglIgQg7kSMs/oFkQ6TMzdicslpmXYRb9ttqQD5
	tDBDobv0QrXxzm7UFDsa8+nfTc08y555mVfOlUHCjM9kBNA5ialyQrc/+hnFuv9FFFLCnOk0RSBl/
	3DhJ2kG4TdO1HwdZprKyYeLU+stbPzlUm8frBjnL37u4uZBS+7Yi+b9xSUBAMWMKyUwWPmgTbOEWo
	kVi15VIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thU7X-0000000015I-3HDt;
	Mon, 10 Feb 2025 13:46:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTvR-0000000HZQR-1mCL;
	Mon, 10 Feb 2025 13:34:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 166F2A41520;
	Mon, 10 Feb 2025 13:32:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D57F3C4CEDF;
	Mon, 10 Feb 2025 13:34:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739194452;
	bh=4DlgjSFn0QMI0/1fBAnmN1oPlM4e+NJXY8IGyYSczYg=;
	h=Subject:To:Cc:From:Date:From;
	b=hkqM0yZCcGvDRgZm0ohqlfG9AUa7eo59gb8+yadmRgZVRT5iED/tr074szp6NrWYO
	 wtR6v97EOFghQuzFFG174UgVkatNWrYUMzm3eqFbt6KLPljqGKNVRmYCV7luCoUnBV
	 aHEtkJFH6w76nZ81TA6PH9htajFvW1kcvEnR+tI0=
Subject: Patch "drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()" has been added to the 6.13-stable tree
To: andy.yan@rock-chips.com,dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,groeck@chromium.org,heiko@sntech.de,hjc@rock-chips.com,linux-arm-kernel@lists.infradead.org,linux-rockchip@lists.infradead.org,tzimmermann@suse.de,zyw@rock-chips.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 10 Feb 2025 14:31:47 +0100
Message-ID: <2025021047-brick-cupid-ef03@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_053413_592898_2CABB354 
X-CRM114-Status: GOOD (  17.43  )
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

    drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()

to the 6.13-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
and it can be found in the queue-6.13 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 666e1960464140cc4bc9203c203097e70b54c95a Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Tue, 5 Nov 2024 14:38:16 +0100
Subject: drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 666e1960464140cc4bc9203c203097e70b54c95a upstream.

The code for detecting and updating the connector status in
cdn_dp_pd_event_work() has a number of problems.

- It does not aquire the locks to call the detect helper and update
the connector status. These are struct drm_mode_config.connection_mutex
and struct drm_mode_config.mutex.

- It does not use drm_helper_probe_detect(), which helps with the
details of locking and detection.

- It uses the connector's status field to determine a change to
the connector status. The epoch_counter field is the correct one. The
field signals a change even if the connector status' value did not
change.

Replace the code with a call to drm_connector_helper_hpd_irq_event(),
which fixes all these problems.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 81632df69772 ("drm/rockchip: cdn-dp: do not use drm_helper_hpd_irq_event")
Cc: Chris Zhong <zyw@rock-chips.com>
Cc: Guenter Roeck <groeck@chromium.org>
Cc: Sandy Huang <hjc@rock-chips.com>
Cc: "Heiko Stübner" <heiko@sntech.de>
Cc: Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-rockchip@lists.infradead.org
Cc: <stable@vger.kernel.org> # v4.11+
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
Link: https://patchwork.freedesktop.org/patch/msgid/20241105133848.480407-1-tzimmermann@suse.de
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/rockchip/cdn-dp-core.c |    9 +--------
 1 file changed, 1 insertion(+), 8 deletions(-)

--- a/drivers/gpu/drm/rockchip/cdn-dp-core.c
+++ b/drivers/gpu/drm/rockchip/cdn-dp-core.c
@@ -947,9 +947,6 @@ static void cdn_dp_pd_event_work(struct
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	struct drm_connector *connector = &dp->connector;
-	enum drm_connector_status old_status;
-
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -1009,11 +1006,7 @@ static void cdn_dp_pd_event_work(struct
 
 out:
 	mutex_unlock(&dp->lock);
-
-	old_status = connector->status;
-	connector->status = connector->funcs->detect(connector, false);
-	if (old_status != connector->status)
-		drm_kms_helper_hotplug_event(dp->drm_dev);
+	drm_connector_helper_hpd_irq_event(&dp->connector);
 }
 
 static int cdn_dp_pd_event(struct notifier_block *nb,


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-6.13/drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
queue-6.13/drm-client-handle-tiled-displays-better.patch
queue-6.13/drm-modeset-handle-tiled-displays-in-pan_display_atomic.patch
queue-6.13/drm-ast-astdp-fix-timeout-for-enabling-video-signal.patch
queue-6.13/m68k-vga-fix-i-o-defines.patch

