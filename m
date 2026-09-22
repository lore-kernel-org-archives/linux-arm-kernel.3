Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 70AB5C982FA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 15:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l0v14wN/DvIVEXrfeeixUuljRDiJFlaL5YhfUPp5MGg=; b=naMIAJgC4cjgs9nyL34/hC1H+e
	fqv6IRaVP/QUws5byvZuti3w0nctgpVAKr/dy43Vd2G5DSoiTLoBTvs5J7U4gdQRMhglvufoReOZS
	gNgTR4T/0km3DF4eRkUG5wnqz18qvw27o736Z8Mr7/eXuq1wLSuD17nrL6fh2LTi9hgIl8Xy2SZ3k
	FUIPL6DgehfLrnQQNaedL9psIeAJbw3Rq0f0rrfnlmHvvAo9l3lWy3+YOLSoO+B1Ya3/gYoY2eD3S
	fhQX1LlsRfPhR3jwZQl7goYZ5u6TWoiwjNO93GUVQd+5uMjRlwPGZFrNRO1vF7VkvpvuNY19q08lq
	RXaa99AQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92Wf-00000005rYC-3pyg;
	Tue, 22 Sep 2026 15:35:22 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x92WY-00000005rVe-0akP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 15:35:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B7BE544519;
	Tue, 22 Sep 2026 15:35:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67D1C1F00893;
	Tue, 22 Sep 2026 15:35:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790091313;
	bh=l0v14wN/DvIVEXrfeeixUuljRDiJFlaL5YhfUPp5MGg=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=FAEuAuUn7kgoyZZ5n2Ox49MDzAdPBYxMURL/+BCnLWgBGp3kM2N5Ov5hzVAm5GnW0
	 bXGEil0Yiot1b8wRlwG/cD3mqBpEEaugJZ3dHLjjclotRwwecwJwQMIicScFoR6CMG
	 UjhGV9ooobke83LAdjenFv6oZQT9nTYoIef3dgM0dQkWdbTvg5roJrjmpuZUqPbpWJ
	 /yeprhGcOEwvD+DvumQLp753vt01BUoJWTFX3kJ6PbjheWdRKufgwQ069vDXW0sLXb
	 E46tU47X/251YQSxrzr2YNuehN9c/zL/gx9uVwJZUV83IuBc37GMduyggKYy4RzHQR
	 T/e1aJAx8ka5g==
Date: Tue, 22 Sep 2026 10:35:12 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: devicetree@vger.kernel.org, broonie@kernel.org, tiwai@suse.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-sound@vger.kernel.org, cix-kernel-upstream@cixtech.com, 
 perex@perex.cz, lgirdwood@gmail.com, krzk+dt@kernel.org, 
 p.zabel@pengutronix.de, conor+dt@kernel.org
To: joakim.zhang@cixtech.com
In-Reply-To: <20260922112134.4167305-4-joakim.zhang@cixtech.com>
References: <20260922112134.4167305-1-joakim.zhang@cixtech.com>
 <20260922112134.4167305-4-joakim.zhang@cixtech.com>
Message-Id: <179009091298.3383748.7497658110500328179.robh@kernel.org>
Subject: Re: [PATCH 3/4] ASoC: dt-bindings: Add Cadence I2S-MC controller
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


On Tue, 22 Sep 2026 19:21:33 +0800, joakim.zhang@cixtech.com wrote:
> From: Joakim Zhang <joakim.zhang@cixtech.com>
> 
> Add the DT binding for the Cadence I2S-MC multi-channel controller
> integrated in the CIX SKY1 audio subsystem. The controller exposes a
> transmit DAI and a receive DAI and moves audio through a configurable
> set of its 8 data pins. Which pins are wired out and in which
> direction is fixed by the board design and described by the
> cix,pin-out-num, cix,pin-rx-mask and cix,pin-tx-mask properties.
> 
> Signed-off-by: Joakim Zhang <joakim.zhang@cixtech.com>
> ---
>  .../bindings/sound/cix,sky1-i2s-mc.yaml       | 124 ++++++++++++++++++
>  1 file changed, 124 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/sound/cix,sky1-i2s-sc.example.dtb: /example-0/dma-controller: failed to match any schema with compatible: ['cix,sky1-audss-dmac']
Documentation/devicetree/bindings/sound/cix,sky1-i2s-mc.example.dtb: /example-0/dma-controller: failed to match any schema with compatible: ['cix,sky1-audss-dmac']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20260922112134.4167305-4-joakim.zhang@cixtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


