Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E66CE8FDA1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 08:31:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6MFpTUQOIiVw73r2AMb2gz8612oplsZa5lGVUR7l7Qo=; b=ZnwyvewjKS1MdrFCMCGGh7M36o
	04Mog/w5tezp4rtp7U7C2SGsIggEdGPWpilkYTiudD6Z3b/LC8hHgBgtkcJlF8/s7wZzTx1JTilL/
	nA4oTXXRStBXktfqkR+uKvEge6rsbrhcE7+kaeMuq4sQLDz4KzFhfEbG+UOUDfg4ASUsLbR8M0tBz
	ax7o6atQVLIueDwUtTCqXkSHHdBoociQhlPYyQMlnwrmNAaPFfgPcaQ6MWDIlGEUfaBu9xptDiK9e
	czuDtdxJCwElhIoUmkh9gzL4sH2bKN17zO43xmaGqcxXC2/L0FixNA0+tJ6OrIOJFdbsWEHhkgnZJ
	HU0E4tkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3EN-0000000126F-2RTq;
	Fri, 26 Dec 2025 08:31:27 +0000
Received: from out30-131.freemail.mail.aliyun.com ([115.124.30.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3EK-0000000125U-2eAK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 08:31:26 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766737879; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=6MFpTUQOIiVw73r2AMb2gz8612oplsZa5lGVUR7l7Qo=;
	b=PPgFFT5Vlwp/Rn3NYafmyQ79tK8axAsDHtRFTVNUJc5em/uE2OeGh+iZcvgGxdKUxDFwbtnA6aXBQN6eTcE5jRmI49Nrnfck8WTkRaqaK4JMmuQ/hUNuI0tJaSlcHFs+FPTCcoE0QQZeq6tlV6D4gG93n1J+QL+DbRo1mOzKcoo=
Received: from 30.74.129.66(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0WvgxF.J_1766737878 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 26 Dec 2025 16:31:18 +0800
Message-ID: <bb9592cf-bb3a-4679-8dfb-973fa6e84bad@linux.alibaba.com>
Date: Fri, 26 Dec 2025 16:31:18 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all
 pagesizes
To: Barry Song <21cnbao@gmail.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
 <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
Content-Language: en-US
From: Weilin Tong <tongweilin@linux.alibaba.com>
In-Reply-To: <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_003125_296608_C155936F 
X-CRM114-Status: GOOD (  16.37  )
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


在 2025/12/26 14:52, Barry Song 写道:
> On Fri, Dec 26, 2025 at 7:39 PM Weilin Tong
> <tongweilin@linux.alibaba.com> wrote:
>> Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels, but
>> large folios requiring swapping also exist in other page size configurations
>> (e.g. 64K). Without this config, large folios in these kernels cannot be swapped
>> out.
>>
>> Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
> I no longer recall why this was not enabled for sizes other than
> 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
> it appears to be fine, and the swap cluster size should also be
> more friendly to PMD alignment.
>
>
> #ifdef CONFIG_THP_SWAP
> #define SWAPFILE_CLUSTER        HPAGE_PMD_NR
> #define swap_entry_order(order) (order)
> #else
> #define SWAPFILE_CLUSTER        256
> #define swap_entry_order(order) 0
> #endif
Thank you very much for taking the time to review this patch during the 
holiday.
Wishing you a happy holiday as well!

I appreciate you pointing out this optimization. We initially noticed 
the issue because,
on ARM64 kernels with 64K page size, if large folios are used in shmem, 
they cannot be
swapped out as a whole during shmem_writeout() due to the config 
limitation, and are forced
to split instead — which is something we wanted to avoid.

It seems that this change will help enable better swap operations for 
large folios.
Thank you again for your feedback!

>> Signed-off-by: Weilin Tong <tongweilin@linux.alibaba.com>
>> ---
>>   arch/arm64/Kconfig | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/Kconfig b/arch/arm64/Kconfig
>> index 93173f0a09c7..58f7b4405f81 100644
>> --- a/arch/arm64/Kconfig
>> +++ b/arch/arm64/Kconfig
>> @@ -120,7 +120,7 @@ config ARM64
>>          select ARCH_WANT_LD_ORPHAN_WARN
>>          select ARCH_WANTS_EXECMEM_LATE
>>          select ARCH_WANTS_NO_INSTR
>> -       select ARCH_WANTS_THP_SWAP if ARM64_4K_PAGES
>> +       select ARCH_WANTS_THP_SWAP
>>          select ARCH_HAS_UBSAN
>>          select ARM_AMBA
>>          select ARM_ARCH_TIMER
>> --
>> 2.43.7
> Thanks
> Barry

