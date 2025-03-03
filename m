Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 82517C282D1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 15:16:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3tvtlBq8JKSeTMD/DhT8kwrhJN/4BirvMslD2h1VwbQ=; b=keRJR5+i/g53PllY4ac2HmMtGs
	tAst7nVVC+cQmp5xilo1BPeZIuu17efkdsBuXMWOSlAUDOc3hweSy1vsMmhTn5cf3CxD1vQldkDsw
	76wSOA011r981IyexFyqclkEU6sdauRI3Quwm9WU3okqK+hUy/kPj+/fc7XDFyw6kja3AnAieJvdt
	jzmS2/W6Mkqa84TbQuSUJDBDUsgMXIg1mCpspwvEWvp2EtsSPKlvRHZEYstp947+88K5NxfVI9/8d
	doA/wAujvzh/gBnmzuXecaSgs12eFGbbSXpPYKeyoy1eN1Lg6B4D+4Nw60HPvFhOI6d+xh4CGJBkf
	AenfmnrQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7WU-00000001G2S-0HFs;
	Mon, 03 Mar 2025 15:16:02 +0000
Received: from tor.source.kernel.org ([2600:3c04::f03c:95ff:fe5e:7468])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tp7SH-00000001EtQ-1nck;
	Mon, 03 Mar 2025 15:11:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CEB9611E2;
	Mon,  3 Mar 2025 15:11:28 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id ACBC3C4CED6;
	Mon,  3 Mar 2025 15:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741014698;
	bh=G/dwvTYbi29J7qZDLqsdsunHt5wGMVf9N068m47ts/o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=MY06sI307vcBUkl0yjLJUOLKbfIs9ElMYH5Nfmz2zop1X2cO2qijkn00N3ZSVDZSu
	 94V89LwyvSzcRizck5nfgyHiTDh4H0JvWhTOGo/3txQJsTKOqszFNVw/z46/Jc/SK7
	 AxvWjYo6rY24lPQAi/mTPc8tmPVTJX9jDFceZ36wtO+uzdSDRSG85o1ReH7hOoX8Ig
	 +CltfvNKVL2iRLj1H6Nj89OK9vaj9k6ixUVjflUmemK52iNza3fJiIwBNsGYYJsYbC
	 K3/C58ov5uThD31PFIW3ZfNxC8bmCrDis4MMz1uzLh3Xfv1sI7XqXpfWE0uLocmmY3
	 F+yZHzV9WmYGQ==
Date: Mon, 3 Mar 2025 09:11:37 -0600
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Sen Chu <sen.chu@mediatek.com>, Sean Wang <sean.wang@mediatek.com>,
	Macpaul Lin <macpaul.lin@mediatek.com>, Lee Jones <lee@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, kernel@collabora.com,
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 01/20] ASoC: dt-bindings: Add document for
 mt6359-accdet
Message-ID: <20250303151137.GA1862020-robh@kernel.org>
References: <20250302-mt6359-accdet-dts-v2-0-5bd633ee0d47@collabora.com>
 <20250302-mt6359-accdet-dts-v2-1-5bd633ee0d47@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250302-mt6359-accdet-dts-v2-1-5bd633ee0d47@collabora.com>
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

On Sun, Mar 02, 2025 at 01:30:40PM -0300, Nícolas F. R. A. Prado wrote:
> Add dt-binding for the MT6359 ACCDET hardware block.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> ---
>  .../bindings/sound/mediatek,mt6359-accdet.yaml     | 42 ++++++++++++++++++++++
>  1 file changed, 42 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..d08a79301409374714c76135b061e20e8e8acfaf
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/mediatek,mt6359-accdet.yaml
> @@ -0,0 +1,42 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/mediatek,mt6359-accdet.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MT6359 Accessory Detection
> +
> +maintainers:
> +  - Nícolas F. R. A. Prado <nfraprado@collabora.com>
> +
> +description: |

Don't need '|'.

> +  The MT6359 Accessory Detection block is part of the MT6359 PMIC and allows
> +  detecting audio jack insertion and removal, as well as identifying the type of
> +  events connected to the jack.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6359-accdet
> +
> +  mediatek,hp-eint-high:
> +    type: boolean
> +    description:
> +      By default, the HP_EINT pin is assumed to be pulled high and connected to
> +      a normally open 3.5mm jack. Plug insertion is detected when the pin is
> +      brought low in that case. Add this property if the behavior should be
> +      inverted, for example if a normally closed 3.5mm jack is used, or if the
> +      line is pulled low on open.
> +
> +required:
> +  - compatible
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    accdet: accdet {
> +        compatible = "mediatek,mt6359-accdet";
> +        mediatek,hp-eint-high;
> +    };
> 
> -- 
> 2.48.1
> 

