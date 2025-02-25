Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6B5C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Feb 2025 22:18:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9A0JlJ4dz6HSjR6M0xdjKOHwvXf88YPRD+thZxM7BQ=; b=W7xBaq940fC9znO1SO4L+y8GvQ
	Wa+L7OThb0M1phOKvj+foYeU9/4/vLPxmNl8F4stGKbdeB4Cu4YfD3AlCtvrob17h4Qo0rWBNPMul
	h1Rx1Rz4dPZ3DuIAXJM6J49nvH+QMOR1L/32OikG2p+ERRt/6QbJa9gMzNt+0JrvJr362iBYxqksp
	cQv+pFXjRxQHq1EE6JeMSZvriatnpxEpUktmkT2DSm8uEpbIYiYwymv9ByjL0Y3dnc7fNrAY+ztEK
	CIUosdGz9BQ0h/85Cx3VZhm/z9YlXo27yPjHclHrvr3rex+hlEiD0MeRTANXJ0AdDy31WjssmlvrE
	HU1tXI7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3Fc-00000001er3-0omu;
	Tue, 25 Feb 2025 22:18:04 +0000
Received: from smtp-81.smtpout.orange.fr ([80.12.242.81] helo=smtp.smtpout.orange.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tn3E5-00000001ejX-3aFw;
	Tue, 25 Feb 2025 22:16:31 +0000
Received: from [192.168.1.37] ([90.11.132.44])
	by smtp.orange.fr with ESMTPA
	id n3DytzpBQbR3dn3E1tCdOf; Tue, 25 Feb 2025 23:16:26 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wanadoo.fr;
	s=t20230301; t=1740521786;
	bh=d9A0JlJ4dz6HSjR6M0xdjKOHwvXf88YPRD+thZxM7BQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:From;
	b=qJwTKFMt9rHvzotJVhTQaLoATYLyaH4afQchZJZ2G6INFBu7WIu6ctwB/qZAQJdzJ
	 nNq2HZfbTX8gRF9cWzr2rQWPHKh81W7Cuq0IGp7NDz2+In+8vzUsysBkYBWqnf1G7i
	 lj/HZXkTSSL4ttQsLHmjf0weaoQrD60zfO9hCxRYe8aFZ2kj/G3bFtMB4uAN2cQ5f0
	 Iu4w7vdeRYAQ9Eb35bv/oJyS2suxR5jhVjskWYUxQawqVUHbDQkYnXVkNRFU3pUDX5
	 lheOj9JKUaT5GfbVa/9AUJfRnELdVTUjkKf5w5L5/q9o8dllm3pe4dk0DCgCwLyymB
	 G4SG4vtKJDBfQ==
X-ME-Helo: [192.168.1.37]
X-ME-Auth: bWFyaW9uLmphaWxsZXRAd2FuYWRvby5mcg==
X-ME-Date: Tue, 25 Feb 2025 23:16:26 +0100
X-ME-IP: 90.11.132.44
Message-ID: <7a8e6b9f-2fa2-4794-bb4f-3abdb784fbc3@wanadoo.fr>
Date: Tue, 25 Feb 2025 23:16:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: rockchip: usbdp: move type-orientation-switch
 further down
To: Heiko Stuebner <heiko@sntech.de>, vkoul@kernel.org, kishon@kernel.org
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, sebastian.reichel@collabora.com,
 Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20250225184519.3586926-1-heiko@sntech.de>
 <20250225184519.3586926-2-heiko@sntech.de>
Content-Language: en-US, fr-FR
From: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
In-Reply-To: <20250225184519.3586926-2-heiko@sntech.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250225_141630_301535_8FB94CED 
X-CRM114-Status: GOOD (  19.60  )
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

Le 25/02/2025 à 19:45, Heiko Stuebner a écrit :
> From: Heiko Stuebner <heiko.stuebner@cherry.de>
> 
> Move the typec-orientation-switch functionality further down, next to
> the typec-mux code. Not only brings this the typec-related functionality
> closer together, but also the following change needs access to other
> driver functions, that are below the current position.
> 
> No functional change.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
> ---
>   drivers/phy/rockchip/phy-rockchip-usbdp.c | 166 +++++++++++-----------
>   1 file changed, 83 insertions(+), 83 deletions(-)
> 
> diff --git a/drivers/phy/rockchip/phy-rockchip-usbdp.c b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> index 5b1e8a3806ed..7b17c82ebcfc 100644
> --- a/drivers/phy/rockchip/phy-rockchip-usbdp.c
> +++ b/drivers/phy/rockchip/phy-rockchip-usbdp.c
> @@ -616,89 +616,6 @@ static void rk_udphy_dp_hpd_event_trigger(struct rk_udphy *udphy, bool hpd)
>   	rk_udphy_grfreg_write(udphy->vogrf, &cfg->vogrfcfg[udphy->id].hpd_trigger, hpd);
>   }
>   
> -static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
> -{
> -	if (udphy->flip) {
> -		udphy->dp_lane_sel[0] = 0;
> -		udphy->dp_lane_sel[1] = 1;
> -		udphy->dp_lane_sel[2] = 3;
> -		udphy->dp_lane_sel[3] = 2;
> -		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
> -		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
> -		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
> -		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
> -		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
> -		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
> -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
> -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> -	} else {
> -		udphy->dp_lane_sel[0] = 2;
> -		udphy->dp_lane_sel[1] = 3;
> -		udphy->dp_lane_sel[2] = 1;
> -		udphy->dp_lane_sel[3] = 0;
> -		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
> -		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
> -		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
> -		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
> -		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
> -		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
> -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
> -	}
> -
> -	udphy->mode = UDPHY_MODE_DP_USB;
> -}
> -
> -static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> -				 enum typec_orientation orien)
> -{
> -	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> -
> -	mutex_lock(&udphy->mutex);
> -
> -	if (orien == TYPEC_ORIENTATION_NONE) {
> -		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> -		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> -		/* unattached */
> -		rk_udphy_usb_bvalid_enable(udphy, false);
> -		goto unlock_ret;
> -	}
> -
> -	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> -	rk_udphy_set_typec_default_mapping(udphy);
> -	rk_udphy_usb_bvalid_enable(udphy, true);
> -
> -unlock_ret:
> -	mutex_unlock(&udphy->mutex);
> -	return 0;
> -}
> -
> -static void rk_udphy_orien_switch_unregister(void *data)
> -{
> -	struct rk_udphy *udphy = data;
> -
> -	typec_switch_unregister(udphy->sw);
> -}
> -
> -static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
> -{
> -	struct typec_switch_desc sw_desc = { };
> -
> -	sw_desc.drvdata = udphy;
> -	sw_desc.fwnode = dev_fwnode(udphy->dev);
> -	sw_desc.set = rk_udphy_orien_sw_set;
> -
> -	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
> -	if (IS_ERR(udphy->sw)) {
> -		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
> -			PTR_ERR(udphy->sw));
> -		return PTR_ERR(udphy->sw);
> -	}
> -
> -	return devm_add_action_or_reset(udphy->dev,
> -					rk_udphy_orien_switch_unregister, udphy);
> -}
> -
>   static int rk_udphy_refclk_set(struct rk_udphy *udphy)
>   {
>   	unsigned long rate;
> @@ -1323,6 +1240,89 @@ static const struct phy_ops rk_udphy_usb3_phy_ops = {
>   	.owner		= THIS_MODULE,
>   };
>   
> +static void rk_udphy_set_typec_default_mapping(struct rk_udphy *udphy)
> +{
> +	if (udphy->flip) {
> +		udphy->dp_lane_sel[0] = 0;
> +		udphy->dp_lane_sel[1] = 1;
> +		udphy->dp_lane_sel[2] = 3;
> +		udphy->dp_lane_sel[3] = 2;
> +		udphy->lane_mux_sel[0] = PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[1] = PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[2] = PHY_LANE_MUX_USB;
> +		udphy->lane_mux_sel[3] = PHY_LANE_MUX_USB;
> +		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_INVERT;
> +		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_INVERT;
> +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 1);
> +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> +	} else {
> +		udphy->dp_lane_sel[0] = 2;
> +		udphy->dp_lane_sel[1] = 3;
> +		udphy->dp_lane_sel[2] = 1;
> +		udphy->dp_lane_sel[3] = 0;
> +		udphy->lane_mux_sel[0] = PHY_LANE_MUX_USB;
> +		udphy->lane_mux_sel[1] = PHY_LANE_MUX_USB;
> +		udphy->lane_mux_sel[2] = PHY_LANE_MUX_DP;
> +		udphy->lane_mux_sel[3] = PHY_LANE_MUX_DP;
> +		udphy->dp_aux_dout_sel = PHY_AUX_DP_DATA_POL_NORMAL;
> +		udphy->dp_aux_din_sel = PHY_AUX_DP_DATA_POL_NORMAL;
> +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 1);
> +	}
> +
> +	udphy->mode = UDPHY_MODE_DP_USB;
> +}
> +
> +static int rk_udphy_orien_sw_set(struct typec_switch_dev *sw,
> +				 enum typec_orientation orien)
> +{
> +	struct rk_udphy *udphy = typec_switch_get_drvdata(sw);
> +
> +	mutex_lock(&udphy->mutex);
> +
> +	if (orien == TYPEC_ORIENTATION_NONE) {
> +		gpiod_set_value_cansleep(udphy->sbu1_dc_gpio, 0);
> +		gpiod_set_value_cansleep(udphy->sbu2_dc_gpio, 0);
> +		/* unattached */
> +		rk_udphy_usb_bvalid_enable(udphy, false);
> +		goto unlock_ret;
> +	}
> +
> +	udphy->flip = (orien == TYPEC_ORIENTATION_REVERSE) ? true : false;
> +	rk_udphy_set_typec_default_mapping(udphy);
> +	rk_udphy_usb_bvalid_enable(udphy, true);
> +
> +unlock_ret:
> +	mutex_unlock(&udphy->mutex);
> +	return ret;

This will break built.

It was return 0 preivously.
This change should be aprt of 2/2 where "int ret;" is introduced.

CJ


> +}
> +
> +static void rk_udphy_orien_switch_unregister(void *data)
> +{
> +	struct rk_udphy *udphy = data;
> +
> +	typec_switch_unregister(udphy->sw);
> +}
> +
> +static int rk_udphy_setup_orien_switch(struct rk_udphy *udphy)
> +{
> +	struct typec_switch_desc sw_desc = { };
> +
> +	sw_desc.drvdata = udphy;
> +	sw_desc.fwnode = dev_fwnode(udphy->dev);
> +	sw_desc.set = rk_udphy_orien_sw_set;
> +
> +	udphy->sw = typec_switch_register(udphy->dev, &sw_desc);
> +	if (IS_ERR(udphy->sw)) {
> +		dev_err(udphy->dev, "Error register typec orientation switch: %ld\n",
> +			PTR_ERR(udphy->sw));
> +		return PTR_ERR(udphy->sw);
> +	}
> +
> +	return devm_add_action_or_reset(udphy->dev,
> +					rk_udphy_orien_switch_unregister, udphy);
> +}
> +
>   static int rk_udphy_typec_mux_set(struct typec_mux_dev *mux,
>   				  struct typec_mux_state *state)
>   {


