Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C568C61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 12:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uqU7LNDaUhamqIrDBuv/DRsU+Sh6qgbYihMr+nbt4z4=; b=QKGpN2wtooVP+9jFJGvsBPqoXP
	Vgnj/YUYXC102JrEurtYz9qBlJmuPlAvwT+AfM5F2otoK05rQOV5rQiMYt8Kh0ESUhikWZrk46UEh
	43RyCo7QdOCroRA72r59uCo6bpd73oOcqlZD/uOkzBWNHaRRr/wdz8UBVhJFT8q/RySGFow3mmf1P
	Nt49WCELyN7UrN55gUXNjCGmXBFGovRz7kAiDwgDMUIhSx5wK7zM1BAd2XjFxI6jfdS+lthyTt1wg
	sehKXyzayDU7eqGRO/JGRMNVrSpIy7GHcnV4gqAyxY+vRrv8Piy2IQLxOoVFWddLaC6A9Ov4j/OFs
	j/MilwJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jxN-0000000Eeje-0wfo;
	Wed, 02 Sep 2026 12:20:45 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1jxL-0000000Eeih-3om7
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 02 Sep 2026 12:20:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=uqU7LNDaUhamqIrDBuv/DRsU+Sh6qgbYihMr+nbt4z4=; b=eCtoJBXIFrU0moS+68RSuiGyWA
	QV4/q5q88eZ8uA0jz+cfSm9seZoEnvyOV8lf3or6cUzH9qSOo7KX721iF7Wdi4q2zOQLJ6XllIQkZ
	daFv2NLJnCOen59KbrU1xwXWAmANHBygBvXAM0AlTsiPvuFXi6Y8n1z1VgrqD/Bl4W+mN06gbn2Ye
	Nb1vnALb3M0MAYFPGxc0d9hRSXRmwtWlPLewcxdESbbBb6KK5CntG8DXOvbfD6ARaB1jirRLcL4mf
	K4ZkXKgobRBNl3ytqPlZjHbz7uQdXFckwofZN1kf8xUG6KKTTR5FIR42mIFhba+jHkAAuh8w6hxMn
	2GiY2hqg==;
Received: from smtp-out2.suse.de ([195.135.223.131])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1jxJ-0000000By0F-14O2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Sep 2026 12:20:42 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 17EE31F7E5;
	Wed,  2 Sep 2026 12:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351585; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqU7LNDaUhamqIrDBuv/DRsU+Sh6qgbYihMr+nbt4z4=;
	b=fABEGolPQiUX7Y5iMQQRCAaGAdl3UgK0fYLZXSUBGuKzMPOIdiOeVxCAEKTbgv9TtLRGOu
	xBS9KbbnC/WoKRSQIz0pZuEkPSUeO+ZqKF3HQcycn4gQm+Or3N+Tg4A+PnbS1W2ngvpVp5
	wFPRr2Q1VbCHjKe1xwnzMnKgiAnB5o4=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351585;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqU7LNDaUhamqIrDBuv/DRsU+Sh6qgbYihMr+nbt4z4=;
	b=OIOc54dTlvUVaZPITACUrfGJANbPMVKDRPdyaB4FTwfQsoEKH+EcuwPZ3mzXfIbr6gABqC
	9Is4fJ61jWdT+aBA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788351581; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqU7LNDaUhamqIrDBuv/DRsU+Sh6qgbYihMr+nbt4z4=;
	b=J7PVk+xz7/hzHxEtxCDAW2H6sG0Uzd/E1+U0blsnB8h2CpDIUDr6CTY9vhsqmeVfejePfo
	VRHJPoGVZgBxv0ncL/yKHMGE3S+RitSO+GKLDejMpprXmr4VtwV0WrCvHd8wcAila16vwJ
	LZCRbk+O1Rx2WUOd13I9z0j9vEmHq1I=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788351581;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=uqU7LNDaUhamqIrDBuv/DRsU+Sh6qgbYihMr+nbt4z4=;
	b=xOXEliYUjh+QaAOfFBZxoHLYHrG/HLy0V024NTviQimFr7dajcUjjKInZvg8mXx6wpd3f8
	XFw3biwloT7q9fCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 752701393C;
	Wed,  2 Sep 2026 12:19:38 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id MAAtG1oUmGqxEAAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 02 Sep 2026 12:19:38 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	javierm@redhat.com,
	airlied@gmail.com,
	simona@ffwll.ch,
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v3 07/14] drm/panic: Return from screen_user if display is too small
Date: Wed,  2 Sep 2026 14:13:15 +0200
Message-ID: <20260902121930.597222-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260902121930.597222-1-tzimmermann@suse.de>
References: <20260902121930.597222-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spamd-Result: default: False [-6.80 / 50.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-0.999];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[22];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,ffwll.ch,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,suse.de:email,suse.de:mid];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	RCVD_TLS_ALL(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLqirfcw6gnbcr9a9yhi49fhi6)];
	FREEMAIL_ENVRCPT(0.00)[gmail.com]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_132041_367917_7389ED1B 
X-CRM114-Status: GOOD (  14.64  )
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

Return an error if the display is too small to display at least a
single character. If the panic handler cannot display any message
it does at least not destroy the current output, which might help
with identifying the problem.

This change duplicates the logic from screen_kmsg output.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_panic.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index f597ef04c5bc..c317afc76669 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -486,7 +486,7 @@ static int draw_panic_screen_user(struct drm_scanout_buffer *sb, u32 fg_color, u
 	struct drm_rect r_screen, r_logo, r_msg;
 	unsigned int msg_width, msg_height;
 
-	if (!font)
+	if (!font || font->width > sb->width)
 		return -EINVAL;
 
 	fg_color = drm_draw_color_from_xrgb8888(fg_color, sb->format->format);
-- 
2.55.0


