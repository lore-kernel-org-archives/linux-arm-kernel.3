Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7DB95D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 08:45:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P0+e6XTu3A6o5AA0Sdf7CPZ+DssyTSsdo2j6rOigGDU=; b=jZ1wgiShF3YHuI67mMClclwzVw
	PED1U5kRwS+FQKe0+SJEmlBmCUXud4ZNpz1681G0XCcqqxzqxOvYijqrs876nYIL8OwAot8/vWjya
	NaPfs28iKVa9LdC5kanyJiDEOPaACMCre3cDJxlc9TeBFygN3j6PnH3aLlI2C+SE3FCGXJTqZrowO
	qmTd6aLcbxaEf06IQ3R0m7e0hkKfOYuiRdNFAX9rrrzuvZOJyZPkqB7lCmKBkMdxyCCuc6eN+usvg
	wgvB82BdH3DplPNfs+99aWdpqX/KJI06cIp9lJjHQ6xwvA6AxI+qzbK93d9kTCtwbW9a8UBK/sw5s
	HsX6p9Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOu6O-00000000Bmx-3aiX;
	Fri, 28 Nov 2025 08:45:16 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOu6L-00000000BmW-1jrr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Nov 2025 08:45:15 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 6100A4E41945;
	Fri, 28 Nov 2025 08:45:09 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 2F9C460706;
	Fri, 28 Nov 2025 08:45:09 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E6FCF103C8F20;
	Fri, 28 Nov 2025 09:45:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764319507; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=P0+e6XTu3A6o5AA0Sdf7CPZ+DssyTSsdo2j6rOigGDU=;
	b=BBTHcI0acimD4Z+tf+m+ZYYQA+zUHulwmzzRJl76h86HdO/UEPydJHf53ev70bfY4aiIby
	QuEkZFbcYpZU7rQRtod433l/ajomrZ1uWGCGGr0l2SO47MVJUcvI1kR5L970OEDTluHjI3
	pEnCGUJI2MMc3t/PnM4WWvL+BFtbp0iGLF7aSAtnWpCqyQDi+E5Kaj+ze9PK4QNAHccyAH
	ac8AAZKSGrBDmlX2aKRaPiA/E1xPCoBhK5pDjL4OpzQZL+XYsWWIg/QioPv7f2ih3dBrZK
	hzJIAu0eoVuAonbYRSOcYMQOgmDLjKqaEfceDzdP04sLoN84YN+sIGr8YyG2oA==
Message-ID: <e18d4197-b06e-493a-a843-e195fbc46d6c@bootlin.com>
Date: Fri, 28 Nov 2025 09:45:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v20 03/14] net: phy: Introduce PHY ports
 representation
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
 Jakub Kicinski <kuba@kernel.org>, Eric Dumazet <edumazet@google.com>,
 Paolo Abeni <pabeni@redhat.com>, linux-arm-kernel@lists.infradead.org,
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
 Tariq Toukan <tariqt@nvidia.com>
References: <20251127171800.171330-1-maxime.chevallier@bootlin.com>
 <20251127171800.171330-4-maxime.chevallier@bootlin.com>
 <aSiSxbE-XY_zxMBC@shell.armlinux.org.uk>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <aSiSxbE-XY_zxMBC@shell.armlinux.org.uk>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_004513_594622_FD81A080 
X-CRM114-Status: GOOD (  13.68  )
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

Hi Russell,

On 27/11/2025 19:04, Russell King (Oracle) wrote:
> On Thu, Nov 27, 2025 at 06:17:46PM +0100, Maxime Chevallier wrote:
>> Ethernet provides a wide variety of layer 1 protocols and standards for
>> data transmission. The front-facing ports of an interface have their own
>> complexity and configurability.
>>
>> Introduce a representation of these front-facing ports. The current code
>> is minimalistic and only support ports controlled by PHY devices, but
>> the plan is to extend that to SFP as well as raw Ethernet MACs that
>> don't use PHY devices.
>>
>> This minimal port representation allows describing the media and number
>> of pairs of a BaseT port. From that information, we can derive the
>> linkmodes usable on the port, which can be used to limit the
>> capabilities of an interface.
>>
>> For now, the port pairs and medium is derived from devicetree, defined
>> by the PHY driver, or populated with default values (as we assume that
>> all PHYs expose at least one port).
>>
>> The typical example is 100M ethernet. 100BaseT can work using only 2
>> pairs on a Cat 5 cables.
> 
> Correction: 100BASE-TX. 100BASE-T, which covers the family of 100BASE-T
> media, includes 100BASE-T4 which is over all four pairs of the cable.
> 
 As Rob's bot made what appears at a first glance to be incorrect
comments, I'm not sure a resend is on the table yet. Do you want me to
send a v21 with the updated description ? I have the same question about
your comment on patch 2 :)

I'll gladly resend, but that'll be after the 24h cooldown.

Thanks a lot for taking a look a this,

Maxime

