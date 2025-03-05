Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 286F6C28B25
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 15:03:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7el1H3kNjC3GqBp3gAlaE1RMtntkaK90fH2GSElWevs=; b=cG8M+7xKJ65GBu9hnDE95g0v8T
	s6nXpvewWLy2t8RXfl0XY6Biqhmc12ySOTSn87jEso9aPfqemLxQHqNBw6F1Lr+reTt1nAR39a7me
	GzecZW3S7vapUU+C/aQeBOlgRzZRMVZqNQAXIpNPitY5QF2UzFm8gJ+Rn2Iadt0tlzcl9LjK0x6Wv
	xP52cpntwjPhUa2i3gO1kh+jtnOSBYbeEzNCURBUkTl3mViLbLKU/i9f2joUj2r5DjjgQuYo9fxhV
	4qs7hYZll6e4NCxWOauKaBiy2UrenlwevH0sovX2lUXZi/KcRw2pABI1vH2ChRPXuiaxSicBTQhXi
	US6iyELQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpqHe-00000008SRN-0ayS;
	Wed, 05 Mar 2025 15:03:42 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnnu-000000080pk-3CRk
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 12:24:52 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpnn2-00021N-8w; Wed, 05 Mar 2025 13:23:56 +0100
Message-ID: <f6eccbe2-b0cd-4f9e-99e0-82003a00fe5e@pengutronix.de>
Date: Wed, 5 Mar 2025 13:23:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
To: George Cherian <gcherian@marvell.com>,
 "linux@roeck-us.net" <linux@roeck-us.net>,
 "wim@linux-watchdog.org" <wim@linux-watchdog.org>,
 "jwerner@chromium.org" <jwerner@chromium.org>,
 "evanbenn@chromium.org" <evanbenn@chromium.org>,
 "kabel@kernel.org" <kabel@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "mazziesaccount@gmail.com" <mazziesaccount@gmail.com>,
 "thomas.richard@bootlin.com" <thomas.richard@bootlin.com>,
 "lma@chromium.org" <lma@chromium.org>,
 "bleung@chromium.org" <bleung@chromium.org>,
 "support.opensource@diasemi.com" <support.opensource@diasemi.com>,
 "shawnguo@kernel.org" <shawnguo@kernel.org>,
 "s.hauer@pengutronix.de" <s.hauer@pengutronix.de>,
 "kernel@pengutronix.de" <kernel@pengutronix.de>,
 "festevam@gmail.com" <festevam@gmail.com>, "andy@kernel.org"
 <andy@kernel.org>, "paul@crapouillou.net" <paul@crapouillou.net>,
 "alexander.usyskin@intel.com" <alexander.usyskin@intel.com>,
 "andreas.werner@men.de" <andreas.werner@men.de>,
 "daniel@thingy.jp" <daniel@thingy.jp>,
 "romain.perier@gmail.com" <romain.perier@gmail.com>,
 "avifishman70@gmail.com" <avifishman70@gmail.com>,
 "tmaimon77@gmail.com" <tmaimon77@gmail.com>,
 "tali.perry1@gmail.com" <tali.perry1@gmail.com>,
 "venture@google.com" <venture@google.com>,
 "yuenn@google.com" <yuenn@google.com>,
 "benjaminfair@google.com" <benjaminfair@google.com>,
 "maddy@linux.ibm.com" <maddy@linux.ibm.com>,
 "mpe@ellerman.id.au" <mpe@ellerman.id.au>,
 "npiggin@gmail.com" <npiggin@gmail.com>,
 "christophe.leroy@csgroup.eu" <christophe.leroy@csgroup.eu>,
 "naveen@kernel.org" <naveen@kernel.org>,
 "mwalle@kernel.org" <mwalle@kernel.org>,
 "xingyu.wu@starfivetech.com" <xingyu.wu@starfivetech.com>,
 "ziv.xu@starfivetech.com" <ziv.xu@starfivetech.com>,
 "hayashi.kunihiko@socionext.com" <hayashi.kunihiko@socionext.com>,
 "mhiramat@kernel.org" <mhiramat@kernel.org>
Cc: "chrome-platform@lists.linux.dev" <chrome-platform@lists.linux.dev>,
 "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>,
 "imx@lists.linux.dev" <imx@lists.linux.dev>,
 "patches@opensource.cirrus.com" <patches@opensource.cirrus.com>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
 <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
 <28d0ea70-db7a-40e7-aac9-86808320f252@pengutronix.de>
 <PH8PR18MB5381B857859C6413392DD007C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PH8PR18MB5381B857859C6413392DD007C5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_042450_806761_6DFBC382 
X-CRM114-Status: GOOD (  29.17  )
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

Hello George,

On 05.03.25 13:15, George Cherian wrote:
>> On 05.03.25 12:28, George Cherian wrote:
>>>> that can't be disabled and would protect against system lock up: 
>>>> Consider a memory-corruption bug (perhaps externally via DMA), which partially
>>>> overwrites both main and kdump kernel. With a disabled watchdog, the system
>>>> may not be able to recover on its own.
>>>
>>> Yes, that is the reason why the kernel command-line is optional and by default it is set to zero.
>>> So that in cases if you have a corrupted kdump kernel then watchdog kicks in.
>>
>> The existing option isn't enough for the kdump kernel use case.
>> If we (i.e. you) are going to do something about it, wouldn't it be
>> better to have a solution that's applicable to a wider number of
>> watchdog devices?
> 
> I need a slight clarification here. 
> 1. reset_on_panic takes the number of seconds to be reloaded to watchdog HW, so that it initiates a 
> watchdog reset after the specified timeout, if kdump kernel fails to boot or hung while booting.

Yes.

> 2. in case reset_on_panic = 0 then it behaves like stop_on_panic=1.
> Is this what you meant?

Alternatively, reset_on_panic = 0 could also mean stopping the watchdog as
you do now. I haven't thought though yet what would make the most sense.

> I would let Guenter comment on this approach.

+1.

>> If you are serious with the watchdog use, you'll want to use the watchdog to
>> monitor kernel startup as well. If the bootloader can set a watchdog timeout
>> just before starting the kernel and it doesn't expire before the kernel watchdog
>> driver takes over, why can't we do the same just before starting the dumpkernel?
> 
> Yes, in an ideal world with ideal HW. But there are HW with issues which cannot have large
> enough Watchdog time. Such HW would boot from FW to kernel without watchdog enabled.
> And stop_on_panic does the similar for kdump kernel too.

Yes, but there is likely more kinds of watchdog devices that can not be disabled,
so it makes sense to have a solution that is more broadly applicable from the get-go.

Cheers,
Ahmad

> 
> -George
>>
>> Thanks,
>> Ahmad
>>
>>
>>>
>>> Thanks,
>>> Ahmad
>>>
>>>>
>>>>
>>> Changelog:
>>> v1 -> v2
>>> - Remove the per driver flag setting option
>>> - Take the parameter via kernel command-line parameter to watchdog_core.
>>>
>>> v2 -> v3
>>> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
>>> - There are no users for this. 
>>>
>>> v3 -> v4
>>> - Since the panic notifier is in atomic context, watchdog functions
>>>   which sleep can't be called. 
>>> - Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
>>>   function sleeps.
>>> - Simplify the stop_on_panic kernel command line parsing.
>>> - Enable the panic notiffier only if the watchdog stop function doesn't
>>>   sleep
>>>
>>> George Cherian (2):
>>>   watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
>>>   drivers: watchdog: Add support for panic notifier callback
>>
>> - George
> 
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

