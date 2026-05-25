Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D8A4CD5BCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 25 May 2026 08:46:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V3GWrH6OEudYkRJfmd+mdPaXCI7D1XyImuZGdNy8Zkc=; b=nyMCP4plK+LCvDuoOIFNo8DYIM
	7lPfp0Z2VVRjngALQeCQX5QA7NDWiHCrbCO69mNJOLFwUw0kuFbiVWNZIEwctZV9nYYKVSvwCORPl
	7Brb+JCAwPM+ar//Q65kYZwUFDneLN56ckg8dLgGmTpn5FKAXmpzTJxPSV6/eVzA6jT+3SPz2qmrn
	J1vcTrZR4WcbfFtATQwinO6uHQedt4/tvDgsMMJY2tTH6F2zoE6naNwJpiSG7J8JrbEvTbeHuaxv7
	nvAxmZX6sWLcHaAtttyEAErVnD/q9eEx295QFoszAdsOKFxI5/30xVo9ABrR6oMgbqbU+cDdy3jrW
	vYXD2Vcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQwp-0000000Gh6q-04wK;
	Mon, 25 May 2026 08:46:07 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRQwm-0000000Gh5f-2ZVH;
	Mon, 25 May 2026 08:46:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779698762;
	bh=RVCV0KAzW/3y+rrtGYRGLXcpYLEOUoe3QHZ5Oyu1M0I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=IpGgaYUA6WlJOXP8zbTfoc448+EE+PojNvepQ1agw5wLoubw+H5jaKP92Dzp++ysk
	 l/HLRMRapXzmRiMS/acTqtXxYOUe84ieO0fFJilWgd0fehR5CpY20JkaXN6yBAVMhN
	 xE14um8K1tCmwYIBjrTGIVTm7IJ6qAlIwv8Kf3EpUj8qu2oqFvC+t+9gmXbG6HVGJ0
	 RLPz0VG9Mkw3J30D4NiHBoYTYJELaQN1aEkYCBrvdRGq0cCyBEvp4E/8FPHTCu3WG5
	 CD6ap6E5z3XCe2rE6Rs5o9cqu5myFyfEKWAO/iCMBNqYX8Zsn0FTdcjBDw19KlUTtZ
	 bgpPV2xKmnujg==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id A7BCA17E0979;
	Mon, 25 May 2026 10:46:01 +0200 (CEST)
Message-ID: <dd1136db-1a78-4d32-a3ed-13691621c8ba@collabora.com>
Date: Mon, 25 May 2026 10:46:01 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] soc: mediatek: pwrap: Remove obsolete NEED CONFIRM
 comments
To: Akari Tsuyukusa <akkun11.open@gmail.com>, matthias.bgg@gmail.com
Cc: james.lo@mediatek.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20260522134522.368073-1-akkun11.open@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260522134522.368073-1-akkun11.open@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260525_014604_796614_3C2A9894 
X-CRM114-Status: GOOD (  12.92  )
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

On 5/22/26 15:45, Akari Tsuyukusa wrote:
> Remove the obsolete "/* NEED CONFIRM */" comments from the MT8196

s/mt8196/mt8195/g

> configuration. These values were previously confirmed during review,
> but the placeholder comments were accidentally left behind.
> 
> Link: https://lore.kernel.org/all/2a117e5fe9fe0ece39e9165a463082ef42be973f.camel@mediatek.com/
> Signed-off-by: Akari Tsuyukusa <akkun11.open@gmail.com>


after which...
Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>

> ---
>   drivers/soc/mediatek/mtk-pmic-wrap.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/soc/mediatek/mtk-pmic-wrap.c b/drivers/soc/mediatek/mtk-pmic-wrap.c
> index 0bcd85826375..87bcbfa2d5f1 100644
> --- a/drivers/soc/mediatek/mtk-pmic-wrap.c
> +++ b/drivers/soc/mediatek/mtk-pmic-wrap.c
> @@ -2396,8 +2396,8 @@ static const struct pmic_wrapper_type pwrap_mt8183 = {
>   static const struct pmic_wrapper_type pwrap_mt8195 = {
>   	.regs = mt8195_regs,
>   	.type = PWRAP_MT8195,
> -	.arb_en_all = 0x777f, /* NEED CONFIRM */
> -	.int_en_all = 0x180000, /* NEED CONFIRM */
> +	.arb_en_all = 0x777f,
> +	.int_en_all = 0x180000,
>   	.int1_en_all = 0,
>   	.spi_w = PWRAP_MAN_CMD_SPI_WRITE,
>   	.wdt_src = PWRAP_WDT_SRC_MASK_ALL,


