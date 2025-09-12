Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4BD3ECA101F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 09:56:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/WgaU7Y24edcvelE6VWdeVRjrf0TYEj3umrowZuuiQ4=; b=lQCK2fdF93mZzd2WHyHpTT0b2d
	L8KleSCw5aWtoMraoNBGt9uOCTTLGFciwA7tMXjtf76/mNN6KN8l09/LXcLo6KqIS7mEg2pcoPGlT
	A8iu9f+RFrtfdSdQs7YGpA5UiIvkNija6GdVwxVoaOey+GHNgi9cWejkOSAsnILPgb+bmYR7gXzcF
	sOzds/X9a6noaYAj1pebi7++nPrRufuyFxBobaU1w2+OfMoFwzUZQDeV2LyE44qn0qgjs93Wix1v0
	hlmJaVavOr3YHsBOVI3LOpBVCH0RVK7HniPZur5egRZJDFfsnNUFs+MAm1kHf8tmpjr8qFmlFXy1A
	Xyf2b6xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Vv-00000008QLE-1K79;
	Fri, 12 Sep 2025 09:56:19 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux0Vr-00000008QIK-0rCh
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 09:56:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250912095607euoutp0104477bdeace025665e892621cbabf534~kgG6-mNTg1252212522euoutp01O
	for <linux-arm-kernel@lists.infradead.org>; Fri, 12 Sep 2025 09:56:07 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250912095607euoutp0104477bdeace025665e892621cbabf534~kgG6-mNTg1252212522euoutp01O
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1757670967;
	bh=/WgaU7Y24edcvelE6VWdeVRjrf0TYEj3umrowZuuiQ4=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=L2Y1YPprEPGLfmwqODN1Guom3McSDbIB5VdVRbCRwMw835DYk5l2p910cNLpNI+z5
	 rHhytp43Bafk8VFnZrR8BEkRHwf3Se4vxg/aDHH6RYQFEA57hhRE08pTAIp74BuXKO
	 9QMxfpC3Jk94QuvYOBNoEmOoa3cK1eiUw1e7BptY=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250912095607eucas1p2a18c183541e1b3a3d852cce1a0a151b7~kgG6gXgC42606026060eucas1p2a;
	Fri, 12 Sep 2025 09:56:07 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20250912095605eusmtip13971d667cb9ff7ae4e1a11bc688d941c~kgG5C1vwN0365103651eusmtip1O;
	Fri, 12 Sep 2025 09:56:05 +0000 (GMT)
Message-ID: <0ff3ba73-18e8-4941-bac6-2efa790c36ab@samsung.com>
Date: Fri, 12 Sep 2025 11:56:05 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v5 00/17] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, dianders@chromium.org,
	luca.ceresoli@bootlin.com, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250912085846.7349-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250912095607eucas1p2a18c183541e1b3a3d852cce1a0a151b7
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01
X-EPHeader: CA
X-CMS-RootMailID: 20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01
References: <CGME20250912085902eucas1p2b611b4afd6b453c161753f50386a6d01@eucas1p2.samsung.com>
	<20250912085846.7349-1-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_025615_506833_874895C8 
X-CRM114-Status: GOOD (  19.42  )
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

On 12.09.2025 10:58, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-9 are preparations for apply drm_bridge_connector helper.
> PATCH 10 is to apply the drm_bridge_connector helper.
> PATCH 11-14 are to move the panel/bridge parsing to the Analogix side.
> PATCH 15-16 are preparations for apply panel_bridge helper.
> PATCH 17 is to apply the panel_bridge helper.
>
> Damon Ding (17):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/exynos: exynos_dp: Remove unused &exynos_dp_device.connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/exynos: exynos_dp: Add legacy bridge to parse the display-timings
>      node
>    drm/bridge: analogix_dp: Move the color format check to
>      .atomic_check() for Rockchip platforms
>    drm/bridge: analogix_dp: Remove unused
>      &analogix_dp_plat_data.get_modes()
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>    drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply &analogix_dp_plat_data.attach() to
>      attach next bridge
>    drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>    drm/bridge: analogix_dp: Remove panel disabling and enabling in
>      analogix_dp_set_bridge()
>    drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>      in analogix_dp_unbind()
>    drm/bridge: analogix_dp: Apply panel_bridge helper
>
>   drivers/gpu/drm/bridge/analogix/Kconfig       |   1 +
>   .../drm/bridge/analogix/analogix_dp_core.c    | 394 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            | 168 ++++----
>   drivers/gpu/drm/rockchip/Kconfig              |   1 -
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  74 ++--
>   include/drm/bridge/analogix_dp.h              |   9 +-
>   7 files changed, 342 insertions(+), 310 deletions(-)
>
> ---
>
> Changes in v2:
> - Update Exynos DP driver synchronously.
> - Move the panel/bridge parsing to the Analogix side.
>
> Changes in v3:
> - Rebase for the existing devm_drm_bridge_alloc() applying commit.
> - Fix the typographical error of panel/bridge check in exynos_dp_bind().
> - Squash all commits related to skip_connector deletion in both Exynos and
>    Analogix code into one.
> - Apply panel_bridge helper to make the codes more concise.
> - Fix the handing of bridge in analogix_dp_bridge_get_modes().
> - Remove unnecessary parameter struct drm_connector* for callback
>    &analogix_dp_plat_data.attach().
> - In order to decouple the connector driver and the bridge driver, move
>    the bridge connector initilization to the Rockchip and Exynos sides.
>
> Changes in v4:
> - Rebase for the applied &drm_bridge_funcs.detect() modification commit.
> - Rename analogix_dp_find_panel_or_bridge() to analogix_dp_finish_probe().
> - Drop the drmm_encoder_init() modification commit.
> - Rename the &analogix_dp_plat_data.bridge to
>    &analogix_dp_plat_data.next_bridge.
>
> Changes in v5:
> - Add legacy bridge to parse the display-timings node under the dp node
>    for Exynos side.
> - Move color format check to &drm_connector_helper_funcs.atomic_check()
>    in order to get rid of &analogix_dp_plat_data.get_modes().
> - Remove unused callback &analogix_dp_plat_data.get_modes().
> - Distinguish the &drm_bridge->ops of Analogix bridge based on whether
>    the downstream device is a panel, a bridge or neither.
> - Select DRM_DISPLAY_DP_AUX_BUS for DRM_ANALOGIX_DP, and remove it for
>    ROCKCHIP_ANALOGIX_DP.
> - Apply rockchip_dp_attach() to support the next bridge attachment for
>    the Rockchip side.
> - Move next_bridge attachment from Analogix side to Rockchip/Exynos sides.

Exynos part still lacks "select DRM_BRIDGE_CONNECTOR" in Kconfig, 
besides that it works fine on all my test boards. Fix this issue and 
feel free to add:

Tested-by: Marek Szyprowski <m.szyprowski@samsung.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


