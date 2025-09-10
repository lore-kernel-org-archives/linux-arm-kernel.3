Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F7CFCA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 07:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RUadrr+ftaINWMD1MOC1a95xdx//kcDoVabbzJiCDiY=; b=TBkaXoGtcq1QU824ApUPWRYf+E
	gSI5XRwwg9fuIboVhNPSgHaq8oItZVf0mwa204Kaw+Tun7RwLOAdp6rIuuIUFxJC9e83YCec4Thu5
	GDl/recSK0LpLYnvhjjRoog2n8zDIMgCCcqA/fMS/xbl2hy7p42qbi86SgaHNhlpH5AcI2fy9Dbzw
	W0v0KFs7HuKcInmYyq9Grz9UL4P0jf79lOE/HyK5zVOcwWxnKHhfaqy6lYA3M9mOWxD8uyocXxrnI
	YmlmJCWp+y8v9OZ78qnbs8nqvH9xIR06yD9OTQbUWxIpK4VjQKWUlAmnQGh5jLIQlfa7CiKCnKRCR
	HDg2JZxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF48-0000000CUzR-14pQ;
	Wed, 10 Sep 2025 07:16:28 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwF45-0000000CUy0-1pSF
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 07:16:27 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id DE65F43B78;
	Wed, 10 Sep 2025 07:16:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58CE1C4CEF0;
	Wed, 10 Sep 2025 07:16:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757488584;
	bh=C02BXT3DxL+0Key+0N+Pv9GbxMa4CE40Y9ZSsNE35co=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=rU9TPkTRTtH4dvEN53RXhYxHLLxkuYGZEecDauLPpt6qsz4JkpuScTuCsHU4jCW/H
	 tTGmtEBFD6y307F0iV2UXzDo3V6hED+C4w1xNiAe/CK4F7+kS6Aty6YH1ELTgWEUg+
	 lF53MABXoR5wy/sKNvYv8Ac9FZ06AbQC6REhJ/5JHk7rwc1xu9IiKq+e7EkGRbQdOn
	 lJnf0BFwi3SxEDnQOwn0IAdtj6mmmQqsHNU0ImRag/ONYgdicFxHdOaVRhOiGzlZvq
	 X247/21cqpmoPTPNvN/DwRXM6D3RlMzhcFsMYVRVwkvB9MN41mZ+61zjUuUinsqFda
	 l1aXq7QsFsIhQ==
Message-ID: <4453695a-9f31-455b-b118-4084f0367cb3@kernel.org>
Date: Wed, 10 Sep 2025 09:16:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 2/2] ARM: dts: samsung: Add cache information to the
 Exynos542x SoC
To: Anand Moon <linux.amoon@gmail.com>
Cc: Marek Szyprowski <m.szyprowski@samsung.com>, Rob Herring
 <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Alim Akhtar <alim.akhtar@samsung.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240730091322.5741-1-linux.amoon@gmail.com>
 <CGME20240730091412eucas1p18feced3968a5f87dc8fe05f78d5c7659@eucas1p1.samsung.com>
 <20240730091322.5741-2-linux.amoon@gmail.com>
 <09e9cf0b-27fd-46b8-8631-87d798afd19e@samsung.com>
 <CANAwSgT_TOFwP80+H8-CdXDLLu+u2XZMr2dnxcsSDe8S5yeYCw@mail.gmail.com>
 <a41a6143-ef2e-4d86-b102-eaf442985173@kernel.org>
 <CANAwSgSbSgXwOQLrVrHD7jpDe0=Bq7r2K8p0JjvZJMPpVNq4XQ@mail.gmail.com>
 <d72d7927-079a-4a82-a298-db9ed70a816f@kernel.org>
 <CANAwSgSgK5hmcLg7sChAs7QL0x7wufHpWDZJFyw6tMiiOuDZeg@mail.gmail.com>
 <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <CANAwSgRTM4OSnXKZWWzxi2cW8QwWLKJz2xmUThyLkdkq71rH1g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_001625_519624_21746D6A 
X-CRM114-Status: GOOD (  20.31  )
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

