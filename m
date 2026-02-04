Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7F03EA7947
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 20:32:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYRiCFb5LsU0iriLu+Q4K1Gft/kImdlL0psypnwbTXc=; b=EN8kKOx4DFNvGFipYQT4q4IZWi
	GmE8hq6OfbfC+gWKkU97Z06Cxvv9sls1rkeCOAuUM2afWNSFMlQMbqHQw5M45moneR1tecVLgTWtj
	Id2tAMsi/8dGU9ren4/2PFs7Mlp5f+21cpE5STLtTrwQQQzPsz1L/kO0QQcNk0V3pvU6VAUQ+PyCg
	dxPcoSxS83u1g5ntWPVmiFxXjQQ2JApJ6DCHfWhFnBxx1fBoNJsNZn1Ujm8LirgZwx5W/DTLvLC4N
	QZLzwSpDYtv/3u4xZfaJEzAtJiE28pAu/1xwC2QnT+5cQ/hkdamf3ERWE7EKaV3VpXHX9GY9YepDW
	akXLu/cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnjY7-000000093Sy-0wMi;
	Wed, 04 Feb 2026 20:32:31 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnjY4-000000093SU-1lk2;
	Wed, 04 Feb 2026 20:32:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770237145;
	bh=a5HSgzMe6JzpxSmMVQbxrnjFpksd7486GnNw1YVR+nc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cs3rpa8Fe3jTdxyppmsK8KRRNbyqKWp39e7A/bIbO5JqbczcCVOE67fj8m7N/Muud
	 3nH7ZY734SEWfGASW7iONGl1Bx/QN12mv2OOxhybhJ5GIINJL81uQwmaf678/YsHLn
	 1Qooo+akVTa1j5ujmGUdNs27RrNZHUbR0Uo6IwcK1Fq2ZKWs5iCGYbTUoOLeKFa4AR
	 R0n2pLbJS3KCcuvZEuscTuR2UXOlAH9DAbgNPz1f16tAe8E/YFYfn9fziP8Ub7OhWN
	 FYXiuE6HedPjNyTwyJXelCkZ2VpsFg5zlGG2vLRDJYcu6kzi8cxfTvHKit1cZ9okUp
	 1kFu9OA8PMARw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 4863917E12C6;
	Wed,  4 Feb 2026 21:32:24 +0100 (CET)
Message-ID: <97a4fd2d-62e2-41ad-8ee9-d2551c3ab312@collabora.com>
Date: Wed, 4 Feb 2026 22:32:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/4] drm: Add CRTC background color property
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>,
 Jani Nikula <jani.nikula@linux.intel.com>,
 Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>,
 =?UTF-8?B?TsOtY29sYXMgRi4gUi4gQS4gUHJhZG8=?= <nfraprado@collabora.com>,
 Diederik de Haas <diederik@cknow-tech.com>
References: <20260129-rk3588-bgcolor-v6-0-c15f755a4055@collabora.com>
 <20260129-rk3588-bgcolor-v6-2-c15f755a4055@collabora.com>
 <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aXsp2s5a7sJL7Itp@smile.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_123228_635772_2DB8F75B 
X-CRM114-Status: GOOD (  18.59  )
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

On 1/29/26 11:37 AM, Andy Shevchenko wrote:
> On Thu, Jan 29, 2026 at 02:58:52AM +0200, Cristian Ciocaltea wrote:
>> Some display controllers can be hardware programmed to show non-black
>> colors for pixels that are either not covered by any plane or are
>> exposed through transparent regions of higher planes.  This feature can
>> help reduce memory bandwidth usage, e.g. in compositors managing a UI
>> with a solid background color while using smaller planes to render the
>> remaining content.
>>
>> To support this capability, introduce the BACKGROUND_COLOR standard DRM
>> mode property, which can be attached to a CRTC through the
>> drm_crtc_attach_background_color_property() helper function.
>>
>> Additionally, define a 64-bit ARGB format value to be built with the
>> help of a couple of dedicated DRM_ARGB64_PREP*() helpers.  Individual
>> color components can be extracted with desired precision using the
>> corresponding DRM_ARGB64_GET*() macros.
> 
> ...
> 
>> +/*
>> + * Put 16-bit ARGB values into a standard 64-bit representation that can be
>> + * used for ioctl parameters, inter-driver communication, etc.
>> + *
>> + * If the component values being provided contain less than 16 bits of
>> + * precision, use a conversion ratio to get a better color approximation.
>> + * The ratio is computed as (2^16 - 1) / (2^bpc - 1), where bpc and 16 are
>> + * the input and output precision, respectively.
> 
> Not sure if you should explicitly mention that "bpc must not be 0"
> (it can be derived from the "division by 0" in the given formula,
> but still...).

Comment section updated in v7 [1], though I somehow missed to mention it in the
changelog. :-(

> 
>> + */
>> +#define __DRM_ARGB64_PREP(c, shift)					\
>> +	(((__u64)(c) & __GENMASK(15, 0)) << (shift))
>> +
>> +#define __DRM_ARGB64_PREP_BPC(c, shift, bpc)({				\
> 
> Not sure if this is an accepted style in DRM, by I find it difficult
> to follow. I would expect the "({" be on a separate line.

I initially got confused by the plethora of different styles, e.g. in
"include/linux/math.h" we can find:

  #define rounddown(x, y) (				\
  [...]

  #define DIV_ROUND_CLOSEST_ULL(x, divisor)(		\
  [...]

  #define mult_frac(x, n, d)	\
  ({				\
  [...]

  #define abs_diff(a, b) ({			\
  [...]

I agree your option is the most readable one, hence I used it consistently in
v7.

Thanks,
Cristian

[1] https://lore.kernel.org/all/20260204-rk3588-bgcolor-v7-0-78d1d01c5ca1@collabora.com/


