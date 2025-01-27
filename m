Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72894C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 11:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j3rCrfBQxRg34UHrvcXEAEaVpRPffRi4D+KAYfBVRcE=; b=JVu9sSWhKoBHPC25SAlxO/WjMh
	UD+YscN9wM4Woufc8H4jyCU0zfVhzP4wF9Y4IjeK6t0qLeEOXdEhj4J3K809C6VPIet7W1pLidAGe
	BgDXxEi4AyiYEWiCZrtgUQuvGlvTVdF94wcDc9D6dCmyjScn+rvI3zuU6PfLjbn8lyxkUvKj2CGo7
	u6Zk3Xp/YiUUJcvAII7JRMLtRF1P0UQz32EGUkY0QqW1m5DfKgeH+SzOkNNpTD5r2Vt+C2vxi/gPW
	oisQvruM441K2Lc4NUJVH+uf7gRE29IHU7aI07BVRDBv85nNyne54q2HZko4YM4UaHZwQw9+KTSFL
	k406r9gQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNch-00000002FDI-3uDe;
	Mon, 27 Jan 2025 11:49:47 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcNbQ-00000002F8V-3ccm;
	Mon, 27 Jan 2025 11:48:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1737978507;
	bh=lc+C2L2elEfWKiD8GPckPA2FJyMup+IhWEW4zlgFAig=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gzg2v/os61vIFPi7VAU4A/Dvy9J/wCYbsI/vpiIrry+fjO6XL+/NABr8UWmP7c3o2
	 +E+M3bW3V/jygyD7Fi7KDySzISf5Jk4mPh9xcMFYtbHJH/IpmbICdDgCHKJ8ETU9Jb
	 YKO29XB9mfWFxi8J8xtyGCCfKvXR7aOj0X5ePCXAL9PTY/IpRynjpVXrBuJyTRT0xV
	 pZR+bmMmXZXlXaBu45qNC5EK1ELPYlfTD0yCyUCrB0h2D/XlhrcREIUzI72A27d8eP
	 lBl018apjofsBdTuIJdL+PhYSmlkgNQQ9so/RM/+bQI2Av/1D4AFAuHpoH9sdJsnRc
	 C/rvwcQ8MQZPw==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 91FA717E0B18;
	Mon, 27 Jan 2025 12:48:26 +0100 (CET)
Message-ID: <bfce3aea-490b-4311-ad4a-ab567d2a0572@collabora.com>
Date: Mon, 27 Jan 2025 12:48:26 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND v3 2/2] pinctrl: mediatek: adapt to multi-base design
To: Hao Chang <ot_chhao.chang@mediatek.com>, Sean Wang
 <seann.wang@kernel.org>, Linus Walleij <linus.walleij@linaro.org>,
 Matthias Brugger <matthias.bgg@gmail.com>
Cc: Wenbin Mei <wenbin.mei@mediatek.com>, Axe Yang <axe.yang@mediatek.com>,
 Qingliang Li <qingliang.li@mediatek.com>,
 Hanks Chen <hanks.chen@mediatek.com>, Chunhui Li <chunhui.li@mediatek.com>,
 linux-mediatek@lists.infradead.org, linux-gpio@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250125025145.14405-1-ot_chhao.chang@mediatek.com>
 <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250125025145.14405-3-ot_chhao.chang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_034829_060742_C75C4027 
X-CRM114-Status: GOOD (  19.78  )
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

