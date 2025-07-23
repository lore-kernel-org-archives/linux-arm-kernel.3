Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0417C83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 08:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jMhPJFSeXJKcyCogGFTDO28bJa6C4RLi56PYB9ywHGo=; b=DZtqWvCbBR0W5cTXhdsNc/FDun
	bo3I0zWf0d1+2iYh764Nydm7U0Lcn7nOEOdSyHBzC2O99Zi959r8hcRQgt4xIc1Ol/TMxegTkUX4P
	r5eU+U5ihyWOKbnCxyRg8QWKQuo/uRbwSh1U6iwegeqyFp+jOTF/rd4G+Y1IRsNKiNXNYsMWi/CQt
	aA23Ga7l1bUJjPlqKxm3CkTvXlfZ/HOH91tTG5A0AZx+EnYBQBIyNnGvd1lpjMtaGzHlR5N5ZATfM
	xO17OhYi89Mwjp7mZyZF8Njszn7fbpdvhgnEFx4aMEsPFMYiEclUCTUp3W6v6iMRwBABcUqb4pAXO
	TdAxV5wA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUX5-00000004Kq6-3Pa6;
	Wed, 23 Jul 2025 08:08:59 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueUCm-00000004Hm5-2vJ2;
	Wed, 23 Jul 2025 07:48:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C528A66923;
	Wed, 23 Jul 2025 07:47:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 15CF4C4CEE7;
	Wed, 23 Jul 2025 07:47:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753256879;
	bh=KKn1BH2pU5ZMIp/brMQbOxv6/eE2JB3+FPK/EVwTJEU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pqmUo9BC2wb+EIBkEj8YcSNMz6GCFUmCrc/X+6TbLnXqwuG2OKYA8oFA15SguPS+j
	 MAVtyLPjoQZJmRYejaeYEXCPsiCL5JLtfD/GtS/gGyTrJtH0Rabg72Mheklyh750PG
	 6f97AynZ9MvkAXWSYEiVjEa9Z7lSNgRxjA5AG1nTmnuBmR3vek8kVlBFkmkJPSvE1j
	 Ii2/ZCsl0Rqnr2yayr3BX7b/8wAr/DEj4Tq/5Mw7a53di50DSTJfs/nzLRgcYOacU7
	 ozH30cEGU4Xmy+4bocX68Nvanhfcwwlsn2mLtgNZ9R88YAojlIg2zLFqveVFZAn243
	 eWi48zyMYS2xQ==
Date: Wed, 23 Jul 2025 09:47:56 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: muhammed.efecetin.67@gmail.com
Cc: linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, heiko@sntech.de, neil.armstrong@linaro.org, lee@kernel.org, 
	rafael@kernel.org, efectn@protonmail.com, daniel.lezcano@linaro.org
Subject: Re: [PATCH v2 3/5] mfd: add Khadas Edge 2 registers to khadas-mcu.
Message-ID: <20250723-adamant-smiling-markhor-a8ebee@kuoka>
References: <cover.1753179491.git.efectn@protonmail.com>
 <41993cb8130fc206ee6820866154baef7db804e8.1753179491.git.efectn@protonmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <41993cb8130fc206ee6820866154baef7db804e8.1753179491.git.efectn@protonmail.com>
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

On Tue, Jul 22, 2025 at 03:38:13PM +0300, muhammed.efecetin.67@gmail.com wrote:
>  	ddata = devm_kzalloc(dev, sizeof(*ddata), GFP_KERNEL);
> @@ -94,7 +130,11 @@ static int khadas_mcu_probe(struct i2c_client *client)
>  
>  	ddata->dev = dev;
>  
> -	ddata->regmap = devm_regmap_init_i2c(client, &khadas_mcu_regmap_config);
> +	if (of_device_is_compatible(dev->of_node, "khadas,mcu-v2"))

This does not scale. Use device match data for exactly this purpose.

> +		regmap_config = &khadas_mcu_regmap_config_v2;
> +	else
> +		regmap_config = &khadas_mcu_regmap_config;
> +	ddata->regmap = devm_regmap_init_i2c(client, regmap_config);
>  	if (IS_ERR(ddata->regmap)) {
>  		ret = PTR_ERR(ddata->regmap);
>  		dev_err(dev, "Failed to allocate register map: %d\n", ret);
> @@ -113,6 +153,7 @@ static int khadas_mcu_probe(struct i2c_client *client)
>  #ifdef CONFIG_OF
>  static const struct of_device_id khadas_mcu_of_match[] = {
>  	{ .compatible = "khadas,mcu", },
> +	{ .compatible = "khadas,mcu-v2", },

So devices are 100% compatible? Empty match data suggests that...

Best regards,
Krzysztof


