Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12504C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 20:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3FN6UjMSqo2ohgR4GHz37K0iMMwOg2nEdtLQZximw+4=; b=D5Pb4hKxLWLTVOtOXa5TDenHXU
	feJePRmFWDpbPySlwzuKN9969R6xeGr4SV1/zqkbrU1V2YMcGhTl+VwEhBl7ol4GHfp89WuBEGTC3
	NBcMA+/qyXiFG+sSx0SXdB2kldiPCRLZsQBWCMPn42WOXhrl9KtNwqRjfdqdLC4t5vfKoH+bdXZVm
	jMqyUdejVq/SoenA1obDd1RfRb+yJsxkLltxt7brzJLLq8I36n1ypyEURzbgcm+SleVlA9m3zz1DQ
	O9OaqCb0gvxw5OBxYvMXIf9xtgzJ4RJi2O97qoufGtVq7ddEcFexlDF4B8gEZsg8csa7TG8J6UzBn
	gePPQXjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7Kb7-00000008VFq-3AAZ;
	Tue, 22 Apr 2025 20:52:05 +0000
Received: from lelvem-ot02.ext.ti.com ([198.47.23.235])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u7HJo-000000080vM-428U
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 17:22:02 +0000
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelvem-ot02.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHLv7s2043117
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Tue, 22 Apr 2025 12:21:57 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1745342517;
	bh=3FN6UjMSqo2ohgR4GHz37K0iMMwOg2nEdtLQZximw+4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=GYVzVM61vqBpGKeassa+KWQrnDPvxNzNJqxioDQNTf1IYLbUiImLo/bqL8kSc0yZ0
	 wRJLDA9ehWw1P/ozLjuZlYz6emtyazHV6R2PuXYvSoS5qIJ7qUw8HNvcnlrPqVwu6l
	 LjgVT4jXWn9UnF1zQDcUfxeoJZkfdCwpiFWs8P4o=
Received: from DLEE110.ent.ti.com (dlee110.ent.ti.com [157.170.170.21])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 53MHLvO1079038
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Apr 2025 12:21:57 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Tue, 22
 Apr 2025 12:21:56 -0500
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Tue, 22 Apr 2025 12:21:56 -0500
Received: from [10.249.141.75] ([10.249.141.75])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 53MHLrMa092939;
	Tue, 22 Apr 2025 12:21:53 -0500
Message-ID: <8c801213-2ca7-4336-a8a2-05d43a4a9251@ti.com>
Date: Tue, 22 Apr 2025 22:51:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] arm64: dts: ti: k3-am6*: Set eMMC clock parents to
 default
To: Judith Mendez <jm@ti.com>, Nishanth Menon <nm@ti.com>
CC: Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>,
        Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Moteen Shah
	<m-shah@ti.com>,
        <u-kumar1@ti.com>
References: <20250417233040.3658761-1-jm@ti.com>
 <20250417233040.3658761-2-jm@ti.com>
 <8f9aad2c-8e51-409e-be90-21230a53a4cf@ti.com>
 <7bc92282-6ce3-4ae4-8eef-897df992487f@ti.com>
 <20250422123748.ugkk2pzp54vzmyii@acorn>
 <12a748ff-2c33-44e7-b685-fa7d7d0138ca@ti.com>
 <9726c8c5-5702-4e03-94fc-eaa820f8cdf3@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <9726c8c5-5702-4e03-94fc-eaa820f8cdf3@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250422_102201_091341_7F730535 
X-CRM114-Status: GOOD (  18.36  )
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


On 4/22/2025 10:47 PM, Judith Mendez wrote:
> Hi Udit,
>
> On 4/22/25 9:08 AM, Kumar, Udit wrote:
>>
>> On 4/22/2025 6:07 PM, Nishanth Menon wrote:
>>> On 09:36-20250421, Judith Mendez wrote:
>>>> Hi Udit,
>>>>
>>>> On 4/19/25 10:00 AM, Kumar, Udit wrote:
>>>>> On 4/18/2025 5:00 AM, Judith Mendez wrote:
>>>>>> Set eMMC clock parents to the defaults which is 
>>>>>> MAIN_PLL0_HSDIV5_CLKOUT
>>>>>> for eMMC. This change is necessary since DM is not implementing the
>>>>>> correct procedure to switch PLL clock source for eMMC and we have a
>>>>>> non-glich-free mux. To remove any potential issues, lets switch 
>>>>>> back to
>>>>>> the defaults.
>>>>> IMO, we need to fix DM  if not then documentation [0] .
>>>> DM cannot be fixed for only one IP and documentation says what clock
>>>> parents are supported, it does not have to say what are the issues
>>>> that come with using a specific clock parent.
>>> As I understand the arasan IP requirement is that the IP must be 
>>> held in
>>> reset while the clock is switched, which is not reasonable to implement
>>> given decoupled systems like DM and Linux OS.
>>
>>
>> Thanks , then fix should be extended to sdhci1 as well
>
> sdhci1 and sdhci2 should already be using the defaults: 
> https://gist.github.com/jmenti/e280232ae3d5bb5097df7b0f04c85e8a
> This change is only needed for eMMC.
>
> ~ Judith

Ok, thanks for confirmation


Acked-by: Udit Kumar <u-kumar1@ti.com>


>
>>
>>
>>>
>>>>> Then only this patch is ok because as per document [0]
>>>>>
>>>>> removed clock by this patch is valid parent for eMMC.
>>>> The clock parent currently set is a valid parent, but we have non-
>>>> glitch-free muxes and to avoid any potential issues with these, we
>>>> should switch back to the defaults. It seems like we randomly switched
>>>> from the default for no good reason and it has been copy paste per
>>>> platforms since then, so we are switching back to the defaults now.
>>>>
>>>> ~ Judith
>>>>
>>>>> [0] 
>>>>> https://software-dl.ti.com/tisci/esd/latest/5_soc_doc/j722s/clocks.html 
>>>>>
>>>>>
>>>>> Thanks
>>>>>
>>>>> Udit
>>>>>
>>>>>> Fixes: c37c58fdeb8a ("arm64: dts: ti: k3-am62: Add more peripheral
>>>>>> nodes")
>>>>>> Fixes: d3ae4e8d8b6a ("arm64: dts: ti: k3-am62a-main: Add sdhci0
>>>>>> instance")
>>>>>> Fixes: b5080c7c1f7e ("arm64: dts: ti: k3-am62p: Add nodes for 
>>>>>> more IPs")
>>> Please follow ./Documentation/process/stable-kernel-rules.rst - this is
>>> easier to backport if these were to be split into 3 different patches.
>>> Please do not forget to add Cc: stable@vger.kernel.org as per the rules
>>> as well.
>>>
>>>>>> Signed-off-by: Judith Mendez <jm@ti.com>
>>>>>> ---
>>>>>> arch/arm64/boot/dts/ti/k3-am62-main.dtsi               | 2 --
>>>>>> arch/arm64/boot/dts/ti/k3-am62a-main.dtsi              | 2 --
>>>>>> arch/arm64/boot/dts/ti/k3-am62p-j722s-common-main.dtsi | 2 --
>>>>>>    3 files changed, 6 deletions(-)
>>>>>>
>>>>>> [..]
>

