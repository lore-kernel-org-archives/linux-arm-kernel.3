Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE52FCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 03:55:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g+qDq5wTJI6x9EY39D0tJB9MH6r0WcMVdVhtkKarOt0=; b=3kX16kMfud5ofSZwjRGqssniWz
	1ZXIvBVEll8xbE1/1yULNwUEOzat9Ab+asqGBTRRNdR2xK8nAvDAdQmke1n/p7ByA8j40LWASJ7lN
	bZnGiszP9P7Kyp0aWN7TJDqbX5yhhJrULf2s6lpRHK4jETe/Arv1SqfT55Zym1jkhRZT8iR0ifW30
	aqDOdZJL+qdho+rHH5QRLj6+KRKBLebgQqz4gw0YMUBAY9peyoV7I/y9Z0jZMgiBWwx5ptQVDLLk/
	55fRmRPw7xg77J0IVK7MYfv1G/8NJIell5G/75k4ID+11e9nyXPr3f6fevKdZ/jnHYUg3XXiEUGC0
	YxQ9OPPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Gay-0000000FTEq-0ADG;
	Wed, 24 Sep 2025 03:55:08 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Gas-0000000FTD8-2wdH
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Sep 2025 03:55:07 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E38FFC007A9;
	Wed, 24 Sep 2025 03:54:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D3384606B6;
	Wed, 24 Sep 2025 03:54:57 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id EF2FD102F1886;
	Wed, 24 Sep 2025 05:54:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1758686096; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=g+qDq5wTJI6x9EY39D0tJB9MH6r0WcMVdVhtkKarOt0=;
	b=GCN4JXvy5Jr2Cc5svIW5gg1tIvUpzdNR4vXL3iilzXOvA0IDaSnXsAipk852bsHFxPGIar
	8xzEeaC3wRS7xz17WwtS9be1O0lZdzovwkekvueR4jPF20QzmTvDy5Eq7nR2JGLrRuKNSg
	Ku8B522sIzaksIy3APEcrUHJ7wxRltQdFreb3Em9UPhhxCvlEUtSvVjcr+qiOZXaP+j8Yl
	IAewYMc7DqVeRLKEno1S6nCb+rdumy5n1bjCodVN71F+Mm5tjr8DpQQfvqkUvJdnPQmJIq
	y4ltufGnQ4H3zsCCGOJOSY/k69w417eWj3go6jOn9ibxoz7FxppNR2aVFDu9SA==
Message-ID: <ff7432c4-27ce-45a1-ac4d-c18d612ef04d@bootlin.com>
Date: Wed, 24 Sep 2025 09:23:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v13 13/18] net: phy: marvell10g: Support SFP
 through phy_port
To: Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 thomas.petazzoni@bootlin.com, Andrew Lunn <andrew@lunn.ch>,
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
References: <20250921160419.333427-1-maxime.chevallier@bootlin.com>
 <20250921160419.333427-14-maxime.chevallier@bootlin.com>
 <20250923182429.697b149b@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20250923182429.697b149b@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250923_205503_114957_DACABCDF 
X-CRM114-Status: GOOD (  12.20  )
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



On 24/09/2025 06:54, Jakub Kicinski wrote:
> On Sun, 21 Sep 2025 21:34:11 +0530 Maxime Chevallier wrote:
>> +/**
>> + * phy_port_restrict_mediums - Mask away some of the port's supported mediums
>> + * @port: The port to act upon
>> + * @mediums: A mask of mediums to support on the port
>> + *
>> + * This helper allows removing some mediums from a port's list of supported
>> + * mediums, which occurs once we have enough information about the port to
>> + * know its nature.
>> + *
>> + * Returns 0 if the change was donne correctly, a negative value otherwise.
> 
> kdoc likes colons after return so:
> 
>   Returns 0 -> Return: 0
> 
> sorry for only providing an automated nit pick..

It's OK, the series no longer applies with Russell's sfp_module_caps 
series being here, so a new version is due anyway.

Russell, I missed this series of yours as I wasn't available at all at 
that time, but as this phy_port series has been in the pipe for quite a 
while, and you commented on the used of sfp_parse_support et.al. that 
was being replaced, I'd have appreciated to be in CC :(

Given my schedule, next iteration is probably going to be for the next 
cycle anyway so no harm :)

Thanks,

Maxime

> 
>> + */
>> +int phy_port_restrict_mediums(struct phy_port *port, unsigned long mediums)


