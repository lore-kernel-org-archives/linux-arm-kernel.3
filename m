Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC8B3CCFA13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 18:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=afzJhx6j0S3OFaMxG+v20QwZAhEYAZz9IJ6CgTVkmxc=; b=0+yg/nWy181O/LUQNVsy/aRp9D
	qVy0fbSE11u1fnJ/hdWXcC/O3NP/w/0ad58d93DnI9jC6G5I50xPgwBhx69S0MYppLL4RqJ6qMnec
	GBG6KL8b4xAizAMir8NosqiIdmgpV1fyoT3uoWDxF4PJPl2IUPk/m7AwEBKD/o+/FnBHqaVOtfEgr
	YoGc0slEC/tcOSZomTW4KjxGYlXpD/RaRsxVXeBxyOvbDOkJu+Z06SSde45VIfK2AbKaqrDNX5fuK
	fr7Z9UpTyfzST9YtbTByb0iDzvyG5ADhVoiRrgCaFUB/JAyjYkH5IOt5TxxdF4x/YoLOsRn6PyDFP
	jeBcXQJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWtN-00000005zVe-3mfb;
	Mon, 10 Nov 2025 18:45:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIWtM-00000005zVN-1ZqB;
	Mon, 10 Nov 2025 18:45:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87C1260144;
	Mon, 10 Nov 2025 18:45:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32A14C16AAE;
	Mon, 10 Nov 2025 18:45:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762800327;
	bh=h+hvokvmCCTDbp1ZtZ5LLSZHkoGj3sCDkVi6fIPluaM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qqYCHOxHrTmZdzB1WxpNF61c/7mzYYd64sAZLx7pm8fQ5FHdlPMVUWCNq5lZAwAYN
	 IARYZ2xi5eguyUrK1/n3ud3g+I0ZVTtbej0tMgp4HaqrpUGr6nKS3g7goyyNjC4IQF
	 oW+wjYzjH0dVZeWGbOrt19dSO1ye+/BrWqoYn0UXZD2AcwYRFjs9tyDTxmJZAYmCSl
	 VIF6FxfnPJMrGiIr6yoqN2avq8U+z7iHGwcmEmIetJTs7RvoT01JA/f/9cWQfhvhvD
	 5iqagu1+YKiqxcr94E3Lz5l2N1jsnWZOUXxx1cZgWqckCMiKMhK49cP2xHOuJDQVLd
	 Rd02bg09psC6g==
Date: Mon, 10 Nov 2025 18:45:20 +0000
From: Conor Dooley <conor@kernel.org>
To: Hanchien Lin <hanchien.lin@mediatek.com>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Balsam CHIHI <bchihi@baylibre.com>, linux-pm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Project_Global_Chrome_Upstream_Group@mediatek.com,
	raymond.sun@mediatek.com, Irving-CH.lin@mediatek.com
Subject: Re: [PATCH 1/2] arm64: dts: mediatek: mt8189: Add thermal controller
 node
Message-ID: <20251110-vagueness-waggle-50b8efe728a8@spud>
References: <20251110094113.3965182-1-hanchien.lin@mediatek.com>
 <20251110094113.3965182-2-hanchien.lin@mediatek.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="C0KGNy2z0JyurDwg"
Content-Disposition: inline
In-Reply-To: <20251110094113.3965182-2-hanchien.lin@mediatek.com>
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


--C0KGNy2z0JyurDwg
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Nov 10, 2025 at 05:40:38PM +0800, Hanchien Lin wrote:
> Add device tree node for the thermal controller on MediaTek MT8189 SoC.

$subject is incorrect for a binding change.
pw-bot: changes-requested

