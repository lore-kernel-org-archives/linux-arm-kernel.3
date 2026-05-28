Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17353CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 22:21:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-Id:Date:References:
	In-Reply-To:Cc:To:From:Subject:Content-Transfer-Encoding:Content-Type:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mZmARthFPXCAyxYUsxgldu6mzFwjs58vao40Hr/sGrU=; b=zVzX+YKhthjEqSJ8D+UP8OyyEA
	0i6rNIMgwDnJyhyZO7K9bLSFxPZQvrirD3DHVt7QySOUZmWwUz2BY7FRGdHUoAUPOcDnoPaBlyemi
	oJ9xeqrP44kRq87GbGgEJCZ0BV6b9i2lJCezVnW5LvLN573h5uv9R6sNu3d2zm292P2Xz/r8AsMR+
	rkj68MMIN9Pi3qOJSdmHWaZwlxIFoPoniqvrOmmymNVaCOMoGZ1RGQJNz41LTCU03ythS1mLGnsFm
	uhgqao8bSQcAHzZoRfKDNjswB0HPpAkEmM2GT+hHOajV9nldkOPkrfbRgBpiuQTmdQ5qDuLcUg3ZB
	SllK2kdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSj6k-00000006TAI-2rEf;
	Thu, 28 May 2026 22:21:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSj6i-00000006T9l-1y98
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 22:21:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AE7AC442B5;
	Thu, 28 May 2026 22:21:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA3F11F000E9;
	Thu, 28 May 2026 22:21:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780006899;
	bh=mZmARthFPXCAyxYUsxgldu6mzFwjs58vao40Hr/sGrU=;
	h=Subject:From:To:Cc:In-Reply-To:References:Date;
	b=oVDCIb11pBEckiH0eMeGLTs3Ia2XRJ32VOv1TFeRIohYt3LQ3Xkn6cxTjZx4U3Qfk
	 Bysq1aE3ULxHL1IY4wF5QFO9cL9MgS/M2CYzXue08ySxGlvLRIY0wktVq6KvUupWoU
	 kUoctmhG4iqqYx2HQkLfMM6dk2AOCv5iODIqDnT9IzT7LL+da1Qk3PKsKgMvFqGGzA
	 24NF90JvYx5xGhJO2gTXfASez5fMbhbPANqKbuaeF5upRAfLoVJPj7zBTcdjHz5Cbu
	 Silfhy48If6qmd/1Pg6GTRB88rPkbJYy5C3OER/R2GeHNaCZnjIOiwYnNQkV/z17Ey
	 nNRauk22KuAVg==
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 4/8] arm64: dts: qcom: shikra: Add CAMSS node
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
In-Reply-To: <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
References: <20260526-shikra-camss-review-v1-0-645d2c8c75a7@qti.qualcomm.com>
 <20260526-shikra-camss-review-v1-4-645d2c8c75a7@qti.qualcomm.com>
Date: Thu, 28 May 2026 23:21:31 +0100
Message-Id: <178000689150.4557.11759359941436928903.b4-reply@b4>
X-Mailer: b4 0.16-dev-d5d98
X-Developer-Signature: v=1; a=openpgp-sha256; l=4068; i=bod@kernel.org;
 h=from:subject:message-id; bh=Mz63/CkyFYep9DnMMJtYFqQR/TTuUo9JhtPAEXop1E4=;
 b=owEBbQKS/ZANAwAKASJxO7Ohjcg6AcsmYgBqGL/tatFRK0PAVLSvVheUTY08eMxxcBtAGbDsh
 plxVRE24JuJAjMEAAEKAB0WIQTmk/sqq6Nt4Rerb7QicTuzoY3IOgUCahi/7QAKCRAicTuzoY3I
 OkdaEACdNsKvRUMFoJhIfD/HZ1qJRzzcz/1y5eumxiCBhWLQJR/21fZt4iBCqN27QjZ42TXDbmj
 EmtJw43/xp84I6xI9Xv8wRlii/0LJVOr8r5JxhFc/BqPzNxfT77cNqCXLuQCBgkWXAnEo4YvBsq
 AKOeYCX7rUZ25HWKg6l6PxkP/Ghda9xPtT2/s0rDN4o+JEtD/AGhw219HeGBY/zN279/xUTnIWL
 4v3sChtOCKesNWldKfKc3aF9z3SLR6cUdrEMWNbMxids93dlpay+8ef84wPmqg9zZMQn+JyGuKf
 HzwYg0kKg1uxw4QwDLvhvL9SRNeQWC5yjaxWrJbrN8X+HihUm5jA/uEksIZ5S8RCYmx29CbY3N8
 OR/oVNjc6jMNVx8CN2oAdLfPUhFsxexBwya1zrrUnpNcZbxsVdVEZKyvo1mwwpB02sAHszgX8A0
 5km82psvANdxR+mD1/+J7Qitsvk8o7mZp5DksWMQEmNfUiqOKMKlrJZQqnhVfG5+QCyecDHUfrF
 O1PmQs/LAoHcpssGfS3JXrV8S6zuecwtsifKUnfWJ0Dz3j23kzzITEaqzK0325dVqxylpxlNgB9
 slGz78LUm1mgePoZxZYiuI42TydUKEsiUjC7qOS8Kc7rnkMxJehdPgRSvA2EsR2nfn/wjfSpQT7
 9mJcIikSqxLOzgQ==
