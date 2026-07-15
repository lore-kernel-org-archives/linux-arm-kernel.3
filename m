Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31AADC44508
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 07:24:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ja76QfM+HFs2L3ewN0Vlp2paisZyl+ClRn4QJUYC9dw=; b=q2xKMkODD7nfh1EGH0ZYq1RSAt
	oNTtEaKGMW+7wEQ5NnW7150TOGfLDjcdDVKwuvnv8SOVCGDdhz52ThXLr7RmY4vnmrBtS4VdBwB1X
	LHZzlKn7i7ILAOq0P+UjjemNl6Vq+W6In4cymEX9kTgFP6qzptocvZjMnpVcV4iufwdPUaOoW55qe
	orTmv3r6o+g9VCgNrk/1JQE4gQPzkndobD29k9IEfOFk4fFGNuasZEkEM3WCc6303TBI3eqMHVtl/
	lmW3Nc1puWxjas+kRtvhyc+kLfDoCzhcvFvcBNfCaMDGEYchsO2aCBleyI34gWOITfPZkdPJjX0kq
	ORNQb9MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtz6-0000000E13L-2AQZ;
	Wed, 15 Jul 2026 07:24:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjtz3-0000000E12c-1ykR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 07:24:46 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5BE23339;
	Wed, 15 Jul 2026 00:24:37 -0700 (PDT)
Received: from [10.57.2.177] (unknown [10.57.2.177])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 016FC3F915;
	Wed, 15 Jul 2026 00:24:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784100281; bh=eyt/WlPL0LI2FAzHLg9AQ5Sm9BpWJ/iIcql29xhCpVw=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ZTbKmoFIPkSrMVjEIwo95kUFeJa6ywv64O8aATJcVd/+EMA5QbcsfDYhZ2xU+tc5H
	 HIOHYer5BiUl6AsOJFLKNZEagseeVE9GKJwjgOPgT8tyigHKB50b4Ozkw/0/zfQC4m
	 cAX7nscCs6/Mw/Hyzjvq10OAxOC3LL/w9o6VYI+U=
Message-ID: <6ca90bbe-677f-4519-8c34-0600bb5e4696@arm.com>
Date: Wed, 15 Jul 2026 08:24:40 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 1/3] dt-bindings: thermal: imx: Document calibration
 offset property
To: Haoning.CHENG@cn.bosch.com
Cc: linux-pm@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 Zhang Rui <rui.zhang@intel.com>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Daniel Lezcano <daniel.lezcano@linaro.org>,
 Sascha Hauer <s.hauer@pengutronix.de>, "Rafael J. Wysocki"
 <rafael@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>,
 Fabio Estevam <festevam@gmail.com>
References: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-0-d54d8690e16e@cn.bosch.com>
 <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-1-d54d8690e16e@cn.bosch.com>
Content-Language: en-US
From: Lukasz Luba <lukasz.luba@arm.com>
In-Reply-To: <20260714-b4-symana21-11221-imx-thermal-support-upstream-6-18-v8-1-d54d8690e16e@cn.bosch.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_002445_598919_EC965C5E 
X-CRM114-Status: GOOD (  17.07  )
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



On 7/14/26 11:28, Haoning CHENG via B4 Relay wrote:
> From: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> 
> Some boards need a small per-design correction to align the reported CPU
> temperature with board-level measurements.
> 
> Document the optional fsl,temp-calibration-offset-millicelsius property,
> a signed offset in millicelsius that is added to the calculated sensor
> temperature. The property is optional and the existing behavior is kept
> when it is omitted.
> 
> Update the binding example to show its usage.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Haoning CHENG <Haoning.CHENG@cn.bosch.com>
> ---
>   Documentation/devicetree/bindings/thermal/imx-thermal.yaml | 11 +++++++++++
>   1 file changed, 11 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> index 949b154856c5..44365aac8115 100644
> --- a/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/imx-thermal.yaml
> @@ -59,6 +59,16 @@ properties:
>     clocks:
>       maxItems: 1
>   
> +  fsl,temp-calibration-offset-millicelsius:
> +    minimum: -20000
> +    maximum: 20000
> +    description:
> +      A signed calibration offset, in millicelsius, added to the calculated
> +      sensor temperature to compensate for board-level measurement
> +      differences. The range is limited to ±20 °C because a temperature
> +      sensor with such a high deviation would be unusable. When absent,
> +      no offset is applied.
> +
>     "#thermal-sensor-cells":
>       const: 0
>   
> @@ -109,6 +119,7 @@ examples:
>               nvmem-cells = <&tempmon_calib>, <&tempmon_temp_grade>;
>               nvmem-cell-names = "calib", "temp_grade";
>               clocks = <&clks IMX6SX_CLK_PLL3_USB_OTG>;
> +            fsl,temp-calibration-offset-millicelsius = <(-6400)>;
>               #thermal-sensor-cells = <0>;
>           };
>       };
> 

Reviewed-by: Lukasz Luba <lukasz.luba@arm.com>

