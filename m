Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66E76CD4851
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 May 2026 11:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ES+obNUAUQwAH9k0dJtrv13rabaLtnG7zHFUDIUgi68=; b=QJAHYbp6KeoamEDY4y091tTKxk
	cD3ZCTX0ZTbZN4f17JOgn3iVEugQxOqftqnKv6FezDUZMino9LhL/w0ie174dG9SUSyxwB071H1yP
	DxF71MmDDIdwQfmHkwhk6NuR8AEd6mNDasDzyjBNlEduQATcoHawx1rqNzb7y3MYuOlCs1zcqnThA
	vaaReAkDRvb3R93CEeNmzD0CRHFL9V4gWVIJM3r7cT6SY+A4zDx+b+YdYKGCJLnT8y3yWkECMpqVM
	z5AkDG3akBCTmEeqzozo7Ljk0sCgLVXpM105RUxA4dMROWvc2Ih3d4X2bNxIki/t38ZaqHtwlLm+Y
	a82AIpeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUOi-00000005ML9-3LPQ;
	Thu, 14 May 2026 11:38:36 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUOh-00000005MKz-1yDY
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 14 May 2026 11:38:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ES+obNUAUQwAH9k0dJtrv13rabaLtnG7zHFUDIUgi68=; b=XqXryeLjNkHbzn20nDVaM+Ss0g
	J/5nAPbMDHxMikY9uYgq8DgavdgtgCu7l6jEXP8L5/h+geqgjTlYszZia6ZUmpHQaYXGtsF14fOWw
	1X1KQxAC+WAheAcuerMcI1NX39e6Hj+HsnusCD3i5thz9vrNUF5i3Xnbk2DrNXfQPfhv0FYUKxBkj
	gUKCA6gRZWs2XCLTuMMTohqg5UJj9afrC2gxwxt/JfBH7QtkFyl8Bwi8yK23vSoy0WWtrZXb2xwty
	Fqv/39CaB8bl4Vxj+cTT1tRrCqXwdhFZPAXZoqZ/YYyaEaUsEkCEqffL9KXjzpfW0MJnEWfcsvcyP
	nvl6vbnQ==;
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by desiato.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNUOd-00000002mQy-0saW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 May 2026 11:38:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 7A0D644299;
	Thu, 14 May 2026 11:38:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02B0BC2BCC7;
	Thu, 14 May 2026 11:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778758709;
	bh=r0B3lSKf8gQDDJW5cY+Yg6YjjIjao27p5dvnDeMp/SQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=kNQ+9h8LGRxHG5m553fqqudypahupVGpFMNyboyE2iCh75htaN8icgnwxI/GA3+WZ
	 gyrTswzGbrWWXcmgwvNeB2+GEhg7nMGhDVthLfAh4w/SPdZwbuBue0WcNg3f203vFE
	 TU14B2cy1O90WgxLV3Wp+K3ND4Y8j3HavYyPYWy5yPhiCLIYinHlKd/qCSVAl6LclR
	 MxTXtAQxX8HACwV3X5lGz9fmD0O3ihA0djCtH+exGx0LmIBRuqCTonuweozss6yk8a
	 NSU2HeL7HcQHvv8zT3JWfwPmKfMOTZAsfvM89vsIIG+gOdgNehxJL5JK3VkiPxxbbZ
	 JvFM3hSyoQWeQ==
Date: Thu, 14 May 2026 13:38:27 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiafei Pan <Jiafei.Pan@nxp.com>
Cc: andersson@kernel.org, mathieu.poirier@linaro.org, peng.fan@nxp.com, 
	Frank.Li@nxp.com, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Zhiqiang.Hou@nxp.com, mingkai.hu@nxp.com, 
	linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: add imx-rproc-psci
Message-ID: <20260514-omniscient-futuristic-macaque-af0718@quoll>
References: <20260511023928.39640-1-Jiafei.Pan@nxp.com>
 <20260511023928.39640-2-Jiafei.Pan@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260511023928.39640-2-Jiafei.Pan@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260514_123832_219971_45C6B58B 
X-CRM114-Status: GOOD (  19.03  )
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

On Mon, May 11, 2026 at 10:39:25AM +0800, Jiafei Pan wrote:
> Add compatible string "fsl,imx-rproc-psci" for i.MX Cortex-A Core's
> remoteproc support.
> 
> Signed-off-by: Jiafei Pan <Jiafei.Pan@nxp.com>
> 
> ---
> Changes in v3:
> - Fixed dt_binding_check warnings
> 
> ---
>  .../remoteproc/fsl,imx-rproc-psci.yaml        | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> new file mode 100644
> index 000000000000..28d00dbf8bc7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc-psci.yaml
> @@ -0,0 +1,51 @@
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
> +  This binding provides support for managing Cortex-A cores as remote

Describe the hardware, not the binding.

> +  processors on i.MX platforms using the PSCI (Power State Coordination
> +  Interface) for CPU power management operations. This allows single
> +  Cortex-A core or multiple Cortex-A cores to be controlled by Linux as
> +  a remote processor, enabling them to run RTOS or bare-metal applications.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx-rproc-psci

Why isn't the compatible specific?

> +
> +  fsl,cpus-mask:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    description:
> +      Bitmask indicating which CPU cores are assigned to this remote
> +      processor instance. Each bit represents a CPU core, where bit N
> +      corresponds to CPU N. For example, 0x2 (0b10) assigns CPU core 1,
> +      while 0x6 (0b110) assigns CPU cores 1 and 2.

So you partition existing Cortex-A cores? Or how exactly? Why isn't this
deducible from the compatible (I assume you read carefully writing
bindings)?

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
> +        remoteproc-ca55-1 {

Implement previous comments.

Best regards,
Krzysztof


