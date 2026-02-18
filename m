Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0813E9A047
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 00:52:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zBGfdvoCPS77/bpN5WNLWN285QShge8H2TeVkGA99zw=; b=zuKywD1JcHlusOW5mFHUIRJ2rk
	wVXKWuMKKx+sTrLmXQOyKxHonz/z8bbzhq/p1MpPHx07KekGhFyCvrHlG+e+b3Yr4wMpOmuauU0nh
	1AZoUfsooU9wd7NsLOwLHwe+SbKNp/GI6gKfAcubEIhwYjHV8jR4pLEjqGZns4rOWV5DmRE8I9UBS
	AtuOhB8s+m/6ocG9TySGOcaOMafU8aGma3CvBoLaGFzmR9HXnTldhgKsI5OzA5wU7e7gyFZXT8Rtj
	q33nEm6vNTm3RhRQfBtWjRfB2+5dfXdj/wn9qEmqpT3jwy+wK+4+YFX/klvUDPZwNOqmOOAwHW7wI
	fGc2kSQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsVo0-000000096Qg-3N4v;
	Wed, 18 Feb 2026 00:52:40 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsVnx-000000096Pq-265B;
	Wed, 18 Feb 2026 00:52:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1771375952;
	bh=lTVQtto+AZBMUjHzX/cOThwADenbzoBQAXJixDD2nsc=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=pWg0E+4eyPEujHGle6QWM3/4tNX2SdBisjm80tc9ey3x3O+XvnylRYorgYtrYG0gN
	 HwV2whZI5k0A31IDk5R3n1eGKK02t5GCU9UC+u/Oub+ZrLDq4riX8t0mFYo0ISpUaV
	 3mvYPJ0hJekz1F8DJTiwBpP5F4w3KhiQIi9+gFaxEI5aQP0At5Q02nOjcjZfOoHtXT
	 zj6RKNRWhwhtuuBzipT2sanUv/QiBobqnTvy9TGounjLM3JZ0OZso+mmpvvJ2U9HrP
	 hEHGN+QWa76Kos/AZM11Rm7OSslMINvtJDuT2g1WGId+5lFJrU8pXCQHAU13oe2zY3
	 rf4+KEDBUL+5g==
