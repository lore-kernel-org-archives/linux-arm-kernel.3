Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D89CC79FAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:59:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tzsC2VzdToDvjyu2bKo4kXLJkrMvANfsE4sUyvOrhy8=; b=UcMJI8OAaZw6tu49RmfYkratRk
	KvEwIrBeAglV+dAxQQZVUJeAnWFBVwpqXitqUPXeLkuir14fL3pldtLEW2A8DmYaCNI3Lh+BZMry0
	OzbUJxm1eaY8YjkDTPLfLrH690iPSlMQ4/BoO7BThCM0urI6/9/3PvihIBNsxCkEj+Ewzy8gPcj2F
	6MYzbZPjrlkgsxvuNj6dMLBSDW4iYuZdA9337OOKdVJZmh4LRzthSjm+fMlxMjaEtn6LKynDWDTgW
	CsArXNznLL9uYYONkyD3l3Hdq92rYHeYssqRU4b+fiELz0L4hcAQZmYJqmu2RPjIES+QY8pfeK10D
	eh3FhqxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E8t-0000000BDXj-0vH4;
	Wed, 09 Sep 2026 08:58:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E8r-0000000BDXD-0tpN
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:58:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=tzsC2VzdToDvjyu2bKo4kXLJkrMvANfsE4sUyvOrhy8=; b=p10YPN7AJOj/Z53lrD4sEJvIUK
	u6Ir3HhU3tlAw6IBNDrtKH/GjKGV4ESOZbXGjJ5ypIT0ST7UwG3/KZRDEvsDs0Gm+Au2+9xW5Is2b
	q/FnwxEgaXq/vrbi8r0Am42jPQIiwvvIZVO+mzSohrBMHvO1aPtOnS56jjbIKvdJRy9TTR9c9bvMk
	68qtQe78GuhWnWv9NJCWr+rw0/X4mehPU/ZLFQ4XG5xzZzJISN7T/OJ8LPf5feKHg7idrxxx1cwFE
	damiDEHPoTgQLbFsycMrzlf7QsdAwH6Cdy4XcoYPKCNZv/1mGR2MH0iTFmhNKBdCYPIZP0ipwwURp
	w22pIgXQ==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E8g-00000000xBw-3oJK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:58:48 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 06D0F21A97;
	Wed,  9 Sep 2026 08:58:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788944317; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzsC2VzdToDvjyu2bKo4kXLJkrMvANfsE4sUyvOrhy8=;
	b=eHI8rs+776GMDBzJ34a5bdZlnsjvjcs0lF+5ZVLctnLggWCfDZ+ex0AxwTy138kvqWwLgr
	CqoxgqtR2L5T5MPUr2VlB0siOZFDJAjOErY3S7X3qi+oDvTbfXXitidyeFXRRtNZMi/IS5
	ZzoIqlPQidms3WVns+WL/909+IsdDbc=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944317;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzsC2VzdToDvjyu2bKo4kXLJkrMvANfsE4sUyvOrhy8=;
	b=kmjkCeN0ruu7nPIN6juiaryA4ErrW7Vm+oIFm23UsKil7+/vqH8wSxUaodYNa42l7WVP+5
	V7bB5GPOFrXQC2Cg==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788944313; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzsC2VzdToDvjyu2bKo4kXLJkrMvANfsE4sUyvOrhy8=;
	b=Lj87H7LDBVZ2NsyWCPLpoy96i+bQJ3cWgQujlaWN+It6Q1lPrxe1e4zKP45rVJqwpc15t0
	Jg4BB5B3i8U9oAnvQapXao0AH5Gc+PupGE3htySCpHs61h+EDCSgNfXMAkIi9qS7PGfXxa
	mqxtYW7bjSQ37KOW/sDBpZlT+hXIe5Q=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944313;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tzsC2VzdToDvjyu2bKo4kXLJkrMvANfsE4sUyvOrhy8=;
	b=CpSLXLHbGRLPeTML/GpXxwz56/9Wbv/Y6VvySDrUq7EnJTdeIi+8f4XVPJyjdRAfrrD4gv
	NWW8c+Gj2Z3AFJAw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 376751365E;
	Wed,  9 Sep 2026 08:58:32 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id 6DhBDLgfoWoVUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 09 Sep 2026 08:58:32 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	geert@linux-m68k.org,
	rdunlap@infradead.org
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	amd-gfx@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	intel-xe@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	virtualization@lists.linux.dev,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>,
	stable@vger.kernel.org
Subject: [PATCH v4 01/14] drm/panic: Do not use un-escaped URL as format string
Date: Wed,  9 Sep 2026 10:55:16 +0200
Message-ID: <20260909085826.64529-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909085826.64529-1-tzimmermann@suse.de>
References: <20260909085826.64529-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-2.80 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	RCPT_COUNT_TWELVE(0.00)[22];
	ARC_NA(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	URIBL_BLOCKED(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email,lists.freedesktop.org:email];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLhthb38qh1ntkuzcrgoc19dwi)];
	RCVD_TLS_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:mid,suse.de:email];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095843_137725_630366CA 
X-CRM114-Status: GOOD (  11.05  )
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

Replace the direct use of DRM_PANIC_SCREEN_QR_CODE_URL in snprintf()
with a %s conversion specifier. Avoids a possible vulnerabilty from
a crafted URL string.

As the attacker needs to control the kernel at the Kconfig level, the
potential for an exploit is likely low.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
Fixes: cb5164ac43d0 ("drm/panic: Add a QR code panic screen")
Cc: Javier Martinez Canillas <javierm@redhat.com>
Cc: Jocelyn Falempe <jfalempe@redhat.com>
Cc: dri-devel@lists.freedesktop.org
Cc: <stable@vger.kernel.org> # v6.12+
---
 drivers/gpu/drm/drm_panic.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index e576c4791861..ba21df4be338 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -658,7 +658,8 @@ static int drm_panic_get_qr_code_url(u8 **qr_image)
 	char *kmsg;
 	int max_qr_data_size, url_len;
 
-	url_len = snprintf(url, sizeof(url), CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL "?a=%s&v=%s&z=",
+	url_len = snprintf(url, sizeof(url), "%s?a=%s&v=%s&z=",
+			   CONFIG_DRM_PANIC_SCREEN_QR_CODE_URL,
 			   utsname()->machine, utsname()->release);
 
 	max_qr_data_size = drm_panic_qr_max_data_size(panic_qr_version, url_len);
-- 
2.55.0


