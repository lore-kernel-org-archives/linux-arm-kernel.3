Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 64678FF885D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 01:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LIIi6TlLlORarJbE8L0nD/XYuT5XrhpXxkOCrf081b0=; b=rWRhpzkCwGcw7nLltXied4ybj4
	1sUfsOBqtJN2RYu6gfM/wfUaoop/UYFMwCeT5rZq0V31YluSUqjULD/il0Vr7OgNThAg6znKaryrO
	KQUtQnhvvVKNrQAMLzi+OQZk6wAlFBhffzPiZRlFMMISsLM9ZJFFbX2rVJQWtQzpeZnoOCDdeMSsp
	uJxSCopAwxeNZ9MN/+g1kwAf+a92lE1qkbe69FeHc8aVrDA6xtM/UaSOggHkUekQYe77y6/DmIL3e
	dzOO3eaZ2lmCxbB6dscbA3HXUEJ+saec98E9+A5+k7ymcCkr8ByP7X9VIgao9DRKOJfT1NmsomLO+
	iKreAyhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHAeG-0000000G0V5-3UZj;
	Mon, 27 Apr 2026 01:20:32 +0000
Received: from mail-m6099.netease.com ([210.79.60.99])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHAeD-0000000G0UE-1QZ1;
	Mon, 27 Apr 2026 01:20:31 +0000
Received: from [172.16.12.43] (unknown [61.154.14.86])
	by smtp.qiye.163.com (Hmail) with ESMTP id 3c3462145;
	Mon, 27 Apr 2026 09:20:24 +0800 (GMT+08:00)
Message-ID: <2af2f6a1-9b3b-4be5-b842-dcf29621e7ec@rock-chips.com>
Date: Mon, 27 Apr 2026 09:20:24 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 3/6] pwm: Add rockchip PWMv4 driver
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Lee Jones <lee@kernel.org>, William Breathitt Gray <wbg@kernel.org>,
 kernel@collabora.com, Jonas Karlman <jonas@kwiboo.se>,
 Alexey Charkov <alchark@gmail.com>, linux-rockchip@lists.infradead.org,
 linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-iio@vger.kernel.org
References: <20260420-rk3576-pwm-v5-0-ae7cfbbe5427@collabora.com>
 <20260420-rk3576-pwm-v5-3-ae7cfbbe5427@collabora.com>
 <4592b323-bebd-4242-ae31-892a51b5b3be@rock-chips.com>
 <ae4MCRE_hGJ-VcBQ@monoceros>
Content-Language: en-US
From: Damon Ding <damon.ding@rock-chips.com>
In-Reply-To: <ae4MCRE_hGJ-VcBQ@monoceros>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9dcc85f48b03a3kunm09663e0d16a152
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWRgWCB1ZQUpXWS1ZQUlXWQ8JGhUIEh9ZQVlCS0kdVhodSk4fTBoYGB4aHVYVFA
	kWGhdVEwETFhoSFyQUDg9ZV1kYEgtZQVlNSlVKTk9VSk9VQ01ZV1kWGg8SFR0UWUFZT0tIVUpLSU
	9PT0hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=bN5zx+rtmrL/sfaeiN+vg4O5kxMPAdyyupG2fp4MJaav5iTPpC3+Md9GiDIwaAEa20itdarD/TrppKYVToPHo/R9mZIVkQzwHk0zzW7y0APT8DmguCFa2GcaMdME/F662c9RLqfWIX+kk0dx0he8C4S8WCAeOMp5f3/CgfSwlPs=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=LIIi6TlLlORarJbE8L0nD/XYuT5XrhpXxkOCrf081b0=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260426_182029_977962_BB165A3F 
X-CRM114-Status: GOOD (  20.03  )
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

Hi Uwe,

On 4/26/2026 9:06 PM, Uwe Kleine-König wrote:
> Hello,
> 
> first of all thanks for your extensive testing, very appreciated.
> 
> On Sun, Apr 26, 2026 at 05:44:46PM +0800, Damon Ding wrote:
>> On 4/20/2026 9:52 PM, Nicolas Frattaroli wrote:
>>> The Rockchip RK3576 brings with it a new PWM IP, in downstream code
>>> referred to as "v4". This new IP is different enough from the previous
>>> Rockchip IP that I felt it necessary to add a new driver for it, instead
>>> of shoehorning it in the old one.
>>>
>>> Add this new driver, based on the PWM core's waveform APIs. Its platform
>>> device is registered by the parent mfpwm driver, from which it also
>>> receives a little platform data struct, so that mfpwm can guarantee that
>>> all the platform device drivers spread across different subsystems for
>>> this specific hardware IP do not interfere with each other.
>>>
>>> Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
>> Tested-by: Damon Ding <damon.ding@rock-chips.com>
>>
>> The continuous mode of all PWM channels has been preliminarily tested
>> and verified working on the RK3576 IoT board.
>>
>> I have tested with several typical period and duty cycle configurations.
>>
>> Following Uwe's suggestion [0], I also tested with libpwm using commands
>> similar to the following:
>>
>> ./pwmset -c 0 -p 0 -P 1000000 -D 500000 -s 5000
> 
> This one is good if you have an oscilloscope (or something similar) to
> verify the output. Without that (or additionally) pwmtestperf creates a
> series of requests that in combination with PWM_DEBUG should uncover
> rounding errors in the .tohw and .fromhw callbacks.

Aha, this is my oversight. I did not elaborate on my verification 
methods. ;-)

I have adopted three ways to complete the test:

1. Measure the output waveform of each channel with a simple logic 
analyzer, Kinst LA2016.
2. Read relevant registers to verify that the configured period and duty 
values match expectations.
3. Connect the PWM continuous output pins to capture input pins 
directly, to confirm the capture measurement results.

> 
> A good set of calls then is:
> 
> 	pwmtestperf -p ... -c ... -P 50000 -S1
> 	pwmtestperf -p ... -c ... -P 50000 -S1 -I
> 
> 	pwmtestperf -p ... -c ... -P 50000 -S-1
> 	pwmtestperf -p ... -c ... -P 50000 -S-1 -I
> 
> (Assuming that 50000 is a sensible period for the device under test.)
> 

Okay, I will look into this tool and run these commands to conduct more 
in-depth verification.

> And yes, I know, I need to document that using something more permanent
> than a mailing list post.
> 

Best regards,
Damon


