Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 14044CCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 13:23:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w9YG67ytIstkLJLOAnUsNZnsGpexqSzAj/YzHiA+x7s=; b=ODSGSCVHb8EBBPpt0h3iQs99t7
	Qu8PzU6lx5DCUDtz5jk97BGp3hOfh+bCICFy3mc1x2IueGResxlsqlFbVjgUbfjlxSn4nkSKPFp9l
	VJWdbTe9rPUfKWhZZkefe8TsB7bwFBxDvkDFnpnVBe+mntQJESNwJJ5W1TSAbu/wHrskMCy93z6Jb
	I1wfpGb7T+9gPv9G0oh+vgK4zEgSHBQV9dDbgBF55C6gZ1UpkROA1PRagIY/vIcWXDsySwojRhe3R
	zk2Mqydc+6+JKTjInNGLK4kMPVBaD4RlYFZlTlQ6+wnwFgL5czDuam9zutK3vbb3NJG4uKjIt9RpQ
	S12En6oA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzxU-0000000FYrb-1RtX;
	Thu, 06 Nov 2025 13:23:24 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGzxR-0000000FYqn-2Ze8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Nov 2025 13:23:22 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 14B9E1596;
	Thu,  6 Nov 2025 05:23:13 -0800 (PST)
Received: from [10.1.38.47] (Suzukis-MBP.cambridge.arm.com [10.1.38.47])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 12F7C3F694;
	Thu,  6 Nov 2025 05:23:17 -0800 (PST)
Message-ID: <e8f2f3b2-9a87-4c2a-909e-fc771fe37e8c@arm.com>
Date: Thu, 6 Nov 2025 13:23:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: qcom: lemans: enable static TPDM
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Tao Zhang <tao.zhang@oss.qualcomm.com>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
References: <20251028-add_static_tpdm_support-v4-0-84e21b98e727@oss.qualcomm.com>
 <20251028-add_static_tpdm_support-v4-3-84e21b98e727@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20251028-add_static_tpdm_support-v4-3-84e21b98e727@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_052321_789031_D91CD95A 
X-CRM114-Status: GOOD (  11.49  )
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

On 28/10/2025 10:11, Jie Gan wrote:
> Enable static TPDM device for lemans.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>

Assuming this goes via some other tree:

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>


> ---
>   arch/arm64/boot/dts/qcom/lemans.dtsi | 105 +++++++++++++++++++++++++++++++++++
>   1 file changed, 105 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/lemans.dtsi b/arch/arm64/boot/dts/qcom/lemans.dtsi
> index 0b154d57ba24..8a93b353d11c 100644
> --- a/arch/arm64/boot/dts/qcom/lemans.dtsi
> +++ b/arch/arm64/boot/dts/qcom/lemans.dtsi
> @@ -2961,6 +2961,14 @@ funnel1_in4: endpoint {
>   						<&apss_funnel1_out>;
>   					};
>   				};
> +
> +				port@5 {
> +					reg = <5>;
> +
> +					funnel1_in5: endpoint {
> +						remote-endpoint = <&dlct0_funnel_out>;
> +					};
> +				};
>   			};
>   		};
>   
> @@ -3118,6 +3126,60 @@ etr1_out: endpoint {
>   			};
>   		};
>   
> +		tpda@4ad3000 {
> +			compatible = "qcom,coresight-tpda", "arm,primecell";
> +			reg = <0x0 0x4ad3000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@10 {
> +					reg = <16>;
> +					dlct0_tpda_in16: endpoint {
> +						remote-endpoint = <&turing0_funnel_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct0_tpda_out: endpoint {
> +						remote-endpoint =
> +						<&dlct0_funnel_in0>;
> +					};
> +				};
> +			};
> +
> +		};
> +
> +		funnel@4ad4000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4ad4000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				port {
> +					dlct0_funnel_in0: endpoint {
> +						remote-endpoint = <&dlct0_tpda_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					dlct0_funnel_out: endpoint {
> +						remote-endpoint = <&funnel1_in5>;
> +					};
> +				};
> +			};
> +		};
> +
>   		funnel@4b04000 {
>   			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
>   			reg = <0x0 0x4b04000 0x0 0x1000>;
> @@ -3390,6 +3452,35 @@ aoss_cti: cti@4b13000 {
>   			clock-names = "apb_pclk";
>   		};
>   
> +		funnel@4b83000 {
> +			compatible = "arm,coresight-dynamic-funnel", "arm,primecell";
> +			reg = <0x0 0x4b83000 0x0 0x1000>;
> +
> +			clocks = <&aoss_qmp>;
> +			clock-names = "apb_pclk";
> +
> +			in-ports {
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				port@1 {
> +					reg = <1>;
> +
> +					turing0_funnel_in1: endpoint {
> +						remote-endpoint = <&turing_llm_tpdm_out>;
> +					};
> +				};
> +			};
> +
> +			out-ports {
> +				port {
> +					turing0_funnel_out: endpoint {
> +						remote-endpoint = <&dlct0_tpda_in16>;
> +					};
> +				};
> +			};
> +		};
> +
>   		etm@6040000 {
>   			compatible = "arm,primecell";
>   			reg = <0x0 0x6040000 0x0 0x1000>;
> @@ -8269,6 +8360,20 @@ arch_timer: timer {
>   			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
>   	};
>   
> +	turing-llm-tpdm {
> +		compatible = "qcom,coresight-static-tpdm";
> +
> +		qcom,cmb-element-bits = <32>;
> +
> +		out-ports {
> +			port {
> +				turing_llm_tpdm_out: endpoint {
> +					remote-endpoint = <&turing0_funnel_in1>;
> +				};
> +			};
> +		};
> +	};
> +
>   	pcie0: pcie@1c00000 {
>   		compatible = "qcom,pcie-sa8775p";
>   		reg = <0x0 0x01c00000 0x0 0x3000>,
> 


