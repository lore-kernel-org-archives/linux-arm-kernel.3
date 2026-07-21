Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11FC3C44532
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 14:51:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YsB9ocO8/4au5PZ9wDhRfUU9XPnC08UzoXRec/v2v6A=; b=4U38bk9MAHQguQitlW1hlqrFC8
	qb4Wfac4Rv84CJWFmSzt+ftHYf0hTW8xX83giO0lsqDtGqPKTzvbzuIo9Y72PaYt0x4LoSgZI1WTP
	U4LGdgsKkfLUqMZyERyfEZxaZpF/2Ob9HXzuKWgqK7gC3gu3GYiTE9pDA820QkQVn23p6JM3yHvxO
	nlzLCI3bNvrpYDpxd6w/KvuV9ptaBkYujta3iVL+G/hIUtceCsNtfpw7EKsWBHH3mfxBQbKJBzlYw
	l99Tlnv15aFJR55dLmxLRXXD0o/yVxdPIttp/59xUT/FlwiKXUuq90kfwk2w06E2zuvnWm/EBY4Fs
	G+wa1iZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBoI-00000009hax-2gLQ;
	Tue, 21 Jul 2026 14:51:06 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmBoG-00000009haY-2aoK
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 14:51:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66B3D152B;
	Tue, 21 Jul 2026 07:50:58 -0700 (PDT)
Received: from [192.168.178.24] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id F0A1B3F86F;
	Tue, 21 Jul 2026 07:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784645462; bh=Vcis6t4xUy77hTPy7uY299+DZ2Az+Lpqnoisp68jgOU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QlXCWJTcqmg3GqQSmuLEHqq2bzT2gP4nc2CFnk0xn1Bxa18KQC7cbCKux+aQFLPZQ
	 6Z+tZYD8xDpeLtXK/DnyZi5BWXWGsSNeQAVdrYPRk5qLtGp8UgYwJrMs5d9yQ3fZ6B
	 ajSZ0TBYDiiBZjFIoH66E0UVyUJQmUXoHPwcnW3Q=
Message-ID: <f287f45c-4eaa-44bc-9c2a-07767bd5085a@arm.com>
Date: Tue, 21 Jul 2026 16:51:00 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 16/16] arm_mpam: detect and enable MPAM-Fb PCC support
To: Lee Trager <lee@trager.us>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Hanjun Guo <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
 Reinette Chatre <reinette.chatre@intel.com>, Fenghua Yu <fenghuay@nvidia.com>
Cc: Jonathan Cameron <jic23@kernel.org>,
 Srivathsa L Rao <srivathsa.rao@oss.qualcomm.com>,
 Ganapatrao Kulkarni <ganapatrao.kulkarni@oss.qualcomm.com>,
 Trilok Soni <tsoni@quicinc.com>, Srinivas Ramana <sramana@qti.qualcomm.com>,
 Niyas Sait <niyas.sait@arm.com>, linux-acpi@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260710144520.917375-1-andre.przywara@arm.com>
 <20260710144520.917375-17-andre.przywara@arm.com>
 <52dc486f-2ef2-4c57-b3fb-fb4c240a9198@trager.us_quarantine>
Content-Language: en-GB
From: Andre Przywara <andre.przywara@arm.com>
In-Reply-To: <52dc486f-2ef2-4c57-b3fb-fb4c240a9198@trager.us_quarantine>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260721_075104_896488_FACEB6EF 
X-CRM114-Status: GOOD (  13.94  )
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

Hi Lee,

On 7/15/26 18:08, Lee Trager wrote:
> On 7/10/26 7:45 AM, Andre Przywara wrote:
> 
>> diff --git a/drivers/acpi/arm64/mpam.c b/drivers/acpi/arm64/mpam.c
>> index 84963a20c3e7..64bc84bb2029 100644
>> --- a/drivers/acpi/arm64/mpam.c
>> +++ b/drivers/acpi/arm64/mpam.c
>> @@ -256,6 +256,8 @@ static struct platform_device * __init 
>> acpi_mpam_parse_msc(struct acpi_mpam_msc_
>>       } else if (iface == MPAM_IFACE_PCC) {
>>           props[next_prop++] = PROPERTY_ENTRY_U32("pcc-channel",
>>                               tbl_msc->base_address);
>> +        props[next_prop++] = PROPERTY_ENTRY_U32("msc-id",
>> +                            tbl_msc->identifier);
>>       }
> 
> props is defined above as:
> 
> /* pcc, nrdy, affinity, and a sentinel */
> 
> struct property_entry props[4] = { 0 };
> 
> With the addition of the new property the array size needs to be 
> increased to 5 and the comment updated

Ouch, that's right. For now we are saved by the fact that the affinity 
value is not used, so there is a free slot now. And there are checks in 
place to avoid writing over the sentinel. But indeed the size needs to 
be increased. Thanks for catching this!

Cheers,
Andre



