Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE8DCC02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:48:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=; b=LFfkSAa+WWoqrllShyUk9cKIHt
	FByxC1FR1QHJMWZeTD6EhDUrDHdwabrx/QdagS2ynwUU3vQ+SzL8C5mt6qxVwiHstIIY0Kj89M6L+
	pipuQh5K3iAg46BmpEF7kpOtBmRTc/duYrwMEuGVas/S39r3zTPMx+ODCfgkOikXW9QkEnrlkJr0h
	lOydt7QTNT2Zderl0rXUKgqxa0Ljim5aOQ9zOCGaFQx7RhxyWAdJaNBXJjjbpGTwE0bTOYw8ImaCc
	VTwp3i/AX9T5Trqti3YhpxUup/oACA7xN27klH55MDF3wuKW6TV2NTSLpgri1BNDc7nCsUrGwjgX7
	IMnkGFRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetzd-0000000F9kM-3QPX;
	Mon, 03 Feb 2025 10:47:53 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teth0-0000000F7QB-28W7
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=; b=RSHB6J15nvht9DdwtIWNdU8Ypk
	vMLXKTPjuRsCxlNawmb8njXclPDU/5FOSFu9CEmoJwMHkk/LbOI4NuNu7SrKy4RsAfQ9DbgAvnB9n
	VRv/oulrqn55ZilF3k4m9dqJJN0m/JtHIO462+iUptiuUhAMUojrHJe4qpHGpynZ5PeC61uphiX5j
	zF+BX4ZIZ+/gqaUdUbarCKAz6MOitanqgHvUSw1nQiDklqDtwjPnUBFA8FX8GqY9nM70dQ25AOXho
	RRFk4vlYeUnVLilZ1fJy7rhN+3gt2ONI+WHiNz64DkEbGBD5fe8lf6LLJlOLHGEqo+FhInkDfWUzG
	Pn3oL6VQ==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgw-0000000G3pv-3Peg
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:37 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 16B7A1F38F;
	Mon,  3 Feb 2025 10:28:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578508; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=y2kiDFQh8FS3sbgOBnGNwjNbNhvzHozDVPNByMSsLI5hhktN7HD3g3Rs78FdOHVqLUCabZ
	WA2M50OvnJZRHfgkg+kpvoQ7f4la2J08ZFruuH8+6tHeLwdQAVFd3TZ0noD2sxqM6qVx1z
	LuxR6TfoRRR6ptID0HLfH1QRbgYpf8Y=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578508;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=E7nPughJi/dc4KRWyhWU6/OxAN6M77uRCJxXzxoh/538KKb0mbmg/bB4m1ZpDJtePB9fUQ
	rd/AEKkpz1iRvNDw==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578504; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=RczhdfHqsN2OXR8RcctDeOQQ82NtnYSEUoBvHRO2Qd5cM8p/W+p8EN0+ah+lgv3LUtYuyx
	y68Aof83rkUtmUwYjIdp506ITcBQaZ0ge4t+vIWq9sYOgDUok4yjK+Cr5/sbiLyaoDcCvc
	XuEMkk2lURlYwzl3Myy79Pcb2zBFMGY=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578504;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=nLSzGwXdhOZPlEdl06Qid/R1NcEi8kZ3F3GMl7r9kco=;
	b=+Z4iZ2UX4gDee8pSXAKTRqP9nttA0DS8kDHhHWfG1yTmeTXoEUYlc2RDKj8orPNBcAt9CC
	WgemUkcuG4U5zyAQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id BD6A613AF1;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id APrsLEeaoGfwcwAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Mon, 03 Feb 2025 10:28:23 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: daniel@zonque.org,
	haojian.zhuang@gmail.com,
	robert.jarzmik@free.fr,
	linux@armlinux.org.uk,
	krzk@kernel.org,
	alim.akhtar@samsung.com
Cc: linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 2/2] ARM: s3c: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 11:26:36 +0100
Message-ID: <20250203102818.56747-3-tzimmermann@suse.de>
X-Mailer: git-send-email 2.48.1
In-Reply-To: <20250203102818.56747-1-tzimmermann@suse.de>
References: <20250203102818.56747-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	SUSPICIOUS_RECIPS(1.50)[];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FROM_HAS_DN(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[10];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[zonque.org,gmail.com,free.fr,armlinux.org.uk,kernel.org,samsung.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102835_006936_83BAD3AB 
X-CRM114-Status: UNSURE (   9.89  )
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

These ARM architecture's source files do not require <linux/fb.h>.
Remove the include statements.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/arm/mach-s3c/devs.c                   | 1 -
 arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c | 1 -
 2 files changed, 2 deletions(-)

diff --git a/arch/arm/mach-s3c/devs.c b/arch/arm/mach-s3c/devs.c
index 8c26d592d2a3f..bab2abd8a34ae 100644
--- a/arch/arm/mach-s3c/devs.c
+++ b/arch/arm/mach-s3c/devs.c
@@ -19,7 +19,6 @@
 #include <linux/slab.h>
 #include <linux/string.h>
 #include <linux/dma-mapping.h>
-#include <linux/fb.h>
 #include <linux/gfp.h>
 #include <linux/mmc/host.h>
 #include <linux/ioport.h>
diff --git a/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c b/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
index cfa34b55ca214..c3269cd6a8486 100644
--- a/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
+++ b/arch/arm/mach-s3c/setup-fb-24bpp-s3c64xx.c
@@ -9,7 +9,6 @@
 
 #include <linux/kernel.h>
 #include <linux/types.h>
-#include <linux/fb.h>
 #include <linux/gpio.h>
 
 #include "fb.h"
-- 
2.48.1


