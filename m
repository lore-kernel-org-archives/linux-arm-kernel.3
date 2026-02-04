Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E22DE95397
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 12:36:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6yEKI73VKLvzDqr7uSAMuMxn+tuw5FrM4zMLUDwTa88=; b=CNvilfm7ocQ08worwJg8KZNaP+
	wypXxn7fozAGdZjjf1qjYx6hX2LnQ9/ecRnDnRUf/cJ2fDtmmXermKKyo+efTzOiBZ9BUcqRU5sjK
	xjp7W2bhYfJ6pAZ55CPOv/XRr7LXAISMbFEN2L0eKQYn0ipQ2eAuBq0wKjc9eZXruz0r2soD2ELWm
	ZYIKjuVzPCb/XP+yqFbxc7Hybo+nOwL/1ZbTJeCexyKBlcALRK4Wn3WQ9ihWcncxiUTIgQ7CAgihr
	Ere6xt/iEUlpr8etAlqq5mrslAHEdcyOMcmw9RGldM5t/4ybuOMtKQO1g5uwTAwvhtH/QmT80l7TV
	/dtaH1Zg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnc7X-00000008S4L-2hVv;
	Wed, 04 Feb 2026 12:36:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vnc7W-00000008S4C-1oyd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Feb 2026 12:36:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8B5BB60126;
	Wed,  4 Feb 2026 12:36:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1E12EC4CEF7;
	Wed,  4 Feb 2026 12:36:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770208593;
	bh=WlKEmANlhoeYrCXJWHvB6TEn3KZY7nVZyZZFjxfGCjA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=or6ep/MUEO7Rkex66GhNLO9OYipPgu06PJg7NW/33ibtdHH2m02TsTdiDhyX/l6Z5
	 wfssj/Rje5IF9rfnvmQVVuos8Tjoq1FN4NWlMRDNtdGlhN9pySdaJCYij1o71WX/VL
	 tOCqh0Q1I536ccACHHrUKCFgUELVz07w7e/A6vhnq18KJhdj8E5/3wrupaIqZ2NfU3
	 alXciDDqmylM3kHTmk8kKltFlhss3RTZPU0zJGUN9UQYgE63ThKVbA4Mege2wQR+AW
	 5LpTgEupm+VahhqVNdHaAE/NJEBFf6TxQvOL5ih70zBTa5+MLzyzo7NTtRpjD4XZ2L
	 /423lnRjms8yg==
Date: Wed, 04 Feb 2026 06:36:32 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, Li Jun <jun.li@nxp.com>, 
 Thinh Nguyen <Thinh.Nguyen@synopsys.com>, Shawn Guo <shawnguo@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-kernel@vger.kernel.org, 
 Frank Li <frank.li@nxp.com>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-usb@vger.kernel.org
To: Xu Yang <xu.yang_2@nxp.com>
In-Reply-To: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
References: <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-0-d2c9b5a58c01@nxp.com>
 <20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com>
Message-Id: <177020859226.1501535.7850161479548058687.robh@kernel.org>
Subject: Re: [PATCH v2 1/3] dt-bindings: usb: introduce fsl,imx-dwc3
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


On Wed, 04 Feb 2026 19:06:16 +0800, Xu Yang wrote:
> The i.MX USB glue and DWC3 core are closely coupled. Describe the i.MX
> USB block in a single block will bring more benefits than a parent-
> child relation. The new binding is a copy of fsl,imx8mp-dwc3.yaml with
> the needed modifications.
> 
> Add the common compatible string "fsl,imx-dwc3" to indicate that the
> flattened module should be selected. This compatible is also used by
> "select" to inform the DeviceTree validator to apply this binding.
> 
> To avoid redefining all the platform-specific compatibles, "select" is
> used to tell the DeviceTree validator which binding to use solely on the
> generic compatible.
> 
> Mark fsl,imx8mp-dwc3 deprecated, to favor expressing future platforms
> using the new combined binding.
> 
> Signed-off-by: Xu Yang <xu.yang_2@nxp.com>
> 
> ---
> Changes in v2:
>  - reorder compatible property
> ---
>  .../devicetree/bindings/usb/fsl,imx-dwc3.yaml      | 131 +++++++++++++++++++++
>  .../devicetree/bindings/usb/fsl,imx8mp-dwc3.yaml   |  13 ++
>  2 files changed, 144 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/usb/fsl,imx-dwc3.example.dtb: /example-0/usb@4c100000: failed to match any schema with compatible: ['fsl,imx943-dwc3', 'fsl,imx-dwc3']
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/usb/fsl,imx-dwc3.example.dtb: usb@4c100000 (fsl,imx943-dwc3): compatible:0: 'fsl,imx943-dwc3' is not one of ['fsl,imx8mp-dwc3', 'fsl,imx94-dwc3', 'fsl,imx95-dwc3']
	from schema $id: http://devicetree.org/schemas/usb/fsl,imx-dwc3.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260204-add-flatten-dts-based-dwc3-imx-driver-v2-1-d2c9b5a58c01@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


