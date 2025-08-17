Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87F9ECA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 17 Aug 2025 16:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=05X/I2SqxVTRC5UNwPe0jX77RC5+lAMs+Sp0TwX0JKY=; b=OQDMX8bonZcbYTQm0r2mMkdCSt
	FBpbebKQVSA36vTpp/TdQ1vyvv72gEmAwDOgXJhrbaa0yxPlkWjrc54//7pG9QCd+fDARwLnb8JQR
	3AsKO+5VaQt8z+oWc8qdHRm1B28aWv7FpVZaZDViRlrLB6tk3n6sc/x3p4hjFPrtZvzscxz/9sjMi
	MQgWvhVtFHU3XmwLSpRUWd+a78D54n3Fbud2ZThdle9urHG+fO1Dl1Ph+yWxJqSFgMGdZV9ANj5ge
	PYJTcfOdSicDfLgUU9AbuUIO7vzAI9RgfJnXhxkGm+IiR7FQ4p9nGd/Z+zcTkeyzuHo9B5nHRk17J
	KLDEUhNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ungMj-00000005qos-13wF;
	Sun, 17 Aug 2025 16:36:17 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ungK9-00000005qgV-1CBy
	for linux-arm-kernel@lists.infradead.org;
	Sun, 17 Aug 2025 16:33:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1755448417;
 bh=05X/I2SqxVTRC5UNwPe0jX77RC5+lAMs+Sp0TwX0JKY=;
 b=An7YqUN01dZkAYUErIciC1BcGWEP10XWnRIKMMmZnAdcoAXNC3x7CeAWRDtB5y/x3vwCXROl+
 A5twy3BBeEc7kqI1TsVk4ehCB17Al42M9OO3og+5y//fVpiDlLVsbJjGm03wgxFAz0vyquG2FBM
 N85nWAx6HdMaOYOSK3X3BvTGPncN1rKLQ/DDTU5ZfS1c731mkRm+198RbxEuKIqbMcIOdB3TgYC
 XaQ3YFAasIlMiUYkZ5rMqNPNJiQVYv6z2DtRlZfIPuOGfCpcBMhw2bAF9L9641tJDWg5uDXJ/co
 MfUhwtpIoH6boKAJFtmRonqgLSMKD0/zHddeuwcf3q+Q==
X-Forward-Email-ID: 68a204589a82a81f459cf7d1
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.4
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <f55f6c64-f720-437b-ac88-80b6930a9c2c@kwiboo.se>
Date: Sun, 17 Aug 2025 18:33:24 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 0/7] media: rkvdec: Add HEVC backend
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
 Detlev Casanova <detlev.casanova@collabora.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>, Alex Bee <knaerzche@gmail.com>,
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20250810212454.3237486-1-jonas@kwiboo.se>
 <50162371fd54fc976a84fcf57c9b69112a892c46.camel@collabora.com>
 <1dd29158-0660-4254-ac00-1316768d9b82@kwiboo.se>
 <91864a1c047d2bdfce202b070716a694ede47d5e.camel@collabora.com>
 <a66feb89fa02f05b187e5603ffc3b1501ef3cbd5.camel@collabora.com>
 <efdf8c99-d166-4b78-afc5-d4a6eb5ac046@kwiboo.se>
 <25ce30446e8e8d038273fcdfb398c90995c242db.camel@collabora.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <25ce30446e8e8d038273fcdfb398c90995c242db.camel@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250817_093337_360260_D61FC6B2 
X-CRM114-Status: GOOD (  21.47  )
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

Hi Nicolas,

On 8/12/2025 8:26 PM, Nicolas Dufresne wrote:
> Hi Jonas,
> 
> Le mardi 12 août 2025 à 19:31 +0200, Jonas Karlman a écrit :
>> On 8/12/2025 2:44 PM, Nicolas Dufresne wrote:
>>> I forgot, 
>>>
>>> Le mardi 12 août 2025 à 08:38 -0400, Nicolas Dufresne a écrit :
>>>>> JCT-VC-HEVC_V1 on GStreamer-H.265-V4L2SL-Gst1.0:
>>>>>
>>>>> - DBLK_D_VIXS_2 (fail)
>>>>> - DSLICE_A_HHI_5 (fail)
>>>>> - EXT_A_ericsson_4 (fail)
>>>>> - PICSIZE_A_Bossen_1 (error)
>>>>> - PICSIZE_B_Bossen_1 (error)
>>>>> - PICSIZE_C_Bossen_1 (error)
>>>>> - PICSIZE_D_Bossen_1 (error)
>>>>> - SAODBLK_A_MainConcept_4 (fail)
>>>>> - SAODBLK_B_MainConcept_4 (fail)
>>>>> - TSUNEQBD_A_MAIN10_Technicolor_2 (error)
>>>
>>> I'me getting the same result if I force a single job in fluster. The test I
>>> posted was with 2 jobs. Detlev found that the iommu reset is required in
>>> more
>>> cases on RK3588/3576, perhaps the HEVC decoder in older hardware needs the
>>> same,
>>> I will try and report.
>>
>> Vendor kernel [1] check following bits from RKVDEC_REG_INTERRUPT reg to
>> decide if a full HW reset should be done.
>>
>>   err_mask = RKVDEC_BUF_EMPTY_STA
>>   	   | RKVDEC_BUS_STA
>>   	   | RKVDEC_COLMV_REF_ERR_STA
>>   	   | RKVDEC_ERR_STA
>>   	   | RKVDEC_TIMEOUT_STA;
>>
>> Adding proper reset support can be rather involved and main reason why
>> this series does not handle it, better suited for a separate future
>> series.
>>
>> Proper HW reset will require e.g. dt-bindings, DT updates, pmu idle
>> request integration and for rk3328 vendor even moved VPU reset to TF-A.
>>
>> Doing the iommu detach/attach dance not only on RKVDEC_SOFTRESET_RDY
>> could possible improve some cases, until full reset can be implemented.
> 
> Rockchip is following VSI design of "self reset" on error. But since the iommu
> is part of the device, it also gets reset, which imply having to reprogram it.
> This showed to be very reliable logic, despite RK doing a hard reset.
> 
> Since self reset is documented for RKVDEC_BUS_STA, RKVDEC_ERR_STA,
> RKVDEC_TIMEOUT_STA, it would seem that RKVDEC_BUF_EMPTY_STA is redundant, unless
> its asynchronous operation that need to be polled. Possibly something to
> investigate. RKVDEC_BUF_EMPTY_STA and RKVDEC_COLMV_REF_ERR_STA are not
> documented a such, so its not quite logical to reprogram the iommu.
> 
> I don't immediately trust reference software for these type of things, we should
> find what works best and have a rationale for. The hard reset is every
> expensive, and hard to upstream.

I fully agree, and I tried a few things like issue iommu reset for more
errors, skip use of iommu completely, disable use of performance cache,
write 0 all regs before writing correct values and nothing seem to
resolve this issue.

So more investigation will be needed to fully understand what we need to
do to get a more reliable result.

Will do a visual inspection of the decoded frames on the tests that is
flaky to see if that can give any clue on the extend of the issue.

Regards,
Jonas

> 
> Nicolas
> 
>>
>> [1]
>> https://github.com/Kwiboo/linux-rockchip/blob/linux-6.1-stan-rkr6.1/drivers/video/rockchip/mpp/mpp_rkvdec.c#L924-L931
>>
>> Regards,
>> Jonas
>>
>>>
>>> Nicolas


