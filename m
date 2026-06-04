Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB7ECD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  4 Jun 2026 10:24:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/pkFu3+e5dug2oy2ct/8rr56HL49E/LMEyYuA7pE9d4=; b=Zvr9w4Yo77L2ddvjxewwX7dNdD
	hv1f30pq0kGA2i4hROt21XaUYdy+23i5JiMhgTy/b8csMdG7yG0oi5FnW0VsAjdIZEyivdLXZeFCg
	9ve2n/Gi5g559ASympaXR0grf56rS+suGM0Gds8mGdbRgexZwte2Vz7KS+S4Y7T3s4npU4MxcaJVN
	oKjv3IZe+Dl202SEIJNQ9CRyzBHQSSA75MwDtfQoKZsoNWK+SZYEhFa/Q6xUbifc5WXwZbQoDulLR
	cfIgTI2O0gQ+e3Le5brBJyZbNL1olfi/rzjEtAXQQoyFi0nuRzmvKTx29Rkfc7givWrw5QcKyr086
	bUc309Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5FE-0000000GZT1-2ptN;
	Thu, 04 Jun 2026 10:24:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wV5FC-0000000GZSR-0Shq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 04 Jun 2026 10:24:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 54F2A497;
	Thu,  4 Jun 2026 03:24:04 -0700 (PDT)
