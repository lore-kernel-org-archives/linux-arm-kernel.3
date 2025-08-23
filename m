Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9A3DCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 Aug 2025 14:23:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=412pu3OQ60/yb9wgrpigz8yIr4VHHht2c8p5S/co5es=; b=dONQq49s4CzGkhlfeVZw2OX6tc
	W1BNOmE5mU5Zuhj6SVadQ/peRzK8eddws3NTRCma0qcq0rMJrCYUPkJCwiwM+VpRQ+eb+jPaaPUnf
	aHZQtdJJst6AxhkZP/VA6+nQh80EAEfg0fYqOa9oODxUD7WRELSkYeYZPGqT/uHyPM6c0htwvre+0
	9pt5+omCHK51uEcr7f5lq5k4u26JD4AZJ/GOG7mjRF7ELwFo/Lb8wPvTaYmDIyEcTruW1yJCMXXd1
	9a9Fd2kzH7NIKVhXSo7srFH68FQiG0IHTFsSclMUWzWtrCtdTkPdkrYshRCOT9Xs1A17lMMyAjYgM
	hGSwxT1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upp9r-00000004qLC-25Xl;
	Sat, 23 Aug 2025 14:23:51 +0000
Received: from vps.xff.cz ([195.181.215.36])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upp7A-00000004q2i-0iYi;
	Sat, 23 Aug 2025 14:21:09 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=xff.cz; s=mail;
	t=1755958862; bh=JFft/FXSDO4ypbrVZyw9DalUpokF7DX877H6dzJtP5M=;
	h=Date:From:To:Cc:Subject:X-My-GPG-KeyId:References:From;
	b=AMgkdmbqw9szbcTxLUoM0Fk6qJABiZaHCQDOw5kh3AvOHXt8XXdfaHQQvu6K2E8DU
	 r43TrBxW+re8qLO6i4qNvIDOVHOBXGbDx1wVCdHhnACiR/OgVKXImOZu6YKHNPGcOD
	 q3YD51V9w55J9q5XNGJOyK/hvX60iy6V2d3BGjH0=
Date: Sat, 23 Aug 2025 16:21:01 +0200
From: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>
To: maud_spierings@hotmail.com
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Enable the NPU on the orangepi
 5 boards
Message-ID: <7mt62weitabjzhuqnqkfonztxzx4on23nbexw7xygl622r43bj@tfs47k6aohu6>
Mail-Followup-To: =?utf-8?Q?Ond=C5=99ej?= Jirman <megi@xff.cz>, 
	maud_spierings@hotmail.com, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
X-My-GPG-KeyId: EBFBDDE11FB918D44D1F56C1F9F0A873BE9777ED
 <https://xff.cz/key.txt>
References: <20250823-orangepi5-v1-0-ae77dd0e06d7@hotmail.com>
 <20250823-orangepi5-v1-3-ae77dd0e06d7@hotmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250823-orangepi5-v1-3-ae77dd0e06d7@hotmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250823_072104_506779_F6FDA3A0 
X-CRM114-Status: GOOD (  14.16  )
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

Hello Maud,

On Sat, Aug 23, 2025 at 02:43:52PM +0200, Maud Spierings via B4 Relay wrote:
> From: Maud Spierings <maud_spierings@hotmail.com>
> 
> Enable the NPU and the PMIC that powers it.

Reviewed-by: Ondřej Jirman <megi@xff.cz>

> Signed-off-by: Maud Spierings <maud_spierings@hotmail.com>
> ---
>  .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi | 56 ++++++++++++++++++++++
>  1 file changed, 56 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
> index 91d56c34a1e456e18db31e1bbe7252b7e4632588..ac1df223d6a25f3059ce33970953745e402ef695 100644
> --- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
> @@ -258,6 +258,28 @@ regulator-state-mem {
>  	};
>  };
>  
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m2_xfer>;
> +	status = "okay";
> +
> +	vdd_npu_s0: regulator@42 {
> +		compatible = "rockchip,rk8602";
> +		reg = <0x42>;
> +		fcs,suspend-voltage-selector = <1>;
> +		regulator-name = "vdd_npu_s0";
> +		regulator-boot-on;
> +		regulator-min-microvolt = <550000>;
> +		regulator-max-microvolt = <950000>;
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
>  &i2c6 {
>  	clock-frequency = <400000>;
>  	status = "okay";
> @@ -352,6 +374,40 @@ &pd_gpu {
>  	domain-supply = <&vdd_gpu_s0>;
>  };
>  
> +&pd_npu {
> +	domain-supply = <&vdd_npu_s0>;
> +};
> +
> +&rknn_core_0 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_1 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_core_2 {
> +	npu-supply = <&vdd_npu_s0>;
> +	sram-supply = <&vdd_npu_s0>;
> +	status = "okay";
> +};
> +
> +&rknn_mmu_0 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_1 {
> +	status = "okay";
> +};
> +
> +&rknn_mmu_2 {
> +	status = "okay";
> +};
> +
>  &saradc {
>  	vref-supply = <&vcc_1v8_s0>;
>  	status = "okay";
> 
> -- 
> 2.50.1
> 
> 