On 09/09/2025 15:59, Anand Moon wrote:
> Hi Krzysztof, Marek,
> 
> On Tue, 30 Jul 2024 at 20:32, Anand Moon <linux.amoon@gmail.com> wrote:
>>
>> Hi Krzysztof,
>>
>> On Tue, 30 Jul 2024 at 18:53, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>
>>> On 30/07/2024 15:20, Anand Moon wrote:
>>>> Hi Krzysztof,
>>>>
>>>> On Tue, 30 Jul 2024 at 17:57, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>>>>>
>>>>> On 30/07/2024 14:06, Anand Moon wrote:
>>>>>> Hi Marek,
>>>>>>
>>>>>> On Tue, 30 Jul 2024 at 17:14, Marek Szyprowski <m.szyprowski@samsung.com> wrote:
>>>>>>>
>>>>>>>
>>>>>>> On 30.07.2024 11:13, Anand Moon wrote:
>>>>>>>> As per the Exynos 5422 user manual add missing cache information to
>>>>>>>> the Exynos542x SoC.
>>>>>>>>
>>>>>>>> - Each Cortex-A7 core has 32 KB of instruction cache and
>>>>>>>>       32 KB of L1 data cache available.
>>>>>>>> - Each Cortex-A15 core has 32 KB of L1 instruction cache and
>>>>>>>>       32 KB of L1 data cache available.
>>>>>>>> - The little (A7) cluster has 512 KB of unified L2 cache available.
>>>>>>>> - The big (A15) cluster has 2 MB of unified L2 cache available.
>>>>>>>>
>>>>>>>> Features:
>>>>>>>> - Exynos 5422 support cache coherency interconnect (CCI) bus with
>>>>>>>>    L2 cache snooping capability. This hardware automatic L2 cache
>>>>>>>>    snooping removes the efforts of synchronizing the contents of the
>>>>>>>>    two L2 caches in core switching event.
>>>>>>>>
>>>>>>>> Signed-off-by: Anand Moon <linux.amoon@gmail.com>
>>>>>>>
>>>>>>>
>>>>>>> The provided values are not correct. Please refer to commit 5f41f9198f29
>>>>>>> ("ARM: 8864/1: Add workaround for I-Cache line size mismatch between CPU
>>>>>>> cores"), which adds workaround for different l1 icache line size between
>>>>>>> big and little CPUs. This workaround gets enabled on all Exynos542x/5800
>>>>>>> boards.
>>>>>>>
>>>>>> Ok, I have just referred to the Exynos 5422 user manual for this patch,
>>>>>> This patch is just updating the cache size for CPU for big.litle architecture..
>>>>>>
>>>>>
>>>>> Let me get it right. Marek's comment was that you used wrong values.
>>>>> Marek also provided rationale for this. Now your reply is that you
>>>>> update cache size? Sorry, I fail how you address Marek's comment.
>>>>>
>>>>> Do not repeat what the patch is doing. We all can see it. Instead
>>>>> respond to the comment with some sort of arguments.
>>>>>
>>>>
>>>> Ok, If I am not wrong  icache_size is hard-coded in the above commit.
>>>>
>>>> +#ifdef CONFIG_CPU_ICACHE_MISMATCH_WORKAROUND
>>>> +.globl icache_size
>>>> +       .data
>>>> +       .align  2
>>>> +icache_size:
>>>> +       .long   64
>>>> +       .text
>>>> +#endif
>>>>
>>>> In the check_cpu_icache_size function, we read the control reg
>>>> and recalculate the icache_size.
>>>> if there mismatch we re-apply the Icache_size,
>>>>
>>>> So dts passed values do not apply over here,
>>>
>>> So you provide incorrect values in terms of them being ignored? Then do
>>> not provide at all.
>>>
>> I will drop the icache and dcache values and just pass the L2_a7 and
>> L2_a15, value
>> Is this ok for you?
>>
>> Earlier, I have tried to verify this information in /sys and /proc
>> to verify the changes as ARM does not populate this information.
>>
> Here's an article that provides detailed insights into the cache feature.
> [0] http://jake.dothome.co.kr/cache4/

Here is Korean Wikipedia article about Sugar glider:
https://ko.wikipedia.org/wiki/%EC%9C%A0%EB%8C%80%ED%95%98%EB%8A%98%EB%8B%A4%EB%9E%8C%EC%A5%90

I guess we are putting now random references in Korean to our emails.


> 
> The values associated with L1 and L2 caches indicate their respective sizes,
> as specified in the ARM Technical Reference Manual (TRM) below.
> 
> Cortex-A15 L2 cache controller
> [0] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a15-l2-cache-controller
> 
> Cortex-A7 L2 cache controller
> [1] https://developer.arm.com/documentation/ddi0503/i/programmers-model/programmable-peripherals-and-interfaces/cortex-a7-l2-cache-controller
> 
> These changes help define a fixed cache size, ensuring that active pages
> are mapped correctly within the expected cache boundaries.


As with many previous attempts, you do not understand comments and
questions and you do not reply to them. This makes conversation pointless.

To prove it:

1. No one asks for performance numbers.
2. You give performance numbers.

I am dropping this patch because you did not address actual comments. I
also do not plan to give thorough review to other of your patches,
because you wasted a lot of my time in the past and this example here
proves you keep wasting.

Best regards,
Krzysztof

