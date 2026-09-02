Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40BAC61DD6
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Sep 2026 18:01:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jXYNobdVsuK2ipdiyYhs8Xo2vpnw68oVO9etWQ0Zmlc=; b=05aCEkiXX/dhWUnXa2NEef0TXt
	vPMjenpt+BImhvdV5LwDM5JwCyD/dPIeAaTqOo7WoheXUpnx9yhZjZHK7L8BK7TVWEgCynSyo7GSB
	9KMBoYqZwoMFBNb9tV0/hCidxa5ofOtyhO/fhd1hTCu0bWZNiVDRIma+EcwUrha1MHfqbnrP5gnDf
	8//P4Ehn7GZ6xiDEeY2qEHkQiFUp24YRQLhS8S46YnjoHnwtUw8vK7MTtYTIaSs1vuvYCYamrVtAU
	AmJoVFrA/KhmxHkJs78vt6C1nh+Oq59tq5qPT6XFAkq/1JFj4z5Je+LnyRYklV7x0+qNvMXzrzMoY
	nLAxWloA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pGf-0000000FWol-0Okx;
	Wed, 02 Sep 2026 18:01:01 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1pGd-0000000FWnL-0d1v;
	Wed, 02 Sep 2026 18:01:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788372054;
	bh=RFGuLr+hSZX4q95E8FmOb9I0Oj/VY5jMv/JY+fIYb70=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=kM8qFYh5ALIzTeH3UbstMxl+7wLpe4Bu2oDWFRouwXe8W1lQ2GcXh+oO+gqLoidmZ
	 HQMSqjKsWcNXbvTSuuxlb1faCUJMb8G8Q2KjH+S5nlOxiyhKfua21QDEf3ybTPMDn/
	 3kJolpG+4VJaUhI1Prg5LGUz+oDvMBVHfkRpy3tPaE4Oc2xDfbl3QO4+RJPRPqQXJx
	 E+FrN7SHhoB92fRWYYh9euh+0JLQRU4+nvzQNDFtaktWHWuZv56boO33PhpQou+Bnp
	 oJwFxRsjPWxC2hXEzrUrOBvYHt84IFXkSAraUfM8Nohm2jmh7IyExwzXcC9rsQspUj
	 tbeVQmjFUg3PA==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C7E3417E0260;
	Wed, 02 Sep 2026 20:00:53 +0200 (CEST)
Message-ID: <c40863d0-663c-4a29-9298-d9647393b4c1@collabora.com>
Date: Wed, 2 Sep 2026 21:00:53 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 00/74] Add HDMI 2.0 support to DW HDMI QP TX
To: Igor Paunovic <royalnet026@gmail.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Andrzej Hajda
 <andrzej.hajda@intel.com>, Neil Armstrong <neil.armstrong@linaro.org>,
 Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>,
 Samuel Holland <samuel@sholland.org>, mcanal@igalia.com,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Raphael Gallais-Pou <rgallaispou@gmail.com>, Sandy Huang
 <hjc@rock-chips.com>, Heiko Stuebner <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>,
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>,
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>,
 kernel@collabora.com, Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Diederik de Haas <diederik@cknow-tech.com>,
 Maud Spierings <maud_spierings@hotmail.com>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
 <20260902152838.5771-1-royalnet026@gmail.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260902152838.5771-1-royalnet026@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260902_110059_348459_F20BFABB 
X-CRM114-Status: GOOD (  19.78  )
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

Hi Igor,

On 9/2/26 6:28 PM, Igor Paunovic wrote:
> Hi Cristian,
> 
>> This has been tested on the following boards:
> 
> One more, with a sink pair your boards cannot cover:
> 
> Tested-by: Igor Paunovic <royalnet026@gmail.com> # RK3588 Orange Pi 5 Plus, dual HDMI
> 
> Setup: whole v11 on its stated base (drm-misc-next 47b823940e38),
> both SoC HDMI ports driven at once: a Samsung with HF-VSDB (max
> TMDS character rate 600 MHz, SCDC present) and a Sony limited to
> 300 MHz TMDS.
> 
> 1) HDMI 2.0 path: the Samsung now offers and runs 3840x2160@60 RGB
>    with a 594 MHz pixel clock (modetest-confirmed). Without the
>    series the same port tops out at 4K@30. A stable picture at
>    594 MHz is only possible with scrambling and the 1/40 TMDS ratio
>    active; it stayed stable across boot, mode changes and hotplug.
> 
> 2) Non-2.0 fallback: the Sony keeps its 297 MHz 4K@30 modes.
>    No regression.
> 
> 3) The result I care most about: this Sony in standby keeps EDID/5V
>    up but drops the link, and on my 7.2 stack that generates a
>    storm of detect/modeset cycles - measured 119-194 per hour,
>    enough to make the desktop stutter. On v11, twenty minutes of
>    standby produced ZERO events, and wake restored both sinks by
>    itself. Whatever share of that the cached-status detect and the
>    SCDC-loss handling each take - thank you.
> 
> 4) Hotplug on both ports: clean detach and reattach, no storms.
> 
> 5) Audio on a dead link: this morning my 7.2 stack took an SError
>    panic (regmap read in dw_hdmi_qp_bridge_clear_audio_infoframe
>    when a PCM was closed on a link whose SCDC never came up - full
>    UART trace available if useful). On v11 I could not reproduce
>    the class: six open/close cycles against the standby sink plus
>    one natural prepare-failure-then-close during replug all
>    survived cleanly. Caveat: different base kernels, so this is
>    not a clean A/B on the series alone.

Thanks for the detailed testing report!

> Scope: RGB output only (the YUV420 output series is separate), no
> USB-C DP on this base, VC4 side not exercised.

I will manually apply your T-b on the relevant patches before submitting a new
revision.

Cristian

