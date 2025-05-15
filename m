Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AB15C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 22:30:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4T6PM5eOshbdhtAbuwdc8ltSS6BS7WoF72denmdvbtI=; b=2fgvTCRjqJPoIxPW0P0EiARGGa
	uxZQ13sqrrvQmVp09Ep2z4b3MFDzh/CTTfZPYiNL0/VOUFBovb/BLgbYa9mJwviJRMaXUH7rIrNXN
	SBYjc1tO7BGGRBSJTM/N+puAYAklSPkmRKWBt5BOvcfxaFri5p5fuHqls90XIFrmX8Evccl6fc/kl
	+kYv1tc7M7fwz0JNsE8nOTjNZfkDbc08tTuFiYoYngVnNC52/dzE38CamUzddjry0ByXO43HblLJ5
	ih+dVren1dZhVsBsU2kWBQ0t/EuInW6VwQiQ2hO3VTWZyasfvLSGpdR+8J43GjIGSnCbG6laaKQwD
	99yexCgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFh5P-00000001yjY-31eI;
	Thu, 15 May 2025 22:29:55 +0000
Received: from smtp2-g21.free.fr ([2a01:e0c:1:1599::11])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFh3M-00000001yVv-2gTZ;
	Thu, 15 May 2025 22:27:49 +0000
Received: from localhost (unknown [82.64.135.138])
	by smtp2-g21.free.fr (Postfix) with ESMTP id 755552003A4;
	Fri, 16 May 2025 00:27:36 +0200 (CEST)
Received: by localhost (Postfix, from userid 1502)
	id C884CC4D6; Thu, 15 May 2025 22:27:35 +0000 (GMT)
Date: Thu, 15 May 2025 22:27:35 +0000
From: Etienne Buira <etienne.buira@free.fr>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] firmware/raspberrypi: raise timeout to 3s
Message-ID: <aCZqVzM5h9lwbfpQ@Z926fQmE5jqhFMgp6>
Mail-Followup-To: Stefan Wahren <wahrenst@gmx.net>,
	Etienne Buira <etienne.buira@free.fr>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	bcm-kernel-feedback-list@broadcom.com,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org
References: <aCIiEp3CXD2o9dTw@Z926fQmE5jqhFMgp6>
 <048fd6c5-9f09-4c06-9a23-e5821dc291d5@gmx.net>
 <aCWMrJcldfrsNTQq@Z926fQmE5jqhFMgp6>
 <ffeb860f-5522-4130-ae47-45a6068b17ea@gmx.net>
 <aCW3d7tc27Awj62K@Z926fQmE5jqhFMgp6>
 <cecda824-4f47-4e4c-bee9-1a59cd5d801c@gmx.net>
 <aCXUeOmy28tqg6Oy@Z926fQmE5jqhFMgp6>
 <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0703ff48-e781-49b6-8a8d-7cdbec73bb92@gmx.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_152748_819439_6B64D0EA 
X-CRM114-Status: GOOD (  23.94  )
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

Hi Stefan

On Thu, May 15, 2025 at 07:48:04PM +0200, Stefan Wahren wrote:
> Hi Etienne,
> 
> Am 15.05.25 um 13:48 schrieb Etienne Buira:
> > On Thu, May 15, 2025 at 12:31:38PM +0200, Stefan Wahren wrote:
> >> Am 15.05.25 um 11:44 schrieb Etienne Buira:
> >>> Hi Stefan, and thank you for your interest.
> >>>
> >>> On Thu, May 15, 2025 at 09:42:43AM +0200, Stefan Wahren wrote:
> >>>> Hi Etienne,
> >>>>
> >>>> Am 15.05.25 um 08:41 schrieb Etienne Buira:
> >>>>> On Wed, May 14, 2025 at 06:20:32PM +0200, Stefan Wahren wrote:
> >>>>>> Hi Etienne,
> >>>>>>
> >>>>>> Am 12.05.25 um 18:30 schrieb Etienne Buira:
> >>>>> ../..
> >>>>>> Out of curiosity and because i never saw this issue, could you please
> >>>>>> provide more details?
> >>>>>> There is nothing connected to HDMI 0 & 1 ?
> >>>>>> Which firmware version are you running?
> >>>> Please provide the dmesg output, so we can extract the firmware version.
> >>> Firmware version is 2025-02-17T20:03:07, i also attach the full gzipped
> >>> dmesg, as long as a patch of extra traces used.
> >>> I did not specifically test other firmware versions for the timeout
> >>> issue (but i did for video output).
> >> Thanks, i'll try to reproduce.
> >>
> >> Sorry, i forgot but is this reproducible with a recent stable 6.12.x kernel?
> > Just reproduced with pristine 6.12.28.
> >
> okay, i've update the firmware on my older Raspberry Pi 4 to the same 
> version as yours. But even with your configuration i don't see this kind 
> of fallout. So I think we shouldn't apply this patch until we really 
> know what's going on.

Ok, thank you, did you make sure a powered hdmi sink were connected? I
noticed there is no timeout if no hdmi is plugged (but there were when
monitor were powered off, maybe specific to my monitor).

> You don't have another Raspberry Pi 4 by any chance?

No, i don't.

> Another cause might be the toolchain. Currently I use a not so fresh gcc 
> 11.3.1 from Linaro.

Previous tries were cross built. I tried a native build with (Gentoo
packages) gcc 14.2.1_p20241221, binutils 2.44, and glibc 2.40-r8; but
got same result.
Will do a software upgrade overnight to try with more up to date build
system.

> Except of this, I noticed that your configuration doesn't enable 
> DWC2_DUAL_ROLE and the LEDS_TRIGGER.

I have no use of them (and i have a lot of things to disable, but i
prefer to do that starting with a working system).

Regards.


