Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9485CCFA06
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 15:14:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkTtU6HE0wOI0oNXgpl0QXg2DrXWwNxk/gPZcLQHMlU=; b=ToQ/WKHCdCt3BP0r+/B5q9RTPW
	NgqGrYFFa5RG5EKpiduifSKszCfNmu/mABb4VhSYnkeInym+7KcLNQXfiGGie5IUmGuFPTKNJry3N
	vtDAy+TMZkt6nQyC5LmKu5NCX5ccj0qxj717SuMixqKvGV9xJBYFimAyoQ9Kh1slU//dgEAqQosQY
	CRwuTbEcIICun/6P81a+7Yc34HPlAW9msBoyC+NSItq1gDJ0Ezv2SgwPAw7ke6gB+1iPvlBTRYxlF
	HNhM5G9VYi0B6D0Pz0otJeEv4lBs30e71ImTe9SJwFc6YQ8NdGlBtV9DoKt+3nehta0YoYvRFZld2
	Z4RsNT1A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwGH-0000000A6iw-2Dgw;
	Mon, 03 Nov 2025 15:14:25 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vFwGE-0000000A6iD-2rHD;
	Mon, 03 Nov 2025 15:14:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762182859;
	bh=Fi4+R1Ob18N+hWKOsFjrNw4jSyFKNHKkEG+GMBZjsvI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jzvEqUOnHp5MJRCsQbEcE5I3T47rCyIMaddchuQBJK1HlqfF+m9O6UcJyiT0FskiB
	 paN72tfJGZgGWsCFCl24BrK9Nj3wWE5zoYxct4hL/3AhrkBo7E5VLLfkSenRKspjZ6
	 Hxkq5+ODuoke9HQzEeudTXfuN2rUz0/vQq3CAOGRq+EUTyd10d/o7XRGtJ+2hfKEco
	 bQ4puUQO1AYxi05HXaujHbBEfiYBtjZsxBucnaiVKgbYqRDMB/fBlS05UCFKcedyH/
	 ChuMgmIE1I7ZxvRJVA10cf0WGuxu3JQPbEVOnyhsn0bH2M/rP5mVtBl+2XU+pKGrmS
	 FnIGUQ3uKhXXQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0F25A17E00A6;
	Mon,  3 Nov 2025 16:14:19 +0100 (CET)
Message-ID: <7f743fd5-a64f-4378-b8da-198e45fc66e2@collabora.com>
Date: Mon, 3 Nov 2025 16:14:18 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] soc: mediatek regulator: Add Support for mt8189
To: "niklaus.liu" <Niklaus.Liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com, zhigang.qin@mediatek.com,
 sen.chu@mediatek.com
References: <20251103134241.3773-1-Niklaus.Liu@mediatek.com>
 <20251103134241.3773-2-Niklaus.Liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251103134241.3773-2-Niklaus.Liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_071422_888265_4C4F0212 
X-CRM114-Status: GOOD (  23.84  )
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

Il 03/11/25 14:42, niklaus.liu ha scritto:
> From: Niklaus Liu <niklaus.liu@mediatek.com>
> 

Please change the title to
"soc: mediatek: mtk-regulator-coupler: Add support for MT8189"

> Enhance the regulator coupler driver to support GPU power control on the
> MediaTek MT8189 platform. This update ensures proper coordination of
> multiple regulators required for GPU operation,improving power management
> and system stability.
> 
> Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-regulator-coupler.c | 15 ++++++++++++++-
>   1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
> index 0b6a2884145e..f6e3b2a3a5a8 100644
> --- a/drivers/soc/mediatek/mtk-regulator-coupler.c
> +++ b/drivers/soc/mediatek/mtk-regulator-coupler.c
> @@ -42,6 +42,18 @@ static int mediatek_regulator_balance_voltage(struct regulator_coupler *coupler,
>   	int max_uV = INT_MAX;
>   	int ret;
>   
> +	/*
> +	 * When vsram_gpu is enabled or disabled and the use_count of the
> +	 * vsram_gpu regulator is zero, the regulator coupler driver will
> +	 * execute regulator_do_balance_voltage, which adjusts the vsram_gpu
> +	 * voltage to the minimum value. This may result in vsram_gpu being
> +	 * lower than vgpu. Therefore, when enabling or disabling vsram_gpu,
> +	 * the 8189 temporarily skips the regulator coupler driver's modification
> +	 * of the vsram_gpu voltage.
> +	 */

Looks like you are misconfiguring something here.... VSRAM_GPU on, VGPU off should
not be supported if those are coupled.

It's either both are ON, or both are getting OFF: in case of both being offlined,
it doesn't matter if the voltage is dropping, because the SRAM is getting powered
OFF, as much as the GPU is.

Makes me wonder if you're assigning the power supplies to both of the MFG power
domains *and* to Panfrost (vgpu == mali-supply).

Note that VGPU should be assigned to the outer power domain (the main one, usually
MFG0), and that VSRAM_GPU should be assigned to the inner-next domain (which is
usually MFG1).

Check how it's done in mt8195.dtsi, mt8195-cherry.dtsi :-)

> +	if (of_machine_is_compatible("mediatek,mt8189") && rdev == mrc->vsram_rdev)
> +		return 0;
> +
>   	/*
>   	 * If the target device is on, setting the SRAM voltage directly
>   	 * is not supported as it scales through its coupled supply voltage.
> @@ -148,7 +160,8 @@ static int mediatek_regulator_coupler_init(void)
>   	if (!of_machine_is_compatible("mediatek,mt8183") &&
>   	    !of_machine_is_compatible("mediatek,mt8186") &&
>   	    !of_machine_is_compatible("mediatek,mt8188") &&

Keep entries sorted alphabetically please, 8189 goes here.

Regards,
Angelo

> -	    !of_machine_is_compatible("mediatek,mt8192"))
> +	    !of_machine_is_compatible("mediatek,mt8192") &&
> +	    !of_machine_is_compatible("mediatek,mt8189"))
>   		return 0;
>   
>   	return regulator_coupler_register(&mediatek_coupler.coupler);


