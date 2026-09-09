Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45699C79F8C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 08:59:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=; b=A8LfZhphCdua/fQrr63srxybvN
	aNhvzwJEcO7z3YmZEQoRgFtsyjn2hJ0njJyyLis1ashV3giDxm5U4/5pvb157MSk04tDUhmoA7fgD
	jMdK/MDuR3+vm0jCx3g341eGEyBWtNWVBAQLRoyuh0mZxey3zsJgsef9dW89VyvAMJEtkKCNHq0TW
	A9tQOO/e1bNOuOqOwausMYVRawd3CH0CA3s5CsdLiQR1tHwUzpehYzkuVPyZJN3i/w5JmJP0H9ZPy
	Yzj9+eBPRFW1pBspCN3UhvV1+IZmi/2pFy2H0YfZ1pHlsbOhpvJEIFzW6CU31y1+YJJn4W+dVHjCO
	fDW1OoSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E9S-0000000BDwx-0SQz;
	Wed, 09 Sep 2026 08:59:30 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4E9Q-0000000BDuz-3NdH
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 08:59:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=; b=m3lPwbpmld3YNZ8k+5sxVEA9Vp
	QsCs4iusWK85Xh9EEZayJKIxjPcEHR2b4Y5b3EBH/MjWEqoZyFTj1rVWsBYdC/UbD+0ZJQSkepyyB
	sQsYkfUw1iuezpmt9P+GneZORQzLbHZFqRwIXr5hcs5z/bDQK87ryboqxyALdR9Qy4O52RV+Tag6d
	DPvam0PI8dNcwn1XuTSSUPC3w0NOAFXHt8ecxuA1RsmjP5oy63eS/HSvwRQZKcSyxUOsUWlF3UQR/
	el/1K60eE0eIG0l2wNIOgMXKOATa3KMtw3n2wYBv6fJebaAxbmvt8Dfr+HvNdonaz8WomxoP6fScD
	mQre5ing==;
Received: from smtp-out1.suse.de ([195.135.223.130])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4E9O-00000000xNb-04Ws
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 08:59:27 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2F45721A7E;
	Wed,  9 Sep 2026 08:58:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788944326; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=1dm1xO1x3hLqRrsmVizHSExZ08U5t0vJ59xO7zwq3xHt3LAATOhHEKpTiL3uxciWMvCbPs
	8w8e73ZsrNlOZYbGexGKNE0XJ6vF2JSxro+4Mv7aIYB6kKF4dXPO9haQJ+7MYSBpnUd6fg
	RtLDXwUfhBCScXS5cO3Wj+3HTtn8gDE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944326;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=AyB9DOLf/MsVeP4truED/BqsipN0gXwRUM8uKJpuTrrmkz5mQZmznl1nmIH1JzbnP0Nso1
	14PP0j3oCMA5z3DQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=U4OeGi32;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=AorCwKKY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1788944322; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=U4OeGi32J/zKC0WnRfvdYuh7OGEVPH8zZWZh1n+7OguBQEayIbkmI4H4kQpxze9qi5rHl9
	iZm2xO0v47xQyvBGKKryLTD6hR7MwdEXAe5WSvPmM9PfnnpOkw4tP8HdChhqpRl9cdBTYw
	KXCtnJQA3+rTp4o+rMZCr12GwMqQzic=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1788944322;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/yw/+e2gzQxo9H+pdwIa/AXa45ESt2VPejHwf9N8gL4=;
	b=AorCwKKY3gSBU8990Mrshvx+tOznGvCi8rGQl7B4okGlFGOFBgRPOaKyYhMk9K0qi2ufkH
	ZFdu/y6iH8gQ/TAg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 670BB1396B;
	Wed,  9 Sep 2026 08:58:37 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id wE3GF70foWoVUQAAD6G6ig
	(envelope-from <tzimmermann@suse.de>); Wed, 09 Sep 2026 08:58:37 +0000
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
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v4 10/14] drm/panic: Restrict to primary planes
Date: Wed,  9 Sep 2026 10:55:25 +0200
Message-ID: <20260909085826.64529-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260909085826.64529-1-tzimmermann@suse.de>
References: <20260909085826.64529-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Queue-Id: 2F45721A7E
X-Rspamd-Server: rspamd1.dmz-prg2.suse.org
X-Rspamd-Action: no action
X-Spamd-Result: default: False [-3.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	MID_CONTAINS_FROM(1.00)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	URIBL_BLOCKED(0.00)[suse.de:dkim,suse.de:email,suse.de:mid,imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[21];
	TO_DN_SOME(0.00)[];
	FREEMAIL_ENVRCPT(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.de:dkim,suse.de:email,suse.de:mid];
	FREEMAIL_TO(0.00)[redhat.com,gmail.com,linux.intel.com,kernel.org,linux-m68k.org,infradead.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLo585esf9b7txaosbn5shab9z)];
	DKIM_TRACE(0.00)[suse.de:+]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_095926_227886_339F2FD3 
X-CRM114-Status: GOOD (  11.45  )
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

Restrict panic handling to primary displays. Overlays and cursors
should not display panic output. If there are exceptions, they can
be registered by the driver itself.

v3:
- also update drm_panic_is_enabled() (Sashiko)
- still do some testing when unregistering (Sashiko)

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Reviewed-by: Jocelyn Falempe <jfalempe@redhat.com>
---
 drivers/gpu/drm/drm_panic.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_panic.c b/drivers/gpu/drm/drm_panic.c
index 809d51ad78a8..522ea990a2e9 100644
--- a/drivers/gpu/drm/drm_panic.c
+++ b/drivers/gpu/drm/drm_panic.c
@@ -1059,9 +1059,13 @@ bool drm_panic_is_enabled(struct drm_device *dev)
 	if (!dev->mode_config.num_total_plane)
 		return false;
 
-	drm_for_each_plane(plane, dev)
-		if (plane->helper_private && plane->helper_private->get_scanout_buffer)
-			return true;
+	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
+		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
+			continue;
+		return true;
+	}
 	return false;
 }
 EXPORT_SYMBOL(drm_panic_is_enabled);
@@ -1079,6 +1083,8 @@ void drm_panic_register(struct drm_device *dev)
 		return;
 
 	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
 		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
 			continue;
 		plane->kmsg_panic.dump = drm_panic;
@@ -1106,6 +1112,8 @@ void drm_panic_unregister(struct drm_device *dev)
 		return;
 
 	drm_for_each_plane(plane, dev) {
+		if (plane->type != DRM_PLANE_TYPE_PRIMARY)
+			continue;
 		if (!plane->helper_private || !plane->helper_private->get_scanout_buffer)
 			continue;
 		kmsg_dump_unregister(&plane->kmsg_panic);
-- 
2.55.0


