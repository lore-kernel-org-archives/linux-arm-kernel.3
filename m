Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68470C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Jun 2025 10:32:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=g/TFDMjfZmD0CILZVhHxlUqy8FDluS77DxGXRSJeZC8=; b=s8ARpPnANuKFxA1FDBdsXtH+cT
	dvys9bDil6EQgw+V/SIBdxvCqy/cosJ0g4xUtmt6SQ3ZOepbiVbVsQWzQy0X+KetK7qm01QdM1Xa2
	2cqP79ctHrIb56DsSq1fImpvK4nLBN1IyhxQ7cQUHyMICDsWMKTRRLYxhrvGCseE6/aSh4pgTN/NL
	zkBhelD9JlvcPQtcEzsygn5tBlBO8LAlgBEdSE710bapQFAp6jPAhGpAF+nCYiZAyGFgtI2bOyYbL
	dLZaSpkwsD+YVUBK0U/vVnpZT/1qmbZjpKB/P37vsK7xad1KB5ponMkAmezBWdy6484CAhaEJpKvZ
	TZ8Ylm/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTeT9-00000002MTK-0r2u;
	Mon, 23 Jun 2025 10:32:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uTdvD-00000002G8k-2ZIV;
	Mon, 23 Jun 2025 09:57:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1750672622;
	bh=RCoJ5AZdDySs/hgx/F/bh991l9gXs7r9SpWwcCsJYtc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ADPjSGuwchwiLsRJIJWOi+gMDR1l0IBj1P3S0NQkes28J5zHw0pxwAIMDuzPp7zhY
	 emkvjW5zcZp3kwUJkygjWWfXgcAuYJxd2xiW0rVEJEeQMFzmLPh923cctaXzr2f/mS
	 74qZYd44oqd80YPZ9jP0KUchH+6xLtuXzBnE4TrvM4U1/n3Im3755Pb8XnY2n3rzZA
	 JjWZJBJPSRNizhDmb/AEvPw7lI2gOOr+ZuG9uOQa0sQxG26ACHI521BfUKYIWVRa27
	 Xm5hvtefav2lWjhnsNmDiPVZQaPqrc5yGej+CReXehWFXZSwLQ7go4SLkanuh37WRt
	 ywRxw2nLCyOJQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 9CD9F17E0CF7;
	Mon, 23 Jun 2025 11:57:01 +0200 (CEST)
Message-ID: <71fbe6ac-c89b-46ea-b0d2-31a829c0a2a0@collabora.com>
Date: Mon, 23 Jun 2025 11:57:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/4] mmc: mtk-sd: add default tuning parameters for mt7620
To: Shiji Yang <yangshiji66@outlook.com>, linux-mmc@vger.kernel.org
Cc: Chaotian Jing <chaotian.jing@mediatek.com>,
 Ulf Hansson <ulf.hansson@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <OSBPR01MB16708176FE57F691359D0943BC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
 <OSBPR01MB1670942996614E073E87077DBC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <OSBPR01MB1670942996614E073E87077DBC7DA@OSBPR01MB1670.jpnprd01.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250623_025703_831010_5939DDC4 
X-CRM114-Status: GOOD (  22.87  )
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

