Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96D4BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:33:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vv7g/RGuI0B2lXyafzVR029C6O08hzaUdr9otMoiKKw=; b=BH01WzBhsRHF6RQVZx/CFFRteB
	ISbJBhVdh0vpALz8fdUt8KCWh1xxV8TNkFQODpKd1hFdHUdjpLPkSuo3pv8hQ0Vux+aJmvAm31hi1
	dWEXcaPXw7/tQLwHyHCWci3vuh48Y3xxbLXroAcQ2LgPH2SirrQodHgjRCo5tfKO8s5xUvPdTpKs2
	pfNwDk+t3f4pvCugqnAqu8q2mlGMvkeNqAyQUt6cWFm7M3EURQcOD4HE1qCk2h5p4VMhOZmGga82R
	6ONYQLoBLd7xC0QP4/kXxrNWzv+sKiXQh/qNSKJ3HnwEKddyPZbnHsTam+Oa9giQ+crYpxM1KT4bR
	eOfBY0qQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQYv-0000000GJn0-33ZP;
	Wed, 10 Sep 2025 19:33:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQYr-0000000GJlQ-0jgI
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:32:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4B8943165;
	Wed, 10 Sep 2025 12:32:48 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 939F13F694;
	Wed, 10 Sep 2025 12:32:50 -0700 (PDT)
Message-ID: <8d6e9ff2-2279-475a-8135-304dac6c0920@arm.com>
Date: Wed, 10 Sep 2025 20:32:49 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 12/33] arm_mpam: Add the class and component structures
 for ris firmware described
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Cc: "shameerali.kolothum.thodi@huawei.com"
 <shameerali.kolothum.thodi@huawei.com>,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 Jamie Iles <quic_jiles@quicinc.com>, Xin Hao <xhao@linux.alibaba.com>,
 "peternewman@google.com" <peternewman@google.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "amitsinght@marvell.com" <amitsinght@marvell.com>,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 Jonathan Cameron <jonathan.cameron@huawei.com>, Rob Herring
 <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>, Ben Horgan <ben.horgan@arm.com>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-47-james.morse@arm.com>
 <OSZPR01MB87983DB7BF0AF0672A027D4E8B0FA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87983DB7BF0AF0672A027D4E8B0FA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123257_355906_74D754F4 
X-CRM114-Status: GOOD (  21.43  )
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

Hi Shaopeng,

On 09/09/2025 08:30, Shaopeng Tan (Fujitsu) wrote:
>> An MSC is a container of resources, each identified by their RIS index.
>> Some RIS are described by firmware to provide their position in the system.
>> Others are discovered when the driver probes the hardware.
>>
>> To configure a resource it needs to be found by its class, e.g. 'L2'.
>> There are two kinds of grouping, a class is a set of components, which are
>> visible to user-space as there are likely to be multiple instances of the L2 cache.
>> (e.g. one per cluster or package)
>>
>> struct mpam_components are a set of struct mpam_vmsc. A vMSC groups the
>> RIS in an MSC that control the same logical piece of hardware. (e.g. L2).
>> This is to allow hardware implementations where two controls are presented as
>> different RIS. Re-combining these RIS allows their feature bits to be or-ed. This
>> structure is not visible outside mpam_devices.c
>>
>> struct mpam_vmsc are then a set of struct mpam_msc_ris, which are not
>> visible as each L2 cache may be composed of individual slices which need to
>> be configured the same as the hardware is not able to distribute the
>> configuration.
>>
>> Add support for creating and destroying these structures.
>>
>> A gfp is passed as the structures may need creating when a new RIS entry is
>> discovered when probing the MSC.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index 71a1fb1a9c75..5baf2a8786fb 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -35,11 +34,483 @@

>> +static struct mpam_vmsc *mpam_vmsc_get(struct mpam_component
>> *comp,
>> +				       struct mpam_msc *msc, bool alloc,
>> +				       gfp_t gfp)
>> +{
>> +	struct mpam_vmsc *vmsc;
>> +
>> +	lockdep_assert_held(&mpam_list_lock);
>> +
>> +	list_for_each_entry(vmsc, &comp->vmsc, comp_list) {
>> +		if (vmsc->msc->id == msc->id)
>> +			return vmsc;
>> +	}
>> +
>> +	if (!alloc)
>> +		return ERR_PTR(-ENOENT);
> 
> It seems like it is always false here.
> If necessary, why not do this at the beginning of the function?

Because the VMSC may exist - in which case the 'get' function should return it
regardless of whether the caller wants to allocate it if its missing.

I'd anticipated callers like resctrl would want to grab components by things like cache-
id, without allocating them by accident. But that coded ended up just searching the lists
instead. I'll rip this out.


Thanks,

James

