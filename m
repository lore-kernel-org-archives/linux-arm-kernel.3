Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42D46C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cw3XxnLHNZ3/+eN3jxwlLiOsY4HaGwfk0dlunI0m4sE=; b=4onopHwwE5Gfx/vZ8sik7b6EIT
	oTCYyqKjWLC58C5o3HrzF1P0dOK2By59EXJtrb0gwreBfWiPzwlVxjGDG9MuZqJxy1E6pxmWvoP+J
	CgzNd69jwsJFu1cAyjcMZFDh+p/vduZdm3Z2LZV9mRXxSDc8AjjFo4LdFm8AcCF1sbv6sW5F1qB1Z
	f/LbXFUqNlJark9zlFAvx2o5TiAd8q5qNEInsmSO4pe6+JIucT3UEoEBaZLHGZDNutNHll/Sa4ERI
	YCFDcQYhR7Akh+V7JCtt2+mztCoLeSBa7y60LhOAgptaIqNNf15a/JAkwPT1sl1dNksTA51Hqg999
	as4pA1uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpnmu-000000080hM-1m0K;
	Wed, 05 Mar 2025 12:23:48 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn70-00000007tT1-35UB
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 11:40:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=cw3XxnLHNZ3/+eN3jxwlLiOsY4HaGwfk0dlunI0m4sE=; b=NtN6Qk+qTTHrgN00Y1DeC0mGaI
	raC8Ia/i2aL0Y8XdjYLXU6hf56C73B0zeY3I1DvZIPxHYfAqFImgL7DgTOQykrPmfv0LUqpP7pC5x
	NwEb1dZFMbhKPpKk9d1bUSkz/7mVRKTjIuOYWdGSEgSmMACfZ15NTFZ4YN0I49xzqkFY2AjIAarE+
	mUt/lR+usUNQDvB98uCgHsqf6Xx0QJlaVFw/ysH9ZG9eUqzcfLk0/dbdkU38f+Y4gvYxT2P92pIPs
	DpNKO6hHerJoWZ2ELV8SNyZ6B6wovrNY2JnDkXeKRJ0JlmLtzzbuLzVVVg+uTEE+mG8uhlO6JACeH
	UF51yOdw==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpn6x-00000005PGO-2Vi7
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 11:40:29 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpn64-0004on-HO; Wed, 05 Mar 2025 12:39:32 +0100
Message-ID: <28d0ea70-db7a-40e7-aac9-86808320f252@pengutronix.de>
Date: Wed, 5 Mar 2025 12:39:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [PATCH v4 0/2] Add stop_on_panic support for
 watchdog
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
 "openbmc@lists.ozlabs.org" <openbmc@lists.ozlabs.org>,
 "linux-mips@vger.kernel.org" <linux-mips@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linuxppc-dev@lists.ozlabs.org" <linuxppc-dev@lists.ozlabs.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250305101025.2279951-1-george.cherian@marvell.com>
 <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
 <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <PH8PR18MB53817EC09B918852B78DF3AAC5CB2@PH8PR18MB5381.namprd18.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_114027_651777_A9A24169 
X-CRM114-Status: GOOD (  24.91  )
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

Hi George,

On 05.03.25 12:28, George Cherian wrote:
> Hi Ahmad,
>> Hi George,
>> On 05.03.25 11:10, George Cherian wrote:
>>> This series adds a new kernel command line option to watchdog core to
>>> stop the watchdog on panic. This is useul in certain systems which prevents
>>> successful loading of kdump kernel due to watchdog reset.
>>>
>>> Some of the watchdog drivers stop function could sleep. For such
>>> drivers the stop_on_panic is not valid as the notifier callback happens
>>> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
>>> options to indicate whether the stop function would sleep.
>>
>> Did you consider having a reset_on_panic instead, which sets a user-specified
>> timeout on panic? This would make the mechanism useful also for watchdogs
> 
> /proc/sys/kernel/panic already provides that support. You may echo a non-zero value 
> and the system tries for a soft reboot after those many seconds. But this doesn't happen 
> in case of a kdump kernel load after panic.

The timeout specified to the Watchdog reset_on_panic option would be programmed into
the active watchdogs and not be used to trigger a software-induced reboot.

>> that can't be disabled and would protect against system lock up: 
>> Consider a memory-corruption bug (perhaps externally via DMA), which partially
>> overwrites both main and kdump kernel. With a disabled watchdog, the system
>> may not be able to recover on its own.
> 
> Yes, that is the reason why the kernel command-line is optional and by default it is set to zero.
> So that in cases if you have a corrupted kdump kernel then watchdog kicks in.

The existing option isn't enough for the kdump kernel use case.
If we (i.e. you) are going to do something about it, wouldn't it be
better to have a solution that's applicable to a wider number of
watchdog devices?

>> If you did consider it, what made you decide against it?
> watchdog.stop_on_panic=1 is specifically for systems which can't boot a kdump kernel due to the fact 
> that the kdump kernel gets a watchdog reset while booting, may be due to a shorter watchdog time.
> For eg: a 32-bit watchdog down counter running at 1GHz.
> reset_on_panic can guarantee only the largest watchdog timeout supported by HW, 
> since there is no one to ping the watchdog.

If you are serious with the watchdog use, you'll want to use the watchdog to
monitor kernel startup as well. If the bootloader can set a watchdog timeout
just before starting the kernel and it doesn't expire before the kernel watchdog
driver takes over, why can't we do the same just before starting the dumpkernel?

Thanks,
Ahmad

 
>>
>> Thanks,
>> Ahmad
>>
>>>
>>>
>> Changelog:
>> v1 -> v2
>> - Remove the per driver flag setting option
>> - Take the parameter via kernel command-line parameter to watchdog_core.
>>
>> v2 -> v3
>> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
>> - There are no users for this. 
>>
>> v3 -> v4
>> - Since the panic notifier is in atomic context, watchdog functions
>>   which sleep can't be called. 
>> - Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
>>   function sleeps.
>> - Simplify the stop_on_panic kernel command line parsing.
>> - Enable the panic notiffier only if the watchdog stop function doesn't
>>   sleep
>>
>> George Cherian (2):
>>   watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
>>   drivers: watchdog: Add support for panic notifier callback
> 
> - George


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

