Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B597DC44520
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jul 2026 19:25:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V6i2sivG6wR6n6p8jLv8e4sghEhVol9ByF9gXpr7sE0=; b=EPo03Lx0ZpnNf6YFakE/Ff/S7z
	2/nnMRviulxRqDPOPiwl4sCyC5eFruraMkguqt5clXTCq5nh89AW6roRXF4FNFoz3A4kqgAwYbu4x
	L9EGR8IuNHfYFumIO/kJggAJD3k7b6g3es+glSMuAPd1v0T8fuBhVPC9obRVmQcNPsVasSVKkW0tg
	W5tjPnQWVVC+Osi6iyo9HZMYXNMnBNgO30yrBnwBXkKFy8jgkVA/JoxTyQuyc2fbZlbgGjJm4/3s5
	sZ2piQq0e4L6TwYXSq6PAaO185X72KI2jMnVG4k//U/cQWL+S3Srt/WnORJxecV4SYimOgDqqMZrH
	JxhiAV7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltbq-00000007kXr-2vb6;
	Mon, 20 Jul 2026 19:25:02 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wltbn-00000007kWj-1oIS;
	Mon, 20 Jul 2026 19:25:01 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784575497;
	bh=jmv02YI047x2xL6OXfQ0v6pTfoWDZauPaF6Dqs8le1M=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=K6MY+65pr1hcVX1aj8V2TeKS8e9QQ5ekOsZRaE+/XU564qamyoZs0cuAPK0yCcMci
	 P8qG2mOvZl1nehFQOZ5E5nhB74aMOcE1NNrm8PArL/gUmI1j0LdH1OQEVgJoUF53uJ
	 HP5uwKt1lRVIODh/2r3rEhsSZYgtUwDQDp/iOfWNXHsdC2O5ainOdJx6kAwjrLOhMF
	 Gewf2Fb39K7g3LLKtx07sQooh2ECtnfQw6DtxJrNp44IC/gnjZaKjGh1L5mKsMIpwC
	 NAoJq47rU4Vkz+i9zCn9abVd7sLPZRG4tS7x99fDXF29AF43+KS+MDXIN9x/Aic5GC
	 j6I0Junvafq9Q==
Received: from [100.64.0.241] (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C4A6017E09A3;
	Mon, 20 Jul 2026 21:24:56 +0200 (CEST)
Message-ID: <b2dfe89d-303e-485c-9d99-439a42f07811@collabora.com>
Date: Mon, 20 Jul 2026 22:24:56 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 5/8] phy: rockchip: samsung-hdptx: Drop TMDS rate setup
 workaround
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Neil Armstrong
 <neil.armstrong@linaro.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>,
 kernel@collabora.com, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Thomas_Niederpr=C3=BCm?=
 <dubito@online.de>, Simon Wright <simon@symple.nz>
References: <20260612-hdptx-clk-fixes-v4-0-ce5e1d456cda@collabora.com>
 <20260612-hdptx-clk-fixes-v4-5-ce5e1d456cda@collabora.com>
 <al4ujA5d6B5s23C4@umbar.lan>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <al4ujA5d6B5s23C4@umbar.lan>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_122459_636072_F290A741 
X-CRM114-Status: GOOD (  16.46  )
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

On 7/20/26 5:19 PM, Dmitry Baryshkov wrote:
> On Fri, Jun 12, 2026 at 02:45:24AM +0300, Cristian Ciocaltea wrote:
>> Since commit ba9c2fe18c17 ("drm/rockchip: dw_hdmi_qp: Switch to
>> phy_configure()") the TMDS rate setup doesn't rely anymore on the
>> unconventional usage of the bus width, instead it is managed exclusively
>> through the HDMI PHY configuration API.
>>
>> Drop the now obsolete workaround to retrieve the TMDS character rate via
>> phy_get_bus_width() during power_on().
>>
>> While at it, get rid of the extra call to rk_hdptx_phy_consumer_put() by
>> moving the statement at the end of the function.
>>
>> Tested-by: Thomas Niederprüm <dubito@online.de>
>> Tested-by: Simon Wright <simon@symple.nz>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 27 +++++------------------
>>  1 file changed, 6 insertions(+), 21 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 25bd821cd039..35997087d61c 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -1660,22 +1660,6 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>>  	enum phy_mode mode = phy_get_mode(phy);
>>  	int ret, lane;
>>  
>> -	if (mode != PHY_MODE_DP) {
>> -		if (!hdptx->hdmi_cfg.rate && hdptx->hdmi_cfg.mode != PHY_HDMI_MODE_FRL) {
>> -			/*
>> -			 * FIXME: Temporary workaround to setup TMDS char rate
>> -			 * from the RK DW HDMI QP bridge driver.
>> -			 * Will be removed as soon the switch to the HDMI PHY
>> -			 * configuration API has been completed on both ends.
>> -			 */
>> -			hdptx->hdmi_cfg.rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
>> -			hdptx->hdmi_cfg.rate *= 100;
>> -		}
>> -
>> -		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
>> -			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
>> -	}
>> -
>>  	ret = rk_hdptx_phy_consumer_get(hdptx);
>>  	if (ret)
>>  		return ret;
>> @@ -1701,9 +1685,10 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>>  		rk_hdptx_dp_pll_init(hdptx);
>>  
>>  		ret = rk_hdptx_dp_aux_init(hdptx);
>> -		if (ret)
>> -			rk_hdptx_phy_consumer_put(hdptx, true);
>>  	} else {
>> +		dev_dbg(hdptx->dev, "%s rate=%llu bpc=%u\n", __func__,
>> +			hdptx->hdmi_cfg.rate, hdptx->hdmi_cfg.bpc);
>> +
>>  		if (hdptx->pll_config_dirty)
>>  			ret = rk_hdptx_pll_cmn_config(hdptx);
>>  
>> @@ -1716,11 +1701,11 @@ static int rk_hdptx_phy_power_on(struct phy *phy)
>>  			else
>>  				ret = rk_hdptx_tmds_ropll_mode_config(hdptx);
>>  		}
>> -
>> -		if (ret)
>> -			rk_hdptx_phy_consumer_put(hdptx, true);
>>  	}
>>  
>> +	if (ret)
>> +		rk_hdptx_phy_consumer_put(hdptx, true);
> 
> This looks likes an unrelated change. Could you please split it to a
> separate commit?

Ack.

Thanks,
Cristian

