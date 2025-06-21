Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC53EC71157
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 16:20:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q6ylLQ2Xq7fvNMI3d0EKEk0PYSpqhIUlfHCA8lmJunk=; b=Etd+8IW7CDFipaEeC6S0K4LLGa
	kerxNlnLBsp6FGxPSMTVfVzU21fCi7ZkZ7c7F7rhWObglOqAHDLWLiUMdvLeRHFDwZ6F/rxSp2jhQ
	ELeSLucCwjfrcQnsnWB8gmzgFRFofhziVy02jFd9J7Kmp2J4On4ZM4qqvT5L+dhsj3jF4T57air8N
	QJ0pAxpWcFWTk9mJy0d86674+AQqV+5/MZWBoXKmajHcVu9M9atGOeFRgG8WokzZSgr/RvsuU5R4N
	l+qW/ER44yr87Nj6U6+z42Re8VHVM4CwdGTB3ejjKdIKkE4kI+8yzQCRL5kA8uB55I/r4B8AGRQxz
	TdMbFY5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0xJ-000000001XZ-2CU9;
	Sat, 21 Jun 2025 16:20:37 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0uy-000000001Uz-37Hf
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 16:18:13 +0000
Received: from smtp202.mailbox.org (smtp202.mailbox.org [IPv6:2001:67c:2050:b231:465::202])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4bPfdm3MFyz9srN;
	Sat, 21 Jun 2025 18:18:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750522684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6ylLQ2Xq7fvNMI3d0EKEk0PYSpqhIUlfHCA8lmJunk=;
	b=sLUrkknQs6FvFXWFzWgaqFYnINTYpg6MiGnhjNyjvJ7duh5KW5NYD9PSqz+05Wa0QnAwAW
	sHvOt8DNhdoiEsLK52lJ5227j/7GvgiMqYJFWRHtKRzfM5fhyosN9g+YtL/NxjFt7LdVT0
	ON2J/VxeiFZYFr6nQhsnvmUYBeyIPBqR8oYWeDBdEYbJxW/yTXqsMeNVihgDqTUY3XrzZg
	o+mIq2SuSwfMZPJQuRaTaqshAJTJ86ZnorXGsWTwqwxbN7gR0SdJCPkohYTAkIzSvWec+i
	fPRbR9ojT7dT9MJWjHieocygM865JZuxn0sB60VKbXBpIE4+G5S+NyCIdNLvKg==
Message-ID: <224fb424-6be7-455e-a2b1-f6e39e40d0d1@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1750522682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=q6ylLQ2Xq7fvNMI3d0EKEk0PYSpqhIUlfHCA8lmJunk=;
	b=ZHPkr1zuNa8MB/w2cpuVYmWwm9CD3f7BiwoOJSwbucWfFNSSG9dYZPzrjWBBv3E7J4dxIr
	oqyw1hL7jjkZQhBgXOcIgm+aVZTBlSbusBIlsorD39mz67MsKeFhqZb1G23tFpgg/AkHJv
	D5t0A5T8v5A1trnne2+crfE1EzzdFimn55S9VyhC5mLkdgJKq1veNrgPvb+BgyxsMW66E9
	+1omkKj/Hvh1Q2c4GOE0AY3rNlmT0wj8Oh3v+g6wymbJHmH3totvqBuyolRKmAiDvtPlnL
	lN8HB1My9ypn3KSXRCJrwynQb9H0V2qtK+AFksE88ETwsvGGrAvEc53QICPaDw==
Date: Sat, 21 Jun 2025 18:18:01 +0200
MIME-Version: 1.0
Subject: Re: [PATCH] regulator: rpi-panel-v2: Convert to new PWM waveform ops
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
Cc: Marek Vasut <marek.vasut+renesas@mailbox.org>,
 linux-arm-kernel@lists.infradead.org,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>
