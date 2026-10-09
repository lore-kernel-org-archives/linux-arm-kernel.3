Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE78ACA601D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 15:02:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:References:In-Reply-To:Subject:CC:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WT1TICo2rkfhE1iJ8fY63iMW9zh2L4xBrb9qLgmRBwA=; b=Bw1BUdO2uDsjf2oB8VcHttJd3L
	jqXStndOGaVfrEGcNIEawqBd8l6k/MzDB727F5Vo/O4o/xUsgxxyw3NmGuPlJAT3ZHy8gfu1CtTZd
	6MRUxMG6sh1WI+VnAmcvTdTVHfRCE4NsOvzFNHHhQjLJAbtDR86BzbpjJcWYJXgGFzxTXcAqNM+wj
	VZv3TvZDgKkthwnCcQOcZE5InD63eXZIU1iK3AMn5K6SEXJMPbLOKfiEdDJ/hUiRgDSqVgza+UKYV
	Q8GWjskmyNkyh+Rxc7oq1/zeLMfOTwSWcVBejy4rVBUcxnTQnFlGbnHgezpvj/titeWTJhS2a8WAl
	U8pKCTDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFC6g-00000006Vyd-0YtP;
	Fri, 09 Oct 2026 15:01:58 +0000
Received: from mail.mainlining.org ([5.75.144.95])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFC6W-00000006Vy0-01Pf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Oct 2026 15:01:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; s=202507r; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791558090; bh=WT1TICo2rkfhE1iJ8fY63iM
	W9zh2L4xBrb9qLgmRBwA=; b=BjFweyac1p5tAz1YeabQbvkt+V/AF5z9yPXK2qjrcrLL6zt+Yi
	XkQAB7f9UP3k5sjpwrTHOzCdZ38a9bC/qqoNG8QZVUossvb6++GVXFfhxeFKPtiigYL8wZopmk9
	eHHUVyXA0LcfirDuVOZ+4eRMUOZj4sJ/Ly0IvalPH9vNYTnjcVH5ySpWhH4RRFLor+S5psKZvF9
	vl2sbJWf5fe5czmXrDiy61/jwgHNJtVhdRy3Qhe0yAW6njKI/Jr9CDOm7ReM8v1c8ZDDBPoRG8D
	a2yNCMexdEDPS9ucCkh/LQyt9RYvnmsDNOFC2j8fGu2JDoZaScRxr0G/XPgR6+YL8cg==;
DKIM-Signature: v=1; a=ed25519-sha256; s=202507e; d=mainlining.org; c=relaxed/relaxed;
	h=Message-ID:Subject:To:From:Date; t=1791558090; bh=WT1TICo2rkfhE1iJ8fY63iM
	W9zh2L4xBrb9qLgmRBwA=; b=sF5yJVMnyEVApSe2Uhv7dFgwOOj9nUlQVCiZ1b0/nmBAqMrkEW
	2XnXifdDenpNBn2UeGKedzYYgRXoQD81IIDQ==;
Date: Fri, 09 Oct 2026 16:01:30 +0100
From: Bradley Morgan <brads@mainlining.org>
To: Vladimir Murzin <vladimir.murzin@arm.com>, catalin.marinas@arm.com,
 will@kernel.org
CC: mark.rutland@arm.com, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Subject: =?US-ASCII?Q?Re=3A_=5BPATCH_RESEND=5D_arm64=3A_entry=3A_drop_the_u?=
 =?US-ASCII?Q?nused_tmp2_argument_of_mte=5Fset=5Fkernel=5Fgcr=28=29?=
In-Reply-To: <c53b373b-9f70-42f0-affc-6978f0508b87@arm.com>
References: <20261007185512.2.mte-tmp2@mainlining.org> <c53b373b-9f70-42f0-affc-6978f0508b87@arm.com>
Message-ID: <7414D867-A850-46E4-9145-DE4A4A5FAFAE@mainlining.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261009_080148_260508_53D30900 
X-CRM114-Status: GOOD (  10.14  )
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

On 9 October 2026 11:37:45 BST, Vladimir Murzin <vladimir.murzin@arm.com>
wrote:
>On 10/7/26 18:45, Bradley Morgan wrote:
>> mte_set_kernel_gcr() takes a tmp2 argument the macro never uses. It
>> used to, the body passed \tmp and \tmp2 to mte_set_gcr, then
>> commit 82868247897b ("arm64: kasan: mte: use a constant kernel
>> GCR_EL1 value") swapped that for
>> 
>>     mov     \tmp, KERNEL_GCR_EL1
>> 
>> and tmp2 stayed in the declaration and in the one caller, which
>> passes x23 for it.
>> 
>> Drop it, both places.
>> 
>> Signed-off-by: Bradley Morgan <brads@mainlining.org>
>> ---
>> Resending, the first send's body got mangled.
>> 
>>  arch/arm64/kernel/entry.S | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/arch/arm64/kernel/entry.S b/arch/arm64/kernel/entry.S
>> index f63049ac32dc..c3106dee61e1 100644
>> --- a/arch/arm64/kernel/entry.S
>> +++ b/arch/arm64/kernel/entry.S
>> @@ -171,7 +171,7 @@ alternative_else_nop_endif
>>  #endif
>>  	.endm
>>  
>> -	.macro mte_set_kernel_gcr, tmp, tmp2
>> +	.macro mte_set_kernel_gcr, tmp
>>  #ifdef CONFIG_KASAN_HW_TAGS
>>  alternative_cb	ARM64_ALWAYS_SYSTEM, kasan_hw_tags_enable
>>  	b	1f
>> @@ -258,7 +258,7 @@ alternative_else_nop_endif
>>  
>>  	apply_ssbd 1, x22, x23
>>  
>> -	mte_set_kernel_gcr x22, x23
>> +	mte_set_kernel_gcr x22
>>  
>>  	/*
>>  	 * Any non-self-synchronizing system register updates required for
>> -- 2.53.0
>> 
>
>Reviewed-by: Vladimir Murzin <vladimir.murzin@arm.com>


cheers, sorry for the oopsie on 1/1

--- Thanks!
"I'm not a very positive person" - Linus torvalds

