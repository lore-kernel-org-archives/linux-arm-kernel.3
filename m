Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76DC0C36010
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Apr 2025 16:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qomGGYjDH5sLyK80hmsUCZRQ3vn2VmvrbGse9by3Zs4=; b=PwshkHezCGh26zK7Tbojg/exGl
	7NH4msvrQm5u/8t9T+RR/q9/JyCHTxsVWmABUHIJwYilHV0v3glw2DxOu6sE5McEE8spR0iEkF8KQ
	HdBEn/vu055AVaR58GbYyN6Ftb8s8uVuhfMH1tBV7Fj93xaCLTbao5/6nlYDqpB+Z2tSiP3Nmcnzq
	OdBO/athNjHAArTGfFloMOqj42Hup9zTw0+6jDu2JNGf3h3Qt3GdvHJRwaEvJxdl5DA+Jetvn4yfe
	wcTll8u7j94tAHmgoKx0cx/BUdt4HHS1MW/U3+EEu6hxxoneg/VDhixK/6MgvYwYHHZ3ko3yM0bJV
	Q9FJX06Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jku-0000000CHYQ-25kd;
	Fri, 04 Apr 2025 16:18:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u0jci-0000000CGUU-3GYJ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Apr 2025 16:10:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 93C586116B;
	Fri,  4 Apr 2025 16:10:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 768BDC4CEE8;
	Fri,  4 Apr 2025 16:10:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743783027;
	bh=jwbHYXZtY5R3dVPRP+meufIuWtuijc/hbV0YXLcVleg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VVtwKuFjJcANfMFV8yxzENFjdkGaNWTRrxrsTn3coAC0ItrSMEu3LmcsUjPbLKLw1
	 9p3/4jMK7MiOuetyKuC2kzqjYaqaTGkPX2TEJ1OU6OQn659/uxczxf0piPCRE51GN9
	 VpozkFSqmxaw1QagHH7WzYB9JrTfvJ9Ruas6BMQrxG+U4HFlsUq5ibrql6fSe/EWFt
	 poit+003exJ3VIMShlYVsy0202TJScWJwRo7Hec6qsjdCnZE+WgsHZq9xuaUFmvI3C
	 24GnxE3yZ1pwrfu39W6xgSs3V8r1SD9SA4TUTJGA7J/dS7mlb6jAeO5YOK+pJ3aaLH
	 6k6Qes6W2LgfQ==
Date: Fri, 4 Apr 2025 11:10:26 -0500
From: Rob Herring <robh@kernel.org>
To: Jayesh Choudhary <j-choudhary@ti.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, vigneshr@ti.com,
	afd@ti.com, s-vadapalli@ti.com, linux-kernel@vger.kernel.org,
	kristo@kernel.org, rogerq@kernel.org, kishon@kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/5] dt-bindings: soc: ti: ti,j721e-system-controller:
 Add PCIe ctrl property
Message-ID: <20250404161026.GA1524211-robh@kernel.org>
References: <20250402113201.151195-1-j-choudhary@ti.com>
 <20250402113201.151195-2-j-choudhary@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250402113201.151195-2-j-choudhary@ti.com>
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

On Wed, Apr 02, 2025 at 05:01:57PM +0530, Jayesh Choudhary wrote:
> From: Andrew Davis <afd@ti.com>
> 
> Add a pattern property for pcie-ctrl which can be part of this controller.
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> [j-choudhary@ti.com: Change description and add example]
> Signed-off-by: Jayesh Choudhary <j-choudhary@ti.com>
> ---
>  .../bindings/soc/ti/ti,j721e-system-controller.yaml    | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> index 378e9cc5fac2..13b6b6fa5dee 100644
> --- a/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> +++ b/Documentation/devicetree/bindings/soc/ti/ti,j721e-system-controller.yaml
> @@ -68,6 +68,11 @@ patternProperties:
>      description:
>        The node corresponding to SoC chip identification.
>  
> +  "^pcie-ctrl@[0-9a-f]+$":
> +    type: object
> +    description:
> +      The node corresponding to PCIe control register.
> +
>  required:
>    - compatible
>    - reg
> @@ -110,5 +115,10 @@ examples:
>              compatible = "ti,am654-chipid";
>              reg = <0x14 0x4>;
>          };
> +
> +        pcie0_ctrl: pcie-ctrl@4070 {
> +            compatible = "ti,j784s4-pcie-ctrl", "syscon";

If the parent is a syscon, then this shouldn't really be a syscon. You 
can just use the parent's regmap.

But I guess that ship has sailed. This is why bindings should be 
complete, so we can review the whole block.

Acked-by: Rob Herring (Arm) <robh@kernel.org>

