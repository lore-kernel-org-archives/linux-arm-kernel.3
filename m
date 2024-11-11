Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB24D2E9C3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 09:15:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E5adKoLJIzz/ffid1ZIMaHJpYRQg8lqTXgqnfMDx2AY=; b=in84OqpAXwyhmLlqeMhr+8roOq
	ouZzxye3P8aQmPDqkRTiPvljTAV+trCfxVLLEsJ2sRcpfGn9ks+7gD5W/K5WfCjtH5ILQ/QEuP8nl
	Ja98Dom8a8IEf6SEEqEBviBpx6H/41rmt4IqZm3oag/vwHlMhM6o2aRznkWS1fdaTrbRwMIIneWUs
	3PN2yYYqEBR7r7dpDvKos4ZlQKfUC3SmaF1IFIGu8Ye7E/Y31Bx+qw9tSUSZWTTwEF0VXTB0KC3B8
	jGeOHa5+jMBfoDHH6NLtqA+0J9E2XlvDOu1Lsnut6T+g6uiQTI0dCQHM5uAB5ui0zoCqQ3Udf79ch
	dIGID/Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQVY-0000000H35Z-19vR;
	Mon, 11 Nov 2024 09:14:52 +0000
Received: from smtp-22.smtpout.orange.fr ([80.12.242.22] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAQTZ-0000000H2YA-1nbM;
	Mon, 11 Nov 2024 09:12:53 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id AQTPtyuHNkdV1AQTPtqV7j; Mon, 11 Nov 2024 10:12:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1731316361;
	bh=E5adKoLJIzz/ffid1ZIMaHJpYRQg8lqTXgqnfMDx2AY=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=LffppI7ywfAVd3sjvdQxQwRaHPxwMdi/F2n0moYT7mRgQk1bkWCVdm+wbbdWogjgz
	 /VSniLVOEdPfXm3DeXYvgGNuENDNgRUaZXNogfgoQFLHsyVS2sAyJbDwihSZQS4X13
	 PZ9g6pYfmW3xDRtsu83wzQYdUywQ6AWKBoTEa1oEuE/W8fpvpWou2ryGETvJ/tAfyV
	 wzcfrDs1ecEoPuBm4672/OAGDREj7+koCK4776A+KjaRQpEnY1fgk32cgNQwZ51Ne5
	 JN/w0O1vpuCtSxC8bZzO5YiBzJibMHMAdHumcGqb+Hi2nFSNjmi+ePrJ1ruIvtM8Vo
	 oGi4jt78Y1FCg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Mon, 11 Nov 2024 10:12:41 +0100
X-ME-IP: 90.11.132.44
Message-ID: <0fd22798-8aa1-4d86-bdaa-c03938972319@wanadoo.fr>
Date: Mon, 11 Nov 2024 10:12:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] pinctrl: mediatek: Add support for MT8196
To: ot907280 <ot_cathy.xu@mediatek.com>, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, sean.wang@kernel.org,
 linus.walleij@linaro.org
Cc: linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>,
 Guodong Liu <guodong.liu@mediatek.com>
References: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20241111085354.26576-1-ot_cathy.xu@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_011250_010463_60AB34D6 
X-CRM114-Status: GOOD (  11.64  )
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

Le 11/11/2024 à 09:53, ot907280 a écrit :
> From: Guodong Liu <guodong.liu@mediatek.corp-partner.google.com>
> 
> Add register address for each pin config.
> Add the function for each pin.
> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Cathy Xu <ot_cathy.xu@mediatek.com>
> ---

Hi,

> diff --git a/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> new file mode 100644
> index 000000000000..9732ede74d9b
> --- /dev/null
> +++ b/drivers/pinctrl/mediatek/pinctrl-mtk-mt8196.h
> @@ -0,0 +1,2791 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Copyright (C) 2024 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + *
> + */
> +
> +#ifndef __PINCTRL_MTK_MT8196_H
> +#define __PINCTRL_MTK_MT8196_H
> +

...

> +	MTK_PIN(
> +		292, "veint292",
> +		MTK_EINT_FUNCTION(0, 292),
> +		DRV_GRP4,
> +		MTK_FUNCTION(0, NULL)
> +	)
> +};
> +
> +#endif /* __PINCTRL__MTK_MT8196_H */

Nitpick: there is an extra _ before MTK here.


