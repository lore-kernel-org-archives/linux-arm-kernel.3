Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D7AFC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Feb 2025 11:33:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=agwkPsQh4b0DyXkYLYLuwktIP7TFr6q/buoiPBn5ggc=; b=IlhzOJRjl8bjlBf01c29DvZXVB
	6aYlUM4EJmvl7WmNR5i7PYqp4fF4Z96MFFTzySQZY9PapsAq6S6iX8vPJhGEG0+Fh9pNvK3XOLMv3
	n7jmSet39YOnGthxGh0TqoPy/F+FA2sZd8hXtwnjep6mj40BmvYC5rHbVVELQ8HszgngC7w5MZWIX
	aSM11RMKIBUp+910yW3/xWYg3Qx5YzwGDN9jQQPb9uSmvVnZAs5F8P/GGN8ahYTqWnKLRY3PwREPG
	jYPxgH+PbTnSP8QmGADgnQPENJQWDrwYvI8HHCb2hmn4XJdIoSIXI48ge8MeTBCln0sZIcw5dU3gE
	28iPi+uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWhl-0000000DPyb-0p2g;
	Mon, 24 Feb 2025 11:32:57 +0000
Received: from pegase2.c-s.fr ([93.17.235.10])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tmWVI-0000000DKD3-3WBj;
	Mon, 24 Feb 2025 11:20:06 +0000
Received: from localhost (mailhub3.si.c-s.fr [172.26.127.67])
	by localhost (Postfix) with ESMTP id 4Z1dQg35xWz9sSq;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from pegase2.c-s.fr ([172.26.127.65])
	by localhost (pegase2.c-s.fr [127.0.0.1]) (amavisd-new, port 10024)
	with ESMTP id reeUmV24E4zC; Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from messagerie.si.c-s.fr (messagerie.si.c-s.fr [192.168.25.192])
	by pegase2.c-s.fr (Postfix) with ESMTP id 4Z1dQg2BZFz9sSp;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from localhost (localhost [127.0.0.1])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id 2FFAC8B765;
	Mon, 24 Feb 2025 12:13:47 +0100 (CET)
X-Virus-Scanned: amavisd-new at c-s.fr
Received: from messagerie.si.c-s.fr ([127.0.0.1])
	by localhost (messagerie.si.c-s.fr [127.0.0.1]) (amavisd-new, port 10023)
	with ESMTP id kefUlrU39Hz9; Mon, 24 Feb 2025 12:13:47 +0100 (CET)
Received: from [10.25.207.138] (unknown [10.25.207.138])
	by messagerie.si.c-s.fr (Postfix) with ESMTP id C903F8B763;
	Mon, 24 Feb 2025 12:13:46 +0100 (CET)
Message-ID: <5e8a4dd9-50a8-4080-8d63-dbb8c7241b98@csgroup.eu>
Date: Mon, 24 Feb 2025 12:13:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/4] mm: Rename GENERIC_PTDUMP and PTDUMP_CORE
To: Anshuman Khandual <anshuman.khandual@arm.com>,
 Steven Price <steven.price@arm.com>, linux-mm@kvack.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
 Michael Ellerman <mpe@ellerman.id.au>, Nicholas Piggin <npiggin@gmail.com>,
 Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt
 <palmer@dabbelt.com>, Heiko Carstens <hca@linux.ibm.com>,
 Vasily Gorbik <gor@linux.ibm.com>, Thomas Gleixner <tglx@linutronix.de>,
 Ingo Molnar <mingo@redhat.com>, Andrew Morton <akpm@linux-foundation.org>,
 linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
 linuxppc-dev@lists.ozlabs.org, linux-riscv@lists.infradead.org,
 linux-s390@vger.kernel.org
References: <20250213040934.3245750-1-anshuman.khandual@arm.com>
 <20250213040934.3245750-5-anshuman.khandual@arm.com>
 <8e75c5ff-a97b-4a6f-9c8b-ac2598eafe60@arm.com>
 <6e1201a1-60c1-40a3-951f-d603b6341a11@csgroup.eu>
 <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Content-Language: fr-FR
From: Christophe Leroy <christophe.leroy@csgroup.eu>
In-Reply-To: <03b042ec-1cb7-4419-8741-c65e74e49d51@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250224_032005_055654_DE741671 
X-CRM114-Status: UNSURE (   9.36  )
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



Le 14/02/2025 à 08:26, Anshuman Khandual a écrit :
> 
> 
> On 2/13/25 17:19, Christophe Leroy wrote:
>>
>>
>> Le 13/02/2025 à 12:23, Steven Price a écrit :
>>> On 13/02/2025 04:09, Anshuman Khandual wrote:
>>>> Platforms subscribe into generic ptdump implementation via GENERIC_PTDUMP.
>>>> But generic ptdump gets enabled via PTDUMP_CORE. These configs combination
>>>> is confusing as they sound very similar and does not differentiate between
>>>> platform's feature subscription and feature enablement for ptdump. Rename
>>>> the configs as ARCH_HAS_PTDUMP and PTDUMP making it more clear and improve
>>>> readability.
>>>
>>> [...]
>>>> diff --git a/arch/powerpc/configs/mpc885_ads_defconfig b/arch/powerpc/configs/mpc885_ads_defconfig
>>>> index 77306be62e9e..db005618690b 100644
>>>> --- a/arch/powerpc/configs/mpc885_ads_defconfig
>>>> +++ b/arch/powerpc/configs/mpc885_ads_defconfig
>>>> @@ -78,4 +78,4 @@ CONFIG_DEBUG_VM_PGTABLE=y
>>>>    CONFIG_DETECT_HUNG_TASK=y
>>>>    CONFIG_BDI_SWITCH=y
>>>>    CONFIG_PPC_EARLY_DEBUG=y
>>>> -CONFIG_GENERIC_PTDUMP=y
>>>> +CONFIG_PTDUMP=y
>>>
>>> I'd suggest dropp this from the defconfig too, just like patch 1 dropped
>>> it from debug.config.
>>>
>>
>> Thanks for spotting that.
>>
>> That one is wrong. Was introduced by commit d210ee3fdfe8 ("powerpc/configs: Update config files for removed/renamed symbols") which aimed at fixing commit e084728393a5 ("powerpc/ptdump: Convert powerpc to GENERIC_PTDUMP") but it did it wrong.
>>
>> It is CONFIG_PTDUMP_DEBUGFS that is wanted.
> 
> Should this replacement be done in the series or would you like it
> to be handled in powerpc later ?

Yes I think you should do the replacement.

