Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AD15C02192
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Feb 2025 10:46:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=; b=Ai+eSK57Nb5Y9RboWpajIudwlS
	ZsM/BrsAFwQZZr6lrT5v3ZZNj45pOmm/SUsvQyVIEUPdpoRjiIw5eB0TLxjeTcFCFfmV8Z7Id6Fqe
	f8eeshp97MeSAN0ZVu2OwtbWb7gDWJmbxXsXAKvPkHBnVgKgvjDWusKlmMulCkiY+VtEKa96WC6Yj
	23jYheab76fn9a0OzD/X8BZJ3K+SEOcFuEWd+rRe5OeljrDlsCLuR/39S/DpCDIto7bkUnvOGMFJH
	vMjk12pJXyKUjs5TB46mSViqJy4x7VbhpLRpERTyUP9N/Lp5I3SO7B158Z2rriSuSAmF8knEqceu+
	Hckv0qWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tetyL-0000000F9cl-0RKJ;
	Mon, 03 Feb 2025 10:46:33 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1teth0-0000000F7QA-0fjE
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 03 Feb 2025 10:28:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=; b=D6lXXpDrzx7woj8CDSsLpCBwaZ
	K5NWBqRU4IQUAe6wf8jsSBxNhz4KDXiv3RRZHBFquR96ecol83J5sqZJsKlWSc8ug9fizrluLIGtX
	VrwIbDcOghUA5O37k4FPacLHzcZ7O5J+F8v7mbL6ZaDr4xFj5HvFSLIrPl8VVkaTjL6PEN+OzepLB
	C/B/LhqJaeScpjh8QHAQXk/6jYrv8BvqXYrPvsUF7pP+gGVHi/5U8R53GetNLjVP0KPMM1zLKP5CK
	u8PydWgN01yJWJMOsHAVK0J7vUzop0SkKbzs4bfxAhjJpQz0nEpjZzLnLPJD2eQc4f6z9Wwxsr2YE
	nBUkCigw==;
Received: from smtp-out1.suse.de ([2a07:de40:b251:101:10:150:64:1])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tetgw-0000000G3pu-3LPj
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Feb 2025 10:28:37 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id BC21F21163;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578507; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=dXWkVxzCOh4vfr5/QkUNxX7aJ+CEq0Ra+ZmALRxRth/8dZjHyFPaXzE5IgVj8//HDZ7Jqs
	0mOA+FBj09/r85jc1npRsZG0f3ZgRNHrK7MSuMt4ZG1s7CUV4cqzTiW0oAKrnjL4lBdqxk
	Fbx+7FoKwsWcpyhByJFR4vSn5hntbUk=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578507;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=vWfzdU6QYVcKOSt40yuCS28fkvNAgKi1BZvwb/RzZp4am4FEc94CJh/GbpjqM7YfiehGHd
	TFyL4ZbTr3bik4AQ==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1738578503; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=1k7KpsqEJhNG4ZzU7w7uzPdMzghYYJqJwRCUs6X824zXX9irrV6DXiVQZW10z0+HyMnVlL
	AtsZH4Jw5K+2yzwMOX5N9/+zTjNxvdkui5cqrI2QQGvZMCYqgGKTBeGgFBodVsyn6bp/zW
	pR/Fu/gj7X546re60pTwVRAuzXlMAcQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1738578503;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=KL0U7IWKOrxdze/x7ZWKECjoBbRrmC8WTKPCeiNWckE=;
	b=7FxEr8g7gAKQQGPVL5C2Em5F5mN3ggaVZZcNgBl8FcmrKYsAWNNoxUALma/nPryZL/6Bjr
	E6/L2iuTwuUYN6AQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 645AF13AE2;
	Mon,  3 Feb 2025 10:28:23 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id AKUWF0eaoGfwcwAAD6G6ig
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
Subject: [PATCH 1/2] ARM: spitz: Do not include <linux/fb.h>
Date: Mon,  3 Feb 2025 11:26:35 +0100
Message-ID: <20250203102818.56747-2-tzimmermann@suse.de>
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	TO_DN_SOME(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FREEMAIL_ENVRCPT(0.00)[free.fr,gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250203_102834_954965_09758B9B 
X-CRM114-Status: UNSURE (   9.85  )
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

This ARM architecture's source file does not require <linux/fb.h>.
Remove the include statement.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 arch/arm/mach-pxa/spitz.h | 1 -
 1 file changed, 1 deletion(-)

diff --git a/arch/arm/mach-pxa/spitz.h b/arch/arm/mach-pxa/spitz.h
index 04828d8918aa3..873844194a318 100644
--- a/arch/arm/mach-pxa/spitz.h
+++ b/arch/arm/mach-pxa/spitz.h
@@ -12,7 +12,6 @@
 #endif
 
 #include "irqs.h" /* PXA_NR_BUILTIN_GPIO, PXA_GPIO_TO_IRQ */
-#include <linux/fb.h>
 
 /* Spitz/Akita GPIOs */
 
-- 
2.48.1


