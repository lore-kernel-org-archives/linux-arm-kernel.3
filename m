Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CF82CF34AB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 19 Nov 2025 13:29:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QCeVgdlyRn3to5o8svSAQCYCIaAyOrCinIsywtbsnqc=; b=eEw10fvtKdpW8DehaQX7t19Pbe
	NXjjeMsvPklG1rKqib0KKVxF/Zl+A/AarFhfBcGiPaXfF+eD9Ujx/S4wgujrbCQdhbXpkjHJK8afZ
	Mlgh7WslG0OpuUk0SaLYP0OhXRrZmblokiP34V3DIJ/+/a+QcpfRdARKaeVVrlRe0zmYccF6SrqmG
	Td0VOnQKPya0JVBuSWO9rLkE0MYmilDfI09VIDk+yeTb0jP2JwBBE1G+rnrNfzLJyfw46wI+vsdjp
	FbYhbVMDu4JhcIIufuzZzJA0ehXLf4gZ+tuHMn81PNnAgFYV76+6JbxNy935VJXv7Chicb8SUo+MQ
	PEqRP9vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiFV-00000003Ha4-03s3;
	Wed, 19 Nov 2025 13:29:29 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLiFQ-00000003HZC-0TfN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 19 Nov 2025 13:29:28 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id C0CFC4E4179C;
	Wed, 19 Nov 2025 13:29:21 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9307F60699;
	Wed, 19 Nov 2025 13:29:21 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 239FB10371A57;
	Wed, 19 Nov 2025 14:29:09 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763558960; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=QCeVgdlyRn3to5o8svSAQCYCIaAyOrCinIsywtbsnqc=;
	b=Pe1FcnasPMVjycj+4K0o7Bt+G5cxX2nnbT/fjuTU12uOoD4C3dTkyrWYHDi4XbjOerISVJ
	GiBRvYSi1g+DJiRpzTmUx46bAYXMDyGPbCQO2SLSqf0G1FD5Ot/to08c5dMt4qwhoVjffU
	37zIfMQw1phSkaC1c/UNsBu4sEVa6I96q563Ij2ZArqeBPQaaRxRQn/qFGDgK9b1CakKZw
	+QkZhMbpKEb0PxoTkvEClXSlBk4+/4wVOW+TfgWXpgzfxptQVhNs/R9RCcqX2Xcr/leEzs
	eAupQQBmU4B84dRKUW9STIjPPYVKbLbTmcmWdRne8rlSpmzA3wUjDBd4WnJktw==
Message-ID: <57aa6516-ae7d-4d8d-9ae4-70bd6557547f@bootlin.com>
Date: Wed, 19 Nov 2025 14:29:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v16 02/15] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
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
 <20251113081418.180557-3-maxime.chevallier@bootlin.com>
 <20251118191517.1a369dad@kernel.org>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251118191517.1a369dad@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251119_052924_316851_EB6DC7DA 
X-CRM114-Status: GOOD (  16.38  )
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

Hi Jakub,

On 19/11/2025 04:15, Jakub Kicinski wrote:
> On Thu, 13 Nov 2025 09:14:04 +0100 Maxime Chevallier wrote:
>> diff --git a/include/linux/ethtool.h b/include/linux/ethtool.h
>> index c2d8b4ec62eb..ad2b5ed9522b 100644
>> --- a/include/linux/ethtool.h
>> +++ b/include/linux/ethtool.h
>> @@ -216,13 +216,26 @@ static inline u8 *ethtool_rxfh_context_key(struct ethtool_rxfh_context *ctx)
>>  void ethtool_rxfh_context_lost(struct net_device *dev, u32 context_id);
>>  
>>  struct link_mode_info {
>> -	int                             speed;
>> -	u8                              lanes;
>> -	u8                              duplex;
>> +	int	speed;
>> +	u8	lanes;
>> +	u8	min_pairs;
>> +	u8	pairs;
>> +	u8	duplex;
>> +	u16	mediums;
>>  };
>>  
>>  extern const struct link_mode_info link_mode_params[];
>>  
>> +extern const char ethtool_link_medium_names[][ETH_GSTRING_LEN];
>> +
>> +static inline const char *phy_mediums(enum ethtool_link_medium medium)
>> +{
>> +	if (medium >= __ETHTOOL_LINK_MEDIUM_LAST)
>> +		return "unknown";
>> +
>> +	return ethtool_link_medium_names[medium];
>> +}
> 
> Will this function be called by a lot of drivers? Would be great to
> find a more suitable place for it, ethtool.h is included by thousands
> of objects :(

I expect this to be mostly used by the current DT parsing code, as well
as a few print statements in the core. So indeed let's move this
somewhere more specific.

> 
>>  /* declare a link mode bitmap */
>>  #define __ETHTOOL_DECLARE_LINK_MODE_MASK(name)		\
>>  	DECLARE_BITMAP(name, __ETHTOOL_LINK_MODE_MASK_NBITS)
>> diff --git a/include/uapi/linux/ethtool.h b/include/uapi/linux/ethtool.h
>> index 8bd5ea5469d9..6ed235053aed 100644
>> --- a/include/uapi/linux/ethtool.h
>> +++ b/include/uapi/linux/ethtool.h
>> @@ -2587,4 +2587,24 @@ enum phy_upstream {
>>  	PHY_UPSTREAM_PHY,
>>  };
>>  
>> +enum ethtool_link_medium {
>> +	ETHTOOL_LINK_MEDIUM_BASET = 0,
>> +	ETHTOOL_LINK_MEDIUM_BASEK,
>> +	ETHTOOL_LINK_MEDIUM_BASES,
>> +	ETHTOOL_LINK_MEDIUM_BASEC,
>> +	ETHTOOL_LINK_MEDIUM_BASEL,
>> +	ETHTOOL_LINK_MEDIUM_BASED,
>> +	ETHTOOL_LINK_MEDIUM_BASEE,
>> +	ETHTOOL_LINK_MEDIUM_BASEF,
>> +	ETHTOOL_LINK_MEDIUM_BASEV,
>> +	ETHTOOL_LINK_MEDIUM_BASEMLD,
>> +	ETHTOOL_LINK_MEDIUM_NONE,
>> +
>> +	__ETHTOOL_LINK_MEDIUM_LAST,
>> +};
> 
> Why is this in uAPI? I'd have expected it to either exist in the YAML
> spec if there's a new uAPI that needs it, or in kernel headers.
> Let's move it out for now to be safe, we can always move it in.

I originally planned to report that in linkmodes et.al. but changed my
mind, let me move that out as well.

> 
>> +#define ETHTOOL_MEDIUM_FIBER_BITS (BIT(ETHTOOL_LINK_MEDIUM_BASES) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEL) | \
>> +				   BIT(ETHTOOL_LINK_MEDIUM_BASEF))
> 
> Ditto.

Thanks for taking a look,

Maxime

