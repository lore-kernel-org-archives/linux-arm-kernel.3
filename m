Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08C8AC28B2F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Mar 2025 16:50:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3HXQgHLwU90Mcoipt4jSN1UJy2X6xutbxje51+Jhrws=; b=qXfDc0eaP9reyTOs5T5ydm0lyl
	X0KyDB65f8MimsgJKImDsXxwL+txQpj03tQ+kBJu1UVHL9jtCXCWH5ASi+Jg3Vb/yznH4XuVAPtOj
	8hwkN4TJ1zDO2+R24uGRTseoIIWZe/4HX0oFhXknmSylU0am17rja/cRUpvxKD3VhEx/xdlDknAMg
	k5ZHr72Ml5DtHO0fQHjY9aKP7Lm5tJqekRV592aY2z8iEXokuCFdItKC26kE1R0rOmEE1ewPAI+3R
	Xf/M8YdUns9YzF/Xu90c4E0Z5xyp6KayFNjTjRz5IXLhewLZX+7UWj5SOziZjV32JOOvuyaqRxyuD
	6oxJqvzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2oC-00000006MvY-1kOM;
	Tue, 11 Mar 2025 16:50:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ts2mX-00000006MiM-2rbt
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Mar 2025 16:48:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 564BB152B;
	Tue, 11 Mar 2025 09:48:51 -0700 (PDT)
Received: from [10.57.40.127] (unknown [10.57.40.127])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 02C043F673;
	Tue, 11 Mar 2025 09:48:38 -0700 (PDT)
Message-ID: <3f6dcb62-f9ba-4bed-9863-2d4569bafcf1@arm.com>
Date: Tue, 11 Mar 2025 16:48:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] coresight: Add a KUnit test for
 coresight_find_default_sink()
Content-Language: en-GB
To: James Clark <james.clark@linaro.org>
Cc: linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, Mike Leach <mike.leach@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Leo Yan <leo.yan@arm.com>
References: <20250305-james-cs-kunit-test-v2-1-83ba682b976c@linaro.org>
 <c31de6cb-f8f5-432c-b99e-68b10a24bc5e@arm.com>
 <16fd2023-1ffa-4e87-ad89-a7ccdd8ba458@linaro.org>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <16fd2023-1ffa-4e87-ad89-a7ccdd8ba458@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250311_094841_811465_C5657914 
X-CRM114-Status: GOOD (  27.02  )
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

