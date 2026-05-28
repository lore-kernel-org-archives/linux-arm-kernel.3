Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7938CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:30:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JTC78I7HyeSyWieBpRlXgLzYRKV0E9nhA+7nPJZHDPI=; b=ySeCB4az3dwZ6dUVqPWvnSn3MX
	/fql671xCwa24Wz6XbT7Pjt1Kwn8KiOD1cb/AtIcD0sBo+SojvTL3AW4PfqLTFR2KeQUbJwxFrpO8
	D7y2VPUTksv5z+81HOOUCrrx8qAsVyyUo6FpYMzw3YTaWqsWt6z5Kwbg9LcXet1EbKOYyx6HXh9LF
	ecuydAuRL8SRD2nMu9uLIc4xwVNul2IR/q1eLLtTKv23DJ9/KQ6aL+m9RndGxxO/pvqgaBqOTmbpC
	75Ryh6Wm/+Hdsrd0bTN3yEIKJh2B6ys5pMyn/wSFm1BwedUVUTMR97soQqmPhD8L0D+pnhIimz2Ok
	zIwFRAnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjFd-00000006U6K-03XZ;
	Thu, 28 May 2026 22:30:53 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjFa-00000006U5e-0QMq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:30:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8F094400A7;
	Thu, 28 May 2026 22:30:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D7BF01F00A3A;
	Thu, 28 May 2026 22:30:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007449;
	bh=JTC78I7HyeSyWieBpRlXgLzYRKV0E9nhA+7nPJZHDPI=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=dtDxQHxo989x4MuYetEl28FjQ+wkepDGzLoqkJwRAQzuZQh2FxcsXRnfmzt8rD8tn
	 XXIia42Bj97lDQJuC9NjQuOdqrRNVNOrxzTexKFb7QpUjPakgO+jqn6sxmszM/CL1b
	 Q1XNmjnOpWC6xYrdvXn6/1GUWQPZLnh024tARvmHoEb8yqeiwepMqfjPkqv+h1dm7s
	 GoRdMWEaPaaCIAsaXExuYaQNCfoGJRyCnzr0Oy7HU6511k4SETnuMcSRFz/oBCWY2X
	 eN4E8GE3qBOOLLd7vEv8Am5A+hxpKoIIGyVh3ekRN4dXt/6mDC13sLpFGS1biyGtcG
	 8ZqlO6zILGQiQ==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 8/8] arm64: dts: qcom: shikra-iqs-evk-imx577-camera:
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
In-Reply-To: <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-8-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:30:41 +0100
Message-Id: <178000744162.4557.14613962845288279527.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3500; i=bod@kernel.org;
 h=from:subject:message-id; bh=6gM00ZsipIMswoFFkvvLiDGFT+x/pe9LSDNPgHmgU2c=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMITaf4YGJtKzrCQ5wNkqoquixtxXfW2tchE6
 X4fB6QIxOKJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjCEwAKCRAicTuzoY3I
 OkS1EACm6OJhIyJkwiAawBePKRoqc8eWD/J4E3aODc4QgOgbkar0E21yOB9gGj7xJTwOwW+lNCQ
 xAL5+Q8UtIHM826BJMKEsHA72AIy4R5irN6DVtdsnngIRO39KVU/vIb+lLMNDdGnKu3qHK/809x
 dQ+N4+ATOnjKDWQiIBHo59Edx0iADyX56xMAMcBrQ37FrKVm8we00ASoLPXyOLFv+IO3rtP2WA4
 Xfsd/JcrAJ/PCi0rsyaBA+Uiypmqzgmt33F+o2CLCgn6QG6TLjTfrdiq0C19yl7eXiS0dw4HEwq
 4sU6DzdABm98IILZgm9IijQ76uvjVC4Yz5AKSgaPES4/jdKolWNAt7eT3qKQPMY/N1NnycwF9+v
 nW95dgttRlGzIVlZVFxoIQk1TNPeI+7DhEpJW/Q0zX1Y3elcx/0BuchWvss4zI+1KiPWWguGm+N
 bPFJB0K/HQdVem3TjvG5CcnnATFiYmUDDb5fV/v9IxE75Nj6i6griTeuTz7P8aU2sgKyw+rFC4q
 AiPzlPETx0XY8S2QWxkYal9L4TrAr11o4V/oFAf8XMs1IEY/KDYU8TZB5S2GhVEUc8xOi+MaWIL
 X6aCK/nFKdzce6vB9qW4EdlDUKJIJeKBGkhuU/ojUlxp98vupO/B2G8uJ9VtnF/eJ4VSNy4gj5r
 GLHQDN+91MUGNdQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_153050_240930_E1F89942 
X-CRM114-Status: GOOD (  16.51  )
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
> Shikra IQS is an industrial-grade variant using PM8150 PMIC, requiring
> different CSIPHY and sensor supply rails compared to the retail boards
> (CQM and CQS) which use PM4125.
> 
> Add a dedicated overlay for optional IMX577 integration via CSIPHY1.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/Makefile                  |  2 +
>  .../dts/qcom/shikra-iqs-evk-imx577-camera.dtso     | 63 ++++++++++++++++++++++
>  2 files changed, 65 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/Makefile b/arch/arm64/boot/dts/qcom/Makefile
> index df41830e18edff82893ca24ca84d7e03065d0ef7..2a728c975a38f700360e317307036efb0968a00f 100644
> --- a/arch/arm64/boot/dts/qcom/Makefile
> +++ b/arch/arm64/boot/dts/qcom/Makefile
> @@ -340,9 +340,11 @@ dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk.dtb
>  
>  shikra-cqm-evk-imx577-camera-dtbs	:= shikra-cqm-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
>  shikra-cqs-evk-imx577-camera-dtbs	:= shikra-cqs-evk.dtb shikra-cqm-evk-imx577-camera.dtbo
> +shikra-iqs-evk-imx577-camera-dtbs	:= shikra-iqs-evk.dtb shikra-iqs-evk-imx577-camera.dtbo
>  
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqm-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= shikra-cqs-evk-imx577-camera.dtb
> +dtb-$(CONFIG_ARCH_QCOM)	+= shikra-iqs-evk-imx577-camera.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4250-oneplus-billie2.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm4450-qrd.dtb
>  dtb-$(CONFIG_ARCH_QCOM)	+= sm6115-fxtec-pro1x.dtb
> diff --git a/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
> new file mode 100644
> index 0000000000000000000000000000000000000000..f0423f1ab4e93abdcc7cad8977b39e31b2437e8e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/qcom/shikra-iqs-evk-imx577-camera.dtso
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
> +	vdd-csiphy-1p2-supply = <&pm8150_l11>;
> +	vdd-csiphy-1p8-supply = <&pm8150_l12>;
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
> +		dovdd-supply = <&pm8150_l15>;

I don't have your schematic BUT where are the rest of the regulators.

If they are absent or powered by the daughter board, a comment in the patch
would be warranted.

Same comment for previous patch.

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



