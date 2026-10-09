Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01602CA601E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:18:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VW80Q5EQl5XvmEzb+FrtTBSgE0wES1VkTBBR/xoXqak=; b=zfmbaWHERbqPKQP3dSwtdK2aA0
	f9gVaXz6LLZ7YH8Su8OJo/3G9BN6tx1S1oM/pIqqWC0f8XLJRcAhDMr3+dPQiV3JNuBtwt90qv25I
	fWJw7cnaVEGnpR2UDfXZzIKfY7lQ9NGvgS5FUU+lRwf3rqPmeTtLCTbkGQ2V8CE81j1bS9X9CXb1+
	wNU+lCs5lrfEsffSosjOzWJWcKrEY3bcbq3WZ+aGe69yigrhFuNH6hEEG23LjpUl3pwzfCskKXtqU
	8CDc5A5V6ON12qKbEhf9ySMxE3tllHZaeCsOpK0q55qiGXihvIaEk0WX6kdmgtnb/yqQVeNfZRGbg
	efKrl5Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIo-00000006doA-1ehn;
	Fri, 09 Oct 2026 16:18:34 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIh-00000006dli-1Jj5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:18:30 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 45CD61F7E4;
	Fri,  9 Oct 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp-out2.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id E7A2C13978;
	Fri,  9 Oct 2026 16:18:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +fTjLccTyWrkFwAAD6G6ig:T4
	(envelope-from <tzimmermann@suse.de>); Fri, 09 Oct 2026 16:18:16 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	adaplas@gmail.com,
	michal.simek@amd.com
Cc: linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/5] fbdev/sa1100fb: Remove comment on VESA DPMS modes
Date: Fri,  9 Oct 2026 18:05:37 +0200
Message-ID: <20261009161814.120480-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161814.120480-1-tzimmermann@suse.de>
References: <20261009161814.120480-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 45CD61F7E4
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091827_937028_0ED9E68E 
X-CRM114-Status: GOOD (  17.17  )
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

Fbdev and its drivers use FB_BLANK constants for controlling the
display's blanking state. Semantics differ to similar VESA blanking
constants.

Remove the comment on VESA constants from sa1100fb. It's misleading at
best, as the driver should never use the VESA constants for blanking.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/sa1100fb.c | 29 -----------------------------
 1 file changed, 29 deletions(-)

diff --git a/drivers/video/fbdev/sa1100fb.c b/drivers/video/fbdev/sa1100fb.c
index fea0172c45b5..8102ab7d51e6 100644
--- a/drivers/video/fbdev/sa1100fb.c
+++ b/drivers/video/fbdev/sa1100fb.c
@@ -491,35 +491,6 @@ sa1100fb_set_cmap(struct fb_cmap *cmap, int kspc, int con,
 }
 #endif
 
-/*
- * Formal definition of the VESA spec:
- *  On
- *  	This refers to the state of the display when it is in full operation
- *  Stand-By
- *  	This defines an optional operating state of minimal power reduction with
- *  	the shortest recovery time
- *  Suspend
- *  	This refers to a level of power management in which substantial power
- *  	reduction is achieved by the display.  The display can have a longer
- *  	recovery time from this state than from the Stand-by state
- *  Off
- *  	This indicates that the display is consuming the lowest level of power
- *  	and is non-operational. Recovery from this state may optionally require
- *  	the user to manually power on the monitor
- *
- *  Now, the fbdev driver adds an additional state, (blank), where they
- *  turn off the video (maybe by colormap tricks), but don't mess with the
- *  video itself: think of it semantically between on and Stand-By.
- *
- *  So here's what we should do in our fbdev blank routine:
- *
- *  	VESA_NO_BLANKING (mode 0)	Video on,  front/back light on
- *  	VESA_VSYNC_SUSPEND (mode 1)  	Video on,  front/back light off
- *  	VESA_HSYNC_SUSPEND (mode 2)  	Video on,  front/back light off
- *  	VESA_POWERDOWN (mode 3)		Video off, front/back light off
- *
- *  This will match the matrox implementation.
- */
 /*
  * sa1100fb_blank():
  *	Blank the display by setting all palette values to zero.  Note, the
-- 
2.55.0


