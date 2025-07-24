Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C3F79C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Jul 2025 13:53:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZVpIhgja0zwSBFEavWlasOrFkgrsI84mvEml5Pj28M4=; b=FEx3fbsDBzFz7MS9tbD0VhIVlO
	MIEy1lDJE8++5JYk322PrjVrK34bRC+Ssjn+BqU4EedSvQaDZNG5/IXVlcMl2GcwvFtfFwFlCg2Aj
	uAytWkgl2cMXvocmLGa9E8dPCV4n9IF0WenT8jNt+9gp5WYCmG/QMLsYr+jR/sd519QP5ey+nlXhm
	fyBmf3O5LNtTGT+XlgjVJvNwCEsSjxlXmQ+RFlG5Yhxwjsp71EEIFMbS5zTuC9ugYNTgZy8JfmWNn
	F1NCfUbRwOSENouXjy96fa3v3urTfB16c2/jaNz0Jg/83EzaFrdPaRFNiHPghV8YZKDgLvxSO/gl7
	p/Pn7G0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uewNa-00000007a3O-2LPt;
	Thu, 24 Jul 2025 13:53:02 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uetcu-00000007Gux-3Vbs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Jul 2025 10:56:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D8D011A00;
	Thu, 24 Jul 2025 03:56:33 -0700 (PDT)
Received: from [10.57.84.166] (unknown [10.57.84.166])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id E27CD3F66E;
	Thu, 24 Jul 2025 03:56:36 -0700 (PDT)
Message-ID: <d91f3a83-16d5-47c0-b227-941df5c25991@arm.com>
Date: Thu, 24 Jul 2025 11:56:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 12/36] platform: arm64: Move ec devices to an ec
 subdirectory
Content-Language: en-GB
To: James Morse <james.morse@arm.com>, linux-kernel@vger.kernel.org,
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
From: Ben Horgan <ben.horgan@arm.com>
In-Reply-To: <20250711183648.30766-13-james.morse@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250724_035640_976111_8C339922 
X-CRM114-Status: GOOD (  31.39  )
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

Hi James,

On 11/07/2025 19:36, James Morse wrote:
> commit 363c8aea257 "platform: Add ARM64 platform directory" added a
> subdirectory for arm64 platform devices, but claims that all such
> devices must be 'EC like'.
> 
> The arm64 MPAM driver manages an MMIO interface that appears in memory
> controllers, caches, IOMMU and connection points on the interconnect.
> It doesn't fit into any existing subsystem.
> 
> It would be convenient to use this subdirectory for drivers for other
> arm64 platform devices which aren't closely coupled to the architecture
> code and don't fit into any existing subsystem.
> 
> Move the existing code and maintainer entries to be under
> drivers/platform/arm64/ec. The MPAM driver will be added under
> drivers/platform/arm64/mpam.
> 
> Signed-off-by: James Morse <james.morse@arm.com>
> ---
>   MAINTAINERS                                   |  6 +-
>   drivers/platform/arm64/Kconfig                | 72 +-----------------
>   drivers/platform/arm64/Makefile               |  9 +--
>   drivers/platform/arm64/ec/Kconfig             | 73 +++++++++++++++++++
>   drivers/platform/arm64/ec/Makefile            | 10 +++
>   .../platform/arm64/{ => ec}/acer-aspire1-ec.c |  0
>   .../arm64/{ => ec}/huawei-gaokun-ec.c         |  0
>   .../arm64/{ => ec}/lenovo-yoga-c630.c         |  0
>   8 files changed, 88 insertions(+), 82 deletions(-)
>   create mode 100644 drivers/platform/arm64/ec/Kconfig
>   create mode 100644 drivers/platform/arm64/ec/Makefile
>   rename drivers/platform/arm64/{ => ec}/acer-aspire1-ec.c (100%)
>   rename drivers/platform/arm64/{ => ec}/huawei-gaokun-ec.c (100%)
>   rename drivers/platform/arm64/{ => ec}/lenovo-yoga-c630.c (100%)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 4bac4ea21b64..bea01d413666 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3549,15 +3549,15 @@ S:	Maintained
>   F:	arch/arm64/boot/Makefile
>   F:	scripts/make_fit.py
>   
> -ARM64 PLATFORM DRIVERS
> -M:	Hans de Goede <hansg@kernel.org>
> +ARM64 EC PLATFORM DRIVERS
> +M:	Hans de Goede <hdegoede@redhat.com>
>   M:	Ilpo Järvinen <ilpo.jarvinen@linux.intel.com>
>   R:	Bryan O'Donoghue <bryan.odonoghue@linaro.org>
>   L:	platform-driver-x86@vger.kernel.org
>   S:	Maintained
>   Q:	https://patchwork.kernel.org/project/platform-driver-x86/list/
>   T:	git git://git.kernel.org/pub/scm/linux/kernel/git/pdx86/platform-drivers-x86.git
> -F:	drivers/platform/arm64/
> +F:	drivers/platform/arm64/ec
>   
>   ARM64 PORT (AARCH64 ARCHITECTURE)
>   M:	Catalin Marinas <catalin.marinas@arm.com>
> diff --git a/drivers/platform/arm64/Kconfig b/drivers/platform/arm64/Kconfig
> index 06288aebc559..1eb8ab0855e5 100644
> --- a/drivers/platform/arm64/Kconfig
> +++ b/drivers/platform/arm64/Kconfig
> @@ -1,73 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -#
> -# EC-like Drivers for aarch64 based devices.
> -#
>   
> -menuconfig ARM64_PLATFORM_DEVICES
> -	bool "ARM64 Platform-Specific Device Drivers"
> -	depends on ARM64 || COMPILE_TEST
> -	default ARM64
> -	help
> -	  Say Y here to get to see options for platform-specific device drivers
> -	  for arm64 based devices, primarily EC-like device drivers.
> -	  This option alone does not add any kernel code.
> -
> -	  If you say N, all options in this submenu will be skipped and disabled.
> -
> -if ARM64_PLATFORM_DEVICES

