Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD9FBCAC5B9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Sep 2025 10:01:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/B51IsqXXKcszChhTpG4bvVnOkIw9H+UI3/6/7ivFC8=; b=QqIFCqaf2pNGIrG+9VeAxMrlWI
	8Ii6UvryKMEB7n639MoeAoFxeZX0t0cooiPIqReU6QvI2yh9Bx6nKw/4abuU7cUlTWg0wbCdXNsQa
	8s9KPVlfoQaJfF4VF+K0vCOGjDdw+gHfY0AqcM4raQMmTksPHVtutjTnJbF0WvhC+FmnRfhenPvKO
	JecR8DYmn8rEj93/UPwzJnVdMMwbUGloSoOREQ91eSimG6ld5sA2Lh6m7/vcznmZGTmGTnnWgdWJp
	gkj9S5RPChAoHyjhZ6Gq7+pa/lycnPb3sCu0RKc/TMs1DXSZ8L/iVsX3F5boH065JrS3AlFwKQpZG
	oPbtnxGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Gc-00000000Cew-34TI;
	Fri, 26 Sep 2025 10:01:30 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v25Ga-00000000CeX-1nKp
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Sep 2025 10:01:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8B110168F;
	Fri, 26 Sep 2025 03:01:17 -0700 (PDT)
Received: from [10.57.2.143] (unknown [10.57.2.143])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B90893F5A1;
	Fri, 26 Sep 2025 03:01:23 -0700 (PDT)
Message-ID: <f8ce489b-e4dc-47d5-b66b-b0dbc8bc92b3@arm.com>
Date: Fri, 26 Sep 2025 11:01:22 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
Content-Language: en-GB
To: Besar Wicaksono <bwicaksono@nvidia.com>, "will@kernel.org"
 <will@kernel.org>, "robin.murphy@arm.com" <robin.murphy@arm.com>,
 "ilkka@os.amperecomputing.com" <ilkka@os.amperecomputing.com>
Cc: "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-tegra@vger.kernel.org" <linux-tegra@vger.kernel.org>,
 "mark.rutland@arm.com" <mark.rutland@arm.com>,
 Thierry Reding <treding@nvidia.com>, Jon Hunter <jonathanh@nvidia.com>,
 Vikram Sethi <vsethi@nvidia.com>, Rich Wiley <rwiley@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>
References: <20250923001840.1586078-1-bwicaksono@nvidia.com>
 <20250923001840.1586078-2-bwicaksono@nvidia.com>
 <331bea5f-cfab-49fb-87e4-7ec31523c2c3@arm.com>
 <SJ0PR12MB56769D95623AA45135F113A8A01FA@SJ0PR12MB5676.namprd12.prod.outlook.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <SJ0PR12MB56769D95623AA45135F113A8A01FA@SJ0PR12MB5676.namprd12.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250926_030128_522406_0D828BA1 
X-CRM114-Status: GOOD (  12.53  )
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

On 25/09/2025 18:13, Besar Wicaksono wrote:
> 
> 
>> -----Original Message-----
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Sent: Thursday, September 25, 2025 3:31 AM
>> To: Besar Wicaksono <bwicaksono@nvidia.com>; will@kernel.org;
>> robin.murphy@arm.com; ilkka@os.amperecomputing.com
>> Cc: linux-arm-kernel@lists.infradead.org; linux-kernel@vger.kernel.org; linux-
>> tegra@vger.kernel.org; mark.rutland@arm.com; Thierry Reding
>> <treding@nvidia.com>; Jon Hunter <jonathanh@nvidia.com>; Vikram Sethi
>> <vsethi@nvidia.com>; Rich Wiley <rwiley@nvidia.com>; Shanker Donthineni
>> <sdonthineni@nvidia.com>
>> Subject: Re: [PATCH v2 1/5] perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
>>
>> External email: Use caution opening links or attachments
>>
>>
>> On 23/09/2025 01:18, Besar Wicaksono wrote:
>>> Add interface to get ACPI device associated with the
>>> PMU. This ACPI device may contain additional properties
>>> not covered by the standard properties.
>>>
>>
>> Ok, but who needs this ? I couldn't see any users in the series.
>> Did I miss something ?
> 
> NVIDIA will need it to support upcoming PMU devices.
> I am still preparing the follow up patch series containing the use case
> on these new devices.

Thanks for the explanation. It would be good to post something with a 
user. You could post this patch, with the future series then.

Suzuki


