Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 23B18606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 06:50:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=ae8YHLNF;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=kDYCJR6S
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=MM4e7fqDmtE4Y1ZW9vkBOxUF+4WU0wru0ULzuQOF7XA=; b=ae8YHLNFmhft+p
	3FJ1BXrVHXRFQy9P3/7KdKeO42z+Hg03nXzUcvQZ7uThVL9XWQxRArJsrX4e8PJwt6AzeKa5TUh23
	+s5GwG0CwNZQbFamAIgMgn9E6kwYMdpzvNZQQqykcZqNwuGFMRfa3nKvNZ7IwhHGbVFFKVodYBrfT
	BEWUK6BWPf6b4tc5F8wqET5iMPXHM9gWAYczLWOcUI9F7LvOMmDleAP2GR6LNtlUlDrq1BoqMJmWL
	i8j0MYJJiLfPAL4PtsRMkBypwZviotOpQ0NkKzbRkVjp7sS6E2FkB5PEX+igXPZCVBN5nZ73YJR6T
	YKY5DTKhudlbT7nqRGzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxUb-00000006QqZ-1WVq;
	Wed, 28 Oct 2026 06:50:37 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLxUY-00000006QqC-2MRT
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Oct 2026 06:50:36 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=MM4e7fqDmtE4Y1ZW9vkBOxUF+4WU0wru0ULzuQOF7XA=;
	b=kDYCJR6SJ82tPv7VlCiiurY6K2bKbbvDJxj3cmhJNiV6IeumEI1K1Ib+EOGfAF0FExlMWgzAu
	0VU372aPc4j52tFDFJU/YVCKIXA7Ib+XrObEW0jN50KdQLSSeIXeOxJiUQLp1wLBLvNsXAuLTK4
	ibWmxgHJEB8QLqv5F/24Q3s=
Received: from mail.maildlp.com (unknown [172.19.163.15])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4jDyfl5V83z1cyqb;
	Wed, 28 Oct 2026 14:50:23 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id 71B9340586;
	Wed, 28 Oct 2026 14:50:30 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Wed, 28 Oct
 2026 14:50:29 +0800
Message-ID: <e0475b6d-3728-49e2-aab7-efd4c49593f1@huawei.com>
Date: Wed, 28 Oct 2026 14:50:29 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 0/7] arm_mpam: Add L2 cache monitors
To: Ben Horgan <ben.horgan@arm.com>, <catalin.marinas@arm.com>,
	<will@kernel.org>, <mark.rutland@arm.com>, <corbet@lwn.net>,
	<skhan@linuxfoundation.org>, <rdunlap@infradead.org>, <james.morse@arm.com>,
	<reinette.chatre@intel.com>, <fenghuay@nvidia.com>, <tony.luck@intel.com>,
	<Dave.Martin@arm.com>, <babu.moger@amd.com>, <x86@kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>
References: <20261022084821.4014873-1-ruanjinjie@huawei.com>
 <c1e80268-3981-48bb-b251-dcd2218fc9d5@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <c1e80268-3981-48bb-b251-dcd2218fc9d5@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems100002.china.huawei.com (7.221.188.206) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_235034_956980_3F372AA3 
X-CRM114-Status: GOOD (  20.92  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/10/26 19:46, Ben Horgan 写道:
> Hi Jinjie,
> 
> On 22/10/2026 09:48, Jinjie Ruan wrote:
>> MPAM resource monitors hang off a partitionable resource in an MSC, not
>> off a particular cache level. resctrl only knows about the L3 scope, so
>> the L2 cache monitors that MPAM platforms implement are discovered by
>> the driver but never show up in resctrl.
> 
> Yes, it would be good to add support for more monitoring scopes. This is not just relevant for MPAM.
> RISC-V can also have monitors at many places in the system and we should coordinate so we have a
> uniform solution across architectures.

Hi Ben,

Agree, we should take other emerging architectures such as RISC-V into
account, design a more extensible solution.

> 
>>
>> An L2 MSC has the same CSU and MBWU counters as an L3 MSC; the cache
>> level comes from the ACPI MPAM table's cache locator. So this is mostly
>> a resctrl scope problem, not a hardware one.
>>
>> Extend resctrl's monitor scope to L2: register the L2 occupancy and
>> bandwidth events against the L2 resource, pick the L2 classes for them,
>> and borrow a CSU/MBWU monitor for the duration of a read. With CDP the
> 
> Borrowing an MBWU monitor doesn't sound right. The MBWU monitor needs to be configured while the
> traffic is happening so that it can keep count of bytes. The CSU is different as it can measure the
> occupancy without having to keep any state.

Thank you very much, will drop this approach and try the compatible
solution you suggested.

> 
> Thanks,
> 
> Ben
> 
>> two PARTIDs need separate accumulating monitors, so the borrowed-monitor
>> context becomes one monitor per PARTID.
>>
>> Patches:
>>
>>   1-2  Generalise the per-domain read path, add l2c_occupancy and
>>        mbm_core_bytes, update the documentation.
>>
>>   3    Split the borrowed-monitor context into data and code entries.
>>
>>   4    Do the CDP num_rmid halving for every mon_capable resource.
>>
>>   5-7  Pick the L2 classes, describe the events with the L2 resource,
>>        add the read paths.
>>
>> Tested on QEMU with an L2/L3/memory-controller MSC topology. The L2_MON
>> files show up and are readable; l2c_occupancy reports the modelled
>> occupancy, and mbm_core_bytes reports the modelled bandwidth.
>>
>> QEMU branch: https://github.com/ruanjinjie-eng/qemu/tree/mpam
>> Test cases: https://github.com/ruanjinjie-eng/mpam_testcase
>>
>> Jinjie Ruan (7):
>>   fs/resctrl: Generalize __l3_mon_event_count for non-L3 resources
>>   fs/resctrl: Add the L2 monitor events
>>   arm_mpam: resctrl: Split monitor context for code/data
>>   arm_mpam: resctrl: Halve num_rmid for every mon_capable resource on
>>     CDP
>>   arm_mpam: resctrl: Describe the L2 monitor events with the L2 resource
>>   arm_mpam: resctrl: Pick L2 classes for the L2 monitor events
>>   arm_mpam: resctrl: Add the L2 monitor read paths
>>
>>  Documentation/arch/arm64/mpam.rst |  23 +--
>>  drivers/resctrl/mpam_resctrl.c    | 236 +++++++++++++++++++++++-------
>>  fs/resctrl/monitor.c              |  15 +-
>>  include/linux/resctrl_types.h     |  13 +-
>>  4 files changed, 222 insertions(+), 65 deletions(-)
>>
> 

-- 
Best regards,
Jinjie


