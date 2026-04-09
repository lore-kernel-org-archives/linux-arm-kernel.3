Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ED50E9DE5A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 07:28:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=613UmsT+jTo54xaDw1cFmp5OdRZv/pKg1pFcm53tXes=; b=pC4Sp/ebo9kkaMrpDKVrVgcnCu
	KrkJhlKDZuWXXIvAWu/ezdwYsnsKe2O5nWMnU+zxWv/iGBJd4/lPh8x89TjggKM2oV/BwLeIW3atk
	qgK6BSUCsinCft73y4DnVU1CO8SMede3vHmh+1CeyXAMIu3mpDdtSz9pf4J4xoiI6EOLZ7LggiELI
	z1ZgWK/6RilxXYNDw81eZM9Z+A1T6Ar/+MY2lryCQiLJrl+DaYXdhQ3dtpzCD9ZfHTyoz4lY0H1ZJ
	mOIfhTPl/gDVlxP6Dsh4VmA6hdgd+GYn6YhgYqdzA8YOJssovjXTAQEmfPwQ16TNe8MW7WEO3O4oG
	EHxYVqQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjoM-00000009qps-1z9y;
	Thu, 09 Apr 2026 07:28:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAjoK-00000009qpT-38y6;
	Thu, 09 Apr 2026 07:28:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C837144186;
	Thu,  9 Apr 2026 07:28:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B795C4CEF7;
	Thu,  9 Apr 2026 07:28:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775719699;
	bh=wGp8rio3+O1LigJl7XJ1TouzLqDBv3x6HJpnWI0/Ifg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FloQYJ2c5SgdHHvn1NdU1cHQSeYqeBynECzDyAjAy4b8FuIRjOkBM61yBgn4oUO3Y
	 knFq4qkQ0jAh/fq362EBXQ0nOWCgPyzxNwhnGsStS1gamecAmV6RB8QW+THelaMIrR
	 brnznsxZ1n1LZxCs48N2fZ/PTWmsEVBN5s1ebZNIKH0tZ2nh3DKN0myG4THk15I32t
	 qQiTrEYS5ZlrcJCzE1FcMDfby2vKslWs0GbHHanWLLXyq2bR4xEQzLOLr2MsaCNPLp
	 cG7Aowyj1makyC//P3Cwy+gQiCeRbeg3An5LVouCxbVbxuLrUnBXkimPNOcWkN2w/Z
	 D8O0+qZIPG7dg==
Date: Thu, 9 Apr 2026 09:28:17 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dawid Glazik <dawid.glazik@linux.intel.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, linux-aspeed@lists.ozlabs.org, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Frank Li <Frank.Li@nxp.com>, Maciej Lawniczak <maciej.lawniczak@intel.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: i3c: Add AST2600 I3C global registers
Message-ID: <20260409-beneficial-sociable-tamarin-dbcaeb@quoll>
References: <cover.1775679285.git.dawid.glazik@linux.intel.com>
 <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <7f55458097ef651b4fc46650254afd3fa7b87348.1775679285.git.dawid.glazik@linux.intel.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_002820_830221_D4FCD522 
X-CRM114-Status: GOOD (  19.76  )
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

On Wed, Apr 08, 2026 at 10:34:35PM +0200, Dawid Glazik wrote:
> Introduce the device-tree bindings for I3C global registers found on
> AST2600 SoCs.
> 
> Signed-off-by: Dawid Glazik <dawid.glazik@linux.intel.com>
> ---
> I wasn't sure if I should add newline at the end of the
> file or not so I took
> https://github.com/torvalds/linux/tree/master/Documentation/devicetree/bindings/i3c
> as an example.

Answer is: you cannot have patch warnings.

Documentation/devicetree/bindings/i3c does not have patch warning, does
it?

> ---
>  .../i3c/aspeed,ast2600-i3c-global.yaml        | 55 +++++++++++++++++++
>  1 file changed, 55 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> 
> diff --git a/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> new file mode 100644
> index 000000000000..edecc18796a9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/aspeed,ast2600-i3c-global.yaml
> @@ -0,0 +1,55 @@
> +# SPDX-License-Identifier: GPL-2.0 OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/i3c/aspeed,ast2600-i3c-global.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2600 I3C Global Registers
> +
> +description: |
> +  The AST2600 SoC provides a shared I3C global register block used by all
> +  I3C controller instances. This block contains per-instance global

Why are you adding syscon to I3C controllers? Only I3C controllers go
to i3c directory.

syscons go soc.



> +  configuration fields, including controller instance ID and SDA pull-up
> +  configuration.
> +  Each I3C controller references this syscon node through the
> +  aspeed,global-regs property.
> +
> +maintainers:
> +  - Dawid Glazik <dawid.glazik@linux.intel.com>
> +
> +allOf:
> +  - $ref: /schemas/mfd/syscon-common.yaml#
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: aspeed,ast2600-i3c-global
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +

I do not see any differences against syscon.yaml binding. Why do you
need separate file? Look first how other platforms do it.

> +required:
> +  - compatible
> +  - reg
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    bus@1e7a0000 {
> +        compatible = "simple-bus";
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0 0x1e7a0000 0x8000>;

Drop entire node, not needed.

> +
> +        i3c-global@0 {
> +            compatible = "aspeed,ast2600-i3c-global", "syscon";
> +            reg = <0x0 0x1000>;
> +            resets = <&syscon ASPEED_RESET_I3C_DMA>;
> +        };
> +    };
> +...
> \ No newline at end of file

Patch warning.

Best regards,
Krzysztof


