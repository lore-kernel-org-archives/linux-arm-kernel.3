Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE1F4C021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 12:01:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6AqLQisyWEDMQ8wooXXEp+oSjAf7xuTYbpqqo/XRzD8=; b=a+NJIM1nPX5TcKf3hshyB2W1pm
	o3kjHT6TkUXN4m594bCHIdt4kEkipiarWn8xZ4PGeWEojpvMnMGIRXwjHVE856k18Sn26YckvPBED
	g3BnoAVeWxeHBfoNy0UaWYB5GJq3P5C27nSCFhpwv9Z9GkptgQlcUB+zBqEEjFJtQ68tu5D0k0yOo
	RWQ8YcYacShjMcC5ZtmjIu8vAs5dO6ZtvvqO8cp0B9SMRgiAwa5q3z2WYAQDfTL6ZVN3/W2PB0czQ
	THiAZMPN7PgH2fF/gK23Th3eTHNj9CUW3x7mYYzopDADPZJwDK/w/xgi7ZOU3Q7vRo9FM0MO9eAa7
	iozCpL+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tncZh-00000007Gre-1woz;
	Thu, 27 Feb 2025 12:01:09 +0000
Received: from mail-m49251.qiye.163.com ([45.254.49.251])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnc25-00000007AvP-3QjU;
	Thu, 27 Feb 2025 11:26:27 +0000
Received: from [172.16.12.67] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id c661e153;
	Thu, 27 Feb 2025 19:26:22 +0800 (GMT+08:00)
Message-ID: <d77bfb17-d875-4bd2-abb4-e9ff012d7bfc@rock-chips.com>
Date: Thu, 27 Feb 2025 19:26:21 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] thermal: rockchip: Support the rk3562 SoC in thermal
 driver
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
 =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>
Cc: linux-rockchip@lists.infradead.org,
 Shaohan Yao <shaohan.yao@rock-chips.com>, linux-pm@vger.kernel.org,
 Lukasz Luba <lukasz.luba@arm.com>, linux-kernel@vger.kernel.org,
 Zhang Rui <rui.zhang@intel.com>, "Rafael J. Wysocki" <rafael@kernel.org>,
 linux-arm-kernel@lists.infradead.org
References: <20241224094015.3816301-1-kever.yang@rock-chips.com>
 <20241224094015.3816301-2-kever.yang@rock-chips.com>
 <7f17cc55-a741-4bb8-9513-0580ca6fedd3@linaro.org> <17758610.geO5KgaWL5@diego>
 <e36a5771-d277-41d3-af9c-c5841c4060a2@linaro.org>
Content-Language: en-US
From: Kever Yang <kever.yang@rock-chips.com>
In-Reply-To: <e36a5771-d277-41d3-af9c-c5841c4060a2@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGUlDQlZOGEJJS0pKHk0eShhWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a9547285bae03afkunmc661e153
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NUk6CQw*CDIJTg0zATUcQlFW
	Nh4aCgJVSlVKTE9LTU5OTkNIT05OVTMWGhIXVRAeDR4JVQIaFRw7CRQYEFYYExILCFUYFBZFWVdZ
	EgtZQVlOQ1VJSVVMVUpKT1lXWQgBWUFISExMNwY+
DKIM-Signature: a=rsa-sha256;
	b=i5P3hTgFm+CnEdpL/8tNOszN+11tNwkNdYMuDt9fVuC8Q03OnD2woX8xplYkHaD0wN/kiOLdzgIqdtrYKqSTItqn0yZDr6UsDoeJEsJGMbFo4TEeXb1PWyBrA1oaHfIEP59NHeTDvRIc28/dGrSwmrds+jl2u6uyf9O7NJzGDKw=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=6AqLQisyWEDMQ8wooXXEp+oSjAf7xuTYbpqqo/XRzD8=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_032626_071936_0EB1AA5E 
