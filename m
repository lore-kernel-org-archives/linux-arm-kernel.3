Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33633606A31D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 23:35:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jRyNrolD;
	dkim=pass (1024-bit key, unprotected) header.d=collabora.com header.i=michael.riesch@collabora.com header.a=rsa-sha256 header.s=zohomail header.b=Vi5fPrV1
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+HFd/mNMRs2yLr3SzOxqHhvlBdObgdqBXts9q3SbxiI=; b=jRyNrolDT2jYX2
	YD42M6Bgt5huCyi8BSNC04ytNwGCxtwvtUrRYjF1Fs/0UnRZCAxRcOQXP/Fx7xrLt/vo3biqFjS5p
	fthx0v4XTC8NsAAU5rylReD+gBEbixg8icC7I+uwuey8eQnQPYKvQV9Q8XVR/ht9EURd2QO4EkuJr
	Gj5GOkug37D3ksbfMlhLUZ23a5pcU/hpdgCWeXCeIelg8RpVgF0EqoU8IpVmIRkHmds8Ul38MKKEh
	62cNnJweMxDidd+hao4ZDIXEni9UnkOECUswzvaa5yljp1T5by5wFsxbiS66NshmQo3nOBYaZ+Y7W
	dPege4d1f4gFTerwfc5A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqhI-00000005vqs-3RTg;
	Tue, 27 Oct 2026 23:35:16 +0000
Received: from sender4-pp-f112.zoho.com ([136.143.188.112])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLqhG-00000005vpC-0fH5;
	Tue, 27 Oct 2026 23:35:15 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1793144107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=EvO97z57eYuXH0RkEFdhc+uzgdr1xvf7kg/RmNhQ1Y6zMXnZs2NyrR8QS33nAK1t8s6gQzkGa5KKlcRJueV4qiMlQO48Z/WrwGigR56Wvuna+cB2zaZynp37Ur40F7RZ6BufpTwlG3u3z0yHgs1N6ImDrRZhzvNSitunpxppr0A=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1793144107; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+HFd/mNMRs2yLr3SzOxqHhvlBdObgdqBXts9q3SbxiI=; 
	b=d7i7s3l9yB+GOGUurjAFq7yW0wA971cxvgip2eiktYbTbvH/WOW/C6e63EygA2L76JDVdf4R1HLG2m5a6hO/67bMXTjs3BKSHTyNCIkqy8+Nx9+b2ShHnD+7f2sRoVynMH2vFJLEI+MqBKm2S/duzhRQtKeLj6LdkxUoZzO/qGQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=michael.riesch@collabora.com;
	dmarc=pass header.from=<michael.riesch@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1793144107;
	s=zohomail; d=collabora.com; i=michael.riesch@collabora.com;
	h=Message-ID:Date:Date:MIME-Version:Subject:Subject:To:To:Cc:Cc:From:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:Message-Id:Reply-To;
	bh=+HFd/mNMRs2yLr3SzOxqHhvlBdObgdqBXts9q3SbxiI=;
	b=Vi5fPrV1UUmmgHLpYq5IH8boQXOJKHKLUIdl8WK+QeqoXlisP23w70HujpTiFOOu
	IwEWkbrRbiqFIcjE82QnnYGel9ne+KWs6vHHQrttP8b0j5dvg2IqhibtyZMaeHz6r02
	r2OxEB12PCOv9WdIQDJCUdUHKeD1K3wd5Mmp57Rs=
Received: by smtp.zohomail.com with SMTPS id 1793144105018585.3625742634121;
	Tue, 27 Oct 2026 16:35:05 -0700 (PDT)
Message-ID: <fd9aa80b-79d7-4acb-8398-3c22f74c7aea@collabora.com>
Date: Wed, 28 Oct 2026 00:35:00 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 5/8] phy: rockchip-samsung-dcphy: Add a second PHY for
 the receiver
To: Jason Yang <jason98166@gmail.com>, Vinod Koul <vkoul@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Manivannan Sadhasivam <mani@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Guochun Huang <hero.huang@rock-chips.com>,
 Philipp Zabel <p.zabel@pengutronix.de>
Cc: Sebastian Reichel <sebastian.reichel@collabora.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 linux-phy@lists.infradead.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <20261016-dcphy-rx-v1-v5-0-e63b49eabe2d@gmail.com>
 <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
