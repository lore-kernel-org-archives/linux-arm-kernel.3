Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 275D7C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 00:05:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEoNHc30Ygmr289YdjGDZczw1IEztTdjdBUILej6wz4=; b=qAKnCRM1ZZS+NmiQ2sTaljtcEA
	iGDFnBzcEgeVPKiyl37cv1XOZFmqL8Bp7zyDvz2WQgRafA83ifxtyjB0rHyrGCajKqG3YDUH4cdgN
	8TwtBNDv/vEhmUIaJmKY/cyxcV/GH1ABUEeSJRUT+WZ+MHjsj284NJIj1C4qlyVxbiXz1YtTmZ0bu
	lmeCPCslqueDbz7DqkdwRkc3KMaDEnm3sLNV8w0vyEjliwby4BOj5q8FjUIB9912ota1azmfSnNUI
	XWbiadbQMFdkg5wKQ3lkAjfo7la/92J4i9v7hpnKUvfzbO/L+cY8b9co30SVjW6wUKszuShtPjSrg
	x/6A+6OA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkW55-00000000p34-1fBL;
	Fri, 17 Jul 2026 00:05:31 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkW53-00000000p2t-3hAV;
	Fri, 17 Jul 2026 00:05:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3876642BC6;
	Fri, 17 Jul 2026 00:05:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC2AF1F000E9;
	Fri, 17 Jul 2026 00:05:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784246729;
	bh=sEoNHc30Ygmr289YdjGDZczw1IEztTdjdBUILej6wz4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=Qj9VpqiE7Ehhepu7zWi+9PbZsbi59beWQkYoECAliq5e4+wWKH2n0iPvrXYpZRi/K
	 rzeEaq5gzlAHbtjO7LbfnCd9G8YF7KuOpuQ+dz2MJe9DA7gG6IAvzU2K3D7di4HVVX
	 PQ3HTDjfX4Gcmzzx03a55aJ5sArxua82yjuRTNNX4dDG1pHBLjgtMKpWMxqxehvG94
	 +JAS2xjtyWfvhzV2BoH23Z2Sjqtc1x2PT4XNH10XvgIZYVEABSKlN+hcQpKn7YddnD
	 sB3HWd7E4ot5mlPuvDpDWNsBF7lm6v2Kh3Ea76/xut4i0zQkf+lwIUvPL6JiW/FTHq
	 GgTK9QCF5tuOg==
Date: Thu, 16 Jul 2026 19:05:28 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Philipp Zabel <p.zabel@pengutronix.de>, 
 Russell King <linux@armlinux.org.uk>, linux-phy@lists.infradead.org, 
 Stephen Boyd <sboyd@kernel.org>, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 Michael Turquette <mturquette@baylibre.com>, 
 Brian Masney <bmasney@redhat.com>, Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Vinod Koul <vkoul@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-clk@vger.kernel.org
To: =?utf-8?q?Stefan_D=C3=B6singer?= <stefandoesinger@gmail.com>
In-Reply-To: <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
References: <20260717-zx29clk-v7-0-408411cfcf36@gmail.com>
 <20260717-zx29clk-v7-1-408411cfcf36@gmail.com>
Message-Id: <178424672694.2081810.9844688000925078533.robh@kernel.org>
Subject: Re: [PATCH v7 01/13] dt-bindings: phy: Add zx297520v3 USB phy
 documentation
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


On Fri, 17 Jul 2026 00:35:37 +0300, Stefan Dösinger wrote:
> This binding will be used as a subnode of topcrm, which will be added in
> the next patch.
> 
> Why is this a child node and not #phy-cells added to topcrm itself,
> like clocks and resets as writing-bindings.rst suggests? Because
> of_phy_provider_register checks if the of_node the PHY provider is added
> to belongs to the device or is a child of the device, so I can't put the
> PHY driver into an MFD (or AUX) child without its own node.
> 
> Signed-off-by: Stefan Dösinger <stefandoesinger@gmail.com>
> 
> ---
> 
> How do I handle examples? It would be identical to the example in
> topcrm. The example needs the reset defines from the next patch in
> either case.
> ---
>  .../bindings/phy/zte,zx297520v3-usb-phy.yaml       | 96 ++++++++++++++++++++++
>  MAINTAINERS                                        |  2 +
>  include/dt-bindings/phy/phy-zte-zx297520v3-usb.h   | 12 +++
>  3 files changed, 110 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: /example-0/clock-controller: failed to match any schema with compatible: ['zte,zx297520v3-topcrm', 'syscon']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/phy/zte,zx297520v3-usb-phy.example.dtb: clock-controller (zte,zx297520v3-topcrm): 'reg' is a required property
	from schema $id: http://devicetree.org/schemas/mfd/syscon-common.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260717-zx29clk-v7-1-408411cfcf36@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