X-Developer-Key: i=bod@kernel.org; a=openpgp;
 fpr=E693FB2AABA36DE117AB6FB422713BB3A18DC83A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_152140_552503_FBF4193A 
X-CRM114-Status: GOOD (  14.83  )
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
> Add node for the Shikra camera subsystem.
> 
> Co-developed-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Vikram Sharma <vikram.sharma@oss.qualcomm.com>
> Signed-off-by: Nihal Kumar Gupta <nihal.gupta@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/shikra.dtsi | 99 ++++++++++++++++++++++++++++++++++++
>  1 file changed, 99 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/shikra.dtsi b/arch/arm64/boot/dts/qcom/shikra.dtsi
> index a4334d99c1f35ee851ca8266ec37d4a200a07ee5..6c47cf2a7ef26b4bb7d7f642a240b435cf5208d8 100644
> --- a/arch/arm64/boot/dts/qcom/shikra.dtsi
> +++ b/arch/arm64/boot/dts/qcom/shikra.dtsi
> @@ -604,6 +604,105 @@ opp-384000000 {
>  			};
>  		};
>  
> +		camss: camss@5c11000 {
> +			compatible = "qcom,shikra-camss";
> +
> +			reg = <0x0 0x05c11000 0x0 0x1000>,
> +			      <0x0 0x05c6e000 0x0 0x1000>,
> +			      <0x0 0x05c75000 0x0 0x1000>,
> +			      <0x0 0x05c52000 0x0 0x1000>,
> +			      <0x0 0x05c53000 0x0 0x1000>,
> +			      <0x0 0x05c66000 0x0 0x400>,
> +			      <0x0 0x05c68000 0x0 0x400>,
> +			      <0x0 0x05c6f000 0x0 0x4000>,
> +			      <0x0 0x05c76000 0x0 0x4000>;
> +			reg-names = "top",
> +				    "csid0",
> +				    "csid1",
> +				    "csiphy0",
> +				    "csiphy1",
> +				    "csitpg0",
> +				    "csitpg1",
> +				    "vfe0",
> +				    "vfe1";
> +
> +			clocks = <&gcc GCC_CAMERA_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_NRT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_RT_AXI_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CSID_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_0_CLK>,
> +				 <&gcc GCC_CAMSS_CSI0PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_CPHY_1_CLK>,
> +				 <&gcc GCC_CAMSS_CSI1PHYTIMER_CLK>,
> +				 <&gcc GCC_CAMSS_TOP_AHB_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_0_CPHY_RX_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CLK>,
> +				 <&gcc GCC_CAMSS_TFE_1_CPHY_RX_CLK>;
> +			clock-names = "ahb",
> +				      "axi",
> +				      "camnoc_nrt_axi",
> +				      "camnoc_rt_axi",
> +				      "csi0",
> +				      "csi1",
> +				      "csiphy0",
> +				      "csiphy0_timer",
> +				      "csiphy1",
> +				      "csiphy1_timer",
> +				      "top_ahb",
> +				      "vfe0",
> +				      "vfe0_cphy_rx",
> +				      "vfe1",
> +				      "vfe1_cphy_rx";
> +
> +			interrupts = <GIC_SPI 210 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 212 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 72 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 73 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 309 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 310 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 211 IRQ_TYPE_EDGE_RISING 0>,
> +				     <GIC_SPI 213 IRQ_TYPE_EDGE_RISING 0>;
> +			interrupt-names = "csid0",
> +					  "csid1",
> +					  "csiphy0",
> +					  "csiphy1",
> +					  "csitpg0",
> +					  "csitpg1",
> +					  "vfe0",
> +					  "vfe1";
> +
> +			interconnects = <&mem_noc MASTER_AMPSS_M0 RPM_ACTIVE_TAG
> +					 &config_noc SLAVE_CAMERA_CFG RPM_ACTIVE_TAG>,
> +					<&mmrt_virt MASTER_CAMNOC_HF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>,
> +					<&mmnrt_virt MASTER_CAMNOC_SF RPM_ALWAYS_TAG
> +					 &mc_virt SLAVE_EBI_CH0 RPM_ALWAYS_TAG>;
> +			interconnect-names = "ahb",
> +					     "hf_mnoc",
> +					     "sf_mnoc";
> +
> +			iommus = <&apps_smmu 0x400 0x0>;

So I'm suspicious of this IOMMU.

We should list the full range of IFE SIDs here not a subset. Since we are
register compatible with Agatti that implies to me we should also be IOMMU
compatible.

Please list in your next submission commit log the IOMMU SIDs - comment in
the DTS is fine too.

Ideally list the IOMMus for Agatti/2290 and then explain why the singleton
you have enumerated here is the only required one.

Right now my suspicion radar is high that either the Agatti binding is
wrong or the Shikra binding is.

Possibly both.

---
bod


