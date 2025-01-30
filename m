Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5161BC0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 10:13:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Eu1Z9k4wJekCuZOVs1VhxTjEeWIJaUEXFXoJpGq7hdc=; b=r1zZb+tepgw/FOf/BGrTFxmT5X
	tL92RQ7SgD3oViGpdGFEb3xAs2B/2sXSrbSeZBZNx0tiSBHhwnGy2WXDsJ0uQj5ETqtJXId5w5TRQ
	skdOk4jA0vyM/SBT7IW3j1sjqZGvpLIbXGCGlzvFhpKG98Fpq65EISjftc0iAoFFJaew6LX/DtuwV
	wKVEWo6APrxlg6682VX3VgL6qFHPWraaZaDIsAomf5SwJv5fRVo3fkF3DgtkbShgPhHL2NR28vgMy
	49Vzj82/0Kh9kc3YBoPsm4zLPitNvFv/RKRPDrx1cCIb7hmZ3saHh1U0jUkfPLsz/8EqQoKEL0zlb
	QvcWYVyg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRYI-00000008b5f-24Mx;
	Thu, 30 Jan 2025 10:13:38 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdRWy-00000008aup-3fYm
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 10:12:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1738231934;
 bh=Eu1Z9k4wJekCuZOVs1VhxTjEeWIJaUEXFXoJpGq7hdc=;
 b=VcdezXYPMCnTiGbcxCVDrCQ3K7szJndA2FbZGAOrZT2P7C3Y9igGLoyz1rUvbJALh61cazNUS
 Msd5i76adnPRBJ2uYuaqbRYC7bsVyY+vJz/NuDB2OW3bQV+dTG6KwhmqAWcLz58OMK2q3TK/OFJ
 YTV3cPp9yx4ztnpXzlKhZ6orMYPPPjlu6lcLNhRFez4ThH3N65UgvpokpRZIAg8vy3TGvyZjSjM
 JlS7sY/Sd+O7h5NlS09blH0hUovzpsZNgvAdbSDu9XVsJx6rePn6p6Bb/fum4+FCMstj3+irRF9
 c6ppK63+0oL03nu1WgK1lCxs13fwcRB12qE26PqvZ1EQ==
X-Forward-Email-ID: 679b5070280758b5b084a089
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <2dc894c4-8114-4f6a-9ac2-e32655564a64@kwiboo.se>
Date: Thu, 30 Jan 2025 11:11:54 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/1] phy: rockchip: naneng-combphy: compatible reset
 with old DT
To: Vinod Koul <vkoul@kernel.org>, Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Philipp Zabel <p.zabel@pengutronix.de>,
 Kishon Vijay Abraham I <kishon@kernel.org>,
 Jianfeng Liu <liujianfeng1994@gmail.com>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-phy@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250106100001.1344418-1-amadeus@jmu.edu.cn>
 <20250106100001.1344418-2-amadeus@jmu.edu.cn> <Z5sUusWDCfFFeh0f@vaman>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <Z5sUusWDCfFFeh0f@vaman>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_021216_946831_46F591C7 
X-CRM114-Status: GOOD (  15.36  )
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

Hi Vinod,

On 2025-01-30 06:57, Vinod Koul wrote:
> On 06-01-25, 18:00, Chukun Pan wrote:
>> The device tree of RK3568 did not specify reset-names before.
>> So add fallback to old behaviour to be compatible with old DT.
>>
>> Fixes: fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
>> Cc: Jianfeng Liu <liujianfeng1994@gmail.com>
>> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
>> ---
>>  drivers/phy/rockchip/phy-rockchip-naneng-combphy.c | 5 ++++-
>>  1 file changed, 4 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> index a1532ef8bbe9..8c3ce57f8915 100644
>> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
>> @@ -324,7 +324,10 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>>  
>>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>>  
>> -	priv->phy_rst = devm_reset_control_get(dev, "phy");
>> +	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
>> +	/* fallback to old behaviour */
>> +	if (PTR_ERR(priv->phy_rst) == -ENOENT)
>> +		priv->phy_rst = devm_reset_control_array_get_exclusive(dev);
> 
> That is not *same* behaviour on fallback, why _exclusive() for the
> fallback?

Prior to the commit fd3ac6e80497 ("dt-bindings: phy: rockchip: rk3588
has two reset lines") the dt-binding did not require reset-names and it
still does not for the rockchip,rk3568-naneng-combphy compatible. The
binding documentation also mentioned "exclusive PHY reset line" for the
resets prop.

The commit fbcbffbac994 ("phy: rockchip: naneng-combphy: fix phy reset")
broke backward compatibility with the rockchip,rk3568-naneng-combphy
compatible by requiring existence of a "phy" in reset-names.

This patch restores the old behavior prior to fbcbffbac994 ("phy:
rockchip: naneng-combphy: fix phy reset") when
devm_reset_control_array_get_exclusive() was used to restore
compatibility with the rockchip,rk3568-naneng-combphy dt-binding.

Regards,
Jonas

> 
>>  	if (IS_ERR(priv->phy_rst))
>>  		return dev_err_probe(dev, PTR_ERR(priv->phy_rst), "failed to get phy reset\n");
>>  
>> -- 
>> 2.25.1
> 


