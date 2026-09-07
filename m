Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A63AC79F89
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Sep 2026 07:29:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aLz+YXhDXlEGNDvoI1Sa9xZvW1NLNKMWivo0ZPJIY08=; b=sFAwLKyaiyCMPLe1iaC5V1zS2O
	D8PXhZ3mkwHXgTK38jL1/MvWM3hrRbczcjW2V7ri7Z9bICjnB/PBJVUCp8bWhF8cjyhbdzfgmjQcb
	cAO+ir2RZh+SL2I+eCNn0P+eGCidzBwgLVv1vzlc/2QofbQ4NBKnU8l2BqoB4nJIwkArWCJaluCSR
	YUlIpE2fJEnWewEr0JtpWwcUHsukdA7JGOmsPmQ4m2dkZ0Bg9phO9BDf3V+Uc4Wv0dhSYZUzm5eOW
	fTN0KJUsfFhHkYzNbKrqXEyEIZZoy7rpF7sHX4eHDt/M7uEwzlIku6fkKUbiSbaXT8O9AFx1HvAmA
	lDEivUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Tn0-00000006A2D-1rYe;
	Mon, 07 Sep 2026 07:29:14 +0000
Received: from smtpout-03.galae.net ([185.246.85.4])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x3Tmx-00000006A1H-20c1
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Sep 2026 07:29:13 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 11C084E41555;
	Mon,  7 Sep 2026 07:29:06 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D2B4660383;
	Mon,  7 Sep 2026 07:29:05 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8286A11C7A131;
	Mon,  7 Sep 2026 09:28:52 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1788766140; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=aLz+YXhDXlEGNDvoI1Sa9xZvW1NLNKMWivo0ZPJIY08=;
	b=QZ9Cn0PWrljorCBOhiK1CJ1CZTrACqwecmjkSZL6aH++MTyIZx/YDEF5Vv9n6WLwIYfPQe
	7CBGnXgwfPsGyOCRBkxTvexerYSf7S41IzTaHKSeK5sdhB8p7J06iZXIelfhN6SvrJ6lV9
	sVEL7gy5QBOXFswDyJqBGrOsu8Ea9G6+nyIEaUtcgkOw8w2QEplRixDEYSuoCSHomNKP+h
	e8iIkLHNiwpi65LEYWLOvTowa3Fu7Taomx7mR0e9I/FtfT7w5FRoT+ZLHtg67qozO8l5cd
	H3LDIKWwkfOuhN9kQ/ULuqi6mX0pWa/nl+4NytM9Xsr95U0djysT9yOrU5spYQ==
Message-ID: <248c1a07-7a5c-44dc-a73e-f95a69bb4161@bootlin.com>
Date: Mon, 7 Sep 2026 09:28:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 3/3] net: stmmac: Add UltraRISC DP1000 GMAC
 support
To: Jia Wang <wangjia@ultrarisc.com>
Cc: Andrew Lunn <andrew@lunn.ch>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Giuseppe Cavallaro <peppe.cavallaro@st.com>,
 Jose Abreu <joabreu@synopsys.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20260901-dwmac-ultrarisc-v1-0-f19454814bcf@ultrarisc.com>
 <20260901-dwmac-ultrarisc-v1-3-f19454814bcf@ultrarisc.com>
 <910be156-b631-4b62-972a-79d9a9e38697@lunn.ch>
 <178842162417.2701756.3296149694160507506.b4-reply@b4>
 <1622b0a7-5516-4e72-b5e1-60c12b65b52e@lunn.ch>
 <8611dff3-56ea-4798-8303-b0a8af84580e@bootlin.com>
 <178850166577.1486454.10728134844652956076.b4-reply@b4>
 <178876008871.2542659.8460758662538260209.b4-reply@b4>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <178876008871.2542659.8460758662538260209.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260907_002911_659750_3D0A5084 
X-CRM114-Status: GOOD (  19.85  )
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

On 9/7/26 07:48, Jia Wang wrote:
> On 2026-09-04 14:01 +0800, Jia Wang wrote:
>> On 2026-09-03 14:30 +0200, Maxime Chevallier wrote:
>>>
>>>
>>> On 9/3/26 14:10, Andrew Lunn wrote:
>>>>>> This looks to be 90% identical to dwmac-sophgo.c.
>>>>>>
>>>>>> Do you expect any further changes to this driver? Is everything
>>>>>> supported? Are there more clocks? A GPIO for WoL?
>>>>>>
>>>>>> I'm just wondering if the common code should be pulled out, or even
>>>>>> dwmac-sophgo.c made generic so it can handle all plain boring devices
>>>>>> which have RGMII delays and not a lot else.
>>>>>>
>>>>>
>>>>> The probe boilerplate is indeed largely similar because both drivers
>>>>> use the common stmmac platform helpers. However, their platform-specific
>>>>> requirements differ: Sophgo requires additional TX clock handling and
>>>>> other configuration, while DP1000 requires fixed TX and RX delay
>>>>> handling. ACPI support under development is also intended to use the
>>>>> UltraRISC glue driver.
>>>>
>>>> ACPI is going to be fun, since nobody does ACPI networking.
>>>>
>>>> But how big is the change to the glue driver? I expect the change will
>>>> be minor, a call to devm_stmmac_probe_config_acpi(), in addition to
>>>> devm_stmmac_probe_config_dt(). Anything else?
>>>
>>> I agree that if ACPI support is added, let's try to make it part of the
>>> core.
>>>
>>
>> The ACPI support is still under development, but the current prototype
>> adds ACPI device matching and ACPI-specific platform-data setup. Some
>> common stmmac changes are also needed for ACPI-described platform
>> resources and MDIO.
>>
>>>>
>>>> One problem the stmmac driver has is cut/paste glue driver
>>>> development. The same code is repeated again and again. Russell King
>>>> spent a lot of time and effort trying to reduce the duplication. So we
>>>> should not be adding more duplicated code unless it is actually
>>>> required.
>>>
>>> It seems to me that all the RGMII handling could be made much more generic,
>>> as this is commong pattern in glue drivers :
>>>
>>> dwmac-sophgo has the "has_internal_rx_delay" field, and dwmac-eic7700 has
>>> both has_internal_[r|t]x_delay.
>>>
>>> With this third one, it makes sense to start sharing that logic across
>>> glues.
>>>
>>
>> I agree. DP1000 is another user of this pattern, with fixed internal
>> delays on both the TX and RX paths. I will look at moving this handling
>> into the common stmmac platform code, leaving each glue driver to
>> describe its internal delay capabilities.
>>
> 
> After looking further into the implementation, I see two possible
> approaches:
> 
> 1. Keep a minimal UltraRISC glue driver that only describes the fixed TX
> and RX delay capabilities, while the common stmmac code handles the PHY
> mode adjustment.
> 
> 2. Store these capabilities as compatible-specific match data in
> dwmac-generic and remove the UltraRISC glue driver entirely.
Let's go with 1 for now I'd say. UtraRISC will be the only one that's basically
an empty glue calling core code (maybe you have some plat->flags to passs ?).

If we manage to simplify even further (e.g. tx clock handling for exmaple), we could
also deal with dwmac-sophgo the same way. We could then consider something like
dwmac-simple.c , keeping dwmac-generic.c for the raw dwmac IPs.

Maxime

