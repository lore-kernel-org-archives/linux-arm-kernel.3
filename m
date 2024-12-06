Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30EFEE77179
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 17:56:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WASmch37Yk5pkbzy1JYBFhMwFQYYgkVArJTg+eVAWsU=; b=UPSJC1OWnGirD+r6yf/CQ3NK0j
	mnKW54rC5FSyQJd47fd1KChX7MFpTirNavdFa0g7q9/lwRoNm6he7x9/PYm/Ki5PwaG7xcN4MfHZc
	YJjJCLZmohj6RE8GmHF4xqOQxoHe6F18WenbL44V5utZwe5Tk1iV4XXPs3XoobD2+gOZ0rafrc2hL
	Q2P3T1B5lbRrbsM115PD+rNBRuaBP8wa777m00gCbj4Fq4sHfpT56zXMMnYfdAVzR47Q5tSqwXrA5
	5+oE4NcP0QJpVoy6QRpiTPvIKprAIikbiCo9AnUUpAIMLBms9hjjBnBgGntw3QUfeuJnZkiKGLuaW
	/0LX6dkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcYv-00000002Osc-0EEc;
	Fri, 06 Dec 2024 17:56:21 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJcXX-00000002OjG-3yWH;
	Fri, 06 Dec 2024 17:54:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1733507692;
	bh=nQDvlQxYe4jehSwcFykn5ppWSMSEf/GkFb7QmH9D0uc=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=XXqaqVzj0/ntiUpR9BzunQyfF7MDb6HwPnXr+cbB6M6+XhWHl81G0cXsMe+OyMrJ5
	 YEnrK0VuK9JgrhDoYyshWF8aE6XQr/WpOye+Yl2GpuM83cyx3UE1BvJnqQybn8slyB
	 DMhqrRts1Mf6RoYNIzY/EbDqpb0VEKhSZA0Ks6kZ8+NQPmh5QIhjkyYdpA+xPBsE7z
	 SA8JP/b+yV4MWkLxRxkahg6YF4TJuQKE94URcm9DO8sl6TxS50rGuoElpvPHySptKV
	 SM/zljXYl9sox62rExqncHtUmiA7/VYcAwoUQQo5rAxO/ji+gZk778ut2K5yMJeRyZ
	 Cve9K6MapYkMw==
Received: from [192.168.1.90] (unknown [188.27.48.199])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DE65017E37C2;
	Fri,  6 Dec 2024 18:54:51 +0100 (CET)
Message-ID: <7081d3ec-1a7f-48d9-a20d-7518445ed5bd@collabora.com>
Date: Fri, 6 Dec 2024 19:54:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] phy: phy-rockchip-samsung-hdptx: annotate regmap
 register-callback
To: =?UTF-8?Q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, vkoul@kernel.org,
 kishon@kernel.org
Cc: linux-phy@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org,
 quentin.schulz@cherry.de, Heiko Stuebner <heiko.stuebner@cherry.de>
References: <20241206103401.1780416-1-heiko@sntech.de>
 <20241206103401.1780416-2-heiko@sntech.de>
 <e6172204-2f3f-4a9c-892c-be85d19ad031@collabora.com>
 <2287157.Dhsi8hcfAM@diego>
Content-Language: en-US
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
In-Reply-To: <2287157.Dhsi8hcfAM@diego>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_095456_132881_BDF855D4 
X-CRM114-Status: GOOD (  11.67  )
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

On 12/6/24 7:36 PM, Heiko Stübner wrote:
> Am Freitag, 6. Dezember 2024, 12:18:56 CET schrieb Cristian Ciocaltea:
>> On 12/6/24 12:34 PM, Heiko Stuebner wrote:
>>> From: Heiko Stuebner <heiko.stuebner@cherry.de>
>>>
>>> The variant of the driver in the vendor-tree contained those handy
>>> comments in the regmap register callback. Having the different ranges
>>> describe what they are looks helpful.
>>>
>>> Signed-off-by: Heiko Stuebner <heiko.stuebner@cherry.de>
>>> ---
>>>  drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c | 14 +++++++-------
>>>  1 file changed, 7 insertions(+), 7 deletions(-)
>>>
>>> diff --git a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> index 4ced1479e2dc..c5c64c209e96 100644
>>> --- a/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> +++ b/drivers/phy/rockchip/phy-rockchip-samsung-hdptx.c
>>> @@ -766,13 +766,13 @@ static struct tx_drv_ctrl tx_drv_ctrl_hbr2[4][4] = {
>>>  static bool rk_hdptx_phy_is_rw_reg(struct device *dev, unsigned int reg)
>>>  {
>>>  	switch (reg) {
>>> -	case 0x0000 ... 0x029c:
>>> -	case 0x0400 ... 0x04a4:
>>> -	case 0x0800 ... 0x08a4:
>>> -	case 0x0c00 ... 0x0cb4:
>>> -	case 0x1000 ... 0x10b4:
>>> -	case 0x1400 ... 0x14b4:
>>> -	case 0x1800 ... 0x18b4:
>>> +	case 0x0000 ... 0x029c: /* CMN Register */
>>> +	case 0x0400 ... 0x04a4: /* Sideband Register */
>>> +	case 0x0800 ... 0x08a4: /* Lane Top Register */
>>> +	case 0x0c00 ... 0x0cb4: /* Lane 0 Register */
>>> +	case 0x1000 ... 0x10b4: /* Lane 1 Register */
>>> +	case 0x1400 ... 0x14b4: /* Lane 2 Register */
>>> +	case 0x1800 ... 0x18b4: /* Lane 3 Register */
>>>  		return true;
>>>  	}
>>>  
>>
>> Nice finding!  The HDMI variant of the driver which I used as an
>> implementation reference (i.e. phy-rockchip-samsung-hdptx-hdmi.c)
>> doesn't provide these comments.
> 
> yep, those comments were in the displayport variant of the phy-driver ;-) .
> I don't really understand why the vendor tree contains 2 separate drivers

Yeah, I asked myself the same question a while ago - I'd assume the
(initial) development happened in parallel, but the final sync/merge was
never done.

> written by two different people, but at least it looks like we're getting
> one driver in mainline, thanks to Damon's work :-)

Indeed, we're eventually getting there.. :-)

