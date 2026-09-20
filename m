Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A459AC982CC
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 09:44:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mhyJT4tSPEdmOyl+8zngLuOyM98EcqLVVR1iJBXeTcc=; b=aPUfLli0jVU4xIQVTvsjkQyAyr
	RGuG54T5ZltdFhgybT67I9oyiwuEsXHdIWl497yyLu+1Ne2JzRit/gxpqkNNcUVYY6x4aRbV9htnM
	mx+0eBeIBp/bqDq03xnq0KewAOjFZvD6A6z5mn/kke0CYKxgpWQng+cF9ptWBwH1n/iG15JoGbQ8V
	T6kfK5PdHqCzCD68tCEp2MoNFpvZiwiXjTp3lcQUSgiZAROhvJt4dIXl1x/XvT5WXPXfj7IBLrSL8
	MDHybsY5bX22ErOgqwQNfooq9pySfUzrEDLCudK8Ld6c0aC+x7IWrz//pCszwJQs8cL4qD+vPcktG
	8b4ZrX0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8E5q-0000000HCqm-0Nxt;
	Sun, 20 Sep 2026 09:44:18 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8E5n-0000000HCqD-17F1;
	Sun, 20 Sep 2026 09:44:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789897452;
	bh=VaCHIbqayKHpuRvZbdiid0ApzeVrHRM1euobbTzlPRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=peMEUP+Yy1BaYtTRZVdeYhHiwtL+emnJv+XSfsBsP0TW2HZHy3+OOhAonCgfrNZ6S
	 BzizMfHPTWfyeI+HWchhwSCwHYtP3BWE8ZQ0gXX8OF6XatXDvwNE+RbWihJ3fJTl3a
	 Q4Wk6lz2+tya3mYVne4ryXQSzpRjYYmWOzIyTwX6Bmjze5DwzXuBceSOJu7t6YcafJ
	 eu/oHb/IqBziro+swTA9msKOM8PibldK5ml919xoioItvmhl8XFD1XGPBXsbLp3dd/
	 WZca0ZjGKg1lzihFUT7mcbsuP/XtjoIF/h5A5Y1pzj5468Gt/MTI8LI1v7S3g0HuGF
	 /T1UTs74TSTpw==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4598517E00C9;
	Sun, 20 Sep 2026 11:44:09 +0200 (CEST)
Message-ID: <9e21c5c3-f8e6-4343-b4cc-52c9e84316ef@collabora.com>
Date: Sun, 20 Sep 2026 12:44:08 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP TX
To: Maxime Ripard <mripard@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, =?UTF-8?Q?Ma=C3=ADra_Canal?=
 <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>,
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>,
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>,
 kernel@collabora.com, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org,
 linux-fbdev@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Sashiko <sashiko-bot@kernel.org>, Diederik de Haas
 <diederik@cknow-tech.com>, Maud Spierings <maud_spierings@hotmail.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <ap_ZyC-XaHTUNyQ5@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <ap_ZyC-XaHTUNyQ5@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260920_024415_471755_215DE52C 
X-CRM114-Status: GOOD (  23.05  )
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

Hi Maxime,