Received: from [10.1.31.44] (Suzukis-MBP.cambridge.arm.com [10.1.31.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6A0FF3F7D8;
	Thu,  4 Jun 2026 03:24:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780568649; bh=GOLViXGsANaa4b3Q03QnUA/suUOXvVvZf/cOY8uV/UQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=VqOaCIwFI1rUfNG6mmEPhsKl2U/C1zTZyN0FgtlsdwTprCBZ44+rM7xCyLMJqI/3u
	 iKO2irs82oHd/eh1/6FvjGkYlon/Ggy6rpzSXv4LVYx5hYq2KhGdPzha6P73u+HwBJ
	 gyeK+8CkC4ol2WzxG+UeO9cVewdQ4s6pTamWJfso=
Message-ID: <bee6166c-f63e-4692-a874-b80b7a6f6dc4@arm.com>
Date: Thu, 4 Jun 2026 11:24:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 3/4] firmware: smccc: arm-cca-guest: Bind the TSM
 provider to an SMCCC device
To: Sudeep Holla <sudeep.holla@kernel.org>,
 "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>
Cc: linux-coco@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>,
 Greg KH <gregkh@linuxfoundation.org>, Jeremy Linton <jeremy.linton@arm.com>,
 Jonathan Cameron <jic23@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>, Will Deacon <will@kernel.org>,
 Steven Price <steven.price@arm.com>
References: <20260527100233.428018-1-aneesh.kumar@kernel.org>
 <20260527100233.428018-4-aneesh.kumar@kernel.org>
 <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260603-determined-bumblebee-of-promise-e633d6@sudeepholla>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260604_032410_234137_FD6744C7 
X-CRM114-Status: GOOD (  39.93  )
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

On 04/06/2026 10:21, Sudeep Holla wrote:
> On Wed, May 27, 2026 at 03:32:32PM +0530, Aneesh Kumar K.V (Arm) wrote:
>> The Arm CCA guest TSM provider currently binds through the arm-cca-dev
>> platform device. Like arm-smccc-trng, this device is not an independent
>> platform resource; it is a software representation of the RSI firmware
>> service discovered through SMCCC.
>>
>> Move RSI discovery into the SMCCC firmware driver. When the SMCCC conduit
>> is SMC and the RSI ABI version check succeeds, create an arm-rsi-dev SMCCC
>> device. Convert the Arm CCA guest TSM provider to an SMCCC driver so it
>> binds to that discovered RSI service and keeps module autoloading through
>> the SMCCC device id table.
>>
>> Keep the old arm-cca-dev platform-device registration for now. Userspace
>> has used that device as a Realm-guest indicator, so removing it is left to
>> a follow-up patch that adds a replacement sysfs ABI.
>>
>> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
>> ---
>>   arch/arm64/include/asm/rsi.h                  |  2 +-
>>   arch/arm64/kernel/rsi.c                       |  2 +-
>>   drivers/firmware/smccc/Makefile               |  4 ++
>>   drivers/firmware/smccc/rmm.c                  | 25 ++++++++
>>   drivers/firmware/smccc/rmm.h                  | 17 ++++++
>>   drivers/firmware/smccc/smccc.c                |  8 +++
>>   drivers/virt/coco/arm-cca-guest/Kconfig       |  1 +
>>   drivers/virt/coco/arm-cca-guest/Makefile      |  2 +
>>   .../{arm-cca-guest.c => arm-cca.c}            | 60 +++++++++----------
>>   9 files changed, 89 insertions(+), 32 deletions(-)
>>   create mode 100644 drivers/firmware/smccc/rmm.c
>>   create mode 100644 drivers/firmware/smccc/rmm.h
>>   rename drivers/virt/coco/arm-cca-guest/{arm-cca-guest.c => arm-cca.c} (85%)
>>
>> diff --git a/arch/arm64/include/asm/rsi.h b/arch/arm64/include/asm/rsi.h
>> index 88b50d660e85..2d2d363aaaee 100644
>> --- a/arch/arm64/include/asm/rsi.h
>> +++ b/arch/arm64/include/asm/rsi.h
>> @@ -10,7 +10,7 @@
>>   #include <linux/jump_label.h>
>>   #include <asm/rsi_cmds.h>
>>   
>> -#define RSI_PDEV_NAME "arm-cca-dev"
>> +#define RSI_DEV_NAME "arm-rsi-dev"
>>   
>>   DECLARE_STATIC_KEY_FALSE(rsi_present);
>>   
>> diff --git a/arch/arm64/kernel/rsi.c b/arch/arm64/kernel/rsi.c
>> index 92160f2e57ff..da440f71bb64 100644
>> --- a/arch/arm64/kernel/rsi.c
>> +++ b/arch/arm64/kernel/rsi.c
>> @@ -161,7 +161,7 @@ void __init arm64_rsi_init(void)
>>   }
>>   
>>   static struct platform_device rsi_dev = {
>> -	.name = RSI_PDEV_NAME,
>> +	.name = "arm-cca-dev",
>>   	.id = PLATFORM_DEVID_NONE
>>   };
>>   
>> diff --git a/drivers/firmware/smccc/Makefile b/drivers/firmware/smccc/Makefile
>> index 40d19144a860..33c850aaff4d 100644
>> --- a/drivers/firmware/smccc/Makefile
>> +++ b/drivers/firmware/smccc/Makefile
>> @@ -2,3 +2,7 @@
>>   #
>>   obj-$(CONFIG_HAVE_ARM_SMCCC_DISCOVERY)	+= smccc.o kvm_guest.o
>>   obj-$(CONFIG_ARM_SMCCC_SOC_ID)	+= soc_id.o
>> +
>> +ifeq ($(CONFIG_HAVE_ARM_SMCCC_DISCOVERY),y)
>> +obj-$(CONFIG_ARM64) += rmm.o
>> +endif
>> diff --git a/drivers/firmware/smccc/rmm.c b/drivers/firmware/smccc/rmm.c
>> new file mode 100644
>> index 000000000000..d572f47e955c
>> --- /dev/null
>> +++ b/drivers/firmware/smccc/rmm.c
>> @@ -0,0 +1,25 @@
>> +// SPDX-License-Identifier: GPL-2.0-only
>> +/*
>> + * Copyright (C) 2026 Arm Limited
>> + */
>> +
>> +#include <linux/arm-smccc-bus.h>
>> +#include <linux/err.h>
>> +#include <linux/printk.h>
>> +
>> +#include "rmm.h"
>> +
>> +void __init register_rsi_device(void)
>> +{
>> +	unsigned long ret;
>> +
>> +	if (arm_smccc_1_1_get_conduit() != SMCCC_CONDUIT_SMC)
>> +		return;
>> +
>> +	ret = rsi_request_version(RSI_ABI_VERSION, NULL, NULL);
>> +	if (ret != RSI_SUCCESS)
>> +		return;
>> +
>> +	if (IS_ERR(arm_smccc_device_register(RSI_DEV_NAME)))
>> +		pr_err("%s: could not register device\n", RSI_DEV_NAME);
>> +}
> 
> OK, I had something else in my mind when I started looking at 1/4. I didn't
> expect each device added on this bus comes up with it's own way to enumerate
> it. IMO, it defeats the purpose of building the smccc bus. We may find the
> specs for each feature deviated a bit but we can have a generic probe
> IMO, let's try that before exploring per feature probe function.

I guess this is ideal, but see below.

