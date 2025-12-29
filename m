Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8B0ED3B7E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 05:39:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XSRleBfGDpxrB36lChNVQFvA7Ef/8nxaA4UlMhqSqeE=; b=lgozME/FBLo0p5w/zsy3tbMsjj
	wjs8jxccCer2ObOrZgGrKm4iKnnfEx03wWD/YryvPBfkV97cn13rYKRnIXrSI2kHien1c3JESCM+t
	B+YMNhLdRwfdgQYgRsN7AIOCRJ+TolJSx7yuM3S55ISINNd0sxShUjnakZHxZBpXSRIw3w+Zv86JA
	mI4HTtXZ6JbZZ0iadwMr0AbIBiIzj9PrDA9MwGjD4ikg17Cg6dNyibEeAOUoxgWDuqOvn/wUAEJqV
	Q434En5iNwVg/1/5Z6w1aCqMwC+8S3ExtsC8u1dgE6ngHlneJKnVz5pTgWcdZuACkN2c7xIzZmxv4
	ws3xZ/8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va5yq-00000003Lvv-1Ul9;
	Mon, 29 Dec 2025 05:39:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va5yn-00000003LvW-1YA9
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 05:39:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 188D743B25;
	Mon, 29 Dec 2025 05:39:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 37B43C4CEF7;
	Mon, 29 Dec 2025 05:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766986778;
	bh=hUD0ESZR0fiGX+5i+A4WD58O6b8Rleo0ARVfBQND1fg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=crfK7hGEKJQd+jZ/mzVVllUGC53q1JtiM6l0nfgK0VmZ+jHGITOazGfxXJsgGjzhk
	 w+SOgDsDiiDVFhcjFx1MwfiTWZ4iCOnfJ5EpkBzLLWt/b9jfx4VxULNYVllvN1APN4
	 uP9z7nLzBszdSpkTIk2HnRHyVqAYtM/5D1uVgjcTZIEUeFCGzWV1E/CK4ZZsoYLvVJ
	 Pdx7fX6aZsz1Wh0NTY94/o1DY+6Z7T2Yu3GA8BDwQ7eCMrdCy6OkzGQbPbZsxhT/rF
	 9SDLMgTzaZnjdXrCdRo8HKNS0FEwwW2jwb2iPYJjAPtXUv/IMpJLD4dKLvBVPFr6gi
	 MQpYWX6j4BHyg==
Date: Mon, 29 Dec 2025 11:09:29 +0530
From: Sumit Garg <sumit.garg@kernel.org>
To: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Jens Wiklander <jens.wiklander@linaro.org>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
	op-tee@lists.trustedfirmware.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v20 1/6] dt-bindings: firmware: Add TEE remoteproc
 service binding
Message-ID: <aVIUEafDoVQv0rHf@sumit-xelite>
References: <20251217153917.3998544-1-arnaud.pouliquen@foss.st.com>
 <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251217153917.3998544-2-arnaud.pouliquen@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_213941_457065_B537720F 
X-CRM114-Status: GOOD (  21.07  )
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

On Wed, Dec 17, 2025 at 04:39:12PM +0100, Arnaud Pouliquen wrote:
> Add a device tree binding for the TEE-based remote processor control
> service implemented as an OP-TEE Trusted Application identified by
> UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> 
> The TEE service node is a child of the "linaro,optee-tz" firmware node and
> acts as a container for remoteproc devices that are controlled via TEE.
> 
> In addition, the "linaro,optee-tz" binding is updated to specify the
> '#address-cells' and '#size-cells' values used for child TEE service
> nodes.
> 
> Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> ---
>  .../arm/firmware/linaro,optee-tz.yaml         |  6 +++
>  .../bindings/remoteproc/remoteproc-tee.yaml   | 47 +++++++++++++++++++
>  2 files changed, 53 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
> 
> diff --git a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
> index 5d033570b57b..ab69eecba9ad 100644
> --- a/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
> +++ b/Documentation/devicetree/bindings/arm/firmware/linaro,optee-tz.yaml
> @@ -41,6 +41,12 @@ properties:
>        HVC #0, register assignments
>        register assignments are specified in drivers/tee/optee/optee_smc.h
>  
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
>  required:
>    - compatible
>    - method
> diff --git a/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
> new file mode 100644
> index 000000000000..083ecf1f38cf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/remoteproc/remoteproc-tee.yaml
> @@ -0,0 +1,47 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/remoteproc/remoteproc-tee.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: TEE Remote Processor Control Service (UUID 80a4c275-0a47-4905-8285-1486a9771a08)
> +
> +maintainers:
> +  - Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
> +
> +description: |
> +  Node describing a TEE-based remote processor control service implemented as
> +  a Trusted Application identified by UUID 80a4c275-0a47-4905-8285-1486a9771a08.
> +
> +  It is a child of the OP-TEE firmware node ("linaro,optee-tz") and acts as a
> +  container for child remoteproc devices (for example, the STM32MP15 M4 core
> +  described by "st,stm32mp1-tee").
> +
> +properties:
> +  compatible:
> +    const: rproc-service-80a4c275-0a47-4905-8285-1486a9771a08

This should just be "80a4c275-0a47-4905-8285-1486a9771a08" which is the
device/service identity on TEE bus.

-Sumit

> +
> +  reg:
> +    description: |
> +      Logical identifier of the TEE remoteproc service instance.
> +    maxItems: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^[a-zA-Z0-9,._-]+@[0-9a-fA-F]+$":
> +    type: object
> +
> +
> +required:
> +  - compatible
> +  - reg
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +...
> -- 
> 2.43.0
> 

