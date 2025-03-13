Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A054EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Mar 2025 11:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8DvX/jDbP0knL+z074O35HuJHuAIQ+cKglX+ZjH+u7I=; b=2ouar0AOFGtgDG32OZcPqOPZA1
	E68Lk5FEAwBMRdianjzOoZc5/ZOoWdn1fkUqMlarlNX9ZmDvMQq3NbX2iuTnGvleNeG2vCkmOfleG
	kiU+Q2jJNpaqYrFSM9rcC/1/SH/+fvfym4d34iq4ng4TNZNUUQ1/FDuVWvKeovs6ZXeDJO3jftvk5
	wDQsC4edkqDru7bdd1DbSIIUL0AEAvjzMkQ/y45ELrhRpsbypO1tptIqDsfQr9aho2VmObdUL1m4X
	a+Myi7Kcap4wyKSbbyAqi9LhF+jRayZ5jQSon7vLSSpEPNusQnalmbY0PyugUbdO1fWr5AzDJtPOW
	/qvbA3dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgnK-0000000B37s-2mym;
	Thu, 13 Mar 2025 11:32:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsgki-0000000B2dE-16tU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Mar 2025 11:29:29 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id DC8C31F02;
	Thu, 13 Mar 2025 04:29:37 -0700 (PDT)
