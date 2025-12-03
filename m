Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8BE6D15DAD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 18:15:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WWqDzCWwab1zu2N31cjSDwgvNP24ICJrJpaCpwcLl0E=; b=0wkjSNUClHjozWtUYX8+THk0Ll
	o2p8xWZfjAuw+HR3rcKZ4AJ4y0a+9/7qtBNJstItrZqz6Ym5IuHIiBfFLqkSpesKVzRpqyTieyl4O
	X/cfZjW1TWeydtbLBccN+guanUGnSx6pZqwKXpUiOHBSa1sV5Txv+sFiTyZkr6RKql+PteiDQjV5R
	NnQlVps1BMyqi/gB9LFSoqrvxESnKd4avcRb7xTcACfRDkb3IW7fAZ0NjZ72cAiPRBFBljGLHNlFM
	w2iZyqxI2xWL7qaqgOztURZyCD2ZsxIq3hIVw8xQ88FXt73lSb+lMSXJfpbjJ8Gm0QK1KKqH+/O6M
	ieX3JGUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrNT-00000006uxh-0pI9;
	Wed, 03 Dec 2025 18:14:59 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQrNR-00000006uxM-1bml
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 18:14:58 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 06345339;
	Wed,  3 Dec 2025 10:14:49 -0800 (PST)
Received: from [10.57.75.103] (unknown [10.57.75.103])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48E2C3F66E;
	Wed,  3 Dec 2025 10:14:53 -0800 (PST)
Message-ID: <66d4488f-941a-4716-b81f-e0f9e1165931@arm.com>
Date: Wed, 3 Dec 2025 18:14:51 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 6/9] dt-bindings: arm: add an interrupt property for
 Coresight CTCU
Content-Language: en-GB
To: Jie Gan <jie.gan@oss.qualcomm.com>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Alexander Shishkin <alexander.shishkin@linux.intel.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Tingwei Zhang <tingwei.zhang@oss.qualcomm.com>,
 Jinlong Mao <jinlong.mao@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
References: <20250908-enable-byte-cntr-for-tmc-v6-0-1db9e621441a@oss.qualcomm.com>
 <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250908-enable-byte-cntr-for-tmc-v6-6-1db9e621441a@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_101457_493857_4D0EFC02 
X-CRM114-Status: GOOD (  14.58  )
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

On 08/09/2025 03:01, Jie Gan wrote:
> Add an interrupt property to CTCU device. The interrupt will be triggered
> when the data size in the ETR buffer exceeds the threshold of the
> BYTECNTRVAL register. Programming a threshold in the BYTECNTRVAL register
> of CTCU device will enable the interrupt.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Jie Gan <jie.gan@oss.qualcomm.com>
> ---
>   .../devicetree/bindings/arm/qcom,coresight-ctcu.yaml    | 17 +++++++++++++++++
>   1 file changed, 17 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> index 843b52eaf872..ea05ad8f3dd3 100644
> --- a/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> +++ b/Documentation/devicetree/bindings/arm/qcom,coresight-ctcu.yaml
> @@ -39,6 +39,16 @@ properties:
>       items:
>         - const: apb
>   
> +  interrupts:
> +    items:
> +      - description: Byte cntr interrupt for etr0
> +      - description: Byte cntr interrupt for etr1
> +
> +  interrupt-names:
> +    items:
> +      - const: etr0
> +      - const: etr1

Why are they named "etr0" "etr1" ? That would be confusing, isn't it, 
especially with the Linux driver naming things randomly for the TMC-ETRs.


What we want is the "port" number corresponding to the "TMC-ETR" being
monitored ?

Have you explored other options, "port-0", "port-1" ?

Suzuki

> +
>     in-ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>   
> @@ -56,6 +66,8 @@ additionalProperties: false
>   
>   examples:
>     - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
>       ctcu@1001000 {
>           compatible = "qcom,sa8775p-ctcu";
>           reg = <0x1001000 0x1000>;
> @@ -63,6 +75,11 @@ examples:
>           clocks = <&aoss_qmp>;
>           clock-names = "apb";
>   
> +        interrupts = <GIC_SPI 270 IRQ_TYPE_EDGE_RISING>,
> +                     <GIC_SPI 262 IRQ_TYPE_EDGE_RISING>;
> +        interrupt-names = "etr0",
> +                          "etr1";
> +
>           in-ports {
>               #address-cells = <1>;
>               #size-cells = <0>;
> 


