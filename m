Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 45F65C624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 17:38:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l4IUfO6h9mR1fFTAYnECd9t+Cc7IsYQ4Tf/BvHAKE3Y=; b=VNxm7DF3ZcWlf/yfF82MUQYZGZ
	HqtTTtDJiuZ+mtKSF2OzIR1sUt0NG++pDPVjdC/ELS9u589cJ2WU/XGvr+Uvx9L/jnrN2TcRfjBdb
	+Vz2kSjm5r1eIMFaxDwRhLRjl1v1PZr8fcKOpMY8pV9Z8KDVbES5pILuVBGZO7geU3ibrpYWcz4mP
	XZahNXOLni/L94RKgBqq1LtpM9f+BVq/oyh5+MBTETcXQxusJJlIwRnjW5Et80fquSLZyoDRLCJse
	kqqwdrXhaiszwUz1vTXbxx+A/m+auGzwOr1XmeyEMfeuxE0XApdsm/MeGtybsetVoawCEJDGmgyNV
	LdA9fSBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15xq-0000000ADAG-2fSG;
	Mon, 31 Aug 2026 17:38:34 +0000
Received: from mx.nabladev.com ([178.251.229.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x15xo-0000000AD9q-25Li
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 17:38:33 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 114D811C163;
	Mon, 31 Aug 2026 19:38:23 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1788197905;
	h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=l4IUfO6h9mR1fFTAYnECd9t+Cc7IsYQ4Tf/BvHAKE3Y=;
	b=HGAt2tmAYNlO5XCLvWy/gUf6NSID0r1oiv9CuZUf7LmP6xClMqEGilbl6ewiU0SvYeLNHG
	Yx3fOcjkWNSX7E7Yy4tmKGCzItfnQNUJ1pvS7eQK0uNLY5kqjdbSE1Ume3/8wq9g74ZAac
	3uQWUEhaioaZ7TtBP12uBiIPuk3afMfIwYO9uQ9NrIGND2hIMJhRpPDLmzgVBL3gAwD0vp
	vcmy9cK/PIiAZoONdk5lb3HlsDiVI3AZZ4gEAr40B43mikCaeZg8WQBBw9XeKbjarRZHE1
	uRXCXChMleqyV5WZHOaW8iI3j/nVbHk5zCFYc/RggjtlwccswAziI7hxyDVcow==
Message-ID: <2b11d8a8-9f4e-4032-bb41-279e16c69424@nabladev.com>
Date: Mon, 31 Aug 2026 19:38:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: arm: stm32: Document
 st,stm32mp23/25-syscfg subnodes and cells
To: Conor Dooley <conor@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Christophe Roullier <christophe.roullier@foss.st.com>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Raphael Gallais-Pou <raphael.gallais-pou@foss.st.com>,
 Rob Herring <robh@kernel.org>, Yannick Fertre <yannick.fertre@foss.st.com>,
 devicetree@vger.kernel.org, kernel@dh-electronics.com,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260828151216.175020-1-marex@nabladev.com>
 <20260828-target-operable-ebc87e0bf30a@spud>
 <0f959651-34d9-4fb2-9e07-238f731c5342@nabladev.com>
 <20260831-clustered-margarine-80bf19005aad@spud>
 <2b09012a-3cae-4589-b42d-f61d33f2f876@nabladev.com>
 <20260831-craftily-operative-ac855bdbe897@spud>
Content-Language: en-US
From: Marek Vasut <marex@nabladev.com>
In-Reply-To: <20260831-craftily-operative-ac855bdbe897@spud>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_103832_701462_65FC161B 
X-CRM114-Status: GOOD (  13.84  )
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

On 8/31/26 7:13 PM, Conor Dooley wrote:

Hello Conor,

>>>>>>         then:
>>>>>>           required:
>>>>>>             - "#clock-cells"
>>>>>> +        - "#address-cells"
>>>>>> +        - "#size-cells"
>>>>>
>>>>> else, false? But I'm also not sure what the benefit is of requiring
>>>>> addr/size cells when the child node is not?
>>>> The subnodes of this syscfg node have reg property , see [PATCH v4 0/4]
>>>> arm64: dts: st: Add STM32MP2 USB support .
>>>
>>> Right, but I was questioning why the properties describing the reg
>>> property in children is required when the children (and thus the reg
>>> property in them) were not made required.
>>
>> Do you mean this patternProperties should be made required in here ?
>>
>> "
>> +patternProperties:
>> +  "^phy@[0-9a-f]+$":
>> "
>>
>> Could you please give me a hint how to do that ? git grep gives me nothing.
> 
> I mean, if the phys aren't going to be required I would not make the
> cells properties required. I seem to recall a warning that dtbs_check
> can emit when there are size/addr cells properties in a node where there
> are no children, which is why I questioned this in the first place.
> 
> Otherwise, if the phys are to be made required (no idea if they should
> be), I can only recall this being done with the non-pattern variant. IOW
> required:
>    - phy@0
>    - phy@1
The PHYs are part of the hardware and are (going to be) described in the 
SoC DT, so I would argue they should be described as required ?

Thank you for your help with this !

