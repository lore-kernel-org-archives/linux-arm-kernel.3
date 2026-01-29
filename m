Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59E76D46C16
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Jan 2026 01:30:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qnxf4dRPu+XrSftVF+5p3kNUbRVR5f3taf3WgnGmipo=; b=bEKlOIXIOOjmT7w5B0oRZq8yxm
	akNZR+dH63KIKqukwJGVvHJ74hEB1RJuweg+kNhkDr+TajkC4TZFtYkaLQXo/zyJhT7H+6ERzBPT5
	TVDhkotKXTxaWaTLLrkRsCPW7LviZIzFTTbFKNIsqtffJeEFGFNqzNgnFwqmHpPt0FlAX2J0HWGxY
	Pnn7tvAec4zvxQ4FrCRYn2RyKakT6ySqgnFuE8YXetIFrqNuaIZYYWTmRS5VfIBNyydZ11GDUcBeo
	3MaPlipHyu3DTd4hsjjEYxtSAyLrf5B8D06eZYXBzv6gltDSg3a96rTksovky0FT3AMbJVxMpBqe/
	eD/nOtyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGrC-0000000H3lx-0snZ;
	Thu, 29 Jan 2026 01:30:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlGr7-0000000H3km-1slf;
	Thu, 29 Jan 2026 01:29:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769650194;
	bh=h0ecRNsfJ1Ube1J+JZXHXMdInIH2cgiRidIImkm0O+k=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=neCo575Z4Za2yqJAuvx89d1Q/6/2VLrejV3axS35SX0sKtOAqMqdtBPPXzeEmgLIu
	 4CuXicCb/i5U7tRW3TxuhZvT6uTqJ/LlIFw5TylHXLAnNjj2OwHw+Old4hE3bXcvUt
	 bKewde9m2KWTnFeWqVrI0b1OJdnMkllmby7/7s8YYXe+4+6hUJ8/2nskFYGY28uF8w
	 F+ITG/7Cn6tql80E6DtFE+2bZ/h5N6sjJConXoAjjiJtS882mwFAWU+MGtVWQPwXCz
	 Z6C3JUa4CSS5V8mE8Tff3WXtHdGHYuPh3qQpLVi0p/4+E59BZAG5HKBgSeVvg2346h
	 lxbAKgCygUjtw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 274FB17E0699;
	Thu, 29 Jan 2026 02:29:54 +0100 (CET)
Message-ID: <64633be5-4be9-469c-9164-c1d584ea4c7b@collabora.com>
Date: Thu, 29 Jan 2026 03:29:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260127-rk3588-bgcolor-v5-0-b25aa8613211@collabora.com>
 <20260127-rk3588-bgcolor-v5-4-b25aa8613211@collabora.com>
 <aXjPjNWl3oVOVYxV@black.igk.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aXjPjNWl3oVOVYxV@black.igk.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_172957_685503_95B7DFD1 
X-CRM114-Status: GOOD (  17.81  )
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

On 1/27/26 4:45 PM, Andy Shevchenko wrote:
> On Tue, Jan 27, 2026 at 10:45:36AM +0200, Cristian Ciocaltea wrote:
>> The Rockchip VOP2 display controller allows configuring the background
>> color of each video output port.
>>
>> Since a previous patch introduced the BACKGROUND_COLOR CRTC property,
>> which defaults to solid black, make use of it when programming the
>> hardware.
>>
>> Note the maximum precision allowed by the display controller is 10bpc,
>> while the alpha component is not supported, hence ignored.
> 
> ...
> 
>> +	/*
>> +	 * Background color is programmed with 10 bits of precision.
>> +	 * Since performance is more important than accuracy here,
>> +	 * do *not* make use of the DRM_ARGB64_GET*_BPC() helpers.
>> +	 */
>> +	val = FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_RED, DRM_ARGB64_GETR(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_GREEN, DRM_ARGB64_GETG(bgcolor) >> 6);
>> +	val |= FIELD_PREP(RK3568_VP_DSP_BG__DSP_BG_BLUE, DRM_ARGB64_GETB(bgcolor) >> 6);
> 
> There is FIELD_MODIFY() for a few cycles already.

I've been aware, but found it more appropriate when modifying an existing value
(e.g. previously read from a register) rather than when computing one from
scratch. 

> But here it probably makes no much difference.

Thinking again about this, it is actually handy when keeping the first
FIELD_PREP (for initialization), and using it just for the subsequent
operations.  Hence considered this approach in v6.

> ...
> 
>> +	seq_printf(s, "\tbackground color (10bpc): r=0x%x g=0x%x b=0x%x\n",
>> +		   DRM_ARGB64_GETR(cstate->background_color) >> 6,
>> +		   DRM_ARGB64_GETG(cstate->background_color) >> 6,
>> +		   DRM_ARGB64_GETB(cstate->background_color) >> 6);
> 
> Probably you want to have the alternative to the DRM_ARGB64_GETx() macros which
> incorporates a right-shift. But it all in regard to DRM style and preferences.

I tried to keep the API as simple as possible, but you're right, it's better to
have those macros rather than open-coding the bit-shift all over.  Also handled
in v6.

Thanks again,
Cristian

