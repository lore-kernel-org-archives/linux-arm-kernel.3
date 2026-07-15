Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58BCBC4450C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:34:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mBqYW4z7FS94MKsSiJu64PdVNBzFZuAgdIt6t5MrHjs=; b=QYmR+DeHODXWfM1mPyggJO1v82
	0snv9X4zP92DVqD5T7ch4+hZFI9ddI+ci1O1C940y9pnIk7Pyhu8LSjeQ9P2jCCsKtew1F5+s1Weu
	a+FYuDHF8GrJLK0qWFwjMMVLcPsU6rO+2gKMDOZ39WaKNczX9XKs0LeeWuUse7HxGQdFQHelGhTKX
	4cyn+BiNPEBsu8Q7B6t1cAtcok+8lm3muVdQnD0elr/JSdgBuoXEEaviTxCPkYWD39zaQ50qceUpj
	1LU6FWkdG69w4IhH3bCbac16shWx+HJkJtr5QvDbyljBUfdNdouXjpNDE74UXETBPXNxNXL3VTVTo
	kGyp2eUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwwc-0000000ESrz-1dLx;
	Wed, 15 Jul 2026 10:34:26 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwwZ-0000000ESrO-2mUB;
	Wed, 15 Jul 2026 10:34:24 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784111660;
	bh=IkJnX4Q0f685MGMac/EYnUgIc/6fHPJFWwoic2nfCBc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=CxCfyxWQoK2fMzcMWdxysiIbfEO8pWawDkEtOLsZZ0z/6FsDYUX9OULxrqC34oZBH
	 N68/5SZtUEdYAw4scbkcZjpFg/Id+Eby8XuPmPeFHpm/q3EJX+NbmL0H1pjqvmWRw2
	 gf/OEkv50g2ICcYVGLdLUgXivS9ZmP2fSOAxiHnTSWtIZyI4LK0n/p8oHW1qk3223k
	 SRVRWYRp3xksrLBDUA/s2i7yxt8IetEFDamBHOYIJdxDpqlXBfdfDAKx4HrQ79DXi2
	 W34Lpeah3JDsmGJLzVLIx1MxfDGrHbcBiVl8234GCfyq2FhRBGRDObQEGoUqUb2s9/
	 JfJBXjRblX3zg==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BAB4A17E0076;
	Wed, 15 Jul 2026 12:34:19 +0200 (CEST)
Message-ID: <45113534-94ad-4a0f-8014-c04e9ab67a26@collabora.com>
Date: Wed, 15 Jul 2026 13:34:19 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 02/39] drm/connector: Add caps-based HDMI connector
 init helper
To: Maxime Ripard <mripard@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, Daniel Stone <daniels@collabora.com>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?UTF-8?Q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 kernel@collabora.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org
References: <20260702-dw-hdmi-qp-scramb-v8-0-d79890d00b6a@collabora.com>
 <20260702-dw-hdmi-qp-scramb-v8-2-d79890d00b6a@collabora.com>
 <i4tjtsf5rsckfcayo5nuhlger5wqxn3ujeaubm4g2fgrwvhzb2@hf4uhgq3ja5p>
 <ad75cf26-9437-47d0-864d-d71263401615@collabora.com>
 <20260707-illegal-tuna-of-force-1c06e3@houat>
 <737678ab-f082-4a0e-b453-f403ba141437@collabora.com>
 <80374deb-3246-413f-a043-66bcdb438ab1@collabora.com>
 <20260715-fair-opalescent-rhino-c6407b@houat>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <20260715-fair-opalescent-rhino-c6407b@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_033423_867102_9CE0EABD 
X-CRM114-Status: GOOD (  22.36  )
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

