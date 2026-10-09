Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A0A5CA6019
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:18:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0m5upj+rxGyFqP6JhsDwTZZt3uyD9+5vNvJp5VBWClA=; b=OC2tAYY4SfH8RFZYUXZ2a7Wfd/
	xSW5UPwxPHA8w1REM+510TlU9VUi6270WbxwhQ8Ldw1YL34Ae7ai5LwJIPRxRiC0lmDNBAKZOKMaO
	MLXUGd805t2ygi2kdOj/OzF/FgEjWuCMh9Ra9/OghNlYgPb3DkAVpbv3Og30nMc9+wCoNWJf5AO9t
	wbMqY1b5IqfRtiIS/SDE/u1E7FxxNu30G3pPQq9NrXDeO4I+Tl+9nJBLKIhHN1f/CDRcPsyHEVEAw
	tutK7ngF5RzQ62+jUMcHKTlMtfo48HRfBgdQaTZP7VUYHz+ctdmr6mDcaojTb8xWPBVpHiRogLGAB
	P8S4riZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIl-00000006dn1-1BKR;
	Fri, 09 Oct 2026 16:18:31 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIh-00000006dlj-2uPR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:18:28 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0411921C12;
	Fri,  9 Oct 2026 16:18:17 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id A34DB1368B;
	Fri,  9 Oct 2026 16:18:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +fTjLccTyWrkFwAAD6G6ig:T3
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
Subject: [PATCH 2/5] fbdev/i810fb: Use FB blanking constants
Date: Fri,  9 Oct 2026 18:05:36 +0200
Message-ID: <20261009161814.120480-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20261009161814.120480-1-tzimmermann@suse.de>
References: <20261009161814.120480-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Result: default: False [0.00 / 50.00]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091827_943360_5E05A0DA 
X-CRM114-Status: GOOD (  11.23  )
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

Replace the VESA constant in i810fb with FB_BLANK.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/fbdev/i810/i810_main.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/video/fbdev/i810/i810_main.c b/drivers/video/fbdev/i810/i810_main.c
index 10b914a24114..f5780fd8afea 100644
--- a/drivers/video/fbdev/i810/i810_main.c
+++ b/drivers/video/fbdev/i810/i810_main.c
@@ -1623,7 +1623,7 @@ static int i810fb_resume(struct pci_dev *dev)
 			par->cursor_heap.offset);
 	i810fb_set_par(info);
 	fb_set_suspend (info, 0);
-	info->fbops->fb_blank(VESA_NO_BLANKING, info);
+	info->fbops->fb_blank(FB_BLANK_UNBLANK, info);
 fail:
 	console_unlock();
 	return 0;
-- 
2.55.0


