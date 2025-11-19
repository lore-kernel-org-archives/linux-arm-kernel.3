Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B198ACF2591
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HEGot4h9kychVL6laGKD8TzXIABfNJFUf/+dWi3bwb8=; b=Nj/rfSyfZhhSyw9/BjCwNRCGG1
	zNhjXWB3LB1lKbJfB2/zTBpWFV+KMsOmGkxpCtO+PHdwb/RxG9VtWALfhz6pkAzwsj6mI+kYO400q
	A0fqOlkYB/Cm33078saSlxUo/FsIu4Z1vqkQVgw6uSguQoICcjpYq7zYmqSXpaSC0evZGIAWz+Uom
	JJ4RpnV8wBzzb2O0fzA+INLZr5NBHZLX2zDwVy4abMOvtQq1T4SHPZ/DHTiqUWVtTGs22xa58lwLX
	9OPSMCKNaaVkkqUGo7HOmR7/6vRHrp2bXbJ0Uvdy8PccS8JqMODteEirVZr6RKyIJMp7ehZ3IMIVd
	Vor1gH1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiGl-00000003HmK-41KZ;
	Wed, 19 Nov 2025 13:30:47 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiGi-00000003Hlp-3GkO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:30:46 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F58F4E4179C;
	Wed, 19 Nov 2025 13:30:43 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 13CD160699;
	Wed, 19 Nov 2025 13:30:43 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BC661103719E1;
	Wed, 19 Nov 2025 14:30:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763559041; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=HEGot4h9kychVL6laGKD8TzXIABfNJFUf/+dWi3bwb8=;
	b=DxkpUbxvYUvghPJX54p4X0tkKAiJXsbu/Ic29R2ZsICFN2uEEaHrbyPJ2F2ndjLmvTkGAK
	VjuoqFWJ+UGTD9T3iGk4aBqS7BfxuDj1M9coYMXnLMR0mV6VrBYFJwoPn2UF0z3C8jhf3G
	iS5e/fmC3INoC1yWvLlnZ91yPAdD5vtZIy/e2jM1sA9vnwwDCsTP4qRcK4ZlHa8Wsn2KJJ
	CSstZ4lPJLRpW2mzW6jQOse8IxIXggs1kTedY2uFzn+5SqLHABMZwlNzMnZSQ90K75YHwr
	lgOGJNJxz5IWyb5rkQI4ozsITzQU0G+78XsgZFcrL9KNelYWNZ5UtGEL346jOA==
Message-ID: <56d3f69a-0a03-43a1-aa41-6b32c6360c7f@bootlin.com>
Date: Wed, 19 Nov 2025 14:30:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 03/15] net: phy: Introduce PHY ports
 representation
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251113081418.180557-1-maxime.chevallier@bootlin.com>
 <20251113081418.180557-4-maxime.chevallier@bootlin.com>
 <20251118191523.4719ca2c@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251118191523.4719ca2c@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_053044_953516_F4121B39 
X-CRM114-Status: GOOD (  13.20  )
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



On 19/11/2025 04:15, Jakub Kicinski wrote:
> On Thu, 13 Nov 2025 09:14:05 +0100 Maxime Chevallier wrote:
>> --- a/include/linux/ethtool.h
>> +++ b/include/linux/ethtool.h
>> @@ -228,6 +228,10 @@ extern const struct link_mode_info link_mode_params[];
>>  
>>  extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
>>  
>> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> 
> Hm, I think this is defined in uAPI as well?

hmpf indeed... thanks for spotting this

> 
>>  static inline const char *phy_mediums(enum ethtool_link_medium medium)
>>  {
>>  	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
>> @@ -236,6 +240,22 @@ static inline const char *phy_mediums(enum ethtool_link_medium medium)
>>  	return ethtool_link_medium_names[medium];
>>  }
>>  
>> +static inline enum ethtool_link_medium ethtool_str_to_medium(const char *str)
>> +{
>> +	int i;
>> +
>> +	for (i = 0; i < __ETHTOOL_LINK_MEDIUM_LAST; i++)
>> +		if (!strcmp(phy_mediums(i), str))
>> +			return i;
>> +
>> +	return ETHTOOL_LINK_MEDIUM_NONE;
>> +}
> 
> Same comment about possibly moving this elsewhere as on phy_mediums()

No problem :)

Thanks !

Maxime

> 
>> +static inline int ethtool_linkmode_n_pairs(unsigned int mode)
>> +{
>> +	return link_mode_params[mode].pairs;
>> +}


