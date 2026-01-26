Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD51FD1950C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6QGkpvSVXqE6gRD9Hi+SOiYbrWcs0Sj2g5vOCPSEyEE=; b=0yYFi+mvzqib1m6zPsorTLaUhN
	GFExhcf/N1dYfYWiBRcMBhXHieccDHbjaO0v0U6kiaygKMVJYq7/x6awP1ZbieIqv5osN26/cg6Qq
	MVCAXJXGkDHr3ZdbE4we0ZhHol6Fd74oTkr2dvxr50qxR6EkGp750j18G2QrZIW/hleZECAWPOqrF
	c+IJUEwDsW6sxl0TEoa43F7Qm3RPNCFom6tkIYUGfPF5PRT0dJJ16LVP6kGTyL0TlsCu5b6QC4M11
	By4ccIcsJHzYcKfCwLzSuub/SFUHs/N9ZL+JLTFEO+kmur+NPdxNpl2UTXHYcUQOiXWE53AsifLoP
	Dtt/D2sA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQIP-0000000CxpB-2n2w;
	Mon, 26 Jan 2026 17:22:37 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQIM-0000000Cxok-40sC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 Jan 2026 17:22:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 73657497;
	Mon, 26 Jan 2026 09:22:27 -0800 (PST)
Received: from [10.57.68.157] (unknown [10.57.68.157])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FB293F5CA;
	Mon, 26 Jan 2026 09:22:31 -0800 (PST)
Message-ID: <cd175b3d-d8d1-4efd-9698-80a6c238d819@arm.com>
Date: Mon, 26 Jan 2026 17:22:29 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 5/8] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Mao Jinlong <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>
References: <20260122-enable-byte-cntr-for-ctcu-v10-0-22978e3c169f@oss.qualcomm.com>
 <20260122-enable-byte-cntr-for-ctcu-v10-5-22978e3c169f@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260122-enable-byte-cntr-for-ctcu-v10-5-22978e3c169f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_092235_047927_9CEC36A9 
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

On 22/01/2026 02:08, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Reviewed-by: Mike Leach <mike.leach@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml | 10 ++++++++++
>   1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index c969c16c21ef..ac27a8b89085 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,11 @@ properties:
>       items:
>         - const: apb
>   
> +  interrupts:
> +    items:
> +      - description: Interrupt for the ETR device connected to in-port0.
> +      - description: Interrupt for the ETR device connected to in-port1.

Is this all the hardware supports ? i.e., can it only have two ports 
ever ? If not, why restrict it to two ?

Suzuki


> +
>     label:
>       description:
>         Description of a coresight device.
> @@ -60,6 +65,8 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>       ctcu@1001000 {
>           compatible = "qcom,sa8775p-ctcu";
>           reg = <0x1001000 0x1000>;
> @@ -67,6 +74,9 @@ examples:
>           clocks = <&aoss_qmp>;
>           clock-names = "apb";
>   
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +
>           in-ports {
>               #address-cells = <1>;
>               #size-cells = <0>;
> 