Content-Language: en-US
From: Michael Riesch <michael.riesch@collabora.com>
In-Reply-To: <20261016-dcphy-rx-v1-v5-5-e63b49eabe2d@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261027_163514_261413_99BB5326 
X-CRM114-Status: GOOD (  27.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi Jason,

On 10/16/26 10:56, Jason Yang wrote:
> Give the receiver a struct phy of its own, with its own phy_ops and its
> own samsung_mipi_phy for the state the two do not share.
> 
> of_xlate() takes the direction from the second cell and falls back to
> the transmitter for a single-cell provider, so existing device trees
> keep working. It now rejects an unknown value in either cell, and a mix
> of D-PHY and C-PHY consumers, which the TRM does not support [1].
> 
> The receiver's callbacks return -EOPNOTSUPP until its bring-up is added
> in the next change.

Can you merge this patch with the subsequent one? IMHO it does not help
to first introduce some skeleton with -EOPNOTSUPP only to add support
for it in the very next patch...

Thanks and best regards,
Michael

> 
> [1] RK3588 TRM: section 22.1 (overview)
> 
> Assisted-by: LLM
> Signed-off-by: Jason Yang <jason98166@gmail.com>
> ---
>  drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c | 69 +++++++++++++++++++++--
>  1 file changed, 63 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> index e4293c8d2b29..316d4c4d49c1 100644
> --- a/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-dcphy.c
> @@ -296,6 +296,8 @@ struct samsung_mipi_dcphy {
>  	struct reset_control *apb_rst;
>  	struct reset_control *grf_apb_rst;
>  	struct samsung_mipi_phy tx;
> +	struct samsung_mipi_phy rx;
> +	/* PHY mode, PHY_TYPE_DPHY or PHY_TYPE_CPHY. */
>  	u8 type;
>  
>  	const struct samsung_mipi_dcphy_plat_data *pdata;
> @@ -1511,6 +1513,22 @@ static int samsung_mipi_dcphy_exit(struct phy *phy)
>  	return 0;
>  }
>  
> +static int samsung_mipi_dcphy_rx_configure(struct phy *phy,
> +					   union phy_configure_opts *opts)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int samsung_mipi_dcphy_rx_power_on(struct phy *phy)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
> +static int samsung_mipi_dcphy_rx_power_off(struct phy *phy)
> +{
> +	return -EOPNOTSUPP;
> +}
> +
>  static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.configure = samsung_mipi_dcphy_tx_configure,
>  	.power_on  = samsung_mipi_dcphy_tx_power_on,
> @@ -1520,6 +1538,15 @@ static const struct phy_ops samsung_mipi_dcphy_tx_ops = {
>  	.owner	   = THIS_MODULE,
>  };
>  
> +static const struct phy_ops samsung_mipi_dcphy_rx_ops = {
> +	.configure = samsung_mipi_dcphy_rx_configure,
> +	.power_on  = samsung_mipi_dcphy_rx_power_on,
> +	.power_off = samsung_mipi_dcphy_rx_power_off,
> +	.init = samsung_mipi_dcphy_init,
> +	.exit = samsung_mipi_dcphy_exit,
> +	.owner	   = THIS_MODULE,
> +};
> +
>  static const struct regmap_config samsung_mipi_dcphy_regmap_config = {
>  	.name = "dcphy",
>  	.reg_bits = 32,
> @@ -1532,19 +1559,42 @@ static struct phy *samsung_mipi_dcphy_xlate(struct device *dev,
>  					    const struct of_phandle_args *args)
>  {
>  	struct samsung_mipi_dcphy *samsung = dev_get_drvdata(dev);
> +	/* Device trees without the second cell describe the transmitter. */
> +	u32 direction = PHY_DIRECTION_TX;
> +	u32 type;
>  
> -	if (args->args_count != 1) {
> +	if (args->args_count < 1 || args->args_count > 2) {
>  		dev_err(dev, "invalid number of arguments\n");
>  		return ERR_PTR(-EINVAL);
>  	}
>  
> -	if (samsung->type != PHY_NONE && samsung->type != args->args[0])
> -		dev_warn(dev, "phy type select %d overwriting type %d\n",
> -			 args->args[0], samsung->type);
> +	type = args->args[0];
> +	if (type != PHY_TYPE_DPHY && type != PHY_TYPE_CPHY) {
> +		dev_err(dev, "invalid phy type %u\n", type);
> +		return ERR_PTR(-EINVAL);
> +	}
>  
> -	samsung->type = args->args[0];
> +	if (args->args_count == 2)
> +		direction = args->args[1];
>  
> -	return samsung->tx.phy;
> +	if (direction != PHY_DIRECTION_TX && direction != PHY_DIRECTION_RX) {
> +		dev_err(dev, "invalid direction %u\n", direction);
> +		return ERR_PTR(-EINVAL);
> +	}
> +
> +	/*
> +	 * The TRM (section 22.1) does not support the transmitter and the
> +	 * receiver running in different modes, so the mode belongs to the
> +	 * block.
> +	 */
> +	if (samsung->type != PHY_NONE && samsung->type != type) {
> +		dev_err(dev, "phy type %u conflicts with type %u already selected\n",
> +			type, samsung->type);
> +		return ERR_PTR(-EINVAL);
> +	}
> +	samsung->type = type;
> +
> +	return direction == PHY_DIRECTION_RX ? samsung->rx.phy : samsung->tx.phy;
>  }
>  
>  static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
> @@ -1620,6 +1670,13 @@ static int samsung_mipi_dcphy_probe(struct platform_device *pdev)
>  
>  	phy_set_drvdata(samsung->tx.phy, samsung);
>  
> +	samsung->rx.phy = devm_phy_create(dev, NULL, &samsung_mipi_dcphy_rx_ops);
> +	if (IS_ERR(samsung->rx.phy))
> +		return dev_err_probe(dev, PTR_ERR(samsung->rx.phy),
> +				     "Failed to create MIPI DC-PHY receiver\n");
> +
> +	phy_set_drvdata(samsung->rx.phy, samsung);
> +
>  	phy_provider = devm_of_phy_provider_register(dev, samsung_mipi_dcphy_xlate);
>  	if (IS_ERR(phy_provider))
>  		return dev_err_probe(dev, PTR_ERR(phy_provider),
> 


