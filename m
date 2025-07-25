Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E96DBC87FCD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 07:38:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEBKrqUeEzwXrBEUWdwGDyrvG7xqwEQdSVNERLbH2iE=; b=JUXasH7BK5K7G7tqeNneO+MWYa
	WPLlJKx0cVpFRJkepZ1mXu+isEPfgHLNX0xwWz6QjE7NxvkttAnYcvBbkTehfGozjBsTKszbrgS8T
	nZulpogcc7K6Sovu7NhieA7afqkbLrLhQN1pnNkiDUp10ThcvqZIi/IcnXIrV8teaeDumryAI5OlI
	B2MmrRE72bL0pS7kPKS0qvPxHiIh6MBmEdrzKS5xBHKsy1it/oyysdqvmpMYwNfd03UebuNCMxAeQ
	Zd+2PrKrBe1Yft5RFeq66IvZjlZnLxrEL7F5VZj6vdKlQmO1Kb9TsCiHkChA7bSGZgmYE8Vw4hNZm
	MRDt8Mqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufD0Q-00000009H00-0Jtx;
	Fri, 25 Jul 2025 07:38:14 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufCo2-00000009Fqq-3grL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 07:25:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 48344601DC;
	Fri, 25 Jul 2025 07:25:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D1828C4CEE7;
	Fri, 25 Jul 2025 07:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753428326;
	bh=t6yI9W9ga2d5U86MGT4GedWz3RS3zaMqTHg3mi5MJtU=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=bx/k4h7/0kJYBlhEQVSht+043C0sEVgpEsRPYLKQWiLVmnTbJPWAr+KHTy/hYyJIi
	 qwiyuB8Y8/BgU1AqVuBIphEyLZcydKUM+/R49ZoIWTUAEJAquXda+czLEwhpKF/wWh
	 PA7Yu0pf6zA8QYTiYh8Lto9Gw6ZoUHBAHjv7AZwYJeYp3kpHjv7ktS02SshLBHZY74
	 MFZqRt3mGlqiKWoOfcSOfa1lgGm/OzC4EBxt0v1TeREA0+lD0dy+F0V4IeyXTvzYkd
	 00YIc+aln/jPDrvU08yJPBU1tIN2XFKojOL+7d1GUaiKIukguPsObThWPaUxT5P9M+
	 1nJrcY9n/nTuA==
Date: Fri, 25 Jul 2025 02:25:24 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, 
 Christophe Leroy <christophe.leroy@csgroup.eu>, 
 linuxppc-dev@lists.ozlabs.org, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Alexander Stein <alexander.stein@ew.tq-group.com>
In-Reply-To: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
References: <20250725055835.260930-1-alexander.stein@ew.tq-group.com>
Message-Id: <175342832496.81853.5141988537592299860.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: fsl: fsl,rcpm: reference
 power-domains.yaml
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


On Fri, 25 Jul 2025 07:58:34 +0200, Alexander Stein wrote:
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

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.example.dtb: global-utilities@e2000 (fsl,t4240-rcpm): $nodename:0: 'global-utilities@e2000' does not match '^(power-controller|power-domain|performance-domain)([@-].*)?$'
	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/soc/fsl/fsl,rcpm.example.dtb: global-utilities@e2000 (fsl,t4240-rcpm): '#power-domain-cells' is a required property
	from schema $id: http://devicetree.org/schemas/soc/fsl/fsl,rcpm.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250725055835.260930-1-alexander.stein@ew.tq-group.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