References: <20250617005059.614993-1-marek.vasut+renesas@mailbox.org>
 <jgafc7te2zotqwvetudo6c4o4nit6zi3yp4ecg4gka53hrypk5@7ypb5asrc2ct>
 <b464bc12-e921-4d98-9462-ec9d13ccb5ce@mailbox.org>
 <pb5gr65kbkokb7ybx3smqaa6vve4rkpg6qks2hdibwgrwmdzfu@6s5msb3k2p6y>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <pb5gr65kbkokb7ybx3smqaa6vve4rkpg6qks2hdibwgrwmdzfu@6s5msb3k2p6y>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-META: yx4jm7hx6zfka5fwbm3uygq63c637x85
X-MBO-RS-ID: 793524e9e769bff56d2
X-Rspamd-Queue-Id: 4bPfdm3MFyz9srN
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250621_091812_934679_5765865B 
X-CRM114-Status: GOOD (  20.64  )
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

On 6/17/25 4:13 PM, Uwe Kleine-König wrote:
> Hello Marek,

Hi,

>>> /* The actual value isn't known, so this is made up. */
>>> #define RPI_PANEL_V2_FIXED_PERIOD_NS 100000
>>>
>>>
>>> static int rpi_panel_v2_pwm_round_waveform_tohw(...)
>>> {
>>> 	...
>>>
>>> 	if (wf->duty_length_ns > RPI_PANEL_V2_FIXED_PERIOD_NS)
>>> 		*wfhw = 100;
>>> 	else
>>> 		*wfhw = mul_u64_u64_div_u64(wf->duty_length_ns * 100, RPI_PANEL_V2_FIXED_PERIOD_NS);
>>>
>>> 	return 0;
>>> }
>>
>> This fixed period specified in driver has one problem -- what if the period
>> is also specified in DT by the consumer, e.g. pwm-backlight pwms property,
>> and it does not match RPI_PANEL_V2_FIXED_PERIOD_NS ?
> 
> If it's off by only a little amount you will hardly notice. If it's
> further off that's less optimal. I don't think this is a problem. If the
> device tree is wrong, the machine doesn't work optimally. That's quite
> expected.

Before this rework, the DT period and duty cycle were scaled to match, 
so the period mismatch problem never occurred no matter what period was 
set in DT. I suspect with this rework, such a behavior is no longer 
possible, or is it ?

>> This is easy to solve for this tohw function, but what about the fromhw
>> which assigns period_ns ?
> 
> If you only write waveforms to the hardware (probably using
> pwm_apply_might_sleep()), the fromhw callback isn't involved (apart from
> debugging). And all fromhw callbacks are supposed to assign
> period_length_ns. I suspect we don't have the same understanding of the
> PWM abstraction.

The core does check whether the fromhw is implemented alongside 
.write_waveform , so how should the fromhw behave in such a case ?

See this drivers/pwm/core.c :

1633 static bool pwm_ops_check(const struct pwm_chip *chip)
1634 {
1635         const struct pwm_ops *ops = chip->ops;
1636
1637         if (ops->write_waveform) {
1638                 if (!ops->round_waveform_tohw ||
1639                     !ops->round_waveform_fromhw || // <------ HERE
1640                     !ops->write_waveform)
1641                         return false;

Maybe this should be patched out of the core.c and fromhw removed from 
this driver ?

>>>> +static int rpi_panel_v2_pwm_write_waveform(struct pwm_chip *chip,
>>>> +					   struct pwm_device *pwm,
>>>> +					   const void *_wfhw)
>>>> +{
>>>> +	struct regmap *regmap = pwmchip_get_drvdata(chip);
>>>> +	const u8 *wfhw = _wfhw;
>>>> -	duty = pwm_get_relative_duty_cycle(state, PWM_BL_MASK);
>>>> -	return regmap_write(regmap, REG_PWM, duty | PWM_BL_ENABLE);
>>>> +	return regmap_write(regmap, REG_PWM, *wfhw | (*wfhw ? PWM_BL_ENABLE : 0));
>>>
>>> How does the PWM behave without PWM_BL_ENABLE set?
>> The display stays dark.
> 
> So you cannot distinguish writing `0` (or any other value) and
> `PWM_BL_ENABLE | 0` I guess?

I think no.

> I ask because for some hardware's it makes a difference, the output
> might e.g go High-Z on disable.
Maybe Dave can clarify this, although I suspect this is also some third 
party hardware with no documentation.

