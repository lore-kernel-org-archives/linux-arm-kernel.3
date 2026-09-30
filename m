Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8F92FCA5FC3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 07:50:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rb4nWwlxaPy2o69lqksbAluMfoEqrzWeYPEQbVBWoFQ=; b=FVTEspf79dNYPkODTMqjNxD1Ho
	9mqMU+KneK00eUbKwvzoRjkg89Hpj7JoyOh9hGrUWiRqg8g1Mh1za/USFGSGq/8wncdydAb656wIC
	JLXpUxOGrcvEMm1EJCIkq91V6r1Ti4QAoGfeKnGL7uFAiE5K5HjJVRaiTXV3M3iE2mfDK8hpaiHhg
	6ns2cKEUF/4vyhdIPCOp3H+vkIH7nijW9IztaW1U6Z/JrutVKhVr1/XdlAoHgx2qx2tW/DPctjdtU
	KPfZqU3cDHlClyrefSWgHb0AusTHMqVj5bM+LmTtGdZXB7PO9cTMlC/cKcs20Y3lA5VnARyZCuyVY
	5QMo40OQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp5W-00000005L1K-1L01;
	Wed, 30 Sep 2026 07:50:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBp5R-00000005Kz1-3XPJ;
	Wed, 30 Sep 2026 07:50:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Rb4nWwlxaPy2o69lqksbAluMfoEqrzWeYPEQbVBWoFQ=; b=IYZTcjsvU5e1yyohw32v9ZfrGH
	AQswUyEeDYajT+Zuel+9ttg3euqRySph+OAj++EKj4Om5OJz6rBfbuZE7SqDGtZz7EwQKvcv1+j2q
	hvD+X0pCzZHUlppfOo7zXXvP8zGk6lioI7unXqKv9KitgcuA604IWabr5NLGZIWh737Ifdl/ZkWMj
	/yEGJ6+6IUWduxJ3ZIm3mD4is1p7XNYSlnuv6e4nwXB30V9Xv7rWOr4I8Fld48h30tAu1u6zjT/LW
	2vKkW33g8u1fdKMj7J9mdgacVxwOmbqgnXeNI5iYIl5iWeXFR/crzk5sIr5v109566iL8SWdtYg0S
	xfXWXjJA==;
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBp5O-00000003Ugz-2O63;
	Wed, 30 Sep 2026 07:50:44 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519MLKEM768 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4hvnK72P1czKnd1;
	Wed, 30 Sep 2026 09:50:35 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1790754635;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Rb4nWwlxaPy2o69lqksbAluMfoEqrzWeYPEQbVBWoFQ=;
	b=G/99nNpVvjN+Q4t0ht6oc9WzRJSmnV1DgJ/PvIQS3FkjTeoiT4PpJrrETsDyYBulpx3DFh
	1MygqaTB5J0gxRy2nzvPif1T0eoIR0rRfMMokq8CM2UVlIzJ2C1wxerxl9FaZcfrR6MfB9
	0QJxx9lP5f1nSfL223tsigokddcdZY5e0Fuq7cIpm+QR80SNfkhxIK2i70luRqutJT1IGy
	fG9W6cJ7lc4NclOYhTCv55AY4IGFUzyujT/zM8is1SxeQY41bygWNZM9geTXJAiCeeIXmk
	VCbYbkFpkaaYZfE6euWAPK3k2cjFPKVQk0qpEvjzMoq0aYCFyhMQHcvn+nd+zg==
Message-ID: <d1280ea9-ef96-42c5-a613-a4db8de0e9f2@mailbox.org>
Date: Wed, 30 Sep 2026 09:50:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 06/25] drm/connector: hdmi: Add VTEM EMP generation
To: Vidith Madhu <vmadhu@nvidia.com>,
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Cc: "Borah, Chaitanya Kumar" <chaitanya.kumar.borah@intel.com>,
 Leo Li <sunpeng.li@amd.com>, Daniel Stone <daniels@collabora.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Helge Deller <deller@gmx.de>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Sandy Huang <hjc@rock-chips.com>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-fbdev@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, Derek Foreman <derek.foreman@collabora.com>,
 wayland-devel@lists.freedesktop.org
