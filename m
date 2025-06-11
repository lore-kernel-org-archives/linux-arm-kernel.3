Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECDE1C677C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 14:51:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=16rsQynByqBYhQI8+SNKbdbwkJFT9SC5WL8UL6NGmlo=; b=K6LBNqwSOBUp69z+3bJ2Jw2+i5
	KZTwF7/FzOQq/wko4tMAAZST9QZ2b9+HVI7aLC0A7kNtpPAN3U0zUYj80b8Wr32/N9zCph9hCToeE
	9sJPrAwXR6Sz+PxddkA3eJ26VsPMZQ4hmGgt0a3UoGWQeL+hScMHZFGzFUD65NYoOsMXkubOEfaI3
	es3+T2ugksb2XVJnTynpHhpmq5WMnRQH87knEHkHJ/R2Np/g8TdONjiDzpbBJxVk+wOr3E5UorN+M
	mQaKSZP14UAv7MwEDZDE7x0xfq8+X7/AvOSL/z+IxROYTWF5ny0AgLrL0qsLP0OgtBMy1QD7Uheyi
	zIIzJxkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPMnA-0000000ADJW-444c;
	Wed, 11 Jun 2025 14:51:04 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIbI-00000009bOU-2TGX
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Jun 2025 10:22:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=16rsQynByqBYhQI8+SNKbdbwkJFT9SC5WL8UL6NGmlo=; b=HNxcq15PuVMMpcp0mtJlYD9/dh
	dBapebKCX9j3ngfaDdJ8FiT7nbXDoSs/bo3R9bpUWhZNaSclrQ8Duges8ugWOMAJh/HYjODnIz3EH
	Dk3JlTOFAMWZ0QMxNx1kQ7I6OnVhLCPjyK0rKRvmMsFIuPz6x27+9XzmacWSq11IGSsPbvGWUV+xa
	TY/croyauj3UeLq4bgRyMSTWcy9wxWhQ5tfmsBh8Snchd4kI49NQWl0y6aaT1ykNW9pNgd2eLtSRo
	ZKWAgVGOZ4NFN7tC1CtDQywQE+vtVxzHK2VO84VgvABcMNvKO8DptEVluB4y1wB76y76xog/QZfYo
	5K3erisw==;
Received: from dfw.source.kernel.org ([139.178.84.217])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPIbG-00000002Ge3-2YTK
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 10:22:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4FAE55C5592;
	Wed, 11 Jun 2025 10:20:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 563E1C4CEF2;
	Wed, 11 Jun 2025 10:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749637347;
	bh=IwhfXaqy1ijWKbIOEpYGK/Xi4vMWwmmWaFIPRLfT+OQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=f3IAS+WD2nUooKJ5jl9/RTCHVYN6W6YAHImf2dkaivfQbbRqMrESUWfKZGOuEUSOv
	 2Kagd/gi3CL8JRwvbH9lYQhBaoLfK0Xbq002BLK+5tCpX08mg9hNyLJrzzznv1DXGs
	 kJxqflkGnb/V8cZCXWdnR1RpDbjngV6FKkxRTuM8WrE78E3OO+HcryH22NIrXmfGxT
	 xsCPJniweLsLDa8XEEIKDeQyrQ7MuGhrqhMfzEJR9v2RhjCbmv3WQOZBTA3hkMlpif
	 oeTukIemdCy00Pi6wpsnCSUOK1z9JuZh7iIRHlz27OvmRheb7IvtGR4wNn5EhYUSDP
	 vMyLh92uz/4Ng==
Message-ID: <d0831ff9-c26f-40bc-892c-b391eb48ea25@kernel.org>
Date: Wed, 11 Jun 2025 12:22:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm: multi_v7_defconfig: Enable more OMAP related configs
To: Beleswar Padhi <b-padhi@ti.com>, linux@armlinux.org.uk, arnd@arndb.de
Cc: afd@ti.com, u-kumar1@ti.com, praneeth@ti.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250611074925.1155547-1-b-padhi@ti.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250611074925.1155547-1-b-padhi@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250611_112230_988269_3152E872 
X-CRM114-Status: GOOD (  12.31  )
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

On 11/06/2025 09:49, Beleswar Padhi wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> This allows us to use various peripherals in the TI OMAP family devices

Which ones for example? Explain which upstream boards use which devices
needing these.

> using the multi-v7 config, instead of only with the OMAP specific

multi_v7