> -
> -config EC_ACER_ASPIRE1
> -	tristate "Acer Aspire 1 Embedded Controller driver"
> -	depends on ARCH_QCOM || COMPILE_TEST
> -	depends on I2C
> -	depends on DRM
> -	depends on POWER_SUPPLY
> -	depends on INPUT
> -	help
> -	  Say Y here to enable the EC driver for the (Snapdragon-based)
> -	  Acer Aspire 1 laptop. The EC handles battery and charging
> -	  monitoring as well as some misc functions like the lid sensor
> -	  and USB Type-C DP HPD events.
> -
> -	  This driver provides battery and AC status support for the mentioned
> -	  laptop where this information is not properly exposed via the
> -	  standard ACPI devices.
> -
> -config EC_HUAWEI_GAOKUN
> -	tristate "Huawei Matebook E Go Embedded Controller driver"
> -	depends on ARCH_QCOM || COMPILE_TEST
> -	depends on I2C
> -	depends on INPUT
> -	depends on HWMON
> -	select AUXILIARY_BUS
> -
> -	help
> -	  Say Y here to enable the EC driver for the Huawei Matebook E Go
> -	  which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
> -	  (information, charge control) and USB Type-C DP HPD events as well
> -	  as some misc functions like the lid sensor and temperature sensors,
> -	  etc.
> -
> -	  This driver provides battery and AC status support for the mentioned
> -	  laptop where this information is not properly exposed via the
> -	  standard ACPI devices.
> -
> -	  Say M or Y here to include this support.
> -
> -config EC_LENOVO_YOGA_C630
> -	tristate "Lenovo Yoga C630 Embedded Controller driver"
> -	depends on ARCH_QCOM || COMPILE_TEST
> -	depends on I2C
> -	select AUXILIARY_BUS
> -	help
> -	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> -	  Lenovo Yoga C630, which provides battery and power adapter
> -	  information.
> -
> -	  This driver provides battery and AC status support for the mentioned
> -	  laptop where this information is not properly exposed via the
> -	  standard ACPI devices.
> -
> -	  Say M or Y here to include this support.
> -
> -endif # ARM64_PLATFORM_DEVICES
> +source "drivers/platform/arm64/ec/Kconfig"
> diff --git a/drivers/platform/arm64/Makefile b/drivers/platform/arm64/Makefile
> index 46a99eba3264..ce840a8cf8cc 100644
> --- a/drivers/platform/arm64/Makefile
> +++ b/drivers/platform/arm64/Makefile
> @@ -1,10 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
> -#
> -# Makefile for linux/drivers/platform/arm64
> -#
> -# This dir should only include drivers for EC-like devices.
> -#
>   
> -obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> -obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
> -obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> +obj-y             += ec/
> diff --git a/drivers/platform/arm64/ec/Kconfig b/drivers/platform/arm64/ec/Kconfig
> new file mode 100644
> index 000000000000..06288aebc559
> --- /dev/null
> +++ b/drivers/platform/arm64/ec/Kconfig
> @@ -0,0 +1,73 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# EC-like Drivers for aarch64 based devices.
> +#
> +
> +menuconfig ARM64_PLATFORM_DEVICES
> +	bool "ARM64 Platform-Specific Device Drivers"
> +	depends on ARM64 || COMPILE_TEST
> +	default ARM64
> +	help
> +	  Say Y here to get to see options for platform-specific device drivers
> +	  for arm64 based devices, primarily EC-like device drivers.
> +	  This option alone does not add any kernel code.
> +
> +	  If you say N, all options in this submenu will be skipped and disabled.
> +
> +if ARM64_PLATFORM_DEVICES
Shouldn't this be kept in the directory above? By the description this 
would be expected to apply to all drivers in drivers/platfrom/arm64.> +
> +config EC_ACER_ASPIRE1
> +	tristate "Acer Aspire 1 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on DRM
> +	depends on POWER_SUPPLY
> +	depends on INPUT
> +	help
> +	  Say Y here to enable the EC driver for the (Snapdragon-based)
> +	  Acer Aspire 1 laptop. The EC handles battery and charging
> +	  monitoring as well as some misc functions like the lid sensor
> +	  and USB Type-C DP HPD events.
> +
> +	  This driver provides battery and AC status support for the mentioned
> +	  laptop where this information is not properly exposed via the
> +	  standard ACPI devices.
> +
> +config EC_HUAWEI_GAOKUN
> +	tristate "Huawei Matebook E Go Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	depends on INPUT
> +	depends on HWMON
> +	select AUXILIARY_BUS
> +
> +	help
> +	  Say Y here to enable the EC driver for the Huawei Matebook E Go
> +	  which is a sc8280xp-based 2-in-1 tablet. The driver handles battery
> +	  (information, charge control) and USB Type-C DP HPD events as well
> +	  as some misc functions like the lid sensor and temperature sensors,
> +	  etc.
> +
> +	  This driver provides battery and AC status support for the mentioned
> +	  laptop where this information is not properly exposed via the
> +	  standard ACPI devices.
> +
> +	  Say M or Y here to include this support.
> +
> +config EC_LENOVO_YOGA_C630
> +	tristate "Lenovo Yoga C630 Embedded Controller driver"
> +	depends on ARCH_QCOM || COMPILE_TEST
> +	depends on I2C
> +	select AUXILIARY_BUS
> +	help
> +	  Driver for the Embedded Controller in the Qualcomm Snapdragon-based
> +	  Lenovo Yoga C630, which provides battery and power adapter
> +	  information.
> +
> +	  This driver provides battery and AC status support for the mentioned
> +	  laptop where this information is not properly exposed via the
> +	  standard ACPI devices.
> +
> +	  Say M or Y here to include this support.
> +
> +endif # ARM64_PLATFORM_DEVICES
> diff --git a/drivers/platform/arm64/ec/Makefile b/drivers/platform/arm64/ec/Makefile
> new file mode 100644
> index 000000000000..b3a7c4096f08
> --- /dev/null
> +++ b/drivers/platform/arm64/ec/Makefile
> @@ -0,0 +1,10 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +#
> +# Makefile for linux/drivers/platform/arm64/ec
> +#
> +# This dir should only include drivers for EC-like devices.
> +#
> +
> +obj-$(CONFIG_EC_ACER_ASPIRE1)	+= acer-aspire1-ec.o
> +obj-$(CONFIG_EC_HUAWEI_GAOKUN)	+= huawei-gaokun-ec.o
> +obj-$(CONFIG_EC_LENOVO_YOGA_C630) += lenovo-yoga-c630.o
> diff --git a/drivers/platform/arm64/acer-aspire1-ec.c b/drivers/platform/arm64/ec/acer-aspire1-ec.c
> similarity index 100%
> rename from drivers/platform/arm64/acer-aspire1-ec.c
> rename to drivers/platform/arm64/ec/acer-aspire1-ec.c
> diff --git a/drivers/platform/arm64/huawei-gaokun-ec.c b/drivers/platform/arm64/ec/huawei-gaokun-ec.c
> similarity index 100%
> rename from drivers/platform/arm64/huawei-gaokun-ec.c
> rename to drivers/platform/arm64/ec/huawei-gaokun-ec.c
> diff --git a/drivers/platform/arm64/lenovo-yoga-c630.c b/drivers/platform/arm64/ec/lenovo-yoga-c630.c
> similarity index 100%
> rename from drivers/platform/arm64/lenovo-yoga-c630.c
> rename to drivers/platform/arm64/ec/lenovo-yoga-c630.c
Thanks,

Ben


