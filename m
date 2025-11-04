Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D33B5CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Nov 2025 14:24:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZuNbVkaxj/130IIFnL3tI3auJ5i4mtBURa+VsRT6Wq4=; b=M/84JlzhPgrHJHyDvxxWuAK1dU
	AW1dh9QFEPJtbg4DSO5OZwcKtx6LFnclkuXr4fMae4ad1nqKujBMWqb2Pzb7zKj4dtYQM+EkAhfdD
	/OTG6+mUlq1FRGVYPV++nLoWv6V2zy3a72tJVOmynen0hoyAIK704IzZnmk7NqJGC/YPr97aIIfOT
	VGVlEZ5JPHYVzc1jyIw2R+yunAaBwdYIvB1QUL85c8ehrd9n+xxCFUaBYBuW76V6kk3jkO9xuyMZy
	uRY3dsWdldoYO2ezHU12XVIg79Ek6UF+iOsKSizUCH3o5Kjcl/ufwo98GrLrEyLrIm+JM4NDVC+KU
	ozkXB0uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHxS-0000000ByZ3-0sSF;
	Tue, 04 Nov 2025 14:24:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGHxR-0000000ByYr-0X5S;
	Tue, 04 Nov 2025 14:24:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=ZuNbVkaxj/130IIFnL3tI3auJ5i4mtBURa+VsRT6Wq4=; b=qNm5xIqR/pPGq+tYFN4SAaRElJ
	AwZeRkoFfABhgWEwytKAvCK+LDdb35dhkxK8SDmT2SEGxKP+ptKEsEF71YxDPJapXCrPh7Q28ifjc
	ISgwWbyrFDXGReNhq1CzPi/ilEY1S79XSdIjlWyufAwrOKsQbcWNNXYz+Wt7qHpGthq2wqWAQYoFY
	C702o0mo5BWaJOo8Eq4+HOEaKdpeHYnzSheuNh1o9YakpCVYFdRVRFofaXNmYbX515JLwfUtCUSM8
	McEMQs7pVAA80L0Epiye66KOyeHic9yvH4aBhlT7u3IvccZITgohsC7JhfYESlOhcuXbYFCbrcfyx
	7wN6NkLw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGH5g-00000000Axq-2ei8;
	Tue, 04 Nov 2025 13:28:54 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762266255;
	bh=lGfuQV2S/g+wlL+QpilQu5Ha+EG82kPQCE+jmEMzG9Q=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=cg1qWtq9S+mmImzto0dgoNbpvvRgaV6OlSefpWB1OjUhv9lHNPJdDPs8WZKolG1cF
	 UtHdKs8zAxV8LxBJ6fXecuM9rkRH/TG/LIh18OLeWvN2zxAgbyWnnUn0j+hLyb4tzJ
	 gsD05CyQdKSCl/ygm6l0/P38uQFrPypZ3muk41IICy1Z7GaPjps7u6ufI/QDB1A1p0
	 UfmwQrwtuoRcPl+52HWtO7RssJFNGuPg8gp4FZb19xGSJfgZsEHBtvoMcsncqoYPSV
	 aMQGqVKIUCpLrS7oxmBzAiZz206AEUJ9F+6vZeoLL+Y2ra54hHTpcwg3PV18TWvuRt
	 7HpiVu3Icqvqg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0C70A17E1249;
	Tue,  4 Nov 2025 15:24:15 +0100 (CET)
Message-ID: <542ceb46-0b57-4cd1-a679-ec55457043ae@collabora.com>
Date: Tue, 4 Nov 2025 15:24:14 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V3 1/1] soc: mediatek: mtk-regulator-coupler: Add support
 for MT8189
To: "niklaus.liu" <Niklaus.Liu@mediatek.com>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Project_Global_Chrome_Upstream_Group@mediatek.com, sirius.wang@mediatek.com,
 vince-wl.liu@mediatek.com, jh.hsu@mediatek.com, zhigang.qin@mediatek.com,
 sen.chu@mediatek.com
References: <20251104071252.12539-1-Niklaus.Liu@mediatek.com>
 <20251104071252.12539-2-Niklaus.Liu@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20251104071252.12539-2-Niklaus.Liu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251104_132852_880866_1B011151 
X-CRM114-Status: GOOD (  23.39  )
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

Il 04/11/25 08:12, niklaus.liu ha scritto:
> From: Niklaus Liu <niklaus.liu@mediatek.com>
> 
> Enhance the regulator coupler driver to support GPU power control on the
> MediaTek MT8189 platform. This update ensures proper coordination of
> multiple regulators required for GPU operation,improving power management
> and system stability.
> 
> Signed-off-by: Niklaus Liu <niklaus.liu@mediatek.com>
> ---
>   drivers/soc/mediatek/mtk-regulator-coupler.c | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-regulator-coupler.c b/drivers/soc/mediatek/mtk-regulator-coupler.c
> index 0b6a2884145e..e2a1fb459e42 100644
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

This will break the rules of your own hardware. Seriously.

The VSRAM_GPU has to be set in a specific range, where the minimum voltage has to
guarantee that the GPU can run in the first quarter of the OPP entries (which does
always correspond to lowest/lower/low or lowest/low) for the GPU.

If you return zero here, and VSRAM_GPU was set to Vmax (scenario: GPU was at Turbo
frequency) before shutting down completely (ex.: system suspend), at device resume
time, the VSRAM_GPU rail will be overvolting the GPU SRAM.

While that won't cause any "magic smoke" because the VSRAM is still in the maximum
operating ranges constraint, this will leak power, hence increase the chip's heat
output, and might as well create possible instabilities.

Remember that the GPU SRAM voltage has to *always be constrained* as:
  - VSRAM <= VGPU when VGPU must be over the VSRAM constraint
  - VSRAM == VGPU if the voltages are in range between each other
  - VSRAM > VGPU *only* for SLEEP (or LOWEST) freq setting

As I already said in my previous review for this patch, your devicetree may be
misconfiguring the regulators, or their hierarchy (as those are MFG0/1+Panfrost).

Besides, are you testing this on Panfrost, even, or on the Mali DDK driver?
That really doesn't look right.

Also - MT8189 is not special. There's nothing different between MT8189 and the
others in regard to how the GPU regulators should be coupled, and in regard to
their constraints relationship.

Regards,
Angelo

> +	if (of_machine_is_compatible("mediatek,mt8189") && rdev == mrc->vsram_rdev)
> +		return 0;
> +
>   	/*
>   	 * If the target device is on, setting the SRAM voltage directly
>   	 * is not supported as it scales through its coupled supply voltage.
> @@ -148,6 +160,7 @@ static int mediatek_regulator_coupler_init(void)
>   	if (!of_machine_is_compatible("mediatek,mt8183") &&
>   	    !of_machine_is_compatible("mediatek,mt8186") &&
>   	    !of_machine_is_compatible("mediatek,mt8188") &&
> +	    !of_machine_is_compatible("mediatek,mt8189") &&

(but this is ok here)

>   	    !of_machine_is_compatible("mediatek,mt8192"))
>   		return 0;
>   


