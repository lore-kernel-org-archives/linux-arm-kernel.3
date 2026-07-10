Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92E52C44506
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jul 2026 23:18:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eOaCq+Mdrdtda9WrxPQLv48aiGY1TRUdPRNtds93n88=; b=cCNfwXtvob9YBgVi7XlqP5I+Qk
	ZxvPikSsCtiopMDWNYBxnrdepLy3AEXOwZHundWskGQUXiJ+f5dAm+Va9OBpjwS7/B+LUx5FRDxRl
	W1mm4CoAlZf6WLWTgDHU1iobDeU6walExOPi5CxUNZhuwMxL+vk8O1hAvdU48YhR04Anyqy4NXBdW
	HNjJWdw7v2sj8GkRRTkcd4ZklQSqQATRdb2AfXkcBqtOJfF7HW8WlYbomiQgZP42z7W/ZCWw4t+4F
	O51UITJFejORAR3JPquj8j7clINQAEeXQssh1JFqv7eGVX6PfkQhqxoFGESBJ4hwMDTMBC15YKUMC
	NkWd9J1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiKUN-00000005zxu-1izp;
	Fri, 10 Jul 2026 23:18:35 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiKUL-00000005zx7-1oDT
	for linux-arm-kernel@lists.infradead.org;
	Fri, 10 Jul 2026 23:18:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.xyz;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-58e3cb06d0; t=1783725511;
 bh=eOaCq+Mdrdtda9WrxPQLv48aiGY1TRUdPRNtds93n88=;
 b=bUw8y0Ix3j5o7P+YVgDrMEzH7rv7BxhwCQcjtF97FQF0k/49YgFssNlx+qrfUJVsLABrZW3JD
 n/j6dU2PtQVkHDqlHw5dhsj5el9qhqVRSKoaKQe7BcR0frnThm+4jp0LY6Iwyv5hxlP9TP/7tsf
 NEFJhW4JZWjPUOLKEBqeCe8=
X-Forward-Email-ID: 6a517dc6780742a88792fcb5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.xyz, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.10.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <84467f61-9902-4dea-abda-6e8cb31e0238@kwiboo.xyz>
Date: Sat, 11 Jul 2026 01:18:27 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 04/12] arm64: dts: rockchip: rk3588s-nanopi: add
 missing sdmmc cd pinctrl
To: joachim.eastwood@gmail.com, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 diederik@cknow-tech.com
References: <20260711-nanopi-m6-v2-0-422675a65402@gmail.com>
 <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.xyz>
In-Reply-To: <20260711-nanopi-m6-v2-4-422675a65402@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260710_161833_569051_507F34A5 
X-CRM114-Status: GOOD (  11.92  )
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

Hi Joachim,

On 7/11/2026 12:11 AM, Joachim Eastwood via B4 Relay wrote:
> From: Joachim Eastwood <joachim.eastwood@gmail.com>
> 
> The cd (card detect) pin is used, but not reserved through pinctrl.

Maybe this and some/most of the other DT changes that fixes some missing
bits should put first in this series and with Fixes tags?

Regards,
Jonas

> 
> Signed-off-by: Joachim Eastwood <joachim.eastwood@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> index d41c49716fa2..a8f32b994b10 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588s-nanopi.dtsi
> @@ -336,6 +336,10 @@ rtc_int: rtc-int {
>  	};
>  
>  	sdmmc {
> +		sdmmc_det_pin: sdmmc-det-pin {
> +			rockchip,pins = <0 RK_PA4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
>  		sd_s0_pwr: sd-s0-pwr {
>  			rockchip,pins = <4 RK_PB4 RK_FUNC_GPIO &pcfg_pull_up>;
>  		};
> @@ -407,6 +411,8 @@ &sdmmc {
>  	no-mmc;
>  	no-sdio;
>  	sd-uhs-sdr104;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&sdmmc_bus4 &sdmmc_clk &sdmmc_cmd &sdmmc_det_pin>;
>  	vmmc-supply = <&vcc_3v3_sd_s0>;
>  	vqmmc-supply = <&vccio_sd_s0>;
>  	status = "okay";
> 


