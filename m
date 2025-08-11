Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8F19C87FD2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Aug 2025 08:10:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PAuGaI74CfjaVTdAYFE8amyCHBl1hlThave4sJNzriQ=; b=MKWuBLdsYMjcU4kLWTxzM5UDW4
	d6+bpm5YxMCVPD1l4vWrRIP7jKn8uQH6ruBoiOtqMxpcEjoOOoephjVpAtkyqH8We/wcgC+Knsx9G
	00yfyik+yk2cZUoZ2yptCvPiq5AisScgNll7sJr+Kln/SahAUSHgAwc8xvXclmCIhHiUfcxD4kogU
	I6plOsNPHywR16N4N7DD5qXFcwvPHL/KsHso761X1AAP6gnCpgNXMkEwMxJDu2QKVdi7q0TiGqgey
	SWgg8bpLHbv7KHTSPbI2guNs4agtQYwv2Htx+9XyFSr4pgEF6JM7UXdXIGL1bLcAOQNABYaOw88fW
	jjwyOkdg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNcK-00000006oSG-3CQO;
	Mon, 11 Aug 2025 08:10:52 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulNKS-00000006lJB-0jW0;
	Mon, 11 Aug 2025 07:52:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 883D05C5D6F;
	Mon, 11 Aug 2025 07:52:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A2789C4CEF1;
	Mon, 11 Aug 2025 07:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754898743;
	bh=+BLSntymQrh/XkLGtypJrfw1XGjtmza1kggD9wXIN/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c3xoNAGGbBNP16XXgIDYcgwJd9nwpp7WrxtkkARd2jjqlGYdgVvAW7yRKCBgy4Rdq
	 M5at+getsjQyZrr1zDnGMPVAgkJnrvWG7GT1DmeO1ZpQT7l+qC/EIkdVms2N+fm4KC
	 +p1ZVXt7G6V5YzMfswmlYf8QN5OGHEJ6jorFpbvCPPqSfLhKMro8dWUpQVwLZlWFp7
	 54u3+f9Vab1ZYWYP9PF6iCHDXSdTOeTOrOkgdeuKx2ieFHH8ivBgegaelFB3zUdrK7
	 id2rntASo0QuOuceEZec6vuN/kshdYGtk5BBA90nR3rAN87MtGoac6JkEEtMWOA2KO
	 qDbgYyRAy/rkQ==
Date: Mon, 11 Aug 2025 09:52:20 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jay Liu <jay.liu@mediatek.com>
Cc: Chun-Kuang Hu <chunkuang.hu@kernel.org>, 
	Philipp Zabel <p.zabel@pengutronix.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org, 
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 4/6] dt-bindings: display: mediatek: disp-tdshp: Add
 support for MT8196
Message-ID: <20250811-boisterous-skinny-ammonite-a4ca7b@kuoka>
References: <20250808125512.9788-1-jay.liu@mediatek.com>
 <20250808125512.9788-5-jay.liu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250808125512.9788-5-jay.liu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_005224_299834_83F73626 
X-CRM114-Status: GOOD (  17.13  )
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

On Fri, Aug 08, 2025 at 08:53:59PM +0800, Jay Liu wrote:
> Add disp-tdshp hardware description for MediaTek MT8196 SoC
>=20
> Signed-off-by: Jay Liu <jay.liu@mediatek.com>
> ---
>  .../display/mediatek/mediatek,disp-tdshp.yaml | 52 +++++++++++++++++++
>  1 file changed, 52 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/display/mediatek/me=
diatek,disp-tdshp.yaml

We expect filename based on compatibles (see writing bindings).

>=20
> diff --git a/Documentation/devicetree/bindings/display/mediatek/mediatek,=
disp-tdshp.yaml b/Documentation/devicetree/bindings/display/mediatek/mediat=
ek,disp-tdshp.yaml
> new file mode 100644
> index 000000000000..94aa33a2a5ed
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/display/mediatek/mediatek,disp-td=
shp.yaml
> @@ -0,0 +1,52 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/display/mediatek/mediatek,disp-tdshp.=
yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek display 2D sharpness processor
> +
> +maintainers:
> +  - Chun-Kuang Hu <chunkuang.hu@kernel.org>
> +  - Philipp Zabel <p.zabel@pengutronix.de>
> +
> +description: |
> +  MediaTek display 2D sharpness processor, namely TDSHP, provides a
> +  operation used to adjust sharpness in=C2=A0display system.
> +  TDSHP device node must be siblings to the central MMSYS_CONFIG node.

Heh? Why would this have to be a sibling? This is really odd, because
you cannto actually rely on that.

You just added unverifiable unusual ABI with no explanation.


> +  For a description of the MMSYS_CONFIG binding, see
> +  Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml
> +  for details.
> +
> +properties:
> +  compatible:
> +    items:

Drop, just enum.

> +      - enum:
> +          - mediatek,mt8196-disp-tdshp
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +

Drop blank line

> +    soc {
> +      #address-cells =3D <2>;
> +      #size-cells =3D <2>;

messed indentation

> +
> +      disp-tdshp@321e0000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetr=
ee-basics.html#generic-names-recommendation

e.g. image-processor

Best regards,
Krzysztof


