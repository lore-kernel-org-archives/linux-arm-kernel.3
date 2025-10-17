Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71FCACCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 09:19:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f9WUAUwdDcfIz24VKFjBPQuU3/34kcMzU6Efs904sLA=; b=xbNh66k6FtAyQbRJ7+t/M5N5OJ
	wL7YQ4muqxYV9hZjkEBJ8XqUwN8UaL2pVKx7jnj24LueCufmK0AzcGi4CN+mHAopC4fXNLPSJbBu2
	PcxhEuoFpSSvDpvuBpt2X430I/LIsFDRKHqtpN31HhuV01l2ZlwnTNpD913B8x0H/9KmGRUa602Wy
	+PCTyPmeXFBuQNqUVgbv8frON0WMO7IiFAV068RHm2Ydfkx/85rUqPxmuW9OPbi7zNhtFqIle5oZB
	KpE3wIZ2TTLHdn2Lp+BjbLxjVQcad3JgQFVy26A77sWN23HZaxFojRC9dHuW+EdjUi1mwmBQYBWhx
	DrqXKzDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gcW-00000007H40-4BUz;
	Fri, 17 Oct 2025 09:19:33 +0000
Received: from mail2.ecloud.global ([135.181.6.248])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9gcT-00000007H1c-421p;
	Fri, 17 Oct 2025 09:19:31 +0000
Received: from authenticated-user (mail2.ecloud.global [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mail2.ecloud.global (Postfix) with ESMTPSA id 223E2720BA2;
	Fri, 17 Oct 2025 09:19:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io; s=mail2;
	t=1760692763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9WUAUwdDcfIz24VKFjBPQuU3/34kcMzU6Efs904sLA=;
	b=IAcslZ3eI216ng359HSpCdLh1KGoCMoFu155xdibUE+QtoZVaBS++0KJruWv6F4VxyoHuU
	ADyqN8gFBBbLkqmlcdLw5RqIFNDy+uIo5tjcCR6I5iKXyyCspdyTVD1JkCEK9Td40OAN8R
	riZhSqm2Hjfs8U9zoAF+SHHoBRFErwE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=murena.io;
	s=mail2; t=1760692763;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=f9WUAUwdDcfIz24VKFjBPQuU3/34kcMzU6Efs904sLA=;
	b=l2kmcn3LKIPL0J0ZBlPWnYcLUOk3jvxKyV3rRndWr8mf5IULb4J6urfIju5TvDDj+O11ri
	FVfy05Di2oDnPuHEfAiNRaXXoGw2WDs415CigosAXMn9XBcZnfBECuqYbNuEItYwJ772Ao
	z+zcRqIwr3XOlpP58cAsJRo98UAGdbg=
ARC-Seal: i=1; s=mail2; d=murena.io; t=1760692763; a=rsa-sha256; cv=none;
	b=YoxRgvVsvCNylnu8Zz4E5kvP6dmE2gSA/e+1Wduz5JkG+zJ0Ks969ugSua8f5T2KJjgaqm
	UoJwhm6WByJnEWemoMYgvLFqOd+ls4Ul+5Urto4wMEtuw18/8BnC4qNakznN9D212IYRGB
	wa5cF2gzYGT90OIt4+NNTwWSVNwG6tc=
ARC-Authentication-Results: i=1;
	mail2.ecloud.global;
	auth=pass smtp.mailfrom=maud_spierings@murena.io
Message-ID: <392dc6d7-a0e5-4f9e-85c4-8d811777a697@murena.io>
Date: Fri, 17 Oct 2025 11:19:21 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v8 2/2] MAINTAINERS: Add entry for Innosilicon hdmi bridge
 library
To: Andy Yan <andyshrk@163.com>
Cc: Laurent.pinchart@ideasonboard.com, andrzej.hajda@intel.com,
 andy.yan@rock-chips.com, devicetree@vger.kernel.org,
 dmitry.baryshkov@oss.qualcomm.com, dri-devel@lists.freedesktop.org,
 heiko@sntech.de, jernej.skrabec@gmail.com, jonas@kwiboo.se,
 knaerzche@gmail.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-rockchip@lists.infradead.org,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 neil.armstrong@linaro.org, rfoss@kernel.org, simona@ffwll.ch,
 tzimmermann@suse.de
References: <20251016083843.76675-3-andyshrk@163.com>
 <040d8fe8-da2f-4aa5-a2c3-1aec0cf2e8f0@murena.io>
 <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
Content-Language: en-US
From: Maud Spierings <maud_spierings@murena.io>
In-Reply-To: <671fc19.84e3.199f162a66c.Coremail.andyshrk@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_021930_314870_0AC67EFC 
X-CRM114-Status: GOOD (  15.92  )
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

Hi Andy,

On 10/17/25 10:56, Andy Yan wrote:
>
> Hello Maud，
>
> At 2025-10-17 15:58:22, "Maud Spierings" <maud_spierings@murena.io> wrote:
>> Hi Andy,
>>
>>> From: Andy Yan <andy.yan@rock-chips.com>
>>>
>>> Add entry for Innosilicon hdmi bridge library
>>>
>>> Signed-off-by: Andy Yan <andy.yan@rock-chips.com>
>>> ---
>>>
>>> (no changes since v1)
>>>
>>>   MAINTAINERS | 8 ++++++++
>>>   1 file changed, 8 insertions(+)
>>>
>>> diff --git a/MAINTAINERS b/MAINTAINERS
>>> index f9f985c7d7479..0adcfb1c264a1 100644
>>> --- a/MAINTAINERS
>>> +++ b/MAINTAINERS
>>> @@ -12299,6 +12299,14 @@ M:	Samuel Holland <samuel@sholland.org>
>>>   S:	Maintained
>>>   F:	drivers/power/supply/ip5xxx_power.c
>>>   
>>> +INNOSILICON HDMI BRIDGE DRIVER
>>> +M:	Andy Yan <andy.yan@rock-chips.com>
>>> +L:	dri-devel@lists.freedesktop.org
>>> +S:	Maintained
>>> +T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
>>> +F:	drivers/gpu/drm/bridge/inno-hdmi.c
>>> +F:	include/drm/bridge/inno_hdmi.h
>>> +
>>>   INOTIFY
>>>   M:	Jan Kara <jack@suse.cz>
>>>   R:	Amir Goldstein <amir73il@gmail.com>
>>> -- 
>>> 2.43.0
>> I believe this patch should be squashed into the patch that actually
>> creates the files listed in the MAINTAINERS entry, like I do here [1].
>> Checkpatch should be complaining about patch [1/2] if I'm not mistaken,
>> when you run `b4 prep --check`.
> We talked about something similar here[2]：
> Maxime believes they should be separate patches,
> And I've seen many merged commits in the kernel are also handle MAINTAINERS entry as separate patches
>
>
> [2]https://lore.kernel.org/linux-rockchip/3ygqnj4idey7u4m7ltlv7pnfhkkvcepmpfdijdszctaeopq3ky@qteg33comjl3/

It seems there are indeed opinions about this [3], guess whatever the 
actual maintainer wants is what will happen, sorry to disturb.


Would be nice to get some central guideline about how it should be.


[3] 
https://lore.kernel.org/all/51b72003-e9a5-4f34-ad08-249fc24b3041@kernel.org/

>
>> Link:
>> https://lore.kernel.org/all/20251009-max25014-v4-1-6adb2a0aa35f@gocontroll.com/
>> [1]
>>
>> Kind regards,
>> Maud

