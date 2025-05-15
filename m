Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86EA7C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:34:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OAgk7CXl/I3Qccrf+0JyasnMW9sdwMzVGuy25ZCR3M8=; b=QtcDOFTQRcojuNngRCxvA+X8zZ
	qUxKJvAlvrZvUCcxLWFfMdU+LHLDh5RsmgW0P5LCFz9rMh2xEdyivS4Bx4tTVsj5qK5Gdbu/zAGcF
	WTLf/4PqX9WuECGK2jVsga3CETF4l/JFusOdd9huKY2IupC/OzKcaCdsjLD4dQK3Nu4U+MlPQuAw2
	7CIbwOboExEmq2+VkssaHh3SOgBQQbOvh8EDHEXCD5Wy5qErZRgdSFBE9PjCbk4mEq17jPYy/91cQ
	/UT7P9WgdXXUSs2EI0p6bG8tiCekjC5k0THqgbU5hwNt+OIPx9OgXJezhF1UASqlyPXZqxRnXtpgF
	opjuE0WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFU32-0000000HZq4-0FtT;
	Thu, 15 May 2025 08:34:36 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTvz-0000000HWm9-0W5G;
	Thu, 15 May 2025 08:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:Message-ID:Date:
	Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=OAgk7CXl/I3Qccrf+0JyasnMW9sdwMzVGuy25ZCR3M8=; b=p7e6af3N+xpzK+TmZrPdSf5O4W
	JMhZVJzPfCbKxzplBHqb88iifeHcbwPAkYLwHYNibxq8yZKqd8ou/8W+e+GF8qjeJQyaFX10tOzcb
	4RnXnUUlqxSmosdIMwpzQ/rEyQ2BJrGihtFmEKyimtOTkAKP0TnWu4IRfNTKAsXcHBZaAy1pg2iqH
	nB6bmZ3n0T0hjhOb+qmnFM4KYdKIpTk4HbbeaUx07nW35wAruUoBzmfiNmg1lvoD3LlVS+F23y2Fs
	CB1FUfosZHHIC6sHNyya66AakBqWxdIZyA+6aqDgnXfN8rebgUkVs0oeXor8+doLsIWa3Iz1qdp3v
	Ig9uFf5A==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFTvr-0008Fm-J9; Thu, 15 May 2025 10:27:11 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.frattaroli@collabora.com,
	ziyao@disroot.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	kernel test robot <lkp@intel.com>
Subject: [PATCH 1/2] clk: rockchip: rk3576: add missing slab.h include
Date: Thu, 15 May 2025 10:26:51 +0200
Message-ID: <20250515082652.2503063-1-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012719_180705_DF05378D 
X-CRM114-Status: GOOD (  10.17  )
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

The change for auxiliary GRFs introduced kzalloc usage into the rk3576 clock
driver, but missed adding the header for its prototype. Add it now.

Reported-by: kernel test robot <lkp@intel.com>
Closes: https://lore.kernel.org/oe-kbuild-all/202505150941.KWKskr2c-lkp@intel.com/
Fixes: 70a114daf207 ("clk: rockchip: introduce auxiliary GRFs")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3576.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3576.c b/drivers/clk/rockchip/clk-rk3576.c
index 71e77013f726..1f4547af5acf 100644
--- a/drivers/clk/rockchip/clk-rk3576.c
+++ b/drivers/clk/rockchip/clk-rk3576.c
@@ -10,6 +10,7 @@
 #include <linux/platform_device.h>
 #include <linux/syscore_ops.h>
 #include <linux/mfd/syscon.h>
+#include <linux/slab.h>
 #include <dt-bindings/clock/rockchip,rk3576-cru.h>
 #include "clk.h"
 
-- 
2.47.2


