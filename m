Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9F53BD3B981
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 16:31:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=42Gg2n9nNsJP4lMqmU4zY6NqNwLJWPB73yW4+PLCWb0=; b=T3ef9LfKbYPan8OCtXnyhjQs/P
	ypYZweYJLYtRi3a9+mTzZCQw1NBoycHocNvqVPAs7cBtiE8BBAczfJxK1TpV/w7JPlGF1T9Q4InXx
	X+litQvFiNEhEG69qz4ji7/NdyEcm7GUxMkxeAsWXBYDkgK6tJpcIeuTFAYbu9BU6n52HUJRqDCRl
	82FhZ17yHPdju1Nuwia1oCdMOOZrps+/Q4pK4cNwxRGXLadY/JBBxaraEn5whj9wMsQttPSmYxUr5
	oqM7NOje4ppcUgGsGXff6OMth7jeKSNj+9P7G23nDb9+774EVZjXtxvMlcLllSqpbNYWhOm7evD8R
	iaWYFNaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0cI-0000000EWET-06Oj;
	Tue, 09 Dec 2025 16:31:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vT0cF-0000000EWE4-0FGW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 16:31:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6D620175D;
	Tue,  9 Dec 2025 08:30:57 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E8D33F73B;
	Tue,  9 Dec 2025 08:31:01 -0800 (PST)
Message-ID: <9b452304-27ea-4c38-8bf1-820cf4d2f0a7@arm.com>
Date: Tue, 9 Dec 2025 16:31:00 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 27/38] arm_mpam: resctrl: Add empty definitions for
 assorted resctrl functions
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@kernel.org>, Dave Martin <dave.martin@arm.com>,
 Koba Ko <kobak@nvidia.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 fenghuay@nvidia.com, baisheng.gao@unisoc.com,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Gavin Shan
 <gshan@redhat.com>, rohit.mathew@arm.com, reinette.chatre@intel.com,
 Punit Agrawal <punit.agrawal@oss.qualcomm.com>
References: <20251205215901.17772-1-james.morse@arm.com>
 <20251205215901.17772-28-james.morse@arm.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <20251205215901.17772-28-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_083107_169028_DA282E9F 
X-CRM114-Status: GOOD (  11.34  )
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

Hi James,

On 12/5/25 21:58, James Morse wrote:
> A few resctrl features and hooks need to be provided, but aren't needed
> or supported on MPAM platforms.
> 
> resctrl has individual hooks to separately enable and disable the
> closid/partid and rmid/pmg context switching code. For MPAM this is all
> the same thing, as the value in struct task_struct is used to cache the
> value that should be written to hardware. arm64's context switching code
> is enabled once MPAM is usable, but doesn't touch the hardware unless
> the value has changed.
> 
> For now event configuration is not supported, and can be turned off
> by returning 'false' from resctrl_arch_is_evt_configurable().
> 
> Add this, and empty definitions for the other hooks.
> 
> Signed-off-by: James Morse <james.morse@arm.com>

The newly added io_alloc support means we need a couple more dummy
resctrl arch functions in here, resctrl_arch_io_alloc_enable() and
resctrl_arch_io_alloc_enabled().

Thanks,

Ben


