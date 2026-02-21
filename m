Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EFF1CC5AD7B
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 15:41:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WF7a5GzWEFZ0La2JwjVlCs++i1kUNnI0/gEMbMwKHjA=; b=KbgDOmMmjbyA73JEvgU2GBgCUN
	Nsv+DrhDJRtoob4vNdfz2ZYQXsBrJAerJ2Y+NoWkXjtFppPZonB7sqY9eBh6Xd72xz2Oj38xSZMBH
	ecpAKDg7fRpDr9otL4ZKjvKiTPZQO9rHLi3tniw2iKF8xUV093Q1SM3p1ZVhCSbxrG9lXULzrfODe
	82l+SnQrJxfI/5YlqZtA3vwDvqLuSiltiOtDxA6MKkoen9Ugdom+2UVI6jD6c7RuBOtng1GnzeP6m
	H9dK51UrYUMal5JtbszQ+BYcWb5OdIO3v641XeW6xM916ZMDaQU6G5oYyYg24vPGFamndHmH6a/b6
	wb37VqMw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtp6n-0000000G9Kh-42NB;
	Sat, 21 Feb 2026 15:41:29 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtp6m-0000000G9KI-1P19
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 15:41:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=WF7a5GzWEFZ0La2JwjVlCs++i1kUNnI0/gEMbMwKHjA=; b=YLgOqUSr1j9q4eH50aKOZ7sc2e
	Pavn+YoVmLqyNDw84LlNVWqeHrnagMiRUllON+HAigX4Y3PhBmSlMoqX6xje9G30A2g+iXjBTeECD
	9HQC6NdCbuErnH4VkYhmvMraiC7w7w8WTXWVwEsjqwel2JSc058f/mlpm61RD0W2XZHw=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1vtp6b-008BGY-Gk; Sat, 21 Feb 2026 16:41:17 +0100
Date: Sat, 21 Feb 2026 16:41:17 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Gabor Juhos <j4g8y7@gmail.com>
Cc: Gregory Clement <gregory.clement@bootlin.com>,
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: dts: marvell: armada-3720: drop
 'marvell,xenon-emmc' properties
Message-ID: <24cee5ef-30c8-44bd-9c4f-48f20457cc5e@lunn.ch>
References: <20260221-armada-37xx-drop-xenon-emmc-v1-1-3110e83091b8@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260221-armada-37xx-drop-xenon-emmc-v1-1-3110e83091b8@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_074128_377400_F6B18E8D 
X-CRM114-Status: GOOD (  12.42  )
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

On Sat, Feb 21, 2026 at 04:37:59PM +0100, Gabor Juhos wrote:
> The 'marvell,xenon-emmc' property used in some device trees of Armada 3720
> based boards is not documented. Due to this dtbs_check throws warnings:
> 
>   .../armada-3720-atlas-v5.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
>   .../armada-3720-espressobin-emmc.dtb: mmc@d8000 (marvell,armada-3700-sdhci): Unevaluated properties are not allowed ('marvell,xenon-emmc' was unexpected)
> 
> Apart from the warnings, 'git grep' says that the property is used in
> device trees only:
> 
>   $ git grep -n 'marvell,xenon-emmc'
>   arch/arm64/boot/dts/marvell/armada-3720-atlas-v5.dts:85:        marvell,xenon-emmc;
>   arch/arm64/boot/dts/marvell/armada-3720-espressobin.dtsi:81:    marvell,xenon-emmc;
> 
> Although handling of the property was there in an early version of
> the 'sdhci-xenon' driver during the initial submission [1], but that
> part has been removed in later versions.
> 
> Drop the property from the affected device trees due to the reasons
> mentioned above.
> 
> No functional changes intended, compile tested only.
> 
> Link: https://lore.kernel.org/r/0390e7a05b6163deabb545f93729ea615eeaaee2.1477911954.git-series.gregory.clement@free-electrons.com # [1]
> Signed-off-by: Gabor Juhos <j4g8y7@gmail.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew

