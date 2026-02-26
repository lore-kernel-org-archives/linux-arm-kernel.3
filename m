Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0DB69FC591F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 10:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wqZELNCvGhXqEIBDc+PHBKQZODk4Jf3Thd5zBjEKsBA=; b=mWKl1wL1ePgnd05bRyxva/L7MB
	vjYer73dulEEDwVaW5piAwCNVcWIk/s9s3BKprsf6D4JDluzt+bhYsyKOLwKws4i6EzVwNasJjCiy
	8o5uuNjjnnlNXRXM46rL7AgiBHT2yziOQ90Gb6nxPoFZO/bVEbiIoJqXaJq/JNKAJVfcx1CScN9kQ
	Yvw8P+ixXjYCXVU/8JeoJ5hRjpzfNzchtBTT/uLmC8xlu5n0xJ0xTayZZ+NLHuVA7johVdJQWK7WB
	+H00hwJIzRezydt+8K7Ocirzyg41YKIyV4erSFNTZoeQILHWlP8QLskQUXMBWtrl2QsqOpkHS8MM5
	cskbLs2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYtY-00000005x1Y-478i;
	Thu, 26 Feb 2026 10:47:00 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvYtX-00000005x0d-0BgJ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 10:47:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B1C01516;
	Thu, 26 Feb 2026 02:46:50 -0800 (PST)
Received: from [10.1.36.70] (Suzukis-MBP.cambridge.arm.com [10.1.36.70])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 16F093F73B;
	Thu, 26 Feb 2026 02:46:53 -0800 (PST)
Message-ID: <fb91b392-2a01-4f01-85a2-335bb39ec60e@arm.com>
Date: Thu, 26 Feb 2026 10:46:52 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 01/12] dt-bindings: document access-controllers
 property for coresight peripherals
To: Gatien Chevallier <gatien.chevallier@foss.st.com>,
 Mike Leach <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>, Leo Yan <leo.yan@linux.dev>,
 =?UTF-8?Q?Cl=C3=A9ment_Le_Goffic?= <legoffic.clement@gmail.com>,
 Linus Walleij <linusw@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>, cristian.marussi@arm.com,
 jens.wiklander@linaro.org, etienne.carriere@foss.st.com,
 Sudeep Holla <sudeep.holla@kernel.org>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-gpio@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
References: <20260226-debug_bus-v6-0-5d794697798d@foss.st.com>
 <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
Content-Language: en-GB
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20260226-debug_bus-v6-1-5d794697798d@foss.st.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_024659_185700_73A392A0 
X-CRM114-Status: GOOD (  13.58  )
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

Hi

On 26/02/2026 10:30, Gatien Chevallier wrote:
> Document the access-controllers for coresight peripherals in case some
> access checks need to be performed to use them.
> 
> Signed-off-by: Gatien Chevallier <gatien.chevallier@foss.st.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml           | 3 +++
>   .../devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml          | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml           | 3 +++
>   Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml          | 3 +++

Are you sure, you are not missing "replicator" in the list ?

Otherwise, looks good to me.

Acked-by: Suzuki K Poulose <suzuki.poulose@arm.com>



>   6 files changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> index 2a91670ccb8c..949444aba1f8 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-cti.yaml
> @@ -128,6 +128,9 @@ properties:
>     "#address-cells":
>       const: 1
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   patternProperties:
>     '^trig-conns@([0-9]+)$':
>       type: object
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> index b74db15e5f8a..b0693cd46d27 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-dynamic-funnel.yaml
> @@ -78,6 +78,9 @@ properties:
>           description: Output connection to CoreSight Trace bus
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> index 71f2e1ed27e5..10ebbbeadf93 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-etm.yaml
> @@ -118,6 +118,9 @@ properties:
>           description: Output connection from the ETM to CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - clocks
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> index 378380c3f5aa..f243e76f597f 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-stm.yaml
> @@ -73,6 +73,9 @@ properties:
>           description: Output connection to the CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> index 96dd5b5f771a..9dc096698c65 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tmc.yaml
> @@ -128,6 +128,9 @@ properties:
>         - const: tracedata
>         - const: metadata
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> index a207f6899e67..29bbc3961fdf 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-tpiu.yaml
> @@ -70,6 +70,9 @@ properties:
>           description: Input connection from the CoreSight Trace bus.
>           $ref: /schemas/graph.yaml#/properties/port
>   
> +  access-controllers:
> +    maxItems: 1
> +
>   required:
>     - compatible
>     - reg
> 


