Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04D6EC87FCE
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 19:51:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=61XCRCfOhXsOpRvEnTwofG9n7532SZZSh5JywwwlCUo=; b=bxcebpW8kojZ1fhIvY/VjWVJa7
	vTLLsf3hStc2rSL+cq0f3Lm4BUQUIYWMNxWCWr8I0lm5ANi6hemcCEv1suxia7fwaalOsROeG3B+q
	GgXOf2rWZcsxdfixXb+C0SETBZdV2GhkpKEHPoE+4dbzMZNOoayX+uKfJTyORC1m/oCqf8svxEX1Y
	8kth262S88QBWlK9BLKqItobXvzeY6Cg/LRlvwUZaRs/jnwuuiBAY0nZvAq4SKW5H8jgH70KZwMQD
	F8F6NnGvbIL9z1YtK9lTyPtpkB1F7xSPHyrlhUTzaGgTMzaSEAtscbQYWVfZXSJY+lhKZXyaBfqwA
	cniYcegg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOSF-0000000AafY-1cMC;
	Fri, 25 Jul 2025 19:51:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufOO0-0000000AaIZ-3ieO
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 19:47:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 029A9601ED;
	Fri, 25 Jul 2025 19:47:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74B26C4CEE7;
	Fri, 25 Jul 2025 19:47:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753472839;
	bh=mEjzP9TaXNL8JMZBOaOKVilLLRlX5WpZm35D+dYFv7g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YIIqiaIOHmnOPsekUorf5BEBcRj+fEFfAZDMVt9C8ukV0wZbtK5MHMjSySX0M5YL1
	 CKq170D/xgNjf1sSMPlJvD+ueVR1l99gaxpUEzhZZuRwM5fG7sV1/aIc3ySWRY9YAz
	 PeLTRMVf3ehqQzneaddt/2l4JBJXP1PY/C8JBJIWIHDUph5Kf66sO9Ft2YpwA3gYRn
	 mXPreQF4hIkv5GG87zPIDgRkH88e01KnB0KpYIf0S9vU58cn4UJE6ib2D9I5pZkVZs
	 mo9vodS9M0ZQHeDN9Z8BCfqY/NxGLtFmsJ/C80+U/Xw4Zjn3J914HpEuFbNj4O43Ss
	 8AWHBIN13FPYA==
Date: Fri, 25 Jul 2025 14:47:18 -0500
From: Rob Herring <robh@kernel.org>
To: Alexander Stein <alexander.stein@ew.tq-group.com>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	linuxppc-dev@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference
 power-domains.yaml
Message-ID: <20250725194718.GA1727841-robh@kernel.org>
References: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
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

On Fri, Jul 25, 2025 at 07:58:34AM +0200, Alexander Stein wrote:
> dtbs_check for ls1021.dtsi warns about unsupported property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' does not match any of the regexes: '^pinctrl-[0-9]+$'
> 
> But if removed the check warns about missing property:
>  power-controller@1ee2140 (fsl,ls1021a-rcpm): '#power-domain-cells' is a required property
> 
> Given commit 8bcf67b8d893b ("ARM: dts: ls1021a: add #power-domain-cells
> for power-controller node") explicitly added that property, add a
> reference to the common bindings to fix the warning.
> 
> Fixes: ad21e3840a88 ("dt-bindings: soc: fsl: Convert rcpm to yaml format")
> Signed-off-by: Alexander Stein <alexander.stein@ew.tq-group.com>
> ---
>  Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> index 03d71ab930d79..5b7c0a1905545 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.yaml
> @@ -13,6 +13,9 @@ description:
>  maintainers:
>    - Frank Li <Frank.Li@nxp.com>
>  
> +allOf:
> +  - $ref: /schemas/power/power-domain.yaml#

This is not correct. The fix for the above warning is to add 
'#power-domain-cells' to the properties list here. You can't just 
reference the schema because you have to define the value of 
'#power-domain-cells' for this provider.

Generally, we only add a $ref to providers if they have child nodes 
(e.g. are a bus).

> +
>  properties:
>    compatible:
>      oneOf:
> @@ -75,7 +78,7 @@ properties:
>        RCPM register block is Little Endian. Without it RCPM
>        will be Big Endian (default case).
>  
> -additionalProperties: false
> +unevaluatedProperties: false
>  
>  examples:
>    - |
> -- 
> 2.43.0
> 

