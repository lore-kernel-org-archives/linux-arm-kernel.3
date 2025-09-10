Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A187ECA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Sep 2025 19:31:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PEJnj0D+uPeU0SmJlUyQ+ToDtN6MCdEENLdyH2GWFxw=; b=noKYGx8s5GDM2pxXtp3mtmmg0M
	felYR9E2u6kYMBt83TFqochoFGmTGWmswwJ7AbcsNxad4hl4CZNc3BB6WM4QhsumNYGjzoTPbimG1
	KJDHyqAw0TI3TeAvTkiJJV4uXcskorDJoMyEjAX9k5gH+fuyfr9tl80cDL/F5Z+sW019z7QKGmc7P
	vbu+Ajd6RFCvIGp/sIoOaDrID9hNUPVxga+b4EKRKrPCnNWUo5sQmyutNGEYh617DO+GZTzO5zV/b
	b40qXScBubRZ72EDM3cbHSnfHQbknc01OUgm4kEQLoRBS+hT9uAlzbcoERlYLNuSoBlVFvWQTpNOI
	oGDYlyWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQXU-0000000GIwD-2jUR;
	Wed, 10 Sep 2025 19:31:32 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uwQXP-0000000GIr5-2jiC
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Sep 2025 19:31:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6A40816F2;
	Wed, 10 Sep 2025 12:31:18 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id EBA5F3F694;
	Wed, 10 Sep 2025 12:31:20 -0700 (PDT)
Message-ID: <9f00c748-c3cd-4f31-aefd-b27a4af343be@arm.com>
Date: Wed, 10 Sep 2025 20:31:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/33] arm_mpam: Add probe/remove for mpam msc driver and
 kbuild boiler plate
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
 <20250822153048.2287-45-james.morse@arm.com>
 <OSZPR01MB87984A649F19363669F1D6688B0FA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <OSZPR01MB87984A649F19363669F1D6688B0FA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250910_123127_846952_E95AB605 
X-CRM114-Status: GOOD (  12.74  )
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

On 09/09/2025 08:03, Shaopeng Tan (Fujitsu) wrote:
>> Probing MPAM is convoluted. MSCs that are integrated with a CPU may only be
>> accessible from those CPUs, and they may not be online.
>> Touching the hardware early is pointless as MPAM can't be used until the
>> system-wide common values for num_partid and num_pmg have been
>> discovered.
>>
>> Start with driver probe/remove and mapping the MSC.

>> diff --git a/drivers/resctrl/mpam_devices.c b/drivers/resctrl/mpam_devices.c
>> new file mode 100644 index 000000000000..a0d9a699a6e7
>> --- /dev/null
>> +++ b/drivers/resctrl/mpam_devices.c
>> @@ -0,0 +1,336 @@

>> +static int mpam_dt_parse_resources(struct mpam_msc *msc, void *ignored)
>> +{
>> +	int err, num_ris = 0;
>> +	const u32 *ris_idx_p;
>> +	struct device_node *iter, *np;
>> +
>> +	np = msc->pdev->dev.of_node;
>> +	for_each_child_of_node(np, iter) {
>> +		ris_idx_p = of_get_property(iter, "reg", NULL);
>> +		if (ris_idx_p) {
>> +			num_ris++;
>> +			err = mpam_dt_parse_resource(msc, iter, *ris_idx_p);
>> +			if (err) {
>> +				of_node_put(iter);
>> +				return err;
>> +			}
>> +		}
>> +	}
>> +
>> +	if (!num_ris)
>> +		mpam_dt_parse_resource(msc, np, 0);

> err = mpam_dt_parse_resource(msc, np, 0);

Oops! Thanks for catching that,


James

