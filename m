Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33325D3B7EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Dec 2025 10:38:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DcPUChBEcR98M0Rw8DjEjybPgz+H56fev0ZYQvvQpCY=; b=f25C+4wmhBYDoKnAH1QP0oSy+d
	+L2OkSXc0HHprrMKKD08OqR0j8SUvRatR+3X9d+NbaSmbihJrgWJj8+xzNmBv6AFX4T4Z1s9oudjH
	+ZP2zFC61TvyF+IDPiO7kjXTr4O6BNUJiFWwOsg26/AMD035IRumku8LNl9AR+ylJNMKIY19OOjkJ
	0RgiKIkDRpHfxtagTQdcjuRSJtdknbAFyHrvd+m4fW01KhXBEUSnEuuRSxeyAZaaZK/NLzy4cKSS9
	nfByYwaIHi2fZU5KZFDzJ1oIEHVPqleTRfSPyOtMMHxrfX/pbGCHLeuZQRZzJkq4bzDL8Y/v5hKa6
	9d4V94AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSv6w-0000000E7WW-3ePV;
	Tue, 09 Dec 2025 10:38:26 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vSv6u-0000000E7WA-325e
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Dec 2025 10:38:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A6FB543EA7;
	Tue,  9 Dec 2025 10:38:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4DD4BC4CEF5;
	Tue,  9 Dec 2025 10:38:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765276703;
	bh=0AldE0zmudZtS5j9/Fi6Xn2S6A7u+R+fpHODYTSagE4=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=iSI6KJZZAboYannqD6vuGwtPFM0oKZPDhhlkryiYdEhGklsjcQDUochxfw8+5tqbS
	 LACATB/psLez/OLRkawr/gzZfD27H1usH9FUnNuwctQmWET/wodg+Kw5+eMxQ6NLBd
	 N1Y2DIx1HZel+8Y75RnLYxLpIrh+UloI7NiwheYoRfjnTFyVDgN/va2Z/7yQx1Z184
	 ZELoSCq42AuJa7YlseYxeXjYpaI0O8YB5mT2+rs2WZIek4v0GvoSeUEAiqzhFA7Q6K
	 di0gpkOCvc82gdBO2IKarZ/rbDDQjUn41cNDSIBzse3VKN1l746pxlZkYX/1164jr1
	 Qx3nWthR7kPQQ==
Date: Tue, 09 Dec 2025 04:38:20 -0600
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Shengjiu Wang <shengjiu.wang@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
 Mark Brown <broonie@kernel.org>, Liam Girdwood <lgirdwood@gmail.com>, 
 Conor Dooley <conor+dt@kernel.org>, linux-sound@vger.kernel.org, 
 Takashi Iwai <tiwai@suse.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Baojun Xu <baojun.xu@ti.com>, Jaroslav Kysela <perex@perex.cz>, 
 Kevin Lu <kevin-lu@ti.com>, Fabio Estevam <festevam@gmail.com>, 
 Shenghao Ding <shenghao-ding@ti.com>, asahi@lists.linux.dev, 
 linux-kernel@vger.kernel.org
To: James Calligeros <jcalligeros99@gmail.com>
In-Reply-To: <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
References: <20251209-tdm-idle-slots-v1-0-38dabf6bc01e@gmail.com>
 <20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com>
Message-Id: <176527670059.4068182.12113080556311230046.robh@kernel.org>
Subject: Re: [PATCH 1/7] ASoC: dt-bindings: convert tdm-slot to YAML
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251209_023824_805530_43368A58 
X-CRM114-Status: UNSURE (   9.63  )
X-CRM114-Notice: Please train this message.
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


On Tue, 09 Dec 2025 19:31:14 +1000, James Calligeros wrote:
> This schema was still in plaintext form. Convert to YAML format.
> 
> Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
> ---
>  .../bindings/sound/tdm-slot.txt          | 29 ---------------------
>  .../bindings/sound/tdm-slot.yaml         | 34 +++++++++++++++++++++++++
>  2 files changed, 34 insertions(+), 29 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tdm-slot.yaml: 'oneOf' conditional failed, one must be fixed:
	'unevaluatedProperties' is a required property
	'additionalProperties' is a required property
	hint: Either unevaluatedProperties or additionalProperties must be present
	from schema $id: http://devicetree.org/meta-schemas/core.yaml
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/sound/tdm-slot.yaml: 'anyOf' conditional failed, one must be fixed:
	'properties' is a required property
	'patternProperties' is a required property
	hint: Metaschema for devicetree binding documentation
	from schema $id: http://devicetree.org/meta-schemas/core.yaml

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20251209-tdm-idle-slots-v1-1-38dabf6bc01e@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