On 7/15/26 11:50 AM, Maxime Ripard wrote:
> On Fri, Jul 10, 2026 at 01:27:37PM +0300, Cristian Ciocaltea wrote:
>> On 7/8/26 1:11 PM, Cristian Ciocaltea wrote:
>>> Hi Maxime,
>>>
>>> On 7/7/26 7:10 PM, Maxime Ripard wrote:
>>>> On Fri, Jul 03, 2026 at 10:31:55PM +0300, Cristian Ciocaltea wrote:
>>>>> Hi Dmitry,
>>>>>
>>>>> Thanks for your quick review!
>>>>>
>>>>> On 7/3/26 5:05 PM, Dmitry Baryshkov wrote:
>>>>>> On Thu, Jul 02, 2026 at 05:46:15PM +0300, Cristian Ciocaltea wrote:
>>>>>>> In preparation for adding HDMI 2.x source capabilities, introduce struct
>>>>>>> drm_connector_hdmi_caps and a new drmm_connector_hdmi_init_with_caps()
>>>>>>> helper.
>>>>>>>
>>>>>>> The existing drmm_connector_hdmi_init() helper currently takes
>>>>>>> individual capability arguments such as supported_formats and max_bpc.
>>>>>>> Adding more HDMI-specific arguments to that function would not scale
>>>>>>> well, so move those values into a dedicated capabilities structure and
>>>>>>> implement the existing helper as a wrapper around the new caps-based
>>>>>>> interface.
>>>>>>
>>>>>> I think, it was an intention of Maxime: make sure that every driver is
>>>>>> forced to provide some values here. With the struct-based init it is
>>>>>> easy to overlook or to ommit a value.
>>>>>
>>>>> Agreed that the struct-based init loses the compile-time guarantee that every
>>>>> argument is explicitly provided - that's a real downside.  
>>>>>
>>>>> I'd argue it's recoverable, though: the init helper validates the mandatory
>>>>> fields, so a driver that omits a required value gets rejected at init time
>>>>> rather than silently misconfigured.  The "you must provide sane values" property
>>>>> is expected to be preserved, just enforced at runtime instead of by the
>>>>> compiler. 
>>>>
>>>> Yeah, I don't think we can win with C here. Rust might, but we're
>>>> probably a long way from that.
>>>>
>>>>> The main motivation for the struct is scalability/maintainability as we add HDMI
>>>>> 2.x capabilities: new fields go into the struct rather than growing the helper's
>>>>> argument list, so existing callers don't need churny signature updates on every
>>>>> extension.
>>>>>
>>>>> FWIW, in the previous revision we discussed addressing the concern with a
>>>>> callback instead.  Sadly, I had to discard that approach, as it proved not
>>>>> flexible enough, e.g. drm_bridge_connector_init() computes caps dynamically, and
>>>>> would have required either stateful callbacks, or storing redundant/temporary
>>>>> cap data in driver-private structures just to satisfy the callback.
>>>>
>>>> I just realized something reviewing your patch: we don't necessarily
>>>> need an extra argument or a callback, we can just put these fields into
>>>> drm_hdmi_connector_funcs directly, and then validate them in init.
>>>
>>> If I understand correctly, we should drop the drm_connector_hdmi_caps struct
>>> introduced by this patch and move all its fields into drm_hdmi_connector_funcs.
>>>
>>> In that case, how should we proceed with drmm_connector_hdmi_init()? 
>>
>> Actually, this brings us to the callback issue: we cannot compute caps
>> dynamically, as it only works with static data, since funcs is supposed to be
>> immutable.
> 
> Does it? The core and helpers must consider it immutable but it doesn't
> have to. drm_bridge_connector for example could totally allocate it and
> dynamically create it based on the bridge capabilities.

If we take the VC4 case, is it fine to drop the const from the static
drm_connector_hdmi_funcs to allow dynamically setting up supported_hdmi_ver and
max_bpc in vc4_hdmi_connector_init()?

static struct drm_connector_hdmi_funcs vc4_hdmi_hdmi_connector_funcs = {
	.tmds_char_rate_valid	 = vc4_hdmi_connector_clock_valid,
	...
}

static int vc4_hdmi_connector_init() 
{
	...
    
	if (vc4_hdmi->variant->supports_hdr)
		vc4_hdmi_hdmi_connector_funcs.max_bpc = 12;

	if (vc4_hdmi->variant->max_pixel_clock >= HDMI_2_0_TMDS_CHAR_RATE_MAX_HZ)
		vc4_hdmi_hdmi_connector_funcs.supported_hdmi_ver = HDMI_VERSION_2_0;
	else if (vc4_hdmi->variant->max_pixel_clock >= HDMI_1_3_TMDS_CHAR_RATE_MAX_HZ)
		vc4_hdmi_hdmi_connector_funcs.supported_hdmi_ver = HDMI_VERSION_1_3;
	...
}

>> Moreover, we would end up with some redundancy, as most of these input fields,
>> after validation, would be stored (altered or not) directly in
>> drm_connector/drm_connector_hdmi structs.
> 
> I mean, part of the conversion would obviously be to remove the
> redundant fields.

Ack.

