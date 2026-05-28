Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CFA4CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:25:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+S+Yw/FvBDEuMekXmuxXKfy0MCGy9lrvQ1qucBDeyA=; b=kkmgHG1F1YkKHztxi0KWQIYKPS
	+xgIKjiVDVrFm/+tXyQb5DvaI2j3c5rzArrA5KnBsMJ9gtDlEjteU251XNdkLXh3eezONohdsWWSb
	EsDy9FNwk4+RPKw7zSYILJKd8fsmx1FbLOFmp3zK3KV5cAQZamokN8uLk8E7BE6pBMPxsG1SuVP8z
	gAgksdBPCQu+jcOu2E6Kan3lfBqRCxeaggMDqNuf41VdFnnj88ENjt7v6L7NhQ8qeAnIF/SuCBUjw
	90DvByAnZohJvZNaa9A7BXFV54a3+HTd6oL08R8aerQScg3qZe2Qv7NV+TJgM12KrQ3+rEk0kf8SJ
	PVBiHEAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjAO-00000006TXZ-1P15;
	Thu, 28 May 2026 22:25:28 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSjAL-00000006TWP-0hX0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:25:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B192442A51;
	Thu, 28 May 2026 22:25:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF0771F000E9;
	Thu, 28 May 2026 22:25:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780007124;
	bh=u+S+Yw/FvBDEuMekXmuxXKfy0MCGy9lrvQ1qucBDeyA=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=Hr6xEbzndESUoJ2wfNwLPbtLjwjy1LSVfRxO4DenF/pVNsATiZ8N/615LpS9bRajm
	 i7+zUFSS2Eni7u8CHWGK6gnRlrfQH7m8MKlp3wr5qbnHuka1LRI98czPpq6MGKBZaS
	 j9QJRzLrDX435uGaKN58pSbBKbG0xklta7wc2k4i1UmURZwhdM1BoH0dkN+/Rt9icR
	 XhME9SEgzZOSjxNNeGR1wkqEypr9yIldL663jKKa4lCnYCjWwYBkfShxbpBuBUvKGQ
	 xrOiE7WJHxYM4TQJ6FCSZxxEn+8pyKenTysg2L64K2Q/MILUwRzSJs43ugkXiIlBgK
	 /8Vohh5YagjdA==
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
Date: Thu, 28 May 2026 23:25:16 +0100
Message-Id: <178000711657.4557.3333046681736710601.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=3426; i=bod@kernel.org;
 h=from:subject:message-id; bh=5pD1xzgytOv4lRY+9SSxjmule4gFpWNYwQRPX9KkAk8=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMDOag8iXwNmyvcvGG71GFVtzTBZ8GRrnrC8i
 UEmdhIWZfCJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjAzgAKCRAicTuzoY3I
 OuMdD/9r4e3j3hYm02Do01jRKhrrRPeFv7ECVA0AYGytgWknXX2fis2ruf8UwUzBTXbBnBt0nk0
 lSfZ9m6G64/tz/FSOONzGM9wh3k+uCNTd7lRUAZc9hpQmWJ+IdUPtWkEoP4NMK2RgYNL2pYfqxB
 uvmyS3aGx1qSRcmQxwbKRn1ycIOOpfhM/cUYk3lb2LDeZxypyG+fe3ZJFfJ9w1Evux9c322PuLC
 YkhS7yz9TLEO9ARrMT9/6Xw5hOjN673rV0iCed9BvZLTcxJK33wrq3tm/PbMZ7MF98P2AeAV4Tu
 N6HYPeqea9D6vOaUjCPXvrQXpN1rlAU/jTcz8qthwPQQtI1Pu2PEp3YQjSASZYn+U25n0yEbKOV
 V7m1z3yzMbTRQSzQUnJE6lBEVUU1DUJtnwjhvU/kSaquzyjwLxosIWxmrMBpxtBG6kZPa8YmOjz
 r2r+HD28+n9Pu1kt6QDpn+7B2LW28m4u3ZEJ9tuMyfIQaqz0Sfw2PpfBRXDSbH/4S8feB2XA3lm
 b0Dcu37Vo6Q7fEwENKyQzN+IqW8Y6GsUToBIU66ZTt2nLtO4VehG7GUP+uFAWG7IXp0qBcoXQFo
 b4kRFIzzvTANgfUlai+n+FchJ/mDr/LXLInNZ+GsVOUZOFdBt5I+QBYNARXyf11yr7GVL6UuS7h
 5SmQWwQSJcEIt+g==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_152525_259728_5A5446C7 
X-CRM114-Status: GOOD (  16.69  )
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

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


