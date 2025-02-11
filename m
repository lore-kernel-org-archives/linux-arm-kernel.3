Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A13CFC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 21:56:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LTa4gETYqlANrfkPeXsddwQ0KGcUNUKbmz+uu+8RYzo=; b=c2oElnJ676JK6RG16IH4v7a/L2
	dFeONi0QU6Yp6qMliBBm9X/6df5W+ER1AJyka3mpxNNP5AHPqOYQuStou8FFSjF3noS9w4x9xdkkV
	+wm3yHHp120szNK+z5s3JRxNVCtblgnVbv6Hi0AMOjOdhHb1pU9lsMbZl5VwIfrKDAyF6XIGrURa+
	8ZZIxRxHeRC7D50Fyh7LFrvGT8GyOR8CTeo1ZbPGnF5gSmpzORJFZzBILrK8vp/XrpPaTKFOwmGWB
	p8dPI9pJ6Ru440QuuMtNR2Ls50qqj9Lim3k1HZXrV5QBM0sPsgXOyNQbi1Fxya3m926zRu+CxA7Kz
	VEaVs/Pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thyF6-00000005PZp-3CTD;
	Tue, 11 Feb 2025 21:56:32 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thyCa-00000005PM1-1HCT
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 21:53:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 24D2B5C5470;
	Tue, 11 Feb 2025 21:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31B36C4CEDD;
	Tue, 11 Feb 2025 21:53:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739310835;
	bh=ZOTDV0C3q2CDB3rQM196vlVvGcBuD+GPHBG7B+1efHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=IivS/s9ULuONCMV6OfzkHOa/ur5svrKqO2MIkv0VAqg31CKNhm3tun4ISAd8k2Umc
	 XVy7223Zs/zbBsqCd4Nm0sJ2mKy/h7hU/asbJCnHfAOSl3WHbOAh+5HesEm4An639Z
	 aW/VF3DRmBJZNOF5IAewC9R+TZpV0XcddukUC66t49R0wqVkTzzLnHhOjHDtiJB+1l
	 eQskcocha5U+xl6QGdXW3ERb2XCuHVQZiX+nd1O5KVqDnAEoMTj48dO+fNi+dGw/fB
	 qZ6jR8Y5CmmOeG+PodM2Ijda05H+ShMp2G0SKGWFkvPPCkUo0GZpy4LEIu62PQkK6r
	 4DSgBrgdEQ49A==
Date: Tue, 11 Feb 2025 15:53:54 -0600
From: Rob Herring <robh@kernel.org>
To: Ronak Jain <ronak.jain@amd.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com,
	nava.kishore.manne@amd.com, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: firmware: xilinx: Add conditional
 pinctrl schema
Message-ID: <20250211215354.GA1244436-robh@kernel.org>
References: <20250206142244.2553237-1-ronak.jain@amd.com>
 <20250206142244.2553237-3-ronak.jain@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250206142244.2553237-3-ronak.jain@amd.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_135356_432708_9F429CE9 
X-CRM114-Status: GOOD (  18.00  )
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

On Thu, Feb 06, 2025 at 06:22:43AM -0800, Ronak Jain wrote:
> Updates the Device Tree bindings for Xilinx firmware by introducing
> conditional schema references for the pinctrl node.
> 
> Previously, the pinctrl node directly referenced
> xlnx,zynqmp-pinctrl.yaml. However, this patch modifies the schema to
> conditionally apply the correct pinctrl schema based on the compatible
> property. Specifically:
> - If compatible contains "xlnx,zynqmp-pinctrl", reference
>   xlnx,zynqmp-pinctrl.yaml.
> - If compatible contains "xlnx,versal-pinctrl", reference
>   xlnx,versal-pinctrl.yaml.
> 
> Additionally, an example entry for "xlnx,versal-pinctrl" has been
> added under the examples section.
> 
> Signed-off-by: Ronak Jain <ronak.jain@amd.com>
> ---
>  .../firmware/xilinx/xlnx,zynqmp-firmware.yaml | 20 ++++++++++++++++++-
>  1 file changed, 19 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> index 2b72fb9d3c22..d50438b0fca8 100644
> --- a/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> +++ b/Documentation/devicetree/bindings/firmware/xilinx/xlnx,zynqmp-firmware.yaml
> @@ -76,7 +76,6 @@ properties:
>      type: object
>  
>    pinctrl:
> -    $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
>      description: The pinctrl node provides access to pinconfig and pincontrol
>        functionality available in firmware.
>      type: object
> @@ -106,6 +105,21 @@ properties:
>      type: object
>      deprecated: true
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,zynqmp-firmware
> +    then:
> +      properties:
> +        pinctrl:
> +          $ref: /schemas/pinctrl/xlnx,zynqmp-pinctrl.yaml#
> +    else:
> +      properties:
> +        pinctrl:
> +          $ref: /schemas/pinctrl/xlnx,versal-pinctrl.yaml#

The somewhat preferred way to do this would be to do this in the top 
level:

pinctrl:
  type: object
  additionalProperties: true
  properties:
    compatible:
      contains:
        enum:
          - xlnx,zynqmp-pinctrl
          - xlnx,versal-pinctrl
  required:
    - compatible

Otherwise, the pinctrl schema ends up being applied twice.
 
> +
>  required:
>    - compatible
>  
> @@ -164,6 +178,10 @@ examples:
>          compatible = "xlnx,versal-fpga";
>        };
>  
> +      pinctrl {
> +        compatible = "xlnx,versal-pinctrl";
> +      };
> +
>        xlnx_aes: zynqmp-aes {
>          compatible = "xlnx,zynqmp-aes";
>        };
> -- 
> 2.34.1
> 