Received: from [192.168.1.90] (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id F33C517E12A9;
	Wed, 18 Feb 2026 01:52:31 +0100 (CET)
Message-ID: <08369c90-fbab-477d-9ac6-388deddfd3b1@collabora.com>
Date: Wed, 18 Feb 2026 02:52:31 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [REGRESSION] HDMI monitor not working on Radxa Rock 5B after phy
 rockchip samsung hdptx HDMI 2.1 FRL patchset
To: dubito@online.de, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>, Heiko Stuebner
 <heiko@sntech.de>, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, regressions@lists.linux.dev
References: <b32164001947ba922aefb6ca86a8dc59e9323d2b.camel@online.de>
 <8e410a11-bd7b-4a12-a711-0514a59409c0@collabora.com>
 <1859c940219a4dbfdf0497afbf333e627ab0ba25.camel@online.de>
 <98e46dbb-c8e2-451f-accb-ea48f63f9408@collabora.com>
 <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <4544ec4ccfa49cbdffee098878df7806223935a0.camel@online.de>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260217_165237_703443_0AEE47F9 
X-CRM114-Status: GOOD (  24.66  )
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

Hi Thomas,

On 2/16/26 12:48 PM, Thomas Niederprüm wrote:
> Hi Cristian,
> 
> Am Montag, dem 16.02.2026 um 03:18 +0200 schrieb Cristian Ciocaltea:
>> Hi Thomas,
>>
>> On 2/14/26 12:00 AM, Thomas Niederprüm wrote:
>>> Hi Cristian,
>>>
>>>
>>> Am Freitag, dem 13.02.2026 um 00:04 +0200 schrieb Cristian Ciocaltea:
>>>> Hi Thomas,
>>>>
>>>> On 2/11/26 11:20 PM, Thomas Niederprüm wrote:
>>>>> Hi,
>>>>>
>>>>> I'm running a Radxa Rock 5B (rk3588) on a 10+ year old Samsung TV screen
>>>>> connected via HDMI. This worked flawlessly in 6.18.7 but does not work
>>>>> on
>>>>> linux-
>>>>> next. I bisected the problem and identified commit 3481fc04 to be the
>>>>> first
>>>>> bad
>>>>> commit. This points to the phy PLL clock rate calculation to be the
>>>>> problem
>>>>> in
>>>>> connection with my monitor. As it seems relevant, I attached the EDID of
>>>>> my
>>>>> monitor.
>>>>>
>>>>> I'm booting the kernel out of EDK2 after which efifb is correctly taking
>>>>> over
>>>>> the initialized display and I can see the initial kernel boot messages
>>>>> on
>>>>> the
>>>>> HDMI output. After the drm/kms in the kernel takes over the screen
>>>>> shortly
>>>>> turns
>>>>> black, changes resolution, and then correctly displays on 6.18.7.
>>>>> However,
>>>>> in
>>>>> linux-next the screen remains black after kms took over. I cannot see
>>>>> any
>>>>> obvious differences in the boot logs but I attached two boot logs, one
>>>>> for
>>>>> the
>>>>> working 6.18.7 kernel and one for the non-working linux-next kernel.
>>>>>
>>>>> When reverting 3481fc04..de5dba83 (i.e. the faulty commit and the ones
>>>>> that
>>>>> followed in the HDMI 2.1 FRL series) I can build a working kernel from
>>>>> linux-
>>>>> next.
>>>>>
>>>>> I don't know where to dig from here but I'm happy to run any test
>>>>> necessary
>>>>> to
>>>>> track down the problem.
>>>>
>>>> It'd be helpful if you could resend the logs after booting both kernels
>>>> with
>>>> the
>>>> following params (requires CONFIG_DYNAMIC_DEBUG=y):
>>>>
>>>>   rockchipdrm.dyndbg=+p dw_hdmi_qp.dyndbg=+p
>>>> phy_rockchip_samsung_hdptx.dyndbg=+p
>>>>
>>>> As well as running the command below before connecting your display/TV:
>>>>
>>>>   $ echo 0x4 > /sys/module/drm/parameters/debug
>>>>
>>>> I've noticed you're forcing "video=HDMI-A-1:1920x1080M@60", which should
>>>> be
>>>> anyway the preferred mode (according to the EDID).
>>>
>>> I dumped the kernel messages for a freshly built v6.19 and a linux-next
>>> image.
>>> For each kernel I booted with the suggested debug options and forcing the
>>> modes
>>> 1920x1080@60, 1920x1080@50, 1920x1080@30. The boot logs are attached. For
>>> v6.19
>>> all modes work. Running linux-next, 1920x1080@60 and 1920x1080@50 don't work
>>> but
>>> 1920x1080@30 works.
>>>
>>>> Did you try choosing a different one, e.g. 1920x1080@50 or 1920x1080@30
>>>> (they
>>>> are supported according to the listing in CTA-861 Extension Block). That's
>>>> more
>>>> a test to confirm the issue affects a particular modeline, or is more
>>>> general.
>>>>
>>>
>>> As stated above, if I force 1920x1080@30 the screen turns on in linux-next.
>>> 1920x1080@60 and 1920x1080@50 don't work. This points to something specific
>>> to
>>> the modeline.
>>>
>>> By diff'ing the relevant part of the logs between kernels one can see that
>>> in
>>> the cases where the screen stays black the log lacks the following lines:
>>>
>>>     rockchip-hdptx-phy fed60000.phy: rk_hdptx_ropll_tmds_cmn_config
>>> rate=185625000 mdiv=155 sdiv=4 sdm_en=1 k_sign=1 k=16 lc=62
>>>     rockchip-hdptx-phy fed60000.phy: PHY clk ready
>>>
>>> So obviously the PHY clock never gets ready.
>>>
>>> I also attached the diffs I made.
>>
>> Thanks for checking this out!  The behavior is really unexpected and I'm still
>> unable to reproduce on my end, i.e. even tested with a Samsung TV, which is
>> almost as old as yours:
>>
>>   # Mine
>>   Vendor & Product Identification:
>>     Manufacturer: SAM
>>     Model: 2685
>>     Serial Number: 1 (0x00000001)
>>     Made in: week 46 of 2012
>>
>>   # Yours
>>   Vendor & Product Identification:
>>     Manufacturer: SAM
>>     Model: 1641
>>     Serial Number: 1 (0x00000001)
>>     Made in: week 47 of 2009
>>
>> I added some more debug information, hence could you please apply commit [1]
>> on
>> your next-20260213 kernel and share the logs after testing again the
>> 1920x1080@50 and 1920x1080@30 modes?
>>
>> [1]
>> https://gitlab.collabora.com/cristicc/linux-next/-/commit/2ce4b1fb60fc601068abbe9131c05c4f09f1380c
>>
>>
> 
> Please find the logs attached.

Sorry, I somehow missed the following warning message, though it has been
already present in all the logs you've sent to me so far:

  rockchip-hdptx-phy fed60000.phy: PLL locked by unknown consumer!

That indicates the PHY has been preconfigured by an external component (e.g. the
bootloader), which is actually a scenario that I didn't verify.

However, this just another way to expose a limitation of the current approach
for managing the TMDS character rate: done via the Common Clock Framework API
instead of the HDMI PHY configuration API.

As a matter of fact, it was actually an item on my TODOs list for quite a while,
but blocked until recently due to several dependencies waiting to be merged
upstream.

Hence I took the opportunity to finalize this task - please give the following
commits in my rk3588-hdmi-debug branch [2] a try:

  07b579f28fe0 ("phy: rockchip: samsung-hdptx: Fix rate recalculation for high bpc")
  ef714855512a ("phy: rockchip: samsung-hdptx: Exclusively use PHY config API for PLL changes")

In case further debugging is necessary, you may also pick:

  1cddea39cd92 ("[DEBUG] drm/rockchip: Add HDMI verbose logging")

In the meantime, I'll do some more testing on my end.  Moreover, I'm going to
prepare a couple of additional cleanup patches (unrelated to this issue) before
sending the series out.

Regards,
Cristian

[2] https://gitlab.collabora.com/cristicc/linux-next/-/commits/rk3588-hdmi-debug


