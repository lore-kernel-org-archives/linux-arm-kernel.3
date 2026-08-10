Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC4AFC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Aug 2026 18:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=fKiUiKt9JGZMicj/Xhj3Wm9sivrvkfFOn3wUP2xsYL0=; b=mgIl6KOf2bjFajmoek+hudEDDD
	LU69WJwq47D1NtGjbNRhrlLKPJKT5CEupFaEEysYKNntpuCQ9ClU+YBwenwubVDj5tGUo0PweRod/
	Tg/a+mYEL8WwkoaNjanCp4a/eYkAMVvHZY8QwX3IfThnQcvD2i6Kh+Lk5FRmc8VO0bSvR+pO5ZOHg
	+CCXqCSNX4SEwA2plqBTfpBnMtsviSSiCv4XoPH9Z7S4QxnYdd+v6Y00WTMT2vDU3vVK5Z1aCw4Jb
	2v1NMcn0cYNE8Okw/bUIpQ1G7FSA530cpUhwFjXVmRSfMcrTlx3pxxw3xZfuKSFm3bMLZY0pBTgUQ
	dq6RDB1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO7-0000000CaPQ-2JWc;
	Mon, 10 Aug 2026 18:06:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtUO4-0000000CaNS-2p0p
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Aug 2026 18:06:14 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id E38B812F;
	Mon, 10 Aug 2026 20:04:51 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1786385092;
	bh=fZfGjCDyeRuGCB+CDHOTq5rehhGrNjqpUUeBXf/FSfk=;
	h=From:To:Cc:Subject:Date:From;
	b=AAWos9AWJQYvy6XpYkoqKeAQHbbKmyySMG5nYa39G98fkWckp4bLHvPTb7BKsEKGG
	 M+qAJ675SM5Hr3M999dL328msOZETj09bLB6VNe6GP6mTNtBnKMIAnSA2nUz+d4Zg9
	 KglQculHqdN2L2RJw5PG8ih4b5Dof0+axbByzgPg=
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: linux-arm-kernel@lists.infradead.org
Cc: devicetree@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jacopo Mondi <jacopo.mondi@ideasonboard.com>,
	Sakari Ailus <sakari.ailus@iki.fi>,
	Aaro Koskinen <aaro.koskinen@iki.fi>,
	Andreas Kemnade <andreas@kemnade.info>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Kevin Hilman <khilman@baylibre.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Peter Griffin <peter.griffin@linaro.org>,
	Roger Quadros <rogerq@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Tony Lindgren <tony@atomide.com>,
	imx@lists.linux.dev,
	linux-omap@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org
Subject: [PATCH v3 0/7] ARM: dts: Replace clock-frequency in camera sensor nodes
Date: Mon, 10 Aug 2026 21:05:57 +0300
Message-ID: <20260810180604.3034255-1-laurent.pinchart@ideasonboard.com>
X-Mailer: git-send-email 2.54.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_110612_866258_BEAAB39D 
X-CRM114-Status: GOOD (  11.29  )
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

Hello,

This patch series contains the leftovers from "[PATCH v2 00/72] media:
i2c: Reduce cargo-cult" ([1]). All driver patches have been merged, but
DT changes for ARM platforms were postponed to the next kernel release
and ended up being forgotten.

To refresh everybody's memory, a large number of camera sensor drivers
directly use the "clock-frequency" property to retrieve the effective or
desired external clock rate. This is standard behaviour on ACPI
platforms that don't implement MIPI DisCo for Imaging, but usage of the
property has leaked to OF-based platforms, due to a combination of
historical reasons (using "clock-frequency" was initially considered
right until before the introduction of "assigned-clock-rates") and plain
cargo-cult.

Two series of driver patches that replace manual handling of the clock
frequency in camera sensor drivers have been merged. The clock-frequency
property is now deprecated, in favour of assigned-clock-rates. This
patch series replaces the last users of clock-frequency. This aligns the
DT bindings and device tree sources to the current recommended practice.

[1] https://lore.kernel.org/linux-media/20250812214620.30425-1-laurent.pinchart@ideasonboard.com

Laurent Pinchart (7):
  ARM: dts: samsung: exynos4210-i9100: Replace clock-frequency in camera
    sensor node
  ARM: dts: samsung: exynos4412-midas: Replace clock-frequency in camera
    sensor node
  ARM: dts: ti: omap3-n950: Replace clock-frequency in camera sensor
    node
  ARM: dts: ti: omap3-n9: Replace clock-frequency in camera sensor node
  ARM: dts: ti: omap3-n900: Replace clock-frequency in camera sensor
    node
  ARM: dts: nxp: imx6qdl-pico: Replace clock-frequency in camera sensor
    node
  ARM: dts: nxp: imx6qdl-wandboard: Replace clock-frequency in camera
    sensor node

 arch/arm/boot/dts/nxp/imx/imx6qdl-pico.dtsi      | 4 +++-
 arch/arm/boot/dts/nxp/imx/imx6qdl-wandboard.dtsi | 4 +++-
 arch/arm/boot/dts/samsung/exynos4210-i9100.dts   | 5 ++++-
 arch/arm/boot/dts/samsung/exynos4412-midas.dtsi  | 5 ++++-
 arch/arm/boot/dts/ti/omap/omap3-n9.dts           | 5 ++++-
 arch/arm/boot/dts/ti/omap/omap3-n900.dts         | 3 ++-
 arch/arm/boot/dts/ti/omap/omap3-n950.dts         | 5 ++++-
 7 files changed, 24 insertions(+), 7 deletions(-)


base-commit: 56c29fa3ee666197516a231e75aed789ae9c530d
-- 
Regards,

Laurent Pinchart


