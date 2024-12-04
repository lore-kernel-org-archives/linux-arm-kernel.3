Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BA3EE7716B
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 08:38:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irIuPc2a4OBJLQdqfRggWnqgxO30rECAAu2PzFNoIkA=; b=CtHlPdS+dUIZ13pvRS8URXrBsC
	31SxR3IQNpAdFuSRi27jDejjv7bUe8GVbXgQLEbvfFNmH/lbfEBmFeBVmB2aHulR02bVMBgleI832
	DXeVcKAro11EGKpFO27AWo4Ip9iJJF25rWjAutpqwSCN3b8vQ3RXzZ0iYKOs4rKyq2xSwWUV8AzPm
	Xf7O6UbQ7FXXXLLmBWOpc9hQjma1lGH36cSURsXylxr2eEipfb0PCByJVnrxoZ14A/UCmZqwp6qIn
	mL9ufT+dyK+aIl9sRHwBegSmsQmh8zf3RK9aeVilPiK93WZGboGDM6d5vx41wcy2qzVVNCzg9TsvB
	tZ1m12Ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIktk-0000000BuId-22md;
	Wed, 04 Dec 2024 08:38:16 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIks7-0000000Bu16-46lY
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 08:36:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2FBFA41CAD;
	Wed,  4 Dec 2024 08:34:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33E13C4CED1;
	Wed,  4 Dec 2024 08:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733301394;
	bh=Lzg2IJdgrqJ0bc56IrwRYCpZJmAH3MXcmHZA/SIW1Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Kk4LsECmm9KFg5qhkcFAmMs5CnXcU9vNp39v7bWtcoOHKG/AS+oSjr3A++e4rYPXW
	 dl8i/nfmmSH2GBfOslr/Rc79Ecny8TccybhgWs0NftakbkYHKkp/6h6VH/LEQ8t7/V
	 G+x5EDqmaxoS1sR8nLzykf8uYdRDp+34Wu9WgXyh3926zWvJtOjnYKXx9VORgAhDXx
	 uZymS/GzLp6Vtoe3uxrgPkym7VvOVuL3y1fq3dBJUugaC4vsjZNa6Iluc4L2cT7X7v
	 +01a3lbiOMSuDcsbBxAGobjyZFepwHMG3WQtu5B3/hAqZqSdUArVNGHR3BGkX6hmdG
	 RQFVlPubAjlMg==
Date: Wed, 4 Dec 2024 09:36:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrew Davis <afd@ti.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, 
	Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 4/4] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add MAC efuse property
Message-ID: <f34b7uedhfvsebtluy4wca3l7u5rl2iwfmwbsfjjyvqizv3zk3@fsfjn5ezpeke>
References: <20241203173113.90009-1-afd@ti.com>
 <20241203173113.90009-4-afd@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241203173113.90009-4-afd@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_003636_077958_9B1935E8 
X-CRM114-Status: GOOD (  15.08  )
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

On Tue, Dec 03, 2024 at 11:31:13AM -0600, Andrew Davis wrote:
> Add a pattern property for MAC efuse which can be part of this controller.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml         | 6 ++++++
>  1 file changed, 6 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index ead0679b30e3f..fbaae3d1bef60 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -80,6 +80,12 @@ patternProperties:
>      description:
>        This is the PCIe control region.
>  
> +  "^ethernet-mac-syscon@[0-9a-f]+$":
> +    type: object
> +    $ref: /schemas/mfd/syscon.yaml#
> +    description:
> +      This is the Ethernet MAC efuse region.

Actually considering my comment on the previous patch - drop.

Best regards,
Krzysztof


