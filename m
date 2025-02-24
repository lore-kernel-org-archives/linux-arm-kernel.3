Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8E89C021A6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 13:50:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pDq4bowWlNtsbGxlMOQr0ORJvI5CIykp22503yzMS2g=; b=Ld3wJk7ezNhGxcVGj8Us/dlM8h
	HI6bGcVLHT4QPefHmeHhtVQ+BRHPR0etHkOd6MKMxK1Wp11A3O67mE9GyLUwoAqnGWxFPiEBThx3t
	X8GuNEhGKw4yCmHWSRttlu+LETn9PWS5YF7pTgOoj7FV9rIxobklLGYIYuKslNrLl63Yv/RAjmLDw
	jtAJoRDJyvPfd+rgSt7givBMi7Fx/R6+17JGiW0YkhhKoG0sja541AZ7YtdM1Q9uUM9jK2auWFg5N
	6V0woFc02IgCMivSEoyuwOBIbgUkkRtv4XY1J6jkti81wAfZ4ijGWs4Tk42lfNBxVRt9m/O5W+FCQ
	/P8WLCQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYr1-0000000Dy4x-3rJM;
	Mon, 24 Feb 2025 13:50:39 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmYoh-0000000DxeN-0Am8;
	Mon, 24 Feb 2025 13:48:16 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 990B31515;
	Mon, 24 Feb 2025 05:48:30 -0800 (PST)
Received: from [10.163.40.148] (unknown [10.163.40.148])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 716D33F5A1;
	Mon, 24 Feb 2025 05:48:07 -0800 (PST)
Message-ID: <acc7eb95-a0d2-4f35-96a8-7a370cc1eff6@arm.com>
Date: Mon, 24 Feb 2025 19:18:02 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/5] arch/powerpc: Drop GENERIC_PTDUMP from
 mpc885_ads_defconfig
To: Christophe Leroy <christophe.leroy@csgroup.eu>, linux-mm@kvack.org
Cc: steven.price@arm.com, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Madhavan Srinivasan <maddy@linux.ibm.com>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>
References: <20250217042220.32920-1-anshuman.khandual@arm.com>
 <20250217042220.32920-3-anshuman.khandual@arm.com>
 <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <93e96586-13a2-4800-9dc7-5b35177a328e@csgroup.eu>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_054815_120715_6EDA8964 
X-CRM114-Status: UNSURE (   8.96  )
X-CRM114-Notice: Please train this message.
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



On 2/24/25 17:34, Christophe Leroy wrote:
> 
> 
> Le 17/02/2025 à 05:22, Anshuman Khandual a écrit :
>> GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
>> off from mpc885_ads_defconfig.
>>
>> Cc: Madhavan Srinivasan <maddy@linux.ibm.com>
>> Cc: Michael Ellerman <mpe@ellerman.id.au>
>> Cc: Nicholas Piggin <npiggin@gmail.com>
>> Cc: Christophe Leroy <christophe.leroy@csgroup.eu>
>> Cc: linuxppc-dev@lists.ozlabs.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Just wondering - Should CONFIG_PTDUMP_DEBUGFS be added instead ?
> 
> Yes please do that as a fix to commit e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")

Sure, does the following updated commit message look okay ?

arch/powerpc: Drop GENERIC_PTDUMP from mpc885_ads_defconfig

GENERIC_PTDUMP gets selected on powerpc explicitly and hence can be dropped
off from mpc885_ads_defconfig. Just add CONFIG_PTDUMP_DEBUGFS instead.

Fixes: e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP")
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>

> 
>>
>>   arch/powerpc/configs/mpc885_ads_defconfig | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
>> index 77306be62e9e..ea6f836407d2 100644
>> --- a/arch/powerpc/configs/mpc885_ads_defconfig
>> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
>> @@ -78,4 +78,3 @@ CONFIG_DEBUG_VM_PGTABLE=y
>>   CONFIG_DETECT_HUNG_TASK=y
>>   CONFIG_BDI_SWITCH=y
>>   CONFIG_PPC_EARLY_DEBUG=y
>> -CONFIG_GENERIC_PTDUMP=y
> 