>=20
> Signed-off-by: Hanchien Lin <hanchien.lin@mediatek.com>
> ---
>  .../thermal/mediatek,lvts-thermal.yaml        | 27 +++++++++++++++++--
>  .../thermal/mediatek,lvts-thermal.h           | 20 ++++++++++++++
>  2 files changed, 45 insertions(+), 2 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/thermal/mediatek,lvts-ther=
mal.yaml b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.=
yaml
> index 0259cd3ce9c5..0f7fd69f5fdf 100644
> --- a/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/mediatek,lvts-thermal.yaml
> @@ -22,6 +22,8 @@ properties:
>        - mediatek,mt8186-lvts
>        - mediatek,mt8188-lvts-ap
>        - mediatek,mt8188-lvts-mcu
> +      - mediatek,mt8189-lvts-ap
> +      - mediatek,mt8189-lvts-mcu
>        - mediatek,mt8192-lvts-ap
>        - mediatek,mt8192-lvts-mcu
>        - mediatek,mt8195-lvts-ap
> @@ -58,6 +60,21 @@ properties:
>  allOf:
>    - $ref: thermal-sensor.yaml#
> =20
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - mediatek,mt8189-lvts-ap
> +              - mediatek,mt8189-lvts-mcu
> +    then:
> +      properties:
> +        nvmem-cells:
> +          minItems: 2
> +
> +        nvmem-cell-names:
> +          minItems: 2
> +
>    - if:
>        properties:
>          compatible:
> @@ -75,6 +92,10 @@ allOf:
>          nvmem-cell-names:
>            maxItems: 1
> =20
> +      required:
> +        - clocks
> +        - resets
> +
>    - if:
>        properties:
>          compatible:
> @@ -91,12 +112,14 @@ allOf:
>          nvmem-cell-names:
>            minItems: 2
> =20
> +      required:
> +        - clocks
> +        - resets
> +
>  required:
>    - compatible
>    - reg
>    - interrupts
> -  - clocks
> -  - resets
>    - nvmem-cells
>    - nvmem-cell-names
> =20
> diff --git a/include/dt-bindings/thermal/mediatek,lvts-thermal.h b/includ=
e/dt-bindings/thermal/mediatek,lvts-thermal.h
> index ddc7302a510a..6c9103dfdc2d 100644
> --- a/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> +++ b/include/dt-bindings/thermal/mediatek,lvts-thermal.h
> @@ -42,6 +42,26 @@
>  #define MT8188_AP_CAM1		6
>  #define MT8188_AP_CAM2		7
> =20
> +#define MT8189_MCU_BIG_CPU1     0
> +#define MT8189_MCU_BIG_CPU2     1
> +#define MT8189_MCU_BIG_CPU3     2
> +#define MT8189_MCU_BIG_CPU4     3
> +#define MT8189_MCU_LITTLE_CPU1  4
> +#define MT8189_MCU_LITTLE_CPU2  5
> +#define MT8189_MCU_LITTLE_CPU3  6
> +#define MT8189_MCU_LITTLE_CPU4  7
> +#define MT8189_MCU_LITTLE_CPU5  8
> +#define MT8189_MCU_LITTLE_CPU6  9
> +#define MT8189_MCU_LITTLE_CPU7  10
> +#define MT8189_MCU_LITTLE_CPU8  11
> +
> +#define MT8189_AP_SOC1          12
> +#define MT8189_AP_SOC2          13
> +#define MT8189_AP_SOC3          14
> +#define MT8189_AP_APU           15
> +#define MT8189_AP_GPU1          16
> +#define MT8189_AP_GPU2          17
> +
>  #define MT8195_MCU_BIG_CPU0     0
>  #define MT8195_MCU_BIG_CPU1     1
>  #define MT8195_MCU_BIG_CPU2     2
> --=20
> 2.45.2
>=20

--C0KGNy2z0JyurDwg
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaRIywAAKCRB4tDGHoIJi
0rCTAP9newdSvzQ50dBkzqSM5wtiWoT8lSk9sQqFZvPJH+LPZQEA5SXT+Bxj/MFp
miT6FPn/6265Zc6AXcJjiSewgImm9wA=
=HeTN
-----END PGP SIGNATURE-----

--C0KGNy2z0JyurDwg--

