Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A4EBC44501
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jul 2026 07:39:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iV5e6pRe5bHAjJTm6bWvI5nFVRDfFXzcLJLu3ZoiTio=; b=CN8b1g4sdPZbtEe/FqyP/JbiAl
	vDFStl6n2SwQD1kSUyYCWejRAiPjd2cfX25MWqYEtwdpoZFqMAq1OL67LXGPgwHRffVoG2HSzlIGB
	mQhaJgHXPAuszHNsbtZePSAcGvp+jlOetou0udTvRtdV1clV826UDu2Ru8DVL77kFOvsiYlPR2hj2
	Yk7hvaHgJwZuLweVGkG1hhgKDgyiqnk0LjnvZx+sJjHwZnB2GcoI7KKQ+vgICN2AxycwCSmlphYKe
	5gBJgp3JgDVZ74YVd1k43Xv7INAi6EffpjUn+BRrElU2EErODzpM8f8mAaw5We4WICHPF6324AiZ9
	nRmD5uWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSJ5-00000006KDZ-3e4B;
	Sat, 11 Jul 2026 07:39:27 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wiSJ2-00000006KCt-18mx
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Jul 2026 07:39:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A9EA601D9;
	Sat, 11 Jul 2026 07:39:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1282A1F00A3A;
	Sat, 11 Jul 2026 07:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783755563;
	bh=iV5e6pRe5bHAjJTm6bWvI5nFVRDfFXzcLJLu3ZoiTio=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject;
	b=DAEUkMAp2/M99hv5JAlJsvDDrRXFNP24LsCgoiohXjn6HURC+eEyNFPG3FEN/jdVJ
	 2cSYPMD16xyDYscq6hOUYQlWdHu6y3h038V5Lj8mRNWepM3vXLdf5Vbtvy9KQL8rI0
	 ri7EEkjZ3FD4ynF+vqFPeP0W+dXdS3tVli8dAI5NRmFfgrORV707PHCGOjv1Wq7HGY
	 WFXhJw+XW/+5tWrlblqFRBElP9YXVIyudq6eBpJlLxc7iN0/kasokANd4XFzJxonr5
	 PdfDjpcrTiOct/J2T0GdHzUV7ysbR0xPdOhpeE4J/a9rs8coZBjiVRAMLJ71QwQuH4
	 rvprBma6OslAA==
Date: Sat, 11 Jul 2026 02:39:22 -0500
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Stefan Leichter <sle85276@gmx.de>, Daniel Thompson <danielt@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, 
 Srinivas Kandagatla <srinivas.kandagatla@oss.qualcomm.com>, 
 Charles Keepax <ckeepax@opensource.cirrus.com>, 
 linux-kernel@vger.kernel.org, Tony Lindgren <tony@atomide.com>, 
 Lee Jones <lee@kernel.org>, Andreas Kemnade <andreas@kemnade.info>, 
 Ethan Nelson-Moore <enelsonmoore@gmail.com>, linux-omap@vger.kernel.org, 
 mfd@lists.linux.dev, linux-sound@vger.kernel.org, 
 Mark Brown <broonie@kernel.org>, Takashi Iwai <tiwai@suse.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Niranjan H Y <niranjan.hy@ti.com>, 
 Grazvydas Ignotas <notasas@gmail.com>, Conor Dooley <conor+dt@kernel.org>, 
 Jarkko Nikula <jarkko.nikula@bitmer.com>, Jingoo Han <jingoohan1@gmail.com>, 
 Russell King <linux@armlinux.org.uk>, Roger Quadros <rogerq@kernel.org>, 
 Jaroslav Kysela <perex@perex.cz>, dri-devel@lists.freedesktop.org, 
 Aaro Koskinen <aaro.koskinen@iki.fi>, Liam Girdwood <lgirdwood@gmail.com>, 
 linux-arm-kernel@lists.infradead.org, Helge Deller <deller@gmx.de>, 
 Grond <grond66@riseup.net>, linux-fbdev@vger.kernel.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, devicetree@vger.kernel.org, 
 Kevin Hilman <khilman@baylibre.com>, Sen Wang <sen@ti.com>, 
 kernel@pyra-handheld.com, Richard Fitzgerald <rf@opensource.cirrus.com>, 
 Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, 
 letux-kernel@openphoenux.org
To: "H. Nikolaus Schaller" <hns@goldelico.com>
In-Reply-To: <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
References: <cover.1783749722.git.hns@goldelico.com>
 <a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com>
Message-Id: <178375556139.2516965.6236993416627662539.robh@kernel.org>
Subject: Re: [PATCH 07/16] ASoC: dt-bindings: add TI PCM1773
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


On Sat, 11 Jul 2026 08:01:54 +0200, H. Nikolaus Schaller wrote:
> PCM1771/3 is a simple audio codec that can be enabled through an
> enable-gpio.
> 
> Signed-off-by: H. Nikolaus Schaller <hns@goldelico.com>
> ---
>  .../devicetree/bindings/sound/pcm1773.yaml    | 32 +++++++++++++++++++
>  1 file changed, 32 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/pcm1773.yaml
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:


doc reference errors (make refcheckdocs):

See https://patchwork.kernel.org/project/devicetree/patch/a02383ea5907a677f4c61066d423efde2b9de48b.1783749722.git.hns@goldelico.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


