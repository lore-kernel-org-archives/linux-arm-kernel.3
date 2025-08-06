Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA895C87FCB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Aug 2025 18:08:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mdcvac7VH7DabwhIJiKRdtx4O2I+pmngUy7vxhDrgCQ=; b=Ylsrv+7FXfr2ZsTSszcWn3+epP
	pK0/qlLOfTwGvouKf9FGPJsJe+GjdpYOiPKQu6zezbHgSiwPXgVkn/dbQWagpxt214HfEsyaZEPNP
	a+6vxnTnVb78CqTcDVW8puRs2ctLySy95OMhAyT078PnAS4mEFtHJUVk3Gy+mrBVNsjDn3NnRl8Kb
	WVQUulte1Y6ncEL95uusLgItFMALX1Bv35vH+vHa5rvkQYp9fvw3xT7JuntK65CCr2AuNNRkzX/16
	VzGEV35kWnY5vD8dQvxwvQ/+DjjguS745lLut9OeF7nFvdGZTTa2SI2t+owEOU+x4zHojQ4JjErp+
	TiaFE1wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiZE-0000000G1pQ-1J0E;
	Wed, 06 Aug 2025 18:08:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiUQ-0000000G0yc-2QOK
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 06 Aug 2025 18:03:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=Mdcvac7VH7DabwhIJiKRdtx4O2I+pmngUy7vxhDrgCQ=; b=k4YpthrTIUYxoEacTouY7uSBnj
	UsXwnkjl4R3g+SkDnOU2tNO+J6CnXj5PU3j786OmJVKnMrnR4p7jJuaPhcefyZvMxTnhtgR7feZyO
	aMDGqRJJU7EV0gUiaHbFFo9GJh9WVig46MY8XvSZXZcq52rnLU/y1wKF3Qo03f1Jhq1KRjoUKQp8L
	Smgrc4fSGOydTzEgIJitTf/60KKbgfULIsYA67ZeoovanM+VYMSko3aS8Gu8XIU1etR4YDcxqllAN
	3MZ9yHWPU/hHW7k5dkYeN5dJKN2o44xU+pelTSZ2HQpX9efD8D+tJ0VxZKbqY+SHuyVUvvRttT3Qq
	4EpeITSQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujiUN-0000000EMdg-2RMi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Aug 2025 18:03:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id B27B6176C;
	Wed,  6 Aug 2025 11:03:34 -0700 (PDT)
Received: from [10.1.197.43] (eglon.cambridge.arm.com [10.1.197.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id A2DBF3F738;
	Wed,  6 Aug 2025 11:03:32 -0700 (PDT)
Message-ID: <bd30c235-a403-4d81-9bfa-3f6a15450f23@arm.com>
Date: Wed, 6 Aug 2025 19:03:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] platform: arm64: Move ec devices to an ec
 subdirectory
To: Ben Horgan <ben.horgan@arm.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org
Cc: Rob Herring <robh@kernel.org>, Rohit Mathew <rohit.mathew@arm.com>,
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
 <d91f3a83-16d5-47c0-b227-941df5c25991@arm.com>
Content-Language: en-GB
From: James Morse <james.morse@arm.com>
In-Reply-To: <d91f3a83-16d5-47c0-b227-941df5c25991@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250806_190347_860915_9598FA6D 
X-CRM114-Status: GOOD (  17.45  )
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

On 24/07/2025 11:56, Ben Horgan wrote:
> On 11/07/2025 19:36, James Morse wrote:
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


>> diff --git a/drivers/platform/arm64/ec/Kconfig b/drivers/platform/arm64/ec/Kconfig
>> new file mode 100644
>> index 000000000000..06288aebc559
>> --- /dev/null
>> +++ b/drivers/platform/arm64/ec/Kconfig
>> @@ -0,0 +1,73 @@
>> +# SPDX-License-Identifier: GPL-2.0-only
>> +#
>> +# EC-like Drivers for aarch64 based devices.
>> +#
>> +
>> +menuconfig ARM64_PLATFORM_DEVICES
>> +    bool "ARM64 Platform-Specific Device Drivers"
>> +    depends on ARM64 || COMPILE_TEST
>> +    default ARM64
>> +    help
>> +      Say Y here to get to see options for platform-specific device drivers
>> +      for arm64 based devices, primarily EC-like device drivers.
>> +      This option alone does not add any kernel code.
>> +
>> +      If you say N, all options in this submenu will be skipped and disabled.
>> +
>> +if ARM64_PLATFORM_DEVICES

> Shouldn't this be kept in the directory above? By the description this would be expected
> to apply to all drivers in drivers/platfrom/arm64.

Doing that makes any MPAM options appear under 'Platform-Specific Device Drivers' too. I
didn't to that as MPAM isn't specific to one platform, but doesn't fit under any of the
bus or high level groups under drivers. (I briefly toyed with drivers/perf - as there
isn't a drivers/qos).


Thanks,

James

