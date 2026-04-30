Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 585FCFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 09:21:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LAtR5P4HjzDS5S4/8twG1WZlBNGdlqU/FR0a99IMmqE=; b=LtlfwYApf1/aoJnQLEGMteFiBz
	welSogOCdF1LHT2oeBO7BqAyGugD2ZZSs1ld/5R/Y1WK9gFZRxUrPoY23vF4IaUQ86GUxQ3JeV2SA
	mPwHQOaewiBfxpztl2RyvlYuP+9FtAEy8HhVRxsaTxFa0xu6Ptso6AZfT3IGXv30KMQv+Wo9szLfl
	K4nsriGFe+gA8BhDAnWqT8Zy4oiCJzhNBRMl9MW39tG2Mmfj4MR6qzI2RlYKKgp1LB9ccCMGbvTG/
	C6KUKtLVl7QTRzC4H4D3WBHVSa1jnkKioBJc3vp1sI6ci9mCmQr2gjtB65r5r2c3bjK1ArEoSxa+T
	XmN843yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINZl-000000055YR-1ZXD;
	Thu, 30 Apr 2026 09:20:53 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wINZg-000000055Xg-32MH
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 09:20:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 619F41A9A;
	Thu, 30 Apr 2026 02:20:41 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A06173F7B4;
	Thu, 30 Apr 2026 02:20:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777540846; bh=rEuYE3BOp0rZUoRuwFkMAOix88kidy9F1/N55h8chlI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=te8cLsXc/9padMNn1HNRnZmVeeS4irCJgGQmkQUJx4a0oAGiUezq/YFx/bt1hZWB+
	 POTepneGGzzLeDhIG4eJ7QNqLdMl+Fim4jSGEYfDdhhOMh7KsHE6bFLb79b30UpwCB
	 Eka39O2o43ZkyU0GGXm69bd6Sp8vsAt7UpJDuVVM=
Message-ID: <fc96c088-f767-4bf2-b58b-d4e91b0acde4@arm.com>
Date: Thu, 30 Apr 2026 11:20:42 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 5/5] arm_mpam: detect and enable MPAM-Fb PCC support
To: Sudeep Holla <sudeep.holla@kernel.org>
Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu
 <fenghuay@nvidia.com>, Jonathan Cameron <jic23@kernel.org>,
 linux-acpi@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20260429141339.3171205-1-andre.przywara@arm.com>
 <20260429141339.3171205-6-andre.przywara@arm.com>
 <20260430-brave-hoatzin-of-fascination-e7d4ad@sudeepholla>
Content-Language: en-US
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <20260430-brave-hoatzin-of-fascination-e7d4ad@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260430_022050_760982_47F9997C 
X-CRM114-Status: GOOD (  20.80  )
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

Hi Sudeep,

thanks for having a look!

On 4/30/26 10:35, Sudeep Holla wrote:
> On Wed, Apr 29, 2026 at 04:13:39PM +0200, Andre Przywara wrote:
>> The Arm MPAM-Fb specification [1] describes a protocol to access MSC
>> registers through a firmware interface. This requires a shared memory
>> region to hold the message, and a mailbox to trigger the access.
>> For ACPI this is wrapped as a PCC channel, described using existing
>> ACPI abstractions.
>>
>> Add code to parse those PCC table descriptions associated with an MSC,
>> and store the parsed information in the MSC struct.
>> This will be used by the MPAM-Fb access wrapper code.
>>
>> [1] https://developer.arm.com/documentation/den0144/latest
>>
>> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
>> ---
>>   drivers/acpi/arm64/mpam.c      |  2 ++
>>   drivers/resctrl/mpam_devices.c | 46 +++++++++++++++++++++++++++++++---
>>   2 files changed, 45 insertions(+), 3 deletions(-)
>>
>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>> index 99c2bdbb3314..edb4d10e8dc3 100644
>> --- a/drivers/acpi/arm64/mpam.c
>> +++ b/drivers/acpi/arm64/mpam.c
>> @@ -341,6 +341,8 @@ static struct platform_device * __init acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>   	} else if (iface == MPAM_IFACE_PCC) {
>>   		props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>>   							tbl_msc->base_address);
>> +		props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
>> +							tbl_msc->identifier);
> 
> I may be looking at the wrong documents, but neither DEN0065 nor DEN0144 carry
> any definitions of pcc-channel and msc-id for the device with HID
> "“ARMHAA5C". Since "pcc-channel" is already merged, I think I am looking at
> wrong documents, please point me to the right one.

Please excuse my ignorance, but I was under the assumption that the 
strings used here are just unique identifiers that need to match the 
property_get calls in the MPAM code. Is there any requirement to match 
those property_entry.name fields with the names given in some spec? And 
those strings are kernel-internal only, right? But for DT would match 
exactly the property names?

Those properties correspond to fields in table 4 in DEN0065, as also 
described in struct acpi_mpam_msc_node in include/acpi/actbl2.h:
- There is "Identifier", that uses distinct IDs for PCC and native MSCs. 
I named it msc-id, because I'd assume that to be a good name for any 
(yet to be defined) DT property.
- Then there is "Base address", which doubles as the "subspace ID of the 
PCC channel", when MPAM-Fb is used. As you mentioned, this is already 
in, and the original spec name would be very misleading, I think.

So shall those strings be renamed to match the struct names? Or shall I 
keep the more readable names as of now, and add comments linking them to 
the spec/struct?

Cheers,
Andre

