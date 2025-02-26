Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05B20C021BC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 08:33:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BuWCmFRfUPT37K5Fdla6ye4GXv/m5YINJK2Nulqq/s8=; b=cvwT0pA4Vf8M1dtdJAUZW7aC/n
	by5G/G5VT1TdWdCHa5B6+GxPyhKVrcSxi4AjqE52qEaIGCmZ4h09tej8OJV7/JupLJPINO1Xv5+IW
	ufeMfBztRki1wwuSRe0Vl9fW6qY0X59Dj++SffyqoRAqQIbMOYsT3q4eVZCOzM/NH2jIXaK1WPOL4
	6m9IMrA0H0Zrmf/bs/ZD+AKw5KuNqRVKur6GrAEtjbicNUobn7btJ2WW3wYeelWb1NzpkhbVR7bl9
	kdW6BCqu9K6KgZ1fPIj1bx3+kTLCrA2bl1fzTqGevGhU5eJAPCVAVoHPDtO150/NSWU+dywSLCBxO
	F2YNNhQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCrJ-00000002u0S-0rZH;
	Wed, 26 Feb 2025 08:33:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnCgb-00000002rWK-3Cfs;
	Wed, 26 Feb 2025 08:22:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 059185C5E99;
	Wed, 26 Feb 2025 08:21:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2139FC4CEE2;
	Wed, 26 Feb 2025 08:22:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740558152;
	bh=IXeKLcSbvMcqBKVSn5skB9BHbi03YvYAsNDK395OQeY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AxsG1GalGapRIo6NCASGUf8kylYzD0wwQr0usYQ94FO6Mer+N72etp5FxXFhrHc/u
	 oOtAiN+gwcPkGrmvwDb7MrwMnru4CAdpFxwnNZVvDcv/qY+kCoOUUQIPfUB1rTl7DT
	 ieCtXXtGP9V4G19Cppkox0qKZf3F4BiNGfeQhfauGUfR4R4eHVEMIs63jLf++/j++A
	 +xjRXrTb6koJPIOd2ApJnenewnAuzIErygRes7ND5H2C3/7M/4CbQf97neRrLgh5/n
	 g1+5GhWgasjDuIMUxqpOqfdAOQWJdbTHdsW3SjZH4YHSpW4/2nobxuXO7sy0CX7b1V
	 o0uvDJI74WH3g==
Date: Wed, 26 Feb 2025 09:22:29 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: =?utf-8?B?TsOtY29sYXMgRi4gUi4gQS4=?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Trevor Wu <trevor.wu@mediatek.com>, kernel@collabora.com, linux-sound@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2 7/8] ASoC: dt-bindings: mediatek,mt8188-mt6359: Add
 DMIC backend to dai-link
Message-ID: <20250226-ludicrous-seagull-of-music-a40daf@krzk-bin>
References: <20250225-genio700-dmic-v2-0-3076f5b50ef7@collabora.com>
 <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250225-genio700-dmic-v2-7-3076f5b50ef7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_002233_887641_78A41271 
X-CRM114-Status: GOOD (  12.47  )
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

On Tue, Feb 25, 2025 at 11:33:53AM -0300, N=C3=ADcolas F. R. A. Prado wrote:
> MT8188 platforms also have DMIC DAIs, which were previously undescribed.
> Add DMIC_BE as a possible backend for the dai-link property.
>=20
> Signed-off-by: N=C3=ADcolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt63=
59.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.ya=
ml
> index 362e729b51b43ec16716aee70ad736420def81f3..8c77e7f68ad7b6f5b88b53ced=
ccb291139a2eeea 100644
> --- a/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt8188-mt6359.yaml
> @@ -62,6 +62,7 @@ patternProperties:
>              - PCM1_BE
>              - DL_SRC_BE
>              - UL_SRC_BE
> +            - DMIC_BE

Any reason why you keep adding to the end of the lists but not
alphabetically sorted? It's enum, so it's expected to be sorted which
reduces conflicts between edits. Last commit already broke sorting :/

Best regards,
Krzysztof


