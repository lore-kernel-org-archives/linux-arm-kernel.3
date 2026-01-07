Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC39D0D17C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 23:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TYCzIUiOEy3kP/HiVQ2wZRrRPpZ4XZI8gw9kTIvwkig=; b=z7FY8oLI4ACnjYtGt4GQHhjdOl
	/2t7RyXCL59++UWR49NRqae+LOXUhHuyukzCKyNIroM6gYSFTW2U4YEahc/fammZn9flHkCl3kPlu
	t63FkFo0PRBwhyQV13d5dQp669eZh53f58pZhH8uBVx71MWT8gvpJl2ujeYsngC/bQ7nct5Xwo2nH
	NgfHq7yiXYLVdC5D5QOSWYg0ejFXuvJesfpKcT/hfoqMBUR3tQBoKoycjE1hSdPtGtPlfPj2G5lHl
	DNko72vpm2K+dVY/IGHPP0jZOy7zccdgacsl5QcXjiDt67qNnyudmKEtSAZ1wPqbYf8D7tBpUeTkC
	g4bpWBbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddGY-0000000Fl2u-3ey4;
	Wed, 07 Jan 2026 23:48:38 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vddGU-0000000Fl2U-3rIs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 23:48:37 +0000
Received: from eucas1p1.samsung.com (unknown [182.198.249.206])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260107234828euoutp0230bda24b8d7dcbf7663354a7f117f53b~Il8D46nMX0063600636euoutp02B
	for <linux-arm-kernel@lists.infradead.org>; Wed,  7 Jan 2026 23:48:28 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260107234828euoutp0230bda24b8d7dcbf7663354a7f117f53b~Il8D46nMX0063600636euoutp02B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1767829708;
	bh=TYCzIUiOEy3kP/HiVQ2wZRrRPpZ4XZI8gw9kTIvwkig=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=ZcRbrUwE0aCSm07m0ZAGZxJqi+smXR6sOaSkQNGRA/aaVVXXra1EA26P9OVZXHgoM
	 aGEhVYVOd3cGxnnM9aKFvNxes9G4ULczGDrTrEa1JxXTa/SmBbzJIT9RCMK9VIrcKZ
	 UFzKdI1lMTHP5Czb15+QUV6lIyPeYK3iCwEMt8FE=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260107234827eucas1p27fbd224b2f588f92989d2f7bfa08ab37~Il8C276YY0130501305eucas1p2E;
	Wed,  7 Jan 2026 23:48:27 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260107234825eusmtip2ddfb2c42a8a3442eed7670b1dee474df~Il8AyfPoH0345103451eusmtip2c;
	Wed,  7 Jan 2026 23:48:25 +0000 (GMT)
Message-ID: <77c70d7b-23bc-4f74-9a13-d10f4af132dd@samsung.com>
Date: Thu, 8 Jan 2026 00:48:24 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH 00/12] drm/bridge: convert users of
 of_drm_find_bridge(), part 2
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst
	<maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>,
	benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
	Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
	<jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien
	Grassein <adrien.grassein@gmail.com>, Liu Ying <victor.liu@nxp.com>, Shawn
	Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam
	<festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, Jagan Teki
	<jagan@amarulasolutions.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni
	<thomas.petazzoni@bootlin.com>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, stable@vger.kernel.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260107234827eucas1p27fbd224b2f588f92989d2f7bfa08ab37
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260107131333eucas1p2ee0b7afe47dc2fafa29e893e4283962b
X-EPHeader: CA
X-CMS-RootMailID: 20260107131333eucas1p2ee0b7afe47dc2fafa29e893e4283962b
References: <CGME20260107131333eucas1p2ee0b7afe47dc2fafa29e893e4283962b@eucas1p2.samsung.com>
	<20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_154835_541917_FCF4390D 
X-CRM114-Status: GOOD (  23.92  )
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

On 07.01.2026 14:12, Luca Ceresoli wrote:
> This series converts all DRM bridge drivers (*) from the now deprecated
> of_drm_find_bridge() to its replacement of_drm_find_and_get_bridge() which
> allows correct bridge refcounting. It also converts per-driver
> "next_bridge" pointers to the unified drm_bridge::next_bridge which puts
> the reference automatically on bridge deallocation.
>
> This is part of the work to support hotplug of DRM bridges. The grand plan
> was discussed in [0].

This patchset breaks Exynos DSI (Samsung-DSIM) driver operation on all 
my test boards. I will try to debug it and provide more information 
tomorrow though.


