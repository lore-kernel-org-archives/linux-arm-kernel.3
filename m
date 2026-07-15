Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF1FFC44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 10:21:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8IHTFZJw7vLfk2PuR2YgR6mnbrGr/9fxMESJU6P9vmQ=; b=3fQVqsbHEAogqastu95ScZmnS6
	1fRB7HfpWRGfi39i8YZR254og7KB8DozPpr+oVuGVuOWe+B0gbb6g0f0UeECj3tAgwWq5wlSCuc3B
	+ZSlUM1kn47WoKuGnTQgAQvtM/EGkkC6n12649yCLcypEy0Ia4ACn2gHQ89UBRv5HgzOGyeLyQIEG
	FOQAWK/wE58HhZgmEGcibf3YmetcxLaRIy2R4hjC8bwWiyXvUdVtZP4LLZUtvFN1tB4nuyCxQVnkv
	lSfSfhXv0VdvP7ZakM5bUS3zP7cU32oE2VSOErdAk0mMrJ1bz78Jw1XhafPTLS6FMLlGBKimNx23S
	ppEXQu2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwjp-0000000EQj6-0oZB;
	Wed, 15 Jul 2026 10:21:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjwje-0000000EQcW-0Oa3;
	Wed, 15 Jul 2026 10:21:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784110860;
	bh=Hw/BoCYnl7wzuitRGrv0kSxyi3kjki5TkxoSffkFoww=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=fUr14yiSa6FFzkPn+YUF/aMiGely837G3oAjArMTBVXya3O6JaNgT5TrL2pQD/+xi
	 cbpw85ZbDCU+qi0SF+EPMtD9Nt2//HMa6CzVCu0NkyHvT7oVl8j8eOpxUyDl+aMJuU
	 woVcdUiNGIID5hzBObl8AwNtqEmzpVcne3maSR8oGhzEWP3U4/Zdn8LRLwscT9Qi3c
	 GPSeAThCLcLUg5Q/vQpK9ZYRxmiCIp24oEOd+hHjXtCfYNV6Y+BoNAk0AZRwbe+jzT
	 3VqAkjuJwKM+6CX/R4SywaihEVGUDqrr24A4d7da9uVAuWefnHE2bHGBy3/eUprtE8
	 Uj9LgqujeH5cQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8C6E317E0DFB;
	Wed, 15 Jul 2026 12:20:59 +0200 (CEST)
Message-ID: <3c112acd-5709-4144-9cab-54e0a51eefc9@collabora.com>
Date: Wed, 15 Jul 2026 12:20:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] soc: mediatek: pwrap: add mt6572 support
To: rva333@protonmail.com, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Flora Fu <flora.fu@mediatek.com>, Alexandre Mergnat <amergnat@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260714-6572-pwrap-v1-0-d8e5a39cf7ef@protonmail.com>
 <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260714-6572-pwrap-v1-3-d8e5a39cf7ef@protonmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_032102_297105_5990B69B 
X-CRM114-Status: GOOD (  16.14  )
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

On 7/14/26 14:42, Roman Vivchar via B4 Relay wrote:
> From: Roman Vivchar <rva333@protonmail.com>
> 
> Add mt6572 registers and platform data for the pmic wrapper.
> The mt2701 SoC-specific initialization function is used because they
> share the same GPS_INTF settings.
> 


> Signed-off-by: Roman Vivchar <rva333@protonmail.com>
> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 111 +++++++++++++++++++++++++++++++++++
>   1 file changed, 111 insertions(+)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index a4b10b0a97cb..4b8a5dc80a36 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -569,6 +569,96 @@ static const int mt2701_regs[] = {
>   	[PWRAP_ADC_RDATA_ADDR2] =	0x154,
>   };
>   

..snip..

>   
> +static const struct pmic_wrapper_type pwrap_mt6572 = {
> +	.regs = mt6572_regs,

MT6572 only has PWRAP_OP_TYPE, PWRAP_MSB_FIRST, PWRAP_GPS_STA additional registers
compared to MT2701, and the three are currently unused.

Instead of adding yet one more huge array for 3 more registers, since I'm mostly
sure that those will never be used anyway (happy if you prove me wrong!), you can
at this point just use mt2701_regs for mt6572.

Perhaps, add a comment saying that MT6572 does indeed have those additional regs
but were omitted because currently unused.

So, something like

/*
  * MT6572 has additional registers OP_TYPE (0x10), MSB_FIRST (0x14), GPS_STA (0x40)
  * which were omitted as they're currently unused in this driver.
  * Apart from that, the register map matches the one from MT2701.
  */
static const struct pmic_wrapper_type pwrap_mt6572 = {
	.regs = mt2701_regs,

Cheers,
Angelo

> +	.type = PWRAP_MT6572,
> +	.arb_en_all = 0x1ff,
> +	.int_en_all = 0x7ffffffd,
> +	.int1_en_all = 0,
> +	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
> +	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,
> +	.caps = PWRAP_CAP_RESET | PWRAP_CAP_DCM,
> +	.init_reg_clock = pwrap_common_init_reg_clock,
> +	.init_soc_specific = pwrap_mt2701_init_soc_specific,
> +};
> +
>   static const struct pmic_wrapper_type pwrap_mt6765 = {
>   	.regs = mt6765_regs,
>   	.type = PWRAP_MT6765,
> @@ -2446,6 +2556,7 @@ static const struct pmic_wrapper_type pwrap_mt8186 = {
>   
>   static const struct of_device_id of_pwrap_match_tbl[] = {
>   	{ .compatible = "mediatek,mt2701-pwrap", .data = &pwrap_mt2701 },
> +	{ .compatible = "mediatek,mt6572-pwrap", .data = &pwrap_mt6572 },
>   	{ .compatible = "mediatek,mt6765-pwrap", .data = &pwrap_mt6765 },
>   	{ .compatible = "mediatek,mt6779-pwrap", .data = &pwrap_mt6779 },
>   	{ .compatible = "mediatek,mt6795-pwrap", .data = &pwrap_mt6795 },
> 

