Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206B5CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 07:54:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4bRdZpQukdxlI8XDNX3IGnbsgYs/TWlowE8vmpvai3A=; b=5C869oYKEopFyvl0Kr/IaAsciR
	5jEWDanpEB2DziOsZv7e6iSlko2fyL7UHGlG6EwV8B2Swwhfnz0Ym/ejtD24Uta6ege2kdZgFyIZh
	YhGvOsmEVi9NylN0dtMPO3Ad7fnMumjFZFEdmz38dqKvmq/f9cdUrbxE3LiMeTkHzTgKBE2azPAkZ
	dUokOY2yaWd/OADFM9Q9AqxusLBoEbm3+By1M8SwXZUket6DarNbOeaaeVTQI71k+0z3B57VUDufw
	qSkFvXtvTaCkqQ2sVGn4oFT9weDos3wpbJPFSmnIm7nbM4E5XH+OCYvp7DUoBykMILtTBNKO2mX8j
	7CkJJ5jQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bNU-00000009Xnh-0tSq;
	Mon, 22 Sep 2025 07:54:28 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0bNR-00000009XmX-2JjY;
	Mon, 22 Sep 2025 07:54:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758527662;
	bh=0iFWjWmm10I7s3tjgXzkqF+axpO0XqIWYpCg5ZNToRc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=pUe2aln1kgbInn1sd3eipvoHMhd3Z61caAUAtGbUsMVpb/G+Rhr8WRtZXEd4nsRwp
	 sceyvOL0BMqYhIegw0zZZ/LImHjo2xtrEDYa9kluRrwLQmJ0x4GyuBfMTBLEd5duq2
	 G/5REOOvTKYwy43PQMTuokW1xK2EenrIbxto34dgIYJ7uT23DY+JBEo31sruBLSQZy
	 R2+GxbD0CsBE33nbQt68CjzurcK+Jp1VReEmhDmtRgBhXZagjvAdinNxrxsSioklOQ
	 27TUx/zUQsifEPfUSgfosvlrBE9FuUT+vtztS0lo8sZuz/93eZsqZ6cqnT6kijqgme
	 l1QcGfOHSO4yw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 1FC6917E10B7;
	Mon, 22 Sep 2025 09:54:22 +0200 (CEST)
Message-ID: <8e9947ba-c37c-41e3-9e0e-c802aae0d833@collabora.com>
Date: Mon, 22 Sep 2025 09:54:21 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] i2c: mediatek: add support for MT6878 SoC
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>,
 Qii Wang <qii.wang@mediatek.com>, Andi Shyti <andi.shyti@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>
Cc: ~postmarketos/upstreaming@lists.sr.ht, linux-i2c@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250920-mt6878-i2c-bringup-v1-0-d1527ffd3cd7@mentallysanemainliners.org>
 <20250920-mt6878-i2c-bringup-v1-2-d1527ffd3cd7@mentallysanemainliners.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250920-mt6878-i2c-bringup-v1-2-d1527ffd3cd7@mentallysanemainliners.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_005425_748778_80247894 
X-CRM114-Status: GOOD (  16.62  )
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

Il 20/09/25 17:31, Igor Belwon ha scritto:
> Add support for the I2C units found in the MediaTek MT6878 SoC.
> Just like other recent MediaTek SoCs, it uses the v3 register offsets
> (which differ from v2 only by OFFSET_SLAVE_ADDR being
> 0x94 instead of 0x4).
> 

That's exactly the same as mt8188_compat, so you don't need to add new
platform data for this SoC.

This means that this patch is not needed.

Cheers,
Angelo

> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>   drivers/i2c/busses/i2c-mt65xx.c | 14 ++++++++++++++
>   1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/i2c/busses/i2c-mt65xx.c b/drivers/i2c/busses/i2c-mt65xx.c
> index ab456c3717db18eef74226de0ee88c49228796f5..085702aee006a6dd0ac89d1382a12fbac2d91c55 100644
> --- a/drivers/i2c/busses/i2c-mt65xx.c
> +++ b/drivers/i2c/busses/i2c-mt65xx.c
> @@ -402,6 +402,19 @@ static const struct mtk_i2c_compatible mt6589_compat = {
>   	.max_dma_support = 32,
>   };
>   
> +static const struct mtk_i2c_compatible mt6878_compat = {
> +	.regs = mt_i2c_regs_v3,
> +	.pmic_i2c = 0,
> +	.dcm = 0,
> +	.auto_restart = 1,
> +	.aux_len_reg = 1,
> +	.timing_adjust = 1,
> +	.dma_sync = 0,
> +	.ltiming_adjust = 1,
> +	.apdma_sync = 1,
> +	.max_dma_support = 36,
> +};
> +
>   static const struct mtk_i2c_compatible mt7622_compat = {
>   	.quirks = &mt7622_i2c_quirks,
>   	.regs = mt_i2c_regs_v1,
> @@ -525,6 +538,7 @@ static const struct of_device_id mtk_i2c_of_match[] = {
>   	{ .compatible = "mediatek,mt2712-i2c", .data = &mt2712_compat },
>   	{ .compatible = "mediatek,mt6577-i2c", .data = &mt6577_compat },
>   	{ .compatible = "mediatek,mt6589-i2c", .data = &mt6589_compat },
> +	{ .compatible = "mediatek,mt6878-i2c", .data = &mt6878_compat },
>   	{ .compatible = "mediatek,mt7622-i2c", .data = &mt7622_compat },
>   	{ .compatible = "mediatek,mt7981-i2c", .data = &mt7981_compat },
>   	{ .compatible = "mediatek,mt7986-i2c", .data = &mt7986_compat },
> 


