Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79EAB10A3D81
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 12:10:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RyMtQtSiSacytd5i+Tr1NtSr7uF+67yH1CeR8o5rwV8=; b=CmHpTEod1auX1Hkfurz1kTDCQL
	nxPxULymn3wEQwOrDYhBLBtavvPHJoaxO+g16Xnk9IptZg8Chd5xUjzQdj9uyTyTQj0Esg5Soxoa4
	gAhq4gPt+I1FNihpFuU1FT8DCcPtGxO2DJWaEqFpUEjVFDq2kC4A/Q/RD3wOnhmgT0gGfucEWyitU
	Y9e76/XrTOMbYF1sJyvSFAL8uaJVL8Efo2FiEG/+fsmqnAqyhCrIpR0yMP3q8Y7g/knQX0l6DPO4G
	E1ev9xfsaO1ZmI8u6RV2R+NfjOV9tGRulYT3O9Yy+X1y55rREQaZHuiiLjA2YKlZr+JkzrRmqbMoI
	3pehj3CA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jXa-00000005Pi5-0sVM;
	Thu, 26 Mar 2026 12:10:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5jXZ-00000005Phu-0h5V;
	Thu, 26 Mar 2026 12:10:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 23CEC60103;
	Thu, 26 Mar 2026 12:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E6694C116C6;
	Thu, 26 Mar 2026 12:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774527019;
	bh=dtdPYOxSruNMTYr7ovgDe+Uvc6axC30hpLRYIuFkgWM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=V5kZbdoVPJdViQFbIY/5CRC1c7nchphQYFhcb7T1/liR7daVygcSF5m9TyRiB+5eF
	 F3u68kr9P7CzybtGbNfE0aP5Ha1I8Qkz9ADEFCOntBNCNFuYk6oiNgHPPZxjLneYDM
	 w9QH5qIF31eEEtlMnz19jP71zUtcw+7c1Bf4ynVhIzLpNjj+k0STMzKeqeCA/UMxCP
	 AgBsYrhc2FOXIbsV1WWLlWOB0Pj8trZ9drWF0t3UUHJLfCvJn21W9jWVIQYmxPX1UX
	 RMti/wsGhFhmDstvUMxcGgV0/W9ULyjJ50M4/VTPPoz5ciJG9DUx/Svj8R3oVNRU1v
	 ZiAb7woNojxYw==
Date: Thu, 26 Mar 2026 12:10:12 +0000
From: Lee Jones <lee@kernel.org>
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
Cc: linux-mediatek@lists.infradead.org, Fabien Parent <parent.f@gmail.com>,
	Val Packett <val@packett.cool>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Sen Chu <sen.chu@mediatek.com>,
	Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Linus Walleij <linusw@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>,
	Julien Massot <julien.massot@collabora.com>,
	Gary Bisson <bisson.gary@gmail.com>,
	Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>, linux-input@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 5/9] mfd: mt6397: Add support for MT6392 pmic
Message-ID: <20260326121012.GM1141718@google.com>
References: <20260317184507.523060-1-l.scorcia@gmail.com>
 <20260317184507.523060-6-l.scorcia@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260317184507.523060-6-l.scorcia@gmail.com>
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

On Tue, 17 Mar 2026, Luca Leonardo Scorcia wrote:

