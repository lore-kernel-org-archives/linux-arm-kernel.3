Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CF39E8FDA5
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 08:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yfHDUPHLpb//CYvTTsSDlTKvWibGdWvqGHEMZe8sFu8=; b=eNuotVXQiYwbfRkJ0KJE5OWwAM
	Z9H+QJaoorczbFrM3LB8dYFb+vrgvyJ5ufXlXiZBC0O5g0g0p+6Zyn4Aq4a2KNw+JxsYI+ZeoEw2N
	Mph2KULGmbq/vJge6IgE381adTk+T8Ty4NMSv58wnKoDV9MY3nio8tbGf5viwpyCJGb/N7W4YSrM9
	tU0pT9s0b+ZAF8bPk6u89/h3FmGIEz7PpYET3kljqxJSTkMKYo55LQzWZENNUzpSPqs/xYH4dGRr2
	B/g64B1NReh6Xl1YbbrA32wsIxTrhYXjIlBtyZ4dPRrvBv6w9c8RmmNElAdyW6zzN807dp7Dz7Rlt
	W2gHn3Ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3NF-000000012sL-1kcY;
	Fri, 26 Dec 2025 08:40:37 +0000
Received: from out30-111.freemail.mail.aliyun.com ([115.124.30.111])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ3ND-000000012rr-0HQK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 08:40:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1766738432; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=yfHDUPHLpb//CYvTTsSDlTKvWibGdWvqGHEMZe8sFu8=;
	b=Df5ZsSSQoMI56ae9lFt4TnQ1Kv7bzapIu1MCqaMtuM0GPKJ3HeT8lAWsO3vFcmmO+w7KVvteOkF5KUxyD1ajc5egA78ywCEPq58wpsiaita0fzPbXAfe9QBtHaiGKaz8x2rj4erypaTj6mKNpshi07/sNQg7urzAECYUVd/svtw=
Received: from 30.74.129.66(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0Wvh15pX_1766738431 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 26 Dec 2025 16:40:32 +0800
Message-ID: <a91e09e5-9735-4539-ba83-661674e7f728@linux.alibaba.com>
Date: Fri, 26 Dec 2025 16:40:31 +0800
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
 <915dc88b-9131-4520-a2f2-facadc887bbd@linux.alibaba.com>
 <CAGsJ_4yQtFK8wtMuJ72ce8KFRT7mB4SZxqS1MKi6RA1WDNkm1Q@mail.gmail.com>
Content-Language: en-US
From: Weilin Tong <tongweilin@linux.alibaba.com>
In-Reply-To: <CAGsJ_4yQtFK8wtMuJ72ce8KFRT7mB4SZxqS1MKi6RA1WDNkm1Q@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_004035_395346_F2D4B77E 
X-CRM114-Status: GOOD (  13.18  )
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


在 2025/12/26 16:31, Barry Song 写道:
> On Fri, Dec 26, 2025 at 9:18 PM Weilin Tong
> <tongweilin@linux.alibaba.com> wrote:
>>
>> 在 2025/12/26 14:52, Barry Song 写道:
>>
>> On Fri, Dec 26, 2025 at 7:39 PM Weilin Tong
>> <tongweilin@linux.alibaba.com> wrote:
>>
>> Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels, but
>> large folios requiring swapping also exist in other page size configurations
>> (e.g. 64K). Without this config, large folios in these kernels cannot be swapped
>> out.
>>
>> Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
>>
>> I no longer recall why this was not enabled for sizes other than
>> 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
>> it appears to be fine, and the swap cluster size should also be
>> more friendly to PMD alignment.
>>
>>
>> #ifdef CONFIG_THP_SWAP
>> #define SWAPFILE_CLUSTER        HPAGE_PMD_NR
>> #define swap_entry_order(order) (order)
>> #else
>> #define SWAPFILE_CLUSTER        256
>> #define swap_entry_order(order) 0
>> #endif
>>
>>
>> Thank you very much for taking the time to review this patch during the holiday. Wishing you a happy holiday as well!
>>
>> I appreciate you pointing out this optimization. We initially noticed the issue because, on ARM64 kernels with 64K page size, if large folios are used in shmem, they cannot be swapped out as a whole during shmem_writeout() due to the config limitation,
>> and are forced to split instead—which is something we wanted to avoid.
>>
>> It seems that this change will help enable better swap operations for large folios. Thank you again for your feedback!
> Right, I believe this is the correct direction. Just double-check that
> the MTE-related functionality works. Take a look at commit
> f238b8c33c6738 ("arm64: mm: swap: support THP_SWAP on hardware with MTE").
Thanks, I will take a look.

