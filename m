Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2195FC71133
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 22:48:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8U6h7ncY/MwCmSVe+Wtej5xxIXsGESOex37GZfZMrAo=; b=Zur57qfqTWk3bPD6/UOBjy/eE4
	Df1nBDEROJiVS/34B8XbkMxXyiraKmpFTwI8rfw9rtwor6KQ2xIhgtMO0j/uwJp4TI+n7fi6YgM/T
	PeOn2DVNuGi/F60rLMzeBc1uHRiGUzJJpLuYIIb4l2yedwpovgrUDSqXF6DcRZK4i3B1wY2wsIXHo
	6gjzmO6dJFEYjRoaXT4A7A1hTU9w1CznuAGc/yXb1TrN5SOjctcZlswuHB/3wHQX+26nGb/UL4AGp
	asA3zwoR2y+7U6dOm6gEFby1ImCfswgAB6sdHXcGu9Ox2nQbTUA9tGAwxAUlWe/aZjf/0B1NBmeO6
	kJt37Gtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP7lV-00000008FC2-34Ru;
	Tue, 10 Jun 2025 22:48:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uP3OZ-00000007lCb-1edq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 18:08:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C261B447AF;
	Tue, 10 Jun 2025 18:08:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4B3EC4CEF0;
	Tue, 10 Jun 2025 18:08:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749578902;
	bh=EqLBaFrOMBGQ7zuSKchgyUU5IO7yC/PR2AFrIa0Lguc=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=C4X6YtvxjNpCzlR1Bfd/uK4KIHTn08RKsw9h+sQqFVu++ch1HzPm5Sb7a0LUKSFCr
	 zcGersk+Ab0EW6D/F8A/Fqy6EBrSjCeqoL4aJtCGzalh8XdjGLuiIDbMjU4J/PDxeF
	 e09b/Z6WmqyICn8P2i4nTOMONatoAGYiehJmX8VqkuJsA0LUuVoMgHez5j1RrBDleM
	 ikKLTWU1MTN6SZjSZBSWCSFqmgHyu+fwaTO/R53MExZCiP7gsejtuvFTHiTb0gmNhd
	 gp4Xqno3mkhXX9cA1CfLRRrCEbg1gW3vmV2u0QgbuMkVhNGHoS+MXEANOfRRphhd7G
	 ymwpq6B1xElpA==
Date: Tue, 10 Jun 2025 13:08:18 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Marco Felsch <m.felsch@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, 
 Daniel Baluta <daniel.baluta@nxp.com>, Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 linux-kernel@vger.kernel.org, Sascha Hauer <s.hauer@pengutronix.de>, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, devicetree@vger.kernel.org, 
 imx@lists.linux.dev, Shawn Guo <shawnguo@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Alexander Stein <alexander.stein@ew.tq-group.com>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
In-Reply-To: <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
References: <20250610160152.1113930-1-laurentiumihalcea111@gmail.com>
 <20250610160152.1113930-2-laurentiumihalcea111@gmail.com>
Message-Id: <174957889856.2397515.16063954809229071708.robh@kernel.org>
Subject: Re: [PATCH v7 1/6] dt-bindings: bus: document the IMX AIPSTZ
 bridge
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_110823_450628_CE091070 
X-CRM114-Status: GOOD (  10.58  )
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


On Tue, 10 Jun 2025 12:01:47 -0400, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add documentation for IMX AIPSTZ bridge.
> 
> Co-developed-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Daniel Baluta <daniel.baluta@nxp.com>
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../bindings/bus/fsl,imx8mp-aipstz.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/bus/fsl,imx8mp-aipstz.yaml: oneOf: Missing additionalProperties/unevaluatedProperties constraint

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250610160152.1113930-2-laurentiumihalcea111@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


