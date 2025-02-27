Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6909BC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 00:08:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XAQJ9hVbCH22Qcmgm3BpIe9og2DlEBB/bE11Ejk0MI0=; b=wLUePkIvFD8meUsk4Vj7pXEL/t
	Gham4FDQlyOzxidobZpOYG6C+0VlqCTLC/+Pf/jlT4RJfNvoe4XM6nBiNbhRqwpVbBQ1LgXciqkjN
	mzxrhkjaxWKyyd2wWkn9FA6s544Ej6f8BrWpCWoOYXaget6NLTsSJ/wlXUqxmsg12zQ7B3mKpCT29
	e2wIeNA1kTGaMAJHPBxISxwUu488pD7ZJKzEnU7UZMyzbgKJy5Q/ZUyQVEMHu7dkkeZxnDjQMHiDk
	P9Y2cn71/smSQatouBxUwYg6bsrtZYC2m4XL069iyYXSwEkAEMSx9XlHYPWu64Z+zVyt9yipi89de
	83DC0XhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRRi-00000005m5j-3GnR;
	Thu, 27 Feb 2025 00:08:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnRQ9-00000005lp1-3Vp1;
	Thu, 27 Feb 2025 00:06:35 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5564812FC;
	Wed, 26 Feb 2025 16:06:48 -0800 (PST)
Received: from [10.163.39.237] (unknown [10.163.39.237])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F2DD63F5A1;
	Wed, 26 Feb 2025 16:06:25 -0800 (PST)
Message-ID: <39986b7d-7a82-4f28-9289-5620a2bec2b5@arm.com>
Date: Thu, 27 Feb 2025 05:36:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 5/5] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: linux-mm@kvack.org, Andrew Morton <akpm@linux-foundation.org>,
 Mark Rutland <mark.rutland@arm.com>,
 Christophe Leroy <christophe.leroy@csgroup.eu>, kvmarm@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org,
 linux-riscv@lists.infradead.org, linux-s390@vger.kernel.org,
 Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Marc Zyngier <maz@kernel.org>, Michael Ellerman <mpe@ellerman.id.au>,
 Nicholas Piggin <npiggin@gmail.com>, Paul Walmsley
 <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Heiko Carstens <hca@linux.ibm.com>, Vasily Gorbik <gor@linux.ibm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>
References: <20250226122404.1927473-1-anshuman.khandual@arm.com>
 <20250226122404.1927473-6-anshuman.khandual@arm.com>
 <Z79xK3xJWm0vH5jH@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z79xK3xJWm0vH5jH@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_160633_924520_F6D130D5 
X-CRM114-Status: GOOD (  11.31  )
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

 

On 2/27/25 01:23, Catalin Marinas wrote:
> On Wed, Feb 26, 2025 at 05:54:04PM +0530, Anshuman Khandual wrote:
>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>> index 6cf4aae05219..b2931d1ae0fb 100644
>> --- a/arch/arm64/include/asm/ptdump.h
>> +++ b/arch/arm64/include/asm/ptdump.h
>> @@ -7,7 +7,7 @@
>>  
>>  #include <linux/ptdump.h>
>>  
>> -#ifdef CONFIG_PTDUMP_CORE
>> +#ifdef CONFIG_PTDUMP
> 
> Do we need this #ifdef at all? I haven't tried but usually, if the
> feature is not enabled, the header file on its own should be harmless.

With or without the #ifdef CONFIG_PTDUMP in place here, this does not cause
any build warnings even without CONFIG_PTDUMP enabled. But dropping #ifdef
while renaming the config option itself, might have caused unrelated code
churn. So probably if required we could drop this later on.

> 
> For arm64:
> 
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

