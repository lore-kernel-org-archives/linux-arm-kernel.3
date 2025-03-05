Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8BCCC28B21
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 12:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT6ieFhN3zQWbuV/hXGfdLrRZ8QauOz6+gPkTZ+qxhY=; b=OkiNDcKCie6eiNVxmqn/XzN/XM
	aG6CeY0ZgJT5v13nm3zwnvQV0FV2CTCRah1cnW6wTqLKLybkcuNhvPBEg2AOD32AwXF/WjOkCjw9K
	mJF5w/UuTKxGKEdEObKF95woXXy0PiTw7v+ef+iJrtd/qgLoOmfNgj1M/UwvPEftWd4rtNu+PxhbS
	vw54IGeCt1XY/lezynFDlyod0TqLAHkhFLOvjUWiDt781Dx/EPtonK0lGGWuug55xOuGXOho8pAXG
	IFBMy9WybQ93tMD15iCf2+FZik4v9MypHsyVxx0R5XMEtMjodPu551W1TkGwAePE3z96ybiK95p6C
	uwyte+bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpoB1-000000084MW-1v4O;
	Wed, 05 Mar 2025 12:48:43 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmDO-00000007j9R-1LgE
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 05 Mar 2025 10:43:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=WT6ieFhN3zQWbuV/hXGfdLrRZ8QauOz6+gPkTZ+qxhY=; b=Uy37t+LxtpcghzoXqZRC2DuA8t
	/Pie/Dx4KsNy5m9tanDzeorSazLLTPtJ4V3rKDrOxwAlbA+pw7YHGeaghSjUX64HFJEC3OAoSw0aF
	T2BA2nncTZuhMqtUVtyv9s3N7qqh2xU8IARqD5C6Dm2ZwZPLvZ8ocMMQtAvBIzz1A32TaWXUi9LTj
	Y7FrDAivEjXdC7earvZlGkKmxOsl22aDd4aW2NRdg8ALnWJ4H9QVdsKNIM3du4ml8X4TcDHz8Fr5C
	zGNNwSgPEErex7pIP8ErnG5+Kjx1qPnJXFqyFMsFEHA+REBWf6YdqfgbaKEnw832hCy9qDhJ8JW0N
	ARMzHL1w==;
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by casper.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpmDL-00000005Jon-00U9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 10:43:01 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=[127.0.0.1])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tpmCM-00054k-Ob; Wed, 05 Mar 2025 11:41:58 +0100
Message-ID: <43fb0965-04b7-41dc-ae3f-54676eefdbb5@pengutronix.de>
Date: Wed, 5 Mar 2025 11:41:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] Add stop_on_panic support for watchdog
To: George Cherian <george.cherian@marvell.com>, linux@roeck-us.net,
 wim@linux-watchdog.org, jwerner@chromium.org, evanbenn@chromium.org,
 kabel@kernel.org, krzk@kernel.org, mazziesaccount@gmail.com,
 thomas.richard@bootlin.com, lma@chromium.org, bleung@chromium.org,
 support.opensource@diasemi.com, shawnguo@kernel.org, s.hauer@pengutronix.de,
 kernel@pengutronix.de, festevam@gmail.com, andy@kernel.org,
 paul@crapouillou.net, alexander.usyskin@intel.com, andreas.werner@men.de,
 daniel@thingy.jp, romain.perier@gmail.com, avifishman70@gmail.com,
 tmaimon77@gmail.com, tali.perry1@gmail.com, venture@google.com,
 yuenn@google.com, benjaminfair@google.com, maddy@linux.ibm.com,
 mpe@ellerman.id.au, npiggin@gmail.com, christophe.leroy@csgroup.eu,
 naveen@kernel.org, mwalle@kernel.org, xingyu.wu@starfivetech.com,
 ziv.xu@starfivetech.com, hayashi.kunihiko@socionext.com, mhiramat@kernel.org
Cc: chrome-platform@lists.linux.dev, linux-watchdog@vger.kernel.org,
 imx@lists.linux.dev, patches@opensource.cirrus.com,
 openbmc@lists.ozlabs.org, linux-mips@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-arm-kernel@lists.infradead.org
References: <20250305101025.2279951-1-george.cherian@marvell.com>
Content-Language: en-US
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
In-Reply-To: <20250305101025.2279951-1-george.cherian@marvell.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_104259_056966_DDBF1F61 
X-CRM114-Status: GOOD (  17.81  )
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

On 05.03.25 11:10, George Cherian wrote:
> This series adds a new kernel command line option to watchdog core to
> stop the watchdog on panic. This is useul in certain systems which prevents
> successful loading of kdump kernel due to watchdog reset.
> 
> Some of the watchdog drivers stop function could sleep. For such
> drivers the stop_on_panic is not valid as the notifier callback happens
> in atomic context. Introduce WDIOF_STOP_MAYSLEEP flag to watchdog_info
> options to indicate whether the stop function would sleep.

Did you consider having a reset_on_panic instead, which sets a user-specified
timeout on panic? This would make the mechanism useful also for watchdogs
that can't be disabled and would protect against system lock up:
Consider a memory-corruption bug (perhaps externally via DMA), which partially
overwrites both main and kdump kernel. With a disabled watchdog, the system
may not be able to recover on its own.

