Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CB12C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 May 2025 12:00:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LyJ1jrcuBjyD0erI/sIvdiDxLNsydKh62Md2c5GBiwQ=; b=gC/RTtvYQlnq2os1okSWreFMLt
	9wH6DzBh/L/c/JIhIoNbWI4ZEUMJzSrWqUvm2s4LQZccSY0ek2n9TcLsKkxKtlmufjUw61C4ec48Z
	o0e+RxdeMh6BayzV3bNmbHXKpEysvdEwthNbwKZetzuxF+B0O0vrCi7lcWD5PfJbLDtTve7hhgS2v
	PAjITckYZSMbwic85AQnDRY8h5bCBWr3PA2fD8guqU+4mPcCqFDsIz6igou+RibQpVfw72+pNnMqm
	ClCuyZmGCDZBzYyzKhf7pffvZ429brLwHkNcwYaKYZfGGh6bki384II38HcRuh/Z3bNm4GftQLOE7
	wd8yqnxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi7H-0000000Fi4c-3dlH;
	Wed, 21 May 2025 12:00:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHi4G-0000000FhXB-0Nk1;
	Wed, 21 May 2025 11:57:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BB58D1515;
	Wed, 21 May 2025 04:56:49 -0700 (PDT)
Received: from [10.57.64.80] (unknown [10.57.64.80])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 354D23F5A1;
	Wed, 21 May 2025 04:57:02 -0700 (PDT)
Message-ID: <1e7cb553-be71-4403-bc25-64457ec3e3d4@arm.com>
Date: Wed, 21 May 2025 12:57:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] pmdomain: rockchip: Relax SMCCC dependency
To: Ulf Hansson <ulf.hansson@linaro.org>, Heiko Stuebner <heiko@sntech.de>
Cc: mark.rutland@arm.com, lpieralisi@kernel.org, sudeep.holla@arm.com,
 linux-pm@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
References: <ab0476382e3342161beda94a45ddadb49b026dcd.1747760015.git.robin.murphy@arm.com>
 <6f0a38e596c0727d0de13a29c9224f71bc7d30f1.1747760015.git.robin.murphy@arm.com>
 <2393836.usQuhbGJ8B@phil>
 <CAPDyKFpTaRZqdpwFnC5DgLjJAf1YawJ1L5OVgwfjnfs7iNyUhQ@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CAPDyKFpTaRZqdpwFnC5DgLjJAf1YawJ1L5OVgwfjnfs7iNyUhQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250521_045704_169813_E66D424D 
X-CRM114-Status: GOOD (  13.74  )
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

On 2025-05-21 12:41 pm, Ulf Hansson wrote:
> On Tue, 20 May 2025 at 20:38, Heiko Stuebner <heiko@sntech.de> wrote:
>>
>> Am Dienstag, 20. Mai 2025, 19:10:17 Mitteleuropäische Sommerzeit schrieb Robin Murphy:
>>> Most 32-bit Rockchip platforms do not use PSCI, so having to select
>>> ARM_PSCI to satisfy a dependency chain to retain working power domain
>>> support is a bit weird and non-obvious. Now that the offending SMCCC API
>>> is properly stubbed out for optional usage, we can relax this again.
>>>
>>> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
>>
>>
>> Reviewed-by: Heiko Stuebner <heiko@sntech.de>
>>
>> Of course this needs patch1 of this series to get applied
>> first.
>>
>> I think for bisectability, doing this directly in patch1 might
>> be less dangerous though?
>>
> 
> If it helps, I can pick both patches via my pmdomain tree, to make
> sure patch1 really gets applied prior to patch2.

Perhaps I should have been less lazy and written a brief cover letter, 
but indeed, given the dependency my hope was for these to both go 
together through the same tree - it's just an open question of which 
tree that should be :)

Cheers,
Robin.

> Mark, Sudeep, Lorenzo do you see any problems with this?
> 
> [...]
> 
> Kind regards
> Uffe


