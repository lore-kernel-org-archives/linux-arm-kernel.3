Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17C1E606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 02:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=R01g4oRk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AQK54XH/
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fbPRryJ8n9XhLJpBCPRDsYKT7tAPTsmQIcGjUBmw0wA=; b=R01g4oRkUNojIMkbjf2rBjLprc
	R6fM8XKXliMm/vmJSB28npiVoYdGckuosRy8vx0f/OeqgmJF5J8uwVR8jY9U93J63z4tVkGRgxJD9
	5t2pffJF+jAhPCu/1tWLIGFwGPDJl+/w4gbmwKpG1HoLBZX2yGY+nnylqcD702KWNf8WdEVJfStGT
	UTG0m0B0i9owVP6x4NC4IHRKO1EwEr3OpjE7eD9EfDkmtDlecO/1ctrlor+10SEDCnhiikpXuCaCq
	ZQJjo1b/IQ4NzZqpSEjH5u5TRqztcsJuJk6p952U/RZfn6HL7yYj/V+HmU0dXDHIwMgoUwIUYNSP/
	K6wGPTIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLqx-0000000AvsK-13Ho;
	Wed, 21 Oct 2026 02:14:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJLqw-0000000Avs9-0pYs;
	Wed, 21 Oct 2026 02:14:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5706F60098;
	Wed, 21 Oct 2026 02:14:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29A871F000C9;
	Wed, 21 Oct 2026 02:14:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792548893;
	bh=fbPRryJ8n9XhLJpBCPRDsYKT7tAPTsmQIcGjUBmw0wA=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=AQK54XH/NenajOYZnX0q/PdIt7svKjFZwieZ/EtVcj8PC4HrSuE3cZFlw8hW146TF
	 Pknq2XyUVJ5rFTZ4OD0VNUTe1cqhjGsFUpR4vD0RIlWUYnzehEVj0I72y5dO6Z4jZu
	 sDniZF6/CZmCTnPzBbtqXlgo5hgB33bTQF8tCnwaEgrFuE19HSrth8aWoVXpF0bNkS
	 j4SCuHT38hfHqaTXJpJfYvNv5OfKhCgbYJ+YTq9Y+7Yf51NlTc2kmif4O8kTkJ8bv+
	 Lo2f9sarltbTkplNxd+3C3Tbfh1UoWtPGM60U6qe5AOfOlu95vD9AyDttE1gckwYYd
	 bmI50RAwkl+nA==
Date: Tue, 20 Oct 2026 21:14:50 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Macpaul Lin <macpaul.lin@mediatek.com>, 
 Sean Wang <sean.wang@mediatek.com>, linux-input@vger.kernel.org, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Matthias Brugger <matthias.bgg@gmail.com>, linux-pm@vger.kernel.org, 
 Fabien Parent <parent.f@gmail.com>, linux-gpio@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Mark Brown <broonie@kernel.org>, 
 Sen Chu <sen.chu@mediatek.com>, Linus Walleij <linusw@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Val Packett <val@packett.cool>, 
 devicetree@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>, 
 Conor Dooley <conor+dt@kernel.org>, Chen Zhong <chen.zhong@mediatek.com>, 
 Akari Tsuyukusa <akkun11.open@gmail.com>, Lee Jones <lee@kernel.org>, 
 linux-kernel@vger.kernel.org, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-mediatek@lists.infradead.org, 
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, 
 mfd@lists.linux.dev
To: Luca Leonardo Scorcia <l.scorcia@gmail.com>
In-Reply-To: <20261020173556.632798-2-l.scorcia@gmail.com>
References: <20261020173556.632798-1-l.scorcia@gmail.com>
 <20261020173556.632798-2-l.scorcia@gmail.com>
Message-Id: <179254885010.3549549.1306117296712722010.robh@kernel.org>
Subject: Re: [PATCH RESEND v10 1/9] dt-bindings: mfd: mt6397: Add MT6392
 PMIC
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


On Tue, 20 Oct 2026 19:33:22 +0200, Luca Leonardo Scorcia wrote:
> Describe the MT6392 PMIC and its RTC and regulator devices. This device
> is mostly based on MT6323 with some similarities to MT6397 and is usually
> found on boards using the MT8516/MT8167 SoC.
> 
> Signed-off-by: Luca Leonardo Scorcia <l.scorcia@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
> ---
>  .../bindings/mfd/mediatek,mt6397.yaml         | 72 +++++++++++++++++++
>  1 file changed, 72 insertions(+)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
Documentation/devicetree/bindings/mfd/mediatek,mt6397.example.dtb: pmic (mediatek,mt6392): keys:compatible: 'oneOf' conditional failed, one must be fixed:
	['mediatek,mt6392-keys'] is too short
	'mediatek,mt6392-keys' is not one of ['mediatek,mt6323-keys', 'mediatek,mt6328-keys', 'mediatek,mt6331-keys', 'mediatek,mt6357-keys', 'mediatek,mt6358-keys', 'mediatek,mt6359-keys', 'mediatek,mt6397-keys']
	'mediatek,mt6392-keys' is not one of ['mediatek,mt6365-keys']
	from schema $id: http://devicetree.org/schemas/mfd/mediatek,mt6397.yaml
Documentation/devicetree/bindings/mfd/mediatek,mt6397.example.dtb: /example-3/pmic/keys: failed to match any schema with compatible: ['mediatek,mt6392-keys']

doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/20261020173556.632798-2-l.scorcia@gmail.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


