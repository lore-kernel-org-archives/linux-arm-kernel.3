Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EEAF4C98315
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 17 Jan 2026 17:50:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aeRWWhZsB9W4Mdm2XsF0D25MMamWmxlUj47bOUBFctk=; b=aVbKM4de+9eVHnOUQZGX5/GmFK
	FMkdgt5klQqKN1k5li+Z8pEssVJl9D5B9eFvIcnv/uhn2iURmZG5woH9jQhP9AFJktnAVMrp071Fb
	B+5E4cYuqEQCQxNsg1w8O8S2CI0cvUGnOg7oqdisiz4jJ5igYD/aMNfRwJqP0AFqxA0vDWM21mWnL
	uLlZRcQ/SPQvWQkGH5SJoT5IEmrYv1w5Bm3f+Ok1DRszCwZr4uieziEcgDogMgLrsEb1j8mv7fuKP
	KONCf5KRYdYRZw9Dl+MGt9Iqe2sx+uONcLD6AfRwMqFY21eiCi4wKrsYvBgv2kpI8x+xrg6JTG9Q6
	NKJA1Nig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAR8-0000000FhMB-0Lsq;
	Sat, 17 Jan 2026 17:50:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhAR6-0000000FhM5-2Ysm
	for linux-arm-kernel@lists.infradead.org;
	Sat, 17 Jan 2026 17:50:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8C21A60127;
	Sat, 17 Jan 2026 17:50:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17154C4CEF7;
	Sat, 17 Jan 2026 17:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768672207;
	bh=TJsszfgPs4dqT47lK9RDmiAoLDpJ3U0lvlDOccNpY5M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uyXPUs7RczJ7NY461hprrAtMvRYA6p9v+RB9OZ2q6x9lFfac9uGykoIhXBIrFHKWO
	 kpTVyLdec0liLlOwMsJtO0bHwG52msxPIHLyMi05PAF30vQ14ylWnbGJMGOFxer/JP
	 mQe4YHS+mBQx+zUnkydhwGgsxEL/cPQkIh/SmMixsgoLQwYFK8Rhv0yFuykPu5qrum
	 kK8XMzYvP8fUNsdsQqxC0MzU/a7hu2SkDIeAXdw2fiB+yaqJdE42NHEm5oSKm/N0Gj
	 zAixehyCrS5fc23xd1YkvNgvU78SJM85oSv2YjEoujZ2Im0bOZS9c9M5jBxpoRgWKr
	 UOF+GHrFh9eEA==
Message-ID: <4c5a8c22-4e96-4780-a083-9326756a4144@kernel.org>
Date: Sat, 17 Jan 2026 18:50:04 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: apple: rtkit: Add function to poweroff
To: Janne Grunau <j@jannau.net>
Cc: Neal Gompa <neal@gompa.dev>, asahi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260117-apple-rtkit-poweroff-v1-1-6fbe8145e965@kernel.org>
 <20260117173819.GA55832@robin.jannau.net>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <20260117173819.GA55832@robin.jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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

Hi,

On 1/17/26 18:38, Janne Grunau wrote:
> On Sat, Jan 17, 2026 at 06:24:44PM +0100, Sven Peter wrote:
>> Add a function to put a co-processor into the lowest possible power
>> state from which recovery usually isn't possible without a full SoC
>> reset. This is required for the USB4/Thunderbolt co-processors which
>> can be restarted since the entire USB4 root complex can be completely
>> reset independently of the rest of the SoC.
>>
>> Signed-off-by: Sven Peter <sven@kernel.org>
>> ---
>>   drivers/soc/apple/rtkit.c       | 17 +++++++++++++++++
>>   include/linux/soc/apple/rtkit.h |  7 +++++++
>>   2 files changed, 24 insertions(+)
>>
>> diff --git a/drivers/soc/apple/rtkit.c b/drivers/soc/apple/rtkit.c
>> index b8d4da147d23f7e99e76eea314e4d976cddbd1c6..381faaf74d5982163d2c44d1e2c6e0ddad07bd73 100644
>> --- a/drivers/soc/apple/rtkit.c
>> +++ b/drivers/soc/apple/rtkit.c
>> @@ -851,6 +851,23 @@ int apple_rtkit_shutdown(struct apple_rtkit *rtk)
>>   }
>>   EXPORT_SYMBOL_GPL(apple_rtkit_shutdown);
>>   
>> +int apple_rtkit_poweroff(struct apple_rtkit *rtk)
>> +{
>> +	int ret;
>> +
>> +	ret = apple_rtkit_set_ap_power_state(rtk,
>> +					     APPLE_RTKIT_PWR_STATE_OFF);
>> +	if (ret)
>> +		return ret;
>> +
>> +	ret = apple_rtkit_set_iop_power_state(rtk, APPLE_RTKIT_PWR_STATE_OFF);
> inconsistent line wrapping. It's wrapped for AP power state which is 1
> character shorter. I would wrap neither it only moves the statement 4
> places to the left.

Good catch, will fix it.
>
>> +	if (ret)
>> +		return ret;
>> +
>> +	return apple_rtkit_reinit(rtk);
>> +}
>> +EXPORT_SYMBOL_GPL(apple_rtkit_poweroff);
>> +
>>   int apple_rtkit_idle(struct apple_rtkit *rtk)
>>   {
>>   	int ret;
>> diff --git a/include/linux/soc/apple/rtkit.h b/include/linux/soc/apple/rtkit.h
>> index 736f530180179bd144cf85eb0f0bd93844d7188a..bda3c528b51553c13f7fe5685ab60f7fc675361b 100644
>> --- a/include/linux/soc/apple/rtkit.h
>> +++ b/include/linux/soc/apple/rtkit.h
>> @@ -125,6 +125,13 @@ int apple_rtkit_wake(struct apple_rtkit *rtk);
>>    */
>>   int apple_rtkit_shutdown(struct apple_rtkit *rtk);
>>   
>> +/*
>> + * Put the co-processor into the lowest power state. Note that it usually
>> + * is not possible to recover from this state without a full SoC reset.
>> + */
>> +
>> +int apple_rtkit_poweroff(struct apple_rtkit *rtk);
>> +
>>   /*
>>    * Put the co-processor into idle mode
>>    */
>>
> Feel free to fix without sending a v2
>
> Reviewed-by: Janne Grunau <j@jannau.net>

Thanks! b4 makes sending that v2 very easy luckily :)


Thanks,

Sven



