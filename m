Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66941E77188
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 10:31:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GA/Tg/7baXnKm3SwQ55FP1056nxIRWPWVHxeGnzfrOw=; b=mb8g97JvyRnmDjmGNgKPSNQIHZ
	2UrZVx4VSktN4BDhY9EtqpLv4XIPMbBR6M+dExAXfmVfVfdyBet9hUQ2Yavs3HfQ7f/hJ9XFrN0Mu
	XHwZd68CeR9zECR20/aq3CMcHnVZer01o05+OscTm38YkHYhMHiL/0mVzx9aVa/MuzKSxzoMozf+F
	maOGB+c7BgC5KGQ+xcZrzi82SG6u98XYCU9Mqkgoi0FM6s6N07JvW3aDeCcnmUnL3nsxxrPC5T/QC
	hU347dDyUL+cdzVhUKKM9uH/PJYhY0neRNhrwYQ3VTB7ABQqkSZL4uSBYU3hjaqcwMWmEQZJmoNwr
	BaMj5ouQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeCd-000000086Vi-17sT;
	Tue, 14 Jan 2025 10:31:19 +0000
Received: from out-182.mta0.migadu.com ([91.218.175.182])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXeBO-0000000869f-0JsB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jan 2025 10:30:03 +0000
Message-ID: <52dab677-6ec9-4ae2-803f-1a2a34c32007@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1736850599;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=GA/Tg/7baXnKm3SwQ55FP1056nxIRWPWVHxeGnzfrOw=;
	b=jwbL0GKCIehF3M3xckD3cBWjbhPRCEMzEavXLyL4y5L/V94tF6HT1FTrRQweF3EOUCan/A
	I0YTwI/haTiPydzelWmoiRk98CTdR5v6/A0FuXJWBHVFOuU12WncAKnqTr1P9VhNwz8t3r
	8yED/ivhpv/jPtwP6yHQnDJynDt7+jw=
Date: Tue, 14 Jan 2025 18:29:47 +0800
MIME-Version: 1.0
Subject: Re: [PATCH net-next v7 3/3] net: stmmac: dwmac-nuvoton: Add dwmac
 glue for Nuvoton MA35 family
To: Paul Menzel <pmenzel@molgen.mpg.de>, Andrew Lunn <andrew@lunn.ch>
Cc: Joey Lu <a0987203069@gmail.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 mcoquelin.stm32@gmail.com, richardcochran@gmail.com,
 devicetree@vger.kernel.org, ychuang3@nuvoton.com, netdev@vger.kernel.org,
 openbmc@lists.ozlabs.org, alexandre.torgue@foss.st.com,
 linux-kernel@vger.kernel.org, joabreu@synopsys.com, schung@nuvoton.com,
 peppe.cavallaro@st.com, yclu4@nuvoton.com,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
References: <20250113055434.3377508-1-a0987203069@gmail.com>
 <20250113055434.3377508-4-a0987203069@gmail.com>
 <a30b338f-0a6f-47e7-922b-c637a6648a6d@molgen.mpg.de>
 <e7041d36-9bc7-482a-877d-6d8f549c0ada@lunn.ch>
 <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Yanteng Si <si.yanteng@linux.dev>
In-Reply-To: <d9fc5212-9710-449e-90b9-a195305d990f@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_023002_260946_E28356B9 
X-CRM114-Status: GOOD (  13.08  )
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

在 2025/1/14 10:21, Paul Menzel 写道:
> Dear Andrew,
> 
> 
> Thank you for your quick reply.
> 
> 
> Am 14.01.25 um 21:16 schrieb Andrew Lunn:
>>>> +#define NVT_MISCR_RMII          BIT(0)
>>>> +
>>>> +/* 2000ps is mapped to 0x0 ~ 0xF */
>>>
>>> Excuse my ignorance: What is ps?
>>
>> picoseconds. An RGMII link needs a 2ns delay between the clock line
>> and the data lines. Some MACs allow you to tune the delay they can
>> insert, in this case in steps of 2ns / 16.
> 
> Thank you for the clarification. Maybe it’s my English, but I didn’t 
> deduce this from how the comment is worded. I do not have a better idea 
> either.

Hmmm, how about:

2000 ps is xxxx

I checked the kernel code and it looks like
folks usually put a space between the number
and the unit.

I looked into the rules of a bunch of publishers
again. It seems like there's a rule about putting
a space between a number and a unit, but when the
unit is a symbol, that's an exception:

space:

10 kg
10 ℃
10 h

no space:

22°36′48″N, 114°10′10″E


Thanks,
Yanteng

