Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49753C83F0A
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 19:15:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xwIuPRfBvgwDUvog670XJikOKlbcAYFNfjUJsTugx6A=; b=xNRbrwD0cvG+fRpwb1H4QZuUiN
	XUau/lf7qQwWzG2JjkSugwbi/pWHOgPE+6Ittyr3zCSlKJaNmruOWz/zNlT3bY3OhBGjroj3yD24h
	SwIl9SKOBZ0XdA3vyfV5Z2noTI/woLVUHHLqa3/lfZJpKTAKEv3559okb+EL6HH3nPMfXLRrwYHQB
	Dv04tCMPUoUtk+MYvLv3ea1T4gK6E9GstyKjoWrCcTUG0tAH15InkSn4Zd0SvFRT2HdIH7JXLjOka
	zlmxzi4xJB3FHhlnMrioLKlbfivln1LN5LXvB7FSbEtmV+pX8EhxYG6Ty2T7564lvRUwO37A9OQ5y
	8f5H53WQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZaFz-00000009gXp-42P3;
	Wed, 09 Jul 2025 19:15:03 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZYBC-00000009Nf9-3F3K
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 17:01:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Transfer-Encoding:Content-Disposition:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:From:
	Sender:Reply-To:Subject:Date:Message-ID:To:Cc:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Content-Disposition:
	In-Reply-To:References; bh=xwIuPRfBvgwDUvog670XJikOKlbcAYFNfjUJsTugx6A=; b=Cw
	VMW57aiB17xlq/dLe76GHEPU5J1MEexTvB8lWof2SLJB4Cje7+Cqa3FdsRzEK5ZRVjyNg1whbcbl7
	00tT82y8NBDIr7x8bXUunG89PbkXlPnVl6VclpKalW4d2FBVW6zhNY1tD5IlaiiuSI2yrL/WPxTEo
	60Pe9RLlao8dOWE=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uZYAo-000y3p-7J; Wed, 09 Jul 2025 19:01:34 +0200
Date: Wed, 9 Jul 2025 19:01:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: lizhe <sensor1010@163.com>
Cc: "Russell King (Oracle)" <linux@armlinux.org.uk>, andrew+netdev@lunn.ch,
	davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
	pabeni@redhat.com, mcoquelin.stm32@gmail.com,
	alexandre.torgue@foss.st.com, vladimir.oltean@nxp.com,
	maxime.chevallier@bootlin.com, netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: Re: Re: Re: Re: [PATCH] net: stmmac: Support gpio high-level
 reset for devices requiring it
Message-ID: <05cd64a0-ec24-4ea0-9f57-8d8542563a51@lunn.ch>
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
X-CRM114-CacheID: sfid-20250709_100158_815167_84DEF11F 
X-CRM114-Status: GOOD (  14.84  )
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

Please don't top post.

>     snps, reset-gpio = <&gpioX RK_PXX GPIO_ACTIVE_HIGH>;   
>     All of them correctly parse the GPIO pin's state are described in the DTS
> 
> 
> 
> Thx !
> 
> Lizhe
> 
> 
> 
> 
> At 2025-07-09 22:29:46, "Russell King (Oracle)" <linux@armlinux.org.uk> wrote:
> >On Wed, Jul 09, 2025 at 07:42:55PM +0800, lizhe wrote:
> >> Hi,
> >>     i have already declared it in the DTS.
> >>
> >>     &gmac {
> >>             snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
> >>     };
> >
> >Active high means that the reset is in effect when the output is at the
> >logic '1' state. So, gpiod_get_value*() will return the same as
> >gpiod_get_raw_value*().
> >
> >Active low means that the reset is in effect when the output is at the
> >logic '0' state, and in that case the return value of
> >gpiod_get_value*() will return true when the reset is active (at logic
> >'0' state) whereas gpiod_get_raw_value*() will return zero.

Did you read what Russell said? If so, why are you using
GPIO_ACTIVE_HIGH?

	Andrew