Received: from [10.57.40.246] (unknown [10.57.40.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 331A83F673;
	Thu, 13 Mar 2025 04:29:25 -0700 (PDT)
Message-ID: <9751cdf9-be27-40b4-a9f4-1e840eaf24ab@arm.com>
Date: Thu, 13 Mar 2025 11:29:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: arm64: Kernel crash at devm_kmalloc include/linux/device.h:
 drivers/base/devres.c
To: Naresh Kamboju <naresh.kamboju@linaro.org>, iommu@lists.linux.dev,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 "open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>,
 lkft-triage@lists.linaro.org, Linux Regressions <regressions@lists.linux.dev>
Cc: Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>,
 Will Deacon <will@kernel.org>, Joerg Roedel <joro@8bytes.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 Anders Roxell <anders.roxell@linaro.org>
References: <CA+G9fYugh0pBb_XwqnDM344JqCookWZe6EWQf1sLS7Oy-SdL5g@mail.gmail.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <CA+G9fYugh0pBb_XwqnDM344JqCookWZe6EWQf1sLS7Oy-SdL5g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250313_042928_404926_4F23A655 
X-CRM114-Status: GOOD (  11.31  )
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

On 2025-03-13 11:26 am, Naresh Kamboju wrote:
> Regression on arm64 FVP and rock-pi-4-b while booting the Linux next-20250312
> and next-20250313. the following crash noticed with KVM Kconfigs.
> 
> First seen on next-20250312.
> Good: next-20250311
> Bad: 6.14.0-rc6-next-20250312 and 6.14.0-rc6-next-20250313

Yup, I just posted a potential fix here:

https://lore.kernel.org/linux-iommu/417d6f59-0d78-4e81-ad0b-e06846f786b0@arm.com/

Thanks,
Robin.

> Boot regression: arm64 devm_kmalloc rk_iommu_of_xlate kernel panic
> Reported-by: Linux Kernel Functional Testing <lkft@linaro.org>
> 
> ## Boot log
> [    0.000000] Booting Linux on physical CPU 0x0000000000 [0x410fd034]
> [    0.000000] Linux version 6.14.0-rc6-next-20250313
> (tuxmake@tuxmake) (aarch64-linux-gnu-gcc (Debian 13.3.0-12) 13.3.0,
> GNU ld (GNU Binutils for Debian) 2.44) #1 SMP PREEMPT @1741850074
> [    0.000000] KASLR disabled due to lack of seed
> [    0.000000] Machine model: Radxa ROCK Pi 4B
> <trim>
> [    1.028830] SuperH (H)SCI(F) driver initialized
> [    1.030168] STM32 USART driver initialized
> [    1.052086] Unable to handle kernel NULL pointer dereference at
> virtual address 00000000000002a0
> [    1.052877] Mem abort info:
> [    1.053137]   ESR = 0x0000000096000004
> [    1.053481]   EC = 0x25: DABT (current EL), IL = 32 bits
> [    1.053960]   SET = 0, FnV = 0
> [    1.054241]   EA = 0, S1PTW = 0
> [    1.054530]   FSC = 0x04: level 0 translation fault
> [    1.054971] Data abort info:
> [    1.055236]   ISV = 0, ISS = 0x00000004, ISS2 = 0x00000000
> [    1.055760]   CM = 0, WnR = 0, TnD = 0, TagAccess = 0
> [    1.056216]   GCS = 0, Overlay = 0, DirtyBit = 0, Xs = 0
> [    1.056693] [00000000000002a0] user address but active_mm is swapper
> [    1.057264] Internal error: Oops: 0000000096000004 [#1] PREEMPT SMP
> [    1.057821] Modules linked in:
> [    1.058105] CPU: 4 UID: 0 PID: 1 Comm: swapper/0 Not tainted
> 6.14.0-rc6-next-20250313 #1
> [    1.058823] Hardware name: Radxa ROCK Pi 4B (DT)
> [    1.059236] pstate: 00000005 (nzcv daif -PAN -UAO -TCO -DIT -SSBS BTYPE=--)
> [    1.059854] pc : devm_kmalloc (include/linux/device.h:805
> drivers/base/devres.c:853)
> [    1.060225] lr : rk_iommu_of_xlate (drivers/iommu/rockchip-iommu.c:1152)
> [    1.060614] sp : ffff80008306b7c0
> [    1.060913] x29: ffff80008306b7c0 x28: ffff8000825a9068 x27: ffff80008225ce00
> [    1.061560] x26: 0000000000000001 x25: ffff80008225e188 x24: ffff000000eafa80
> [    1.062206] x23: 0000000000000000 x22: ffff800081af6a98 x21: 0000000000000000
> [    1.062850] x20: 0000000000000010 x19: 0000000000000000 x18: 00000000ffffffff
> [    1.063493] x17: ffff0000019abc00 x16: ffff000001985400 x15: ffff80008306b820
> [    1.064136] x14: ffff000002736a1c x13: ffff00000273627c x12: 0101010101010101
> [    1.064780] x11: 7f7f7f7f7f7f7f7f x10: 000000000016f8a0 x9 : ffff800080b65870
> [    1.065424] x8 : ffff80008306b718 x7 : 0000000000000000 x6 : 0000000000000001
> [    1.066066] x5 : ffff800082890000 x4 : ffff8000828905f0 x3 : 0000000000000000
> [    1.066708] x2 : 0000000000000dc0 x1 : 0000000000000010 x0 : 0000000000000090
> [    1.067351] Call trace:
> [    1.067576] devm_kmalloc (include/linux/device.h:805
> drivers/base/devres.c:853) (P)
> [    1.067937] rk_iommu_of_xlate (drivers/iommu/rockchip-iommu.c:1152)
> [    1.068295] of_iommu_xlate (drivers/iommu/of_iommu.c:39)
> [    1.068629] of_iommu_configure (drivers/iommu/of_iommu.c:71
> drivers/iommu/of_iommu.c:98 drivers/iommu/of_iommu.c:149)
> [    1.069008] of_dma_configure_id (drivers/of/device.c:161)
> [    1.069392] platform_dma_configure (drivers/base/platform.c:1455)
> [    1.069796] __iommu_probe_device (drivers/iommu/iommu.c:430
> drivers/iommu/iommu.c:569)
> [    1.070194] probe_iommu_group (drivers/iommu/iommu.c:1722)
> [    1.070553] bus_for_each_dev (drivers/base/bus.c:370)
> [    1.070906] iommu_device_register (drivers/iommu/iommu.c:1875
> drivers/iommu/iommu.c:276)
> [    1.071304] rk_iommu_probe (drivers/iommu/rockchip-iommu.c:1263)
> [    1.071652] platform_probe (drivers/base/platform.c:1404)
> [    1.071986] really_probe (drivers/base/dd.c:579 drivers/base/dd.c:658)
> [    1.072316] __driver_probe_device (drivers/base/dd.c:800)
> [    1.072716] driver_probe_device (drivers/base/dd.c:830)
> [    1.073100] __driver_attach (drivers/base/dd.c:1217)
> [    1.073453] bus_for_each_dev (drivers/base/bus.c:370)
> [    1.073805] driver_attach (drivers/base/dd.c:1235)
> [    1.074135] bus_add_driver (drivers/base/bus.c:678)
> [    1.074488] driver_register (drivers/base/driver.c:249)
> [    1.074836] __platform_driver_register (drivers/base/platform.c:868)
> [    1.075261] rk_iommu_driver_init (drivers/iommu/rockchip-iommu.c:1380)
> [    1.075644] do_one_initcall (init/main.c:1257)
> [    1.075996] kernel_init_freeable (init/main.c:1318 (discriminator
> 1) init/main.c:1335 (discriminator 1) init/main.c:1354 (discriminator
> 1) init/main.c:1567 (discriminator 1))
> [    1.076393] kernel_init (init/main.c:1461)
> [    1.076720] ret_from_fork (arch/arm64/kernel/entry.S:863)
> [ 1.077053] Code: aa0003f5 b1020020 a90153f3 aa0103f4 (b942a2b7)
> All code
> ========
>     0: aa0003f5 mov x21, x0
>     4: b1020020 adds x0, x1, #0x80
>     8: a90153f3 stp x19, x20, [sp, #16]
>     c: aa0103f4 mov x20, x1
>    10:* b942a2b7 ldr w23, [x21, #672] <-- trapping instruction
> 
> Code starting with the faulting instruction
> ===========================================
>     0: b942a2b7 ldr w23, [x21, #672]
> [    1.077594] ---[ end trace 0000000000000000 ]---
> [    1.078059] Kernel panic - not syncing: Attempted to kill init!
> exitcode=0x0000000b
> [    1.078736] SMP: stopping secondary CPUs
> [    1.079099] Kernel Offset: disabled
> [    1.079412] CPU features: 0x0400,00041058,01000400,8200421b
> [    1.079909] Memory Limit: none
> [    1.080188] ---[ end Kernel panic - not syncing: Attempted to kill
> init! exitcode=0x0000000b ]---
> 
> ## Source
> * Kernel version:  6.14.0-rc6-next-20250313
> * Git tree: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> * Git sha: 613af589b566093ce7388bf3202fca70d742c166
> * Git describe:  6.14.0-rc6-next-20250313
> * Project details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250305/
> * Architectures: arm64
> * Compilers: gcc-13
> 
> ## Test data
> * Test log: https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250313/testrun/27611306/suite/boot/test/gcc-13-lkftconfig/log
> * Test history:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250313/testrun/27611826/suite/boot/test/gcc-13-lkftconfig/history/
> * Test details:
> https://qa-reports.linaro.org/lkft/linux-next-master/build/next-20250313/testrun/27611306/suite/boot/test/gcc-13-lkftconfig/
> * Build link: https://storage.tuxsuite.com/public/linaro/lkft/builds/2uFgT27J8KGNrdNXzKgUzhFI3YX/
> * Kernel config:
> https://storage.tuxsuite.com/public/linaro/lkft/builds/2uFgT27J8KGNrdNXzKgUzhFI3YX/config
> 
> 
> --
> Linaro LKFT
> https://lkft.linaro.org


