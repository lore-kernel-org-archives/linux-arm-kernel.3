Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50212C02181
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Jan 2025 14:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bWc4eegiqIRik/oWmiPzWCZlgXnb9uJU2PJU56uMGgM=; b=0AT2/AUiv/LAHSoUhQ2LecvtPk
	PCqb68gK5jeaUiXlGsL/KcpZ71EYxMBr/BqcTWjWvJ0yZy21D7SIl/mmVEA0v2Hw7SuG5R+hhvoUO
	ewMg3+FYXAwYNvW6m35LvNFkwGyCKCNR66WZOQFCOqMlLdOBf5IEwvqoH5V9Ia2bgHp2wzF3IQ0Gi
	foUZVt9pl8xmCmScZYybNJx9CtGdKt/Kmg1L7cVK9AQdp6Dha/FpgsJzUPIbGIKgtToMNJ4e2a5NZ
	ogSaV684ukO4kA2J2C6K/XucviivWFem6O0p7churGusjRqbCv3bKCOFVEMVCpDWgl2+424ZtoqVk
	ZiF4Kycw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tbL1K-0000000EtCD-377B;
	Fri, 24 Jan 2025 14:50:54 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tbKxu-0000000EshJ-3UBF
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Jan 2025 14:47:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1737730042;
 bh=bWc4eegiqIRik/oWmiPzWCZlgXnb9uJU2PJU56uMGgM=;
 b=RDqGJ5bq+mB40mRxPdNZeMPxsmyLhzumj3lD7bMnqdml38qNPaEKOb5JKomgp2oOEFtxxv8E+
 ATuimBD6BQI/u7mRCqbhdyGnSxoeBJpJYEZJuG8hAV0rL7nmaV3ki/jxHswRQxgN0+YBFzsenjt
 Jw/TX0BIsOQljf0jbVHPJv+54EviQkjZD5+b4wAF3vTGiXDoG38A/DOz5exxn4mQHXwLYmSPCGQ
 uno7bdgEx005NC8AXmx+zmZL0N/b0nvkTdC0wGWWqRoit7EsOCZLc3nku/JsFtH6ABtk7IVLaUc
 uDYZb3jHqdDbud9tsVUO2kxigNktX5dUW9jJwVidA8bw==
X-Forward-Email-ID: 6793a7ea3e07d3fa85055a37
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <cae9cb0a-1500-4fbc-bbf4-a6266549bcb9@kwiboo.se>
Date: Fri, 24 Jan 2025 15:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: rockchip: Increase VOP clk rate on
 RK3328
To: Elaine Zhang <zhangqing@rock-chips.com>
Cc: mturquette@baylibre.com, sboyd@kernel.org, kever.yang@rock-chips.com,
 heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 linux-clk@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, huangtao@rock-chips.com,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250124064619.13893-1-zhangqing@rock-chips.com>
 <20250124064619.13893-4-zhangqing@rock-chips.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250124064619.13893-4-zhangqing@rock-chips.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250124_064722_905935_6F6F6A7D 
X-CRM114-Status: GOOD (  13.66  )
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

Hi Elaine,

On 2025-01-24 07:46, Elaine Zhang wrote:
> The VOP on RK3328 needs to run at a higher rate in order to produce
> a proper 3840x2160 signal.
> Change to use 300MHz for VIO clk and 400MHz for VOP clk.

It is probably better to merge this change and the prior revert into a
single patch with a Fixes-tag for the commit 0f2ddb128fa2 ("arm64: dts:
rockchip: Increase VOP clk rate on RK3328") to ensure this change get
backported correctly.

Regards,
Jonas

> 
> Fixes: 4b6764f200f2 ("Revert "arm64: dts: rockchip: Increase VOP clk
> rate on RK3328"")
> 
> Signed-off-by: Elaine Zhang <zhangqing@rock-chips.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3328.dtsi | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3328.dtsi b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> index f3ef8cbfbdae..0c905f411e92 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3328.dtsi
> @@ -842,7 +842,8 @@
>  			<&cru ACLK_BUS_PRE>, <&cru HCLK_BUS_PRE>,
>  			<&cru PCLK_BUS_PRE>, <&cru ACLK_PERI_PRE>,
>  			<&cru HCLK_PERI>, <&cru PCLK_PERI>,
> -			<&cru SCLK_RTC32K>;
> +			<&cru SCLK_RTC32K>, <&cru ACLK_VIO_PRE>,
> +			<&cru ACLK_VOP_PRE>;
>  		assigned-clock-parents =
>  			<&cru HDMIPHY>, <&cru PLL_APLL>,
>  			<&cru PLL_GPLL>, <&xin24m>,
> @@ -863,7 +864,8 @@
>  			<150000000>, <75000000>,
>  			<75000000>, <150000000>,
>  			<75000000>, <75000000>,
> -			<32768>;
> +			<32768>, <300000000>,
> +			<400000000>;
>  	};
>  
>  	usb2phy_grf: syscon@ff450000 {


