Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36512CD13DE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 16:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HdeqSpuhXdLu5xteyLv65M1RmZtJDaQC+TCDRBoLAis=; b=qmAVILxLuW2lCEW3sskY0vB3B9
	KCr/2dve4Yz+1f27wdiLa7XzLB9vLoDdRDP1qXHasM6KmpSFUqkgoMFcMc+IyZSTpGiG24GZAMi7N
	FdXJaLoGC+JcRlLcGlS/4TfR/l5Fefk2f6/GALFC59mC3bON4zd1QuiBopc7c0JtCDE4vxtre8fdd
	HvvYOC1FKobPZXDh+g3bzY5XgLmPoYQVEhTt7YDqjs8nEqsBQh5HK+THRFa+9QVU6bKjl4AKbBzFG
	fMvkE6V6xAJ3sdkec7kvjUMFCAH20TDyWfR7/Ito5zvI88Cw5z5r28tw+MptHtbhRTe7yctHCfodP
	A84cMJ8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDWg-00000009AMv-3r0Z;
	Wed, 12 Nov 2025 16:16:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJDWe-00000009AMb-3JPY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 16:16:54 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E9D6497;
	Wed, 12 Nov 2025 08:16:44 -0800 (PST)
Received: from [10.57.66.231] (unknown [10.57.66.231])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0D61A3F63F;
	Wed, 12 Nov 2025 08:16:49 -0800 (PST)
Message-ID: <b677c2d4-7d62-4b87-8c38-1523b2d05915@arm.com>
Date: Wed, 12 Nov 2025 16:16:48 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/11] CoreSight: Refactor power management for ETMv3/4
Content-Language: en-GB
To: Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Yeoreum Yun <yeoreum.yun@arm.com>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Yabin Cui <yabinc@google.com>, Keita Morisaki <keyz@google.com>,
 Yuanfang Zhang <quic_yuanfang@quicinc.com>, Leo Yan <leo.yan@arm.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org
References: <20251111-arm_coresight_power_management_fix-v6-0-f55553b6c8b3@arm.com>
 <176294942171.582484.7200845964334648364.b4-ty@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <176294942171.582484.7200845964334648364.b4-ty@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_081652_893678_D55C8214 
X-CRM114-Status: GOOD (  10.43  )
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

On 12/11/2025 12:10, Suzuki K Poulose wrote:
> 
> On Tue, 11 Nov 2025 18:58:34 +0000, Leo Yan wrote:
>> This series is extracted from the CoreSight power management fixes and
>> refactoring [1], focusing on ETMv3/4 power management.
>>
>> This series has been verified on Juno-r2 platform.
>>
>> [1] https://lore.kernel.org/linux-arm-kernel/20250915-arm_coresight_power_management_fix-v3-0-ea49e91124ec@arm.com/
>>
>> [...]
> 
> Applied, thanks!
> 
> [01/11] coresight: Change device mode to atomic type
>          https://git.kernel.org/coresight/c/693d1eaca940
> [02/11] coresight: etm4x: Always set tracer's device mode on target CPU
>          https://git.kernel.org/coresight/c/28eee2158575
> [03/11] coresight: etm3x: Always set tracer's device mode on target CPU
>          https://git.kernel.org/coresight/c/ab3fde32afe6
> [04/11] coresight: etm4x: Correct polling IDLE bit
>          https://git.kernel.org/coresight/c/4dc4e22f9536
> [05/11] coresight: etm4x: Add context synchronization before enabling trace
>          https://git.kernel.org/coresight/c/64eb04ae5452
> [06/11] coresight: etm4x: Properly control filter in CPU idle with FEAT_TRF
>          https://git.kernel.org/coresight/c/1fdc2cd347a7
> [07/11] coresight: etm4x: Remove the redundant DSB
>          https://git.kernel.org/coresight/c/a5e6f584dab0

Based on the recent discussions, I have dropped the patches below. We 
cannot let the corruption creep in with cpu-idle, which wasn't possible
otherwise.

Suzuki

> [08/11] coresight: etm4x: Remove the state_needs_restore flag
>          https://git.kernel.org/coresight/c/d2c051f7a5ed
> [09/11] coresight: etm4x: Add flag to retain single-shot status
>          https://git.kernel.org/coresight/c/c3d84848bd70
> [10/11] coresight: etm4x: Retain sequencer state
>          https://git.kernel.org/coresight/c/1b4e911af51c
> [11/11] coresight: etm4x: Reuse normal enable and disable logic in CPU idle
>          https://git.kernel.org/coresight/c/efdccf6a5118
> 
> Best regards,