References: <20260921-vrr-limiter-uapi-v1-0-2fcd7d011646@collabora.com>
 <20260921-vrr-limiter-uapi-v1-6-2fcd7d011646@collabora.com>
 <a5bc012a-9b9e-eb2b-d67e-a91f2d93d6bf@nvidia.com>
 <FJ8OpdCORV2b1oivG9-G9Q@collabora.com>
 <9dccf035-2806-7b92-ce17-00f95bcf773a@nvidia.com>
Content-Language: en-CA
From: =?UTF-8?Q?Michel_D=C3=A4nzer?= <michel.daenzer@mailbox.org>
In-Reply-To: <9dccf035-2806-7b92-ce17-00f95bcf773a@nvidia.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: g68zfnwjayxji9kxshey3fmwfqszuo7m
X-MBO-RS-ID: e699964b73b7c292c05
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_085042_866757_F94D0021 
X-CRM114-Status: GOOD (  26.76  )
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

On 9/29/26 20:55, Vidith Madhu wrote:
> On Sat, 26 Sep 2026, Nicolas Frattaroli wrote:
>> On Friday, 25 September 2026 05:48:54 Central European Summer Time Vidith Madhu wrote:
>>
>>> Maybe it would make sense to extend the qms_enabled connector property 
>>> introduced in this patchset to an enum of {Off, Gaming, QMS}? This would allow
>>> a standard path to control the VRR state on the sink, separately from
>>> vrr_enabled.
>>
>> An earlier version of the patch series I was working on internally had a
>> VRR limiter property that would either be Off (i.e. Game), Game-Limited,
>> QMS-Limited, and it self-inflicted some amount of confusion because of
>> the way things were named, so I refactored it to the limiter values being
>> what determines whether a limiter is used, and the QMS enable to determine
>> whether QMS is used to apply said limit. So my initial reaction is to be
>> hesitant about expanding the collection of possible states exposed through
>> the uAPI.
>>
>> To help my understanding: what does
>>
>>  vrr_enabled=true
>>  $new_property=Off
>>
>> mean for presentation?
> In this case, it should be acceptable to disable VRR on both the source 
> and sink and effectively ignore vrr_enabled=true. From reading
> https://elixir.bootlin.com/linux/v7.2.8/source/drivers/gpu/drm/drm_connector.c#L2370
> vrr_enabled is essentially a hint and there is no need to reject commits 
> because of its value (at least, that is how we handle it in the NVIDIA 
> driver).

I presume you're referring to this:

 *	The driver will take this property as a hint to enable variable
 *	refresh rate support if the receiver supports it, ie. if the
 *	"vrr_capable" property is true on the &drm_connector object.

My reading of that is simply: "If vrr_capable=0, VRR_ENABLED=1 has no effect" (i.e. kind of stating the obvious :). Not sure I see the justification for VRR_ENABLED being "just a hint" beyond that.


>> Another state I'm curious about is
>>
>>  vrr_enabled=false
>>  $new_property=Game
>>
>> which I assume is the case you're interested in, where the compositor does
>> not want VRR presentation but we're keeping the sink in Game mode to avoid
>> having the display go blank.
> That's right, in this case VRR is enabled on the sink but deactivated 
> source-side. For NVIDIA, there is a distinct HW "deactivated" state of 
> VRR, but we could achieve the same result by setting the frame range 
> limits to a fixed value as you suggested.
>>
>> is that correct, and something that does need an expanded property? I feel
>> like userspace could be smart enough to do that by keeping vrr_enabled=true
>> and then setting a fixed target, if the goal is to have non-VRR but with the
>> display still in VRR mode.
> I agree, I am a little concerned though about the transition period for 
> compositors to adopt this new model. I know for example KDE is using the 
> vrr_enabled property for their "AdaptiveSync" option, and it seems like it 
> would be a regression if all of a sudden toggling it caused display 
> blanking on newer kernels.

Yes it would be, also for mutter, which currently sets VRR_ENABLED to 1 only while there's a surface fully covering the screen.


-- 
Earthling Michel Dänzer       \        GNOME / Xwayland / Mesa developer
https://redhat.com             \               Libre software enthusiast

