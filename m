Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C5C2C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Mar 2025 08:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W5O/hxV8vbhDPZf+MT7E5Xer9GBrYGhbr052JbAP7DU=; b=AmYNGx3nVFBnOn87IM1Mwix6oo
	QuXZni2Atr4arVsgsdrBBMucagVRR4C0eu3rcbajox4KD8YXw0hZfGyZnkn7uXPZn26QoDR7qwowB
	p/5uZewVfllUimmPx0RJd102VlfvcQIvmwPxF08ZaAjez9CuYt6QrWNXYPBLsG+6TazGGBtl3/+7K
	QbI8ocbRB0DDsvKNISXWtbiyvkpUmTDEFMa4RFyV+RatDFYMFmuIJZKNPUL4ZLWu50d9Ny8jdy1xh
	AgSVJl+ouJ5Zdf4mgSf5AIiKp+ub8Exql3kIyIeMWZSzpVUVpWyYDrrDI5jxRYF2whwfhnJeLKx7E
	ySfztRDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5Ri-00000001fvc-1qJH;
	Mon, 17 Mar 2025 08:03:38 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tu5Pq-00000001fWy-30sE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 17 Mar 2025 08:01:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1742198502;
 bh=W5O/hxV8vbhDPZf+MT7E5Xer9GBrYGhbr052JbAP7DU=;
 b=Gui/HyAkSJBKk17vZ+ywSiZ72C2lVWSZIzHn2T6uMqfpF3PeMhiWk97Jmb1wgifsmuOsltR8K
 zE7ikMooM+jsBnrzyVs8IWZ5JG38GMbzm1DSnJFJxadOU0uEANqvt00bOjXt6KLhyIijHrfpRbM
 gLxYK5IkI1de3vMy4ZnMJGnuxWLO88E5VC7yH/Tgt+VGS5JIWmeS4Hi+enFV+HX9353Cq3gpY/C
 m8jETOA8DfONDRBe0eG9CeDVNyt9t9O4DCkEQyDRpY7EPsro/afH2xEpu91Pq+Py0mBha8PnaIR
 U69CFzzx3YHJkyD2wuicJOQlTS3eLBlJA/JZgo4Z4i3g==
X-Forward-Email-ID: 67d7d6dac3abe04af7200682
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <da550920-bb2e-4032-82a9-1bf02aae9e17@kwiboo.se>
Date: Mon, 17 Mar 2025 09:01:25 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/7] pinctrl: rockchip: Add support for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: "conor+dt@kernel.org" <conor+dt@kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "heiko@sntech.de" <heiko@sntech.de>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "ziyao@disroot.org" <ziyao@disroot.org>,
 "linus.walleij@linaro.org" <linus.walleij@linaro.org>,
 "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>
References: <20250228064024.3200000-4-jonas@kwiboo.se>
 <20250317070002.707674-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250317070002.707674-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250317_010143_102402_68E2E066 
X-CRM114-Status: GOOD (  15.91  )
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

Hi Chukun,

On 2025-03-17 08:00, Chukun Pan wrote:
> Hi,
> 
>> Add gpio and pinctrl support for the 5 GPIO banks on RK3528.
> 
> https://source.denx.de/u-boot/contributors/kwiboo/u-boot/-/blob/rk3528/drivers/pinctrl/rockchip/pinctrl-rk3528.c#L204-L207
> 
> I noticed that there is a little difference between u-boot and kernel
> pinctrl driver. Does kernel need to sync this changes from u-boot?

RK3568_SCHMITT_BITS_PER_PIN is defined as 2 and RK3528_SMT_BITS_PER_PIN
as 1 so I think this code is correct, however I can probably update the
U-Boot code to use similar pattern as in Linux driver before sending a
new revision of the U-Boot series (probably after v6.15-rc1-dts).

Regards,
Jonas

> 
> ```
> diff --git a/drivers/pinctrl/pinctrl-rockchip.c b/drivers/pinctrl/pinctrl-rockchip.c
> index 930c454e0cec..c77d9a6cd535 100644
> --- a/drivers/pinctrl/pinctrl-rockchip.c
> +++ b/drivers/pinctrl/pinctrl-rockchip.c
> @@ -3070,6 +3070,7 @@ static int rockchip_get_schmitt(struct rockchip_pin_bank *bank, int pin_num)
>  
>  	data >>= bit;
>  	switch (ctrl->type) {
> +	case RK3528:
>  	case RK3562:
>  	case RK3568:
>  		return data & ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1);
> @@ -3100,6 +3101,7 @@ static int rockchip_set_schmitt(struct rockchip_pin_bank *bank,
>  
>  	/* enable the write to the equivalent lower bits */
>  	switch (ctrl->type) {
> +	case RK3528:
>  	case RK3562:
>  	case RK3568:
>  		data = ((1 << RK3568_SCHMITT_BITS_PER_PIN) - 1) << (bit + 16);
> ```
> 
> Thanks,
> Chukun
> 
> --
> 2.25.1
> 


