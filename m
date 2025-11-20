Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F05CF855C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=R/b+pXcONzaAwpHK65sNK2GPY9yFBtCf/yLAAMNn59M=; b=m1BszN2dBT77tNpvLEtwLVd+jK
	JS4dNpvVmpDFcMpzjBzFhFBgnKm9Hbvxa8gnQpeArthSX1UnM1hIKAkpS2GYYxrLpZ6TbqpFwo3P6
	Xeul4o0pcZQa8z0hs7tyw0DQKc3cSSefTvReIdghw7lynE/DlMziQdLx5Q8iqr/u0bSwkoO5GlJQG
	cwDJpJXNYxTayJ9J0KKhgwObD/gLPPxLOQw4fatUk7mW5Q0DU7Y5hWs2uHR1tWz7BW+juoIkxIFzp
	7mgu1PiFcyKrgZi+dJhpLqKw0nTlVQEnBXJH8EnTbbmKF51ljtZSN9UyQ4XqX0w11AUdRxnMMTkvZ
	5GIs4o+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0BK-00000006Mrs-0Kvq;
	Thu, 20 Nov 2025 08:38:22 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vM0BH-00000006MrV-2EbA
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 08:38:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3C8882B;
	Thu, 20 Nov 2025 00:38:10 -0800 (PST)
Received: from [10.57.87.93] (unknown [10.57.87.93])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C6FAC3F740;
	Thu, 20 Nov 2025 00:38:16 -0800 (PST)
Message-ID: <33623c93-2d65-4f6f-acf0-7ceb15f36006@arm.com>
Date: Thu, 20 Nov 2025 08:38:15 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v2 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, cl@gentwo.org,
 catalin.marinas@arm.com, will@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251023215210.501168-1-yang@os.amperecomputing.com>
 <3af5d651-5363-47f7-b828-702d9a0c881c@arm.com>
 <0bb112c7-1ed0-4ee1-a1df-6a7d4b224fb6@os.amperecomputing.com>
 <6a3c7a5a-fcb4-4a46-b385-74153f78337a@arm.com>
 <0fb97638-a678-4afc-9d96-cb1b95fc2194@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <0fb97638-a678-4afc-9d96-cb1b95fc2194@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251120_003819_709400_F952E248 
X-CRM114-Status: GOOD (  19.02  )
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


>>>> I have a long-term aspiration to enable "per-process page size", where each
>>>> user
>>>> space process can use a different page size. The first step is to be able to
>>>> emulate a page size to the process which is larger than the kernel's. For that
>>>> reason, I really dislike introducing new ABI that exposes the geometry of the
>>>> kernel page tables to user space. I'd really like to be clear on what use case
>>>> benefits from this sort of information before we add it.
>>> Thanks for the information. I'm not sure what "per-process page size" exactly
>>> is. But isn't it just user space thing? I have hard time to understand how
>>> exposing kernel page table geometry will have impact on it.
>> It's a feature I'm working on/thinking about that, if I'm honest, has a fairly
>> low probability of making it upstream. arm64 supports multiple base page sizes;
>> 4K, 16K, 64K. The idea is to allow different processes to use a different base
>> page size and then actually use the native page table for that size in TTBR0.
>> The idea is to have the kernel use 4K internally and most processes would use 4K
>> to save memory. But performance critical processes could use 64K.
> 
> Aha, I see. I thought you were talking about mTHP. IIUC, userspace may have 4K,
> 16K or 64K base page size, but kernel still uses 4K base page size? Can arm64
> support have different base page sizes for userspace and kernel? It seems
> surprising to me if it does. 

Yes arm64 supports exactly this; User page tables are mapped via TTBR0 and
kernel page tables are mapped via TTBR1. They are both independent structures
and base page size can be set independently.

> If it doesn't, it sounds you need at least 3 kernel
> page tables for 4K, 16K and 64K respectively, right?

No; for my design, the kernel always uses a 4K page table. Only user space page
tables have different sizes.

> 
> I'm wondering what kind usecase really needs this. Isn't mTHP good enough for
> the most usecases? We can have auto mTHP size support on per VMA basis. If I
> remember correctly, this has been raised a couple of times when we discussed
> about mTHP. Anyway this may be a little bit off the topic.

There is still a performance gap between 4K+CONT vs 64K. There are basically 4
aspects that affect HW performance as the base page size gets bigger:

 - TLB reach (how much memory a single TLB entry can describe)
 - Walk cache reach (how much memory a single walk cache entry can describe)
 - number of levels of look up (how many loads are required for full table walk)
 - data cache efficiency (how efficiently the mappings are described in memory)

4K+CONT (i.e. 64K-sized mTHP) only solves the first item.

But as I said, I think there is a high risk of this not actually going anywhere...

Thanks,
Ryan


