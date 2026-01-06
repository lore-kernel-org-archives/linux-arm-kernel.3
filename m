Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3743BC47BDF
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 10:21:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+Xak7wAR/JIg71hAoKMeJB5ByPewgiifbgu+4ypQ9g=; b=M6swOL6zbUOenaI2IvIEDQcCC5
	SqBst8dNLZajCItPFlFfM9xFmmJ91qiGL9POlq9h2nDwU6y3w5P1V/hWsFTts6WzpJzMD65fWNztS
	69UojmiPrxWkSMFrvRunDPcpQaTWHKOoH6kYRY6MzjkqlTvLd3xM3XGFHMWMwbPNJ51aJVBr6U2gf
	/L+E51jKGs+RyJkoF9h6A7p1xbXoyzUMbac+LVssvr5+pvTxmaYOhlvh8d2uy2QUDHb6y71Sekj4h
	Oiuk2Lo75HEj5N4laIxURMeN0oBUNrEWa8Qxyvl9CdLts45ae13LADUWNY3oxonP0DMAdaoqI/wug
	nsKPKNMQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Bn-0000000CmYm-4AMu;
	Tue, 06 Jan 2026 10:21:24 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vd4Bk-0000000CmXh-3FQ7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 10:21:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1767694878;
 bh=x+Xak7wAR/JIg71hAoKMeJB5ByPewgiifbgu+4ypQ9g=;
 b=KL60pC9+0BMxZ1Nwy9HyOzI5tqGw00o4dEn1/HH96gqfSmNgx5Jh3myoCv0RGkesIs9ZJwnZn
 MkjJPRkJAhep7zln3JSsiNBSKGDLoa71moZkV7bKgGGOm31zfIyp6876f5yeX7k1TKI4OaYYRU+
 LCtwoK6+G18vQoiUx51phyRaCZNoPxPge2anrIgdIleYLItIjxh/YFwSanLalSFtnGu9GhQIvKk
 sWKxntoD/c4kf7GJ9e7GWeS9wGpX5SFvd3twB+VCP/wpN4TkROnuYf25676YxpVJj3ZZn1NS1PT
 Uci5Aa4agMr5qy6UUmlkNDaWs6ZU7Vo+ObG7CJ5EO5Ig==
X-Forward-Email-ID: 695ce216a05bf2602ae3708a
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.2.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <1c5005b7-ceb9-4915-ad58-a9aa86cce394@kwiboo.se>
Date: Tue, 6 Jan 2026 11:21:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20260106100000.225445-1-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260106100000.225445-1-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260106_022121_148612_1B2868F0 
X-CRM114-Status: GOOD (  15.08  )
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

On 1/6/2026 11:00 AM, Chukun Pan wrote:
> Enable the RTL8125 network controller and corresponding PHY
> connected via PCIe on the ArmSoM Sige1.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>

This matches what I currently have in my pending to do final test and
then sent out branch at [1], so this is:

Reviewed-by: Jonas Karlman <jonas@kwiboo.se>

For the remaining RK3528 boards we should split up the pciemX_pins
pinctrl group similar to how it has been done for RK3588, as there are
freeze issues in U-Boot or problem using strict GPIO usage in Linux if
we do not property configure the reset-gpios pin to GPIO func.

[1] https://github.com/Kwiboo/linux-rockchip/commits/next-20251219-rk3528/

Regards,
Jonas

> ---
>  .../boot/dts/rockchip/rk3528-armsom-sige1.dts  | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
> index 6e21579365a5..c41af8fc0c8d 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
> @@ -232,6 +232,10 @@ sdio_pwrseq: sdio-pwrseq {
>  	};
>  };
>  
> +&combphy {
> +	status = "okay";
> +};
> +
>  &cpu0 {
>  	cpu-supply = <&vdd_arm>;
>  };
> @@ -293,6 +297,14 @@ rgmii_phy: ethernet-phy@1 {
>  	};
>  };
>  
> +&pcie {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pcie20_perstn>;
> +	reset-gpios = <&gpio4 RK_PA4 GPIO_ACTIVE_HIGH>;
> +	vpcie3v3-supply = <&vcc_3v3>;
> +	status = "okay";
> +};
> +
>  &pinctrl {
>  	bluetooth {
>  		bt_reg_on_h: bt-reg-on-h {
> @@ -324,6 +336,12 @@ r_led: r-led {
>  		};
>  	};
>  
> +	pcie {
> +		pcie20_perstn: pcie20-perstn {
> +			rockchip,pins = <4 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
>  	rtc {
>  		rtc_int_l: rtc-int-l {
>  			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;


