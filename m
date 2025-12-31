Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15CBDEE6440
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 31 Dec 2025 14:09:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBGL6dDCOuh3bhIrx5PRK90WNsQm4b6NujEGQuwgXlc=; b=oKuOauDSuvSNtMWEeZNWx1iyUA
	AS/++NfFiQOGf1oyRFbFrIqOZi6ZDvbegjs58cg29mJ5uAsDmmGttRvpB4sGh/FkWC4aA5pMwIgt0
	iWiN1P3hSBTUvKnDRCdrX6UHm6XSKG17dSe6pj4nTXdTZGWSMquEFQWQ5CRsmEig/HVa2PUemPi7Y
	R8s6QY1Hk0Kp/6oPTRo14hFzZQILjPP02hrP5SyB3nrYZtnB+5cj51FTUpxA2j17UQuU7SRw2Oasw
	cJulXUAp6qrCvhDvstxzWQSy8v9w6/lWWCldv3eEZvhumebvmiwmMcUwl/EffLahr0EH1lrir8Nm7
	MXdtjOOQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vawtR-000000061jj-0t37;
	Wed, 31 Dec 2025 14:09:41 +0000
Received: from mout-p-103.mailbox.org ([2001:67c:2050:0:465::103])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vawtO-000000061jH-2yGM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 31 Dec 2025 14:09:39 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [IPv6:2001:67c:2050:b231:465::102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4dhBfL5C1Tz9t0t;
	Wed, 31 Dec 2025 15:09:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1767190170;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wBGL6dDCOuh3bhIrx5PRK90WNsQm4b6NujEGQuwgXlc=;
	b=WmnkntqrVjtbVL9rhRPZkD8dJqB0ZtjKLxb8yCVnDjSzHkOR0/sfatTe633pfK/iiHAf0d
	fOYAa0urixQTv2kVaPk3ZnoCr9KpAgPMFfGoC4rCGKAjEnLQGtuDLHPhtX9GF9jisbDuQ8
	5nQiCGZYdPeBDhpWUnW3UfIbXNInyONLzE8AoHPJZXjXLfaQP8nb4gqUWJPmQjzKOMgq9q
	27yL0cNFqdYGEeVD63e/WPUsLa58nsO3rl1mNHaqKMOBYZ9h3t/IyHz5O/MvfjfoNwJMM/
	TBbxSS/eSjcVK3uYR7+4Qcy0WR9JlnJ0/tOfy6EoC6bWnMPQN9pn2IBqblZZ6A==
Message-ID: <4f890538-f2f9-408b-9644-73708e7e7b24@mailbox.org>
Date: Wed, 31 Dec 2025 15:09:27 +0100
MIME-Version: 1.0
Subject: Re: [PATCH] arm64: dts: imx95: Use GPU_CGC as core clock for GPU
To: Rain Yang <jiyu.yang@oss.nxp.com>
Cc: Frank.li@nxp.com, conor+dt@kernel.org, devicetree@vger.kernel.org,
 festevam@gmail.com, imx@lists.linux.dev, kernel@pengutronix.de,
 krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org, peng.fan@nxp.com,
 robh@kernel.org, s.hauer@pengutronix.de, shawnguo@kernel.org
References: <aTACuRjC_Zpf8IOU@oss.nxp.com>
 <de36091e-c890-4897-b3e3-2a7575029a5d@mailbox.org>
 <aTD5np-HGaJqhzkD@oss.nxp.com>
 <5944d872-01a3-47e9-977b-029f3be4fd83@mailbox.org>
 <aTKVMAMQ6v_BwD6R@oss.nxp.com>
 <9b593731-898f-46a7-8ee5-68f8c170351c@mailbox.org>
 <aTYxm_dfMwF4H0_b@oss.nxp.com>
 <53ea529f-3538-4ab5-aa99-0caa6729b4cd@mailbox.org>
 <aVM-mSkSubMPd7Du@oss.nxp.com>
 <6055d6f3-2b31-4225-a42e-0f5ad79f7256@mailbox.org>
 <aVSTJdnWm2KfpXa1@oss.nxp.com>
Content-Language: en-US
From: Marek Vasut <marek.vasut@mailbox.org>
In-Reply-To: <aVSTJdnWm2KfpXa1@oss.nxp.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: bc2861c1611d36a4a05
X-MBO-RS-META: xs4hkq5sdw3gihc6abz8t11whgpf6x4w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251231_060938_895883_D4ECA1A6 
X-CRM114-Status: GOOD (  18.91  )
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

On 12/31/25 4:06 AM, Rain Yang wrote:
> On Tue, Dec 30, 2025 at 03:17:44PM +0100, Marek Vasut wrote:
>> On 12/30/25 3:53 AM, Rain Yang wrote:
>>> On Tue, Dec 30, 2025 at 02:53:38AM +0100, Marek Vasut wrote:
>>>> On 12/8/25 3:02 AM, Rain Yang wrote:
>>>>
>>>>>>> Okay, I’ll submit a patch later.
>>>>>>> The commit message should reflect that only CLK_GPU_CGC is enabled.
>>>>>>
>>>>>> The commit message , and this change , is unrelated to GPUAPB clock.
>>>>> The commit message is ambiguous. Could you clarify which parent clock
>>>>> you are referring to, and whether it can be enabled by CLK_GPU_CGC?
>>>>> If it was CLK_GPU, CLK_GPU_CGC can't be able to control it.
>>>>
>>>> The commit message clearly states "These new GPU_CGC clock
>>>> gate the existing GPU clock." and "GPU_CGC as well as its parent GPU clock."
>>>> , I don't perceive any ambiguity, sorry.
>>>>
>>>> Frankly, the whole GPUAPB discussion is entirely unrelated and it only stalls
>>>> application of this bugfix and keeps upstream broken. This is not helping.
>>>>
>>>> So unless there is anything in particular that is on-topic and prevents this
>>>> patch from being applied, it would be good to apply it, otherwise the GPU on
>>>> MX95 in mainline Linux is not working.
>>> Hi Marek,
>>>
>>> I’m not opposed to this patch being merged into mainline, but the commit
>>> message needs to be accurate. the parent CLK_GPU cannot be enabled or
>>> disabled externally. The last sentence should clearly state:
>>
>> Look here, this is what you can do with the MX95 SM:
>>
>> "
>>> $ clock.r
>> ...
>> 083: gpuapb               =  on,  133333333Hz
>> 084: gpu                  =  on,  800000000Hz
>> ...
>> 174: gpu_cgc              =  on,  800000000Hz
>>
>>> $ clock.w gpu_cgc off
>>> $ clock.w gpu off
>>> $ clock.w gpuapb off
>>
>>> $ clock.r
>> ...
>> 083: gpuapb               = off,  133333333Hz
>> 084: gpu                  = off,  800000000Hz
>> ...
>> 174: gpu_cgc              = off,  800000000Hz
>> "
>>
>> Notice how all clock are disabled, including GPU clock.
>>
>> That does not agree with your statement.
>>
>>> When the panthor driver enables the GPU core clock, it enables the GPU_CGC.
>>
>> It also enables all disabled parent clock in the process, which includes the
>> GPU clock.
>>
>>> This ensures the description reflects the actual hardware behavior and
>>> avoids confusion for future maintainers.
>>> Thanks for addressing this issue — once the commit message is corrected,
>>> I’m fine with this going in.
>>
>> See above.
> 
> Hi Marek,
> Based on the instructions you gave, I’d put it this way, even though the
> CLK_GPU clock can only be controlled internally.
> 
> I’m fine with your patch now.

Thank you

