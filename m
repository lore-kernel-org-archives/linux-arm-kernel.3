Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1DECD6EBF4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Nov 2024 10:13:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7MRVzBuYXwZ17fAxi3tZL870oxRZ48kZqHTTz2CnZ+I=; b=GfepecJNOWn/NpXq/6H8wjiaUb
	ZXc0LASeoC50X5fOMKs9N3Ej+ldhXLpk0Ms5QP3vgPZ38zny1qn4nXQxqJAshsA/ktCmWyCSVNeao
	a/P7kOyGH0HKB0ri+hbAesePXRsl7/Qeazky7iEUTx4xbXeeoOrqYNdJfVbIzpVl7QJGf6OgmWVjw
	8PfGcwJ/k31aNWm4az16zDO3XVjngw2D+V/jspIB1MUUQYQPzNCsB/uwQSqHAqm6tx2O/g4DmVAhN
	DJwwrxD+yURNtugL8nv+uzsJpfPsHYWJa1Vu2WQSTNPibGFYsszQjev41ticPbQvt+BUbYYBU+N2A
	5vvuWdBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGy0B-0000000HPOf-4A3f;
	Fri, 29 Nov 2024 10:13:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGxzC-0000000HPIF-1Ds1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Nov 2024 10:12:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EE1A12FC;
	Fri, 29 Nov 2024 02:12:56 -0800 (PST)
Received: from [192.168.2.88] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 674683F5A1;
	Fri, 29 Nov 2024 02:12:24 -0800 (PST)
Message-ID: <f7046fcc-91e3-434e-930c-10259b36a90b@arm.com>
Date: Fri, 29 Nov 2024 11:12:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] [tip: sched/core] sched: Disable PLACE_LAG and
 RUN_TO_PARITY and move them to sysctl
To: Cristian Prundeanu <cpru@amazon.com>
Cc: abuehaze@amazon.com, alisaidi@amazon.com, benh@kernel.crashing.org,
 blakgeof@amazon.com, csabac@amazon.com, doebel@amazon.com,
 gautham.shenoy@amd.com, joseph.salisbury@oracle.com, kprateek.nayak@amd.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-tip-commits@vger.kernel.org, mingo@redhat.com, peterz@infradead.org,
 x86@kernel.org
References: <20241125113535.88583-1-cpru@amazon.com>
 <20241128103236.22777-1-cpru@amazon.com>
From: Dietmar Eggemann <dietmar.eggemann@arm.com>
Content-Language: en-US
In-Reply-To: <20241128103236.22777-1-cpru@amazon.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241129_021230_400576_32B68BC1 
X-CRM114-Status: GOOD (  10.41  )
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

On 28/11/2024 11:32, Cristian Prundeanu wrote:

[...]

> On 2024-11-26, Dietmar Eggemann wrote:
> 
>> SUT kernel arm64 (mysql-8.4.0)
>> (2) 6.12.0-rc4                -12.9%
>> (3) 6.12.0-rc4 NO_PLACE_LAG   +6.4%		
>> (4) v6.12-rc4  SCHED_BATCH    +10.8%
> 
> This is very interesting; our setups are close, yet I have not seen any 
> feature or policy combination that performs above the 6.5 CFS baseline.
> I look forward to seeing your results with the repro when it's ready.
> 
> Did you only use NO_PLACE_LAG or was it together with NO_RUN_TO_PARITY?

Only NO_PLACE_LAG.

> Was SCHED_BATCH used with the default feature set (all enabled)?

Yes.

> Which distro/version did you use for the SUT?

The default, Ubuntu 24.04 Arm64 server.

>> Maybe a difference in our test setup can explain the different test results:
>>
>> I use:
>>
>> HammerDB Load Generator <-> MySQL SUT
>> 192 VCPUs               <-> 16 VCPUs
>>
>> Virtual users: 256
>> Warehouse count: 64
>> 3 min rampup
>> 10 min test run time
>> performance data: NOPM (New Operations Per Minute)
>>
>> So I have 256 'connection' tasks running on the 16 SUT VCPUS.
> 
> My setup:
> 
> SUT     - 16 vCPUs, 32 GB RAM
> Loadgen - 64 vCPU, 128 GB RAM (anything large enough to not be a 
>  bottleneck should work)
> 
> Virtual users:  4 x vCPUs = 64
> Warehouses:     24
> Rampup:         5 min
> Test runtime:   20 min x 10 times, each on 4 different SUT/Loadgen pairs
> Value recorded: geometric_mean(NOPM)

Looks like you have 4 times less 'connection' tasks on your 16 VCPUs. So
much less concurrency/preemption ...

