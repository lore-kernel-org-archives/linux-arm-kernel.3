Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08797D232F1
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Jan 2026 08:32:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H5FICVbCdpL28fxRZxhccvb+qo60S0uzBKWHTrHtW50=; b=AtNkq2+D02hFwhMAA5UbGkbFnK
	RKGkan7tg0lc2FSWYOfCnfGzNRfgUO6WrVzv3rUSycyvp3QdiMYdlcb8XKZrXZ75sS3pgbDp09qhs
	gEuNq9/yIyJvqXzhrQkgn8tOHKAXBNtohEN5E0L5c0+CRxdUU241KdhygAN0xgogFUXzKm7aZHlth
	KQPx7H+GG2EWHlXvmEJetgwK93FtaFRYZkZvW0xzOQWTkClq5649LUoCTf7wHhP2w/Yst21P69HR4
	XdHo+smVgPz3f+NnievRLJ/79YBLMKliGHBSicWC3iRe7GtI3k17NQPQnU9yNw1wb0dAnluvU5sPx
	gpKefCLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7v3-00000001ur2-1DrC;
	Fri, 09 Jan 2026 08:32:29 +0000
Received: from out30-112.freemail.mail.aliyun.com ([115.124.30.112])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ve7uy-00000001uqC-2eGM
	for linux-arm-kernel@lists.infradead.org;
	Fri, 09 Jan 2026 08:32:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=linux.alibaba.com; s=default;
	t=1767947535; h=Message-ID:Date:MIME-Version:Subject:To:From:Content-Type;
	bh=H5FICVbCdpL28fxRZxhccvb+qo60S0uzBKWHTrHtW50=;
	b=DM7J+SxLxkANJgLXHCwJyfkQ/DnkOAs3JErng4HZZhLz6DTMUmoF3ZSv+zju2sHvlMQiw3fG2F5Q9CnMeaHVyaFVJRjC6msoV/OTH/fKECVhk5W1JvtnDD2knjsVfkn9H2cj/IiBz/KtGcrScQxCga/Fgg5nUg3a6RVyuvoDBno=
Received: from 30.74.129.18(mailfrom:tongweilin@linux.alibaba.com fp:SMTPD_---0WwgBVo0_1767947533 cluster:ay36)
          by smtp.aliyun-inc.com;
          Fri, 09 Jan 2026 16:32:13 +0800
Message-ID: <f9d1c2d2-a6d9-47b7-9f1d-382a28bb88b8@linux.alibaba.com>
Date: Fri, 9 Jan 2026 16:32:12 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] arm64: Kconfig: enable ARCH_WANTS_THP_SWAP for all
 pagesizes
To: Barry Song <21cnbao@gmail.com>, Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, linux-mm@kvack.org,
 baolin.wang@linux.alibaba.com
References: <20251226063759.4020782-2-tongweilin@linux.alibaba.com>
 <CAGsJ_4zd+SMa4Mj23tjF5OwsP3LQyvYTrwN4y81=k8FSFgbH3Q@mail.gmail.com>
 <aV_3fxlzwOSz8B0t@willie-the-truck>
 <CAGsJ_4waQsxPKTcGvtpTAF4kVbYQXeH_iHaQX3aAYDNo-8oDLQ@mail.gmail.com>
Content-Language: en-US
From: Weilin Tong <tongweilin@linux.alibaba.com>
In-Reply-To: <CAGsJ_4waQsxPKTcGvtpTAF4kVbYQXeH_iHaQX3aAYDNo-8oDLQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_003226_280284_217AB747 
X-CRM114-Status: GOOD (  11.90  )
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


在 2026/1/9 07:11, Barry Song 写道:
> On Fri, Jan 9, 2026 at 7:29 AM Will Deacon <will@kernel.org> wrote:
>> On Fri, Dec 26, 2025 at 07:52:44PM +1300, Barry Song wrote:
>>> On Fri, Dec 26, 2025 at 7:39 PM Weilin Tong
>>> <tongweilin@linux.alibaba.com> wrote:
>>>> Currently, ARCH_WANTS_THP_SWAP was limited to 4K page size ARM64 kernels, but
>>>> large folios requiring swapping also exist in other page size configurations
>>>> (e.g. 64K). Without this config, large folios in these kernels cannot be swapped
>>>> out.
>>>>
>>>> Here we enable ARCH_WANTS_THP_SWAP for all ARM64 page sizes.
>>> I no longer recall why this was not enabled for sizes other than
>>> 4 KB in commit d0637c505f8a ("arm64: enable THP_SWAP for arm64"), but
>>> it appears to be fine, and the swap cluster size should also be
>>> more friendly to PMD alignment.
>> You seemed to be worried about I/O latency in your original post:
>>
>> https://lore.kernel.org/all/20220524071403.128644-1-21cnbao@gmail.com/
> Will, thanks for pointing this out! With a 16KB page size, a PMD
> covers 32MB; with 64KB pages, a PMD covers 512MB. So, Weilin, are
> we ready to wait for 32MB or 512MB to be written out before
> memory can be reclaimed? By splitting, we can reclaim memory
> earlier while only part of it has been swapped out.

I got your point. In our production envs using 64K pagesize kernel, we 
only enable 2M and below size

mthp, so swapping out as a whole is a better way. Or maybe we can set 
the SWAPFILE_CLUSTER by arch.

I will do some tests of this concern.

Thanks a lot.

> While splitting down to order-0 is not ideal, splitting to a
> relatively larger order appears to strike a balance between I/O
> latency and swap performance. Anyway, I don't know :-)
>
> Thanks
> Barry

