Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A1C62C7115C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Jun 2025 16:04:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VEkg5LBKYinV1r8tt5aq6GdwmPaAYKSq+sOdMKLg5EU=; b=3Vrt9usHF1UxLWVmOz2AW+Ab1p
	LMBalmGZEjp1KSt7YLqn3u7k3WzckoVeltvMWTSO1zRRWNYmNPj52cHm3mup/0WQKQkzCppnj1cmM
	o3QGGqT+qJXTPHbDwyUF0vr+6jklFDK1n90elp8bl84OYfbPnnJN+cMmlOOG252+hGMZZlkMEYk2t
	75Qap7om7kzlYCSruK/Jyq8nVAmpfFBHVZL6a9HnC9pFm7RlvpPpFUceau6AvOXn28ACesPq6V6Fa
	Rnlxsqq/62b+ekYJTMNv3sbSb2pqULdzu9cqNs2xGqfbHDx9T+95XV9MtUqVs/c9sksclJI6BjiiV
	3sKL2QgA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0hG-000000000Wr-3nJA;
	Sat, 21 Jun 2025 16:04:02 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uT0f1-000000000Kh-04Lz
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Jun 2025 16:01:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2895E60008;
	Sat, 21 Jun 2025 16:01:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3502C4CEE7;
	Sat, 21 Jun 2025 16:01:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750521701;
	bh=7z06BI2WfCKHgocG5mZp+KFS5XZpvyaukvIGuVj/RlU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uDwXevel3/1jiq4Sl2EDKgEHARqYuu8Bl7nrJLZ8lUCzHpBkeoumIp6jzt/ZP4Nsl
	 wqLBEHqbQv7BeGHwV/DPP5ckgANF6VbYI5AyU+Yd7Skc57x9V4PhZEjE744+ExYRFr
	 AkERmpzc03BtzkqT5tG8hywtOyMFB4oMbjoTgSssty33EMxdWKqHIONBBQ3NX56YP1
	 1s66LaJ7sUP5cIPW3qhTCIyNXnqk1AvoKqeUz+bq+RtWlN5ktVenNOvVQfcXtnbR0P
	 yISLwmztKCaQ6JNWVfJn38zjoEhxBT4pRdcGegeMhL6zVqHpjw3aesU2v9O/kMhLww
	 W9a4U4D46RlpQ==
Message-ID: <d5a616f3-67a3-4504-904e-6cec503ab157@kernel.org>
Date: Sat, 21 Jun 2025 18:01:33 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] arm64: defconfig: Enable Apple Silicon drivers
To: Robin Murphy <robin.murphy@arm.com>
Cc: asahi@lists.linux.dev, Stephen Boyd <sboyd@kernel.org>,
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Janne Grunau <j@jannau.net>,
 linux-arm-kernel@lists.infradead.org, linux-pm@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>, linux-kernel@vger.kernel.org,
 Viresh Kumar <viresh.kumar@linaro.org>, Neal Gompa <neal@gompa.dev>,
 linux-clk@vger.kernel.org, Arnd Bergmann <arnd@arndb.de>,
 linux-i2c@vger.kernel.org, Takashi Iwai <tiwai@suse.com>,
 Liam Girdwood <lgirdwood@gmail.com>, =?UTF-8?Q?Martin_Povi=C5=A1er?=
 <povik+lin@cutebit.org>, Joerg Roedel <joro@8bytes.org>,
 "Rafael J. Wysocki" <rafael@kernel.org>, Jaroslav Kysela <perex@perex.cz>,
 Mark Brown <broonie@kernel.org>, iommu@lists.linux.dev,
 linux-input@vger.kernel.org, dmaengine@vger.kernel.org,
 linux-sound@vger.kernel.org, Vinod Koul <vkoul@kernel.org>,
 Dmitry Torokhov <dmitry.torokhov@gmail.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Andi Shyti <andi.shyti@kernel.org>, Will Deacon <will@kernel.org>
References: <20250612-apple-kconfig-defconfig-v1-0-0e6f9cb512c1@kernel.org>
 <20250612-apple-kconfig-defconfig-v1-11-0e6f9cb512c1@kernel.org>
 <2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com>
Content-Language: en-US
From: Sven Peter <sven@kernel.org>
In-Reply-To: <2e022f4e-4c87-4da1-9d02-f7a3ae7c5798@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
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

On 13.06.25 18:50, Robin Murphy wrote:
> On 2025-06-12 10:11 pm, Sven Peter wrote:
>> Enable drivers for hardware present on Apple Silicon machines.
>> The power domain and interrupt driver should be built-it since these are
>> critical for the system to boot, the rest can be build as modules.
> 
> Nit: I'd be tempted to put this patch first, just in case anyone 
> bisecting with "make defconfig" in their process lands in the middle and 
> suddenly loses some drivers (although arguably them going from "=y" to 
> "=m" could still be a surprise, but at least a bit less so).

Ah, that's a good point that I hadn't even thought about.
Now that most of these have already been merged into different trees 
that ship has sailed though.

> 
> [...]
>> @@ -1504,6 +1520,7 @@ CONFIG_ARCH_TEGRA_194_SOC=y
>>   CONFIG_ARCH_TEGRA_234_SOC=y
>>   CONFIG_TI_PRUSS=m
>>   CONFIG_OWL_PM_DOMAINS=y
>> +CONFIG_APPLE_PMGR_PWRSTATE=y
> 
> If this is critical for any Apple platform to work then it would 
> probably make sense to explicitly select it from ARCH_APPLE, as is done 
> for APPLE_AIC...


Documentation/kbuild/kconfig-language.rst:

   select should be used with care. select will force a symbol to a value
   without visiting the dependencies. By abusing select you are able to
   select a symbol FOO even if FOO depends on BAR that is not set. In
   general use select only for non-visible symbols (no prompts anywhere)
   and for symbols with no dependencies. That will limit the usefulness
   but on the other hand avoid the illegal configurations all over.


That's probably fine for APPLE_AIC which only depends on ARM64 (and 
ARCH_APPLE) which is guaranteed to be set when ARCH_APPLE is set anyway.
APPLE_PMGR_PWRSTATE also has an additional dependency on PM so it should 
probably remain in defconfig and not use select.


>>   CONFIG_RASPBERRYPI_POWER=y
>>   CONFIG_IMX_SCU_PD=y
>>   CONFIG_QCOM_CPR=y
>> @@ -1567,6 +1584,7 @@ CONFIG_QCOM_PDC=y
>>   CONFIG_QCOM_MPM=y
>>   CONFIG_TI_SCI_INTR_IRQCHIP=y
>>   CONFIG_TI_SCI_INTA_IRQCHIP=y
>> +CONFIG_APPLE_AIC=y
> 
> ...which I think means this would already be redundant.

Yup, this can be dropped.


Thanks,

Sven


