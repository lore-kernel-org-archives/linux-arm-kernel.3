Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2313DC53200
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 10:41:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:From:Cc:To:Subject:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=m/tVY747qQcUbCWoM+r9JhmavpQYiLXvZynECqzDeco=; b=a70/nFqGUd0SOXnZ6ctb6r3z2o
	UBYJxk3xcJcX7mGrC0AiD4ddPGDzDFtrYl9UD+wVqv0/AQ+x05wGTOisfly3AWevGbzcpJ8Fzi4VF
	95G0ygFhQ5JdUACscCsfuGG5xQj9OtYZM9mA6TO24/dXitFsYJLCHhZZfoPbwSNcJE2LdpkVO0Owx
	MOvr5yXvh2AS3Jsz9Xb2CowwnPdJMMJIk3Sswm1Vo45B4NS8tHNLgFTGx/PFrySbWql/aiPRXRNyp
	AqqML0eib04cO6ATQu1+6RBCKzhEX07VCfKaExU2bqPqTg/TGiaJKgrhObongOyIhokF2uc6C2qLp
	c9Jj6z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1jO-00000007Zbm-20vw;
	Wed, 29 Jul 2026 10:41:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wp1jN-00000007ZbZ-0U3e
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 10:41:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 32E86600B1;
	Wed, 29 Jul 2026 10:41:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5EF991F000E9;
	Wed, 29 Jul 2026 10:41:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785321703;
	bh=m/tVY747qQcUbCWoM+r9JhmavpQYiLXvZynECqzDeco=;
	h=Subject:To:Cc:From:Date;
	b=U5FprOVUlnP1TM3/fXxzl5Iu/4Vur+YDLVHuTSa9mUH3nWOER9fwzc/+3D41BQlXi
	 Kxy+JoVuyKKCeoHLbBBL6tV/Sj+PfkBoxJ4P7wQUB5i5f+xordCPExF1xkzRVoZCWA
	 5Qf5sT5ONFUh+amp+4W2aw7ii1Rv56FSmUAoj5rc=
Subject: Patch "drm/exynos: fbdev: Remove offset into screen_buffer" has been added to the 7.1-stable tree
To: dri-devel@lists.freedesktop.org,gregkh@linuxfoundation.org,inki.dae@samsung.com,linux-arm-kernel@lists.infradead.org,m.szyprowski@samsung.com,tzimmermann@suse.de
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Wed, 29 Jul 2026 12:39:59 +0200
Message-ID: <2026072959-cosmic-putt-d5cd@gregkh>
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

    drm/exynos: fbdev: Remove offset into screen_buffer

to the 7.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     drm-exynos-fbdev-remove-offset-into-screen_buffer.patch
and it can be found in the queue-7.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From 760bbc58c2c833dec0ee38dd959f4f2f4084fc57 Mon Sep 17 00:00:00 2001
From: Thomas Zimmermann <tzimmermann@suse.de>
Date: Mon, 11 May 2026 13:54:31 +0200
Subject: drm/exynos: fbdev: Remove offset into screen_buffer

From: Thomas Zimmermann <tzimmermann@suse.de>

commit 760bbc58c2c833dec0ee38dd959f4f2f4084fc57 upstream.

The screen_buffer field in struct fb_info contains the kernel address
of the first byte of framebuffer memory. Do not add the display offset.
This offset only describes scrolling during scanout.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Fixes: 19c8b8343d9c ("drm/exynos: fixed overlay data updating.")
Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>
Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>
Signed-off-by: Inki Dae <inki.dae@samsung.com>
Cc: dri-devel@lists.freedesktop.org
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-samsung-soc@vger.kernel.org
Cc: <stable@vger.kernel.org> # v3.2+
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 drivers/gpu/drm/exynos/exynos_drm_fbdev.c |    6 +-----
 1 file changed, 1 insertion(+), 5 deletions(-)

--- a/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
+++ b/drivers/gpu/drm/exynos/exynos_drm_fbdev.c
@@ -61,17 +61,13 @@ static int exynos_drm_fbdev_update(struc
 	struct fb_info *fbi = helper->info;
 	struct drm_framebuffer *fb = helper->fb;
 	unsigned int size = fb->width * fb->height * fb->format->cpp[0];
-	unsigned long offset;
 
 	fbi->fbops = &exynos_drm_fb_ops;
 
 	drm_fb_helper_fill_info(fbi, helper, sizes);
 
-	offset = fbi->var.xoffset * fb->format->cpp[0];
-	offset += fbi->var.yoffset * fb->pitches[0];
-
 	fbi->flags |= FBINFO_VIRTFB;
-	fbi->screen_buffer = exynos_gem->kvaddr + offset;
+	fbi->screen_buffer = exynos_gem->kvaddr;
 	fbi->screen_size = size;
 	fbi->fix.smem_len = size;
 


Patches currently in stable-queue which might be from tzimmermann@suse.de are

queue-7.1/drm-tests-shmem-set-dma-mask-to-64-bit-in-drm_gem_sh.patch
queue-7.1/drm-exynos-fbdev-remove-offset-into-screen_buffer.patch
queue-7.1/drm-tegra-fbdev-remove-offset-into-framebuffer-memory.patch

