Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79541CA1013
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 00:14:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8n/0W6JHitUDwoMpFjg9k4Y2pN5WPpEih5itsKuiCZc=; b=ESurxVsgptLR8qrr1YYh38HCDm
	8I1+ugov2QytOQ8SmvThxlps2PLEhgvlzIX55A+WFU6biYgHht8jSgTygym5tj+f0RmogYiAkWG7W
	deblcM2Eq0DjA6d05sCIf2yQpnxanEN5jvL1DwOCZQ9dsPb+b84cNYO5TtEZQ8QSVqGN2zLVQSUwl
	VPscyXcoMB7xoDpf7HB+tM7UtkP7mBvIok+Kd4nx5Yfm/FccHcscQVw9yh9YTIfNsL5Ipqmg6mJkN
	1uupB6JTMh+2fBdd3i91fyYdldBHM0MOGp0u/CRsDVGSJhmzKfmLYfmenpTb5pxJjiBeULeQXQNAl
	TMiL3hjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOls-00000001VJB-149F;
	Fri, 19 Sep 2025 00:14:40 +0000
Received: from smtpbguseast1.qq.com ([54.204.34.129])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzOlp-00000001VI2-1iFC;
	Fri, 19 Sep 2025 00:14:39 +0000
X-QQ-mid: zesmtpip3t1758240836tb58d29e6
X-QQ-Originating-IP: m6WApfYMqy/M1U5G9blRrrjx+KT0iGx5rYj1EBrL7aY=
Received: from [IPV6:240f:10b:7440:1:ce36:128f ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Fri, 19 Sep 2025 08:13:52 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 3376898036188312182
Message-ID: <F1C5CEF8D2933380+98b20449-12bb-4697-84e0-40fd8c2ed81f@radxa.com>
Date: Fri, 19 Sep 2025 09:13:51 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] arm64: dts: rockchip: correct uart mux for Radxa ZERO
 3
To: Ed W <lists@wildgooses.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250917114932.25994-1-lists@wildgooses.com>
 <20250917114932.25994-2-lists@wildgooses.com>
 <FBB5B30DE8FEABD7+59ee6f48-2ad1-45dd-8cf1-8b58a03513a9@radxa.com>
 <adbc2396-d5f0-4dd6-a65e-0dd78a58b9a4@wildgooses.com>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <adbc2396-d5f0-4dd6-a65e-0dd78a58b9a4@wildgooses.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: OAOHw7tUGLQOcxelNBtkTVWFdi8/NGrLMCDKXvFBpW4bo9CpAlddDcXD
	aBeJWa76gD9H1h/5+gsuhYc3MdFNrjPMA8l7hWoLRInPb+7gsDVKbzbGdd8G4DILDa+3R5R
	FVYCZnm/v53Ad1yswfmtcOaPNqXurdBrjFN4/MCbd1hWOrqSvHbp/csKVJltTFDzHQWThnX
	8CjTfMxziQF5ybLPVWVOFLFaslYCySlN6A/sL9oTUB0bSOP+fLse/mvQUfbhbeTzmvGfUhj
	o5y2fRQaCXHIqOKzsM0kR4VRXrnygpVjZnwyYaLsRjFxHcCdFxK1nW5ioh/nnUdTIvX4ag5
	ZCeSs6gucfCFWtdN/regX2wXKvoebWhvN3ekTrGkHgCU60S315e9h8L50MOw2Jb/77UiXWW
	hH3CypWLuFtJLjAN3sgm2d8Zs1lFl7Z6k73sQxahBpuUYjYfgrQJQkM6i0GdSQoboqik+bQ
	lIOaiXDciSen9RACuxkcC0fCwsU0mPEEraveQLwY9OtUXgx3wCfc7KbCzqXbHxFS/E+GCTm
	B2sOkQhMXHnERU+NfQ1yKVu9T8JM+hqy8emchfb3RvnhYOLYqCfvxw1bm1Ot3mnZ8LK3Me1
	7mcVMjHz1c22+qoUcwp5S2ElLj+wqCA4h+pDcTFUS4Oblr1BUbpInGdkSjMlKt+cgnIzL/H
	ZX1bbXvghralKOdGVjszj4CTc7UO0YxvO5QIOseMLkGzfQJ50Qk9++2NkWwK+5GyBQIuvl4
	9R/8/seGPnGFTV/cSz+5w9qHprVVoCCYhRcKdB6FUg1Z81avqYxQ69kNWKaS5piLnzFP/D3
	VNYIqqMvFIeATJ9NtL/AHgQnK03YkXJdrzo7lc8ddS9e5Uc273Em0QQKd/w/46vYHbF26mf
	XkabuuraSUxWFds1iyJEV0OZRJYENAbINFuQYgwmiR6RO8zvHYXHR649DwWAof027az5g06
	8UQ0RUsMmPYXp/MQqqg5KLZMrSOXsjFSQgXtBT2Rnpw1wLFQ/mXM7nJFiIYlORyn4w9lS0l
	icoLXBpB0//wm33lio