If you did consider it, what made you decide against it?

Thanks,
Ahmad

> 
> 
> Changelog:
> v1 -> v2
> - Remove the per driver flag setting option
> - Take the parameter via kernel command-line parameter to watchdog_core.
> 
> v2 -> v3
> - Remove the helper function watchdog_stop_on_panic() from watchdog.h.
> - There are no users for this. 
> 
> v3 -> v4
> - Since the panic notifier is in atomic context, watchdog functions
>   which sleep can't be called. 
> - Add an options flag WDIOF_STOP_MAYSLEEP to indicate whether stop
>   function sleeps.
> - Simplify the stop_on_panic kernel command line parsing.
> - Enable the panic notiffier only if the watchdog stop function doesn't
>   sleep
> 
> George Cherian (2):
>   watchdog: Add a new flag WDIOF_STOP_MAYSLEEP
>   drivers: watchdog: Add support for panic notifier callback
> 
>  drivers/watchdog/advantech_ec_wdt.c |  3 ++-
>  drivers/watchdog/arm_smc_wdt.c      |  3 ++-
>  drivers/watchdog/armada_37xx_wdt.c  |  2 +-
>  drivers/watchdog/asm9260_wdt.c      |  2 +-
>  drivers/watchdog/bcm47xx_wdt.c      |  3 ++-
>  drivers/watchdog/bd9576_wdt.c       |  2 +-
>  drivers/watchdog/bd96801_wdt.c      |  2 +-
>  drivers/watchdog/cgbc_wdt.c         |  2 +-
>  drivers/watchdog/cros_ec_wdt.c      |  5 ++++-
>  drivers/watchdog/da9052_wdt.c       |  3 ++-
>  drivers/watchdog/da9055_wdt.c       |  4 +++-
>  drivers/watchdog/da9062_wdt.c       |  4 +++-
>  drivers/watchdog/da9063_wdt.c       |  4 +++-
>  drivers/watchdog/db8500_wdt.c       |  5 ++++-
>  drivers/watchdog/dw_wdt.c           |  5 +++--
>  drivers/watchdog/f71808e_wdt.c      |  3 ++-
>  drivers/watchdog/gpio_wdt.c         |  2 +-
>  drivers/watchdog/i6300esb.c         |  5 ++++-
>  drivers/watchdog/imx_sc_wdt.c       |  2 +-
>  drivers/watchdog/intel-mid_wdt.c    |  5 ++++-
>  drivers/watchdog/it87_wdt.c         |  5 ++++-
>  drivers/watchdog/jz4740_wdt.c       |  5 ++++-
>  drivers/watchdog/kempld_wdt.c       |  3 ++-
>  drivers/watchdog/lenovo_se10_wdt.c  |  5 ++++-
>  drivers/watchdog/max77620_wdt.c     |  5 ++++-
>  drivers/watchdog/mei_wdt.c          |  3 ++-
>  drivers/watchdog/menf21bmc_wdt.c    |  4 +++-
>  drivers/watchdog/mlx_wdt.c          |  2 +-
>  drivers/watchdog/msc313e_wdt.c      |  5 ++++-
>  drivers/watchdog/npcm_wdt.c         |  3 ++-
>  drivers/watchdog/omap_wdt.c         |  5 ++++-
>  drivers/watchdog/pm8916_wdt.c       |  5 +++--
>  drivers/watchdog/pseries-wdt.c      |  2 +-
>  drivers/watchdog/rave-sp-wdt.c      |  5 ++++-
>  drivers/watchdog/renesas_wdt.c      |  7 ++++--
>  drivers/watchdog/retu_wdt.c         |  5 ++++-
>  drivers/watchdog/rn5t618_wdt.c      |  6 +++--
>  drivers/watchdog/rzg2l_wdt.c        |  5 ++++-
>  drivers/watchdog/rzv2h_wdt.c        |  5 ++++-
>  drivers/watchdog/shwdt.c            |  6 +++--
>  drivers/watchdog/sl28cpld_wdt.c     |  5 ++++-
>  drivers/watchdog/softdog.c          |  5 ++++-
>  drivers/watchdog/sp805_wdt.c        |  5 ++++-
>  drivers/watchdog/starfive-wdt.c     |  3 ++-
>  drivers/watchdog/stpmic1_wdt.c      |  5 ++++-
>  drivers/watchdog/ts4800_wdt.c       |  5 ++++-
>  drivers/watchdog/twl4030_wdt.c      |  5 ++++-
>  drivers/watchdog/uniphier_wdt.c     |  3 ++-
>  drivers/watchdog/w83627hf_wdt.c     |  5 ++++-
>  drivers/watchdog/watchdog_core.c    | 35 +++++++++++++++++++++++++++++
>  drivers/watchdog/wm831x_wdt.c       |  5 ++++-
>  drivers/watchdog/wm8350_wdt.c       |  5 ++++-
>  drivers/watchdog/xen_wdt.c          |  5 ++++-
>  drivers/watchdog/ziirave_wdt.c      |  5 ++++-
>  include/linux/watchdog.h            |  2 ++
>  include/uapi/linux/watchdog.h       |  1 +
>  56 files changed, 198 insertions(+), 58 deletions(-)
> 


-- 
Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | http://www.pengutronix.de/  |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-5555 |

