Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E53DCCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 16:16:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c9bHXnn7Ym1/ewHir3U29JW0/QGRaw4vVAlSgjgrYMQ=; b=pQemFH7/UVU1GwmJVltbxfZ6Qf
	IuXunmta7neD/r0mEkBEZoTyUjHpM5/5marJl2zg+HUf6gu5cHwOlQ/q2cJmeJy+EPCUhc+091hKa
	LX09oTA7XK06+SB7db0yIdtKe+a+3rHBlCtRFiW3l5wuEBQHaz/fx/Q5GBiIRnBABKgxbh3h+wlzJ
	qAKzP+OmdZtIISpCkmiiECShxoE6nVxaPojgS11gToAAVybEE7CU3pxGzIkrF+IeV3dCvyxRN0//L
	x9L8jokztYSDJFMjb7mJmvF8Ve/wCCGJZMHNwELtP94riuCooYCq3q5mTm1cb2XMdMpE+g+j4wagh
	Fo3BgN/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUYu-00000005mJ6-0h9s;
	Mon, 10 Nov 2025 16:16:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIUYo-00000005mIV-2GVP
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 16:16:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 139382F;
	Mon, 10 Nov 2025 08:15:57 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3691F3F66E;
	Mon, 10 Nov 2025 08:16:00 -0800 (PST)
Message-ID: <3db645f5-b0bf-44a0-9cdc-460e46ec7bc2@arm.com>
Date: Mon, 10 Nov 2025 16:15:58 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/33] arm_mpam: Add basic mpam driver
To: Carl Worth <carl@os.amperecomputing.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 catalin.marinas@arm.com, dakr@kernel.org, dave.martin@arm.com,
 david@redhat.com, dfustini@baylibre.com, fenghuay@nvidia.com,
 gregkh@linuxfoundation.org, gshan@redhat.com, guohanjun@huawei.com,
 jeremy.linton@arm.com, jonathan.cameron@huawei.com, kobak@nvidia.com,
 lcherian@marvell.com, lenb@kernel.org, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 lpieralisi@kernel.org, peternewman@google.com, quic_jiles@quicinc.com,
 rafael@kernel.org, robh@kernel.org, rohit.mathew@arm.com,
 scott@os.amperecomputing.com, sdonthineni@nvidia.com, sudeep.holla@arm.com,
 tan.shaopeng@fujitsu.com, will@kernel.org, xhao@linux.alibaba.com
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <87y0ohbf7e.fsf@rasp.cworth.amperemail.amperecomputing.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <87y0ohbf7e.fsf@rasp.cworth.amperemail.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251110_081606_756972_0F6FD504 
X-CRM114-Status: GOOD (  26.78  )
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

Hi Carl,

On 11/7/25 23:22, Carl Worth wrote:
> Ben Horgan <ben.horgan@arm.com> writes:
>> This version of the series comes to you from me as James is otherwise
>> engaged. I hope I have done his work justice. I've made quite a few
>> changes, rework, bugs, typos, all the usual. In order to aid review,
>> as Jonathan suggested, I've split out some patches and made an effort
>> to minimise the amount of churn between patches.
> 
> I've built this and booted on an Ampere system. It ends up reporting a
> successful message of:
> 
> 	MPAM enabled with 1 PARTIDs and 1 PMGs
> 
> So the code seems happy enough as far as that goes.
> 
> But the expected number of PARTIDs on this system is much larger than 1,
> (MPAM with a single PARTID would not be useful at all).
> 
>> See below for a public branch. No public updated version of the
>> snapshot (the rest of the driver) I'm afraid.
> 
> Looking closer, it looks like the bogus value of 0 for mpam_partid_max
> is because the following patch (which does appear in James' various
> snapshots) isn't present yet in the code submitted to this point:
> 
> 	commit 33c1f50970917ac9f2a8e224d850936374df6173
> 	Author: James Morse <james.morse@arm.com>
> 	Date:   Fri Jul 4 14:22:30 2025 +0100
> 	
> 	    arm64: mpam: Advertise the CPUs MPAM limits to the driver
> 	    
> 	    Requestors need to populate the MPAM fields on the interconnect. For
> 	    the CPUs these fields are taken from the corresponding MPAMy_ELx
> 	    register. Each requestor may have a limit on the largest PARTID or
> 	    PMG value that can be used. The MPAM driver has to determine the
> 	    system-wide minimum supported PARTID and PMG values.
> 	    
> 	    To do this, the driver needs to be told what each requestor's
> 	    limit is.

Yes, the driver does barely anything without a requestor.

> 
> So, I guess I'm wondering what more I could do to test this code at this
> point, prior to merging it.
> 
> I'm very interested in seeing this code land upstream as soon as
> possible, and I've got access to an implementation to test whatever I
> can.
> 
> So let me know what else I can do and I'll be glad to contribute my
> Tested-by when I've done it.
> 
> -Carl

Thanks for the quick response and testing.

I've just responded to the cover letter with a branch containing the
rest of the driver. (Just so it's not hidden in this thread) It's
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot/v6.18-rc4

With that, you should be able to enable all usable PARTID and PMG, mount
resctrl, add tasks/cpus to resctrl control groups, run benchmarks to
check that the controls are respected and check that the monitors give
expected values.

Thanks,

Ben