X-QQ-XMRINFO: MPJ6Tf5t3I/ycC2BItcBVIA=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250918_171437_962444_5B7EEF0B 
X-CRM114-Status: GOOD (  28.05  )
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

Hi Ed,

On 9/19/25 00:23, Ed W wrote:
> On 18/09/2025 05:53, FUKAUMI Naoki wrote:
>> Hi Ed,
>>
>> Thank you very much for your work.
>>
>> On 9/17/25 20:49, Ed Wildgoose wrote:
>>> The rk3566 has multiplexed pins and the uarts can be moved to a choice
>>> of 2 pin groups. The default rk356x-base.dtsi appears to default to mux0
>>> for all uarts, however, specific hardware might choose to implement
>>> alternatives
>>>
>>> The Radxa zero 3 shows that is uses M1 for uarts:
>>> - uart4
>>> - uart5
>>> - uart9
>>>
>>> These aren't normally enabled, but we should at least correct the
>>> default pinctrl definitions. Without these changes there will be
>>> conflicts with mmc0/mmc1, leading to the SD or eMMC going missing.
>>
>> Sorry, but why do we need these definitions for disabled nodes?
>>
>> Or why don't we do similar definitions for nodes other than uart?
>> For example, PWM12, I2S3, and SPI3 also use M1. Are they not related to SD/eMMC and therefore
>> don't need to be defined?
>>
>> If users want to use UARTs on pin headers, they will refer to the correct documentation[1] to
>> determine which pins are UARTs and will of course write the correct pinctrl definition.
>>
>> [1] https://docs.radxa.com/en/zero/zero3/hardware-design/hardware-interface#gpio-interface
>>
>> Best regards,
>>
>> -- 
>> FUKAUMI Naoki
>> Radxa Computer (Shenzhen) Co., Ltd.
> 
> 
> Personally, and I'm saying this as a user who is technical enough to fix the definitions, it took me
> quite a few days to figure out what was wrong with the definitions and understand the intricate tree
> of dtsi includes, to finally figure out why I couldn't just do a "status = "okay";" to enable the
> UARTs... (which is roughly what is shown in several radxa supplied overlays to enable uarts on
> various boards)
> 
> So my vote would be to correctly define all the hardware for a given board. Then users can simply do
> a status="okay" to enable and off they go. Phrased another way, I can't see a disadvantage in doing
> this, rather than leaving broken definitions in place which don't work correctly. Ideally I think
> you should add at least the I2C defs as well, as that is something I would like to use for another
> reason and haven't even got to the point of discovering that was broken?
> 
> I might also (gently) add that it was not easy to find all the documentation to fix this. I located
> the datasheet for the Zero 3 via google (it's not obviously available on the wiki?), then there is
> the reading through and I must admit I missed the multiplex difference the first few reads through.
> Eventually I fed the docs into a LLM and it pointed out what I missed and we got there

In addition to docs.radxa.com, we also distribute some PDFs on the 
following pages:

  https://radxa.com/products/zeros/zero3e#downloads
  https://radxa.com/products/zeros/zero3w#downloads

All information should be linked from the product pages (e.g. 
https://radxa.com/products/zeros/zero3e), but if something is missing, 
please report the issue by clicking "Report issue" at the bottom of each 
page on docs.radxa.com.

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> So in summary, I'm hoping you will adjust the (really very well structured! thanks!) dtsi include
> tree to correctly define all hardware on each board so that we don't have a situation that every
> user in the world needs to be a really decent level kernel tech just to use the board! Pretty please!
> 
> Thanks for listening
> 
> Ed W
> 
> 
> 


