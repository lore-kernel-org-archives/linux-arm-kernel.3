Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8BE44CA6015
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 16:18:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FMMWSA/QKTLnn52v0ACbInSSIcaX6oH0iwBUW5yGZhk=; b=swk2oU1K8+KLFTihCYcWzwAQte
	W/g4PQ9cY4CMcvDIAvrWPKO2+Mb3eAERXQGAZRm6eULNND2EA91ybzcDwrgDemSk6l+R4REUxrnr4
	8Dbpgo/KE4dG3ndXThbaPFT0SJw52uXNJvOVq7WDOChJgY1aH4EbJQWgS/tjsIEuIKR5PDm8QJmg5
	Zk3xidZVl65EioBDSAYp5skCKfj1IA8FdrRcuAKjNEDL2ZRFbRYwvugV4QTvjgEUf+fNiqNhSJMLV
	HnWWQOncyLLcaDj6AiFzYLUj38rTTOtINrUB49J3wBSFdrYNwCaOW9JuVW9HigIHaYsUaEmEgA9Kr
	04+M27pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIc-00000006dkK-0BIP;
	Fri, 09 Oct 2026 16:18:22 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFDIa-00000006djF-1Q0K
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 16:18:21 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 7C17921C0F;
	Fri,  9 Oct 2026 16:18:16 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 235281368B;
	Fri,  9 Oct 2026 16:18:15 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id +fTjLccTyWrkFwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Fri, 09 Oct 2026 16:18:15 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: deller@gmx.de,
	adaplas@gmail.com,
	michal.simek@amd.com
Cc: linux-fbdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/5] fbdev: Remove use of VESA constants
Date: Fri,  9 Oct 2026 18:05:34 +0200
Message-ID: <20261009161814.120480-1-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Spamd-Bar: /
X-Rspamd-Queue-Id: 7C17921C0F
X-Rspamd-Pre-Result: action=no action;
	module=Unknown lua;
	unknown reason
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Spamd-Result: default: False [0.00 / 50.00]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_091820_528907_7F8ABD51 
X-CRM114-Status: UNSURE (   7.63  )
X-CRM114-Notice: Please train this message.
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

Fbdev and its drivers use FB_BLANK constants for controlling the display
blanking state in the fb_blank callback. Several drivers implement the
callback with VESA constants; thus mixing up semantics.

Update the drivers to use VESA constants instead.

Some background: the VESA constants describe DPMS levels for monitor
singal generation. VESA_NO_BLANKING means that the sync signals are on,
although the display adapter might not transfer meaningful pixel data.
The constants FB_BLANK_NORMAL represents this case in fbdev, while
FB_BLANK_UNBLANK represents enabled sync signal generation plus pixel
data. Fbdev drivers using VESA constants therefore often contain
off-by-one errors.

Thomas Zimmermann (5):
  fbdev/au1100fb: Use FB blanking constants
  fbdev/i810fb: Use FB blanking constants
  fbdev/sa1100fb: Remove comment on VESA DPMS modes
  fbdev/platinumfb: Use FB blanking constants
  fbdev/xilinxfb: Use FB blanking constants

 drivers/video/fbdev/au1100fb.c       | 18 ++++++++---------
 drivers/video/fbdev/i810/i810_main.c |  2 +-
 drivers/video/fbdev/platinumfb.c     |  8 +++++---
 drivers/video/fbdev/sa1100fb.c       | 29 ----------------------------
 drivers/video/fbdev/xilinxfb.c       |  2 +-
 5 files changed, 16 insertions(+), 43 deletions(-)

-- 
2.55.0


