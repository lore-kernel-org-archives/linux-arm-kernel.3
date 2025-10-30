Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 60FD9CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 14:50:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+1Ygbu6e/z62ponw49iBMoX40vLxbr6Wro8ocFjVzww=; b=M0OTjOqeF11vJBKmqMp9LwYDDp
	1Yg1BloKTzyQimBW/GMF+dtDz1/WC8DWYnT5itrNsw/G8nmoRhhGeW1JeCDJH6yhLb3h+9s8CZHmm
	7sB0PdRSXUvvJ9FeMA9uOHRsq1918hGZIan+us0/albe6TJxCjcbPzQPuYL5smZFloO61eUY0rmTX
	TuqGtMgz/wZmMzr4Hu/Cfh62EgRhNs/0L1j+VOoo4LYf82xnhRKTXgC6fdkRvFpl/4H7bO7UHcKCS
	MmmaglhMqzDjCp/jdQFXwwJYCNhkjKNszhtlVlEXte5oevgXEOna/sLVA9eAKoKBkLesUIYKTennv
	TeTv7+bA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETzE-00000004KUW-31mZ;
	Thu, 30 Oct 2025 14:50:48 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vETz8-00000004KTh-2SVA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 14:50:44 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 0A8851A1787;
	Thu, 30 Oct 2025 14:50:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CEAE06068C;
	Thu, 30 Oct 2025 14:50:38 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BA2EF118085D0;
	Thu, 30 Oct 2025 15:50:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761835837; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=+1Ygbu6e/z62ponw49iBMoX40vLxbr6Wro8ocFjVzww=;
	b=c4jfDxDaT7/tVH7dUdrj/rMHhXZb5FKMUZRP2sjVcueoc2itU5lk3zruIAyueCdoFM1fLw
	7McxfrFbhskqXwSsiRl+kz8Tow+vo3oRbaRsj8G+XmyLujC2rkg3lrfvPf5RTXemvc3D7S
	xzdGDxlGRK2BFG/ZaNxn7LxlSvRkADyOizAuJDb9ZWYL0JADEPuY7WFrul65gkEWG4kvcx
	CQLvKMhCKtQzpVM6W9HZdc/85ivPnl6XvHlsTZ6uTlGbqdhUPJtO+tNuj+28MCo78LJwpq
	gisCKKFuiq9TnBRQUAK7AAo7a5N8dfuIBOIWMK7uRtBxFXjIPsTRC30aBWo38Q==
Message-ID: <7a611937-a2af-4780-9b88-cf9f282f88b3@bootlin.com>
Date: Thu, 30 Oct 2025 15:50:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v14 01/16] dt-bindings: net: Introduce the
 ethernet-connector description
To: Andrew Lunn <andrew@lunn.ch>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
 Russell King <linux@armlinux.org.uk>, linux-arm-kernel@lists.infradead.org,
 Christophe Leroy <christophe.leroy@csgroup.eu>,
 Herve Codina <herve.codina@bootlin.com>,
 Florian Fainelli <f.fainelli@gmail.com>,
 Heiner Kallweit <hkallweit1@gmail.com>,
 Vladimir Oltean <vladimir.oltean@nxp.com>,
 =?UTF-8?Q?K=C3=B6ry_Maincent?= <kory.maincent@bootlin.com>,
 =?UTF-8?Q?Marek_Beh=C3=BAn?= <kabel@kernel.org>,
 Oleksij Rempel <o.rempel@pengutronix.de>,
 =?UTF-8?Q?Nicol=C3=B2_Veronese?= <nicveronese@gmail.com>,
 Simon Horman <horms@kernel.org>, mwojtas@chromium.org,
 Antoine Tenart <atenart@kernel.org>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Romain Gantois <romain.gantois@bootlin.com>,
 Daniel Golle <daniel@makrotopia.org>,
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>,
 Florian Fainelli <florian.fainelli@broadcom.com>