On 9/8/26 12:48 PM, Maxime Ripard wrote:
> Hi,
> 
> On Tue, Sep 01, 2026 at 09:50:24PM +0300, Cristian Ciocaltea wrote:
>> Enable HDMI 2.0 display modes (e.g. 4K@60Hz) on the Synopsys DW HDMI QP
>> TX controller, as found in Rockchip RK3576 & RK3588 SoCs, by adding SCDC
>> management for high TMDS clock ratio and scrambling.  Since SCDC state
>> is lost on sink disconnects, the bridge driver needs to trigger a CRTC
>> reset during connector detection.
>>
>> To support this at the DRM infrastructure level, the series first
>> introduces the HDMI version enum, then prepares for changing the
>> signature of drmm_connector_hdmi_init(), i.e. dropping the vendor,
>> product, supported_formats and max_bpc arguments, which are being moved
>> into struct drm_connector_hdmi_funcs, by temporarily renaming the helper
>> to drmm_connector_hdmi_ini2().  This lets the new signature be
>> introduced under the original name while callers are converted
>> incrementally.  Note the transitional name matches the original's length
>> so continuation-line arguments stay aligned to the opening parenthesis,
>> keeping the diff to the identifier itself and avoiding re-alignment
>> churn.
>>
>> Appending more HDMI-specific arguments to the init function would not
>> scale well, hence the hdmi_funcs struct is extended with new fields:
>> supported_hdmi_ver, supported_tmds_char_rate.  These are used to
>> infer and/or limit the maximum TMDS character rate permitted for the
>> connector.
>>
>> Patches 6-11 build the connector and bridge scrambling infrastructure on
>> top: the connector scrambler callbacks/flags, the scdc-helper
>> additions (connector-prefixed debug macro and SCDC version helper), and
>> the HDMI scrambling management helpers including SCDC source-version
>> advertisement.
>>
>> Patches 12-25 wires this up through the hdmi-state-helper and bridge
>> connector layers: source TMDS rate validation, hotplug SCDC state sync
>> and the scrambling requirement, new source-side scrambling bridge ops,
>> the switch to a cached-status, atomic-aware .detect_ctx() connector
>> helper, and finally hooking up the HDMI 2.0 scrambler callbacks.
>>
>> The SCDC scrambling feature itself is implemented in the DW HDMI QP
>> bridge driver, alongside i2c error-message rate limiting,
>> .enable_hpd()/.disable_hpd() PHY ops and a dw_hdmi_qp_hpd_notify()
>> helper (patches 26-30).
>>
>> Patches 31-41 cover the Rockchip platform driver and HPD handling: bug
>> fixes, minor cleanups, avoiding spurious HDP IRQ wakeups, masking the
>> RK3576 HPD IRQ in io_init, implementing the .{enable|disable}_hpd() PHY
>> ops, switching HPD reports to dw_hdmi_qp_hpd_notify() to restrict events
>> to the affected connector, dropping the now-unused .setup_hpd() PHY op.
>>
>> Patches 42-48 convert VC4 HDMI to the common infrastructure as a proof
>> of reuse: adopting the shared TMDS char rate constants, switching to
>> drm_hdmi_mode_needs_scrambling() and force_ctx(), proper -EDEADLK
>> handling, and replacing the driver-local scrambling implementation with
>> the common SCDC scrambling helpers.
>>
>> Patches 50-57 advertise supported version for all HDMI
>> connectors/bridges, except the MediaTek HDMI driver (for now), as it
>> requires non-trivial changes: there's a core library shared between two
>> drivers, one being HDMI 2.0 compliant.
>>
>> Patches 58-67 add KUnit tests: HDMI caps-based init coverage and
>> source-side scrambler validation for the connector, conversion of
>> hdmi_state_helper to the new drmm_connector_hdmi_init() with
>> max_tmds_char_rate validation, a new 4K@60Hz 600MHz TMDS EDID,
>> source-side scrambling decision coverage, and conformity fixes for the
>> existing 1080p+4K YUV420 200MHz and 4K RGB/YUV 340MHz test EDID blobs.
>>
>> Patches 68-71 remove the now unused drmm_connector_hdmi_ini2() helper
>> and redundant hdmi fields from connector structs: vendor, product,
>> supported_formats and max_bpc.
>>
>> Eventually patches 72-74 consolidate SPD InfoFrame handling of
>> vendor/product.
>>
>> This has been tested on the following boards:
>>
>> * Radxa ROCK 5B (RK3588)
>> * Radxa ROCK 4D (RK3576)
>> * Raspberry Pi 5 Model B Rev 1.1 (BCM2712 D0)
> 
> This series is getting a bit insane. You have preliminary patches that
> have been reviewed/acked already, you should merge them, and possibly
> split the rest into preliminary series.

Thanks for the additional reviews, and sorry for my late reply - I've been on
leave and traveling.  I've merged the preliminary patches and will handle the
split upon my return, in about a week.

I plan to send separate series for vc4, dw-hdmi-qp, the rest of the bridge
drivers, kunit & final cleanup.

Regards,
Cristian

