Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6503C5CFDB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 07:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xrT6aEk5N24iDw0s4WvaNp+BT4gNzb4qeJewak6Ie1c=; b=jhPEhz3NLHrSJyK4pkMujywLUM
	MfceZ3ooZ7QrIQjishFoeQx40U91P8CBnybKhJOqXVJtuwTfM0Ox9zsaVwk1Mnjm3fPpcgrpG+Zv9
	vrmRAgwRJQIogucxJsTocrS0fuWHQFAS51XlKBpVFyrbrkjIB/Z0znyE7n1B3O9fG6bXcuz2w+fmj
	K5Kbh6N4/0FmwKtW9RgWb2PTxEWMMX44us0p70JOIKTkhV8Iu6dfwEprZ2HCS+r00NVqsUufHPrYY
	FuI4/WJH3Qhx8w4aiEm7gsrEnkS0Mr9wjrKfQqLrmDjjaDb8SynnWf+/ZXQ8AXInEczbmBCS28ytq
	i9RtblXQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCI-000000002fB-3j5Y;
	Thu, 13 Aug 2026 07:49:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQCH-000000002eR-3fVN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 07:49:53 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 093B1600AF;
	Thu, 13 Aug 2026 07:49:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 379BF1F00A3D;
	Thu, 13 Aug 2026 07:49:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786607392;
	bh=xrT6aEk5N24iDw0s4WvaNp+BT4gNzb4qeJewak6Ie1c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TMwoa+JJitxUpPqB06Z8bZtlAFKBefvy19sMR5ok/RGRqwbXalaJxWlHxB8SNslMO
	 26nFK2NHuL5kvFQGRArGvSwUnAj8gZVjDIa3CHiTuuRAmPMtwfktPQX2FRPGBh0aGN
	 tAUE53qJHMMvN1OnsKehK2YmhswwO6OzICYEsDBH+d9QZJnkHHzh6IWH99rT3Q+Kz0
	 W+1QsFPcOQKIgcMb8LDkB7cGMCNUWLGLToCBXKTPby/IEgPWvgXtwZz7SF8lTcngDO
	 ALTmyytz5DkU3vwwiSPCTfbXfm73lFbkJubNC2qy5BTVw47btu6181xFHjfD0H8TB5
	 XkpmWbxO+hqpw==
Date: Thu, 13 Aug 2026 09:49:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, 
	krzysztof.kozlowski@linaro.org, peng.fan@nxp.com, Frank.Li@nxp.com, s.hauer@pengutronix.de, 
	kernel@pengutronix.de, festevam@gmail.com, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com
Subject: Re: [PATCH v4 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Message-ID: <20260813-imposing-blazing-gharial-fbb19c@quoll>
References: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
 <20260812104633.22420-1-Jiafei.Pan@nxp.com>
 <20260812104633.22420-2-Jiafei.Pan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260812104633.22420-2-Jiafei.Pan@nxp.com>
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

On Wed, Aug 12, 2026 at 06:46:30PM +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> 
> ---
> Changes in v4:
> - Updated description to describe the hardware instead of the binding
> - Changed compatible to SoC-specific "fsl,imx93-rproc-psci" with
>   generic fallback "fsl,imx-rproc-psci"
> - Fixed example node name from "remoteproc-ca55-1" to "remoteproc"

You need to start using b4 to send patches or send them correctly... Why
is this response to some other thread?

> 
> ---
>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 54 +++++++++++++++++++
>  1 file changed, 54 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> new file mode 100644
> index 000000000000..7d0d0da383a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> @@ -0,0 +1,54 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/fsl,imx-rproc-psci.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: NXP i.MX Cortex-A Core Remote Processor via PSCI
> +
> +maintainers:
> +  - Jiafei Pan <Jiafei.Pan@nxp.com>
> +
> +description:
> +  NXP i.MX SoCs integrate multiple Cortex-A cores. On certain i.MX
> +  platforms, one or more of these cores can be offloaded to run RTOS
> +  or bare-metal firmware as a remote processor, while the remaining
> +  cores run Linux. The cores are powered on and off via PSCI (Power
> +  State Coordination Interface) CPU_ON/CPU_OFF calls to the firmware.
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx93-ca55-rproc
> +      - const: fsl,imx-rproc-psci

Hm? So you just ignored the feedback?

> +
> +  fsl,cpus-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask indicating which CPU cores are assigned to this remote
> +      processor instance. Each bit represents a CPU core, where bit N
> +      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
> +      while 0x6 (0b110) assigns CPU cores 1 and 2.

How did you implement feedback from Sashiko?

> +
> +  memory-region:
> +    maxItems: 1
> +    description:
> +      Phandle to a reserved memory region to be used for the remote
> +      processor's code and data.
> +
> +required:
> +  - compatible
> +  - fsl,cpus-mask
> +  - memory-region
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +        remoteproc {

Odd indentation.

> +            compatible = "fsl,imx93-ca55-rproc", "fsl,imx-rproc-psci";
> +            /* bitmask: 0b10, assign A55 Core 1 */
> +            fsl,cpus-mask = <0x2>;
> +            memory-region = <&rtos_ca55_reserved>;
> +        };
> -- 
> 2.43.0
> 

