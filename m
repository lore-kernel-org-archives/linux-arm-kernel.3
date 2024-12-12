Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6E8DE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 12:35:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:To:Cc:From:References:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UoVTbaL4YNuWYLH975v+DNNPn9DDGWZVxGYR9Qdxa6s=; b=OnoCK1FkkqF/7ie8ttD8hPT3AZ
	zi6JYySeCvxn2ATboRzABZgsbxqp4EKtX7SqH8wuwOZ15RNZhVjwEy6eBtk2wZmQXiOoKhx94IMp9
	wwzEm8c0F8ab5Mi3VTRhKCzJ7XjZTG/g1blptZ2WfOywyHBjL4NfQHEqcPQ1/QvF3XxD2jLV7Iymy
	EeA6wZv6wgcgrgH6DyIKBIzqdANa8Ycu7lyOb4hJp8b1P4/lqYks62Ssh+87+Ft/iK7zB3+SbTfRx
	HT5VkbQWGjcmrlf/6mtxqlu9JimuzY85J7aXUPqnlOJfNx5P3wWIsOptjS9Ip4JyTPcE/bTr+vAAd
	exsnQnYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiP9-00000000NtN-1uBJ;
	Thu, 12 Dec 2024 12:34:55 +0000
Received: from smtp-21.smtpout.orange.fr ([80.12.242.21] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLiO2-00000000NeI-2jyF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 12:33:49 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id LiNptubjiI1FGLiNptgWq8; Thu, 12 Dec 2024 13:33:39 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1734006819;
	bh=UoVTbaL4YNuWYLH975v+DNNPn9DDGWZVxGYR9Qdxa6s=;
	h=Message-ID:Date:MIME-Version:Subject:From:To;
	b=DwS46AdYDXC+9ZAsRLRjPUp1SCcuBxmFNKhonH5F5UWdvmPdW7vVhza+qcdT3QN4s
	 Cs+Z5Al/+1IMjvmnJc+gr4Mb5fbRWLE7QLeYlZTsJDZxy5IQoIYnowlN0BgYhvEG1T
	 3MO2M8I2/YbJAnnfN2J1udFQ/FTpo1z1iETzWtSyCOjnUp9RcQAoNO3UIgGdv6UsSz
	 UetoPuHOaS9OWFM05EPhZuzdie0Rkj8GsK3d3qHr8IILz4UHsiZXYlW1z9Fu/CsogA
	 BPlNhaljpKHp/QxwseVtkuFpdRUeUWFmaADh8ubMr9u62LkDeZrBwajpEmlxvoG0Tp
	 9tml5snDXE3Xg==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Thu, 12 Dec 2024 13:33:39 +0100
X-ME-IP: 90.11.132.44
Message-ID: <45f90007-3136-4b59-a3fc-6fc0147b8ad8@wanadoo.fr>
Date: Thu, 12 Dec 2024 13:33:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 2/3] drm/bridge: ti-sn65dsi83: Add ti,lvds-vod-swing
 optional properties
References: <20241212121712.214639-1-andrej.picej@norik.com>
 <20241212121712.214639-3-andrej.picej@norik.com>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc: dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, upstream@lists.phytec.de,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
 festevam@gmail.com, marex@denx.de
To: Andrej Picej <andrej.picej@norik.com>
In-Reply-To: <20241212121712.214639-3-andrej.picej@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_043346_819925_4E56DC2E 
X-CRM114-Status: GOOD (  21.64  )
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

Le 12/12/2024 à 13:17, Andrej Picej a écrit :
> Add a optional properties to change LVDS output voltage. This should not
> be static as this depends mainly on the connected display voltage
> requirement. We have three properties:
> - "ti,lvds-termination-ohms", which sets near end termination,
> - "ti,lvds-vod-swing-data-microvolt" and
> - "ti,lvds-vod-swing-clock-microvolt" which both set LVDS differential
> output voltage for data and clock lanes. They are defined as an array
> with min and max values. The appropriate bitfield will be set if
> selected constraints can be met.
> 
> If "ti,lvds-termination-ohms" is not defined the default of 200 Ohm near
> end termination will be used. Selecting only one:
> "ti,lvds-vod-swing-data-microvolt" or
> "ti,lvds-vod-swing-clock-microvolt" can be done, but the output voltage
> constraint for only data/clock lanes will be met. Setting both is
> recommended.

