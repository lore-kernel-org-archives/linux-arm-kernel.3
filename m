Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D043CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 16:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HYTbEJeXrofpbs+IrmDrCBkyO0qBISpuRD07yukoC3M=; b=pi2nmQAlpjR5XIeTaHehWM9z46
	xWD8h/sBawvofCt++OfiCpIsd8yPp6A1tI8HeONxv1KFnDg/VVJwGilx8q+U5nsSB4ZYLpGJ2xkl9
	SeC2gehzezZVDZ/t+LZ+ivW/KegBZyeQjes0d5gPzY2UUJ8a/lWTB4g9E9cyKHsVcq9WM2nnoE29o
	q+IUGuod6dujFhPtlT7Fk4FY1eFAOVDfa4RVXYGL56VYbQz07b7F5vA7VsRt3LxX5y84TnGOewD23
	wWqxx4EbDlTner7cwwiUJGhuDMrzodQMneEL/deRZqkyXKI9JPPVGRceJ1ot4y0a88PLmp5BgbOmh
	vwlkwaLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umaez-0000000032a-0Jfx;
	Thu, 14 Aug 2025 16:18:37 +0000
Received: from mailout1.w1.samsung.com ([210.118.77.11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umZ1V-0000000HHPa-2w7q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 14:33:48 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout1.w1.samsung.com (KnoxPortal) with ESMTP id 20250814143341euoutp01db0b56fc7098efb62ed38f6c30b4f71f~bqL-IGxih1315613156euoutp01Z
	for <linux-arm-kernel@lists.infradead.org>; Thu, 14 Aug 2025 14:33:41 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout1.w1.samsung.com 20250814143341euoutp01db0b56fc7098efb62ed38f6c30b4f71f~bqL-IGxih1315613156euoutp01Z
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1755182021;
	bh=HYTbEJeXrofpbs+IrmDrCBkyO0qBISpuRD07yukoC3M=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=e7jfXMEtbajFgUjwRBhcTLRIVblrZOpnEbsCSf3WAKB1weUW7mUHDy9TxhLX2WjL+
	 kHFZv4Xci0Ot/45YURj7O/2bNOx4+5EINW25i7mU557c2szi1xkvgufLUGo2E3ntEz
	 34/Z2FghVovoMJr9w84HVH3KRqE89Cp0FhfBmgUc=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250814143340eucas1p24ef13c4a8a272a5830bc0adbbc8206a2~bqL_iNFfu0056100561eucas1p2Y;
	Thu, 14 Aug 2025 14:33:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250814143338eusmtip29e7b2dc498b358fdadaba0c0c10331ce~bqL7__0l03070130701eusmtip20;
	Thu, 14 Aug 2025 14:33:37 +0000 (GMT)
Message-ID: <a3a2f8be-2c3c-49e7-b27a-72364ea48b06@samsung.com>
Date: Thu, 14 Aug 2025 16:33:36 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v4 00/13] Apply drm_bridge_connector and panel_bridge
 helper for the Analogix DP driver
To: Damon Ding <damon.ding@rock-chips.com>, andrzej.hajda@intel.com,
	neil.armstrong@linaro.org, rfoss@kernel.org
Cc: Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
	jernej.skrabec@gmail.com, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, airlied@gmail.com, simona@ffwll.ch,
	jingoohan1@gmail.com, inki.dae@samsung.com, sw0312.kim@samsung.com,
	kyungmin.park@samsung.com, krzk@kernel.org, alim.akhtar@samsung.com,
	hjc@rock-chips.com, heiko@sntech.de, andy.yan@rock-chips.com,
	dmitry.baryshkov@oss.qualcomm.com, l.stach@pengutronix.de,
	dianders@chromium.org, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-rockchip@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20250814104753.195255-1-damon.ding@rock-chips.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250814143340eucas1p24ef13c4a8a272a5830bc0adbbc8206a2
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
X-EPHeader: CA
X-CMS-RootMailID: 20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264
References: <CGME20250814104818eucas1p2c5029f6d5997f4fafd6370f9e7fb2264@eucas1p2.samsung.com>
	<20250814104753.195255-1-damon.ding@rock-chips.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_073346_341644_279A9D9C 
X-CRM114-Status: GOOD (  16.77  )
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

On 14.08.2025 12:47, Damon Ding wrote:
> PATCH 1 is a small format optimization for struct analogid_dp_device.
> PATCH 2 is to perform mode setting in &drm_bridge_funcs.atomic_enable.
> PATCH 3-6 are preparations for apply drm_bridge_connector helper.
> PATCH 7 is to apply the drm_bridge_connector helper.
> PATCH 8-10 are to move the panel/bridge parsing to the Analogix side.
> PATCH 11-12 are preparations for apply panel_bridge helper.
> PATCH 13 is to apply the panel_bridge helper.

This series lacks 'select DRM_BRIDGE_CONNECTOR' in ExynosDP's Kconfig, 
so it causes build break:

drivers/gpu/drm/exynos/exynos_dp.c:177: undefined reference to 
`drm_bridge_connector_init'
make[2]: *** [scripts/Makefile.vmlinux:91: vmlinux] Error 1

After adding this dependency, the Exynos DP driver stops working. On 
Samsung Snow Chromebook I observed following issue:

[    4.534220] exynos-dp 145b0000.dp-controller: failed to attach 
following panel or bridge (-16)
[    4.543428] exynos-drm exynos-drm: failed to bind 
145b0000.dp-controller (ops exynos_dp_ops): -16
[    4.551775] exynos-drm exynos-drm: adev bind failed: -16
[    4.556559] exynos-dp 145b0000.dp-controller: probe with driver 
exynos-dp failed with error -16

I will investigate details later in the evening.

> Damon Ding (13):
>    drm/bridge: analogix_dp: Formalize the struct analogix_dp_device
>    drm/bridge: analogix_dp: Move &drm_bridge_funcs.mode_set to
>      &drm_bridge_funcs.atomic_enable
>    drm/bridge: analogix_dp: Add &analogix_dp_plat_data.next_bridge
>    drm/exynos: exynos_dp: Remove &exynos_dp_device.ptn_bridge
>    drm/bridge: exynos_dp: Remove unused &exynos_dp_device.connector
>    drm/bridge: analogix_dp: Remove redundant
>      &analogix_dp_plat_data.skip_connector
>    drm/bridge: analogix_dp: Apply drm_bridge_connector helper
>    drm/bridge: analogix_dp: Add new API analogix_dp_finish_probe()
>    drm/rockchip: analogix_dp: Apply analogix_dp_finish_probe()
>    drm/exynos: exynos_dp: Apply analogix_dp_finish_probe()
>    drm/bridge: analogix_dp: Remove panel disabling and enabling in
>      analogix_dp_set_bridge()
>    drm/bridge: analogix_dp: Remove bridge disabing and panel unpreparing
>      in analogix_dp_unbind()
>    drm/bridge: analogix_dp: Apply panel_bridge helper
>
>   .../drm/bridge/analogix/analogix_dp_core.c    | 384 ++++++++++--------
>   .../drm/bridge/analogix/analogix_dp_core.h    |   5 +-
>   drivers/gpu/drm/exynos/exynos_dp.c            |  48 +--
>   .../gpu/drm/rockchip/analogix_dp-rockchip.c   |  49 +--
>   include/drm/bridge/analogix_dp.h              |   7 +-
>   5 files changed, 248 insertions(+), 245 deletions(-)
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
Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


