Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EF5FC0218F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jan 2025 19:43:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCqn39LzVsAlXV/LBc9OzEQZSIC0ulssuwuBw8iClwU=; b=yX5I2h4XhQp/Bw95NRxtpg538R
	qiaOkSUMifs7YANfyAS8GSrl9NbH04IY+UD3Xl2nAPNV+/2WLJDDdlPybEdEJOEOo591gOXq5b83b
	xN7m+S7CxnH3mpthzT9dp9DUHiQbuailb6INuMs7SyReWyPw2zbaMLHqaA7hCIzyKns4UlV8ZeTZQ
	gEkWh7pHBC/rP14TWo4Yy8GUAJgRi47IVEupxX49H1PTiEdAVdp+dvPqKXenTd4RzatfgCr4pC+Lq
	W8vv2zgXlioSM85QEAU8jkCupiWAc3VvIyG+S7TbnvA0MnXICzq4nRZODRRHmpJnHNyR6jQ0ekqIj
	aXOXzHcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwvB-0000000BJSA-1cpz;
	Fri, 31 Jan 2025 19:43:21 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdwtr-0000000BJHS-2Xhd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jan 2025 19:42:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 11773A424C0;
	Fri, 31 Jan 2025 19:40:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B833BC4CED1;
	Fri, 31 Jan 2025 19:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738352518;
	bh=XWzFnKPzYR4DVPFYN8XLbs3QmiWQpk5rnJJzQjkDw2I=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=plWHxWEbMJC1F4ABC8O3Gl2FOnbL/u4d9cUPGSpuFfwQ/fJ2Kr2SaZplBJPsOrnsd
	 BAFbx0QofgJQ0XU9Fp7s0FpsXvx5AZOsk585hZ1O/tQH4gs+kzjC5a0RNxYlRI4Etw
	 H6V8T5/auDeMMmErrm3vRjbb3OiVola9vy4QJjgE2i4LOavG/TKJ5HWyY7VGJsisTr
	 C7uTf505KGrR3m7n3O4jAFSe6d6uEc8ovXVae2mDANozhRgkHzQYGjJdBdDH0WIZg5
	 WXXA/Qqo0V3nufyEDeqofdp0ZhTB2+PZx3gOeIVGkKSI7XlhQE/W2p2dDvwkNHej9Z
	 ZI5xjqzd4uuYw==
Date: Fri, 31 Jan 2025 13:41:56 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
 Liam Girdwood <lgirdwood@gmail.com>, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, Ray Jui <rjui@broadcom.com>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Florian Fainelli <florian.fainelli@broadcom.com>, 
 Scott Branden <sbranden@broadcom.com>, linux-kernel@vger.kernel.org, 
 ~postmarketos/upstreaming@lists.sr.ht, Mark Brown <broonie@kernel.org>, 
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Stanislav Jakubek <stano.jakubek@gmail.com>
To: Artur Weber <aweber.kernel@gmail.com>
In-Reply-To: <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
References: <20250131-bcm59054-v3-0-bbac52a84787@gmail.com>
 <20250131-bcm59054-v3-2-bbac52a84787@gmail.com>
Message-Id: <173835251253.3936353.15748613970933991457.robh@kernel.org>
Subject: Re: [PATCH v3 2/7] dt-bindings: mfd: brcm,bcm59056: Add compatible
 for BCM59054
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250131_114159_789289_751BC132 
X-CRM114-Status: GOOD (  13.32  )
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


On Fri, 31 Jan 2025 19:13:50 +0100, Artur Weber wrote:
> The BCM59054 MFD is fairly similar to the BCM59056, and will use
> the same driver. Add compatible and specify the allowed regulator
> nodes.
> 
> Signed-off-by: Artur Weber <aweber.kernel@gmail.com>
> ---
> Changes in v3:
> - Split regulator node into separate file
> - Removed quotes around compatible
> ---
>  .../devicetree/bindings/mfd/brcm,bcm59056.yaml     | 26 +++++++++-
>  .../bindings/regulator/brcm,bcm59054.yaml          | 55 ++++++++++++++++++++++
>  2 files changed, 79 insertions(+), 2 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(cam|sim|mmc)ldo[1-2]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(rf|sd|sdx|aud|mic|usb|vib|tcx)ldo$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(c|mm|v)sr$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^(io|sd)sr[1-2]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^gpldo[1-3]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: ^lvldo[1-2]$: Missing additionalProperties/unevaluatedProperties constraint

/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/regulator/brcm,bcm59054.yaml: vbus: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250131-bcm59054-v3-2-bbac52a84787@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


