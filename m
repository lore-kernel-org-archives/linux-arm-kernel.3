Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10217D3ABF1
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 19:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:Cc:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMsuVaCWcGbn+PNUEsDJOg5Je/VIwxR3vM5XvB5rDGk=; b=eCmSN1EyT7oZpKtLDsuXHMziuw
	ZFJdhbZlCU5neTrUg8jX5hJzkLVpEUtDyKW3hTBdzJO9ZvH2uTtrglMAhqFfrY5c02m1dYBfqnNiC
	uXw1LhnkU+ZuZ6us8Loc7dGLH+H+ib2nDi5byg81qlo4zaYPgu5+2IASjTRI+QOtGcHurY+jysfOQ
	YQnZwiIxJC7SeLJNbzFdwaZWu9yY4yLzx9w6pNbq34IvREuES8BpZjwIPhi+ycffHxkeLrLxw9U+P
	XHkGPowlynwHNsZg3j0ZeGpARCVaq+UV4NgtmcI9duI1faxNQVKHxb/zR8Hqbv6tgNmr4aqb0bjcp
	THfV4y6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZgJ-00000000zcs-2BDi;
	Mon, 11 Nov 2024 19:02:35 +0000
Received: from smtp.forwardemail.net ([207.246.76.47])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAZeV-00000000zFL-0gWl
	for linux-arm-kernel@lists.infradead.org;
	Mon, 11 Nov 2024 19:00:44 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: Cc: From:
 References: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1731351608;
 bh=CMsuVaCWcGbn+PNUEsDJOg5Je/VIwxR3vM5XvB5rDGk=;
 b=wjEnW+dPyV8k2P+3CBh7Ltj4le8kHlTqFdSeaSBOH2HJd6/7dSRDsUnBdRpPhx5uSnoR8n8a6
 CquRSd9JzlX5gHK9FRamWJFBfGZyPQNbPuFkAN3J1IwK3z4rAdFqLxxQO8f388Maw+PLf+vI+Ax
 o8WjTmD3D6kXetL8UGtbHwl7AIo3cvMPFcpsZPAapG5IgaB917oqAp+raRHLa1cpW+KK2K90iuq
 cM/sbyzX2q8g/nOaSUenRRZ3b+FSVsUFWvgkkTJHJPhqyUXTp3LES6wcHGtHBcvZLUeU3lhYKVR
 8H8tOalRiKcfTUojUUtvUdT0LnCb3DcFHDBOy+jqNjSQ==
Message-ID: <c89c2f16-ffb0-4b61-a962-9705f9f1e0e2@kwiboo.se>
Date: Mon, 11 Nov 2024 20:00:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] arm64: dts: rockchip: Add supported UHS-I rates to
 sdmmc0 on rock-3b
To: =?UTF-8?B?VGFtw6FzIFN6xbFjcw==?= <tszucs@linux.com>
References: <20241111181807.13211-1-tszucs@linux.com>
 <20241111181807.13211-2-tszucs@linux.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>,
 FUKAUMI Naoki <naoki@radxa.com>, Dragan Simic <dsimic@manjaro.org>,
 Chukun Pan <amadeus@jmu.edu.cn>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org
In-Reply-To: <20241111181807.13211-2-tszucs@linux.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Report-Abuse-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-ForwardEmail-Version: 0.4.40
X-ForwardEmail-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 207.246.76.47
X-ForwardEmail-ID: 673254361b4710f318d5ef3b
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241111_110043_665996_BE261220 
X-CRM114-Status: GOOD (  12.59  )
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

Hi Tamás,

On 2024-11-11 19:17, Tamás Szűcs wrote:
> Add all supported UHS-I rates to sdmmc0 and allow 200 MHz maximum clock to
> benefit modern SD cards.
> 
> Signed-off-by: Tamás Szűcs <tszucs@linux.com>
> ---
>  arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> index 3d0c1ccfaa79..242af5337cdf 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> +++ b/arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts
> @@ -670,8 +670,14 @@ &sdmmc0 {
>  	bus-width = <4>;
>  	cap-sd-highspeed;
>  	disable-wp;
> +	max-frequency = <200000000>;
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&sdmmc0_bus4 &sdmmc0_clk &sdmmc0_cmd &sdmmc0_det>;
> +	sd-uhs-sdr12;
> +	sd-uhs-sdr25;
> +	sd-uhs-sdr50;
> +	sd-uhs-sdr104;
> +	sd-uhs-ddr50;

There is an issue with io-domain driver not always being probed before
mmc driver, this typically result in io-domain being configured wrong,
and mmc tuning happen before io-domain is correctly configured.

You can usually observe this by looking at the tuning value during boot
and comparing it to the tuning value after removing and re-insering a
sd-card.

Because of this uhs modes was left out from initial DT submission, some
cards will work others wont, sd-uhs-sdr50 is known to be working with
most cards even with the probe order issue.

Also I thought that lower speeds where implied?

Regards,
Jonas

>  	vmmc-supply = <&vcc3v3_sd>;
>  	vqmmc-supply = <&vccio_sd>;
>  	status = "okay";


