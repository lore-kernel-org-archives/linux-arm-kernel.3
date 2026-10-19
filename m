Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6ABCCA46C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Oct 2026 03:19:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bQMCpVw1uFP1boBJUVC1GNNS3Uq4o6Be3+8+DlETUU0=; b=zja4X/Cljg36wpxeJ34jPty31x
	c4MfRiIS9Z6p78c9qhvZHcp6BaJS0EHWML6BHs3B8tJXcXOT74EHPCbLH8zsG56tuhoEGxzOI2Fth
	u+7RV27E1y1jZg/A4AafWR0V9+VX40neZJ2/TsRC+gbGUYPpZy2HT2XBfVybMaO6rUcRUhVtQeIJu
	d+aOvLHp6dtXy+KHxflyyMksvoIZvM4bdZzEkQewfFJdy26IuGTW27xKfHiNGH+UUIaR4A4z5+foB
	MD8ErPhGxfY/s9OO+af5Tr7jVM80G0qouys2dvSfZoIta2Egq8uGDsDtosWCbzuihskMKXv4nV3OE
	7ikM7Izg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIduW-00000006Vy6-2YEs;
	Mon, 19 Oct 2026 03:19:40 +0000
Received: from mail-m1061.netease.com ([154.81.10.61])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIduS-00000006Vwv-0tka;
	Mon, 19 Oct 2026 03:19:38 +0000
Received: from [127.0.0.1] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 517ccec8a;
	Mon, 19 Oct 2026 11:19:24 +0800 (GMT+08:00)
Message-ID: <039f91a1-7944-4092-9f9c-29b60e8fb17a@rock-chips.com>
Date: Mon, 19 Oct 2026 11:19:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 6/6] drm/rockchip: dw_hdmi_qp: Advertise BT.709 and
 BT.2020 colorimetries
To: =?UTF-8?Q?Jan_Clau=C3=9Fen?= <jan.claussen10@web.de>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 dri-devel@lists.freedesktop.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261018123037.19560-1-jan.claussen10@web.de>
 <20261018123037.19560-7-jan.claussen10@web.de>
Content-Language: en-US
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <20261018123037.19560-7-jan.claussen10@web.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0aa1522bcbba03a7kunm2ba821ca621edd
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlDTR9KVhkaGExPSRkdSxhJT1YVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=X8qrc33bAdqlCUhSSbAnZ7Rg0xsGeQmWcCbJS176oyZkg2wZzy/HQVrpMmR7d7krcZ8mgQDMHVWnffVtLTJOO/maaoxdKbG7QGGk9gvw5pkv9W6qA8geJFC97doHHcDT4cxXOMCS8Cwt/F6Ozb2vYl+RaJa1xkjdhBwCavmCljM=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=bQMCpVw1uFP1boBJUVC1GNNS3Uq4o6Be3+8+DlETUU0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261018_201936_875529_62DF3835 
X-CRM114-Status: GOOD (  15.01  )
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

Hi Jan,

On 10/18/2026 8:30 PM, Jan Claußen wrote:
> Expose BT.2020 RGB and YCC colorimetry so userspace can enable HDR
> output. Also explicitly expose BT.709 YCC as it is listed in the
> Rockchip RK3588 TRM V1.0-Part2 20220309 data sheet.
> 
> Tested on a Radxa Rock 5B (RK3588) with an LG OLED55B87LC in KDE
> Plasma 6.7.5: enabling HDR switches the colorspace to BT.2020, and
> disabling it restores the default.
> 
> Signed-off-by: Jan Claußen <jan.claussen10@web.de>
> ---
> 
> Not sure if BT.709 needs to be explicitly exposed here, but it is mentioned in the data sheet.
> Might be covered by DRM_MODE_COLORIMETRY_DEFAULT though.

Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>

Hi Cristian, may be you would be interested in this series?

"DEFAULT" may refer to either BT.601 or BT.709. It should support the
following color spaces:

#define HDMI_COLORSPACE_CAPS_V1		(DRM_MODE_COLORIMETRY_DEFAULT | \
					DRM_MODE_COLORIMETRY_SMPTE_170M_YCC | \
					DRM_MODE_COLORIMETRY_BT709_YCC | \
					DRM_MODE_COLORIMETRY_BT2020_RGB)

#define HDMI_COLORSPACE_CAPS_V2		(HDMI_COLORSPACE_CAPS_V1 | \
					DRM_MODE_COLORIMETRY_DCI_P3_RGB_D65)

> 
> BT.709/BT.2020 YCC are untested.
> 
>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> index 9c4cf68d79d5..dbb87dfd000c 100644
> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
> @@ -605,6 +605,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>  				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
>  				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
>  
> +	plat_data.supported_colorspaces = BIT(DRM_MODE_COLORIMETRY_BT709_YCC) |
> +				      BIT(DRM_MODE_COLORIMETRY_BT2020_RGB) |
> +				      BIT(DRM_MODE_COLORIMETRY_BT2020_YCC);
> +
>  	encoder = &hdmi->encoder.encoder;
>  	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
>  

-- 
Best, 
Chaoyi

