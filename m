Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C88F5D44D75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TamoRQHVz3CLLV4TriCaXhJ6JFCj9iwTzd2ELzYslvI=; b=cRdcG40mpSynvMHzBLEufXhpx1
	NuK8mTzaSu4giefjbCb7OFwynwFKnZlehvMuh0OB2tZS0AROrUgTqVw0K4746aB2N9GGIUxDUCpD6
	w6qJfak+NNw9B3GeLUkqJstzpz6r71YFSYia0sBryd9AK8lWxDCCyPGdrATjMa05dSMcwZy7CMAPe
	UR7SswyhpQ0BWtPL0t0ZlCtdgB8m0JCmS4PE3O04wo4K9kapzZFEPhrKveoK/0Fp/LEmp4O0xrctL
	oYeP28vZ4R9mtF2VcBLRBkZbYqrhZjoTxSXa74q/0pCG4SeSIaXpfOrZT6CLC2c6Wd3IS8kVqA05r
	Ovsf9Yqw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gkx-00000003YCQ-16iq;
	Wed, 06 Nov 2024 14:11:35 +0000
Received: from mx1.sberdevices.ru ([37.18.73.165])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8gUk-00000003VJO-11Uw;
	Wed, 06 Nov 2024 13:54:54 +0000
Received: from p-infra-ksmg-sc-msk01.sberdevices.ru (localhost [127.0.0.1])
	by mx1.sberdevices.ru (Postfix) with ESMTP id CC512100027;
	Wed,  6 Nov 2024 16:54:42 +0300 (MSK)
DKIM-Filter: OpenDKIM Filter v2.11.0 mx1.sberdevices.ru CC512100027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=salutedevices.com;
	s=mail; t=1730901282;
	bh=TamoRQHVz3CLLV4TriCaXhJ6JFCj9iwTzd2ELzYslvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type:From;
	b=ftP6I8KI+D0QkunWuobJM9R6/TLFnROf1F1QNLBw6FPYpuIo6tY4d3yl3W9LMy4L1
	 pe+Z6mmHZGG9cDWB+GaWLZsp8W708Cv+E4Nxq5TjF8SrudxCEbW9ikIAnTWEMrbOJf
	 2VUhYXX/AIUGMe2zxIJnKxohEqC5Yjw2jmewuVDMx9NgMT30ACU3zLm+LXueCVLeFa
	 Q8MSFaAJt4t3WPtpvZDVP07WJucipz1r+ImTxYCOSxkCuCJk7tOiGv0gDdqnhFlP8k
	 R8mkR8NcSwfxW9HcKtebB7e/FyukW3kWRvm2CR6yF2J9DZidXV1iuSslXStARAM96t
	 iAG3vPqk8zEEg==
Received: from smtp.sberdevices.ru (p-i-exch-sc-m01.sberdevices.ru [172.16.192.107])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by mx1.sberdevices.ru (Postfix) with ESMTPS;
	Wed,  6 Nov 2024 16:54:42 +0300 (MSK)
Message-ID: <f08513c8-56d6-4551-8ac6-84641c134552@salutedevices.com>
Date: Wed, 6 Nov 2024 16:54:41 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] pwm: meson: Support constant and polarity bits
To: =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
CC: <neil.armstrong@linaro.org>, <khilman@baylibre.com>,
	<jbrunet@baylibre.com>, <martin.blumenstingl@googlemail.com>,
	<linux-pwm@vger.kernel.org>, <linux-amlogic@lists.infradead.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
	<kernel@salutedevices.com>
References: <20241016152553.2321992-1-gnstark@salutedevices.com>
 <20241016152553.2321992-3-gnstark@salutedevices.com>
 <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
Content-Language: en-US
From: George Stark <gnstark@salutedevices.com>
In-Reply-To: <w3igi2jmva6mfa7anlieyp3iiwfzhsvi3t37wwcqqtzdy42fqn@btmdsfsmpw7r>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [185.8.126.20]
X-ClientProxiedBy: p-i-exch-a-m1.sberdevices.ru (172.24.196.116) To
 p-i-exch-sc-m01.sberdevices.ru (172.16.192.107)
X-KSMG-Rule-ID: 10
X-KSMG-Message-Action: clean
X-KSMG-AntiSpam-Lua-Profiles: 188995 [Nov 06 2024]
X-KSMG-AntiSpam-Version: 6.1.1.7
X-KSMG-AntiSpam-Envelope-From: gnstark@salutedevices.com
X-KSMG-AntiSpam-Rate: 0
X-KSMG-AntiSpam-Status: not_detected
X-KSMG-AntiSpam-Method: none
X-KSMG-AntiSpam-Auth: dkim=none
X-KSMG-AntiSpam-Info: LuaCore: 41 0.3.41 623e98d5198769c015c72f45fabbb9f77bdb702b, {Tracking_from_domain_doesnt_match_to}, smtp.sberdevices.ru:7.1.1,5.0.1;d41d8cd98f00b204e9800998ecf8427e.com:7.1.1;salutedevices.com:7.1.1;127.0.0.199:7.1.2, FromAlignment: s
X-MS-Exchange-Organization-SCL: -1
X-KSMG-AntiSpam-Interceptor-Info: scan successful
X-KSMG-AntiPhishing: Clean
X-KSMG-LinksScanning: Clean
X-KSMG-AntiVirus: Kaspersky Secure Mail Gateway, version 2.0.1.6960, bases: 2024/11/06 12:26:00 #26826484
X-KSMG-AntiVirus-Status: Clean, skipped
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_055452_579186_F6C539CD 
X-CRM114-Status: GOOD (  26.11  )
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

