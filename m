Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2F54C2A073
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 01:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pZJXqr1shDOJNTqRYSFVIu1Zdtd7/8R285rGmkkRm1E=; b=Ey6YpLBDQDu7MQAvTOSjDbK/mL
	KWHm+CZ3Ru9hxdNIW1gy5q9HWxC1V9+4LB3rOJRpNNS5q9zgGUvk2VlLP09hN6tq4nEbbz72Ljo/W
	WnbgSiBj6k7CknFNtqgggjes+YdBD98cNaZo8b0p74RJGI4OJCbZix0P8BXlnQzn0cJJpZAuBmgoT
	xxo5t2UC/pQtP1l2FZIJ30jt294HblD22gvWfLCwzHN2pYrNIBRzUpd7Tv2aq9DujjE756lGDhPJZ
	g+zzuaPonJXpRt1dF5fWhwUXyko+59RhzDKN2lk2Kf7qe4Hdq4LfQIwE4notTEyht24RTfedZ8pLq
	c17tmbzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcZDl-0000000AbTV-2I3e;
	Mon, 05 Jan 2026 01:17:21 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcZDf-0000000AbSy-3tej;
	Mon, 05 Jan 2026 01:17:16 +0000
Message-ID: <eb7c246a-6c5f-4d8d-bc96-2a71ece2e042@infradead.org>
Date: Sun, 4 Jan 2026 17:17:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [Linux-stm32] Kconfig dangling references (BZ 216748)
To: Antonio Borneo <antonio.borneo@foss.st.com>, Arnd Bergmann
 <arnd@arndb.de>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Cc: linux-sh@vger.kernel.org,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Vaibhav Hiremath <hvaibhav.linux@gmail.com>,
 "dri-devel@lists.freedesktop.org" <dri-devel@lists.freedesktop.org>,
 andrew.jones@linux.dev, Paul Cercueil <paul@crapouillou.net>,
 Max Filippov <jcmvbkbc@gmail.com>, linux-stm32@st-md-mailman.stormreply.com,
 chrome-platform@lists.linux.dev, openbmc@lists.ozlabs.org, x86@kernel.org,
 Andy Shevchenko <andy.shevchenko@gmail.com>,
 Matti Vaittinen <mazziesaccount@gmail.com>,
 Philipp Zabel <p.zabel@pengutronix.de>, Paul Kocialkowski
 <paulk@sys-base.io>, linux-sound@vger.kernel.org,
 "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
 Linux-OMAP <linux-omap@vger.kernel.org>,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-mips@vger.kernel.org, asahi@lists.linux.dev,
 Srinivas Kandagatla <srini@kernel.org>, Jonathan Cameron <jic23@kernel.org>
References: <22b92ddf-6321-41b5-8073-f9c7064d3432@infradead.org>
 <5e335232-89b4-4c35-93bd-efad7e4d8995@app.fastmail.com>
 <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Language: en-US
In-Reply-To: <0220ec0592b6ef8936c25cffbc6cbfa0539fb71a.camel@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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



On 12/8/25 1:48 AM, Antonio Borneo wrote:
> On Mon, 2025-12-08 at 09:55 +0100, Arnd Bergmann wrote:
>> On Mon, Dec 8, 2025, at 03:04, Randy Dunlap wrote:
>>> from  https://bugzilla.kernel.org/show_bug.cgi?id=216748
>>>
>>> The bugzilla entry includes a Perl script and a shell script.
>>> This is the edited result of running them (I removed some entries that 
>>> were noise).
>>>
>>> I'll try to Cc: all of the relevant mailing lists or individuals.
>>>
>>> ...
>>>
>>> MACH_STM32MP25 ---
>>> drivers/pinctrl/stm32/Kconfig:58:       default MACH_STM32MP25 || (ARCH_STM32 
>>> && ARM64)
>>
>> This was likely intended for 32-bit kernels on 64-bit STM32MP25
>> chips, which we don't support. I think this can go.
> 
> Yes, I fully agree!
> 
> I have a series pinctrl stm32 to be rebased on v6.19-rc1 and I can include the
> drop of MACH_STM32MP25 inside it.

and what about this dangling symbol?
arch/arm64/Kconfig.platforms:375:	select ARM_SMC_MBOX

It was merged with ARCH_STM32 in
9e4e24414cc6 ("arm64: introduce STM32 family on Armv8 architecture")

Same answer as for MACH_STM32MP25?
If so, Antonio, can you take care of that one also, please?

thanks.
-- 
~Randy


