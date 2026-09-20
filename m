Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8BC7C982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:28:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bBWXcJcC7r5udU+f3JskB9mXvpSquvdhffCz5TjSixQ=; b=hNOe2vN4mF7eylhppavlLT+5dT
	aOkiIQWc8lq9QYFXxPBCdhQLCt1gQMIVA7ZlhIIJyoYxRRCqut4uaLq+TW1uG1zkZxnHMIG6WUUz9
	OMy/YM7MegyBJ1nWn/gGzNNTHayiscvCtZmm3RZ+Ep0kTfIZMitkfIHKiNS9I8Gey+bdBcFvhCv7S
	CA0ZmiODkwz1yzA+H8ZRdnCUBMKDVaaIVcjOR0U9WmS9fb1U8IvoqYFpsb90YXQUzCYpMJ+IcG6Vm
	Dzd96YUGOibZjoHx4mtm55Ug/tDuXxJ/hZGzOORa8MGpzg7iWCFzt5kQUqde13h9qSNovnK06Nvu/
	mty+FADg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8DqC-0000000HBUG-0ncA;
	Sun, 20 Sep 2026 09:28:08 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8Dq9-0000000HBTJ-0fOA;
	Sun, 20 Sep 2026 09:28:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789896481;
	bh=EoI40flYwN+zpgSdnYx5O+fi9UEpSqaecE9jBZjjW3o=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date:From;
	b=PRxmCpGt3GUsYG4tG7M1H6BjhtIo0Uh3CwN15Xy6WylIYP/hCx04xCXVSLRGGtKVA
	 0HY3O4dYtRXyxhnY+gvASluQEXUIiZemmlzowpYN1EUTsddMCB8yH1Fb7TOizzQ3RC
	 F0uLVHB8uhxKD6p39UOWwFxA3KAdAsxD9NREh8gxQ0xWXertJMQdLwHXv+eVV2Nc1X
	 i9Uk0y0j+HUlmA5IwG1WSKM+q08DYXZ1HkNTB6vbdK68SI9AqSBe5tLy1Q0eUX43T4
	 EvhmFA2g384cDc3gBo4ARZhO+KxXF1QBaLASh3ClOjHiPiUTMi5rknq1eJYq6hU10C
	 Q6mbAwxEMd/Hw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CF03E17E056A;
	Sun, 20 Sep 2026 11:28:00 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Sashiko <sashiko-bot@kernel.org>, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
Subject: Re: (subset) [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP
 TX
Message-Id: <178989644664.716970.16229682978817466713.b4-ty@b4>
Date: Sun, 20 Sep 2026 12:27:26 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.17-dev-36e3f
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_022805_376711_4E0D00AE 
X-CRM114-Status: GOOD (  11.54  )
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


On Tue, 01 Sep 2026 21:50:24 +0300, Cristian Ciocaltea wrote:
> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
> management for high TMDS clock ratio and scrambling.  Since SCDC state
> is lost on sink disconnects, the bridge driver needs to trigger a CRTC
> reset during connector detection.
> 
> To support this at the DRM infrastructure level, the series first
> introduces the HDMI version enum, then prepares for changing the
> signature of drmm_connector_hdmi_init(), i.e. dropping the vendor,
> product, supported_formats and max_bpc arguments, which are being moved
> into struct drm_connector_hdmi_funcs, by temporarily renaming the helper
> to drmm_connector_hdmi_ini2().  This lets the new signature be
> introduced under the original name while callers are converted
> incrementally.  Note the transitional name matches the original's length
> so continuation-line arguments stay aligned to the opening parenthesis,
> keeping the diff to the identifier itself and avoiding re-alignment
> churn.
> 
> [...]

Applied, thanks!

[01/74] video/hdmi: Introduce HDMI version enum
        commit: f0459aabf9e057920567b22a852ab36966cc291a
[02/74] drm/connector: hdmi: Handle reset() state allocation failure
        commit: 54acd0c74eba2a2c9a726856f5fdc6f9e74ea2e1
[03/74] drm/display: hdmi: Rename drmm_connector_hdmi_init() to *_ini2()
        commit: 245e321b61e384d956b95a3bfa59ac25ca4609c6
[04/74] drm/connector: Add drmm_connector_hdmi_init() with new signature
        commit: 400c9ede1ea4a4f26931a269b60de34cb26d51ec
[05/74] drm/display: bridge_connector: Convert to drmm_connector_hdmi_init()
        commit: cc6d8b2f87b97477ae25dcc1adb8e6e5a0088e4a
[06/74] drm/probe-helper: Introduce .force_ctx() connector callback
        commit: 9d1e2ae7196dacc90acc00a73b92c11662eb90ca
[07/74] drm/connector: Add HDMI 2.0 scrambler infrastructure
        commit: f27fb7e315216b8bddf29297542c471368a672b4
[08/74] drm/display: scdc-helper: Add macro for connector-prefixed debug messages
        commit: 62cdbd8d50c510e8b61266e043c04870b7877b8b
[09/74] drm/display: scdc-helper: Add helper to set SCDC version information
        commit: f57c2198380fcf475404c159c784d0ee70fa091b
[10/74] drm/display: hdmi: Add HDMI 2.0 scrambling management helpers
        commit: d653818324edc79d8dd55f77496220d3849910d0
[11/74] drm/display: hdmi: Advertise SCDC source version when scrambling
        commit: bc4dcf6f93778b182ad90233d3049acd9227136c
[15/74] drm/bridge: Remove redundant error check in drm_bridge_helper_reset_crtc()
        commit: 44fd815ec6ab5ae8e01de26529fe867bd0c07da1
[16/74] drm/bridge: Add bridge ops for source-side HDMI 2.0 scrambling
        commit: 2e37ecb36d8e989a514d5f921eadd91ed178861d
[17/74] drm/display: bridge_connector: Use cached connector status in .get_modes()
        commit: 4cf0eae2fc53b6933fe930450b46b20b0cfac4f2
[18/74] drm/display: bridge_connector: Switch to .detect_ctx() connector helper
        commit: a23d96ee6afbe7148c462f1ce017425628b4db45
[19/74] drm/display: bridge_connector: Wire up HDMI 2.0 scrambler callbacks
        commit: 8e5aa7fe23dbe6e3cba93f4eb1f5f56e2ad70ee7
[20/74] drm/display: hdmi-state-helper: Add source TMDS rate validation
        commit: 0f7bb8f4d26abbc27e78e633b44cac2279f0ce1e
[21/74] drm/display: hdmi-state-helper: Pass acquire ctx to hotplug helpers
        commit: 43c92f4c887e6ca6bdac1f80ed8087226c71b756
[22/74] drm/display: hdmi-state-helper: Add drm_atomic_helper_connector_hdmi_force_ctx()
        commit: 8ed0167d56e3d2ae3a8f8b1423d59de60aa457d4
[23/74] drm/display: hdmi-state-helper: Sync SCDC state on hotplug
        commit: 6867cd55ee5530851847ebed6ebab0b9f329e5ba
[24/74] drm/display: hdmi-state-helper: Set HDMI scrambling requirement
        commit: 23eef7a1c5f341315e66c1ef60ce525b64f0a2e3
[25/74] drm/display: bridge_connector: Switch to .force_ctx() connector helper
        commit: b4e30bf687ab5131ca5aa063abda6d0e9ddbc8e4

Best regards,
-- 
Cristian Ciocaltea <cristian.ciocaltea@collabora.com>


