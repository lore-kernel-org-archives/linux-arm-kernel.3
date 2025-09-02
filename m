Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75D4CCA1005
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Sep 2025 22:58:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u7GIiCQN9D27G1z6WErS2+1QWEeXcHwjOPa6iiJ9sa0=; b=ikuEcO7or8NiygxAae0q+Dtmre
	j2GRZwxow/+EOOXaH2GFaUraEd2RR6StEFD4tiNsSQlymxUDFdyUHIpI7J6t5uIjC0LRyLaq0EmNW
	WeMLkxRDYAA/Dh4ru4H/S3EDDoBWoiK67I1tkocFtdyI7xheIEUjMhZakgYfquxzIkIaofws20/Mh
	hZWRAczOjSPy3JBjg7LOMsOq4Hydhv3oNhquCg0Vr91a6czwR+cZRnZHq7ZN4bwQ7ZR7DHT2s8aqi
	G/ENODDJjg5oYSvneNtF9TpX9j6XiB7NiaFqnZhAJVWTJPWJsDInONemGZPscsP+GsVecomqrXvo2
	ZDoZqpJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utZwj-00000002UXP-1IMn;
	Tue, 02 Sep 2025 22:57:49 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utTpc-00000000wfg-3k2V;
	Tue, 02 Sep 2025 16:26:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1756830362;
	bh=WALewwHx2C+Gr6Q65PLmSt5V0bZuUMTVLBppkG5GReI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mnz2RLK4X3Hk5GbUktymH8Z7xV3xj05l/Ro6j5NbhrNjDWsApUu8raDBfmlyQaJpT
	 BVPoxC4eqLR3B+te5KPtj0FiQ1ymxK+fJo23QM2Kq8ihnBNB6t/lT0YvhU48OD/S1A
	 IT1BK+xCwrQDeZqG2pHK8ijHJcop/QUFi57O9hR4Fr6CNSb3WD8DE+/WImSnPaI2oV
	 3rSa7s6KWHrnrGj2EC+3BcOSJfOFz5IadIRB6dZq3G1FCxI68dOqclnUdZda5CKMnD
	 tnQcQvg0wg1GGHeLx/vLzWkxAfjYaO79PVi8Aj5VUf5a2Ifp4YkAoD7RepZN4x+vmf
	 OMyM4CwsQQqtQ==
Received: from [192.168.1.90] (unknown [82.79.138.60])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2FDA617E0B84;
	Tue,  2 Sep 2025 18:26:02 +0200 (CEST)
Message-ID: <2a8ab8c3-36ae-46bd-8f98-6b3760532cb5@collabora.com>
Date: Tue, 2 Sep 2025 19:26:01 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] drm: Add CRTC background color property
To: =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Matt Roper <matthew.d.roper@intel.com>
References: <20250902-rk3588-bgcolor-v1-0-fd97df91d89f@collabora.com>
 <20250902-rk3588-bgcolor-v1-1-fd97df91d89f@collabora.com>
 <aLby6OPxgubt7kd_@intel.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <aLby6OPxgubt7kd_@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250902_092605_080674_816F54B5 
X-CRM114-Status: GOOD (  16.37  )
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

On 9/2/25 4:36 PM, Ville Syrjälä wrote:
> On Tue, Sep 02, 2025 at 12:27:56PM +0300, Cristian Ciocaltea wrote:
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
>> help of a dedicated drm_argb64() utility macro.  Individual color
>> components can be extracted with desired precision using the
>> corresponding DRM_ARGB64_*() macros.
>>
>> Co-developed-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Matt Roper <matthew.d.roper@intel.com>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/gpu/drm/drm_atomic_state_helper.c |  1 +
>>  drivers/gpu/drm/drm_atomic_uapi.c         |  4 ++++
>>  drivers/gpu/drm/drm_blend.c               | 37 +++++++++++++++++++++++++++----
>>  drivers/gpu/drm/drm_mode_config.c         |  6 +++++
>>  include/drm/drm_blend.h                   |  4 +++-
>>  include/drm/drm_crtc.h                    | 12 ++++++++++
>>  include/drm/drm_mode_config.h             |  5 +++++
>>  include/uapi/drm/drm_mode.h               | 30 +++++++++++++++++++++++++
>>  8 files changed, 94 insertions(+), 5 deletions(-)

[...]

>> +/*
>> + * Put 16-bit ARGB values into a standard 64-bit representation that
>> + * can be used for ioctl parameters, inter-driver communication, etc.
>> + */
>> +static inline __u64
>> +drm_argb64(__u16 alpha, __u16 red, __u16 green, __u16 blue)
>> +{
>> +	return (__u64)alpha << 48 | (__u64)red << 32 | (__u64)green << 16 | blue;
>> +}
>> +
>> +/*
>> + * Extract the specified number of least-significant bits of a specific
>> + * color component from a standard 64-bit ARGB value.
> 
> Why would you ever want the least significant bits?

Right, that's useless - will replace with proper helpers dealing with custom
precision.

Thanks,
Cristian

>> + */
>> +#define DRM_ARGB64_COMP(c, shift, numlsb) \
>> +	((__u16)(((c) >> (shift)) & ((1UL << (numlsb) % 17) - 1)))
>> +#define DRM_ARGB64_ALPHA_LSB(c, numlsb) DRM_ARGB64_COMP(c, 48, numlsb)
>> +#define DRM_ARGB64_RED_LSB(c, numlsb)   DRM_ARGB64_COMP(c, 32, numlsb)
>> +#define DRM_ARGB64_GREEN_LSB(c, numlsb) DRM_ARGB64_COMP(c, 16, numlsb)
>> +#define DRM_ARGB64_BLUE_LSB(c, numlsb)  DRM_ARGB64_COMP(c, 0, numlsb)
>> +
>> +/*
>> + * Convenience wrappers to extract all 16 bits of a specific color
>> + * component from a standard 64-bit ARGB value.
>> + */
>> +#define DRM_ARGB64_ALPHA(c)		DRM_ARGB64_ALPHA_LSB(c, 16)
>> +#define DRM_ARGB64_RED(c)		DRM_ARGB64_RED_LSB(c, 16)
>> +#define DRM_ARGB64_GREEN(c)		DRM_ARGB64_GREEN_LSB(c, 16)
>> +#define DRM_ARGB64_BLUE(c)		DRM_ARGB64_BLUE_LSB(c, 16)
>> +
>>  #if defined(__cplusplus)
>>  }
>>  #endif
>>
>> -- 
>> 2.51.0
> 