> From: Fabien Parent <parent.f@gmail.com>
> 
> Update the MT6397 MFD driver to support the MT6392 PMIC.
> 
> Signed-off-by: Fabien Parent <parent.f@gmail.com>
> Signed-off-by: Val Packett <val@packett.cool>
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> ---
>  drivers/mfd/mt6397-core.c            |  46 +++
>  drivers/mfd/mt6397-irq.c             |   8 +
>  include/linux/mfd/mt6392/core.h      |  42 +++
>  include/linux/mfd/mt6392/registers.h | 487 +++++++++++++++++++++++++++
>  include/linux/mfd/mt6397/core.h      |   1 +
>  5 files changed, 584 insertions(+)
>  create mode 100644 include/linux/mfd/mt6392/core.h
>  create mode 100644 include/linux/mfd/mt6392/registers.h
> 
> diff --git a/drivers/mfd/mt6397-core.c b/drivers/mfd/mt6397-core.c
> index 3e58d0764c7e..c4b86a44c68b 100644
> --- a/drivers/mfd/mt6397-core.c
> +++ b/drivers/mfd/mt6397-core.c
> @@ -18,6 +18,7 @@
>  #include <linux/mfd/mt6357/core.h>
>  #include <linux/mfd/mt6358/core.h>
>  #include <linux/mfd/mt6359/core.h>
> +#include <linux/mfd/mt6392/core.h>
>  #include <linux/mfd/mt6397/core.h>
>  #include <linux/mfd/mt6323/registers.h>
>  #include <linux/mfd/mt6328/registers.h>
> @@ -25,6 +26,7 @@
>  #include <linux/mfd/mt6357/registers.h>
>  #include <linux/mfd/mt6358/registers.h>
>  #include <linux/mfd/mt6359/registers.h>
> +#include <linux/mfd/mt6392/registers.h>
>  #include <linux/mfd/mt6397/registers.h>
>  
>  #define MT6323_RTC_BASE		0x8000
> @@ -39,6 +41,9 @@
>  #define MT6358_RTC_BASE		0x0588
>  #define MT6358_RTC_SIZE		0x3c
>  
> +#define MT6392_RTC_BASE		0x8000
> +#define MT6392_RTC_SIZE		0x3e
> +
>  #define MT6397_RTC_BASE		0xe000
>  #define MT6397_RTC_SIZE		0x3e
>  
> @@ -65,6 +70,11 @@ static const struct resource mt6358_rtc_resources[] = {
>  	DEFINE_RES_IRQ(MT6358_IRQ_RTC),
>  };
>  
> +static const struct resource mt6392_rtc_resources[] = {
> +	DEFINE_RES_MEM(MT6392_RTC_BASE, MT6392_RTC_SIZE),
> +	DEFINE_RES_IRQ(MT6392_IRQ_RTC),
> +};
> +
>  static const struct resource mt6397_rtc_resources[] = {
>  	DEFINE_RES_MEM(MT6397_RTC_BASE, MT6397_RTC_SIZE),
>  	DEFINE_RES_IRQ(MT6397_IRQ_RTC),
> @@ -114,6 +124,11 @@ static const struct resource mt6331_keys_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6331_IRQ_STATUS_HOMEKEY, "homekey"),
>  };
>  
> +static const struct resource mt6392_keys_resources[] = {
> +	DEFINE_RES_IRQ_NAMED(MT6392_IRQ_PWRKEY, "powerkey"),
> +	DEFINE_RES_IRQ_NAMED(MT6392_IRQ_FCHRKEY, "homekey"),
> +};
> +
>  static const struct resource mt6397_keys_resources[] = {
>  	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_PWRKEY, "powerkey"),
>  	DEFINE_RES_IRQ_NAMED(MT6397_IRQ_HOMEKEY, "homekey"),
> @@ -253,6 +268,26 @@ static const struct mfd_cell mt6359_devs[] = {
>  	},
>  };
>  
> +static const struct mfd_cell mt6392_devs[] = {
> +	{
> +		.name = "mt6392-rtc",
> +		.num_resources = ARRAY_SIZE(mt6392_rtc_resources),
> +		.resources = mt6392_rtc_resources,
> +		.of_compatible = "mediatek,mt6392-rtc",
> +	}, {
> +		.name = "mt6392-regulator",
> +		.of_compatible = "mediatek,mt6392-regulator",
> +	}, {
> +		.name = "mt6392-pinctrl",
> +		.of_compatible = "mediatek,mt6392-pinctrl",
> +	}, {
> +		.name = "mt6392-keys",
> +		.num_resources = ARRAY_SIZE(mt6392_keys_resources),
> +		.resources = mt6392_keys_resources,
> +		.of_compatible = "mediatek,mt6392-keys"
> +	},
> +};
> +
>  static const struct mfd_cell mt6397_devs[] = {
>  	{
>  		.name = "mt6397-rtc",
> @@ -335,6 +370,14 @@ static const struct chip_data mt6359_core = {
>  	.irq_init = mt6358_irq_init,
>  };
>  
> +static const struct chip_data mt6392_core = {
> +	.cid_addr = MT6392_CID,
> +	.cid_shift = 0,
> +	.cells = mt6392_devs,

I'm not really sure what came over me when I accepted this 6 years ago,
but I have a _strong_ aversion to MFD data being passed through the OF APIs.

Before this patch lands, please could you refactor this driver to only
pass through an identifier through mt6397_of_match[*].data.  Then, you
can match on that via a switch statement where you can allocate each
device's data structures.

This is how the vast majority of MFD drivers work so there should be
lots of examples to work through to make this trivial.

> +	.cell_size = ARRAY_SIZE(mt6392_devs),
> +	.irq_init = mt6397_irq_init,
> +};

-- 
Lee Jones [李琼斯]

