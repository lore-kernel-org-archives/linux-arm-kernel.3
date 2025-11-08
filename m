Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58E30CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Nov 2025 03:12:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AUhKXEzeGCikYXmExWl1kA2dGxV0NSVJEQeamA4bzzI=; b=J/XAuJoZEQq9bB8M644f/4xR7d
	JMGM50Cg2CayHBvUauaIFf+my+p7rIT4pjazVpw8KfbLy9lWk4Z66S5eavVp8FuFql+s3Elhop++j
	8F//Q7Yh5LE5Qj7HDyWWG7AWuT8sKMYs+XtlREWWof4b4BfcScWRyBMwBduAeBRZUD2Lz2QD/lgZl
	/xAGWN7sGXKIz6jPIMSFfgCk0bKvYfuov9lO9EOt+z+T4au77VP9t/0KluX60M46WhoMkDPpf2slA
	WN5PTYTnJsT4W0QivOe4sLI5DCsdI+vB3blPDMZKZVaes6pwXJGc0eco80VaCt8eUMlsKo6XHVbEn
	j0m/lGRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZMn-00000002GZ9-26hc;
	Sat, 08 Nov 2025 03:11:53 +0000
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vHZMk-00000002GYP-3Jce;
	Sat, 08 Nov 2025 03:11:50 +0000
Message-ID: <c13574f7-b13c-42e0-9b35-a2acb594af33@infradead.org>
Date: Fri, 7 Nov 2025 19:11:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?Q?Re=3A_=5BREGRESSION=5D_next/master=3A_=28build=29_implici?=
 =?UTF-8?Q?t_declaration_of_function_=E2=80=98topology=5Fcore=5Fhas=5Fsmt?=
 =?UTF-8?B?4oCZOyBkaWQgeW91IC4uLg==?=
To: kernelci@lists.linux.dev, kernelci-results@groups.io,
 Linux ARM <linux-arm-kernel@lists.infradead.org>,
 linux-perf-users@vger.kernel.org, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: regressions@lists.linux.dev, gus@collabora.com, linux-next@vger.kernel.org
References: <176225394342.3644.6412596085150396269@efdf33580483>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <176225394342.3644.6412596085150396269@efdf33580483>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
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

[verified still present in linux-next 20251107]
[adding CCs]


On 11/4/25 2:59 AM, KernelCI bot wrote:
> 
> 
> 
> 
> Hello,
> 
> New build issue found on next/master:
> 
> ---
>  implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration] in drivers/perf/arm_pmu.o (drivers/perf/arm_pmu.c) [logspec:kbuild,kbuild.compiler.error]
> ---
> 
> - dashboard: https://d.kernelci.org/i/maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5
> - giturl: https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git
> - commit HEAD:  17490bd0527f59d841168457b245581f314b5fa0
> - tags: next-20251104
> 
> 
> Log excerpt:
> =====================================================
> drivers/perf/arm_pmu.c:935:24: error: implicit declaration of function ‘topology_core_has_smt’; did you mean ‘topology_core_cpumask’? [-Werror=implicit-function-declaration]
>   935 |         pmu->has_smt = topology_core_has_smt(cpumask_first(&pmu->supported_cpus));
>       |                        ^~~~~~~~~~~~~~~~~~~~~
>       |                        topology_core_cpumask
>   CC      drivers/iio/adc/bcm_iproc_adc.o
>   CC      drivers/devfreq/governor_simpleondemand.o
>   CC      drivers/memory/tegra/tegra124.o
>   CC      drivers/memory/brcmstb_dpfe.o
> cc1: some warnings being treated as errors
>   CC      drivers/memory/tegra/tegra20-emc.o
> 
> =====================================================
> 
> 
> # Builds where the incident occurred:
> 
> ## multi_v7_defconfig+CONFIG_SMP=n on (arm):
> - compiler: gcc-12
> - config: https://files.kernelci.org/kbuild-gcc-12-arm-SMP-6909cb01f21f07610dca0839/.config
> - dashboard: https://d.kernelci.org/build/maestro:6909cb01f21f07610dca0839
> 
> 
> #kernelci issue maestro:b25c03bf6acc100aaa7e71de7eb2cb32868b54f5
> 
> Reported-by: kernelci.org bot <bot@kernelci.org>
> 
> --
> This is an experimental report format. Please send feedback in!
> Talk to us at kernelci@lists.linux.dev
> 
> Made with love by the KernelCI team - https://kernelci.org
> 

-- 
~Randy


