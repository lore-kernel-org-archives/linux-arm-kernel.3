Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6DA0D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Nov 2025 14:25:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GOtvlgUGnH/DCeYmCSc4dBHvQ6AEao1b97n1OL8njq4=; b=Xb6FEk0icRuPcSFXLXGndDa3Oh
	HLUICV147XuMFaj2SN7OgzBsngFXGwmM6BE2Rlsuq7qPniPZ3gOb1hn1f9Cp7v+eBuc2cbfo59e3V
	JMMOH8HJ5m0OSiY8LJszxuvmG1SuPjcFG1StBTcRpGPAlsv72/WGCbDOdYrNFLfpzPo/e9d44QPD0
	i0F+eFTaHh5t4nj0tN+2COH5kjaHx4ysFRtAMZDbdz+wUvf3J1vNgf8TxkxkGw8kf7ip6TvAXZIod
	CdLS9BWGNj8QbK4kOlqVsqTGvX04aSHwcxN5WudTlXgjDXIlEuNC38W2npqVkI2GGiPJn/NxA9bJA
	WazVkXEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcwD-0000000GmFX-0Gao;
	Thu, 27 Nov 2025 14:25:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vOcwB-0000000GmFC-1nHR
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Nov 2025 14:25:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D755D1063;
	Thu, 27 Nov 2025 06:25:26 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 72B153F73B;
	Thu, 27 Nov 2025 06:25:29 -0800 (PST)
Message-ID: <a04aa337-a3eb-42a0-855b-500ba549e2d8@arm.com>
Date: Thu, 27 Nov 2025 14:25:28 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 00/34] arm_mpam: Add basic mpam driver
To: Punit Agrawal <punit.agrawal@oss.qualcomm.com>, james.morse@arm.com
Cc: amitsinght@marvell.com, baisheng.gao@unisoc.com,
 baolin.wang@linux.alibaba.com, bobo.shaobowang@huawei.com,
 carl@os.amperecomputing.com, catalin.marinas@arm.com, dakr@kernel.org,
 dave.martin@arm.com, david@redhat.com, dfustini@baylibre.com,
 fenghuay@nvidia.com, gregkh@linuxfoundation.org, gshan@redhat.com,
 guohanjun@huawei.com, jeremy.linton@arm.com, jonathan.cameron@huawei.com,
 kobak@nvidia.com, lcherian@marvell.com, lenb@kernel.org,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, lpieralisi@kernel.org, peternewman@google.com,
 quic_jiles@quicinc.com, rafael@kernel.org, robh@kernel.org,
 rohit.mathew@arm.com, scott@os.amperecomputing.com, sdonthineni@nvidia.com,
 sudeep.holla@arm.com, tan.shaopeng@fujitsu.com, will@kernel.org,
 xhao@linux.alibaba.com, reinette.chatre@intel.com
References: <20251119122305.302149-1-ben.horgan@arm.com>
 <877bvfa23i.fsf@stealth>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <877bvfa23i.fsf@stealth>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251127_062535_517641_65F45825 
X-CRM114-Status: GOOD (  18.19  )
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

Hi Punit,

On 11/24/25 15:21, Punit Agrawal wrote:
> Hi Ben, James
> 
> Ben Horgan <ben.horgan@arm.com> writes:
> 
>>
>> This series is based on v6.18-rc4, and can be retrieved from: (no v6 version)
>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/driver/v5
>>
>> The rest of the driver can be found here: (no v6 version)
>> https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot/v6.18-rc4-v5
>>
>> What is MPAM? Set your time-machine to 2020:
>> https://lore.kernel.org/lkml/20201030161120.227225-1-james.morse@arm.com/
> 
> Although a little late to the party, I've managed to throw together
> enough firmware to describe the MPAM hardware and take this set (more
> specifically mpam/snapshot/v6.18-rc4-v5 branch from James' repository)
> for a spin. Using the branch, the kernel is able to probe the hardware
> and discover the advertised features. Yay! We are in business.

Thanks for giving it a go. :)

> 
> Having said that, there are a few quirks of the platform that run into
> issues with later patches in the branch. The platform has MSCs attached
> to shared L2 caches which are being skipped during later stages of
> initialisation. IIUC, the L2 MSCs' limitations stems from the
> assumptions in the resctrl interface.

What in particualar is being skipped?

> 
> I was wondering if there are any patches available to relax these
> limitations? I can give them a try. Or do these need to be put together
> from the ground up? Any pointers greatly appreciated.

There are some extra things added in the extras branch [1] e.g. cache
maximum usage controls (cmax). However, lots of possible things are
still missing e.g. any monitors on L2. If it doesn't fit with the
topology expected by resctrl then it is unlikely to have been considered
yet.

[1]
https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git/log/?h=mpam/snapshot%2bextras/v6.18-rc1

Thanks,

Ben