Il 19/06/25 07:35, Shiji Yang ha scritto:
> The MIPS MT762x SoCs require some specific tuning parameters at
> different clock frequencies. These legacy SoCs only support max
> 48~50 MHz High-Speed SD mode. Therefore, the standard tuning step
> is not available. We have to hardcode these tuning parameters to
> make them work properly.
> 
> Signed-off-by: Shiji Yang <yangshiji66@outlook.com>
> ---
>   drivers/mmc/host/mtk-sd.c | 18 +++++++++++++++++-
>   1 file changed, 17 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/mmc/host/mtk-sd.c b/drivers/mmc/host/mtk-sd.c
> index 53d63bb4e..52198daef 100644
> --- a/drivers/mmc/host/mtk-sd.c
> +++ b/drivers/mmc/host/mtk-sd.c
> @@ -79,6 +79,8 @@
>   #define MSDC_PATCH_BIT2  0xb8
>   #define MSDC_PAD_TUNE    0xec
>   #define MSDC_PAD_TUNE0   0xf0
> +#define MSDC_DAT_RDDLY0  0xf0
> +#define MSDC_DAT_RDDLY1  0xf4
>   #define PAD_DS_TUNE      0x188
>   #define PAD_CMD_TUNE     0x18c
>   #define EMMC51_CFG0	 0x204
> @@ -449,6 +451,7 @@ struct mtk_mmc_compatible {
>   	bool use_internal_cd;
>   	bool support_new_tx;
>   	bool support_new_rx;
> +	bool mips_mt762x;
>   };
>   
>   struct msdc_tune_para {
> @@ -595,6 +598,7 @@ static const struct mtk_mmc_compatible mt7620_compat = {
>   	.enhance_rx = false,
>   	.support_cmd23 = false,
>   	.use_internal_cd = true,
> +	.mips_mt762x = true,

No, you can't do that - this needs to be done in a clean manner.

Please map that to something that makes sense, as in, add the register definitions
and add something like...

.tune_para = {
	.tune0_rval = FIELD_PREP_CONST(MSDC_PAD_TUNE_DATWRDLY, 16) |
		      FIELD_PREP_CONST(MSDC_PAD_TUNE_DATRDDLY, 16) |
		      FIELD_PREP_CONST(MSDC_PAD_TUNE_CMDRDLY, 16) |
		      FIELD_PREP_CONST(MSDC_PAD_TUNE_CMDRRDLY, 4) |
		      FIELD_PREP_CONST(MSDC_PAD_TUNE_CLKTDLY, 10),
	.rddly0_rval = etc etc etc :-)
};

...then, check if .tune_para is present: if it is, apply the static settings,
otherwise, don't.

Cheers,
Angelo

>   };
>   
>   static const struct mtk_mmc_compatible mt7622_compat = {
> @@ -1090,7 +1094,12 @@ static void msdc_set_mclk(struct msdc_host *host, unsigned char timing, u32 hz)
>   	 * mmc_select_hs400() will drop to 50Mhz and High speed mode,
>   	 * tune result of hs200/200Mhz is not suitable for 50Mhz
>   	 */
> -	if (mmc->actual_clock <= 52000000) {
> +	if (host->dev_comp->mips_mt762x &&
> +	    mmc->actual_clock > 25000000) {
> +		sdr_set_bits(host->base + MSDC_IOCON, MSDC_IOCON_RSPL);
> +		sdr_set_bits(host->base + MSDC_IOCON, MSDC_IOCON_DSPL);
> +		sdr_set_bits(host->base + MSDC_IOCON, MSDC_IOCON_W_DSPL);
> +	} else if (mmc->actual_clock <= 52000000) {
>   		writel(host->def_tune_para.iocon, host->base + MSDC_IOCON);
>   		if (host->top_base) {
>   			writel(host->def_tune_para.emmc_top_control,
> @@ -2028,6 +2037,13 @@ static void msdc_init_hw(struct msdc_host *host)
>   				     MSDC_PAD_TUNE_RXDLYSEL);
>   	}
>   
> +	if (host->dev_comp->mips_mt762x) {
> +		/* Set default tuning parameters */
> +		writel(0x84101010, host->base + tune_reg);
> +		writel(0x10101010, host->base + MSDC_DAT_RDDLY0);
> +		writel(0x10101010, host->base + MSDC_DAT_RDDLY1);
> +	}
> +
>   	if (mmc->caps2 & MMC_CAP2_NO_SDIO) {
>   		sdr_clr_bits(host->base + SDC_CFG, SDC_CFG_SDIO);
>   		sdr_clr_bits(host->base + MSDC_INTEN, MSDC_INTEN_SDIOIRQ);