Il 25/01/25 03:51, Hao Chang ha scritto:
> The eint num will obtain the operation address through pins.
> Change the traversal method of irq handle from traversing a set of
> registers to traversing one by one.
> 
> Change-Id: I3962b78042d32501a73153201cddf52c6b62a695
> Signed-off-by: Hao Chang <ot_chhao.chang@mediatek.com>
> Signed-off-by: Qingliang Li <qingliang.li@mediatek.com>
> ---
>   drivers/pinctrl/mediatek/mtk-eint.c | 38 +++++++++++++++++++----------
>   1 file changed, 25 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/pinctrl/mediatek/mtk-eint.c b/drivers/pinctrl/mediatek/mtk-eint.c
> index 540245c3128d..949a20196f74 100644
> --- a/drivers/pinctrl/mediatek/mtk-eint.c
> +++ b/drivers/pinctrl/mediatek/mtk-eint.c
> @@ -513,6 +513,7 @@ EXPORT_SYMBOL_GPL(mtk_eint_find_irq);
>   int mtk_eint_do_init(struct mtk_eint *eint)
>   {
>   	unsigned int size, i, port;
> +	struct mtk_pinctrl *hw = (struct mtk_pinctrl *)eint->pctl;
>   
>   	/* If clients don't assign a specific regs, let's use generic one */
>   	if (!eint->regs)
> @@ -523,11 +524,11 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   	if (!eint->base_pin_num)
>   		return -ENOMEM;
>   
> -	if (!eint->pins) {
> +	if (eint->nbase == 1) {
>   		size = eint->hw->ap_num * sizeof(struct mtk_eint_pin);
>   		eint->pins = devm_kmalloc(eint->dev, size, GFP_KERNEL);
>   		if (!eint->pins)
> -			return -ENOMEM;
> +			goto err_eint;
>   
>   		eint->base_pin_num[0] = eint->hw->ap_num;
>   		for (i = 0; i < eint->hw->ap_num; i++) {
> @@ -536,34 +537,29 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   			eint->pins[i].debounce = (i < eint->hw->db_cnt) ? 1 : 0;
>   		}
>   	} else {
> +		eint->pins = hw->soc->eint_pin;
>   		for (i = 0; i < eint->hw->ap_num; i++)
>   			eint->base_pin_num[eint->pins[i].instance]++;
>   	}
>   
>   	eint->wake_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
> -	if (!eint->wake_mask)
> -		return -ENOMEM;
> -
>   	eint->cur_mask = devm_kmalloc(eint->dev, eint->nbase * sizeof(u32 *), GFP_KERNEL);
> -	if (!eint->wake_mask)
> -		return -ENOMEM;

This error checking was fine. Please keep it correct.

if (!eint->wake_mask) {
	ret = -ENOMEM;
	goto err_wake_mask_alloc;
}

and

if (!eint->cur_mask) {
	ret = -ENOMEM;
	goto err_cur_mask_alloc;
}

> +	if (!eint->wake_mask || !eint->wake_mask)
> +		goto err_eint;
>   
>   	for (i = 0; i < eint->nbase; i++) {
>   		port = (eint->base_pin_num[i] + 31) / 32;
>   		eint->wake_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
> -		if (!eint->wake_mask[i])
> -			return -ENOMEM;
> -
>   		eint->cur_mask[i] = devm_kzalloc(eint->dev, port * sizeof(u32), GFP_KERNEL);
> -		if (!eint->cur_mask[i])
> -			return -ENOMEM;
> +		if (!eint->cur_mask[i] || !eint->wake_mask[i])
> +			goto err_eint;

same here

>   	}
>   
>   	eint->domain = irq_domain_add_linear(eint->dev->of_node,
>   					     eint->hw->ap_num,
>   					     &irq_domain_simple_ops, NULL);
>   	if (!eint->domain)
> -		return -ENOMEM;
> +		goto err_eint;
>   
>   	if (eint->hw->db_time) {
>   		for (i = 0; i < MTK_EINT_DBNC_MAX; i++)
> @@ -585,6 +581,22 @@ int mtk_eint_do_init(struct mtk_eint *eint)
>   					 eint);
>   
>   	return 0;
> +
> +err_eint:
> +	for (i = 0; i < eint->nbase; i++) {
> +		if (eint->wake_mask[i])
> +			devm_kfree(eint->dev, eint->wake_mask[i]);
> +		if (eint->cur_mask[i])
> +			devm_kfree(eint->dev, eint->cur_mask[i]);
> +	}
> +	if (eint->cur_mask)
> +		devm_kfree(eint->dev, eint->cur_mask);
> +	if (eint->wake_mask)
> +		devm_kfree(eint->dev, eint->wake_mask);
> +	if (eint->nbase == 1)
> +		devm_kfree(eint->dev, eint->pins);
> +	devm_kfree(eint->dev, eint->base_pin_num);

...and you should only kfree what was successfully allocated before.

Regards,
Angelo

> +	return -ENOMEM;
>   }
>   EXPORT_SYMBOL_GPL(mtk_eint_do_init);
>   



