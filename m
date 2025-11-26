Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A54E8D10F58
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Nov 2025 14:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sbs0A8qAYuq+r/+1fjxriavvnUhEfhMgY7SBF5X8V08=; b=cPPRd/1PF+EAG6fg5JYeB5SIk8
	yr4ElumDppcsCwomdzaC5E9FUh7YRhmhKXvCfMW130FqhdtVCn5S8mxQjay+gYknHyyJ6k+oh7NcU
	MQPDGR+f+oC4+Vz82bp6xnTE7j/DQn8DVjwTKvmtP9P36KqB4S3tiFCvFCp1nQmwgLTk9ZZPltMI5
	GTXSkPiJ/x8jMGxxbIoUJZjr1HexC3IgWJEk6bH79cvxQww26gxkRMTeSe/hQXe/olA7i3VAv915j
	ldEMOs32zjk20VrQSpLxucYrtQ7hVAb5ZRacXSKUfp1zPaenryIKvHxAXaurfql3gcH2hCtfPoZw0
	AZA+nFTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGSN-0000000F6nH-28OF;
	Wed, 26 Nov 2025 14:25:19 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOGSJ-0000000F6mH-2ETG;
	Wed, 26 Nov 2025 14:25:17 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A0186C15D78;
	Wed, 26 Nov 2025 14:24:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 578AB60721;
	Wed, 26 Nov 2025 14:25:12 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 64B5A102F08EF;
	Wed, 26 Nov 2025 15:25:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764167111; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=Sbs0A8qAYuq+r/+1fjxriavvnUhEfhMgY7SBF5X8V08=;
	b=k0ooTJYIYW0FYBMVhrgVBpA7A6kXMyqERAgQSrzwOurSlWfmkbqR/cAmccU11VWLC5YJEI
	n6WrPplsAi0/qCeWTP5rC5r6OVtJarSahnvu8/ytGNtL2IhjV2o4qcZLK1BKZ9REOhbIne
	GpHwbaHF7/xV6QP11Em8OqvJQxr/vpKrq/B/xhMU6iRCotsKbsvezuDAlSdbcWdLA7WkHY
	PgHtTABkVp75O1gL9djdWOv4/kvWgJGTXQQtoWevSW4VHF0gnednfaSxWzHACT5hKJnynF
	DcFAau2f9LPmwhjE9ZTrqGuSx7982EfRtb9Sv1Y9Gy4TO0KRoTFUYh71zTNEkA==
Message-ID: <9c2518d8-a0ea-46ba-9069-999c2574cd24@bootlin.com>
Date: Wed, 26 Nov 2025 15:25:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 1/9] dt-bindings: phy: rename
 transmit-amplitude.yaml to phy-common-props.yaml
To: Vladimir Oltean <vladimir.oltean@nxp.com>, Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 Daniel Golle <daniel@makrotopia.org>,
 Horatiu Vultur <horatiu.vultur@microchip.com>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Eric Woudstra <ericwouds@gmail.com>, =?UTF-8?B?TWFyZWsgQmVo4oia4oirbg==?=
 <kabel@kernel.org>, Lee Jones <lee@kernel.org>,
 Patrice Chotard <patrice.chotard@foss.st.com>,
 Holger Brunck <holger.brunck@hitachienergy.com>
References: <20251122193341.332324-1-vladimir.oltean@nxp.com>
 <20251122193341.332324-2-vladimir.oltean@nxp.com>
 <0faccdb7-0934-4543-9b7f-a655a632fa86@lunn.ch>
 <20251125214450.qeljlyt3d27zclfr@skbuf>
 <b4597333-e485-426d-975e-3082895e09f6@lunn.ch>
 <20251126072638.wqwbhhab3afxvm7x@skbuf>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251126072638.wqwbhhab3afxvm7x@skbuf>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251126_062515_764248_D0E7DF9C 
X-CRM114-Status: GOOD (  24.72  )
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

Hi,

On 26/11/2025 08:26, Vladimir Oltean wrote:
> +Maxime, Holger
> thread at https://lore.kernel.org/netdev/20251122193341.332324-2-vladimir.oltean@nxp.com/
> 
> On Tue, Nov 25, 2025 at 11:33:09PM +0100, Andrew Lunn wrote:
>>> Yeah, although as things currently stand, I'd say that is the lesser of
>>> problems. The only user (mv88e6xxx) does something strange: it says it
>>> wants to configure the TX amplitude of SerDes ports, but instead follows
>>> the phy-handle and applies the amplitude specified in that node.
>>>
>>> I tried to mentally follow how things would work in 2 cases:
>>> 1. PHY referenced by phy-handle is internal, then by definition it's not
>>>    a SerDes port.
>>> 2. PHY referenced by phy-handle is external, then the mv88e6xxx driver
>>>    looks at what is essentially a device tree description of the PHY's
>>>    TX, and applies that as a mirror image to the local SerDes' TX.
>>>
>>> I think the logic is used in mv88e6xxx through case #2, i.e. we
>>> externalize the mv88e6xxx SerDes electrical properties to an unrelated
>>> OF node, the connected Ethernet PHY.
>>
>> My understanding of the code is the same, #2. Although i would
>> probably not say it is an unrelated node. I expect the PHY is on the
>> other end of the SERDES link which is having the TX amplitudes
>> set. This clearly will not work if there is an SFP cage on the other
>> end, but it does for an SGMII PHY.
> 
> It is unrelated in the sense that the SGMII PHY is a different kernel
> object, and the mv88e6xxx is polluting its OF node with properties which
> it then interprets as its own, when the PHY driver may have wanted to
> configure its SGMII TX amplitude too, via those same generic properties.
> 
>> I guess this code is from before the time Russell converted the
>> mv88e6xxx SERDES code into PCS drivers. The register being set is
>> within the PCS register set.  The mv88e6xxx also does not make use of
>> generic phys to represent the SERDES part of the PCS. So there is no
>> phys phandle to follow since there is no phy.
> 
> In my view, the phy-common-props.yaml are supposed to be applicable to either:
> (1) a network PHY with SerDes host-side connection (I suppose the media
>     side electrical properties would be covered by Maxime's phy_port
>     work - Maxime, please confirm).

True, but we could definitely conceive applying phy-common-props.yaml on
the media-side as well :) I don't have a use-case for it right now
though, and we don't yet have detailed descriptions of the electrical
properties.

Maxime


