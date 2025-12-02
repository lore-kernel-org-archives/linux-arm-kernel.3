Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8688D116F6
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 15:49:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rMIFzfxad91ubA6fyH1uZaF1Zu4vkX1bopp9UAEB1ok=; b=LPhjfDjWMfDgO83MhuM3cx1apV
	3e7bxvgrz2EDn1LRmuGOVP2LwI5Ldl9BVksEd7RVnAsgrw9iUOZU7BOIdFTTRf8LeZVKXUsBiSiTG
	kman8BYUFbJA8b/GE8EPZ64Ge60kDENCz0U88QcYvvRQxBrwRJ5J8qqcwy96EgfGmuK5tTBCN3KNv
	C3quY6gigVLvi7V66+corp+pUXOD95Vqrq7tr9GtpZYOMBPrHCH/oUrlOo3CeI32f5Ex0mzmAlR7N
	9RBQBru22vmW/e/ZPq65EatxWFaUzNvKirgGBqMjX7qa1GPLws/sUH3E6jmD6kk8UdyvPqJ2q51bd
	eqMggVhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQScc-00000005Zul-2Fsd;
	Tue, 02 Dec 2025 15:48:58 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQScY-00000005Ztq-2Gkt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 15:48:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 8BF62C17B7E;
	Tue,  2 Dec 2025 15:48:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB9EE606D6;
	Tue,  2 Dec 2025 15:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9088811919C22;
	Tue,  2 Dec 2025 16:48:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1764690528; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=rMIFzfxad91ubA6fyH1uZaF1Zu4vkX1bopp9UAEB1ok=;
	b=0DIW3mVpRWiI2wPcbqGnJN+i3obaZkrmas/VrjGd8XMI25WcIAJG9yk2nxOGGumtlKjaml
	cQQZyCjT2C66qpCtLoyAQCeUCWxBb/KV2J6FpEMYCVV5vLmZ1tVg3oOxsJX61uVgiJeDXF
	O1HzokU48HCHr8r6SCbeCwT/5OB9xo6XmuFgvpZEj+VfvbHDOSuTjpZLc9FGN3LFtip1+2
	4o2gNvUWlmaS8TTC3Basjl6KnwfV9a3fYLCniuGvpyRO/Vwrpf0LGzeHdVeMV4NoffY8m7
	Kf5bBhs8qOCODQqGcWFMhQpF6+P5omRFiyPjLF3sGh3HhyUz27FIMEYQqYTSqA==
Message-ID: <49709595-5012-4fa3-9616-839dcdbf6b09@bootlin.com>
Date: Tue, 2 Dec 2025 16:48:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v21 02/14] net: ethtool: Introduce
 ETHTOOL_LINK_MEDIUM_* values
To: Paolo Abeni <pabeni@redhat.com>, davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, thomas.petazzoni@bootlin.com,
 Andrew Lunn <andrew@lunn.ch>, Jakub Kicinski <kuba@kernel.org>,
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>,
 linux-arm-kernel@lists.infradead.org,
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
References: <20251129082228.454678-1-maxime.chevallier@bootlin.com>
 <20251129082228.454678-3-maxime.chevallier@bootlin.com>
 <298e982d-7796-4e46-ad1d-a7f57c573f35@redhat.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <298e982d-7796-4e46-ad1d-a7f57c573f35@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_074854_744829_A968338A 
X-CRM114-Status: GOOD (  21.82  )
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

Hi Paolo

On 02/12/2025 14:03, Paolo Abeni wrote:
> On 11/29/25 9:22 AM, Maxime Chevallier wrote:
>> @@ -298,138 +321,149 @@ static_assert(ARRAY_SIZE(link_mode_names) == __ETHTOOL_LINK_MODE_MASK_NBITS);
>>  		.speed	= SPEED_UNKNOWN, \
>>  		.lanes	= 0, \
>>  		.duplex	= DUPLEX_UNKNOWN, \
>> +		.mediums = BIT(ETHTOOL_LINK_MEDIUM_NONE), \
>>  	}
>>  
>>  const struct link_mode_info link_mode_params[] = {
>> -	__DEFINE_LINK_MODE_PARAMS(10, T, Half),
>> -	__DEFINE_LINK_MODE_PARAMS(10, T, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(100, T, Half),
>> -	__DEFINE_LINK_MODE_PARAMS(100, T, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Half),
>> -	__DEFINE_LINK_MODE_PARAMS(1000, T, Full),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Half, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10, T, 2, 4, Full, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Half, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(100, T, 2, 4, Full, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Half, T),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(1000, T, 4, 4, Full, T),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Autoneg),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(TP),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(AUI),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(MII),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(FIBRE),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(BNC),
>> -	__DEFINE_LINK_MODE_PARAMS(10000, T, Full),
>> +	__DEFINE_LINK_MODE_PARAMS_PAIRS(10000, T, 4, 4, Full, T),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Pause),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Asym_Pause),
>> -	__DEFINE_LINK_MODE_PARAMS(2500, X, Full),
>> +	__DEFINE_LINK_MODE_PARAMS_MEDIUMS(2500, X, Full,
>> +					  __MED(C) | __MED(S) | __MED(L)),
>>  	__DEFINE_SPECIAL_MODE_PARAMS(Backplane),
>> -	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full),
>> -	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full),
>> +	__DEFINE_LINK_MODE_PARAMS(1000, KX, Full, K),
>> +	__DEFINE_LINK_MODE_PARAMS(10000, KX4, Full, K),
>> +	__DEFINE_LINK_MODE_PARAMS(10000, KR, Full, K),
>>  	[ETHTOOL_LINK_MODE_10000baseR_FEC_BIT] = {
>>  		.speed	= SPEED_10000,
>>  		.lanes	= 1,
>>  		.duplex = DUPLEX_FULL,
> 
> The AI review points that medium is not initialized here:
> 
> https://netdev-ai.bots.linux.dev/ai-review.html?id=437cd013-c6a6-49e1-bec1-de4869930c7a#patch-1
> 
> Is that intentional? It should deserve at least an explanation in the
> commit message.

Yes it is OK, however I don't really know how to answer AI on that. I'm
sorry it's still a bit blurry to me what's the right way to proceed with
these reviews.

Should I paste the AI report, then reply to it ?

I'd rather add more comments to the code than say in my commit log "AI
says xxx, it's wrong because blabla" though.

> 
> Somewhat related, AI raised on the first patch the same question raised
> on a previous iteration, and I assumed you considered that valid,
> according to:
> 
> https://lore.kernel.org/netdev/f753719e-2370-401d-a001-821bdd5ee838@bootlin.com/

So I don't know either how to proceed with this. dt_binding_check is
fine with the current state, and Rob acked the patch. I am not sure how
it's going to be received if I reach out to DT maintainers saying "the
netdev LLM said XXX, is this correct or hallucination ?", but it may
very well have a good point. I did try to dive into the yaml and then
json schema specs, but I wasn't able to go far enough to reach a proper
conclusion on wether we must remove "contains" for scalar :(

All of that would be a bit clearer if the AI review was on the ML, but I
also understand the risk for pollution with that, especially at an early
stage of adoption.

> 
> Otherwise I think some wording in the commit message explaining why the
> AI feedback is incorrect would be useful.
> 
> /P
> 

I'll update the commits and add comments anyways. I guess in a month
though, with net-next closed then the end of year.

Thanks,

Maxime