> Here's the work breakdown (➜ marks the current series):
>
>   1. ➜ add refcounting to DRM bridges struct drm_bridge,
>        based on devm_drm_bridge_alloc()
>      A. ✔ add new alloc API and refcounting (v6.16)
>      B. ✔ convert all bridge drivers to new API (v6.17)
>      C. ✔ kunit tests (v6.17)
>      D. ✔ add get/put to drm_bridge_add/remove() + attach/detach()
>           and warn on old allocation pattern (v6.17)
>      E. ➜ add get/put on drm_bridge accessors
>         1. ✔ drm_bridge_chain_get_first_bridge(), add cleanup action (v6.18)
>         2. ✔ drm_bridge_get_prev_bridge() (v6.18)
>         3. ✔ drm_bridge_get_next_bridge() (v6.19)
>         4. ✔ drm_for_each_bridge_in_chain() (v6.19)
>         5. ✔ drm_bridge_connector_init (v6.19)
>         6. … protect encoder bridge chain with a mutex
>         7. ➜ of_drm_find_bridge
>            a. ✔… add of_drm_get_bridge(), convert basic direct users
> 	        (v6.20?, one driver still pending)
> 	  b. ➜ convert direct of_drm_get_bridge() users, part 2
> 	  c.   convert direct of_drm_get_bridge() users, part 3
> 	  d.   convert direct of_drm_get_bridge() users, part 4
> 	  e.   convert bridge-only drm_of_find_panel_or_bridge() users
>         8. drm_of_find_panel_or_bridge, *_of_get_bridge
>         9. ✔ enforce drm_bridge_add before drm_bridge_attach (v6.19)
>      F. ✔ debugfs improvements
>         1. ✔ add top-level 'bridges' file (v6.16)
>         2. ✔ show refcount and list lingering bridges (v6.19)
>   2. … handle gracefully atomic updates during bridge removal
>      A. ✔ Add drm_dev_enter/exit() to protect device resources (v6.20?)
>      B. … protect private_obj removal from list
>   3. … DSI host-device driver interaction
>   4. ✔ removing the need for the "always-disconnected" connector
>   5. finish the hotplug bridge work, moving code to the core and potentially
>      removing the hotplug-bridge itself (this needs to be clarified as
>      points 1-3 are developed)
>
> [0] https://lore.kernel.org/lkml/20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com/#t
>
> This work is a continuation of the work to correctly handle bridge
> refcounting for existing of_drm_find_bridge(). The ground work is in:
>
>    - commit 293a8fd7721a ("drm/bridge: add of_drm_find_and_get_bridge()")
>    - commit 9da0e06abda8 ("drm/bridge: deprecate of_drm_find_bridge()")
>    - commit 3fdeae134ba9 ("drm/bridge: add next_bridge pointer to struct drm_bridge")
>
> The whole conversion is split in multiple series to make the review process
> a bit smoother. Parts 3 and 4 are converting non-bridge drivers (mostly
> encoders).
>
> (*) One bridge driver (synopsys/dw-hdmi) is converted in another series,
>      together with its (non-bridge) users. Additionally this series converts
>      drm_of_panel_bridge_remove() which is a special case, and has a bugfix
>      for it too.
>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
> Luca Ceresoli (12):
>        drm: of: drm_of_panel_bridge_remove(): fix device_node leak
>        drm: of: drm_of_panel_bridge_remove(): convert to of_drm_find_and_get_bridge()
>        drm/bridge: sii902x: convert to of_drm_find_and_get_bridge()
>        drm/bridge: thc63lvd1024: convert to of_drm_find_and_get_bridge()
>        drm/bridge: tfp410: convert to of_drm_find_and_get_bridge()
>        drm/bridge: tpd12s015: convert to of_drm_find_and_get_bridge()
>        drm/bridge: lt8912b: convert to of_drm_find_and_get_bridge()
>        drm/bridge: imx8mp-hdmi-pvi: convert to of_drm_find_and_get_bridge()
>        drm/bridge: imx8qxp-ldb: convert to of_drm_find_and_get_bridge()
>        drm/bridge: samsung-dsim: samsung_dsim_host_attach: use a temporary variable for the next bridge
>        drm/bridge: samsung-dsim: samsung_dsim_host_attach: don't use the bridge pointer as an error indicator
>        drm/bridge: samsung-dsim: samsung_dsim_host_attach: convert to of_drm_find_and_get_bridge()
>
>   drivers/gpu/drm/bridge/imx/imx8mp-hdmi-pvi.c | 15 +++++++-------
>   drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c     |  3 ++-
>   drivers/gpu/drm/bridge/lontium-lt8912b.c     | 31 ++++++++++++++--------------
>   drivers/gpu/drm/bridge/samsung-dsim.c        | 28 ++++++++++++++++---------
>   drivers/gpu/drm/bridge/sii902x.c             |  7 +++----
>   drivers/gpu/drm/bridge/thc63lvd1024.c        |  7 +++----
>   drivers/gpu/drm/bridge/ti-tfp410.c           | 27 ++++++++++++------------
>   drivers/gpu/drm/bridge/ti-tpd12s015.c        |  8 +++----
>   include/drm/bridge/samsung-dsim.h            |  1 -
>   include/drm/drm_of.h                         |  6 +++++-
>   10 files changed, 69 insertions(+), 64 deletions(-)
> ---
> base-commit: 2bcba510a612cea32b8a536eedeabd7fcb413cd0
> change-id: 20251223-drm-bridge-alloc-getput-drm_of_find_bridge-2-12c6bbcb6896
>
> Best regards,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


