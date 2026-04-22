Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B5CBF9EDD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 13:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yFStcb4f/x+503rZVtGq3Qa5jVcmgU6vvLRLiYaHIU8=; b=duEiv+14h9NSTdM+liE08VEkgx
	cHO9gVNUV2kpJAEEFRGhMMMRgZvakFFGLlfoD1PMhclPxZklA4kEVYOq3fKZ6fB+W8gGNejaxgX93
	9by5vDDpcO4HVcdEC3xL8fDH9lyte0SwBAOyTJV4iKzSzC6IovVbeZVY3goMmtrNTq6WKKP8z8H6A
	dMeT305C8QOHdRcxj3G70dWv6IQK/xX+taH7LV4Y9WUgau3qg7H3CUr5PLzOs98gxK73wKg/JC7kE
	2SjrA93/Lf0Es6kil8NtXyYPQjOy8AJwrT4GZpGKa4FysqWMrNtFCs5UVpqkzvq4reitC24XzGGzE
	ROMPBS2Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXnH-0000000AJtZ-3YUh;
	Wed, 22 Apr 2026 13:39:07 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFXnF-0000000AJso-1QOO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 13:39:06 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B75A61FC4;
	Wed, 22 Apr 2026 06:38:55 -0700 (PDT)
Received: from [10.57.33.69] (unknown [10.57.33.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0EE173F836;
	Wed, 22 Apr 2026 06:38:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776865141; bh=7rpgALkRycPSgcaAOgE3Prm0pYeBYUlmAelrxMIZcMI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cJX6XLaZ9w4cDlcqe/N6PdfC9Zmxg3eiCrHKrqfZb5e2qMpOmbffF2ER/ReBGBsaO
	 5NspPcgUbyYXsYrEuudf2IubWTqk9tkKDpK3wofmCPbhZmpMvB0V1B84V1aYFDm7B2
	 f2axAPb9yLv6lAJxgakoM4b10yG38GbpsL22pD+w=
Message-ID: <44aab543-a200-49bd-81e5-70d77ebe1c85@arm.com>
Date: Wed, 22 Apr 2026 15:38:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/4] Add hstimer support for H616 and T113-S3
To: Michal Piekos <michal.piekos@mmpsystems.pl>
Cc: Daniel Lezcano <daniel.lezcano@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>, Maxime Ripard <mripard@kernel.org>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
References: <20260419-h616-t113s-hstimer-v1-0-1af74ebef7c5@mmpsystems.pl>
 <20260419225539.718367e0@ryzen.lan>
 <xlvldmapdoql7nt3swube5vd6fdiosq7rt5afg246xertko5fa@4irmzupkar23>
 <b89c1c8b-2678-4f4f-a63c-03b92cf7617c@arm.com>
 <h4b3xluygfptee3ej4gbr3hctgjk6q4oytkisk66saii4uyvl3@lw4qdtfuyoz5>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <h4b3xluygfptee3ej4gbr3hctgjk6q4oytkisk66saii4uyvl3@lw4qdtfuyoz5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_063905_464720_F5F2F400 
X-CRM114-Status: GOOD (  33.05  )
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

Hi Michal,

On 4/21/26 16:05, Michal Piekos wrote:
> On Mon, Apr 20, 2026 at 04:14:44PM +0200, Andre Przywara wrote:
>> Hi Michal,
>>
>> On 4/20/26 13:27, Michal Piekos wrote:
>>> On Sun, Apr 19, 2026 at 10:55:39PM +0200, Andre Przywara wrote:
>>>> On Sun, 19 Apr 2026 14:46:06 +0200
>>>> Michal Piekos <michal.piekos@mmpsystems.pl> wrote:
>>>>
....

>>>>
>>> I took the table from https://linux-sunxi.org/Linux_mainlining_effort as
>>> a todo list and wanted to help with it. I do not have own use case for
>>> this timer. If it is not needed then I will spin v2 to include your
>>> comments and abandon it.
>>
>> Ah, that's good to know, and thanks for picking things from that list! I
>> don't think there is a particular need to abandon your work, we could as
>> well upstream it. At least the DT changes should be added, so that other DT
>> users could make use of the timers - after all it's a Linux implementation
>> choice to utilise just one timer. But please go ahead and post a complete
>> v2, I don't think it hurts to have HSTIMER support in the kernel.
>> And while you are at it: can you figure out what the need is for using two
>> timers? One is a clock source, the other is for clock events? And why do we
>> limit the counters and timers to 32 bit? Even the A13 manual lists them as
>> 56 bits, and a wraparound time of roughly 21 seconds (with 32 bit counters)
>> does not sound very long to me.
>>
> Yes. Channel 0 is clockevent and channel 1 is a clocksource and sync
> reference for channel 0 disable timing.
> 
> 32 bit counters seems like implementation choice rather than limitation
> but that would need to be implemented and tested. Would you suggest to
> extend it to 56 bit in the following patch?

Well, yes, I would assume we want as long an overflow period as 
possible. The tricky/interesting part is that the interface is still 
32-bit MMIO reads, so we need to find out how the consistency works. The 
manual recommends to read LO first, but not sure that means its latching 
HI upon the LO read. Otherwise we should read HI, LO, and HI again and 
compare both HI's. Probably needs some testing.

>> Not sure what your primary motivation for fixing Allwinner support is, but
>> we could probably find more worthwhile targets. Do you have Allwinner boards
>> other than the OrangePi Zero 3? There are not many low hanging fruits on the
>> H616 left (MBUS and LDOs(?) maybe), but the A523 has quite some missing
>> drivers still, some of them probably more on the easy side.
>>
> I have boards with A733, A527, T113-S3, H616, H6, H3 and I
> think some older stuff too. My motivation is mostly fun and learning.

That's great, and what I was hoping for! ;-)
Feel free to reach out on IRC if you have any questions or comments.

> I also use those boards in custom projects.
> 
> I will take up GPADC on A527 after finishing this as I worked with ADC's
> a lot on MCU's. Unless other suggestions?

Yes, LRADC and GPADC are good devices to start with. Also crypto comes 
to mind, the most useful there being the TRNG device, which helps the 
kernel to start its own RNG much quicker. Chances are those things are 
close to the existing SoCs, so there might be not too much to do here.

Cheers,
Andre

> 
> Thank you for comments.
> Michal
> 
>> If you are stuck with the OpiZero3, then you could just look and check the
>> existing devices, and verify their operation. For instance I think USB-OTG
>> is still broken - across most Allwinner SoCs actually, so it's a sunxi
>> driver issue.
>>
>> Thanks,
>> Andre
>>
>>>
>>> Michal
>>>
>>>>>
>>>>> Signed-off-by: Michal Piekos <michal.piekos@mmpsystems.pl>
>>>>> ---
>>>>> Michal Piekos (4):
>>>>>         dt-bindings: timer: allwinner,sun5i-a13-hstimer: add H616 and T113-S3
>>>>>         clocksource/drivers/sun5i: add H616 hstimer support
>>>>>         arm64: dts: allwinner: h616: add hstimer node
>>>>>         arm: dts: allwinner: t113s: add hstimer node
>>>>>
>>>>>    .../timer/allwinner,sun5i-a13-hstimer.yaml         |  8 +++-
>>>>>    arch/arm/boot/dts/allwinner/sun8i-t113s.dtsi       | 12 +++++
>>>>>    arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  9 ++++
>>>>>    drivers/clocksource/timer-sun5i.c                  | 56 +++++++++++++++++++---
>>>>>    4 files changed, 78 insertions(+), 7 deletions(-)
>>>>> ---
>>>>> base-commit: faeab166167f5787719eb8683661fd41a3bb1514
>>>>> change-id: 20260413-h616-t113s-hstimer-62939948f91c
>>>>>
>>>>> Best regards,
>>>>
>>>>
>>
>>


