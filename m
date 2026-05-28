Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E2C8CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:28:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zRkG4RWbLH23sLBlro2Oe0wZiV1e2ovm9LtCDLaerI=; b=Lvv+RCv4iUbiszQxK3cxMLKS2a
	s3MP44PGX4B39AbgPWZvlU3W26hizByWrzrB50KGkG9x42bEjtLQRMwvwbCtrvfcczmtfKB7q4p42
	lLb0UIlVE64hITf/zmVPOdhz7JHeG62urMfkFD8kD7+ok49/2aaqIIRgnJ3Vu1/WDw0Eq08pyw8h3
	MBxxXvefF3OJG+2JFGqM7fVZX/0F6Kl8IS1bvf61gMVr+78G+oucnKpklZqWDU9o6P6X27+O1vdpG
	9Hlt3EUTDaPCsMSEBMj5RHb92l6n1eqspLIkJUHzLXSxbGv24R9ksdeDPsjE/2jJQc0tchXTCaj3G
	cwS6QcRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjDa-00000006TuS-3M1D;
	Thu, 28 May 2026 22:28:46 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjDZ-00000006TuE-2GaT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:28:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8BF896020A;
	Thu, 28 May 2026 22:28:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEBB51F000E9;
	Thu, 28 May 2026 22:28:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007324;
	bh=8zRkG4RWbLH23sLBlro2Oe0wZiV1e2ovm9LtCDLaerI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Ls/LjJfk9xOdQx8Pcfu7HU2S81bI0CWPlLgpyBTQs31isfLwgMacX51ilgQxktsyU
	 9tqfQQPjROIX+qnn23Sw/PvIcTs3DSko+dworb6ylkbj8fptVjo61C6CFjAmWvS0lj
	 /N+05viOUMn/CuWGH7+pJZFmjpsUVsb9JpbTgPR0DFTPNSUmGZh2Z0y85L2jvJLX7c
	 VwVYBRnqP48thdefg5N/G75tTqsabhttbjND/AdsID/OvxCNEbSbRJDcJgvsuhGwaP
	 1pSJMnJGa9IRyR9Eij69FBxftLLUY4CddBFhQlQR1Y5phDB/QMklnUWb9SaK+tVxl0
	 yWpGyiD6STr9A==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 7/8] arm64: dts: qcom: shikra-cqm-evk-imx577-camera:
 Add DT overlay
From: bod@kernel.org
To: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bod@kernel.org>, 
 Vladimir Zapolskiy <vladimir.zapolskiy@linaro.org>, 
 Loic Poulain <loic.poulain@oss.qualcomm.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Robert Foss <rfoss@kernel.org>, 
 Andi Shyti <andi.shyti@kernel.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, linux-arm-msm@vger.kernel.org, 
 linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-i2c@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Suresh Vankadara <quic_svankada@quicinc.com>, 
 Vikram Sharma <vikram.sharma@oss.qualcomm.com>
In-Reply-To: <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-7-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:28:34 +0100
Message-Id: <178000731452.4557.8537369407478321842.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3539; i=bod@kernel.org;
 h=from:subject:message-id; bh=Di+OD3usvgyX6rnjBSUb7kST4EupNSbpYTe/lTj/MJQ=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMGURvRRH+JDAyHt5+IyRuwrQMKhRBg3Zmujp
 PeTeiSWYqWJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjBlAAKCRAicTuzoY3I
 Oq43EACMGAbdNqBuEQM4lsxknuCMZY+IqXEAEy14jJjKMeomeUWcDtoG8YhKYGi7iqvIZjegeIi
 GOrwW9E4+SWXtz4D6I7NcLlQSFkDMlia1w3bXxCJcFzO2hdh2LfZOkiIyt8ATHPofuTPI66U4mC
 XcUBt3afisxXjIdfBWh8L2tTVSLcHEgIo3zpTuCirhkwwqJyLfNVR05BES1ulmkhLYLNJDB6A1W
 pTc1YymVOUOdAKm0PO0bpF6tLLNb3XMW9gE68CgwvbE8yHSnt3S3/Zg3g/x/BcPiFYKMruqoUp5
 /Bs6byUMvwuqixMVEqAwSUbnAp4BdWUk24EZJd536bKuxf4Y4eY2upWheepyEaW9ctRO4J0MDn+
 MIEtSZ2j5S/Xtn5H0qNTThJFpXyQ1yzZVRzJhDtUU0YJuWrOv6hLp4Wx0+PsPm6edJRFHGvyLnV
 2osJZC8gryJk7u5hC8L9gdGxsivttGrFWbWFGFdk8lxRV/bs/LK2jAzNSxSklSXxum9XxhJWeMs
 0ZWTFnJIXG5mDS5M5qiE+rN5yuWI4iyk1nFRa1JUt1eO41ImdgExpcQqX5oKn7gjWRzMnhjyxKC
 dcEhi66sQrxHjY1DrM2QCyC3Y84Ak3CeUQdCaSQ4tLJx3Pyr4DfSyL3qMOoYhUS4xYyzjnqNZEv
 KPp6CovBwHsvLTw==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
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

On 2026-05-26 22:42 +0530, Nihal Kumar Gupta wrote:
> Shikra CQM and CQS are retail variants sharing the same PM4125 PMIC
> and identical camera supply rails. The only difference between them
> is the integrated modem on CQM, which does not affect camera hardware.
> 
> Add a shared overlay for optional IMX577 integration via CSIPHY1,
> used by both CQM and CQS EVK boards.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  6 +++
>  .../dts/qcom/shikra-cqm-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 69 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index a9e9d829fb962386b3975f345ec006504607130a..df41830e18edff82893ca24ca84d7e03065d0ef7 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -337,6 +337,12 @@ dtb-$(CONFIG_ARCH_QCOM)	+= sdx75-idp.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
> +
> +shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
> +shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
> +
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..aedcd164810cf687efb425da79ace7ec6453e3a5
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-cqm-evk-imx577-camera.dtso
> @@ -0,0 +1,63 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright (c) Qualcomm Technologies, Inc. and/or its subsidiaries.
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/clock/qcom,shikra-gcc.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +&camss {
> +	vdd-csiphy-1p2-supply = <&pm4125_l5>;
> +	vdd-csiphy-1p8-supply = <&pm4125_l13>;
> +
> +	status = "okay";
> +
> +	ports {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		port@1 {
> +			reg = <1>;
> +
> +			csiphy1_ep: endpoint {
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&imx577_ep1>;
> +			};
> +		};
> +	};
> +};
> +
> +&cci {
> +	status = "okay";
> +};
> +
> +&cci_i2c1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	camera@1a {
> +		compatible = "sony,imx577";
> +		reg = <0x1a>;
> +
> +		reset-gpios = <&tlmm 33 GPIO_ACTIVE_LOW>;
> +		pinctrl-0 = <&mclk1_default>;
> +		pinctrl-names = "default";
> +
> +		clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clocks = <&gcc GCC_CAMSS_MCLK1_CLK>;
> +		assigned-clock-rates = <24000000>;
> +
> +		dovdd-supply = <&pm4125_l15>;
> +
> +		port {
> +			imx577_ep1: endpoint {
> +				link-frequencies = /bits/ 64 <600000000>;
> +				data-lanes = <0 1 2 3>;
> +				remote-endpoint = <&csiphy1_ep>;
> +			};
> +		};
> +	};
> +};
> 
> -- 
> 2.34.1
> 
> 

If the overlay is not specific to board then the overlay should have some
kind of base name shikra-evk-imx577-camera.dtb

This seems like a minor nit-pick and, it is :)

---
bod


