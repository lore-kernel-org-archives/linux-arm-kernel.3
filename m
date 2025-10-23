Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E8BCCD1BC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Oct 2025 14:29:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RESlMDxT65A7qHuKGnbOMnFeEQhKdlIGLsQaG2/0rsM=; b=aIWxnzqJHxQnwgiCXR/clkuxXV
	/7QfoLb6Sma93OvkUIXEf4j42EzhViHsq5UwA17bp1sE6EIdmR6P20+5kpT8IxkeEfsbHHe2s8i3u
	5Gg9V5AChrpxGY42GIba5+9nGsUKTpSiWTdbCHvK8xtzjaNbbakm+Sau4G+U3iNLqcWQXmp9uF3PQ
	f3sQ5EOqb085RruxPcU96V3pkXJyRKtfm+YNW7LaquY/Oo78xvFnq0ZAgowy/mMGmiw2J84DYMB/3
	M1qEPETJnZz7cqKlRc0yNKvxKPrf5j8HSwBOpVyR9lcP6opia1dmwxGL20JHeNijL0QhWjkLWg8K9
	ycHx7P5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwJv-00000006bCq-07r7;
	Thu, 23 Oct 2025 14:29:39 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBwJr-00000006bB8-25Zc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Oct 2025 14:29:37 +0000
Received: from lelvem-sh01.itg.ti.com ([10.180.77.71])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTP id 59NETOKW553075;
	Thu, 23 Oct 2025 09:29:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1761229764;
	bh=RESlMDxT65A7qHuKGnbOMnFeEQhKdlIGLsQaG2/0rsM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=MkSVaCD6l4TiiniawAUWAIsVt8TF7JIhHhoNFZXfsRvLPShts9WhPjeEWhUqjBTsI
	 g7E+fwPhqfkPgQ5IDhk6LDin4rjqSr8yz9d6SZyd9s50gka3GfTvGx1Knf4qDdlQ0d
	 mLbOTFpwoomyPRdksdKQorXY2doRobXNXo+glhMk=
Received: from DLEE202.ent.ti.com (dlee202.ent.ti.com [157.170.170.77])
	by lelvem-sh01.itg.ti.com (8.18.1/8.18.1) with ESMTPS id 59NETOSB2771505
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Oct 2025 09:29:24 -0500
Received: from DLEE207.ent.ti.com (157.170.170.95) by DLEE202.ent.ti.com
 (157.170.170.77) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20; Thu, 23 Oct
 2025 09:29:24 -0500
Received: from lelvem-mr05.itg.ti.com (10.180.75.9) by DLEE207.ent.ti.com
 (157.170.170.95) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.20 via Frontend
 Transport; Thu, 23 Oct 2025 09:29:24 -0500
Received: from [172.24.233.103] (uda0132425.dhcp.ti.com [172.24.233.103])
	by lelvem-mr05.itg.ti.com (8.18.1/8.18.1) with ESMTP id 59NETLkf2989198;
	Thu, 23 Oct 2025 09:29:21 -0500
Message-ID: <da7e6f60-1c88-4882-a835-a4d8b46ddbe5@ti.com>
Date: Thu, 23 Oct 2025 19:57:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] arm64: dts: ti: k3-j722s-main: fix the audio
 refclk source
To: Michael Walle <mwalle@kernel.org>, "Kumar, Udit" <u-kumar1@ti.com>,
        Nishanth Menon <nm@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>
CC: <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
References: <20251017102228.530517-1-mwalle@kernel.org>
 <20251017102228.530517-2-mwalle@kernel.org>
 <554df7d2-1809-42a8-b512-bde3fd284163@ti.com>
 <DDPRM9UCVZNA.HFRGLJW17PIP@kernel.org>
From: Vignesh Raghavendra <vigneshr@ti.com>
Content-Language: en-US
In-Reply-To: <DDPRM9UCVZNA.HFRGLJW17PIP@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251023_072935_644409_E3B1E357 
X-CRM114-Status: GOOD (  17.48  )
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



On 23/10/25 19:48, Michael Walle wrote:
> On Thu Oct 23, 2025 at 3:50 PM CEST, Udit Kumar wrote:
>> Hi Michael,
>>
>> On 10/17/2025 3:52 PM, Michael Walle wrote:
>>> At the moment the clock parent of the audio extclk output is PLL1_HSDIV6
>>> of the main domain. This very clock output is also used among various IP
>>> cores, for example for the USB1 LPM clock. The audio extclock being an
>>> external clock output with a variable frequency, it is likely that a
>>> user of this clock will try to set it's frequency to a different value,
>>> i.e. an audio codec. Because that clock output is used also for other IP
>>> cores, bad things will happen.
>>>
>>> Instead of using PLL1_HSDIV6 use the PLL2_HSDIV8 as a sane default, as
>>> this output is exclusively used among other audio peripherals.
>>
>>
>> Thanks for this fix,
>>
>> Initial support for audio_refclkx was added in j722s and am62p soc 
>> specific files due
>>
>> to selection of different parent.
>>
>> Since these SOC share many common things, and this patch will make these 
>> nodes same as of am62p device
>>
>> https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/boot/dts/ti/k3-am62p-main.dtsi#L46 
>>
>>
>> So I suggest to move in common file 
>> https://elixir.bootlin.com/linux/v6.18-rc2/source/arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi#L42 
>>
>>
>> and remove from SOC specific files.
> 
> Ok, but to keep the information and to not conflate two different
> things, I'd do the following:
>  - keep this patch as is
>  - add a second one, to move the (now) identical nodes into the
>    common-main.dtsi
> 
> Sounds good?

Agree, this is better way to organize the change.

> 
> -michael

-- 
Regards
Vignesh
https://ti.com/opensource


