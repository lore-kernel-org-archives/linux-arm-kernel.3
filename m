Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C16DC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 13:35:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8RgXOq2Vm8JL4DrDgHl/mbGF/SqH+2UKsZvpUgVtjO8=; b=MDpRralTa8gzzfaMXfIUGlK8Bd
	dp0NftysrbXdAxzAYZnNd7n+M61tyDpT/C8e+wmGYF7da+uYW84X6bxWOzS3Ml5EUpphKkqIOzNxT
	aoYhSHsepNvuj+v4pxTC290F4bjqRNet5AuF0Ae/25kks0rkcFUu0wKrQgsDn99tweU4ifS22srsh
	3Nhu1grxgIfFmmIbuftDMz0gUjr0LvDOKKpWabnVZ9VenVTBzOeWUpKNKmVvAOg8KTYfaUbBt2ivp
	Cqsb6gZRnSWAueEK7I+4JO9e0lg3H5KtKjlmpB4Y7MsnCfoCmb0ZcDunuljyws6vbVIBGzJpvlTto
	XHSJAvuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRswv-0000000AKEL-0Imn;
	Wed, 18 Jun 2025 13:35:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtU-0000000A7hN-49BV
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 12:27:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=8RgXOq2Vm8JL4DrDgHl/mbGF/SqH+2UKsZvpUgVtjO8=; b=Do0LGkHS/wmaZ4XPhdhyn30wdZ
	EVBdaJhQT4R6ZEPDbB2jI/8IKySZxIgxLEbpwsDaXO8i9XPLILO8aAQ4tKmFY8s3FwL+ZyC6vr74v
	fxzui6meH7rrW68TOZDFVArBtsMUNRD+wm4xctbZVf6rAHjgIZJCCS2E5YIbqS2bWGEeVv3/18FvS
	ftjGPq+4YM//6MuKs2RfE10ocKokrgZJID8j5gcM7zuN1ZCLORoq0Wt/apjOY7LoMQeVJUNV5AIWP
	6nXkU0ZVka2P7jdvHu9TNwJfOc7RM0o/ddBVtx6SGyobXeWVjWPpVklFQ5mFkgXePfTk2oflkaxMV
	T022q2XA==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRrtS-0000000420X-2rox
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 12:27:56 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 4335421247;
	Wed, 18 Jun 2025 12:27:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RgXOq2Vm8JL4DrDgHl/mbGF/SqH+2UKsZvpUgVtjO8=;
	b=bPTGJpt9UHPwVnLrwPNauuYg1BTT9lau/wPoahl8jyYs+PBL+3tVJgvj7PRQfVVzLSrn9O
	hjpCmyebsuAxRQ3P2ZjIlRQ58+ju/+tZnh791AeQ7r1ar4KrKRG+JtYiIdBtEq2k9/Od2u
	XI6O3ggaanABqOgAlZqrF/eCuvD1U6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RgXOq2Vm8JL4DrDgHl/mbGF/SqH+2UKsZvpUgVtjO8=;
	b=7+ijGGznd8H3I1VIEeydbUqinndGyUJriA+AeANDWC/rOwZAqetpEWJUdyPjZcZSEooYAs
	a7meKP5Q2eTXS1Aw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1750249660; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RgXOq2Vm8JL4DrDgHl/mbGF/SqH+2UKsZvpUgVtjO8=;
	b=bPTGJpt9UHPwVnLrwPNauuYg1BTT9lau/wPoahl8jyYs+PBL+3tVJgvj7PRQfVVzLSrn9O
	hjpCmyebsuAxRQ3P2ZjIlRQ58+ju/+tZnh791AeQ7r1ar4KrKRG+JtYiIdBtEq2k9/Od2u
	XI6O3ggaanABqOgAlZqrF/eCuvD1U6M=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1750249660;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8RgXOq2Vm8JL4DrDgHl/mbGF/SqH+2UKsZvpUgVtjO8=;
	b=7+ijGGznd8H3I1VIEeydbUqinndGyUJriA+AeANDWC/rOwZAqetpEWJUdyPjZcZSEooYAs
	a7meKP5Q2eTXS1Aw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 8EF4A13721;
	Wed, 18 Jun 2025 12:27:39 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id IDy0IbuwUmg4UgAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 18 Jun 2025 12:27:39 +0000
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
Subject: [PATCH 08/12] backlight: as3711_bl: Include <linux/of.h>
Date: Wed, 18 Jun 2025 14:16:40 +0200
Message-ID: <20250618122436.379013-9-tzimmermann@suse.de>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250618122436.379013-1-tzimmermann@suse.de>
References: <20250618122436.379013-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-5.30 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	FREEMAIL_TO(0.00)[kernel.org,gmail.com,linaro.org,oss.qualcomm.com,linux.intel.com,ffwll.ch,jannau.net,redhat.com,rosenzweig.io,gompa.dev,gmx.de,diasemi.com,skole.hr];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	R_RATELIMIT(0.00)[to_ip_from(RLc48bcaq7qz9wekwjsx9fywoc)];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FREEMAIL_ENVRCPT(0.00)[gmail.com,gmx.de]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_132754_890874_997BB710 
X-CRM114-Status: UNSURE (   8.38  )
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

Include <linux/of.h> to declare various OF helpers. Avoids dependency
on backlight header to include it.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/video/backlight/as3711_bl.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/video/backlight/as3711_bl.c b/drivers/video/backlight/as3711_bl.c
index 9f89eb19894e..753160bbc3e7 100644
--- a/drivers/video/backlight/as3711_bl.c
+++ b/drivers/video/backlight/as3711_bl.c
@@ -13,6 +13,7 @@
 #include <linux/kernel.h>
 #include <linux/mfd/as3711.h>
 #include <linux/module.h>
+#include <linux/of.h>
 #include <linux/platform_device.h>
 #include <linux/regmap.h>
 #include <linux/slab.h>
-- 
2.49.0


