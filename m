Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C54BFCD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RHSzqIqjJsdmncrj5+nLVXghkdnqP0I1kuHt//29DIQ=; b=D07gdvlH1IU51P7KQIr4BuOLJ/
	MMshqAu2ZrYfOqxujCt4gB1KtuyWLSpu4uc1EyNCyPrEUpdjLnZmWL9dvmshm2lW+pJRi7hY6dFqm
	9R14NHERXYz6N/OqLnw74D0FfOUxElawHuRaB8KGvVfzvRJpyTYIaZtqVb0GFk4dWwH2jLmcglxt8
	qm5Rm7dCzaB2Qd1rPuqJiYAJYHZpQI4KPB+LcrIs6t9k82aC8c5DGZa2MJ5M/PWtfKNXfX1j3f4Mv
	ZvROh5W1ZEH0BFI0WThvTkkmzVOxiPQMGQcfhhhFM4eIkFG4vmIDaoa3l5T2U/3IyB6+4wfHyev8F
	y8gTr4Hg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSj7x-00000006TFB-3cHl;
	Thu, 28 May 2026 22:22:57 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSj7v-00000006TEe-2i5d
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:22:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id E5035418C3;
	Thu, 28 May 2026 22:22:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 540051F000E9;
	Thu, 28 May 2026 22:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006974;
	bh=RHSzqIqjJsdmncrj5+nLVXghkdnqP0I1kuHt//29DIQ=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=nVgaA6GhqQWHoPjY0v/NiT3IMO2/7KPnFvSgdITi1dPzUo79rlzT9FHZ/l3HbtCYW
	 xJW62FEtUESmyQeIPuri1GSKbzxKL6qm60RP9n1LttYOBkuArHT+o8o6zmhVGw1Zel
	 hQPM5tBYxDT6i7GNHULAfsXN9BMJjl69UIun6ztBIvxBfee/SQyO59rk8jGEJ8TUxP
	 GnqSpE8U1a0p+h8fvmeK5TJ8imCwB6dup7SskV8a661m4CvZmpukMGfbRV60XBOejs
	 qzQVZFmN4O/ckd2K5cz7ywHqQEVO8YtI3a+ZXZlZfyxC5fWkgP6pH9RmcQq5GQawI1
	 v3SWgfK5l29uw==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 5/8] arm64: dts: qcom: shikra: Add CCI definitions
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
In-Reply-To: <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-5-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:22:47 +0100
Message-Id: <178000696709.4557.9615154244947019683.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=2875; i=bod@kernel.org;
 h=from:subject:message-id; bh=kEhjhFBbf9yHTndAWDllWLthNat8T3zEDzSysbLs4MY=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGMA4iwNfXyN4aARCEBFcT1PxnJkHtlNStRrwA
 z+q8OWIN1WJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahjAOAAKCRAicTuzoY3I
 OrTKEAC+gqvWdwgp+bXrpElnt7SkR5L1LYcLcYuL1uhfnY3Uh6GfaFJWApUv3rQeP7ZzaNPhCzd
 etCtIf5dnwuGsO7ADpWuGa/5lErNXqfDRcU9PTPXnnBsuIFqfx5HpQvnwt+K5qyaKXdgsJkMMUn
 W5cTGniouOHij9uwqK/ggf6uRT/rqRE9qUyUBAjA5BopEvLVSIDSJgIfRIwbMrIbiB6Wo961+6Y
 7uoJMoyQ4ed+gTm/Ckw5vA1A+GmH7vYx7/m9q68TTVYd7EW09azPxIR7CVqQLnFqNXcwC54M+aR
 3SfCWY/p+hA8LdoNrraXvQcKI9rSPMTmM2HjXjyG/5fjmtJhJENHlWRu1c4N89cMOisbbuvXsj3
 Xp3BWwksxhaXBMIfbyAGSpm18NdIp+Wa9sWo/NoG7J+0aWI5VjBNpIYnRDr+8QlB9roYXI0hTO7
 RGst6d9rEjaISqeyIaYEnePD+ITk2MtJGGJdSAHqDCPe7RCxkuXHac1RL5/NZ6MJ1JEZPYoahkX
 jzbRV6Nl0eJuSpfsC3D7wTizu69iufhc3XNBytMiZlgyj7cwd7XyiaC20qFbx0TqLDoBcU7gx6H
 tI5pFb5hP/4oadddKkgUKfe+psW4IUmOhbmTN0lFMQQRO8AoMPI4JxKwjQxK9LXKeM/y5e79KYN
 u5v1PXbpgyIcnIQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_152255_731785_E9A1524B 
X-CRM114-Status: GOOD (  12.79  )
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
> Qualcomm Shikra SoC has one Camera Control Interface (CCI)
> containing two I2C hosts.
> 
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 70 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 70 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index 6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8..46de35971f629ded990827ebd76134e652758ce3 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -348,6 +348,38 @@ tlmm: pinctrl@500000 {
>  			gpio-ranges = <&tlmm 0 0 165>;
>  			wakeup-parent = <&mpm>;
>  
> +			cci_i2c0_default: cci-i2c0-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c0_sleep: cci-i2c0-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio36", "gpio37";
> +				function = "cci_i2c0";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
> +			cci_i2c1_default: cci-i2c1-default-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +
> +			cci_i2c1_sleep: cci-i2c1-sleep-state {
> +				/* SDA, SCL */
> +				pins = "gpio41", "gpio42";
> +				function = "cci_i2c1";
> +				drive-strength = <2>;
> +				bias-pull-down;
> +			};
> +
>  			qup_uart0_default: qup-uart0-default-state {
>  				pins = "gpio0", "gpio1";
>  				function = "qup0_se0";
> @@ -701,6 +733,44 @@ port@1 {
>  					reg = <1>;
>  				};
>  			};
> +
> +		};
> +
> +		cci: cci@5c1b000 {
> +			compatible = "qcom,shikra-cci", "qcom,msm8996-cci";
> +			reg = <0x0 0x05c1b000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 206 IRQ_TYPE_EDGE_RISING 0>;
> +
> +			clocks = <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_CCI_0_CLK>;
> +			clock-names = "ahb",
> +				      "cci";
> +
> +			power-domains = <&gcc GCC_CAMSS_TOP_GDSC>;
> +
> +			pinctrl-0 = <&cci_i2c0_default &cci_i2c1_default>;
> +			pinctrl-1 = <&cci_i2c0_sleep &cci_i2c1_sleep>;
> +			pinctrl-names = "default", "sleep";
> +
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			status = "disabled";
> +
> +			cci_i2c0: i2c-bus@0 {
> +				reg = <0>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
> +
> +			cci_i2c1: i2c-bus@1 {
> +				reg = <1>;
> +				clock-frequency = <400000>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +			};
>  		};
>  
>  		qupv3_0: geniqup@4ac0000 {
> 
> -- 
> 2.34.1
> 
> 

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>

---
bod


