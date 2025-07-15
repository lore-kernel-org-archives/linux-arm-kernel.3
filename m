Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FF9DC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:30:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Hu0yGJG0LwO2DBX4V21nxGgAsGdnnmybPDmLbyRYPYo=; b=UEmTwftsuIbMJxVz43S9Ynjmnq
	b7no2vsUAUt5JXJoFLiCla7lCVtzJSVavU5CRC2rhJLR0GYMqNAAbWC60C59IC1hNBqz6LNF+WLrO
	o6i/Pbg9wtQghT24ejaJKWh9yGTLG1VYIKhXGN1f/E4etzi6Bsn/tYlnrnfRJTQDBawJALpolVhOL
	fD33Dj5t4qcLXBeHmlKLLmtMqE7x+kpFrMIuQUiFC8THjoMo1mcW2fz4aSE8EMIOf+8gfOQeB1MF+
	M6YcClJlm9poNUzXzai3dIeJhpF0C+ePjrNXMwuFazTA65pL329qc8ZV1LXFnA6gA1I0YlS3S6w+8
	Y5NZCBcQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublLn-000000065Qa-0Pq4;
	Tue, 15 Jul 2025 19:30:03 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublJK-0000000653R-3shB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 19:27:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7220E5C659B;
	Tue, 15 Jul 2025 19:27:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F34A6C4CEFA;
	Tue, 15 Jul 2025 19:27:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752607650;
	bh=UbAz1GqPVvCjtUr3XivrE0+yy9OlU1DgIFHCkoZr2F0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=DWmUVlhEJyTIhNNbNXoknPcCv2JgREt9aBxfurJLY4Vsbppejc2iAUgwwBTsoPo5u
	 d/kjQb5dyNwV6rrvH0kwg8WgQEO5VeqXoxKNK0Et0Fh+5kR7WgGvZdj/NilYVnhJxC
	 eeJNk6QS2PrHWVP/uy4yvmHY8J1UoCkif087b1CP458dRS70h0Y1FDrfCKVIxehnbD
	 xzzSKZlvHu1fCmo+HbWI/CIwS6/sxhSFDXy4dCFpB/NP/mhwe4N9zKNZShwE5A6FS0
	 YN9Y9h33vrEXr4PhdEgV7c/GOstOLow4YE0uyFj+qSNB9An+R8TzZDxagsHV8EIaYc
	 diKnQUjHhcj/Q==
Date: Tue, 15 Jul 2025 14:27:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>, linus.walleij@linaro.org, 
 linux-gpio@vger.kernel.org, Will Deacon <will@kernel.org>, 
 florian.fainelli@broadcom.com, krzk+dt@kernel.org, svarbanov@suse.de, 
 wahrenst@gmx.net, iivanov@suse.de, conor+dt@kernel.org, 
 linux-arm-kernel@lists.infradead.org, mbrugger@suse.com, 
 devicetree@vger.kernel.org
To: Andrea della Porta <andrea.porta@suse.com>
In-Reply-To: <97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com>
References: <cover.1752584387.git.andrea.porta@suse.com>
 <97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com>
Message-Id: <175260764914.1776969.16903839575056957261.robh@kernel.org>
Subject: Re: [PATCH 1/7] dt-bindings: pinctrl: Add support for Broadcom STB
 pin controller
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_122731_052832_7492FC57 
X-CRM114-Status: GOOD (  14.39  )
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


On Tue, 15 Jul 2025 20:31:38 +0200, Andrea della Porta wrote:
> From: "Ivan T. Ivanov" <iivanov@suse.de>
> 
> The STB pin controller represents a family whose silicon instances
> are found e.g. on BCM2712 SoC.
> 
> In particular, on RaspberryPi 5, there are two separate instantiations
> of the same IP block which differ in the number of pins that are
> associated and the pinmux functions for each of those pins. The
> -aon- variant stands for 'Always On'.
> 
> Depending on the revision of the BCM2712 (CO or D0), the pin
> controller instance has slight differences in the register layout.
> 
> Signed-off-by: Ivan T. Ivanov <iivanov@suse.de>
> Signed-off-by: Andrea della Porta <andrea.porta@suse.com>
> ---
> This patch is based on linux-next/master
> 
>  .../pinctrl/brcm,bcm2712c0-pinctrl.yaml       | 123 ++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml: $id: Cannot determine base path from $id, relative path/filename doesn't match actual path or filename
 	 $id: http://devicetree.org/schemas/pinctrl/brcm,brcmstb-pinctrl.yaml
 	file: /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/pinctrl/brcm,bcm2712c0-pinctrl.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/97c650c9967c0c3381c383dfe68bbe6966912604.1752584387.git.andrea.porta@suse.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


