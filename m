Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CCF7606AAD6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 15:46:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=qjTpTKs9;
	dkim=pass (1024-bit key, unprotected) header.d=suse.de header.i=@suse.de header.a=rsa-sha256 header.s=susede2_rsa header.b=MsrOG3oY;
	dkim=pass header.d=suse.de header.i=@suse.de header.a=ed25519-sha256 header.s=susede2_ed25519 header.b=dRTjBlue
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q42+1LT+/kIysWR1pP52zLF3q3QDlSMlW5TUG8Jhqvg=; b=qjTpTKs90etyukFzPNH3CtUJrW
	I/t2h9jylAHOcutF1BKPys+OqRLAOHb6MpBL2wY0zqNtLVvRvVIpUNz16iti/AMdLEAtV4Pz4lhoP
	ZbeVGFsuCE2a7WhhOcVomOnbljj9s3tUN6hioWwpWohDVbJ9Yod7FH1bi8uJocD643f6gOiQM+J9c
	sXmxS3Q0pX9x8Zn+9Q+utkZ3YfFtz9nHnjBw1p7pa6hVwE1Jt6QOoDd3Jj2BMNxWwrUSLbiaqkVEG
	mFgbMW2hdxWjUJOJix1rpUZBxE0XjDSFO5kvCQsyJOmvDPm/xGhzVcE4LmnJoZP3jVMRU6jzQJafk
	xYp+DgQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpZD-00000007sEm-0JwZ;
	Mon, 19 Oct 2026 15:46:27 +0000
Received: from smtp-out1.suse.de ([195.135.223.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIpZ8-00000007sD8-1pIf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Oct 2026 15:46:25 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 2EC4621CA9;
	Mon, 19 Oct 2026 15:46:18 +0000 (UTC)
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1792424778; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q42+1LT+/kIysWR1pP52zLF3q3QDlSMlW5TUG8Jhqvg=;
	b=MsrOG3oYS78SNJ7/ae2AH0ESftfF09tqFOLo3hMOAUt3slapAB7RrKO6+HesSxlqe6m/ue
	QEqoOB94tRzhOxv0a2MF0h3uFdFZhqo/bEk8CDVG0YF67dcqPz2qqkDbMdCoK9GGd82iS4
	Hb00NNR9DlS/BmHreEXJsRVzOrUheGs=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1792424778;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Q42+1LT+/kIysWR1pP52zLF3q3QDlSMlW5TUG8Jhqvg=;
	b=dRTjBlueuN5bJ8GI4kyce071TiXAh7MkIvbio8l6r7/gH0P6dezWLAj20I7JwoEJfK3dni
	+4kEw2LgrA9qYSCg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id AA98A1376E;
	Mon, 19 Oct 2026 15:46:17 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id gYPgBkk71mrrPAAAD6G6ig:T2
	(envelope-from <tzimmermann@suse.de>); Mon, 19 Oct 2026 15:46:17 +0000
From: Thomas Zimmermann <tzimmermann@suse.de>
To: jfalempe@redhat.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	airlied@gmail.com,
	simona@ffwll.ch
Cc: dri-devel@lists.freedesktop.org,
	amd-gfx@lists.freedesktop.org,
	linux-hyperv@vger.kernel.org,
	intel-gfx@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	nouveau@lists.freedesktop.org,
	linux-renesas-soc@vger.kernel.org,
	virtualization@lists.linux.dev,
	sashiko-reviews@lists.linux.dev,
	Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 1/4] drm: Add helper module for working with pixel data
Date: Mon, 19 Oct 2026 17:32:42 +0200
Message-ID: <20261019154612.777074-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261019154612.777074-1-tzimmermann@suse.de>
References: <20261019154612.777074-1-tzimmermann@suse.de>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Action: no action
X-Spam-Score: -4.00
X-Rspamd-Pre-Result: action=no action;
	module=replies;
	Message is reply to one we originated
X-Spam-Level: 
X-Rspamd-Queue-Id: 2EC4621CA9
X-Spamd-Result: default: False [-4.00 / 50.00];
	REPLY(-4.00)[]
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261019_084622_622861_940EAD02 
X-CRM114-Status: GOOD (  13.21  )
X-Spam-Score: -4.4 (----)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_BLOCKED,RCVD_IN_ZEN_BLOCKED_OPENDNS,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add drm_pixel_helper.ko. This module will contain helpers that copy
and process pixel data, such as framebuffers. Drivers that want to
use the helpers should select DRM_PIXEL_HELPER.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/Kconfig                   | 6 ++++++
 drivers/gpu/drm/Makefile                  | 4 ++++
 drivers/gpu/drm/drm_pixel_helper_common.c | 6 ++++++
 3 files changed, 16 insertions(+)
 create mode 100644 drivers/gpu/drm/drm_pixel_helper_common.c

diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 61111d50b1c6..dce5e25671ee 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -49,6 +49,12 @@ config DRM_KMS_HELPER
 	help
 	  CRTC helpers for KMS drivers.
 
+config DRM_PIXEL_HELPER
+	tristate
+	depends on DRM
+	help
+	  Helpers for working with pixel data in DRM.
+
 config DRM_DRAW
 	bool
 	depends on DRM
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index 2c6bc093a923..5f555a2c1a4c 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -99,6 +99,10 @@ obj-$(CONFIG_DRM_PANEL) += drm_panel.o
 obj-$(CONFIG_DRM_PANEL_ORIENTATION_QUIRKS) += drm_panel_orientation_quirks.o
 obj-$(CONFIG_DRM_PANEL_BACKLIGHT_QUIRKS) += drm_panel_backlight_quirks.o
 
+drm_pixel_helper-y := \
+	drm_pixel_helper_common.o
+obj-$(CONFIG_DRM_PIXEL_HELPER) += drm_pixel_helper.o
+
 #
 # Memory-management helpers
 #
diff --git a/drivers/gpu/drm/drm_pixel_helper_common.c b/drivers/gpu/drm/drm_pixel_helper_common.c
new file mode 100644
index 000000000000..743846e1e003
--- /dev/null
+++ b/drivers/gpu/drm/drm_pixel_helper_common.c
@@ -0,0 +1,6 @@
+// SPDX-License-Identifier: GPL-2.0 or MIT
+
+#include <linux/module.h>
+
+MODULE_DESCRIPTION("DRM pixel-data helpers");
+MODULE_LICENSE("GPL and additional rights");
-- 
2.56.0


