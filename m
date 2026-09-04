Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DC92C79F82
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Sep 2026 13:28:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:Cc:
	To:In-Reply-To:Message-Id:Content-Transfer-Encoding:MIME-Version:Subject:Date
	:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y+0vqJ0NYM3Dng5ZYIoY4i+P6yjASTBFUK6zbbQuTxg=; b=sFuxncPiV6/GDZGtMGwgq67GTl
	lDJfSZT3zs/5AAdpfZBpfuOm4JE9TCAyvJ1NiKYp6JTVNFwHkjJdG6hUGvpu4NbtsLMHfV6t5m5y0
	zw42kl61+C4za9Ul9uP1fSEftYy+JlRy+XgS4tB5Ez3mbkMG4y0ZcSsIULo3EXViDj6GdLhF2Dkiu
	yEshbwhpnqBxKyYfO9SNrldMr6qktBPTVcugwyUOVlMYsLldk81imT52XHqfMwqNKI2lL9OWUH9/0
	EIXhdd31EexQxuQP5JWlWoMGnmtAg93ZkkJwa5fybaPTjvA5fX6XjQcTBy0AKRaMw9cJtcbFyDKgQ
	gEsm2ZpA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TyE-00000002C2S-0ypM;
	Fri, 04 Sep 2026 13:28:42 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2TxM-00000002AW8-0GpQ;
	Fri, 04 Sep 2026 13:27:53 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260904132746euoutp02317f9999860bc633cc4b58121d4a386f~SISn2zDD32525625256euoutp02S;
	Fri,  4 Sep 2026 13:27:46 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260904132746euoutp02317f9999860bc633cc4b58121d4a386f~SISn2zDD32525625256euoutp02S
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1788528466;
	bh=Y+0vqJ0NYM3Dng5ZYIoY4i+P6yjASTBFUK6zbbQuTxg=;
	h=From:Date:Subject:In-Reply-To:To:Cc:References:From;
	b=X4alJFAhLxvdDFhECWfwyZH22jUzn/LpCS3FGnOXfVHR0SAh7HMQpfqU41HhoN5d1
	 CUxGXt5Yr9To5MGonOHmLBhu4gHvLwxHgwkjjQwRlcc8ogIsZl4mYyRsi/VTeieHBV
	 G4G5+xNOBl/eaPldSf4n5CiS2I03Dr6rT2ATneYI=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132745eucas1p1cd078aae0c24302622db6e2e0f617c31~SISnPWdTJ1560415604eucas1p11;
	Fri,  4 Sep 2026 13:27:45 +0000 (GMT)
Received: from AMDC4942.eu.corp.samsungelectronics.net (unknown
	[106.210.136.40]) by eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260904132743eusmtip186dec72c13e302f75e2a0700e1e97482~SISlhpwE01776617766eusmtip1b;
	Fri,  4 Sep 2026 13:27:43 +0000 (GMT)
From: Michal Wilczynski <m.wilczynski@samsung.com>
Date: Fri, 04 Sep 2026 15:27:20 +0200
Subject: [PATCH v3 19/19] MAINTAINERS: Add StarFive JH7110 display subsystem
 entry
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Message-Id: <20260904-jh7110-clean-send-v3-19-484f9ae72715@samsung.com>
In-Reply-To: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
To: Vinod Koul <vkoul@kernel.org>,  Neil Armstrong
	<neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>,  Krzysztof
	Kozlowski <krzk+dt@kernel.org>,  Conor Dooley <conor+dt@kernel.org>, Andrzej
	Hajda <andrzej.hajda@intel.com>,  Robert Foss <rfoss@kernel.org>,  Laurent
	Pinchart <Laurent.pinchart@ideasonboard.com>,  Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,  Luca Ceresoli
	<luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>,  Simona
	Vetter <simona@ffwll.ch>,  Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>,  Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,  Lee Jones <lee@kernel.org>, Andy
	Yan <andy.yan@rock-chips.com>,  Philipp Zabel <p.zabel@pengutronix.de>, 
	Emil Renner Berthing <kernel@esmil.dk>,  Hal Feng
	<hal.feng@starfivetech.com>,  Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>,  Heiko
	Stuebner <heiko@sntech.de>, Conor Dooley <conor@kernel.org>,  Paul Walmsley
	<pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>,  Albert Ou
	<aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,  Dominique
	Belhachemi <db@domibel.de>, Brian Masney <bmasney+clk@redhat.com>,  Jerome
	Brunet <jbrunet+clk@baylibre.com>
Cc: linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	mfd@lists.linux.dev, linux-clk@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
	linux-riscv@lists.infradead.org, Andy Yan <andyshrk@163.com>,  Marek
	Szyprowski <m.szyprowski@samsung.com>,  Maud Spierings
	<maud_spierings@murena.io>,  Graham Markall <hello@big-grey.co.uk>,  Icenowy
	Zheng <zhengxingda@iscas.ac.cn>,  Michal Wilczynski
	<m.wilczynski@samsung.com>
X-Mailer: b4 0.15-dev
X-CMS-MailID: 20260904132745eucas1p1cd078aae0c24302622db6e2e0f617c31
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260904132745eucas1p1cd078aae0c24302622db6e2e0f617c31
X-EPHeader: CA
X-CMS-RootMailID: 20260904132745eucas1p1cd078aae0c24302622db6e2e0f617c31
References: <20260904-jh7110-clean-send-v3-0-484f9ae72715@samsung.com>
	<CGME20260904132745eucas1p1cd078aae0c24302622db6e2e0f617c31@eucas1p1.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260904_062749_251990_64679DBA 
X-CRM114-Status: GOOD (  10.88  )
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

The JH7110 display subsystem spans a PHY driver, a DRM bridge driver,
a parent device and their bindings, and has no existing maintainer entry.

Add an entry covering them so patches reach someone who can review them.

Signed-off-by: Michal Wilczynski <m.wilczynski@samsung.com>
---
 MAINTAINERS | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 3a19da74d00c9dfb48e900df71a86d4686d3ec2c..055a6d0f3967c8171a0c6a3f9dde0ea72f166274 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -26078,6 +26078,19 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/net/starfive,jh7110-dwmac.yaml
 F:	drivers/net/ethernet/stmicro/stmmac/dwmac-starfive.c
 
+STARFIVE JH7110 DISPLAY SUBSYSTEM
+M:	Michal Wilczynski <m.wilczynski@samsung.com>
+R:	Icenowy Zheng <zhengxingda@iscas.ac.cn>
+S:	Maintained
+F:	Documentation/devicetree/bindings/display/bridge/starfive,jh7110-inno-hdmi-controller.yaml
+F:	Documentation/devicetree/bindings/mfd/starfive,jh7110-hdmi-subsystem.yaml
+F:	Documentation/devicetree/bindings/phy/starfive,jh7110-inno-hdmi-phy.yaml
+F:	Documentation/devicetree/bindings/soc/starfive/starfive,jh7110-vout-subsystem.yaml
+F:	drivers/gpu/drm/bridge/jh7110-inno-hdmi.c
+F:	drivers/phy/starfive/phy-jh7110-inno-hdmi.c
+F:	drivers/soc/starfive/jh7110-hdmi-subsystem.c
+F:	drivers/soc/starfive/jh7110-vout-subsystem.c
+
 STARFIVE JH7110 DPHY RX DRIVER
 M:	Jack Zhu <jack.zhu@starfivetech.com>
 M:	Changhuang Liang <changhuang.liang@starfivetech.com>

-- 
2.34.1


