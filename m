Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91768D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Nov 2025 09:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A6UvVsv4TA43NPezPtcDxkCOA4ift86d3pwT98kuntc=; b=RLU/HO9ZTZewrmmZ7bWeRSPSGf
	XDZz5u4h7HwAV2UaMmL9EaeZZAqw1G6WJubdZfOQUUiq1IVsPKnobusleAO/MyAimw/+vOXN+/oR0
	0kGY9a0N8xSjGYd6srFZgwe9WdCEMVrhZ2uEkA8L6BJ81mHh1qxL5gvYjWHYyCd2FVviXWYNz/1OB
	WbcknER6KoS1utizF+Z+ob3NaMThvz1we2djwLL4iDtMMyxshKQe2BHICM21zFf8pEflPUy9dkaTQ
	PhCnYAf6OMCp08LSADJf0ymfUiwaSt5nuhJM6iq8eZhnm5nQ0KjDZuPQDkEwXlcmTTAyNDXonGgGU
	e/uFYFhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHb1-00000001RUn-22HZ;
	Sat, 29 Nov 2025 09:50:27 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vPHav-00000001RUB-3i05;
	Sat, 29 Nov 2025 09:50:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764409817;
	bh=MmXzVJ5MoVP8VbuSvcRf5Cd6FU2Boz+4Je345xBRang=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=mWum973oC9Cc3v/JpWaj+y+bA86DwJ7gSSSecrKm9oRtJXaZEuAdCYMuM0DWgjD1P
	 5U1s1i230v+rCAw8qZcP3wkUtUVZEWqXRnV7JjWyPQzTI+pY9UCi9mJK7XV3Rm7D/U
	 tMnPsBic37kmOut/GD5QLOsZ7oRNojsLwLXxr1SMTG5l4Rp+VZ4uA7ywtK0yvs3Uh/
	 AsHH2uEObJnWsg7bUyjJM00FGHm384j9W8TnxzDmadBAHKqBCSt1bJVapZ6Tg9UX11
	 noiuxv8yOBLePzsHJHhOAZr59WfU0rcsqzHnR4PIowuyg6dGWcSMqo3LLE+lxzNnXS
	 A4bjyTGgGkItw==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id B623A17E0330;
	Sat, 29 Nov 2025 10:50:16 +0100 (CET)
Message-ID: <058027df-1b1b-4c46-b8e1-ec53fc809e82@collabora.com>
Date: Sat, 29 Nov 2025 11:50:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] drm/rockchip: vop2: Support setting custom
 background color
To: Chaoyi Chen <chaoyi.chen@rock-chips.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Sandy Huang <hjc@rock-chips.com>, =?UTF-8?Q?Heiko_St=C3=BCbner?=
 <heiko@sntech.de>, Andy Yan <andy.yan@rock-chips.com>,
 Louis Chauvet <louis.chauvet@bootlin.com>,
 Haneen Mohammed <hamohammed.sa@gmail.com>,
 Melissa Wen <melissa.srw@gmail.com>
Cc: Robert Mader <robert.mader@collabora.com>, kernel@collabora.com,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20251118-rk3588-bgcolor-v3-0-a2cc909428ea@collabora.com>
 <20251118-rk3588-bgcolor-v3-4-a2cc909428ea@collabora.com>
 <0ed71b8d-5a2e-4213-bd2f-7ba317d1e4cb@rock-chips.com>
 <4a6443b8-d440-4921-8a43-7c20e4e265e7@collabora.com>
 <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <b8819463-cc61-432f-b451-db90e3b43884@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251129_015025_044343_406EE2F9 
X-CRM114-Status: GOOD (  19.55  )
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

Hi Chaoyi,

On 11/29/25 5:49 AM, Chaoyi Chen wrote:
> Hello Cristian, 
> 
> On 11/28/2025 5:44 PM, Cristian Ciocaltea wrote:
>> The precision was something I initially looked into for CRC verification, in the
>> context of the related IGT test.  But since I've added the VKMS support, I think
>> we should not worry about that anymore. 
>>
>> Moreover, as already pointed out in [1], only RK3576 supports CRC generation at
>> display controller level, and that is not particularly useful because it doesn't
> 
> I believe you can get the CRTC CRC on the RK3576, even when only the 
> background is visible and all plane is disabled. Feel free to let me
> know if you run into any issues :)

Yes, CRTC CRC works on RK3576 for the planes, but not for the background, i.e.
the CRC is not updated when setting a different background color.  Unless
there's a way to change this default behavior, which I'm not aware of. 

My current understanding is that the background color is applied at a later
stage in the display pipeline, *after* blending the planes and computing CRC.

>> take the background color into account.  Therefore I had to capture the frame
>> CRCs at DisplayPort AUX channel level, by using the USB-C DP AltMode capable
> 
> Oh that sounds interesting! I'm not sure how complex it would be to
> implement.

That's already implemented, I plan to submit the patches soon.

> 
>> port of my RK3588-based board.  However, that solution is not yet available
>> upstream, as it requires further work for cleanup and improving the overall
>> USB-C reliability. 
>>
>> Hence I'll move on with your suggestion and switch to the simple bit-shifting
>> approach for the next revision.
> 

