Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1DFD5CD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 08:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M3+aKTOIenGftNdk1yVOu9tIQlDGr8NCbK8NJ7Ofmko=; b=pV6lMJIpzs7xeOz7YBzK65iTCG
	xL2hKxUYyIZdXCY1MO7xlI83T8hlrIdrXSCYBtcEqyff9303qLdy/ojt92ngwK5Ycr4Eub0uDfzPb
	ReLSgywIqC3ekgmmeroePBCdEWRLnIsQXBpI8Vm9k9DQOI2RHqZNDL3OUNTdr1yUNCyWbJZSqpUVi
	Udly4Z4DJwh4Q+d5bYEq+HWzOTPlntkr0MXbFcEW2mc1kWiVBIOfuajnOrtB5pbZNzyqkpYfA625A
	DE/EuU+WJXVRUuwiijOptK7NI1yo/BZEugmtjv1bAsJMudjOnEeiOphiqRIUUu2h8QopDxODieaxE
	uNSDNTEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSPv-0000000A3Tr-0PYW;
	Thu, 13 Nov 2025 08:10:55 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJSPs-0000000A3Sv-0OBr
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 08:10:54 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id BD24FC0F56D;
	Thu, 13 Nov 2025 08:10:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 662B86068C;
	Thu, 13 Nov 2025 08:10:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 49ABA102F1BFF;
	Thu, 13 Nov 2025 09:10:37 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1763021447; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=M3+aKTOIenGftNdk1yVOu9tIQlDGr8NCbK8NJ7Ofmko=;
	b=CUWyeqgsbpmiskIh05Y3xODwBRnwBI2KZgH/KPNlL96QAoCGCVcwTsZwUqVi/wtaFeyEVn
	tkEZ3JlJpZOc5Ia9T4BQXDE6JSt4mx9YW5PP8nCFLlvYQzOwEgrx2Ni304blYKBuJUTL5b
	kXPR07CiaeUNrab2aazgJdRkSD4BEHcQYdETyI1KmQM/ZY0BpL+UcK6IWDzDjG/stqPo8N
	emV5Oy7+nvmZAS6QDaMwRtU/nLUWWoKctyJcIQtFpfEc9gLVmdp8XPd/OBBZsm6PUg6Tlt
	JWkr9DkjPzdbvsxxyKz0nCTGBtYnlVu96ZGFm7EpVAcI1sPUsPck/Fp1bw0HGg==
Message-ID: <21e8408a-027a-4e74-899e-8ec59ddb17ef@bootlin.com>
Date: Thu, 13 Nov 2025 09:10:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v15 01/15] dt-bindings: net: Introduce the
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
 Dimitri Fedrau <dimitri.fedrau@liebherr.com>
References: <20251106094742.2104099-1-maxime.chevallier@bootlin.com>
 <20251106094742.2104099-2-maxime.chevallier@bootlin.com>
 <56410c74-3d0e-4cdc-87a0-230cad8f691a@lunn.ch>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <56410c74-3d0e-4cdc-87a0-230cad8f691a@lunn.ch>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_001052_312509_E050AAAB 
X-CRM114-Status: GOOD (  14.12  )
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

Hi Andrew,

On 11/11/2025 04:34, Andrew Lunn wrote:
> On Thu, Nov 06, 2025 at 10:47:26AM +0100, Maxime Chevallier wrote:
>> The ability to describe the physical ports of Ethernet devices is useful
>> to describe multi-port devices, as well as to remove any ambiguity with
>> regard to the nature of the port.
>>
>> Moreover, describing ports allows for a better description of features
>> that are tied to connectors, such as PoE through the PSE-PD devices.
>>
>> Introduce a binding to allow describing the ports, for now with 2
>> attributes :
>>
>>  - The number of lanes, which is a quite generic property that allows
>>    differentating between multiple similar technologies such as BaseT1
>>    and "regular" BaseT (which usually means BaseT4).
> 
> You still use lanes here, but the implementation has moved on to
> pairs.
> 
> Please add my Reviewed-by when you fix this.

I'm about to send v16, but I have also taken Rob's comments into account
so I'm going to err on the safe side and not include your review tag, in
case I mess this up :(

again, thanks a lot for the round of reviews on v15 !

Maxime

> 
> 	Andrew


