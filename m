Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12DC5C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 14:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=; b=rkaMt1CjiORZUVaJ7dsBLWOHSh
	BhtDKz4S41oQLjM8be7GjtaU3JhxjwYK7iteBi+9VRwimAoLNAncFUYWIBlcE5/EZBd4fj0N/3Bky
	etRZhO/E/14WKcfjj2rvA+Fr+l4vTSLzzP4P+ZoN2J9C1NkCb3iTflScyTClN89e5kHkXPgJ33F4V
	P36nZ2yNwoQIWXRsyaBfAiE+VHOL/N0n+3zpUSCcHq+yWV0PTmr/k3afhLf3mznJXp89OcEcnV+Hx
	Hd43rdmApHCRGHdWM8MERQW0A/oS3NJ4blmg5E/qnu2bllIQjBVq5bgu5MWagmbanEEHgl3OM1toM
	sq8Gz08w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRto4-0000000AR4L-31hg;
	Wed, 18 Jun 2025 14:30:28 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtm-0000000A7oc-2Kwm
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:28:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=; b=POG7CT2ualC/5ocAjabQqcmGQG
	KXfd+pSEBH+fD2CcFk+l6IYk40Ozu8AjfTgZhnqRKOP0u6zSKVLzEyF6d5eFec3yIz+Ont2Grv4wP
	xULrndgCg9X90jBazrgpXp5OlRaMTn0cZJBRKUCjG/c5zIORr+g0xZVmpVpX7vefqMVy872TOIaW9
	q4EztsRMJaR7zHiIKBWlfChmUWsXJ2j7OrsfWIpV+ePpo8dn1u/G9qOAauIo3Gg2urCYal9y+WQhx
	AKgW0R9APnCyRrrgUT7o1faOtuE623CiNE1U+/KmsJEuVBAPVCD/bMfmTUpY9DyxBZpkiHZUkeauZ
	pgvuhR/w==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtj-0000000424E-2oVS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:28:14 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 0A6102124B;
	Wed, 18 Jun 2025 12:27:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
	b=sD/pSipURoAjfZDtD17C/cE7Y/2Dop4p7+Db79McXuVWx/LA5MfAUwdjhrFeRzEGgvdtXp
	0HXfebGNiVaElP/B++qsty22iiuNuNXZWxYNdQaPevXlgoSgIUpGAXGxRoNgwfYXIc2csX
	udDIhGvrVvTN6ajjBIJmjuVnHHbGMmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
	b=0ETZmOLA1urJICvFcAmLaeAr3Lh14MSgG6vJ83mcoP9sZWA0E5poFxgAQJC3DflKnpUryp
	VQaED3Lv+LR2k/DQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249663; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
	b=sD/pSipURoAjfZDtD17C/cE7Y/2Dop4p7+Db79McXuVWx/LA5MfAUwdjhrFeRzEGgvdtXp
	0HXfebGNiVaElP/B++qsty22iiuNuNXZWxYNdQaPevXlgoSgIUpGAXGxRoNgwfYXIc2csX
	udDIhGvrVvTN6ajjBIJmjuVnHHbGMmE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249663;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=+drl0inLjXtz9AJLQZmGyLJY3uS7ZnEAuIvwL9A32V0=;
	b=0ETZmOLA1urJICvFcAmLaeAr3Lh14MSgG6vJ83mcoP9sZWA0E5poFxgAQJC3DflKnpUryp
	VQaED3Lv+LR2k/DQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5EA6513721;
	Wed, 18 Jun 2025 12:27:42 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id SOPmFb6wUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:42 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: lee@kernel.org,
	danielt@kernel.org,
	jingoohan1@gmail.com,
	neil.armstrong@linaro.org,
	jessica.zhang@oss.qualcomm.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch,
	fnkl.kernel@gmail.com,
	j@jannau.net,
	hdegoede@redhat.com,
	ilpo.jarvinen@linux.intel.com,
	sven@kernel.org,
	alyssa@rosenzweig.io,
	neal@gompa.dev,
	deller@gmx.de,
	support.opensource@diasemi.com,
	duje.mihanovic@skole.hr
Cc: dri-devel@lists.freedesktop.org,
	asahi@lists.linux.dev,
	platform-driver-x86@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-fbdev@vger.kernel.org,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 12/12] backlight: Do not include <linux/fb.h> in header file
Date: Wed, 18 Jun 2025 14:16:44 +0200
Message-ID: <20250618122436.379013-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
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
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[25];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132811_821112_22BDB7C6 
X-CRM114-Status: UNSURE (   9.09  )
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

The backlight interfaces don't require anything from <linux/fb.h>, so
don't include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 include/linux/backlight.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/include/linux/backlight.h b/include/linux/backlight.h
index 10e626db7eee..f29a9ef1052e 100644
--- a/include/linux/backlight.h
+++ b/include/linux/backlight.h
@@ -10,7 +10,6 @@
 #define _LINUX_BACKLIGHT_H
 
 #include <linux/device.h>
-#include <linux/fb.h>
 #include <linux/mutex.h>
 #include <linux/types.h>
 
-- 
2.49.0


