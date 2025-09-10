Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4970BCA101F
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:31:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C9SIyn4yUXwsHCsexOtcDVhkZtX76tDaQq9OOWRSOq8=; b=YEH1/0RUeRsZj1iNJJxt/jq7GZ
	UrxSaijCt6X2Pcu4CESSRN3/6AnyTrNDW+CnTTKhFJBKbEl1Ikfvj0BGzCs6en7xD0g7AWCtxa3OP
	xUcFVxAr3bMhNWQBeZDGHh5b9r3J5j1ZjBFCMOsboU42EQV7aOV4tFfudceL/MdnYwfb8P0r88xhG
	JihTYFOeh60AcZchLs64TBjh050QD4e0Gbvj5CEbDx+5jwJac4ggYkcmtVo4+Zt/kUYtUMTkRtrig
	GWGFGeuPQBVUNXHZGp7SLVHXEsUctrAfVz/hAP6FG25MMN8Z/0R5xw3WE3ZKxadjLHz0pyIzRJ5W0
	tUe86svA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQXe-0000000GJ4b-0M9S;
	Wed, 10 Sep 2025 19:31:42 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQXX-0000000GIz5-3gvW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:31:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 310FD3165;
	Wed, 10 Sep 2025 12:31:26 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7C6363F694;
	Wed, 10 Sep 2025 12:31:28 -0700 (PDT)
Message-ID: <25e99137-54ee-434d-8777-a771798e9da1@arm.com>
Date: Wed, 10 Sep 2025 20:31:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/33] arm_mpam: Add support for memory controller MSC on
 DT platforms
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
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-46-james.morse@arm.com>
 <OSZPR01MB8798A7AA3C2D11E2D38381BA8B0FA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB8798A7AA3C2D11E2D38381BA8B0FA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123136_086380_6B68EAC8 
X-CRM114-Status: GOOD (  16.62  )
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

On 09/09/2025 08:11, Shaopeng Tan (Fujitsu) wrote:
>> From: Shanker Donthineni <sdonthineni@nvidia.com>
>>
>> The device-tree binding has two examples for MSC associated with memory
>> controllers. Add the support to discover the component_id from the device-tree
>> and create 'memory' RIS.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> index a0d9a699a6e7..71a1fb1a9c75 100644
>> --- a/drivers/resctrl/mpam_devices.c
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -62,41 +62,63 @@ static int mpam_dt_parse_resource(struct mpam_msc
>> *msc, struct device_node *np,
>>  				  u32 ris_idx)
>>  {
>>  	int err = 0;
>> -	u32 level = 0;
>> -	unsigned long cache_id;
>> -	struct device_node *cache;
>> +	u32 class_id = 0, component_id = 0;
>> +	struct device_node *cache = NULL, *memory = NULL;
>> +	enum mpam_class_types type = MPAM_CLASS_UNKNOWN;
>>
>>  	do {
>> +		/* What kind of MSC is this? */
>>  		if (of_device_is_compatible(np, "arm,mpam-cache")) {
>>  			cache = of_parse_phandle(np, "arm,mpam-device",
>> 0);
>>  			if (!cache) {
>>  				pr_err("Failed to read phandle\n");
>>  				break;
>>  			}
>> +			type = MPAM_CLASS_CACHE;
>>  		} else if (of_device_is_compatible(np->parent, "cache")) {
>>  			cache = of_node_get(np->parent);
>> +			type = MPAM_CLASS_CACHE;
>> +		} else if (of_device_is_compatible(np, "arm,mpam-memory"))
>> {
>> +			memory = of_parse_phandle(np, "arm,mpam-device",
>> 0);
>> +			if (!memory) {
>> +				pr_err("Failed to read phandle\n");
>> +				break;
>> +			}
>> +			type = MPAM_CLASS_MEMORY;
>> +		} else if (of_device_is_compatible(np,
>> "arm,mpam-memory-controller-msc")) {
>> +			memory = of_node_get(np->parent);
>> +			type = MPAM_CLASS_MEMORY;
>>  		} else {
>> -			/* For now, only caches are supported */
>> -			cache = NULL;
>> +			/*
>> +			 * For now, only caches and memory controllers are
>> +			 * supported.
>> +			 */
>>  			break;
>>  		}

> There is no need "{}" here.

Sure, but its more than one line, and all the previous parts of this else-if tree have
them. Keeping this here make it much easier to read.


Thanks,

James

