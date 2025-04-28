Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D895C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 09:32:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mXqOF0zItQm0/6dSL7+HvHvhO+2+acJmJkk/veJ0LL4=; b=jidQfXriacnXay+eGqKctskBpx
	LTq56g5VpOJ/ZdJFnMMMPJ/Rb/i0JQG7+ioZNiwl+bzgbiO3CHj4GHxbPPL59VfPqXAAy/CTgUWec
	WrVhuYtNF6rJlBXqR9FTv3MnNKaa01yM8G+6/gmuSuQX99fVgcqHDB2UXdarG8vlVcvezxGJUPU85
	xQ5rGbsK+3nJ/N1cs1VR8Co+/rgOaW3sjeQdMefKI0ip9bAcDx0qSXv4klf0xTpalR7yOurcTmQoe
	UuSrnIqwrEzciTQKe/ZfY8JYQQg10ekWdnwp6EzqXy9nuGeexTh6tmj6IoYnUSfZ84deBSCrXWgoN
	0VDIcscw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KqU-00000005drm-0ovH;
	Mon, 28 Apr 2025 09:32:14 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9KRj-00000005Y6n-2hO2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Apr 2025 09:06:41 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5EDDB1595;
	Mon, 28 Apr 2025 02:06:32 -0700 (PDT)
Received: from [10.1.37.44] (Suzukis-MBP.cambridge.arm.com [10.1.37.44])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 00B283F673;
	Mon, 28 Apr 2025 02:06:35 -0700 (PDT)
Message-ID: <3094b6e7-0de9-43a3-9678-4b1844aa600c@arm.com>
Date: Mon, 28 Apr 2025 10:06:35 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 06/11] dt-bindings: arm:
 arm,coresight-static-replicator: add optional clocks
Content-Language: en-GB
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Georgi Djakov <djakov@kernel.org>,
 Lee Jones <lee@kernel.org>, Mike Leach <mike.leach@linaro.org>,
 James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250425-fix-nexus-4-v3-0-da4e39e86d41@oss.qualcomm.com>
 <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250425-fix-nexus-4-v3-6-da4e39e86d41@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_020639_731658_549EFC99 
X-CRM114-Status: GOOD (  14.02  )
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

Hi Dmitry

On 25/04/2025 18:47, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks. Document those optional clocks in the schema.
> Additionally document the one-off case of Zynq-7000 platforms which uses
> apb_pclk and two additional debug clocks.

What is the plan for merging this series ? I am happy to pick this patch
via coresight tree.

> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

Otherwise,


Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>

Suzuki



> ---
>   .../bindings/arm/arm,coresight-static-replicator.yaml       | 13 +++++++++++++
>   1 file changed, 13 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..0c1017affbad2f03892b250ad864d9a5dc8d02f1 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -30,6 +30,19 @@ properties:
>     power-domains:
>       maxItems: 1
>   
> +  clocks:
> +    minItems: 1
> +    maxItems: 3
> +
> +  clock-names:
> +    oneOf:
> +      - items:
> +          - enum: [apb_pclk, atclk]
> +      - items: # Zynq-700
> +          - const: apb_pclk
> +          - const: dbg_trc
> +          - const: dbg_apb
> +
>     in-ports:
>       $ref: /schemas/graph.yaml#/properties/ports
>       additionalProperties: false
> 


