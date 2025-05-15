Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40BCCC3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:32:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tjZMaGznYTpgVkzcAZJLB15P+8pIgeWsz7sQYwAvhuY=; b=st5c7Ubk8rfR0SmXTDbPYucYoR
	d1LEC+CklLQiuIONq/V310seBGu/iJmnBYDwNt44ze3XAt3kjIccebOhDIzHERc8aQ7jC56k8XnMm
	B2fN8KiQbBmSOeF753MhjOBlwiCj4PwVvFjyrF/T4zouKQDE3nHTGwHH3T08cfC6uNm3LaV2cqIaj
	kkgfVQgKyztrvk5zwEQGGlH5O2wz1YD8yQqzGdTQ1qAgsKI7MQ85QGEiIT9PhgGlrkm0woE9NZj6g
	fejp5ruPwcpgZD7K1M4X3vNGXqnUZuhrVfdHXTNr9deh5RlL/aLkXVu+VFkUpgKduXrA6M8pkfdwl
	mZWuTJDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFU0v-0000000HZMv-2O09;
	Thu, 15 May 2025 08:32:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFTvz-0000000HWmC-0ahN;
	Thu, 15 May 2025 08:27:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Transfer-Encoding:MIME-Version:References:
	In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=tjZMaGznYTpgVkzcAZJLB15P+8pIgeWsz7sQYwAvhuY=; b=BbHW6MRQgqivLoVwFPVTJrHMYQ
	8didFhmFojpowKxGBGsVehaGboufPYS6v4tflzKmoRcY0K7V8J5n7O4NaoS9wJ5OnJmZvNwa0Lf2/
	0nZC93Ud1vKcDY2hq8CASdDh0dbDlTvyPEN3I9x8pJf8Src0txz0I1oqvUI4Rtotf/PK8OVRqjsoQ
	udP6QfrZkIlHUQvMis9jjua9NWH/45uL1L/svgfoMTuIAttbKUkyFMWiZsEgrMIHc3ItlREwSWNbO
	UmPyrEvVymvO0Uocyp/J7UsoecGYFD9Z4/XTpPucDSh9Wp3+GUklG1JiVnRx8FXlPmf6zxfvOW286
	5mnWKQXw==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=localhost.localdomain)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uFTvs-0008Fm-0C; Thu, 15 May 2025 10:27:12 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: heiko@sntech.de
Cc: mturquette@baylibre.com,
	sboyd@kernel.org,
	nicolas.frattaroli@collabora.com,
	ziyao@disroot.org,
	linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 2/2] clk: rockchip: rk3528: add slab.h header include
Date: Thu, 15 May 2025 10:26:52 +0200
Message-ID: <20250515082652.2503063-2-heiko@sntech.de>
X-Mailer: git-send-email 2.47.2
In-Reply-To: <20250515082652.2503063-1-heiko@sntech.de>
References: <20250515082652.2503063-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_012719_178370_34C1018E 
X-CRM114-Status: GOOD (  12.40  )
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

The newly added GRF types introduced kzalloc usage into the rk3528.
At least for the similar rk3576 driver, the kernel-test-robot reported the
missing prototype, which warranted adding a slab.h include.

While it did not complain about the rk3528, so the header might be included
"accidentially" right now, add a real include to make sure we keep it
included in the future.

Fixes: 306d2f5ddaa7 ("clk: rockchip: rk3528: Add SD/SDIO tuning clocks in GRF region")
Signed-off-by: Heiko Stuebner <heiko@sntech.de>
---
 drivers/clk/rockchip/clk-rk3528.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/clk/rockchip/clk-rk3528.c b/drivers/clk/rockchip/clk-rk3528.c
index f5f10493abfb..a5ff64b93f8f 100644
--- a/drivers/clk/rockchip/clk-rk3528.c
+++ b/drivers/clk/rockchip/clk-rk3528.c
@@ -12,6 +12,7 @@
 #include <linux/platform_device.h>
 #include <linux/mfd/syscon.h>
 #include <linux/minmax.h>
+#include <linux/slab.h>
 
 #include <dt-bindings/clock/rockchip,rk3528-cru.h>
 
-- 
2.47.2


