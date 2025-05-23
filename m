Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5767C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 May 2025 20:32:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=y4IcnoNB2qpQDzQD4l6QkZzwSVzCMDGSPU6SIb+ViEk=; b=UytdKkgqt5yCvMf3MxcambR/69
	8VkbE5Lw2VVbd+XEAKUPTFApm1db6utHXbQTa+B4bmYGlNn445+vhJzDbfZP84vDMHyEI83InOYma
	wuJ8yWDX8RRXAoLuoQXgIcXBl5Jzt5aD2FBBYmY0dUKlAbuoznTfELfPWClt/ZC3HYORL6nehvbd0
	+d0k3xhrU2qpDqGEVLg7IDBm5E5vxUCQFb5b5Q0xG0thpYxRWwXOtz/pjQ7S0bu4+cYjEosgdz5tn
	8KnX0Jf/Cy5GnMHRTEmckFNvuw5RxAZgE5HtE2cUtiKaVVu8KbSADFLT2SUatu2s8/ax9KdnMAUNA
	HBg1d2Rg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIZ4S-00000004seM-2Xvy;
	Fri, 23 May 2025 20:32:48 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uIYzo-00000004s9y-2Z44
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 May 2025 20:28:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B351D61154;
	Fri, 23 May 2025 20:27:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9CA4C4CEE9;
	Fri, 23 May 2025 20:27:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748032079;
	bh=5pRFCoeXqhY0UnsQRr8ozHb8xSRhaMoVu7vfsBGA6tA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=UNkc/+PCjIXYzEG7BSY6uIKfD3quwXneLAnthfgZi+klBMDAvmu/IHcGb+5R68ESc
	 bork2SiHf4qJBO05XZNcaqs0OsaQhONpUIJWGu2UxhsSUfjHHbxmePycm1yW21N2NP
	 /QhalNQgaXSJ6hRMGJYd87619xZb5QM+Lsp8s8fknQyWuUujhxppPvBq/sKFQjY+t/
	 Fabg9htfgMbgGXHQ9/HsSgd+MAtEIKAXzitiokDAnKrPONhEV5DKSyS0Lr1il1ITyz
	 Ax8gSrAFfZRGkNXpFt9AIcPEq6z7Igd6hnX4TBGk7/c9nxC7okYDUiBQFuXNZp5FkJ
	 bMDv7+8JCz4wg==
Date: Fri, 23 May 2025 15:27:56 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Conor Dooley <conor+dt@kernel.org>, 
 Lee Jones <lee@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Shawn Guo <shawnguo@kernel.org>, linux-arm-kernel@lists.infradead.org, 
 linux-kernel@vger.kernel.org
To: Frank Li <Frank.Li@nxp.com>
In-Reply-To: <20250523191844.563177-1-Frank.Li@nxp.com>
References: <20250523191844.563177-1-Frank.Li@nxp.com>
Message-Id: <174803207693.2936926.13970067014189882058.robh@kernel.org>
Subject: Re: [PATCH 1/1] dt-bindings: mfd: convert mxs-lradc.txt to yaml
 format
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


On Fri, 23 May 2025 15:18:43 -0400, Frank Li wrote:
> Convert mxs-lradc.txt to yaml format.
> 
> Additional changes:
> - Only keep one example.
> - Change node name to adc.
> - Add clocks and #io-channel-cells.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../bindings/mfd/fsl,imx28-lradc.yaml         | 85 +++++++++++++++++++
>  .../devicetree/bindings/mfd/mxs-lradc.txt     | 45 ----------
>  2 files changed, 85 insertions(+), 45 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.yaml
>  delete mode 100644 Documentation/devicetree/bindings/mfd/mxs-lradc.txt
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/mfd/fsl,imx28-lradc.example.dtb: fake-interrupt-controller: #interrupt-cells: 9 is greater than the maximum of 8
	from schema $id: http://devicetree.org/schemas/dt-core.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250523191844.563177-1-Frank.Li@nxp.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


