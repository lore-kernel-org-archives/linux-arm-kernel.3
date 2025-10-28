Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 057C9CCD1BF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Oct 2025 14:57:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bD6SEHvu2NjW+l1XyKi7j0n6N+oC5xQAf6bz5UB0QJA=; b=bAejAnJOAF2o2w3altwg4RndCT
	PJxWy80/itc+ig42YZ+B7z9R2FZwf5nZMjNo4bvgaRe7Z5ymxBJ1WI0wLxgW+kZh3wgOWAqE+rJOX
	c7amTm798MruJmP6ftHWdvY5BbcFCP6vRInhObhtuLiP4Vq9Ihp5n5Bbxxz7NrpkE7Eag8MIoxnUk
	vHy2vAE/DW2UGWLZG3An1+jR0ytZ0HGbFIzgsmi1r/ffeY5VV/fF2F4NhFxL+4jBVrPQtRq9D/uWU
	kVu3Z/HXbqHpKNM4WPj1R6/g5cdFDKg4tIAH+ErRwV4pm8X3GN2HkCsISQmjjQPlwTZ0tSfpyr2N4
	nN/i3H9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl8I-0000000G7uA-3pib;
	Tue, 28 Oct 2025 14:57:10 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDl8G-0000000G7sz-2dYU;
	Tue, 28 Oct 2025 14:57:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1761663424;
	bh=pRY4+GGhGf/5nLNZrRYoTRzXWCb0qRy5AHjVl+G2awk=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=VUmkSaoKTS+yPKGuGBcHWonNmB2/Ng+5wsj2Anc+azB5ShC5mZQOL/6/TF73VN2Po
	 vKvHn1Jdx3EIMnm+NgAKueYwBaYSbvg+Z4K5yAVq0E8zbXHxzgi7GjJXOhTV88wqiw
	 bFoshICpvlhba+h6cRZKSdBC2AnpVZm5LsXP3FyCDs0R9MdnXMo+fiEp3A5kSjK8Nu
	 K/WBIKc4F4A07dZtENez/rMgd8tj5Go7tD8nr4Ho2PfTg80yQbkiJno/we/Z0X+4Yx
	 QXhAKVBuyphmdyyiAZA78AWxYIlsgiOHW05+MufYz5POsFyiW0AlG/8pH8uZ6Kgie6
	 +NXOdd6K4u7Bg==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 04CD317E139C;
	Tue, 28 Oct 2025 15:57:03 +0100 (CET)
Message-ID: <63003a7e-8d3d-433a-8a44-54fe8740bc3a@collabora.com>
Date: Tue, 28 Oct 2025 16:57:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/6] Add HDMI CEC support to Rockchip RK3588/RK3576
 SoCs
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
To: Mark Brown <broonie@kernel.org>
Cc: Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Algea Cao <algea.cao@rock-chips.com>,
 Derek Foreman <derek.foreman@collabora.com>,
 Daniel Stone <daniels@collabora.com>, Aishwarya.TCV@arm.com
References: <20250903-rk3588-hdmi-cec-v4-0-fa25163c4b08@collabora.com>
 <6f3f126d-72c1-48cb-a9c8-8d354af2a3d5@sirena.org.uk>
 <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
Content-Language: en-US
In-Reply-To: <410fa913-e86b-4ffd-9d79-ce804f0271ff@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251028_075708_837802_2D884504 
X-CRM114-Status: GOOD (  16.15  )
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

On 10/28/25 2:42 PM, Cristian Ciocaltea wrote:
> Hi Mark,
> 
> On 10/28/25 2:38 PM, Mark Brown wrote:
>> On Wed, Sep 03, 2025 at 09:50:58PM +0300, Cristian Ciocaltea wrote:
>>> The first patch in the series implements the CEC capability of the
>>> Synopsys DesignWare HDMI QP TX controller found in RK3588 & RK3576 Socs.
>>> This is based on the downstream code, but rewritten on top of the CEC
>>> helpers added recently to the DRM HDMI connector framework.
>>
>> For the past couple of weeks we've been seeing various instability with
>> the graphics drivers on the Rock 5B in -next, the most common system is
>> that we get faults in code that looks suspiciously relevant to this
>> series:
>>
>> <6>[   17.353368] rockchip-drm display-subsystem: bound fdd90000.vop (ops vop2_component_ops [rockchipdrm])
>> <6>[   17.355237] dwhdmiqp-rockchip fde80000.hdmi: registered DesignWare HDMI QP I2C bus driver
>> / # <1>[   17.357803] Unable to handle kernel NULL pointer dereference at virtual address 0000000000000098
>>
>> ...
>>
>> <4>[   17.372390] Hardware name: Radxa ROCK 5B (DT)
>>
>> ...
>>
>> <4>[   17.382082] Call trace:
>> <4>[   17.382317]  drm_bridge_connector_hdmi_cec_init+0x8/0x38 [drm_display_helper] (P)
>> <4>[   17.383003]  drm_bridge_connector_init+0x658/0x678 [drm_display_helper]
>> <4>[   17.383612]  dw_hdmi_qp_rockchip_bind+0x35c/0x4d8 [rockchipdrm]
>> <4>[   17.384159]  component_bind_all+0x118/0x248
>> <4>[   17.384550]  rockchip_drm_bind+0xb4/0x20c [rockchipdrm]
>> <4>[   17.385034]  try_to_bring_up_aggregate_device+0x164/0x1d0
>> <4>[   17.385528]  component_master_add_with_match+0xc4/0x104
>> <4>[   17.386008]  rockchip_drm_platform_probe+0x1f8/0x31c [rockchipdrm]
>>
>> (from today's -next, 
>>
>> Unfortunately we haven't managed to point at a specific commit, it looks
>> like this might be triggered by multiple serieses interacting with each
>> other.  I'm not sure what other information might be useful here?
> 
> Thanks for reporting, I will investigate.

This seems to have been already addressed:

https://lore.kernel.org/all/20251017-drm-bridge-alloc-getput-bridge-connector-fix-hdmi_cec-v2-0-667abf6d47c0@bootlin.com/
> Regards,
> Cristian