References: <20251013143146.364919-1-maxime.chevallier@bootlin.com>
 <20251013143146.364919-2-maxime.chevallier@bootlin.com>
 <382973b8-85d3-4bdd-99c4-fd26a4838828@bootlin.com>
 <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <b6a80aba-638f-45fd-8c40-9b836367c0ea@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251030_075042_764694_60FE46E9 
X-CRM114-Status: GOOD (  30.29  )
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

Hi Andrew, thanks for the reply !

On 30/10/2025 14:23, Andrew Lunn wrote:
> On Thu, Oct 30, 2025 at 01:13:14PM +0100, Maxime Chevallier wrote:
>> Hi,
>>
>>> @@ -313,5 +324,12 @@ examples:
>>>                      default-state = "keep";
>>>                  };
>>>              };
>>> +            /* Fast Ethernet port, with only 2 pairs wired */
>>> +            mdi {
>>> +                connector-0 {
>>> +                    lanes = <2>;
>>> +                    media = "BaseT";
>>> +                };
>>> +            };
>>>          };
>>>      };
>>
>> As Andrew suggest clearly differentiating "lanes" and "pairs", do we
>> want this difference to also affect the binding ?
>>
>> I still think "lanes" makes some level of sense here, but at least
>> the doc will need updating.
> 
> How do you define MDI?
> 
> For copper, one possibility is an RJ-45 plug/socket, and you have
> twisted pairs, 2 or 4 of them.
> 
> Some people are old enough to remember 10Base2, using a coaxial cable
> and BNC connectors. Would you consider that a pair? A lane?
> 
> How about an SFF, a soldered down module. Its MDI interface is likely
> to be 2 fibre strands. But consider so called bidi modules, which use
> one fibre, and two different wavelengths of light.
> 
> Or an SFP, where you have no idea what the MDI is until you plug it in
> and read the EEPROM.
> 
> Do we need to be able to describe all the different MDI? Do we maybe
> need to look at the media property to decide it is an RJ-45 connector
> so there should be a pairs property? Or the media is -KS, so there
> should be a lanes property for the number of PCS lanes on the PCB?
> 
> This needs further discussion, what are you actually trying to
> represent here?

What I'd like to represent here is at least BaseT connectors, or simple
Fiber connectors without SFF/SFP (we already have an sff/sfp description
in DT, and we can know what they do by reading the eeprom).

Let's consider these examples, which are representative of what I
want to represent and why.

As a remainder, the end-goal is to be able to list to userspace the
front-facing ports that are beind a netdev, so that we can in the end
support MII-side muxing.

We have several examples of that already upstream :
 - Turris omnia, where we have a mux in the SoC to output the SGMII/1000BaseX
  either on a PHY or an SFP port. This is not covered by this series.

 - The MCBin Doubleshot. Here we have the Marvell 88x3310 PHY connected to the MAC,
and to both an SFP and a RJ45.

However, what we have in DT is :


&cp0_xmdio {
	status = "okay";

	phy0: ethernet-phy@0 {
		compatible = "ethernet-phy-ieee802.3-c45";
		reg = <0>;
		sfp = <&sfp_eth0>;
	};

	[...]
};

The question is, with the information we have in DT and from what the PHY
can autodiscover, how do we know if we have this :

MAC --- PHY ---- SFP

or this :

MAC ---PHY ----SFP
        \-----RJ45

I don't think we can, we are missing a description of the MDI-side of the PHY.

Of course I don't want to start representing the MDI for every PHY out
there, most common case we have one MDI, that supports whatever the PHY
reports from .get_features(), with the possibility of reading some straps to
adjust.

When we start representing the MDI, we can take that opportunity to solve other
problems :

 - The proliferation of vendor properties like "ti,fiber-mode" or "micrel,fiber-mode"
 - The use of "max-speed = <100>;" because the PHY is only connected to the RJ45 with
   2 pairs

So that being said, an option could be to only focus on pairs, only for medium = BaseT,
and ditch the "lanes" terminology, at least when it comes to the DT bindings.

Does that sound good ?

Maxime


