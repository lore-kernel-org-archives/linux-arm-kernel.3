Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDED7C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 14:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5WoaeCt6QMlfCOt8rk9aELXE5NcT7EMB7vtmdtH/j8=; b=hy4DwuNvcD9Vdq8zgC6RVJ+L4p
	fFq/lIj8jh8Ko1Pd2d+E/DajTB7QRoILyosocrVNZeq+FkfntNO+AZkH6C8PH4jLzzLL/fGwpHVGa
	89RCdR9G05tN7SZdp+ZDXDRyg+27LpHitKhxHq3ykx3Fe1rpidAatFJSrnOjmIv30TActfb5eyPSG
	q0XWTcF2+c/zEQmQPfDwoJOQxJnrZLCPH8/jVmrUG/vMa9cr1phITTE9pGjmbLUYDRRUwc17X/RLu
	Hv4Rp+DNN3TD9y0LhQrEUGech9zLdlwuSQ4plxWNnuZOahWkFTEfJvNtGflIcDJzAfZOW64QUSRfs
	rlyWPlvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhkJ-0000000Eiq7-0ySS;
	Fri, 04 Jul 2025 14:50:35 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXhgT-0000000Ehyy-2qrD;
	Fri, 04 Jul 2025 14:46:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1751640395;
	bh=v8cXoT5/F19wrmjHbKU/PHIAXpvw0LXWFp/Fmehd2QY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jXS+rROx0FfOA3nvo+XoPJsrmSPiFsU84nd3JJxqdtnLXH9p9bfq3p5C9JerBnb1b
	 HOete7Iolcy99BpVMAP8IiEy1G6qfAtrOsmRkyNWBFO3lQI+lKw25MrrLN8rzRMrxb
	 SfklKP3CESeMsiJ4JeQ5cOXfa5Gv+BcrKvp5KZhcsMsdQbq1QIR0gL+PqbyarBREY4
	 5vH1F0cv8Kd0s/PSQ5LjSV8qsuMSs+RgjMBy/bCvMzBZOk7QV09NVETlR8V+qbVL7f
	 A6fYHyZaBIseHBvbvUvPRcng2yUMkpybaUZ2b297wANMRrnUqgkmF2PeikDhQRR2m3
	 +1S9plpne9+gw==
Received: from [192.168.1.90] (unknown [212.93.144.165])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6FC7A17E07FF;
	Fri,  4 Jul 2025 16:46:34 +0200 (CEST)
Message-ID: <f02af24c-18de-4b56-85cd-da7af8a73222@collabora.com>
Date: Fri, 4 Jul 2025 17:46:33 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in
 dw_hdmi_qp_plat_data
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Sandy Huang <hjc@rock-chips.com>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250704-rk3588-hdmi-cec-v1-0-2bd8de8700cd@collabora.com>
 <20250704-rk3588-hdmi-cec-v1-1-2bd8de8700cd@collabora.com>
 <13504186.5MRjnR8RnV@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <13504186.5MRjnR8RnV@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_074637_891589_235D1E47 
X-CRM114-Status: GOOD (  16.19  )
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

Hi Heiko,

On 7/4/25 5:37 PM, Heiko Stübner wrote:
> Hi Cristian,
> 
> Am Freitag, 4. Juli 2025, 16:23:22 Mitteleuropäische Sommerzeit schrieb Cristian Ciocaltea:
>> In preparation to support the CEC interface of the DesignWare HDMI QP IP
>> block, extend the platform data to provide the required IRQ number.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
>>  include/drm/bridge/dw_hdmi_qp.h                | 1 +
>>  2 files changed, 5 insertions(+)
>>
>> diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> index 7d531b6f4c098c6c548788dad487ce4613a2f32b..126e556025961e8645f3567b4d7a1c73cc2f2e7f 100644
>> --- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> +++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
>> @@ -539,6 +539,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
>>  	if (plat_data.main_irq < 0)
>>  		return plat_data.main_irq;
>>  
>> +	plat_data.cec_irq = platform_get_irq_byname(pdev, "cec");
>> +	if (plat_data.cec_irq < 0)
>> +		return plat_data.cec_irq;
>> +
>>  	irq = platform_get_irq_byname(pdev, "hpd");
>>  	if (irq < 0)
>>  		return irq;
>> diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
>> index e9be6d507ad9cdc55f5c7d6d3ef37eba41f1ce74..b4a9b739734ec7b67013b683fe6017551aa19172 100644
>> --- a/include/drm/bridge/dw_hdmi_qp.h
>> +++ b/include/drm/bridge/dw_hdmi_qp.h
>> @@ -23,6 +23,7 @@ struct dw_hdmi_qp_plat_data {
>>  	const struct dw_hdmi_qp_phy_ops *phy_ops;
>>  	void *phy_data;
>>  	int main_irq;
>> +	int cec_irq;
>>  };
> 
> from a structure point-of-view, I'd expect the series to be something like:
> 
> (1) drm/bridge: dw-hdmi-qp: Add CEC support
>     -> including adding the cec_irq to dw_hdmi_qp_plat_data
> (2) drm/bridge: dw-hdmi-qp: Fixup timer base setup
>     -> including adding the ref_clk_rate to dw_hdmi_qp_plat_data
> (3) drm/rockchip: dw_hdmi_qp: Provide CEC IRQ in dw_hdmi_qp_plat_data
> (4) drm/rockchip: dw_hdmi_qp: Provide ref clock rate in dw_hdmi_qp_plat_data
> (5) arm64: defconfig: Enable DW HDMI QP CEC support
> 
> The patches adding the generic functionality to the bridge should also
> include the needed elements and not depend on platform-specific patches.

You are right, that's a much better approach.

Thanks for the quick feedback!

Regards,
Cristian

