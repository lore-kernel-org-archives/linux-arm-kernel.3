Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEC74C5AD4E
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Aug 2026 08:56:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:Message-Id:Date:Subject:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Owner; bh=GZYEcNQVytytPZG82EjIyjiqlfy4z6HXaV8YO4qSxy0=; b=zGzasc5J3xUUuG
	g0Kq4exUA5M101fZy6H9czkAQX7slALgXa3cD7OKpZNifOVVRxibtumcpWh0daX+r4+T5DOGAN18F
	oyEUuW21fus1PHbg7GKWEQZg7O1DgE2HF2ajTRuIPQngkRT6Ey9HyLxTMde/GiQzNkqJeRAyOkBJk
	FlHU7qxIjrxwVewJN+TpBOAgNEt724bYiICWFoGYNnd8sNyHIOHoUNFVnSq1+NGhu951L5io6HXD6
	JQ60lIDPNJI/lpIZpiPzdLAzyRrrcgNlY2rXhkBRuqwLRipd9lwlzI0x/66nRnbDh740yHxnUGN/K
	vCghA18tLkfNeZyuTshA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wszKa-0000000A76L-3QUK;
	Sun, 09 Aug 2026 08:56:32 +0000
Received: from layka.disroot.org ([178.21.23.139])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wszKY-0000000A75v-1Jvp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Aug 2026 08:56:31 +0000
Received: from mail01.layka.lan (localhost [127.0.0.1])
	by disroot.org (Postfix) with ESMTP id CD14A42C9D;
	Sun, 09 Aug 2026 10:56:21 +0200 (CEST)
X-Virus-Scanned: SPAM Filter at disroot.org
Received: from layka.disroot.org ([127.0.0.1])
 by localhost (disroot.org [127.0.0.1]) (amavis, port 10024) with ESMTP
 id pBgEsEW16gPa; Sun,  9 Aug 2026 10:56:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=disroot.org; s=mail;
	t=1786265781; bh=tBqlMlT7UHfWvC+iM4q4LAoLrnSqP15+B84HIVXvEGc=;
	h=From:Subject:Date:To:Cc;
	b=Hwkd4okISVdmgMk4Tnhxw2v/r4Ziwu4Vl73fl9n0WNKrR6OG79BvXt3YuzJBCTVTK
	 qGCQYeLABR4r5m+iJrKjobiVywRn7ZnxVuIPxhaWic7Oc5cNZtaAN/ZNbht6hkMPbf
	 gzYG955hxBx8amMmHq88VM0xGHALD11yAKqNjaCFLQi51nStwFkd9CVRZoCQ6l/V38
	 qh709tETtryQEADj6VUrN+B0V8dKhhyjyZ4ZeEh+v1pfr/eQ8sQJK5kFIHd7lWM8Sg
	 XiKU2pC6ju2hnSZY6VXGQaMukQtZ16pk3RaCexYT80J7fcPkjOP3K/m88DJKfQsAFK
	 jZAB3+FQj6ayw==
From: Kaustabh Chakraborty <kauschluss@disroot.org>
Subject: [PATCH v5 0/3] Fixes and enhancements for Exynos (7870) DSIM
 bridge driver
Date: Sun, 09 Aug 2026 14:25:58 +0530
Message-Id: <20260809-exynos-dsim-fixes-v5-0-6e63dc6c238f@disroot.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/33NTW7CMBAF4Ksgr3E1P4ltWPUeVReOPYAXjZGNI
 hDK3euwiSqiLt8bvW+eqkpJUtVx91RFplRTHlvo9zsVLn48i06xZUVABpA6LffHmKuONf3oU7p
 L1T07jsabE1hWbXct8jq02dd3y5dUb7k8Xi8mXNr/tAk1aCSK0FlPHPEzplpyvn3kclaLN9FqE
 Lgtg5rhXW/FIYMn/27waljiLYObAYHRC8ZBQng3utVwcNgyumYEb2zoUQwO9q8xz/MvxwpaFoA
 BAAA=
X-Change-ID: 20260124-exynos-dsim-fixes-5383d6a6f073
To: Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Seung-Woo Kim <sw0312.kim@samsung.com>, 
 Kyungmin Park <kyungmin.park@samsung.com>, 
 Krzysztof Kozlowski <krzk@kernel.org>, 
 Peter Griffin <peter.griffin@linaro.org>, 
 Alim Akhtar <alim.akhtar@samsung.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org, 
 Kaustabh Chakraborty <kauschluss@disroot.org>, stable@vger.kernel.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260809_015630_503610_A6407CA5 
X-CRM114-Status: GOOD (  10.61  )
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

Since v6.17, there is a regression for the Exynos 7870 DSIM driver. The
display occasionally had random aberration when the panel was turned on.
The first patch addresses that.

The second patch replaces an implicit loop for waiting for PLL
stabilization with an interrupt-based solution, which should be more
reliable. This solution was suggested by Inki Dae in a discussion of an
earlier patch series sent by me. For further details, refer to its
commit description.

Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
---
Changes in v5:
- Fix incorrect goto label s/err_unbind_all/err_mode_config_cleanup (Sashiko)
- Link to v4: https://patch.msgid.link/20260809-exynos-dsim-fixes-v4-0-ca67c51e61b7@disroot.org

Changes in v4:
- Clarify active-hight MFLUSH_VS in code comment (Luca Seresoli)
- Move aperture_remove_all_conflicting_devices() before
  component_bind_all() (Sashiko)
- Change `timeout` type to unsigned long (Inki Dae)
- Correct typo s/Calcutate/Calculate (Inki Dae)
- Correct inverted condition waiting for PLL stable completion
  (Inki Dae)
- Do not exclusively conclude IRQ routine for PLL_STABLE interrupt
  (Inki Dae)
- Explicitly enable PLL_STABLE and SW_RST_RELEASE interrupts during
  reset action (Inki Dae)
- Wait for SW_RST_RELEASE interrupt before setting up clock (Inki Dae)
- Fall back to bit testing for PLL stabilization when timed out
- Link to v3: https://patch.msgid.link/20260723-exynos-dsim-fixes-v3-0-0c31ae1dbecc@disroot.org

Changes in v3:
- Add patch for removing conflicting devices for DRM (Sam Day)
- Link to v2: https://lore.kernel.org/r/20260208-exynos-dsim-fixes-v2-0-a857e8130a2a@disroot.org

Changes in v2:
- drop now-not-required [v1 1/3] (Marek Szyprowski)
- Link to v1: https://lore.kernel.org/r/20260124-exynos-dsim-fixes-v1-0-122d047a23d1@disroot.org

---
Kaustabh Chakraborty (3):
      drm/bridge: samsung-dsim: enable MFLUSH_VS for Exynos 7870 DSIM
      drm/bridge: samsung-dsim: use DSIM interrupt to wait for PLL stability
      drm/exynos: remove simplefb nodes before init

 drivers/gpu/drm/bridge/samsung-dsim.c   | 56 +++++++++++++++++++++++++--------
 drivers/gpu/drm/exynos/exynos_drm_drv.c |  6 ++++
 include/drm/bridge/samsung-dsim.h       |  1 +
 3 files changed, 50 insertions(+), 13 deletions(-)
---
base-commit: 290aaf24a551d5a0dce037e3fab30820f9113a10
change-id: 20260124-exynos-dsim-fixes-5383d6a6f073

Best regards,
--  
Kaustabh Chakraborty <kauschluss@disroot.org>


