Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52BEAC282D2
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=QvI3uoBBtrY63GFuz2BimKRrjmSrRphcFh9ZV4VWtho=; b=wkeo6Xr+gacOrDqfFY90x/twtv
	t2G7z7847qmJKCiOsHbHdL5tyLVWn+Ho38nw4g2tByjm3N+QDdEvd8hkLXetr7L3VXR4bJgiy4v1A
	DbTYpUYkoZ+MboaYVrkUxSD1eo2JigeQPUakjA+UiVUYQxR3CwV8vPn4szkXGwuT3m3Kua7RMt46e
	yp6oz6NzsWMGu8gmhcRSszkpGZOp2pXCBhhf987eZXgLipkvc2w+0Ts17AZCe1z8JWfd9ARhb3tay
	8mvfpgcdEhnyjBQX40qKXPeC7jnv75/G6d8JWV+QD6FBHICumV9RilCGv9CCeoF0SgyO/zNt5OO8G
	tEoIdsbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpATX-00000001vrm-18tw;
	Mon, 03 Mar 2025 18:25:11 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpARy-00000001vjS-2FJj;
	Mon, 03 Mar 2025 18:23:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=QvI3uoBBtrY63GFuz2BimKRrjmSrRphcFh9ZV4VWtho=; b=OqdJEGuFkISnTQKehCqXxKXvmh
	uZ04gWRn0+rtOAGZCya4mZwIiXOlB5i4E6iwYg7+cQBO5tabqR2KE6NvctV11i8WGc9VCjLMeODIX
	76ZvKuE0kbs4JYvmgWyvaw0JDZ+EVZ9Hri82Z1jC8XD0T7OWmJrbyMgDLrK00qd0Cw5a3puvNWm4f
	584M3qNk7hihHXiLrS3u9vuKdWnySxKugk2dqMO9PScKBdX+0KJy6qJ2vf1YQAlwB3XgIMourmhfq
	ESj3b/Tlcl2a/e7NhMIlA0f2RDBz2/bh9R9zRAReyAXpAj3mctqU5v74WsC+wKAygO4jgiqe1S3NM
	L+IlP4AQ==;
Received: from i53875a38.versanet.de ([83.135.90.56] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tpARX-0004dM-8j; Mon, 03 Mar 2025 19:23:07 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: hjc@rock-chips.com,
	andy.yan@rock-chips.com,
	maarten.lankhorst@linux.intel.com,
	mripard@kernel.org,
	tzimmermann@suse.de,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH] drm/rockchip: vop2: add missing bitfield.h include
Date: Mon,  3 Mar 2025 19:22:56 +0100
Message-ID: <20250303182256.1727178-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_102334_595549_A66DAA47 
X-CRM114-Status: GOOD (  10.47  )
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

Commit 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
moved per soc configuration code to the other per-soc data into
rockchip_vop2_reg.c, but forgot to also include bitfield.h for the used
FIELD_PREP macro. Add this missing include.

Fixes: 328e6885996c ("drm/rockchip: vop2: Add platform specific callback")
Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202503040135.fgoyWdLB-lkp@intel.com/
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/gpu/drm/rockchip/rockchip_vop2_reg.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
index 0afef24db144..f86a30df94aa 100644
--- a/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
+++ b/drivers/gpu/drm/rockchip/rockchip_vop2_reg.c
@@ -4,6 +4,7 @@
  * Author: Andy Yan <andy.yan@rock-chips.com>
  */
 
+#include <linux/bitfield.h>
 #include <linux/kernel.h>
 #include <linux/component.h>
 #include <linux/mod_devicetable.h>
-- 
2.47.2


