Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD995CEACEF
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:20:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ALqrvYx16IgQIglbpOnwhVRORNfwDsxM2tJC2QOGjhQ=; b=3rIJpLaJCxWWfDw9DnysHtzNTo
	mJnm3Nk0N/KBB4moCL3EFGBcKzTvtTrciW/6plVLNnOFv9gpA3/Kfj0d5vodYkchyFP8ygScf+8it
	U47BZYGuwmgWKdtEdERR+RRbYw/UkROcRiQchn/ZmWBe+LJQuMs3ZzYzalTE2EDIfL189lEFR0m1Z
	mUAv7k0VhAiYbFQvdA8JqVVa2ffoEJQSRs0gi6WENVAc51S5utpINGIzc8cBymg8flZUorGm/knHD
	TxhwKthim4+738hSjAco/r0UeoodYgFgAhGH8S5hR6Nk53bleQUOguOCDTJUdAhEfaRMXevHis0jI
	lrA78ULQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcg5-0000000Eeyz-2EGP;
	Sun, 16 Nov 2025 13:20:25 +0000
Received: from s2.avantea.pl ([46.242.128.95])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKcg2-0000000EeyY-2tPO;
	Sun, 16 Nov 2025 13:20:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=szczodrzynski.pl; s=x; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=ALqrvYx16IgQIglbpOnwhVRORNfwDsxM2tJC2QOGjhQ=; b=bMtB0Qg/1+SsHyMo3tyeEyYGtI
	nf4o+cbragiw/zKK0FphHMOpRJLSRcqI8fBYHJrhQIx8uUQpO9ygpW0MiJgNsapUrni94RTM2friZ
	eKZPqZTyySpbVNSdH4crYAkVFEpggWtlSfyH8hFwb7TAEldSnP0qGWNgG8IkROR7yyvmG7AzJdVUU
	xnOafJHM++YT5PkOVfrAKnOHqJqooeuXUNpEH2wMxliQy/KiaAqHdjz7JkAyZAdx0dKawY/b2/Q79
	To9wceIfxw19SgOKhIAKB8UXnGeo6HI4uDxpOUwCSPN+c6C3uSRKzgxHOvLQNE3VQecsGzGZPqhvA
	hp9vdaCQ==;
Received: from [62.171.184.96] (helo=buildhost.contaboserver.net)
	by s2.avantea.pl with esmtpsa  (TLS1.3) tls TLS_AES_256_GCM_SHA384
	(Exim 4.98.1)
	(envelope-from <kuba@szczodrzynski.pl>)
	id 1vKcfw-0000000FW4E-1LDX;
	Sun, 16 Nov 2025 14:20:16 +0100
From: =?UTF-8?q?Kuba=20Szczodrzy=C5=84ski?= <kuba@szczodrzynski.pl>
To: Maxime Ripard <mripard@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	parthiban@linumiz.com,
	paulk@sys-base.io
Subject: [PATCH v2 0/6] drm/sun4i: Support LVDS on D1s/T113 combo D-PHY
Date: Sun, 16 Nov 2025 14:18:47 +0100
Message-Id: <20251116131853.440863-1-kuba@szczodrzynski.pl>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
References: <20250221161751.1278049-1-kuba@szczodrzynski.pl>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authenticated-Id: kuba@szczodrzynski.pl
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_052022_921367_181DBCBB 
X-CRM114-Status: GOOD (  10.92  )
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

Some Allwinner chips (notably the D1s/T113 and the A100) have a "combo
MIPI DSI D-PHY" which is required when using single-link LVDS0. The same
PD0..PD9 pins are used for either DSI or LVDS.

Other than having to use the combo D-PHY, LVDS output is configured in
the same way as on older chips.

This series enables the sun6i MIPI D-PHY to also work in LVDS mode. It
is then configured by the LCD TCON, which allows connecting a
single-link LVDS display panel.

Changes in v2:
- Applied code formatting changes from review comments
- Changed "dphy" to "combo-phy"
- Made the LVDS setup/teardown functions abort early in case of error
  (adding a proper return value would require changes in several levels
   of caller functions; perhaps could be done in a separate patch)
- Added the PHY properties to DT bindings
- Renamed lvds0_pins to lcd_lvds0_pins
- Rebased on top of drm/misc/kernel/for-linux-next

Kuba Szczodrzyński (6):
  phy: allwinner: phy-sun6i-mipi-dphy: Support LVDS in combo D-PHY
  drm/sun4i: Support LVDS using MIPI DSI combo D-PHY
  drm/sun4i: Enable LVDS output on sun20i D1s/T113
  dt-bindings: display: sun4i: Add D1s/T113 combo D-PHY bindings
  riscv: dts: allwinner: d1s-t113: Add D-PHY to TCON LCD0
  riscv: dts: allwinner: d1s-t113: Add LVDS0 pins

 .../display/allwinner,sun4i-a10-tcon.yaml     |  6 ++
 .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 11 +++
 drivers/gpu/drm/sun4i/sun4i_tcon.c            | 50 +++++++++++++
 drivers/gpu/drm/sun4i/sun4i_tcon.h            |  6 ++
 drivers/phy/allwinner/phy-sun6i-mipi-dphy.c   | 70 ++++++++++++++++++-
 5 files changed, 141 insertions(+), 2 deletions(-)

-- 
2.25.1


