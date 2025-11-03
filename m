Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D61E9CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Nov 2025 21:25:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Qf276MKOWYaVhINs/p8zybkSkBjDSz0zV/KLznmnz7Y=; b=wHBcXfAkvm8ZaRED+2K2yBJ921
	+MnUCH0cToS7ZaCAOlDCxw0U9yh5ouGD9ekHjpOKYxUJDt8yXR7yGCOFZjABPlzcZ9nO4AeiOIGXQ
	iyJuZWCGCpymeiZUYojlsy4HFHdvjEwZmxAabaw51FEdLpnAS2/oMnpaiVnsgJGQCBPRp98z3iWqJ
	NK9V3kVtbAO4qV72xSIGSeG43rnvKDf/t0H+R7v+VRkKSzkl+Cre/DHB86+f4rMPgDFEuqiPHlcSi
	8QiDoMYfHmnJI7Q0fFZQeMFwXgPkuRdif9BVkOGRgJOE6PYlgX5mLO4bZx/AhMB1hEnjyddghwcfs
	/dn6yq7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG238-0000000AeCs-1Ph7;
	Mon, 03 Nov 2025 21:25:14 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vG235-0000000AeCR-0BiL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Nov 2025 21:25:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8DD474419A;
	Mon,  3 Nov 2025 21:25:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9BE0C4CEE7;
	Mon,  3 Nov 2025 21:25:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762205104;
	bh=5SW+M+piEdcut7wiZauOpMLcAQB1GEqW+ZFiV8x/4ns=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=M3O0vVKurqo7mlr+paY9tACQTmH5nqB6A04gSAEo9iIeKvDyVXKS7NYXEaTQ96Byz
	 4eX21Rnuuw1qVwzeG/MWUvMnVg82mVX04J4ha+MQEFCcxGHuBZ+f2MpUP3nea9cIBp
	 Nc17otO3497TIo1YfTnmy8gfSvFeHiRsUEIZm9c6cOfqaFcPG3utA/IDfoCuuMMIJd
	 W97wX9guG62HdhlrVYzO6F08ctijcGTLgrH/oQYye0Evm2EKQHrJ9UApdI5dUtDxvX
	 CMvjQcUMSrEpTGN/aK5qFdx93/Ec7zYDozXTphoukr19N3AlxUMS83X/kWbMfMyzW6
	 Vm7aCsox7sAUw==
Date: Mon, 03 Nov 2025 15:25:03 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Frank Binns <frank.binns@imgtec.com>, David Airlie <airlied@gmail.com>, 
 Magnus Damm <magnus.damm@gmail.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>, 
 Thomas Zimmermann <tzimmermann@suse.de>, 
 =?utf-8?q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>, 
 devicetree@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 Conor Dooley <conor+dt@kernel.org>, linux-renesas-soc@vger.kernel.org, 
 Simona Vetter <simona@ffwll.ch>, Maxime Ripard <mripard@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, Matt Coster <matt.coster@imgtec.com>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
In-Reply-To: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
References: <20251103200800.173440-1-marek.vasut+renesas@mailbox.org>
Message-Id: <176220510312.151857.16110569802113794225.robh@kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: gpu: img,powervr-rogue: Document
 GE7800 GPU in Renesas R-Car M3-N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251103_132511_146336_9111E683 
X-CRM114-Status: GOOD (  11.77  )
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


On Mon, 03 Nov 2025 21:07:35 +0100, Marek Vasut wrote:
> Document Imagination Technologies PowerVR Rogue GE7800 BNVC 15.5.1.64
> present in Renesas R-Car R8A77965 M3-N SoC.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@mailbox.org>
> ---
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: David Airlie <airlied@gmail.com>
> Cc: Frank Binns <frank.binns@imgtec.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: Matt Coster <matt.coster@imgtec.com>
> Cc: Maxime Ripard <mripard@kernel.org>
> Cc: "Niklas Söderlund" <niklas.soderlund@ragnatech.se>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Simona Vetter <simona@ffwll.ch>
> Cc: Thomas Zimmermann <tzimmermann@suse.de>
> Cc: devicetree@vger.kernel.org
> Cc: dri-devel@lists.freedesktop.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
>  .../devicetree/bindings/gpu/img,powervr-rogue.yaml          | 6 ++++++
>  1 file changed, 6 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:
./Documentation/devicetree/bindings/gpu/img,powervr-rogue.yaml:107:1: [warning] too many blank lines (2 > 1) (empty-lines)

dtschema/dtc warnings/errors:

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20251103200800.173440-1-marek.vasut+renesas@mailbox.org

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


