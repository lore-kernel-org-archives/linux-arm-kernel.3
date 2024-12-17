Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA3AE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 20:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rd4f3soLjvrasmFpqSY9zhJG2zxLz+EAi51yKBWbwXQ=; b=nzQ6b8LeAwkEzyd/13PkRCmUzQ
	KJUe6KzBs3aG9JDzGy6sF0r5LTe/cjYwusA5RkLFVlJr+eECoEiGMz84YH6AwlmrIVnxSqEM6MxLq
	LtQdD/7OVQoL+qW6CYKX+dVYBtXN5JBChEuOVUg2AH5aC9Z7tiuRIrx0HYo/31oskMo0J5+RZGvhv
	tn8LqhSZnZyaXHeXr3dAy+nrqs5LaRtw2vwnlGqiRx0Z1cuUvnbnhGYo6BxUnkBVhpLHIEtVE6RVf
	GwCh/ZDrOvF4qEMneaYiE943GWIscZtTXZluYMe3KQ8EG5pV9xmYYQWzP69nqNSX6mZZqltzAtLVg
	f2YQ2TSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe4Y-0000000EjTW-3vO6;
	Tue, 17 Dec 2024 20:21:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNe07-0000000EifV-1cNW
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 20:17:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 082C9497;
	Tue, 17 Dec 2024 12:17:28 -0800 (PST)
Received: from [172.27.42.65] (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BF93F3F528;
	Tue, 17 Dec 2024 12:16:59 -0800 (PST)
Message-ID: <8ef0a63c-bde2-443b-b2fd-59d24c5e18e6@arm.com>
Date: Tue, 17 Dec 2024 14:16:59 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/1] arm64: rsi: Add automatic arm-cca-guest module
 loading
To: Itaru Kitayama <itaru.kitayama@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, suzuki.poulose@arm.com,
 gshan@redhat.com, steven.price@arm.com, sami.mujawar@arm.com,
 catalin.marinas@arm.com, will@kernel.org, linux-kernel@vger.kernel.org
References: <20241207012128.247522-1-jeremy.linton@arm.com>
 <20241207012128.247522-2-jeremy.linton@arm.com> <Z1Uiz7Hn2XisyP-N@vm3>
Content-Language: en-US
From: Jeremy Linton <jeremy.linton@arm.com>
In-Reply-To: <Z1Uiz7Hn2XisyP-N@vm3>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241217_121703_516547_35A1A0E6 
X-CRM114-Status: GOOD (  20.05  )
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

Hi,

On 12/7/24 10:38 PM, Itaru Kitayama wrote:
> Hi Jeremy,
> 
> On Fri, Dec 06, 2024 at 07:21:28PM -0600, Jeremy Linton wrote:
>> The TSM module provides guest identification and attestation when a
>> guest runs in CCA mode. By creating a dummy platform device, let's
> 
> Perhaps could you spell out like; a guest runs in the Realm state?

Thanks for looking at this.

I thought that was evident from the rest of the commits here, but sure.

Thanks again.


> 
> Thanks,
> Itaru.
>   
>> ensure the module is automatically loaded. The udev daemon loads the
>> TSM module after it receives a device addition event. Once that
>> happens, it can be used earlier in the boot process to decrypt the
>> rootfs.
>>
>> Signed-off-by: Jeremy Linton <jeremy.linton@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> ---
>>   arch/arm64/include/asm/rsi.h                    |  2 ++
>>   arch/arm64/kernel/rsi.c                         | 15 +++++++++++++++
>>   drivers/virt/coco/arm-cca-guest/arm-cca-guest.c |  8 ++++++++
>>   3 files changed, 25 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
>> index 188cbb9b23f5..b42aeac05340 100644
>> --- a/arch/arm64/include/asm/rsi.h
>> +++ b/arch/arm64/include/asm/rsi.h
>> @@ -10,6 +10,8 @@
>>   #include <linux/jump_label.h>
>>   #include <asm/rsi_cmds.h>
>>   
>> +#define RSI_PDEV_NAME "arm-cca-dev"
>> +
>>   DECLARE_STATIC_KEY_FALSE(rsi_present);
>>   
>>   void __init arm64_rsi_init(void);
>> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
>> index 3031f25c32ef..5434e5496ac2 100644
>> --- a/arch/arm64/kernel/rsi.c
>> +++ b/arch/arm64/kernel/rsi.c
>> @@ -8,6 +8,7 @@
>>   #include <linux/psci.h>
>>   #include <linux/swiotlb.h>
>>   #include <linux/cc_platform.h>
>> +#include <linux/platform_device.h>
>>   
>>   #include <asm/io.h>
>>   #include <asm/mem_encrypt.h>
>> @@ -140,3 +141,17 @@ void __init arm64_rsi_init(void)
>>   	static_branch_enable(&rsi_present);
>>   }
>>   
>> +static struct platform_device rsi_dev = {
>> +	.name = RSI_PDEV_NAME,
>> +	.id = PLATFORM_DEVID_NONE
>> +};
>> +
>> +static int __init rsi_init(void)
>> +{
>> +	if (is_realm_world() &&
>> +	    platform_device_register(&rsi_dev))
>> +		pr_err("failed to register rsi platform device\n");
>> +	return 0;
>> +}
>> +
>> +arch_initcall(rsi_init)
>> diff --git a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>> index 488153879ec9..87f162736b2e 100644
>> --- a/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>> +++ b/drivers/virt/coco/arm-cca-guest/arm-cca-guest.c
>> @@ -6,6 +6,7 @@
>>   #include <linux/arm-smccc.h>
>>   #include <linux/cc_platform.h>
>>   #include <linux/kernel.h>
>> +#include <linux/mod_devicetable.h>
>>   #include <linux/module.h>
>>   #include <linux/smp.h>
>>   #include <linux/tsm.h>
>> @@ -219,6 +220,13 @@ static void __exit arm_cca_guest_exit(void)
>>   }
>>   module_exit(arm_cca_guest_exit);
>>   
>> +/* modalias, so userspace can autoload this module when RSI is available */
>> +static const struct platform_device_id arm_cca_match[] __maybe_unused = {
>> +	{ RSI_PDEV_NAME, 0},
>> +	{ }
>> +};
>> +
>> +MODULE_DEVICE_TABLE(platform, arm_cca_match);
>>   MODULE_AUTHOR("Sami Mujawar <sami.mujawar@arm.com>");
>>   MODULE_DESCRIPTION("Arm CCA Guest TSM Driver");
>>   MODULE_LICENSE("GPL");
>> -- 
>> 2.46.0
>>


