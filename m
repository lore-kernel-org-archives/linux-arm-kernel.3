Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AA8B5CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 02:47:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=N+xJmULXxpHn+xezKethz/N2R54pHjMy75yfVcSZbZ8=; b=dOZvMbLA+FoshCtfcEWTuBmTSH
	KlAqzkP5daWi4GnFWj6TUyzZVDk6H3m27qVoJ+BMWgDLC7zji7pGMC+DdlClUTSk/sichst1mnhzd
	ht+TxmIaBRL9m4Wh2WvyDk1+Yz4E7NZ7/fy34lRYpbCyaGSZhueHN2IDrFIRg4ZCvUoFvfStZQEeU
	FGijrLe3oV5HeT8P94sYD0lWmK/QTV82c+WDdIqNIhd8Ct7f7Fo4uJcrMhh2W1DCSEsYZpb/J1ciH
	H4WN1/8HGN8Bu8YLd3Yy9GYMk3fiXERy+6dzulBKkcX0CSf+bXWTOtwHiFnKeLmxjCDHFg/bqh/qh
	Yl3GNnGA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYr7-0000000CCiD-3SmQ;
	Wed, 20 Aug 2025 02:47:17 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uoYo1-0000000CCRn-0VFH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 02:44:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=N+xJmULXxpHn+xezKethz/N2R54pHjMy75yfVcSZbZ8=; b=aFfxz7Lu4MS5kpv0tqnOjSO/Dk
	ftywl6LjfJ0a6NPa1n8NITAaay22TzriZiEV1deD1WFg1dO8r+tsKtGpktxxfAPp2Xb1nYTYbvbxn
	Ky/EkLFTVc5T+v66fENPlvrezjt982uOKTkQdC2O6zM2MLVK7SV0mBlHGJ4Z9x6rqXQk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1uoYnW-005GZ7-5N; Wed, 20 Aug 2025 04:43:34 +0200
Date: Wed, 20 Aug 2025 04:43:34 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Jacky Chou <jacky_chou@aspeedtech.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Simon Horman <horms@kernel.org>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>,
	Po-Yu Chuang <ratbert@faraday-tech.com>,
	"netdev@vger.kernel.org" <netdev@vger.kernel.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-aspeed@lists.ozlabs.org" <linux-aspeed@lists.ozlabs.org>,
	"taoren@meta.com" <taoren@meta.com>
Subject: Re: =?utf-8?B?5Zue6KaG?= =?utf-8?Q?=3A?= [net-next v2 0/4] Add
 AST2600 RGMII delay into ftgmac100
Message-ID: <3966765c-876e-4433-9c82-8d89c6910490@lunn.ch>
References: <20250813063301.338851-1-jacky_chou@aspeedtech.com>
 <a9ef3c51-fe35-4949-a041-81af59314522@lunn.ch>
 <SEYPR06MB513431EE31303E834E05704B9D33A@SEYPR06MB5134.apcprd06.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <SEYPR06MB513431EE31303E834E05704B9D33A@SEYPR06MB5134.apcprd06.prod.outlook.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250819_194405_158061_2A157759 
X-CRM114-Status: GOOD (  20.04  )
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

On Wed, Aug 20, 2025 at 12:40:02AM +0000, Jacky Chou wrote:
> Hi Andrew,
> 
> Thank you for your reply.
> 
> > > This patch series adds support for configuring RGMII internal delays
> > > for the Aspeed AST2600 FTGMAC100 Ethernet MACs.
> > 
> > So i think you are doing things in the wrong order. You first need to sort out the
> > mess of most, if not all, AST2600 have the wrong phy-mode, because the
> > RGMII delay configuration is hidden, and set wrongly.
> > 
> > Please fix that first.
> > 
> 
> The RGMII delay is configured in U-boot stage, and it is not changed when booting to
> Linux. I want to know whether the first thing to correct here is whether the phy-mode
> in aspeed-ast2600-evb.dts is rgmii-id. Our AST2600 EVB, there is no delay on board,
> so, I need to change the phy-mode to "rgmii-id" to meet the RGMII usage first?

If there is no delay on the PCB, then phy-mode is "rgmii-id".

	Andrew