> defconfigs.
> 
> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> Signed-off-by: Beleswar Padhi <b-padhi@ti.com>
> ---
>  arch/arm/configs/multi_v7_defconfig | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
> 
> diff --git a/arch/arm/configs/multi_v7_defconfig b/arch/arm/configs/multi_v7_defconfig
> index c79495e113c8..10ad7026bb4d 100644
> --- a/arch/arm/configs/multi_v7_defconfig
> +++ b/arch/arm/configs/multi_v7_defconfig
> @@ -166,6 +166,7 @@ CONFIG_BT_MRVL_SDIO=m
>  CONFIG_BT_QCOMSMD=m
>  CONFIG_CFG80211=m
>  CONFIG_MAC80211=m
> +CONFIG_IWLWIFI=m
>  CONFIG_RFKILL=y
>  CONFIG_RFKILL_INPUT=y
>  CONFIG_RFKILL_GPIO=y
> @@ -788,6 +789,7 @@ CONFIG_FRAMEBUFFER_CONSOLE=y
>  CONFIG_FRAMEBUFFER_CONSOLE_ROTATION=y
>  CONFIG_SOUND=m
>  CONFIG_SND=m
> +CONFIG_SND_SOC_OMAP_HDMI=m
>  CONFIG_SND_HDA_TEGRA=m
>  CONFIG_SND_HDA_INPUT_BEEP=y
>  CONFIG_SND_HDA_PATCH_LOADER=y
> @@ -1095,6 +1097,7 @@ CONFIG_TEGRA_IOMMU_SMMU=y
>  CONFIG_EXYNOS_IOMMU=y
>  CONFIG_QCOM_IOMMU=y
>  CONFIG_REMOTEPROC=y
> +CONFIG_WKUP_M3_RPROC=m
>  CONFIG_OMAP_REMOTEPROC=m
>  CONFIG_OMAP_REMOTEPROC_WATCHDOG=y
>  CONFIG_KEYSTONE_REMOTEPROC=m
> @@ -1102,6 +1105,7 @@ CONFIG_QCOM_Q6V5_MSS=m
>  CONFIG_QCOM_SYSMON=m
>  CONFIG_QCOM_WCNSS_PIL=m
>  CONFIG_ST_REMOTEPROC=m
> +CONFIG_OMAP_REMOTEPROC=m
>  CONFIG_RPMSG_CHAR=m
>  CONFIG_RPMSG_CTRL=m
>  CONFIG_RPMSG_QCOM_SMD=y
> @@ -1127,6 +1131,8 @@ CONFIG_ARCH_TEGRA_3x_SOC=y
>  CONFIG_ARCH_TEGRA_114_SOC=y
>  CONFIG_ARCH_TEGRA_124_SOC=y
>  CONFIG_SOC_TI=y
> +CONFIG_AMX3_PM=m
> +CONFIG_WKUP_M3_IPC=m
>  CONFIG_KEYSTONE_NAVIGATOR_QMSS=y
>  CONFIG_KEYSTONE_NAVIGATOR_DMA=y
>  CONFIG_RASPBERRYPI_POWER=y
> @@ -1138,11 +1144,13 @@ CONFIG_TI_SCI_PM_DOMAINS=y
>  CONFIG_ARM_EXYNOS_BUS_DEVFREQ=m
>  CONFIG_ARM_TEGRA_DEVFREQ=m
>  CONFIG_DEVFREQ_EVENT_EXYNOS_NOCP=m
> +CONFIG_EXTCON_PALMAS=m
>  CONFIG_EXTCON_MAX14577=m
>  CONFIG_EXTCON_MAX77693=m
>  CONFIG_EXTCON_MAX8997=m
>  CONFIG_EXTCON_USB_GPIO=y
>  CONFIG_TI_AEMIF=y
> +CONFIG_TI_EMIF_SRAM=m
>  CONFIG_STM32_FMC2_EBI=y
>  CONFIG_EXYNOS5422_DMC=m
>  CONFIG_IIO=y
> @@ -1287,6 +1295,7 @@ CONFIG_CRYPTO_AES_ARM=m
>  CONFIG_CRYPTO_AES_ARM_BS=m
>  CONFIG_CRYPTO_AES_ARM_CE=m
>  CONFIG_CRYPTO_CHACHA20_NEON=m
> +CONFIG_CRYPTO_XCBC=m

Why this is needed?

>  CONFIG_CRYPTO_DEV_SUN4I_SS=m
>  CONFIG_CRYPTO_DEV_FSL_CAAM=m
>  CONFIG_CRYPTO_DEV_EXYNOS_RNG=m
> @@ -1300,6 +1309,10 @@ CONFIG_CRYPTO_DEV_QCOM_RNG=m
>  CONFIG_CRYPTO_DEV_ROCKCHIP=m
>  CONFIG_CRYPTO_DEV_STM32_HASH=m
>  CONFIG_CRYPTO_DEV_STM32_CRYP=m
> +CONFIG_CRYPTO_DEV_OMAP=m
> +CONFIG_CRYPTO_DEV_OMAP_SHAM=m
> +CONFIG_CRYPTO_DEV_OMAP_AES=m
> +CONFIG_CRYPTO_DEV_OMAP_DES=m
>  CONFIG_CMA_SIZE_MBYTES=64
>  CONFIG_PRINTK_TIME=y
>  CONFIG_DEBUG_KERNEL=y
> @@ -1307,3 +1320,5 @@ CONFIG_DEBUG_INFO_DWARF_TOOLCHAIN_DEFAULT=y
>  CONFIG_DEBUG_INFO_REDUCED=y
>  CONFIG_MAGIC_SYSRQ=y
>  CONFIG_DEBUG_FS=y
> +CONFIG_CAN_C_CAN=m
> +CONFIG_CAN_C_CAN_PLATFORM=m

Does not look like placed according to Kconfig.

Best regards,
Krzysztof

