Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 77BE6C54799
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:14:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IjZMD2eULGDwifJ6Eg5o2azP2kaC3eB2jYmU3yHnbXU=; b=jw/aFqd9pP7SKBmVAvtJGLVTgk
	C5fTmoI8ugGqdktkiNVNy18P/Fp+2XPMH1TG5Pqf5aMBgNc05VSOU61nuyxMa04x9Y91RTEb+kAhv
	hdP84AtxO8Q4bS/rzbkqLiwkwC3M46brLoMykxZYOwVLrzQAnUhk2T8h3nv6G8y8Zg7JwFhECsuIe
	DACczy7TqT8djOlqROV/DAZaXWNtgiKGDklSV8gDKQZNDUq5+B9KAizACaqxGTWtQ8nFBLciIHF5V
	tnfNiH0jUeFd1O0vCdcdxkCzm3j7i9jfBOcxO2huRI9v+9r+5pnHZi5HnUysCj7lt4TOxHy2WmNXi
	pScEYhIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKvZ-0000000CZxD-1aAM;
	Tue, 20 May 2025 11:14:33 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHKZ1-0000000CSKP-3VPH
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 10:51:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1747738274;
 bh=IjZMD2eULGDwifJ6Eg5o2azP2kaC3eB2jYmU3yHnbXU=;
 b=lwMF1BHhGUaiZGNdahHOMDXdD/YEeEIUfzLu8ar2HT91SU2wGpYhJxZNAGcqMk5GNKKtHOz2F
 AVc8XGobUPFGvUoM5+sH92vEaOemxcrQj6m/t4rmHJuW7crfvDXURg8VtBBGmiftaj2C9S8mVek
 02Cr5XdHjO2EvbDqeMRVO+xJtaoBXHq4HBJNyPjOFp0xZlg+Q7H7IbLaDX/C3pkEzTmUMOdUDzL
 SyjV2h26yth3oj5naqE8rFxKQJpjpBAslSU/vqAWYAti+k8+RaX0hCruWBtfDaNHEm97+TUAJI4
 zewbjeUG4XN+Fe96yqaUB4N0YlmPwhzq4vws5Ns5ORfg==
X-Forward-Email-ID: 682c5e9c356c24cb84e6ffc4
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.0.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <28b03818-0290-412a-8d1e-9b88a163d387@kwiboo.se>
Date: Tue, 20 May 2025 12:51:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add spi nodes for RK3528
To: Chukun Pan <amadeus@jmu.edu.cn>, Heiko Stuebner <heiko@sntech.de>
Cc: Yao Zi <ziyao@disroot.org>, Rob Herring <robh@kernel.org>,
 Mark Brown <broonie@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-rockchip@lists.infradead.org" <linux-rockchip@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-spi@vger.kernel.org" <linux-spi@vger.kernel.org>
References: <20250520100102.1226725-1-amadeus@jmu.edu.cn>
 <20250520100102.1226725-3-amadeus@jmu.edu.cn>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20250520100102.1226725-3-amadeus@jmu.edu.cn>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250520_035116_274561_098759F0 
X-CRM114-Status: GOOD (  13.00  )
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

On 2025-05-20 12:01, Chukun Pan wrote:
> There are 2 SPI controllers on the RK3528 SoC, describe it.
> 
> Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
> ---
>  arch/arm64/boot/dts/rockchip/rk3528.dtsi | 28 ++++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> index b2724c969a76..4d60c09219f9 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
> @@ -371,6 +371,34 @@ ioc_grf: syscon@ff540000 {
>  			reg = <0x0 0xff540000 0x0 0x40000>;
>  		};
>  
> +		spi0: spi@ff9c0000 {
> +			compatible = "rockchip,rk3528-spi",
> +				     "rockchip,rk3066-spi";
> +			reg = <0x0 0xff9c0000 0x0 0x1000>;
> +			clocks = <&cru CLK_SPI0>, <&cru PCLK_SPI0>;
> +			clock-names = "spiclk", "apb_pclk";
> +			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&dmac 25>, <&dmac 24>;
> +			dma-names = "tx", "rx";

This is missing power-domains after "rockchip: Add power controller
support for RK3528" [1], spi0 depend on pclk_rkvenc_root:

	power-domains = <&power RK3528_PD_RKVENC>;

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
> +		spi1: spi@ff9d0000 {
> +			compatible = "rockchip,rk3528-spi",
> +				     "rockchip,rk3066-spi";
> +			reg = <0x0 0xff9d0000 0x0 0x1000>;
> +			clocks = <&cru CLK_SPI1>, <&cru PCLK_SPI1>;
> +			clock-names = "spiclk", "apb_pclk";
> +			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
> +			dmas = <&dmac 31>, <&dmac 30>;
> +			dma-names = "tx", "rx";

Same here, spi1 depend on pclk_vpu_root:

	power-domains = <&power RK3528_PD_VPU>;

[1] https://lore.kernel.org/r/20250518220707.669515-1-jonas@kwiboo.se

Regards,
Jonas

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +
>  		uart0: serial@ff9f0000 {
>  			compatible = "rockchip,rk3528-uart", "snps,dw-apb-uart";
>  			reg = <0x0 0xff9f0000 0x0 0x100>;