> 
> I have a brief sketch of what I think we should aim for(uncompiled/untested)
> below. Let me know if that makes sense. I just based it on your bus code.
> 
> Regards,
> Sudeep
> 
> -->8
> 
> diff --git c/drivers/firmware/smccc/smccc.c w/drivers/firmware/smccc/smccc.c
> index 695c920a8087..450605ddfab6 100644
> --- c/drivers/firmware/smccc/smccc.c
> +++ w/drivers/firmware/smccc/smccc.c
> @@ -9,21 +9,58 @@
>   #include <linux/init.h>
>   #include <linux/arm-smccc.h>
>   #include <linux/kernel.h>
> -#include <linux/platform_device.h>
>   #include <linux/arm-smccc-bus.h>
>   #include <linux/idr.h>
>   #include <linux/slab.h>
> 
> -#include <asm/archrandom.h>
> -
>   static u32 smccc_version = ARM_SMCCC_VERSION_1_0;
>   static enum arm_smccc_conduit smccc_conduit = SMCCC_CONDUIT_NONE;
>   static DEFINE_IDA(arm_smccc_bus_id);
> 
> -bool __ro_after_init smccc_trng_available = false;
> +struct smccc_device_info {
> +       u32 func_id;
> +       bool requires_smc;
> +       unsigned long min_return;

Is this viable for all ? There may be additional restrictions around
the return values and further SMC calls ? Which brings us to call backs
and we kind of have a variant of that here.

Suzuki


> +       const char *device_name;
> +};
> +
> +bool __ro_after_init smccc_trng_available;
>   s32 __ro_after_init smccc_soc_id_version = SMCCC_RET_NOT_SUPPORTED;
>   s32 __ro_after_init smccc_soc_id_revision = SMCCC_RET_NOT_SUPPORTED;
> 
> +static const struct smccc_device_info smccc_devices[] __initconst = {
> +       {
> +               .func_id        = ARM_SMCCC_TRNG_VERSION,
> +               .requires_smc   = false,
> +               .min_return     = ARM_SMCCC_TRNG_MIN_VERSION,
> +               .device_name    = "arm-smccc-trng",
> +       },
> +};
> +
> +static bool __init
> +smccc_probe_smccc_device(const struct smccc_device_info *smccc_dev)
> +{
> +       struct arm_smccc_res res;
> +       unsigned long ret;
> +
> +       if (!IS_ENABLED(CONFIG_ARM64))
> +               return false;
> +
> +       if (smccc_conduit == SMCCC_CONDUIT_NONE)
> +               return false;
> +
> +       if (smccc_dev->requires_smc && smccc_conduit != SMCCC_CONDUIT_SMC)
> +               return false;
> +
> +       arm_smccc_1_1_invoke(smccc_dev->func_id, &res);
> +       ret = res.a0;
> +
> +       if ((s32)ret < 0)
> +               return false;
> +
> +       return ret >= smccc_dev->min_return;
> +}
> +
>   void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>   {
>          struct arm_smccc_res res;
> @@ -31,7 +68,7 @@ void __init arm_smccc_version_init(u32 version, enum arm_smccc_conduit conduit)
>          smccc_version = version;
>          smccc_conduit = conduit;
> 
> -       smccc_trng_available = smccc_probe_trng();
> +       smccc_trng_available = smccc_probe_smccc_device(&smccc_devices[0]);
> 
>          if ((smccc_version >= ARM_SMCCC_VERSION_1_2) &&
>              (smccc_conduit != SMCCC_CONDUIT_NONE)) {
> @@ -241,14 +278,20 @@ subsys_initcall(arm_smccc_bus_init);
> 
>   static int __init smccc_devices_init(void)
>   {
> -       struct platform_device *pdev;
> -
> -       if (smccc_trng_available) {
> -               pdev = platform_device_register_simple("smccc_trng", -1,
> -                                                      NULL, 0);
> -               if (IS_ERR(pdev))
> -                       pr_err("smccc_trng: could not register device: %ld\n",
> -                              PTR_ERR(pdev));
> +       const struct smccc_device_info *smccc_dev;
> +       struct arm_smccc_device *sdev;
> +       int i;
> +
> +       for (i = 0; i < ARRAY_SIZE(smccc_devices); i++) {
> +               smccc_dev = &smccc_devices[i];
> +
> +               if (!smccc_probe_smccc_device(smccc_dev))
> +                       continue;
> +
> +               sdev = arm_smccc_device_register(smccc_dev->device_name);
> +               if (IS_ERR(sdev))
> +                       pr_err("%s: could not register device: %ld\n",
> +                              smccc_dev->device_name, PTR_ERR(sdev));
>          }
> 
>          return 0;
> 


