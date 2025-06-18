Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34216C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=r0yXO5WKMtf/RbA0D78yHpcsjqHvAhoAVEOtzAC/jPY=; b=y/nQamGuDffVrfZTtkpUZzBY1y
	woJ58R3MieW7fnkiWn8iuha2gO6tohcn992Q1Y2qVt5GaOf39bY/kG90BQEWeIdq4AAZdc6xrD6cJ
	HXzndVvix9gQtJxz61/8GVP/pduAGY6ygFaLIqxC5ce7HgSqbYLorPZGFnhTJBxJ2WbkPewrqbSvh
	kQFrkLjqdah/DiDJAtl6B8ndDyBJJgjKVprxMiNrXp+mPuQYgmHIu3Owtts5HXFm+IbCc6FWFJs3A
	Wnzzu8FKyQw2FehxFDTauJXb8k/wJXKGgJyGDxILXqQtult8vZBTmas9F8FfU6Xt0xyFIL/yWFH5F
	ppTLFU2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyCc-0000000BAQE-0YcH;
	Wed, 18 Jun 2025 19:12:06 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRx2j-0000000AyGR-0pHR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:57:50 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0919D201C77F;
	Wed, 18 Jun 2025 10:57:48 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0919D201C77F
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1750269468;
	bh=r0yXO5WKMtf/RbA0D78yHpcsjqHvAhoAVEOtzAC/jPY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=YNMZ1E/Nk9DTKlQqpD5ZXxizjzYI42bYzR8A11MDi46jt5unNsGa46e2K6dxCZMXz
	 vn5GTQr067Iv+0A6vVey0uWLO0JXRxoUJUVBvTSE6dD2kDSZS9yy6ojZiw4U5Gwobu
	 3n/8ggSZ85M/0bzIBFTOxHFHUWWm187SV28xKxHo=
Message-ID: <bf0575c7-f78a-458c-b905-7baa7347c03f@linux.microsoft.com>
Date: Wed, 18 Jun 2025 10:57:47 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] firmware: smccc: support both conduits for getting hyp
 UUID
To: Anirudh Rayabharam <anirudh@anirudhrb.com>
Cc: sudeep.holla@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-hyperv@vger.kernel.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, mark.rutland@arm.com
References: <20250605-kickass-cerulean-honeybee-aa0cba@sudeepholla>
 <20250610160656.11984-1-romank@linux.microsoft.com>
 <aFKu9TFA6oj1N2cR@anirudh-surface.localdomain>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <aFKu9TFA6oj1N2cR@anirudh-surface.localdomain>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_105749_262155_9F718079 
X-CRM114-Status: GOOD (  18.97  )
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



On 6/18/2025 5:20 AM, Anirudh Rayabharam wrote:
> On Tue, Jun 10, 2025 at 09:06:48AM -0700, Roman Kisel wrote:
>>> (sorry for the delay, found the patch in the spam 🙁)
>>
>> "b4" shows the the mail server used for the patch submission
>> doesn't pass the DKIM check, so finding the patch in the spam seems
> 
> How do you check this? I mean, what b4 command do you run?
> 
> I think it should be fix now. Let's see...


"b4 am" was showing the failed DKIM check, and all good now!

| $ b4 am 20250521094049.960056-1-anirudh@anirudhrb.com
|
| Grabbing thread from 
lore.kernel.org/all/20250521094049.960056-1-anirudh@anirudhrb.com/t.mbox.gz
| Analyzing 7 messages in the thread
| Looking for additional code-review trailers on lore.kernel.org
| Checking attestation on all messages, may take a moment...
| ---
|   ✓ [PATCH] firmware: smccc: support both conduits for getting hyp UUID
|     + Reviewed-by: Sudeep Holla <sudeep.holla@arm.com>
|     + Tested-by: Roman Kisel <romank@linux.microsoft.com> (✓ 
DKIM/linux.microsoft.com)
|     + Reviewed-by: Roman Kisel <romank@linux.microsoft.com> (✓ 
DKIM/linux.microsoft.com)
|   ---
|   ✓ Signed: DKIM/anirudhrb.com
| ---
| Total patches: 1
| ---
|  Link: 
https://lore.kernel.org/r/20250521094049.960056-1-anirudh@anirudhrb.com
|  Base: applies clean to current tree
|        git checkout -b 20250521_anirudh_anirudhrb_com HEAD
|        git am 
./20250521_anirudh_firmware_smccc_support_both_conduits_for_getting_hyp_uuid.mbx
|


[...]
>> Anirudh had been OOF for some time and would be for another
>> week iiuc so I thought I'd reply.
> 
> Thanks Roman!

My pleasure :)

> 
> Regards,
> Anirudh
> 
>>
>> The patch this depends on is 13423063c7cb
>> ("arm64: kvm, smccc: Introduce and use API for getting hypervisor UUID"),
>> and this patch has already been pulled into the Linus'es tree.
>>
>> As for routing, (arm-)soc should be good it appears as the change
>> is contained within the firmware drivers path. Although I'd trust more to your,
>> Arnd's or Wei's opinion than mine!
>>
>>>
>>> --
>>> Regards,
>>> Sudeep

-- 
Thank you,
Roman


