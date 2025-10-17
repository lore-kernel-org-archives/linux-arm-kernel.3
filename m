Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B897CCD1A2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 18:51:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CRf+JHbhlgeZsgGsKb9pwDfSdXZc7C4Px1DS043AvlQ=; b=zDx18e4p2jKGr/i6D+zQSWNgjS
	/RgkBCbTx7RBk8U/QxaMOEazSFqFh4vAD44BeMVS8CsxaIajsc8QUZLXq9Ev+6cGySvB3LkvMD7UQ
	CGjbSp8xbJnJjHuJ5mmVXFecY/1nWzOJ5fN4atB25K2CVly+OFBaPIENnkJcgkzS5kkHufvSUgBv3
	+wSESVAB1+X7KlNd6aZHbnfUOhKImgDRvs0r1Wgf33SYE0A9N0DlrgC8SxgtONaCUW2PHPKhBU9q6
	j9/oYBnfpHCzyTy9VFRn7nuSFfCBxfEKc1rb7aqUF5vPdqOnLA0nGD3InaoSilNb+kbCWJM4mNNER
	HFmviinA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pYI-00000008iRC-1g2i;
	Fri, 17 Oct 2025 18:51:46 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9pY8-00000008iLt-2gfL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 18:51:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 56D8A1596;
	Fri, 17 Oct 2025 11:51:28 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 159A33F6A8;
	Fri, 17 Oct 2025 11:51:27 -0700 (PDT)
Message-ID: <a1c4517e-8110-47f6-a053-291955b17c48@arm.com>
Date: Fri, 17 Oct 2025 19:51:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/29] arm_mpam: Add probe/remove for mpam msc driver
 and kbuild boiler plate
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-acpi@vger.kernel.org,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com, Rob Herring <robh@kernel.org>,
 Rohit Mathew <rohit.mathew@arm.com>, Rafael Wysocki <rafael@kernel.org>,
 Len Brown <lenb@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250910204309.20751-1-james.morse@arm.com>
 <20250910204309.20751-8-james.morse@arm.com>
 <20250911143544.000026aa@huawei.com>
 <9982847d-2878-4748-8c65-2d98a2e47396@arm.com>
 <20250926155543.00005de0@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250926155543.00005de0@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_115136_720548_92E9E28A 
X-CRM114-Status: GOOD (  13.43  )
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

Hi Jonathan,

On 26/09/2025 15:55, Jonathan Cameron wrote:
>>>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>>>> new file mode 100644
>>>> index 000000000000..7c63d590fc98
>>>> --- /dev/null
>>>> +++ b/drivers/resctrl/mpam_internal.h
>>>> @@ -0,0 +1,65 @@
>>>> +/* SPDX-License-Identifier: GPL-2.0 */
>>>> +// Copyright (C) 2025 Arm Ltd.
>>>> +
>>>> +#ifndef MPAM_INTERNAL_H
>>>> +#define MPAM_INTERNAL_H
>>>> +
>>>> +#include <linux/arm_mpam.h>
>>>> +#include <linux/cpumask.h>
>>>> +#include <linux/io.h>
>>>> +#include <linux/mailbox_client.h>
>>>> +#include <linux/mutex.h>  
>>>
>>> spinlock.h  
>>
>> Fixed,
>>
>>
>>>> +#include <linux/resctrl.h>  
>>>
>>> Not spotting anything rsctl yet.  So maybe this belongs later.  
>>
>> There shouldn't be anything that depends on resctrl in this series - looks like
>> this is a 2018 era bug in the way I carved this up!
>>
>>
>>>> +#include <linux/sizes.h>
>>>> +
>>>> +struct mpam_msc {
>>>> +	/* member of mpam_all_msc */
>>>> +	struct list_head        all_msc_list;
>>>> +
>>>> +	int			id;  
>>>
>>> I'd follow (approx) include what you use principles to make later header
>>> shuffling easier. So a forward def for this.  
>>
>> -ENOPARSE
>>
>> I'm sure I'll work this out from your later comments.
> 
> I missed on the comment (I think). Would have made more sense a line later.
> Add a forwards def
> 
> struct platform_device;
> 
> as no reason to include the appropriate header
> (and you didn't anwyay).
> 

Right - gotcha.


Thanks,

James

