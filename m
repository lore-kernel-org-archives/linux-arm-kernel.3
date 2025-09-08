Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFE26CAC587
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  8 Sep 2025 23:52:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EtMAi+O6xrMNTbHPmvVx3sT3bj+bsNGC/kr8rZz3ygI=; b=u8RbLyCxi0C/zpOSWXsyDHZBOB
	CkuTF4YEnKIX/dnEUlMn+eosoX3OxVeTfr+yA63QmX6Uox3P4abW9cabLReOTIBcsYn4mkdHVcagR
	24a4qieOxRcc911fbq/SrBo+8YEcyo3VbkSyftcG3GgLUj3M952hZ5k1+hV/tpSCLc+pmdl0JvHYS
	ubmp2EdAm8JmVHbrj9k4ZtbXH4+cmV0LZZkQaRQaBp2pYR8ap1MCsPV/5gStHqien71RebQjGbWgu
	xXCKoaPEs2t31zme7T4n/CMIFjAxUqZyI6mmuSoaszVWfEWzrPr28mTTME7mtZsofp0xNJ2yFYucY
	8StvBGEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvleq-000000033Mr-0z3n;
	Mon, 08 Sep 2025 23:52:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvg7r-00000001MXA-3nm6
	for linux-arm-kernel@lists.infradead.org;
	Mon, 08 Sep 2025 17:58:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2141D1BCA;
	Mon,  8 Sep 2025 10:57:51 -0700 (PDT)
Received: from [10.1.197.69] (eglon.cambridge.arm.com [10.1.197.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 974F93F694;
	Mon,  8 Sep 2025 10:57:53 -0700 (PDT)
Message-ID: <29f46ae0-1265-42e6-a8e4-7d9fba9a35b5@arm.com>
Date: Mon, 8 Sep 2025 18:57:45 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 13/33] arm_mpam: Add MPAM MSC register layout definitions
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-acpi@vger.kernel.org,
 devicetree@vger.kernel.org
Cc: shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>,
 carl@os.amperecomputing.com, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, fenghuay@nvidia.com,
 baisheng.gao@unisoc.com, Jonathan Cameron <jonathan.cameron@huawei.com>,
 Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
 Rafael Wysocki <rafael@kernel.org>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>, Hanjun Guo
 <guohanjun@huawei.com>, Sudeep Holla <sudeep.holla@arm.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Danilo Krummrich <dakr@kernel.org>
References: <20250822153048.2287-1-james.morse@arm.com>
 <20250822153048.2287-14-james.morse@arm.com>
 <c183c51a-b094-44d7-8865-d2495478ff7b@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <c183c51a-b094-44d7-8865-d2495478ff7b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250908_105759_991382_B4A20638 
X-CRM114-Status: UNSURE (   8.94  )
X-CRM114-Notice: Please train this message.
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

Hi Ben,

On 29/08/2025 09:42, Ben Horgan wrote:
> On 8/22/25 16:29, James Morse wrote:
>> Memory Partitioning and Monitoring (MPAM) has memory mapped devices
>> (MSCs) with an identity/configuration page.
>>
>> Add the definitions for these registers as offset within the page(s).

>> diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
>> index d49bb884b433..6e0982a1a9ac 100644
>> --- a/drivers/resctrl/mpam_internal.h
>> +++ b/drivers/resctrl/mpam_internal.h
>> @@ -150,4 +150,270 @@ extern struct list_head mpam_classes;

>> +/* MPAMF_PARTID_NRW_IDR - MPAM PARTID narrowing ID register */
>> +#define MPAMF_PARTID_NRW_IDR_INTPARTID_MAX      GENMASK(15, 0)
> 
> nit: spaces used instead of tabs

Fixed,

~

> The names and values match the specification.
> 
> Reviewed-by: Ben Horgan <ben.horgan@arm.com>

Thanks!

James

