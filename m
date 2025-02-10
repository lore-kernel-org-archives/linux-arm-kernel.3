Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14942C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:44:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=/ufYBKggcB4heREVavE+DEX+yAPQSbVTOT9BdShF9jA=; b=4CHZoSgIcI2QdcrqNLgBxtZed+
	hSMKTNiC5KPQLgLqWsRhpe046HJOqV7mdskB+l3wHHNspaD3wUtqfoUHmp+71AiXF27ruZBbicQaZ
	QSs7xVgCEGif9Ynafu0Z5CdLOTgk3Y/yB5CXnCmRai79X8/mvwfCdkS53jrDxEHQNUnmC2ijIupRy
	cCLAnTnNnP5iqKdToLrgSZyr6iwDtb5Mnl8DfxYitnK2DD2oCGCsbM+j94nO9D5XqOBEMrC81ibEr
	CdYEDvRJIZtIs9M71ISkLNlfQm7NUwGs5LgKPjVwENAIbjJziuj960lWsfMaBQbkW0T34WLcE14lV
	pfo5Xdzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thU4o-000000000e0-492I;
	Mon, 10 Feb 2025 13:43:54 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thToH-0000000HXgN-3MAj;
	Mon, 10 Feb 2025 13:26:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9AB635C5638;
	Mon, 10 Feb 2025 13:26:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 756A3C4CED1;
	Mon, 10 Feb 2025 13:26:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1739194008;
	bh=1m1QDaEHyG6q7m90WPJRUqaj2pryIUO496o4eAVFo74=;
	h=Subject:To:Cc:From:Date:From;
	b=qsRiVLIrfmrZ5XcLHpZ/ZbyB1g9iD0uHYdhytSpFMMJg2jhDDYHd7/6oUn4hfwDHR
	 xNsMTln2M0yqk13mKNETcFh946YfbmpAuPi80gpVlhceq9dDOicVQjgxtG8qtnh7MR
	 vkr+KkncrProa8lgVQJpU9pXCbedYdo6FIpR+EKU=
Subject: Patch "drm/rockchip: cdn-dp: Use drm_connector_helper_hpd_irq_event()" has been added to the 6.6-stable tree
To: andy.yan@rock-chips.com,dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,groeck@chromium.org,heiko@sntech.de,hjc@rock-chips.com,linux-arm-kernel@lists.infradead.org,linux-rockchip@lists.infradead.org,tzimmermann@suse.de,zyw@rock-chips.com
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 10 Feb 2025 14:23:44 +0100
Message-ID: <2025021044-relock-outlast-1e94@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052649_930049_7575AF2E 
X-CRM114-Status: GOOD (  17.34  )
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

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
and it can be found in the queue-6.6 subdirectory.

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
@@ -946,9 +946,6 @@ static void cdn_dp_pd_event_work(struct
 {
 	struct cdn_dp_device *dp = container_of(work, struct cdn_dp_device,
 						event_work);
-	struct drm_connector *connector = &dp->connector;
-	enum drm_connector_status old_status;
-
 	int ret;
 
 	mutex_lock(&dp->lock);
@@ -1010,11 +1007,7 @@ static void cdn_dp_pd_event_work(struct
 
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

queue-6.6/drm-rockchip-cdn-dp-use-drm_connector_helper_hpd_irq_event.patch
queue-6.6/drm-modeset-handle-tiled-displays-in-pan_display_atomic.patch
queue-6.6/m68k-vga-fix-i-o-defines.patch