Hello Uwe

Thanks for the review.

On 11/4/24 12:32, Uwe Kleine-König wrote:
> Hello George,
> 
> there are two minor things I dislike in this patch/driver. But I'm not
> sure the alternatives are objectively considerably better. See below and
> judge yourself.

...

>> @@ -68,6 +72,8 @@ static struct meson_pwm_channel_data {
>>   	u8		clk_div_shift;
>>   	u8		clk_en_shift;
>>   	u32		pwm_en_mask;
>> +	u32		const_en_mask;
>> +	u32		inv_en_mask;
>>   } meson_pwm_per_channel_data[MESON_NUM_PWMS] = {
>>   	{
>>   		.reg_offset	= REG_PWM_A,
>> @@ -75,6 +81,8 @@ static struct meson_pwm_channel_data {
>>   		.clk_div_shift	= MISC_A_CLK_DIV_SHIFT,
>>   		.clk_en_shift	= MISC_A_CLK_EN_SHIFT,
>>   		.pwm_en_mask	= MISC_A_EN,
>> +		.const_en_mask	= MISC_A_CONSTANT_EN,
>> +		.inv_en_mask	= MISC_A_INVERT_EN,
>>   	},
>>   	{
>>   		.reg_offset	= REG_PWM_B,
>> @@ -82,6 +90,8 @@ static struct meson_pwm_channel_data {
>>   		.clk_div_shift	= MISC_B_CLK_DIV_SHIFT,
>>   		.clk_en_shift	= MISC_B_CLK_EN_SHIFT,
>>   		.pwm_en_mask	= MISC_B_EN,
>> +		.const_en_mask	= MISC_B_CONSTANT_EN,
>> +		.inv_en_mask	= MISC_B_INVERT_EN,
>>   	}
>>   };
> 
> So the generic register description describes the const and invert bits,
> but it doesn't apply to all IPs. Thinking about that, I wonder why this
> struct exists at all. I would have done this as follows:
> 
> 	#define MESON_PWM_REG_PWM(chan)		(0 + 4 * (chan))
> 
> 	#define MESON_PWM_REG_MISC		(8)
> 	#define MESON_PWM_REG_MISC_EN(chan)		BIT(chan)
> 	#define MESON_PWM_REG_MISC_CLK_SEL(chan)	GENMASK(5 + 2 * (chan), 4 + 2 * (chan))
> 	....
> 
> and then use these constants directly (with pwm->hwpwm as parameter if
> needed) in the code. I would expect this to result in more efficient and
> smaller code.

I've been looking into this driver for more than a year and got used to
it so much so never thought about changing the foundations :) Although 
it's an interesting thought.

1. I took meson_pwm_enable() without
const patches and reimplemented it using only defines (e.g. w/o local
var channel_data) and objdumped current and new versions. New version
turned out to be one instruction longer (arm64, gcc, default -O2). So 
total difference in executable code may be not that significant although
we can win in C-code line count.

2. Things like
#define MISC_B_EN		BIT(1)
#define MISC_A_EN		BIT(0)
is more straightforward and can be matched to the datasheet easier
comparing to (a + b * (chan)) things.

So I'm not sure either.

>> @@ -227,6 +252,15 @@ static void meson_pwm_enable(struct pwm_chip *chip, struct pwm_device *pwm)
>>   
>>   	value = readl(meson->base + REG_MISC_AB);
>>   	value |= channel_data->pwm_en_mask;
>> +
>> +	if (meson->data->has_constant)
>> +		meson_pwm_assign_bit(&value, channel_data->const_en_mask,
>> +				     channel->constant);
> 
> Personally I'd prefer:
> 
> 	value &= ~MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> 	if (meson->data->has_constant && channel->constant)
> 		value |= MESON_PWM_REG_MISC_CONST_EN(pwm->hwpwm);
> 
> even though your variant only mentions the mask once. While it has this
> repetition, it's clear what happens without having to know what
> meson_pwm_assign_bit() does. Maybe that's subjective?
> 

Actually I also don't like meson_pwm_assign_bit() too match and I'm
surprised there's no something like this in the kernel already.
I again objdumped versions meson_pwm_assign_bit() vs double mask 
repetition. Unconditional bit clearing takes only a single instruction:

// value &= ~channel_data->const_en_mask;
9ac:	0a250040 	bic	w0, w2, w5

So in the current series I could drop meson_pwm_assign_bit() and use:

value &= ~channel_data->const_en_mask;
if (meson->data->has_constant && channel->constant)
	value |= channel_data->const_en_mask;

If it's decided now or later to drop meson_pwm_channel_data then
w\o meson_pwm_assign_bit() future patch will be line-to-line change.

What you think?

> Best regards
> Uwe

-- 
Best regards
George

