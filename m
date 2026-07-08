Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37613C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jul 2026 09:57:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OSrEVIc8I4v07uohcflk865RNS4QPYoK87cBft0LbSM=; b=NqmfebPc9WjzOFcZt8paNndn2d
	uImJiMnptHY2FxphQXvZ7vz7cetlsihuKmUU9OoKqSB9Iel/WtlEBzyyjO4xwxZ2il7X3pZEc5qFR
	szmSi6AJghhR2aEsRK+gmBnT2/sWsMJwfJwYjcm2RkUKIVEOmHZ70mOExpCKOLu47AzhTK7e/uvS6
	S5+mUfXI2Zpq8C9b+qMSAQ0vWZr+6USt4jCWVI6xDOR5QOaBET/LG3u/XNVIBHm68adp+PmGHaPyl
	mFDJ3QG0jzWxaK03erfpFV8AV/g+dKBcj/ih8OTBp6NXU+Xlkwtx+ywX8+tl6ezBEQGxKvS9jIQWB
	kMvb5fBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP1V-0000000Gn8g-0GjY;
	Wed, 08 Jul 2026 09:56:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1whP1T-0000000Gn7x-0hFm
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Jul 2026 09:56:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 56213601EC;
	Wed,  8 Jul 2026 09:56:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ED3B91F00A3A;
	Wed,  8 Jul 2026 09:56:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783504614;
	bh=OSrEVIc8I4v07uohcflk865RNS4QPYoK87cBft0LbSM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=HlcTHUEsJFmDC0ZybPXosmPoLjcHJc1ZrYdI5BbtiFZFWW+fjLQB85cQhMZj6bxxP
	 7X92SlATxbpmo1NZCeZFgOch6oJz4E5ZiAppcOotnPwePTsYIFx1jci6fNTpKcDq0x
	 dTuMYaDswy5tyZzi6atIUSb7oHn2//ape9Tyayu+XhAhTOnsVFyviK8eaM/ypgiXO4
	 jzN5i4FW6QYjLc6/THZTj3BDKmG/cFLrbtVlFJAsH/9ukbaKXUzeqgqLmmzqXxm8P1
	 zv4gjQn0mIYDv5VZ5bNwmemtdOd2POWex0OffYJRTGGI9eJcGvD2ipxYfPBRDiaeDG
	 q3oiZA9dNNO7A==
From: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
To: victor.liu@nxp.com
Cc: linux-kernel@vger.kernel.org,
	"Jiri Slaby (SUSE)" <jirislaby@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	dri-devel@lists.freedesktop.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2] drm/imx: include dc-drv.h to avoid sparse warning
Date: Wed,  8 Jul 2026 11:56:45 +0200
Message-ID: <20260708095645.385291-2-jirislaby@kernel.org>
X-Mailer: git-send-email 2.55.0
In-Reply-To: <20260708095645.385291-1-jirislaby@kernel.org>
References: <20260708095645.385291-1-jirislaby@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

sparse (build with C=1) warns:
drivers/gpu/drm/imx/dc/dc-ic.c:273:24: warning: symbol 'dc_ic_driver' was not declared. Should it be static?

And it is right. Include dc-drv.h which declares the struct. This
ensures the types of both match.

Signed-off-by: Jiri Slaby (SUSE) <jirislaby@kernel.org>
Cc: Liu Ying <victor.liu@nxp.com>
---
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
---
 drivers/gpu/drm/imx/dc/dc-ic.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/imx/dc/dc-ic.c b/drivers/gpu/drm/imx/dc/dc-ic.c
index d8aa46ee6a7a..0f2fc7aecf31 100644
--- a/drivers/gpu/drm/imx/dc/dc-ic.c
+++ b/drivers/gpu/drm/imx/dc/dc-ic.c
@@ -14,6 +14,8 @@
 #include <linux/pm_runtime.h>
 #include <linux/regmap.h>
 
+#include "dc-drv.h"
+
 #define USERINTERRUPTMASK(n)	(0x8 + 4 * (n))
 #define INTERRUPTENABLE(n)	(0x10 + 4 * (n))
 #define INTERRUPTPRESET(n)	(0x18 + 4 * (n))
-- 
2.55.0


