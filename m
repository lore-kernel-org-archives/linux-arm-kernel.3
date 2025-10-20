Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 037E4CCD199
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:05:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7JE+keQ4M3ivcIq7wJfW64GCLs+xNRVR0ZadECIBy00=; b=2u9Dy85oTnB0Nqc/G8cDtDNUUq
	LM92xi84bssKm1kPWFcCTKXrsAzFsZyZS9XCeJtrUct6JDENEH7ilQqdtq2vTH3ujoZ1/eJE+27lF
	d2s93pNAM6glFzH8+/WDxfrNnSpxRcskRU4cQgkSiPob+srizg/wp8WzgzNY+z+5iUt4h1sg7ScwD
	iSCxwA7Clrpi/6SkgzMHrPEFQ1v+KA72cbwhmf3VAVi0QySQ58RXzPGO0VmtVBPozfrZ6Z4IXwiuI
	8RVZyDVW4SvUbo26Vh7CD5Xhi7bXNOnxn4NIVEHhYsWUwMieJ2gxVsUvk6w3NeJigGnkXZmNV6+I6
	noeSNt3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAodz-0000000DIoK-2nN8;
	Mon, 20 Oct 2025 12:05:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vAody-0000000DInv-3gTX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:05:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 01DAB61EA5;
	Mon, 20 Oct 2025 12:05:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69F1BC4CEF9;
	Mon, 20 Oct 2025 12:05:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1760961941;
	bh=E4WIZb94VFhTqzi+aDX1vJifr1WIC9U+ZUXLJ7Ld2B4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=Y6d3ZFZQusyCn275mQM8m6fv+vlFbWdyQgK1qBx2RBm2w129gB3UGUUQqJrI1KbGh
	 dRLa8UTq7a2oN/8opFrWdcm7Tmjms5qQrNAlh/mBdBEN8ROsQ36K5Oirlzl9ZRhf/H
	 D01z3n2KpP0z+dCVufJVd9WShC1ESdYlxjefVp+CCApYiBlBIg0XnkeLuc+2RT49Gs
	 I2058kerY79xlKJkPvBYin5SSweaQrZH0AA9JLeoVAwCVOG8BtWcra57gnbQ8KCYFy
	 QfwFwrGGzqigceRLR+dkPdwH50dkcrl85WIsNpvuH9QfUx3BWm8WDdx+dURU11Roc2
	 sC9/lMNiMJs/w==
Date: Mon, 20 Oct 2025 07:05:39 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>, 
 Yao Zi <ziyao@disroot.org>, linux-kernel@vger.kernel.org, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>, 
 Chen Wang <unicorn_wang@outlook.com>, sophgo@lists.linux.dev, 
 Vivian Wang <wangruikang@iscas.ac.cn>, Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Eric Dumazet <edumazet@google.com>, Russell King <linux@armlinux.org.uk>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, netdev@vger.kernel.org, 
 Yixun Lan <dlan@gentoo.org>, 
 "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>, 
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 linux-stm32@st-md-mailman.stormreply.com, Longbin Li <looong.bin@gmail.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Heiner Kallweit <hkallweit1@gmail.com>, 
 "David S. Miller" <davem@davemloft.net>
To: Inochi Amaoto <inochiama@gmail.com>
In-Reply-To: <20251020095500.1330057-2-inochiama@gmail.com>
References: <20251020095500.1330057-1-inochiama@gmail.com>
 <20251020095500.1330057-2-inochiama@gmail.com>
Message-Id: <176096193973.211044.5323192704803945227.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: net: sophgo,sg2044-dwmac: add phy
 mode restriction
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


On Mon, 20 Oct 2025 17:54:57 +0800, Inochi Amaoto wrote:
> As the ethernet controller of SG2044 and SG2042 only supports
> RGMII phy. Add phy-mode property to restrict the value.
> 
> Also, since SG2042 has internal rx delay in its mac, make
> only "rgmii-txid" and "rgmii-id" valid for phy-mode.
> 
> Signed-off-by: Inochi Amaoto <inochiama@gmail.com>
> ---
>  .../bindings/net/sophgo,sg2044-dwmac.yaml       | 17 +++++++++++++++++
>  1 file changed, 17 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/net/sophgo,sg2044-dwmac.yaml: allOf:1:then: 'anyOf' conditional failed, one must be fixed:
	'phy-mode' is not one of ['$ref', 'additionalItems', 'additionalProperties', 'allOf', 'anyOf', 'const', 'contains', 'default', 'dependencies', 'dependentRequired', 'dependentSchemas', 'deprecated', 'description', 'else', 'enum', 'exclusiveMaximum', 'exclusiveMinimum', 'items', 'if', 'minItems', 'minimum', 'maxItems', 'maximum', 'multipleOf', 'not', 'oneOf', 'pattern', 'patternProperties', 'properties', 'required', 'then', 'typeSize', 'unevaluatedProperties', 'uniqueItems']
	'type' was expected
	from schema $id: http://devicetree.org/meta-schemas/keywords.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251020095500.1330057-2-inochiama@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


