Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88386C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:35:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJu86Ld8XnTBZH5sZa1vlfZEborsNw+EF8dWwLK5Ra0=; b=liVakb0WigzxRiHvbsV3Dbc9JR
	ximJ58qWOH65OPEWpXoBbVZ5HOEcrycwM7BemMcTpm4VGmwCVVt+XAsicJhEi93p41sEjcGQMOWFU
	ue+7t3SqQU3HV3YgIPew7P8NhsHdxb/jtFH56HDP1T3Fe/Mz6SpS7RqSQ/qp+YGi2EWltAAdupKCA
	3YsfO2wnHD7+hUsaiTc99tDtcN3Y+LywdByPykaiZ6TrtpTV/Y14Fg8oKdB3U8HFv9Fq9OXfl0let
	pN4OooIPY9dxMg6zv4XaltF4mJhh3mXiktOv0+BF2iI940qIU9+ZPNpRgfKer/J8c3ARW8Cq5ZdhR
	0XOG1S9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Wf-00000005rXz-3QGC;
	Tue, 22 Sep 2026 15:35:21 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92WX-00000005rVL-1ysr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:35:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BCC6960DFF;
	Tue, 22 Sep 2026 15:35:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3FBCE1F000FF;
	Tue, 22 Sep 2026 15:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091312;
	bh=qJu86Ld8XnTBZH5sZa1vlfZEborsNw+EF8dWwLK5Ra0=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=VGaf6fuPEs+fxknL+LWvY8Ddh2s5HsZrAcbSCbhvXY1Q21YQw/C2tg8oAtLptzDzc
	 jiE9YRhok3zN6XksBeisZ5S73fSs2eDXZZYkqxfhpSTIV3JDoXT6QAhUsohrJpczN7
	 EQUttGxwq1El5IDFC2suL22X0/uf7ApuXGMcNddZQrpylfRwlGPJTinJu4myn+3KRE
	 lPs1UROEPRfTVmTAA92U7IkpnEWW/lom7CeUn7ng7hZLh48gnifsLKsw+ht0OlVtFD
	 tIbOIi29yUJubmBPdrw72JrYsKFe2pAp+O2uxPLViCvPbjKOcZbmh5atdDhuhZJvA6
	 2ZpK1v2hJFZ/A==
Date: Tue, 22 Sep 2026 10:35:11 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, conor+dt@kernel.org, 
 lgirdwood@gmail.com, devicetree@vger.kernel.org, broonie@kernel.org, 
 perex@perex.cz, krzk+dt@kernel.org, tiwai@suse.com, 
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 p.zabel@pengutronix.de, linux-sound@vger.kernel.org
To: joakim.zhang@cixtech.com
In-Reply-To: <20260922112134.4167305-2-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-2-joakim.zhang@cixtech.com>
Message-Id: <179009091064.3383676.14654535260595852559.robh@kernel.org>
Subject: Re: [PATCH 1/4] ASoC: dt-bindings: Add Cadence I2S-SC controller
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


On Tue, 22 Sep 2026 19:21:31 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-SC controller integrated in
> the CIX SKY1 audio subsystem. I2S-SC is a full-duplex stereo
> controller supporting standard I2S, left/right-justified and DSP
> formats, plus TDM operation with up to 16 slots.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-sc.yaml       | 94 +++++++++++++++++++
>  1 file changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.example.dtb: /example-0/dma-controller: failed to match any schema with compatible: ['cix,sky1-audss-dmac']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922112134.4167305-2-joakim.zhang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


