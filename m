Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A80C54F30
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 16:23:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9rNlK/XBcvxaY6HC+BzHK/m/yi4kBfY4FGCOEbvM3Jk=; b=2c81Gee6jEFBdpBCyGHE+K+KVo
	wdp2QQ679iCdLMfI/MWpUIwcaauTXIl0fj3kyeeaLjNkQQn4KY2udYn9uZi2tCvLhX5sU4jkjP/4P
	zGIerDTvodUwyT1ePxqjykdBwr7wGwwxdyTdozSoptGqEqWKncxCjxRvO+auhSBGEY83qYRQEEaAJ
	8g7nSn6/V9iRJ7dcpPGwaZSzqqzCX+D4f4r/m2Zsg0U7bayr/NY/9KbQJwpB0NoSNUM9ATPUjjbM8
	q98SRZPaZ+/zn/9N18XQWFHFLtqGuvKAipZddICdPHpu0en8m67A4UVFQyNKkZADVKUU3JM1fl5FM
	SnGylZow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJx5C-0000000B9TS-3ttm;
	Tue, 27 May 2025 16:23:18 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJx0m-0000000B8nY-4Adj;
	Tue, 27 May 2025 16:18:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=9rNlK/XBcvxaY6HC+BzHK/m/yi4kBfY4FGCOEbvM3Jk=; b=cUegHvYd7VyL7dPW+3g+aWWXae
	g4mkfYFK+DZFozxxITith4TlCR4ZCaeMCzSs/CoC3VY6rf8iHdzZ6SuF2cqWR9sBAAz4CbGi7eRC4
	yZUYo5+J3eJh73/1irhNoqcOwip0Fv7a0ULF1Hb0aL6GL5INzpHQtGMXbF0gcCa7Dqk8=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uJx0g-00E5r4-I7; Tue, 27 May 2025 18:18:38 +0200
Date: Tue, 27 May 2025 18:18:38 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jakob Unterwurzacher <jakobunt@gmail.com>
Cc: foss+kernel@0leil.net, conor+dt@kernel.org, devicetree@vger.kernel.org,
	heiko@sntech.de, jakob.unterwurzacher@cherry.de, krzk+dt@kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-rockchip@lists.infradead.org, quentin.schulz@cherry.de,
	robh@kernel.org
Subject: Re: [PATCH v2] arm64: dts: rockchip: support Ethernet Switch adapter
 for RK3588 Jaguar
Message-ID: <35e0a925-4cba-41de-8fe4-4dd10e8816f1@lunn.ch>
References: <20250523-jaguar-mezz-eth-switch-v2-1-aced8bf6612d@cherry.de>
 <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250527131142.1100673-1-jakob.unterwurzacher@cherry.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_091845_031105_327A31D3 
X-CRM114-Status: GOOD (  12.14  )
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

On Tue, May 27, 2025 at 03:11:42PM +0200, Jakob Unterwurzacher wrote:
> > @Jakob, is this something you could check? devmem2 0xfd58c31c w 0x3c0000
> > should do the trick to disable the circuitry according to the TRM?
> 
> I measured TXCLK vs TXD3 on an oscilloscope on gmac1:
> 
> 	Setting	Decimal	Actual TXCLK delay (ps)
> 	00	0	47
> 	0a	10	283
> 	10	16	440
> 	20	32	893
> 	30	48	1385
> 	40	64	1913
> 	50	80	2514
> 	60	96	3077
> 	70	112	3565
> 	7f	127	4009
> 
> 	off	x	-315
> 
> Setting = tx_delay (hex)
> Decimal = tx_delay (dec)
> Actual TXCLK delay (ps) = Measurement from oscilloscope
> 
> Plotting this we can deduce that one tx_delay unit is about 31ps.

Nice to see somebody actually do the measurements. Based on this, it
would be good to implement:

        tx-internal-delay-ps:
          description:
            RGMII Transmit Clock Delay defined in pico seconds. This is used for
            controllers that have configurable TX internal delays. If this
            property is present then the MAC applies the TX delay.

For the moment, please limit it to just the device you measured it on.

	Andrew

