Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 310E3CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Nov 2025 14:56:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDMBnPvR0SZGzdm//dan7ZzD2F1F7ldqUYtuR1uALFY=; b=VaheL0qNYy8tEzyh+95QXQntBD
	XAF0HalGDU+n/3g+Ktl2ys+PNehG3mdMCbRj5hIHV5x+Sx94TkhjxzmOYXcGWKAf+oJlDZiJDulH2
	OVB+U6rLTBufeaI1VeNicP6/y9DirNDtFkCO5TSRvCd2l/tC0Knvs0maQa5lXj0szMmYBrYADjL+J
	xXm7GSOXxIetSmV7Zh/JIouucFvByVqe66JwbLS4MGDN147xWqKcRufLtakvFI6tsBoyOhYkJ8fI+
	1A5vTMXDvWeO/xy1nLazr2R+QocMfycz94zJKREdAjXfQtmD8LR3x4zp0LZb9N5Vm8YKdQcUVJFLU
	LhECa77A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCGL-00000008zdt-1Eqp;
	Wed, 12 Nov 2025 14:55:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJCGI-00000008zdX-1RCN
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Nov 2025 14:55:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B993E1515;
	Wed, 12 Nov 2025 06:55:45 -0800 (PST)
Received: from [10.1.196.46] (e134344.arm.com [10.1.196.46])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D0D483F66E;
	Wed, 12 Nov 2025 06:55:48 -0800 (PST)
Message-ID: <a9edf77f-41d8-4e3c-b621-e2d37604a410@arm.com>
Date: Wed, 12 Nov 2025 14:55:47 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 09/33] ACPI / MPAM: Parse the MPAM table
To: "Shaopeng Tan (Fujitsu)" <tan.shaopeng@fujitsu.com>,
 "james.morse@arm.com" <james.morse@arm.com>
Cc: "amitsinght@marvell.com" <amitsinght@marvell.com>,
 "baisheng.gao@unisoc.com" <baisheng.gao@unisoc.com>,
 "baolin.wang@linux.alibaba.com" <baolin.wang@linux.alibaba.com>,
 "bobo.shaobowang@huawei.com" <bobo.shaobowang@huawei.com>,
 "carl@os.amperecomputing.com" <carl@os.amperecomputing.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "dakr@kernel.org" <dakr@kernel.org>,
 "dave.martin@arm.com" <dave.martin@arm.com>,
 "david@redhat.com" <david@redhat.com>,
 "dfustini@baylibre.com" <dfustini@baylibre.com>,
 "fenghuay@nvidia.com" <fenghuay@nvidia.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "gshan@redhat.com" <gshan@redhat.com>,
 "guohanjun@huawei.com" <guohanjun@huawei.com>,
 "jeremy.linton@arm.com" <jeremy.linton@arm.com>,
 "jonathan.cameron@huawei.com" <jonathan.cameron@huawei.com>,
 "kobak@nvidia.com" <kobak@nvidia.com>,
 "lcherian@marvell.com" <lcherian@marvell.com>,
 "lenb@kernel.org" <lenb@kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "lpieralisi@kernel.org" <lpieralisi@kernel.org>,
 "peternewman@google.com" <peternewman@google.com>,
 "quic_jiles@quicinc.com" <quic_jiles@quicinc.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "robh@kernel.org"
 <robh@kernel.org>, "rohit.mathew@arm.com" <rohit.mathew@arm.com>,
 "scott@os.amperecomputing.com" <scott@os.amperecomputing.com>,
 "sdonthineni@nvidia.com" <sdonthineni@nvidia.com>,
 "sudeep.holla@arm.com" <sudeep.holla@arm.com>,
 "will@kernel.org" <will@kernel.org>,
 "xhao@linux.alibaba.com" <xhao@linux.alibaba.com>
References: <20251107123450.664001-1-ben.horgan@arm.com>
 <20251107123450.664001-10-ben.horgan@arm.com>
 <OSZPR01MB8798996B4D879FF695AE216C8BCCA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
From: Ben Horgan <ben.horgan@arm.com>
Content-Language: en-US
In-Reply-To: <OSZPR01MB8798996B4D879FF695AE216C8BCCA@OSZPR01MB8798.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251112_065554_542629_6806EEFA 
X-CRM114-Status: GOOD (  14.18  )
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

On 11/12/25 07:01, Shaopeng Tan (Fujitsu) wrote:
> Hello Ben,
> 
>> From: James Morse <james.morse@arm.com>
>>
>> Add code to parse the arm64 specific MPAM table, looking up the cache level
>> from the PPTT and feeding the end result into the MPAM driver.
>>
>> This happens in two stages. Platform devices are created first for the MSC
>> devices. Once the driver probes it calls acpi_mpam_parse_resources() to
>> discover the RIS entries the MSC contains.
>>
>> For now the MPAM hook mpam_ris_create() is stubbed out, but will update the
>> MPAM driver with optional discovered data about the RIS entries.
>>
>> CC: Carl Worth <carl@os.amperecomputing.com>
>> Link: https://developer.arm.com/documentation/den0065/3-0bet/?lang=en
>> Reviewed-by: Lorenzo Pieralisi <lpieralisi@kernel.org>
>> Tested-by: Fenghua Yu <fenghuay@nvidia.com>
>> Tested-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
>> Tested-by: Peter Newman <peternewman@google.com>
>> Signed-off-by: James Morse <james.morse@arm.com>
>> Signed-off-by: Ben Horgan <ben.horgan@arm.com>

>> +static struct platform_device * __init acpi_mpam_parse_msc(struct
>> +acpi_mpam_msc_node *tbl_msc) {
>> +	struct platform_device *pdev __free(platform_device_put) =
>> +		platform_device_alloc("mpam_msc", tbl_msc->identifier);
>> +	int next_res = 0, next_prop = 0, err;
>> +	/* pcc, nrdy, affinity and a sentinel */
>> +	struct property_entry props[4] = { 0 };
>> +	/* mmio, 2xirq, no sentinel. */
>> +	struct resource res[3] = { 0 };
>> +	struct acpi_device *companion;
>> +	enum mpam_msc_iface iface;
>> +	char uid[16];
>> +	u32 acpi_id;
>> +
>> +	if (!pdev)
>> +		return ERR_PTR(-ENOMEM);
>> +
>> +	/* Some power management is described in the namespace: */
>> +	err = snprintf(uid, sizeof(uid), "%u", tbl_msc->identifier);
> 
> It's a bit strange to store the uid length in the variable err.

A little, yes. The value is only used for error checking and it's not
that uncommon so I'll leave it as is.

linux$ git grep 'err = snprintf' | wc -l
17

> Reviewed-by: Shaopeng Tan <tan.shaopeng@jp.fujitsu.com>
> 

Thanks!
Thanks,

Ben


