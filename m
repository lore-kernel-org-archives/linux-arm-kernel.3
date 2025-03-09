Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41F62C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  9 Mar 2025 19:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZQ1QJVIjdnw4XDWOL1lHnoPAQJsZWuneqxKAGVSgKA0=; b=o26JS3fKMIGXlt/TugG4ECn2mO
	VEj05bwtQjfqtJ+EmECE9L2IemD3wzTLSClIW5+lshpI0zAy00vrZiEfFlkXjtTzC5WTLAH4fvcDS
	zwxIacbmnRMTSsfiMmZBlS2Antj00+kxAGzleuoVue6Wg9ke0QdFoFoC3ETQFaX2iS6CHjEDyz82M
	RworfiCVMl9MyH50vgN3ZtrIcD1349yaQz58/9UQyB4+UKibhBj0kea96/f3lO5UDVUSsxC6NV0lH
	pGf0KLtLskddbsycngJ6wzJBngEhKK+RI0RBMuhReGMkCqieUo8dVTSeH2lpnIIHcgswGkYcBGtqb
	nkzs0RLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trLuA-000000011je-040v;
	Sun, 09 Mar 2025 19:01:42 +0000
Received: from smtp.forwardemail.net ([121.127.44.59])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trLOZ-00000000yNu-0hsu
	for linux-arm-kernel@lists.infradead.org;
	Sun, 09 Mar 2025 18:29:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1741544939;
 bh=ZQ1QJVIjdnw4XDWOL1lHnoPAQJsZWuneqxKAGVSgKA0=;
 b=mr+uXN/NRZEHKLoJMbrPxlkXUIAflAWn3vT7u6/qoPQuVGwRgBUTgsrZNkA6NtPIYGfyaUcGb
 6nZ8jyqxrLFkPfc1NkK1vFVZUcKY2aEDJaYVs9fiEKuk9cQqlHJ5ZuWfLiZ5xWWQJ/NO36tb/yo
 pEn23YFAZmW0p5LVZ38IkKhejuf52nYxyTdXzpQ6abaOAIxKYjDUZruO6JLqETUNqDEAPC/fPp3
 6yNzQKHCyOseuxtCxg6E1B2Neox7mryEMyfPyvsmzp5O4cZJ8jojP6fTHT9cZrbrw9ANIMrPEZ/
 oOLNSjSC5Kau/X1TpG6XkLk/B1WRjjI15kbpwACY2wTQ==
X-Forward-Email-ID: 67cddde98d04fc44bbac493b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.59
X-Forward-Email-Version: 0.4.40
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <8172efa9-2f67-4b98-9988-88b533028431@kwiboo.se>
Date: Sun, 9 Mar 2025 19:28:53 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add pwm nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?=
 <ukleinek@kernel.org>, Yao Zi <ziyao@disroot.org>,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20250307120004.959980-1-amadeus@jmu.edu.cn>
 <20250307120004.959980-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250307120004.959980-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250309_112903_317549_E814F649 
X-CRM114-Status: GOOD (  14.39  )
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

On 2025-03-07 13:00, Chukun Pan wrote:
> Add pwm nodes for RK3528. The PWM core on RK3528 is the same as
> RK3328, but the driver does not support interrupts yet.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 88 ++++++++++++++++++++++++
>  1 file changed, 88 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index b1713ed4d7e2..ab1ac3273611 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -264,6 +264,94 @@ uart7: serial@ffa28000 {
>  			status = "disabled";
>  		};
>  
> +		pwm0: pwm@ffa90000 {
> +			compatible = "rockchip,rk3528-pwm", "rockchip,rk3328-pwm";

nitpick: This could be split in two lines to match similar >80 chars
long lines in this file:

			compatible = "rockchip,rk3528-pwm",
				     "rockchip,rk3328-pwm";

And similar for the remaining pwmX.

Regards,
Jonas

> +			reg = <0x0 0xffa90000 0x0 0x10>;
> +			clocks = <&cru CLK_PWM0>, <&cru PCLK_PWM0>;
> +			clock-names = "pwm", "pclk";
> +			pinctrl-0 = <&pwm0m0_pins>;
> +			pinctrl-names = "active";
> +			#pwm-cells = <3>;
> +			status = "disabled";
> +		};
> +

[snip]