On 11/03/2025 16:06, James Clark wrote:
> 
> 
> On 11/03/2025 3:00 pm, Suzuki K Poulose wrote:
>> On 05/03/2025 15:07, James Clark wrote:
>>> Add a test to confirm that default sink selection skips over an ETF
>>> and returns an ETR even if it's further away.
>>>
>>> This also makes it easier to add new unit tests in the future.
>>>
>>> Signed-off-by: James Clark <james.clark@linaro.org>
>>> ---
>>> Changes in v2:
>>> - Let devm free everything rather than doing individual kfrees:
>>>    "Like with managed drivers, KUnit-managed fake devices are
>>>    automatically cleaned up when the test finishes, but can be manually
>>>    cleaned up early with kunit_device_unregister()."
>>> - Link to v1: https://lore.kernel.org/r/20250225164639.522741-1- 
>>> james.clark@linaro.org
>>> ---
>>>   drivers/hwtracing/coresight/Kconfig                |  9 +++
>>>   drivers/hwtracing/coresight/Makefile               |  3 +-
>>>   drivers/hwtracing/coresight/coresight-core.c       |  1 +
>>>   .../hwtracing/coresight/coresight-kunit-tests.c    | 77 +++++++++++ 
>>> + ++++++++++
>>>   4 files changed, 88 insertions(+), 2 deletions(-)
>>>
>>> diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/ 
>>> coresight/Kconfig
>>> index ecd7086a5b83..f064e3d172b3 100644
>>> --- a/drivers/hwtracing/coresight/Kconfig
>>> +++ b/drivers/hwtracing/coresight/Kconfig
>>> @@ -259,4 +259,13 @@ config CORESIGHT_DUMMY
>>>         To compile this driver as a module, choose M here: the module 
>>> will be
>>>         called coresight-dummy.
>>> +
>>> +config CORESIGHT_KUNIT_TESTS
>>> +      tristate "Enable Coresight unit tests"
>>> +      depends on KUNIT
>>> +      default KUNIT_ALL_TESTS
>>> +      help
>>> +        Enable Coresight unit tests. Only useful for development and 
>>> not
>>> +        intended for production.
>>> +
>>>   endif
>>> diff --git a/drivers/hwtracing/coresight/Makefile b/drivers/ 
>>> hwtracing/ coresight/Makefile
>>> index 8e62c3150aeb..96f0dfedb1bf 100644
>>> --- a/drivers/hwtracing/coresight/Makefile
>>> +++ b/drivers/hwtracing/coresight/Makefile
>>> @@ -51,5 +51,4 @@ coresight-cti-y := coresight-cti-core.o coresight- 
>>> cti-platform.o \
>>>              coresight-cti-sysfs.o
>>>   obj-$(CONFIG_ULTRASOC_SMB) += ultrasoc-smb.o
>>>   obj-$(CONFIG_CORESIGHT_DUMMY) += coresight-dummy.o
>>> -obj-$(CONFIG_CORESIGHT_CTCU) += coresight-ctcu.o
>>> -coresight-ctcu-y := coresight-ctcu-core.o
>>> +obj-$(CONFIG_CORESIGHT_KUNIT_TESTS) += coresight-kunit-tests.o
>>> diff --git a/drivers/hwtracing/coresight/coresight-core.c b/drivers/ 
>>> hwtracing/coresight/coresight-core.c
>>> index bd0a7edd38c9..b101aa133ceb 100644
>>> --- a/drivers/hwtracing/coresight/coresight-core.c
>>> +++ b/drivers/hwtracing/coresight/coresight-core.c
>>> @@ -959,6 +959,7 @@ coresight_find_default_sink(struct 
>>> coresight_device *csdev)
>>>       }
>>>       return csdev->def_sink;
>>>   }
>>> +EXPORT_SYMBOL_GPL(coresight_find_default_sink);
>>>   static int coresight_remove_sink_ref(struct device *dev, void *data)
>>>   {
>>> diff --git a/drivers/hwtracing/coresight/coresight-kunit-tests.c b/ 
>>> drivers/hwtracing/coresight/coresight-kunit-tests.c
>>> new file mode 100644
>>> index 000000000000..a136af05eaf4
>>> --- /dev/null
>>> +++ b/drivers/hwtracing/coresight/coresight-kunit-tests.c
>>> @@ -0,0 +1,77 @@
>>> +// SPDX-License-Identifier: GPL-2.0
>>> +
>>> +#include <kunit/test.h>
>>> +#include <kunit/device.h>
>>> +#include <linux/coresight.h>
>>> +
>>> +#include "coresight-priv.h"
>>> +
>>> +static struct coresight_device *coresight_test_device(struct device 
>>> *dev)
>>> +{
>>> +    struct coresight_device *csdev = devm_kcalloc(dev, 1,
>>> +                             sizeof(struct coresight_device),
>>> +                             GFP_KERNEL);
>>> +    csdev->pdata = devm_kcalloc(dev, 1,
>>> +                   sizeof(struct coresight_platform_data),
>>> +                   GFP_KERNEL);
>>> +    return csdev;
>>> +}
>>> +
>>> +static int coresight_test_cpuid(struct coresight_device *csdev)
>>> +{
>>> +    return 0;
>>> +}
>>> +
>>> +static void test_default_sink(struct kunit *test)
>>> +{
>>> +    /*
>>> +     * ETM -> ETF -> ETR -> CATU
>>> +     *                ^
>>> +     *                | default
>>> +     */
>>> +    struct device *dev = kunit_device_register(test, 
>>> "coresight_kunit");
>>> +    struct coresight_device *etm = coresight_test_device(dev),
>>> +                *etf = coresight_test_device(dev),
>>> +                *etr = coresight_test_device(dev),
>>> +                *catu = coresight_test_device(dev);
>>> +    struct coresight_connection conn = {};
>>> +    struct coresight_ops_source src_ops = {.cpu_id = 
>>> coresight_test_cpuid };
>>
>> Do we need the trace_id() ? Why is this required ?
>>
>> Suzuki
>>
> 
> Because it tests with per-cpu sources so it checks if any of the TRBE 
> sinks have been assigned first:
> 
>   /* look for a default sink if we have not found for this device */
>     if (!csdev->def_sink) {
>        if (coresight_is_percpu_source(csdev))
>       csdev->def_sink = per_cpu(csdev_sink,
>                                     source_ops(csdev)->cpu_id(csdev));
> 
> I think this test would probably fail if run somewhere TRBE was already 
> probed. I can make the source subtype to be 
> CORESIGHT_DEV_SUBTYPE_SOURCE_BUS for the test to work around it. Any 
> value other than CORESIGHT_DEV_SUBTYPE_SOURCE_PROC will work. And then I 
> can drop the fake cpu_id() callback.

If the purpose is to detect the ETR, then I guess we could make this a 
non-ETM source

TBH, I don't see any value in the test as such. But it is a good 
starting point for adding further cases. So, lets keep this in.

Suzuki

> 


