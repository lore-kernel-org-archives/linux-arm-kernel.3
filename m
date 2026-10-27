Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8E8F606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 13:33:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=labhfClL;
	dkim=pass (1024-bit key, unprotected) header.d=rock-chips.com header.i=@rock-chips.com header.a=rsa-sha256 header.s=default header.b=PVzW6r5D
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=PfFndZaVFmyUrI+kd6bT8WqUeL7pyt32bXHtU/pq9QY=; b=labhfClLRFlnya
	6rFpBc5a61KjGoG41b8KPrkYQNPpEDcduvqBHl/XFK04YL/YLKjeGAjm0NZ1QfNA8uZQ20lzvmnuG
	N0ovLgqSrC8uSjLZMRCHRHIrPLd2yf/rSoGaVFKB15s8BN64GHfE4+CZxhPN+DkrqEkr8Dmo6YNPb
	ZmyUT89/UKf1Ysd+9xQMv+NEuHDNYxl6JAjYUwaKmD+5oNBbRc6Q0c4ocBWIwAZ2O/LtOdd8fS5jL
	3C1ZR5uFs88MvMT1V2Di3j54WIFjA3BRha+ihxVyPJG2CmWH9LuXWhlN/O7/zdaX8fCB5xbrRDwv6
	LFfujnHhe/c95bUsQtQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhJF-00000004tHM-36Q2;
	Tue, 27 Oct 2026 13:33:49 +0000
Received: from mail-m32101.qiye.163.com ([220.197.32.101])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLhJ7-00000004t42-3aJz;
	Tue, 27 Oct 2026 13:33:43 +0000
Received: from zyb-HP-ProDesk-680-G2-MT.. (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 528777a4d;
	Tue, 27 Oct 2026 21:28:37 +0800 (GMT+08:00)
From: Damon Ding <damon.ding@rock-chips.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Jingoo Han <jingoohan1@gmail.com>,
	Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>,
	Kyungmin Park <kyungmin.park@samsung.com>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Heiko Stuebner <heiko@sntech.de>,
	Sandy Huang <hjc@rock-chips.com>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	Damon Ding <damon.ding@rock-chips.com>
Subject: [PATCH v5 18/18] MAINTAINERS: Add entry for Analogix DP controller bridge
Date: Tue, 27 Oct 2026 21:28:10 +0800
Message-Id: <20261027132810.1746118-19-damon.ding@rock-chips.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261027132810.1746118-1-damon.ding@rock-chips.com>
References: <20261027132810.1746118-1-damon.ding@rock-chips.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa17d8c6bb203a8kunm87c266213d5746
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDGEtKVkxCT0JMSUNMSUoYSFYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSE
	pKQk1VSktLVUpCWQY+
DKIM-Signature: a=rsa-sha256;
	b=PVzW6r5DVDLh52Trbqih5h5wPKU5MsC3JbNEDZuUpJEgnYIvkDBkMtS78wZ89hw9S2xogLAQeTcLG44wJG3z9+A6zMevKZy/pYUC/ni4mdlEOtKlBhUQqIJg6Abjawrh3SZWgNEzEcRzYBv6nfcx1AEVuiO4iYf5SgLSz6HY1NQ=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=PfFndZaVFmyUrI+kd6bT8WqUeL7pyt32bXHtU/pq9QY=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_063342_522355_8EEC7FA6 
X-CRM114-Status: UNSURE (   7.47  )
X-CRM114-Notice: Please train this message.
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
X-Spam-Status: No, score=-19.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Add a MAINTAINERS entry for the Analogix DP controller bridge, covering
the core bridge driver, its register helpers, the public header and the
DT binding, so that get_maintainer.pl routes related patches correctly.

Signed-off-by: Damon Ding <damon.ding@rock-chips.com>
---
 MAINTAINERS | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index a08087fb6e67..6518cbbd578c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -8037,6 +8037,17 @@ S:	Supported
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
 F:	drivers/gpu/drm/sun4i/sun8i*
 
+DRM DRIVER FOR ANALOGIX DISPLAYPORT BRIDGE
+M:	Damon Ding <damon.ding@rock-chips.com>
+L:	dri-devel@lists.freedesktop.org
+S:	Maintained
+T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/bridge/analogix,dp.yaml
+F:	drivers/gpu/drm/bridge/analogix/Kconfig
+F:	drivers/gpu/drm/bridge/analogix/Makefile
+F:	drivers/gpu/drm/bridge/analogix/analogix_dp_*
+F:	include/drm/bridge/analogix_dp.h
+
 DRM DRIVER FOR APPLE TOUCH BARS
 M:	Aun-Ali Zaidi <admin@kodeit.net>
 M:	Aditya Garg <aditya.garg@linux.dev>
-- 
2.34.1


