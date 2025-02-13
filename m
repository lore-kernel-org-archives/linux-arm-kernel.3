Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18B3CC021A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 16:11:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IfuxON9f1+mt0J5dXUHTZ8LLFpSbXwaRfsyQDzivT8Y=; b=Zkae1/lzskcELfb286dsbX+9n6
	mDiZMKbOf4YOzEBtPjjVRtJu+KR7hyazK1x151VXw9K9yyOcmO1XFSsAjFBRFZEfohbN3sOP0k9vU
	psI7BZk0X2vE+d1+U4odrok5qbyZjDF3CEeePxOAJ0kB2lILWJTGgQDxc1mrfcqOpJccG130iv/kL
	PjmaEd/DYWkLvnZjH6lli9Usbw52jva8jMWi90iAQ2zGU1tGcx729zPHkM6zVm9e/W8wY569T5cTx
	Pk15m521zV8zbxmKeRwt05liNLXfvz4f+D+lU/OzDOywWE3KqdufwGo8S8WXWFIwvenEs1qdpqP9/
	lUL8We7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tibo5-0000000BhMi-0Gqd;
	Thu, 13 Feb 2025 16:11:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiac6-0000000BQZv-2YuG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 14:54:51 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C074106F;
	Thu, 13 Feb 2025 06:55:08 -0800 (PST)
Received: from [10.44.160.94] (e126510-lin.lund.arm.com [10.44.160.94])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 677FC3F58B;
	Thu, 13 Feb 2025 06:54:42 -0800 (PST)
Message-ID: <c16a24b9-1258-4976-827d-db3335bf6e83@arm.com>
Date: Thu, 13 Feb 2025 15:54:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v3 00/15] pkeys-based page table hardening
From: Kevin Brodsky <kevin.brodsky@arm.com>
To: Kees Cook <kees@kernel.org>
Cc: linux-hardening@vger.kernel.org, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, Mark Brown <broonie@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Dave Hansen <dave.hansen@linux.intel.com>, Jann Horn <jannh@google.com>,
 Jeff Xu <jeffxu@chromium.org>, Joey Gouly <joey.gouly@arm.com>,
 Linus Walleij <linus.walleij@linaro.org>, Andy Lutomirski <luto@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Matthew Wilcox <willy@infradead.org>, Qi Zheng <zhengqi.arch@bytedance.com>,
 linux-arm-kernel@lists.infradead.org, linux-mm@kvack.org, x86@kernel.org
References: <20250203101839.1223008-1-kevin.brodsky@arm.com>
 <202502061422.517A57F8@keescook>
 <fd101c51-d3fc-4a4f-afcc-364b8d3c4a0b@arm.com>
Content-Language: en-GB
In-Reply-To: <fd101c51-d3fc-4a4f-afcc-364b8d3c4a0b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_065450_690189_3B29AF3E 
X-CRM114-Status: GOOD (  17.28  )
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

On 10/02/2025 15:23, Kevin Brodsky wrote:
> [...]
>
>>> Any comment or feedback will be highly appreciated, be it on the
>>> high-level approach or implementation choices!
>> As hinted earlier with my QEMU question... what's the best way I can I
>> test this myself? :)
> As mentioned above I tested this series on Arm FVP. By far the easiest
> way to run some custom kernel/rootfs on FVP is to use the Shrinkwrap
> tool [3]. First install it following the quick start guide [4] (I would
> recommend using the Docker backend if possible). Then build the firmware
> stack using:
>
> $ shrinkwrap build -o arch/v9.0.yaml ns-edk2.yaml
>
> To make things easy, the runtime configuration can be stored in a file.
> Create ~/.shrinkwrap/config/poe.yaml with the following contents:
>
> ----8<----
>
> %YAML 1.2
> ---
> layers:
>   - arch/v9.0.yaml

Apologies, this is incorrect - it will not work with the most recent FVP
builds. POE is a v9.4 feature so this line should be replaced with:

> - arch/v9.4.yaml

(No need to change the shrinkwrap build line, it only matters for the
FVP runtime parameters.)

- Kevin

> run:
>   rtvars:
>     CMDLINE:
>       type: string
>       # nr_cpus=1 can be added to speed up the boot
>       value: console=ttyAMA0 earlycon=pl011,0x1c090000 root=/dev/vda rw
>   params:
>     -C cluster0.has_permission_overlay_s1: 1
>     -C cluster1.has_permission_overlay_s1: 1
>
> ----8<----
>
> Finally start FVP using:
>
> $ shrinkwrap run -o poe.yaml ns-edk2.yaml -r
> KERNEL=<out>/arch/arm64/boot/Image -r ROOTFS=<rootfs.img>
>
> (Use Ctrl-] to terminate the model if needed.)
>
> <rootfs.img> is a file containing the root filesystem (in raw format,
> e.g. ext4). The kernel itself is built as usual (defconfig works just
> fine), just make sure to select CONFIG_KPKEYS_HARDENED_PGTABLES to
> enable the feature. You can also select
> CONFIG_KPKEYS_HARDENED_PGTABLES_TEST to run the tests in patch 15.