X-CRM114-Status: GOOD (  17.68  )
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

Hi Daniel,

On 2025/2/19 03:43, Daniel Lezcano wrote:
> On 11/02/2025 11:19, Heiko Stübner wrote:
>> Hey Daniel,
>>
>> Am Dienstag, 11. Februar 2025, 10:36:09 MEZ schrieb Daniel Lezcano:
>>> On 24/12/2024 10:40, Kever Yang wrote:
>>>> From: Shaohan Yao <shaohan.yao@rock-chips.com>
>>>>
>>>> There are one Temperature Sensor on rk3562, channel 0 is for chip.
>>>
>>> A bit stingy in terms of description, no ?
>>>
>>>
>>>> Signed-off-by: Shaohan Yao <shaohan.yao@rock-chips.com>
>>>> Signed-off-by: Kever Yang <kever.yang@rock-chips.com>
>> [...]
>>>> +static const struct tsadc_table rk3562_code_table[] = {
>>>> +    {0, -40000},
>>>> +    {1419, -40000},
>>>> +    {1428, -35000},
>>>> +    {1436, -30000},
>>>> +    {1445, -25000},
>>>> +    {1453, -20000},
>>>> +    {1462, -15000},
>>>> +    {1470, -10000},
>>>> +    {1479, -5000},
>>>> +    {1487, 0},
>>>> +    {1496, 5000},
>>>> +    {1504, 10000},
>>>> +    {1512, 15000},
>>>> +    {1521, 20000},
>>>> +    {1529, 25000},
>>>> +    {1538, 30000},
>>>> +    {1546, 35000},
>>>> +    {1555, 40000},
>>>> +    {1563, 45000},
>>>> +    {1572, 50000},
>>>> +    {1580, 55000},
>>>> +    {1589, 60000},
>>>> +    {1598, 65000},
>>>> +    {1606, 70000},
>>>> +    {1615, 75000},
>>>> +    {1623, 80000},
>>>> +    {1632, 85000},
>>>> +    {1640, 90000},
>>>> +    {1648, 95000},
>>>> +    {1657, 100000},
>>>> +    {1666, 105000},
>>>> +    {1674, 110000},
>>>> +    {1682, 115000},
>>>> +    {1691, 120000},
>>>> +    {1699, 125000},
>>>> +    {TSADCV2_DATA_MASK, 125000},
>>>> +};
>>>
>>> May be it is time to optimize all these tables out of the memory 
>>> driver?
>>>
>>> It is the 9th table introduced.
>>
>> just to see if we think differently, what do you have in mind?
>>
>> For me the adc-to-temperature conversion _is_ part of the hw-block 
>> itself,
>> so should likely not spill into the devicetree, but you're right, 
>> defining
>> a big table for each soc also isn't really great.
>>
>> For the rk3562 in question, the stepping seems to be 8,9,8,9,....
>> where for the rk3568 the value stepping seems to be 32,36,32,36,...
>> and it looks similar for the other socs too, with the driver is already
>> interpolating between values it seems.
>>
>> So even just halving (or more) all the big tables (dropping every second
>> entry for example) should not really loose us real granularity.
>
> It can be just a formula to be reused in the adc_to_temp, temp_to_adc 
> or precompute the table from the formula:
>
> For instance the following formulas:
>
> rk3588_code_table:
>
>     y = ((x^2 + 23315x - 5949300) * 100) / 2457
>
> rk3568_code_table:
>
>     y = ((x^2 - 2660x + 1547712) * 625) / 2448
I can understand, it looks much better if we can use the formula instead 
of the table.

We got all these data from different vendor/foundry ,  some of vendor do 
provide the formula while others not.

And I think there is a key issue is that the formula may not fit for all 
the situation, sometimes need to calibrate

after chips are out, only the table is available in this case.

And in this case, we send the table as-is from the vendor.


Thanks,

- Kever

>
> etc ...
>
>