...

> +static int sn65dsi83_select_lvds_vod_swing(struct device *dev,
> +	u32 lvds_vod_swing_data[2], u32 lvds_vod_swing_clk[2], u8 lvds_term)
> +{
> +	int i;
> +
> +	for (i = 0; i <= 3; i++) {
> +		if (lvds_vod_swing_data_table[lvds_term][i][0] >= lvds_vod_swing_data[0] &&
> +		lvds_vod_swing_data_table[lvds_term][i][1] <= lvds_vod_swing_data[1] &&
> +		lvds_vod_swing_clock_table[lvds_term][i][0] >= lvds_vod_swing_clk[0] &&
> +		lvds_vod_swing_clock_table[lvds_term][i][1] <= lvds_vod_swing_clk[1])

Adding a few spaces to align things would help reading.

> +			return i;
> +	}
> +
> +	dev_err(dev, "failed to find appropriate LVDS_VOD_SWING configuration\n");
> +	return -EINVAL;
> +}
> +
> +static int sn65dsi83_parse_lvds_endpoint(struct sn65dsi83 *ctx, int channel)
> +{
> +	struct device *dev = ctx->dev;
> +	struct device_node *endpoint;
> +	int endpoint_reg;
> +	/* Set so the property can be freely selected if not defined */
> +	u32 lvds_vod_swing_data[2] = { 0, 1000000 };
> +	u32 lvds_vod_swing_clk[2] = { 0, 1000000 };
> +	/* Set default near end terminataion to 200 Ohm */
> +	u32 lvds_term = 200;
> +	int lvds_vod_swing_conf;
> +	int ret = 0;
> +	int ret_data;
> +	int ret_clock;
> +
> +	if (channel == CHANNEL_A)
> +		endpoint_reg = 2;
> +	else
> +		endpoint_reg = 3;
> +
> +	endpoint = of_graph_get_endpoint_by_regs(dev->of_node, endpoint_reg, -1);
> +
> +	of_property_read_u32(endpoint, "ti,lvds-termination-ohms", &lvds_term);
> +	if (lvds_term == 100)
> +		ctx->lvds_term_conf[channel] = OHM_100;
> +	else if (lvds_term == 200)
> +		ctx->lvds_term_conf[channel] = OHM_200;
> +	else
> +		return -EINVAL;

Should it be:
	else {
		ret = -EINVAL;
		goto exit;
	}
?

> +
> +	ret_data = of_property_read_u32_array(endpoint, "ti,lvds-vod-swing-data-microvolt",
> +					lvds_vod_swing_data, ARRAY_SIZE(lvds_vod_swing_data));
> +	if (ret_data != 0 && ret_data != -EINVAL) {
> +		ret = ret_data;
> +		goto exit;
> +	}
> +
> +	ret_clock = of_property_read_u32_array(endpoint, "ti,lvds-vod-swing-clock-microvolt",
> +					lvds_vod_swing_clk, ARRAY_SIZE(lvds_vod_swing_clk));
> +	if (ret_clock != 0 && ret_clock != -EINVAL) {
> +		ret = ret_clock;
> +		goto exit;
> +	}
> +
> +	/* Use default value if both properties are NOT defined. */
> +	if (ret_data == -EINVAL && ret_clock == -EINVAL)
> +		lvds_vod_swing_conf = 0x1;
> +
> +	/* Use lookup table if any of the two properties is defined. */
> +	if (!ret_data || !ret_clock) {
> +		lvds_vod_swing_conf = sn65dsi83_select_lvds_vod_swing(dev, lvds_vod_swing_data,
> +						lvds_vod_swing_clk, ctx->lvds_term_conf[channel]);
> +		if (lvds_vod_swing_conf < 0) {
> +			ret = lvds_vod_swing_conf;
> +			goto exit;
> +		}
> +	}
> +
> +	ctx->lvds_vod_swing_conf[channel] = lvds_vod_swing_conf;
> +	ret = 0;
> +exit:
> +	of_node_put(endpoint);
> +	return ret;
> +}

...

CJ

