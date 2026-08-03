Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7328DC5518F
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 10:30:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ua5SMXI0DNKnn+v3/mxiCTRgXQtNateGsAb8YKGinEQ=; b=orWGwIfITYVTn9wNv5hp4pUgdM
	NSSDXCbMA1n2vCpEa6sCKOnp0ZgyxuSJYUkMSPExnuAbp2/ZWJCuP5m6XDj1/YXrRIm4XxvlPXiKa
	vGjgUvTW/UJSqLDpp0M6uGEX4g824mhtk3oXtLv5T9NLEOPmGa7x8F00Ace5DtRdr5PgCig+dRO6Z
	MAEwJQIqUYn78Cw9v2OTZjkhJr0dolvLwvyTLXzYT99d7ViEp0I+FLVNUsMXDPoaWo7NEI/P4FUs9
	Qp+yJpcvXsH38qa0rBsFLod9XOOJKYuyy/RztJgvHFGh5G5JaUh8QSEGOGFoXlQC2x9EEiUJtAneF
	NqXJjYlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpvk-0000000Gr6Q-1Xxv;
	Mon, 03 Aug 2026 10:30:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqpvh-0000000Gr5U-0Zhd
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 10:29:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 9B870143D;
	Mon,  3 Aug 2026 03:29:49 -0700 (PDT)
Received: from [10.2.212.8] (e134344.arm.com [10.2.212.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2D3B63F632;
	Mon,  3 Aug 2026 03:29:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1785752993; bh=1qJ4wQY7WRTQ0FirZv9iKKm1FoFVfKKnieXEhABORgY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=bqhJRbzTnij/WkoVc87bdat9L8fxKz8obJ1oY2aSQF0zrd/jKTMcqlg4TFkA54AtF
	 Y4Ql1adl8Y2OFfs5bN/fxVhAv579kE2QKrk2q/Ly4vO3OeA5LPydiBBR1QxHZBfe4B
	 u9ePd6TQFehRoff/M+PBH7LxXf33kdoEOU6oqmlw=
Message-ID: <ea6ec065-9459-40d6-aefa-9f08e5281ce3@arm.com>
Date: Mon, 3 Aug 2026 11:29:50 +0100
MIME-Version: 1.0
User-Agent: Thunderbird Daily
Subject: Re: MPAM changes for v7.3
To: Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, kernel-team@android.com, james.morse@arm.com,
 fenghuay@nvidia.com, linux-arm-kernel@lists.infradead.org,
 andre.przywara@arm.com, gshan@redhat.com, tan.shaopeng@jp.fujitsu.com,
 sdonthineni@nvidia.com, jonathan.cameron@oss.qualcomm.com
References: <20260731175243.904730-1-ben.horgan@arm.com>
 <178566322421.4135357.4986108386959858973.b4-ty@kernel.org>
Content-Language: en-US
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <178566322421.4135357.4986108386959858973.b4-ty@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_032957_277435_2BD566C9 
X-CRM114-Status: GOOD (  20.62  )
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

Hi Will,

On 8/2/26 13:12, Will Deacon wrote:
> On Fri, 31 Jul 2026 18:52:37 +0100, Ben Horgan wrote:
>> Please find the MPAM changes for v7.3 in this collected series. I hope
>> this is more convenient than my last pull request for the fixes.
>>
>> This combines the MPAM abmc emulation series and a fix for an Nvidia quirk which:
>>
>> Make MPAM memory bandwidth counters usable by hooking them to resctrl's counter assignment
>> interface.
>>
>> [...]
> 
> Applied to arm64 (for-next/mpam), thanks!
> 
> [1/6] arm_mpam: resctrl: Pick classes for use as MBM counters
>       https://git.kernel.org/arm64/c/436d111d918a
> [2/6] arm_mpam: resctrl: Pre-allocate assignable monitors
>       https://git.kernel.org/arm64/c/779cfd653168
> [3/6] arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
>       https://git.kernel.org/arm64/c/6e0e538a75ce
> [4/6] arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()
>       https://git.kernel.org/arm64/c/a5ff6ef2d73e
> [5/6] arm64: mpam: Add memory bandwidth usage (MBWU) documentation
>       https://git.kernel.org/arm64/c/6b4ee75215c9
> [6/6] arm_mpam: Apply T241-MPAM-6 to 63-bit counters
>       https://git.kernel.org/arm64/c/2c43aced9be3
> 
> It looks like you've been keeping an eye on the Sashiko reviews, but
> please can you double-check the open-comments on this posting?
> 
>   https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com

Sashiko reports some real existing issues that I have already got patches on the list. Other than
this there is potential for one-off leaks of the abmc counters an an existing possible deadlock in
resctrl. At least one of the leaks is worth addressing, I'll look into that. I need to check further
for the existing resctrl deadlock, there have been similar problems in this area. See below for
notes on each of the Sashiko comments.


Patch 1
https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com?part=1

Comment 1: Nope
We read the counters using resctrl_arch_cntr_read() rather than resctrl_arch_rmid_read() as we only
support mbm_event (ABMC emulation) and not the "default" free-running counters mode.

Comment 2: Yes
Separate fix is here:
https://lore.kernel.org/linux-arm-kernel/20260710115546.29644-9-ben.horgan@arm.com/

Patch 2
https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com?part=2

Comment 1: Same as Patch 1 Comment 2

Comment 2: Not really
Potentially a small leak but currently resctrl_enable_mon_event() can't fail with these arguments.

Comment 3: Yes
This is a leak on MPAM teardown which only happens if MPAM is being disabled due to an error and can
only happen once. I'll look into fixing this.


Patch 3
https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com?part=3

Comment 1: No
resctrl_arch_cntr_read() implemented in the following patch

Comment 2: Probably
One off leaks can happen on initialisation failure.

Comment 3: To check, possibly an existing potential deadlock in resctrl
Reinette fixed a similar issue relating to cpu_read_lock(). I'll look and see if there is a similar
problem with rdtgroup_mutex.
https://lore.kernel.org/lkml/3f0e0752deb3421606dfc4600f0ab3a4ae098cd7.1783963505.git.reinette.chatre@intel.com/

Patch 4:
https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com?part=4

Comment 1: Not exactly

I don't think there is a real error but it's tidied in:
https://lore.kernel.org/linux-arm-kernel/20260710115546.29644-10-ben.horgan@arm.com/

Patch 5: no comments

Patch 6:
https://sashiko.dev/#/patchset/20260731175243.904730-1-ben.horgan%40arm.com?part=6

Comment 1: Yes
An existing issue addressed by:
https://lore.kernel.org/linux-arm-kernel/20260710115546.29644-7-ben.horgan@arm.com/

Thanks,

Ben

> 
> Cheers,


