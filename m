Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D6954606A324
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 18:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=PBWD1pT3;
	dkim=pass (2048-bit key, unprotected) header.d=nabladev.com header.i=@nabladev.com header.a=rsa-sha256 header.s=dkim header.b=FZShw0L2
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=pqGz8QoD0yES0N8UDw6ipHv3HkyvECu9QbozjFVBkhc=; b=PBWD1pT3uEaThs47+byBWPxmFH
	uZii17EBa9wX7/zLSpUOm3Rt6nnMZiwjiHrVChK6nuhmCmxWIWPHBTP5R2eWyhl5bE/0+5ChMqPEw
	zPqgRi+JQ6r5+0U78k6SGkFp9eJvKSmXFU3Fs+7lAxQRqe39OpYwl2Bq4dmTyLoshKRnTuI+N2t9Z
	6qp257ZlMCUmMjgDc+qjPZksvf1m/oHAs7PoWHtiUFMcCgoig8SlUoZeOKxpDfSKfdxuu5+WKkzok
	KWs5/KLlehUME6bcPjmElMyuEosi0XyvF+qKpwm2oLR65XeK/f/d+H1+wiyIhOQMLyIXIaaiSCsFG
	RFUiYcMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUZH-0000000A3Ti-1i0r;
	Thu, 29 Oct 2026 18:09:39 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMUZE-0000000A3TM-2BrY
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 18:09:38 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2898B10BEB9;
	Thu, 29 Oct 2026 19:09:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1793297369; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=pqGz8QoD0yES0N8UDw6ipHv3HkyvECu9QbozjFVBkhc=;
	b=FZShw0L2ZrAj0ygKjJWNIs1LDysfLDl1rVYnzQikBBHIUg9FYWgV/NhmmIcIvH1njprlp8
	GvpEaAsqkB/rQbU8rB68T8RAk8P3p3RYon52zkkXTBtIcX0olwy9LExjCl8oGUmGX4bB4P
	HFN279psgGaWDlvePnfg81uV726GBKCcCVr8AFQpSa1Q+SOLx28XVWJo6psUY6KB+UxeN4
	jVPqUTUfMqPec2RdP5EkvMWdLfjvRCDfUYVUsYtcr1im6HoRiisD81ypb5r1j35WvLDC8a
	qh7WOXoTBIMlZ0yrFCxdRxfZILgpufznzwsKacjwtDUFmuAMowfJAMKw6O0tcQ==
From: Marek Vasut <marex@nabladev.com>
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marex@nabladev.com>,
	David Airlie <airlied@gmail.com>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Simona Vetter <simona@ffwll.ch>,
	Stefan Agner <stefan@agner.ch>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH] drm/mxsfb: Update MAINTAINERS entry
Date: Thu, 29 Oct 2026 19:08:55 +0100
Message-ID: <20261029180925.26792-1-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_110936_793742_632A302B 
X-CRM114-Status: GOOD (  10.62  )
X-Spam-Score: -2.1 (--)
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
X-Spam-Status: No, score=-23.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Fill in updated email address, no functional change.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: David Airlie <airlied@gmail.com>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 MAINTAINERS | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 75ef3d1aa9d6e..fa4dee57bcf8e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19168,7 +19168,7 @@ T:	git git://linuxtv.org/mkrufky/tuners.git
 F:	drivers/media/tuners/mxl5007t.*
 
 MXSFB DRM DRIVER
-M:	Marek Vasut <marex@denx.de>
+M:	Marek Vasut <marex@nabladev.com>
 M:	Stefan Agner <stefan@agner.ch>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
-- 
2.53.0


