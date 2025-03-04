Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C83C282D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:18:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dpotfYrrK+eIqs1ERXh1FDjfE6eFJzG+fJdpJe1ojso=; b=juue0wcIUu3Oom06TrcOWKKDrW
	NJwExajKterG3Jv7B2E3Ju4LUMHRMFMD4TBP+x6gUli0GNWJMDdtwwdw0GfRgNoek2/+iNDbARyHT
	ahBPO5MWIoznyWyu8wFGNCDif7fh1FOHfW/Jr8Q5PlBEdi4AYKc7figfiyMVwZgafeOMcY/rEgaTV
	hm6ASFgEhg8r4ZD9Rrj1KC1kRcAHrTSI87Ik3wHcKHkmkWmAIrngDb70BhQ/wsM+5qKMK+8bfTmZ9
	U1SbjNmCL6mlOsPviwmYIV9YSj/01wlMg4Hdd7HQ9q6rh2/Hq4+sHZa7Nov21s7d4rlP15E5Wy7BI
	7OjxhsCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpREI-00000004boH-1Dl8;
	Tue, 04 Mar 2025 12:18:34 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR8O-00000004aqa-3dWt;
	Tue, 04 Mar 2025 12:12:28 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dpotfYrrK+eIqs1ERXh1FDjfE6eFJzG+fJdpJe1ojso=; b=qi4qiK0w54heH7I/z191arBGxT
	DyjAwn5xfkNZoH2Tpimz0ThMI77F1hMh20pcOwFbkhkCQAOaHz6qBwiAnlQwAsevjy4Zm0K1sanAZ
	5WuifNef5J1+5SZizwYqYYx7XVZDSthT+BwUT9l9EOxk5ZQi0VacdF9CROMcvTLBYDJLupEhTpszy
	6uKsiM3JbJ1t4Q1DuBHMfHLzi23HTDrpdoDkW3igaXI4VLyeXazZkbD+C8w865WnNoTMbSrF0zvts
	gVo5Go35sOW4Hx+eN7aiQVljg1OCeOAJYOEtzACc/bCaH7+t2nEXPTF/J14PFo9CptvOMlfzWzCj3
	BHK0B8Jw==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR8L-000000001bC-1YPw;
	Tue, 04 Mar 2025 12:12:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741090339;
	bh=2EWvYx/k/x8mpI0CYKajuJPigLOs0dmymMDl3QAd2hI=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=W+6OkqBwc1A2NIjP3nnNr7SLiC2ThlRzqbIbKrsXKeVfwlMZkAVMHWVarX/ftESaD
	 azit1IA/HORWSZH+Go4Otd0cdd2BMMaD8OqDHUjep7Hm4HwqaNUTscOPG81+0wqwAr
	 ZK5LqjpUDxo7mfQQhJXbVQURC5TtNjv9kLQDkLSAcdYS51LXhmmniVV0r9z0yjN8RL
	 ICGBkOJuBBvjtijxGyre0v16L0um9ChpIIOOhJXFPIElpeRC58f5NUXZhEJXg7sjm4
	 /aDMPAC5SQl8N7TC6NuW9f3WTH0ZyBwYpNd/sMQbeOpLO648CItB42rFi1QGHSwQip
	 YrWkTlxCGJTOQ==
Received: from [192.168.1.90] (unknown [188.27.58.83])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7B9DC17E088C;
	Tue,  4 Mar 2025 13:12:19 +0100 (CET)
Message-ID: <ddf4c3c9-849c-4d96-a073-966bb19a6047@collabora.com>
Date: Tue, 4 Mar 2025 14:12:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 07/12] phy: rockchip: samsung-hdptx: Setup TMDS char
 rate via phy_configure_opts_hdmi
To: Maxime Ripard <mripard@kernel.org>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I
 <kishon@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 Algea Cao <algea.cao@rock-chips.com>, Sandor Yu <Sandor.yu@nxp.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, kernel@collabora.com,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org
References: <20250304-phy-sam-hdptx-bpc-v4-0-8657847c13f7@collabora.com>
 <20250304-phy-sam-hdptx-bpc-v4-7-8657847c13f7@collabora.com>
 <20250304-turtle-of-serious-aurora-2b0bae@houat>
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Content-Language: en-US
In-Reply-To: <20250304-turtle-of-serious-aurora-2b0bae@houat>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_121225_726277_CDA9F8C1 
X-CRM114-Status: GOOD (  21.41  )
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

On 3/4/25 10:15 AM, Maxime Ripard wrote:
> On Tue, Mar 04, 2025 at 03:44:06AM +0200, Cristian Ciocaltea wrote:
>> The current workaround to setup the TMDS character rate relies on the
>> unconventional usage of phy_set_bus_width().
>>
>> Make use of the recently introduced HDMI PHY configuration API to
>> properly handle the setup.  The workaround will be dropped as soon as
>> the switch has been completed on both ends.
>>
>> Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 54 ++++++++++++++++-------
>>  1 file changed, 38 insertions(+), 16 deletions(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> index 2bf525514c1991a1299265d12e1e85f66333c604..7e1d1c10758249aa5bbddbdaae0108bba04f30df 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>> @@ -394,6 +394,7 @@ struct rk_hdptx_phy {
>>  
>>  	int phy_id;
>>  	struct phy *phy;
>> +	struct phy_configure_opts_hdmi hdmi_cfg;
>>  	struct clk_bulk_data *clks;
>>  	int nr_clks;
>>  	struct reset_control_bulk_data rsts[RST_MAX];
>> @@ -1409,19 +1410,25 @@ static int rk_hdptx_dp_aux_init(struct rk_hdptx_phy *hdptx)
>>  static int rk_hdptx_phy_power_on(struct phy *phy)
>>  {
>>  	struct rk_hdptx_phy *hdptx = phy_get_drvdata(phy);
>> -	int bus_width = phy_get_bus_width(hdptx->phy);
>>  	enum phy_mode mode = phy_get_mode(phy);
>> +	unsigned int rate = 0;
>>  	int ret, lane;
>>  
>> -	/*
>> -	 * FIXME: Temporary workaround to pass pixel_clk_rate
>> -	 * from the HDMI bridge driver until phy_configure_opts_hdmi
>> -	 * becomes available in the PHY API.
>> -	 */
>> -	unsigned int rate = bus_width & 0xfffffff;
>> -
>> -	dev_dbg(hdptx->dev, "%s bus_width=%x rate=%u\n",
>> -		__func__, bus_width, rate);
>> +	if (mode != PHY_MODE_DP) {
>> +		if (!hdptx->hdmi_cfg.tmds_char_rate) {
>> +			/*
>> +			 * FIXME: Temporary workaround to setup TMDS char rate
>> +			 * from the RK DW HDMI QP bridge driver.
>> +			 * Will be removed as soon the switch to the HDMI PHY
>> +			 * configuration API has been completed on both ends.
>> +			 */
>> +			rate = phy_get_bus_width(hdptx->phy) & 0xfffffff;
>> +			hdptx->hdmi_cfg.tmds_char_rate = rate * 100;
>> +		} else {
>> +			rate = hdptx->hdmi_cfg.tmds_char_rate / 100;
>> +		}
>> +		dev_dbg(hdptx->dev, "%s rate=%u\n", __func__, rate);
>> +	}
> 
> Some story here, I can't make sense of a variable in hHz. If it's
> actually needed and not a bug, this should be very explictly documented.

Not a bug - as explained earlier, phy_set_bus_width() on the other end
passes this in hHz.  I agree it should have been properly documented,
but eventually we got this cleaned up in the last patch of the series.

Thanks,
Cristian

