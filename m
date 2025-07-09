Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7460EC83F14
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 21:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9JNMjRDCMIHa+Po0H1LYj8KqoI3Jfy0hutL9Xpr7pSU=; b=LSCLmTjupnbgjO/8b48zWKlWw6
	TRC7a+XKTIPRTc//zp0lH4QWhLe93EHRYhZndwBGT9Oh7/xMB5J/TDLqfsl/qbTfIiGbBSmxld6lu
	Jc6ebfEKYM5TFenHLdde3iwDjm3spcpG8JftpPo8Xyb2SAIOX9nxpM/kb5PFdcy+tvkDY9oITMA+A
	zfmW6aiT5OsVls2//uBNQTgmaMC9TgHPKU6EsiPjRLCC+IcwIw1/9dhpIdnr1BzMD121B74F+RiV3
	8mZHhchkndJ+vW2oQsnhTJWLhOQ1w+jiU60t2kjd0x8/6UOMUD8OoloHNYoZDx/p78csqu4VaZH/8
	RK13VmPQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZcoM-00000009xgt-2JEG;
	Wed, 09 Jul 2025 21:58:42 +0000
Received: from pandora.armlinux.org.uk ([2001:4d48:ad52:32c8:5054:ff:fe00:142])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYoP-00000009SMd-2Q30
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 17:42:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
	List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=9JNMjRDCMIHa+Po0H1LYj8KqoI3Jfy0hutL9Xpr7pSU=; b=tbhZoaNAh9WyeIfezPzjBJKpAf
	jyvVdnsDK+o+tp55I7V65vC8T5Cl8sjTg6iLu1L6Nu+zrJj5U80bQv9AwD4+7dY0PsPAOwIafbpOh
	TIiGkLQFVw5dJwNeWWmUsj103sFDE2EN26yOUWNQmMzvprLx4/Lxxq2hn1IuCzcKLwxdhetx0QJ1X
	djzSN/MMoqkGr8IPalFPJYpD7lGFfccg1bd+654QLcIVLFjZEwnSJWze1InOSEa8Z5925YX4TToUy
	MhZQF6JqWQ+/jsQS/gN4G779mK07e4zaL5ZPDaWUHyqrvaCPgJRNmDNsoKBxm/g1wB1CmIShjP/M2
	xKv4TjyA==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:56254)
	by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <linux@armlinux.org.uk>)
	id 1uZYo3-0008JZ-0r;
	Wed, 09 Jul 2025 18:42:07 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.96)
	(envelope-from <linux@shell.armlinux.org.uk>)
	id 1uZYnv-0002pD-1X;
	Wed, 09 Jul 2025 18:41:59 +0100
Date: Wed, 9 Jul 2025 18:41:59 +0100
From: "Russell King (Oracle)" <linux@armlinux.org.uk>
To: lizhe <sensor1010@163.com>
Cc: Andrew Lunn <andrew@lunn.ch>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: Re: [PATCH] net: stmmac: Support gpio high-level
 reset for devices requiring it
Message-ID: <aG6p5_p9CmqxZcxM@shell.armlinux.org.uk>
References: <20250708165044.3923-1-sensor1010@163.com>
 <52b71fe7-d10a-4680-9549-ca55fd2e2864@lunn.ch>
 <5c7adfef.1876.197ece74c25.Coremail.sensor1010@163.com>
 <aG3vj1WYn3TjcBZe@shell.armlinux.org.uk>
 <5bb49dc0.6933.197ee28444e.Coremail.sensor1010@163.com>
 <aG5ORmbgMYd08eNR@shell.armlinux.org.uk>
 <4cfb4aab.9588.197eefef55f.Coremail.sensor1010@163.com>
 <aG582lPgpOr8oyyx@shell.armlinux.org.uk>
 <2352b745.a454.197efeef829.Coremail.sensor1010@163.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2352b745.a454.197efeef829.Coremail.sensor1010@163.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250709_104229_614418_1CB85F06 
X-CRM114-Status: GOOD (  17.25  )
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

On Thu, Jul 10, 2025 at 12:05:05AM +0800, lizhe wrote:
> Hi，
> 
>      
> 
>   if i add the following code to this function, the gpio outputs a high level
> 
>   without this code, it outputs a low level, 
>   the function currently drivers the reset GPIO to a low state, failing to account 
> 
>   for devices requiring an active-high reset.
> 
> 
> 
> 
>   i invited our hardware engineer to  measure the voltage level on this GPIO pin,
> 
>   without  adding this code, the voltage at this GPIO pin remains at 0V
> 
> 
> 
> 
>   +             int current_value;
> 
> 
> 
> 
>   +             keep_high = device_property_read_bool(priv->device,
> 
>   +                                                             "snps,reset-keep-high");
> 
>   +              if (keep_high) {
> 
>   +                     gpiod_set_value_cansleep(reset_gpio, 1);
> 
>   +                      current_value = gpiod_get_value_cansleep(reset_gpio);
> 
>   +                      pr_info("current_value: %d\n", current_value);
> 
>   +              }
> 
>    in the RK3588 system, i am using ,there are many DTS node configured link this:
> 
>     snps, reset-gpio = <&gpioX RK_PXX GPIO_ACTIVE_HIGH>;   
>     All of them correctly parse the GPIO pin's state are described in the DTS
> 

I'm wondering at this point whether the problem here is one of
mis-understanding the engineering terminology. Look at the below
using a fixed-width font:

Active-high reset: _____/^^^^^^^^\____

Active-low reset:  ^^^^^\________/^^^^

                        | reset  |
			|asserted|

So, an active high reset needs to be logic low in order for the
device to function. An active low reset needs to be logic high
for the device to function.

You seem to be wanting to tell the kernel that you have an
active high reset, and expect it to be logic high when you
want it to be active. That is *not* an active high reset.

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!

