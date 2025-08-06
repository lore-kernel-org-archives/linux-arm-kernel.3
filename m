Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83666C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FgANDvFEQdWdY1Fodz0aRUh3xZtnOQANLaKvIIC82yk=; b=vIKI1EVP5wxlfoAUtaL0b9TUWW
	GxlU6+VeDPI6pH1hymUX8rGvmScAMFg/wy54YVP01XCjwTBgQjkrnmth4zKhAl+lrcEALAPxVbLmO
	Ajz3fmIQQgbp4diaGVwRqRt1lqxtVYQ3Vwjc9rEYx8WFmtzXxaK8lfaRkTz4H+JnDpeBgq6v/ktPA
	AZXUZ/XYJSjfO2uNgHJWVBkYa9UTcIcagpPaEdVk7EU+iu8VjTwtenxpDjkHjNRL0NtJpVTFD0Nbo
	9qeSHYJh7YZgvjgiXEXYKb4U4u+2EXAza2WDRdslfm1eaI58jrJFY4+/6ljlDmiHBuxL7KoTreYqK
	MXKgiUbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiWj-0000000G1QO-2Mr9;
	Wed, 06 Aug 2025 18:06:13 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiUB-0000000G0w0-1qmB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:03:37 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2BAF8176C;
	Wed,  6 Aug 2025 11:03:24 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 4651D3F738;
	Wed,  6 Aug 2025 11:03:18 -0700 (PDT)
Message-ID: <514df895-e9bc-4855-b18d-29b1949f67cf@arm.com>
Date: Wed, 6 Aug 2025 19:03:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] platform: arm64: Move ec devices to an ec
 subdirectory
To: Jonathan Cameron <Jonathan.Cameron@huawei.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Rob Herring <robh@kernel.org>, Ben Horgan <ben.horgan@arm.com>,
 Rohit Mathew <rohit.mathew@arm.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Zeng Heng
 <zengheng4@huawei.com>, Lecopzer Chen <lecopzerc@nvidia.com>,
 Carl Worth <carl@os.amperecomputing.com>,
 shameerali.kolothum.thodi@huawei.com,
 D Scott Phillips OS <scott@os.amperecomputing.com>, lcherian@marvell.com,
 bobo.shaobowang@huawei.com, tan.shaopeng@fujitsu.com,
 baolin.wang@linux.alibaba.com, Jamie Iles <quic_jiles@quicinc.com>,
 Xin Hao <xhao@linux.alibaba.com>, peternewman@google.com,
 dfustini@baylibre.com, amitsinght@marvell.com,
 David Hildenbrand <david@redhat.com>, Rex Nie <rex.nie@jaguarmicro.com>,
 Dave Martin <dave.martin@arm.com>, Koba Ko <kobak@nvidia.com>
References: <20250711183648.30766-1-james.morse@arm.com>
 <20250711183648.30766-13-james.morse@arm.com>
 <20250721173202.00002b51@huawei.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <20250721173202.00002b51@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_110335_521816_44CD99F7 
X-CRM114-Status: GOOD (  14.01  )
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

Hi Jonathan,

On 21/07/2025 17:32, Jonathan Cameron wrote:
> On Fri, 11 Jul 2025 18:36:24 +0000
> James Morse <james.morse@arm.com> wrote:
> 
>> commit 363c8aea257 "platform: Add ARM64 platform directory" added a
>> subdirectory for arm64 platform devices, but claims that all such
>> devices must be 'EC like'.
>>
>> The arm64 MPAM driver manages an MMIO interface that appears in memory
>> controllers, caches, IOMMU and connection points on the interconnect.
>> It doesn't fit into any existing subsystem.
>>
>> It would be convenient to use this subdirectory for drivers for other
>> arm64 platform devices which aren't closely coupled to the architecture
>> code and don't fit into any existing subsystem.
>>
>> Move the existing code and maintainer entries to be under
>> drivers/platform/arm64/ec. The MPAM driver will be added under
>> drivers/platform/arm64/mpam.

>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 4bac4ea21b64..bea01d413666 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -3549,15 +3549,15 @@ S:	Maintained
>>  F:	arch/arm64/boot/Makefile
>>  F:	scripts/make_fit.py
>>  
>> -ARM64 PLATFORM DRIVERS
>> -M:	Hans de Goede <hansg@kernel.org>
>> +ARM64 EC PLATFORM DRIVERS
>> +M:	Hans de Goede <hdegoede@redhat.com>
> 
> Smells like a rebase error as Hans' email address chagned
> to the kernel.org one in the 6.16 cycle.

Bother - yes, that's exactly what happened.


>>  M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>>  R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>>  L:	platform-driver-x86@vger.kernel.org
>>  S:	Maintained
>>  Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
>>  T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
>> -F:	drivers/platform/arm64/
>> +F:	drivers/platform/arm64/ec

> Other than that looks sensible to me but obviously needs tags from Hans or Ilpo.


Thanks,

James

