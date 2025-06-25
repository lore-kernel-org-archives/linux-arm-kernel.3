Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72445C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 18:29:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:MIME-Version:In-Reply-To:Message-ID:Date:Subject:Cc
	:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8dqgP4LV8c4NLpBPDYGi8Zm3iZeMy9dNLyMC8hkw3Mc=; b=WWJMcW88cf0UDQuiSSqYqW7R7y
	xXGEyGmwshx83gtucLc8W9NCMMRTzuUDHkJWOJbFNAyAbcFaWrMzng0tSzBrVxVtw0IdX8BhpYZaF
	ZFpAGYnf6isVfn3Ge1UCWKkuimwbqJeWvOY2qgRTW9Hk5cIAlUW4pLg0Q7zh1vXDUtvg7rBeejB8T
	iR/3/HmnuNU91IhcH/kf7Xnp7ntTXHkT7fTIVcs792c1YhqjmkipGLhigtYxqfcx+Ba4Q8kHC8tQc
	3WUrg7ThY4ZaO1+n0Yf00SqVSDDjOT0LcxlJJNWknhfTDGQjxGsNW5Y4EQ8YwtPE5I5kYCSdCvgIJ
	LHr7X14g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUUru-00000009ZXi-3ZYi;
	Wed, 25 Jun 2025 18:29:11 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURGg-00000008zWU-3sa5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 14:38:33 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20250625143825euoutp02c550fc4b7d6a25fe3486f13d656ff1f0~MT-2kh68Y2906929069euoutp027
	for <linux-arm-kernel@lists.infradead.org>; Wed, 25 Jun 2025 14:38:25 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20250625143825euoutp02c550fc4b7d6a25fe3486f13d656ff1f0~MT-2kh68Y2906929069euoutp027
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1750862305;
	bh=8dqgP4LV8c4NLpBPDYGi8Zm3iZeMy9dNLyMC8hkw3Mc=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=pFfPPfbCvaLUthbd5ueG3UuOnIkNWM5+nnYQbrgJy/zkV7x6wH018ApoC5WRPVXVk
	 DNqXV4XI3CTYG+bVZ6qbnlZv6X+lp5OeMpEOXB3KglVE0okmNNYHB7rZpHqlY1ijEy
	 yKimBKL8bgumawwX1dKSSa4STJzAtrApaZ8K0Eek=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a~MT-2K9-ln3066230662eucas1p23;
	Wed, 25 Jun 2025 14:38:25 +0000 (GMT)
Received: from AMDC4515.digital.local (unknown [106.120.51.28]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20250625143824eusmtip2d3f64e540b8e66266a364f9237f7259e~MT-1hnkPv1779917799eusmtip2T;
	Wed, 25 Jun 2025 14:38:24 +0000 (GMT)
From: Mateusz Majewski <m.majewski2@samsung.com>
To: linux.amoon@gmail.com
Cc: alim.akhtar@samsung.com, bzolnier@gmail.com, daniel.lezcano@linaro.org,
	krzk@kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org, lukasz.luba@arm.com,
	m.majewski2@samsung.com, rafael@kernel.org, rui.zhang@intel.com
Subject: Re: [RRC v1 1/3] thermal/drivers/exynos: Remove unused base_second
 mapping and references
Date: Wed, 25 Jun 2025 16:38:16 +0200
Message-ID: <20250625143816.1146123-1-m.majewski2@samsung.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <CANAwSgTBzpL+XMJGhG=38A7GOzeayZaG_2LTvsaE2=mF-pn5mg@mail.gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a
X-EPHeader: CA
X-CMS-RootMailID: 20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a
References: <CANAwSgTBzpL+XMJGhG=38A7GOzeayZaG_2LTvsaE2=mF-pn5mg@mail.gmail.com>
	<CGME20250625143825eucas1p2e95ba80552cd289b6e05db33f32ec14a@eucas1p2.samsung.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_073831_542980_5E1E0563 
X-CRM114-Status: GOOD (  21.47  )
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

> Can you check with with following changes
> 
> diff --git a/drivers/thermal/samsung/exynos_tmu.c
> b/drivers/thermal/samsung/exynos_tmu.c
> index 9fc085f4ea1a..0776801fafea 100644
> --- a/drivers/thermal/samsung/exynos_tmu.c
> +++ b/drivers/thermal/samsung/exynos_tmu.c
> @@ -469,14 +469,11 @@ static void exynos4412_tmu_initialize(struct
> platform_device *pdev)
>         ctrl = readl(data->base + EXYNOS_TMU_TRIMINFO_CON2);
>         ctrl = EXYNOS_TRIMINFO_RELOAD_ENABLE;
>         writel(ctrl, data->base + EXYNOS_TMU_TRIMINFO_CON2);
> +       return;
>     }
> 
> -   /* On exynos5420 the triminfo register is in the shared space */
> -   if (data->soc == SOC_ARCH_EXYNOS5420
> -           data->soc == SOC_ARCH_EXYNOS5420_TRIMINFO) {
> -       trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> -       sanitize_temp_error(data, trim_info);
> -   }
> +   trim_info = readl(data->base + EXYNOS_TMU_REG_TRIMINFO);
> +   sanitize_temp_error(data, trim_info);
> }

This does seem to work (tested on 3250 and on 5420) in the sense that I
can read the temperatures, when they increase the state of the cooling
device gets increased, and the values look reasonable and stay in a
reasonable range. Hard to say if the trim and the temperature values are
correct, though.

(FYI I will probably have a harder time regarding the drivers from
GitHub you linked in 2/3, so no promises on testing them.)

> As per my Exynos5422 user manual and DTS mapping
> thermal-sensor tmu@10060000 is mapped to CPU0 with tmu_apbif clock
> thermal-sensor tmu@10064000 is mapped to CPU1 with tmu_apbif clock
> thermal-sensor tmu@10068000 is mapped to CPU2 with tmu_apbif clock
> thermal-sensor tmu@1006c000 is mapped to CPU3 with tmu_apbif clock
> thermal-sensor tmu@100a0000 is mapped to GPU with tmu_triminfo_apbif clock.

Hmm, I might be missing something, but I think the DTS does link to two
adresses and two clocks, for instance for GPU (in
arch/arm/boot/dts/samsung/exynos5420.dtsi):

		tmu_gpu: tmu@100a0000 {
			compatible = "samsung,exynos5420-tmu-ext-triminfo";
			reg = <0x100a0000 0x100>, <0x10068000 0x4>;
			interrupts = <GIC_SPI 215 IRQ_TYPE_LEVEL_HIGH>;
			clocks = <&clock CLK_TMU_GPU>, <&clock CLK_TMU>;
			clock-names = "tmu_apbif", "tmu_triminfo_apbif";
			#thermal-sensor-cells = <0>;
		};

The manual does indeed not say anything about this, but I feel like the
current code in essence states that the manual is not correct. We
probably should have some evidence that the current code is wrong and
the manual was correct all along?

Thank you,
Mateusz Majewski

