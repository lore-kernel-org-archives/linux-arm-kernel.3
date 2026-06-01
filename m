Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DC9CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 18:09:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UceJaB2RU+rG/YsCycrFgu7kuITVVGBgXvi5IHqcbPk=; b=preq507NEAJ7UOokD5jOhtmP5I
	vuX96QuvW9x4fGHPkjBlrYz5atlOvEtrEVmSyvvWXDF2+emutjJgkLXcewpuFrqDdJkFrZFBx8A9e
	s06fqxJrv//jqs/SnDmJDNzKMyomqxwZYI2ZKmkZGjInrlAsr4uxcyZyfZTfTEuF7exGl9QDZyaeF
	cE9Uz0f371Hw5vdrOn83K3d0eJ8Nk8zbXVOOzfAPfEwpRO3MGGjcuron9INYax63cNsSbewupc4TU
	pr9Da0u9dewwUvg5LKCjma3vA6QtPYHW+lwzCcWA0ma0X83euQOWOw5BtMJITPayiFXHRYRcoqTSs
	R1l8vToQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU74K-0000000Bdss-1hhF;
	Mon, 01 Jun 2026 18:08:56 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU74H-0000000Bds9-0nLI;
	Mon, 01 Jun 2026 18:08:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1780337330;
	bh=zc9LCVVcm97BP3J6QkyrVJS3s4P86SybatYOdqgAcEU=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=ptSoRfoa2oyn2v1Zeqoh/5J3GWxNhTZ7ofgdohodHHctrhSNcAh+zOURRxs28mlsd
	 o7+zLHXBe5LHI+smwgn4R6N1OPVG1KyXQ2poscNxrWpC5q5NXbRVbOaPV5n5VO+cYi
	 pCDLejTaIqpNh74HKkFf75lz53yGEdEmXcfX4upUwL/xEK1dqAztFZ5KcHNy9Og+fP
	 dVqLxMo4dnzgSyaFq4Z4WIbk+KPl0MyfJ4a2m2dc6s80o3hZeRPIB+4nHOR3BGJ2s0
	 yY8WxyxjUbaqvfiFdHGS/SXKoWYpCXzr8r2w0+ZGHszIKOnzIbANpbj79hA3CQG4p7
	 YpGytQiAjbr/Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6DDDC17E03A6;
	Mon,  1 Jun 2026 20:08:50 +0200 (CEST)
Message-ID: <b0a60e27-03ec-425e-8ecd-b8f9bdaadf93@collabora.com>
Date: Mon, 1 Jun 2026 21:08:49 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/2] YUV support for VOP2 background color
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260601-vop2-bg-yuv-v2-0-e5aef1d16fec@collabora.com>
Content-Language: en-US
In-Reply-To: <20260601-vop2-bg-yuv-v2-0-e5aef1d16fec@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_110853_379131_F2DE3622 
X-CRM114-Status: GOOD (  12.61  )
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

Something got messed by while preparing the cover letter.
Fixed manually..

On 6/1/26 9:00 PM, Cristian Ciocaltea wrote:
> Since commit bec7cbfa7d4f ("drm/rockchip: vop2: Support setting custom
> background color") the VOP2 display controller allows configuring the
> background color of each video output port.
> 
> However, this is currently limited to RGB formats.  When operating in
> YUV overlay mode, the color must be programmed using YUV format.
> 
> Add the necessary RGB-to-YCbCr conversion logic, covering all color
> spaces supported by the display controller: BT601L, BT601F, BT709L and
> BT2020L.
> 
> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
> ---
> Changes in v2:
> - Used vop2_convert_csc_mode() helper to address an issue reported by
>   Sashiko: vop2_rgb16_to_yuv16() expects an enum vop_csc_format, but
>   vcstate->color_space holds a V4L2 colorspace enum
> - Rebased onto latest drm-misc-next
> - Link to v1: https://patch.msgid.link/20260524-vop2-bg-yuv-v1-0-dcb6a52923f5@collabora.com
> 
> ---
> Cristian Ciocaltea (2):
>       drm/rockchip: vop2: Rename CSC_BT2020 to CSC_BT2020L
>       drm/rockchip: vop2: Add YUV support to background color
> 
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 155 ++++++++++++++++++++++++---
>  drivers/gpu/drm/rockchip/rockchip_drm_vop2.h |   2 +-
>  2 files changed, 140 insertions(+), 17 deletions(-)
> ---
> base-commit: e84b07e0a30b371117f9a1120a4645c213f39cd9
> change-id: 20260524-vop2-bg-yuv-1b0e6a09c579
> 


