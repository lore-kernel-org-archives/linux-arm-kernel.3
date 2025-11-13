Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 563EECD5BA0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 09:09:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vMttMlk5U7Cky1BrHipanjy9/tMXuNemUExNF7IHqD4=; b=4VJG01LBGEGfUSVHI9k1CmgzTc
	etcp68inTJ2lUGSXIX9iho+LuM0TTBail8Qcg3bU0xjkEAMxtGQiZ+qW4evsiltHuTlmzh2VxtzVu
	O+o89u5d37hpicL789bGSNZLpLroakUdLtFlyZIYaoqjqYU2MqJE/Rtvon38I60BU36qa9L8xUS4e
	YurrIBArSeAFWT6dF5W4lqC52Ou17+w6psYkDbrr5NwaUGkmWUUJqMSXyKim0SFZd8I0n+vaPoDsu
	B9+Qr9bbpORcTQ/uN2NYiUA7I+1pIEzCg9NXVTtIYmh9Dt3gAdV0AVrzn+4aayJ8EgOZUMXA+Tehe
	GQQMweig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTKk-0000000AALg-1jrI;
	Thu, 13 Nov 2025 09:09:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJTKh-0000000AAL8-37YU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 09:09:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0013B12FC;
	Thu, 13 Nov 2025 01:09:23 -0800 (PST)
Received: from [10.163.74.57] (unknown [10.163.74.57])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB693F66E;
	Thu, 13 Nov 2025 01:09:27 -0800 (PST)
Message-ID: <dbc890f8-7105-4da5-a6fd-6f7b3a2b7147@arm.com>
Date: Thu, 13 Nov 2025 14:39:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V6 1/3] tools: header: arm64: Replace TCR_NFD[0|1] with
 TCR_EL1_NFD[0|1]
To: Leo Yan <leo.yan@arm.com>, Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-kernel@vger.kernel.org, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 kvmarm@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 Arnaldo Carvalho de Melo <acme@redhat.com>,
 Namhyung Kim <namhyung@kernel.org>
References: <20251013052945.2197190-1-anshuman.khandual@arm.com>
 <20251013052945.2197190-2-anshuman.khandual@arm.com>
 <aQjm7wmvHa79hkyi@arm.com> <20251103180350.GZ281971@e132581.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251103180350.GZ281971@e132581.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_010935_827362_687C3187 
X-CRM114-Status: GOOD (  14.85  )
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



On 03/11/25 11:33 PM, Leo Yan wrote:
> On Mon, Nov 03, 2025 at 05:31:27PM +0000, Catalin Marinas wrote:
>> On Mon, Oct 13, 2025 at 10:59:43AM +0530, Anshuman Khandual wrote:
>>> Replace TCR_NFD[0|1] (used in TCR_CLEAR_FUJITSU_ERRATUM_010001) with field
>>> definitions which are available in tool sysreg format. Helps in completely
>>> dropping off the adhoc TCR_NFD[0|1] macros later.
>>>
>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>> Cc: Will Deacon <will@kernel.org>
>>> Cc: Arnaldo Carvalho de Melo <acme@redhat.com>
>>> Cc: Namhyung Kim <namhyung@kernel.org>
>>> Cc: Leo Yan <leo.yan@arm.com>
>>> Cc: linux-kernel@vger.kernel.org
>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>> ---
>>>  tools/arch/arm64/include/asm/cputype.h | 2 +-
>>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/tools/arch/arm64/include/asm/cputype.h b/tools/arch/arm64/include/asm/cputype.h
>>> index 139d5e87dc95..dfa12df5e290 100644
>>> --- a/tools/arch/arm64/include/asm/cputype.h
>>> +++ b/tools/arch/arm64/include/asm/cputype.h
>>> @@ -243,7 +243,7 @@
>>>  /* Fujitsu Erratum 010001 affects A64FX 1.0 and 1.1, (v0r0 and v1r0) */
>>>  #define MIDR_FUJITSU_ERRATUM_010001		MIDR_FUJITSU_A64FX
>>>  #define MIDR_FUJITSU_ERRATUM_010001_MASK	(~MIDR_CPU_VAR_REV(1, 0))
>>> -#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_NFD1 | TCR_NFD0)
>>> +#define TCR_CLEAR_FUJITSU_ERRATUM_010001	(TCR_EL1_NFD1 | TCR_EL1_NFD0)
>>
>> Isn't this file usually updated automatically (well, someone running a
>> script to sync) from the corresponding arch/arm64/ one?
> 
> Yes, usually perf tools maintainers (Arnaldo or Namhyung) will sync
> headers in tools.
> 
> Seems to me, it is also fine to send this patch.  Please kindly remind
> perf maintainers after the kernel changes have been merged, so it is
> safe for picking up the change in tools.
> 
> BTW, I built the perf with this series and did not see any issue.

Agreed. I have not seen any problem around this as well.

