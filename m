Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BDB37C54ED1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 May 2025 15:28:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nL5apIcHpjYXMi4SgW6FFu583vzDFsi/0NZKthmfB/o=; b=3W20B9VojgQhmMMYX4Rdelz5rv
	GlOWGihk1MhB0cobGN07QGEzr1xAo3efk0alSEPMd8MpXPX5Inzkuo8UmLiJef1Rpnqo+tTTXPFLa
	nSCGgG8oZJatYPG3UNIug/NkKLKIbliplEGoXG/u13yXyNxL2pKmXb4AaDTYgv+VMZtgCGhYZqx/B
	ZAo6lX1uzOpzZbYiNGduDWzq6tM5+60t1NIxlGhf950ukquLvGEQitGkzVgZy+Nu1JieUtA412TVU
	TjvRAKIqp+Z9vKygYw8HC8S1FA0VsP969uurwXz/Z3gQmUT5z0tuth1PY2/x44jKXCD3SXyLl1V4n
	xIq/IKOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwEN-0000000B3OZ-1IuL;
	Tue, 27 May 2025 15:28:43 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJwCE-0000000B3CR-0NY9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 May 2025 15:26:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1B28244E0F;
	Tue, 27 May 2025 15:26:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 278B2C4CEE9;
	Tue, 27 May 2025 15:26:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748359589;
	bh=YnA1/IvrO7Twz/AlZKv3r93FTZ8BSs9KSJRQMN6qNzc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bzgIx9UwCykCNFvylFkgv4bWgjxzHmsmueoxfv/ocntlwYNaIU/IS6QU5HaD4sdFm
	 vqU63BjYSIovLIVA4C/KbMcJtSgBrN4whSumRpdoeqW9Lh+pe22+yOgsClZgfhocN0
	 ocbnvkUk2QjBqszwpsCogI37+N9WZeqO3Jutxw541z2AFlSP1n+q0oKPqwrdSKRDlr
	 J6aZhTO7nS6kxLyI5xE4+1ovrt+Q7JFzncaOJ7ZTtBie727RcqojMpCfjqt7uM1c8i
	 roigQKMzE3isKqSz5xicEnjzsyZ40HksMZGrK+GNdh9BKF98EcfjbWOaZJrzzTQKZr
	 7dCNuCJGbou4w==
Date: Tue, 27 May 2025 16:26:24 +0100
From: Conor Dooley <conor@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:SOUND - SOC LAYER / DYNAMIC AUDIO POWER MANAGEM..." <linux-sound@vger.kernel.org>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] ASoC: dt-bindings: covert mxs-audio-sgtl5000.txt to
 yaml format
Message-ID: <20250527-disloyal-maritime-fea9f6a1d8f4@spud>
References: <20250523192055.563711-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="QgV6b+xA9WWLoYJ+"
Content-Disposition: inline
In-Reply-To: <20250523192055.563711-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250527_082630_187638_1804FA88 
X-CRM114-Status: GOOD (  22.35  )
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


--QgV6b+xA9WWLoYJ+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, May 23, 2025 at 03:20:54PM -0400, Frank Li wrote:
> Convert mxs-audio-sgtl5000.txt to yaml format.
>=20
> Additional changes:
> - Add compatible string:
>     bluegiga,apx4devkit-sgtl5000
>     denx,m28evk-sgtl5000
>     fsl,imx28-mbmx28lc-sgtl500

Really? I don't see them.

> - Remove audio-routing from required list.

Nope, still there?

Confused,
Conor.

>=20
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  .../sound/fsl,mxs-audio-sgtl5000.yaml         | 78 +++++++++++++++++++
>  .../bindings/sound/mxs-audio-sgtl5000.txt     | 42 ----------
>  2 files changed, 78 insertions(+), 42 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,mxs-audio=
-sgtl5000.yaml
>  delete mode 100644 Documentation/devicetree/bindings/sound/mxs-audio-sgt=
l5000.txt
>=20
> diff --git a/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl50=
00.yaml b/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.ya=
ml
> new file mode 100644
> index 0000000000000..9fe815d6c233d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/sound/fsl,mxs-audio-sgtl5000.yaml
> @@ -0,0 +1,78 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/sound/fsl,mxs-audio-sgtl5000.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Freescale MXS audio complex with SGTL5000 codec
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - fsl,imx28-evk-sgtl5000
> +      - const: fsl,mxs-audio-sgtl5000
> +
> +  model:
> +    $ref: /schemas/types.yaml#/definitions/string
> +    description: The user-visible name of this sound complex
> +
> +  saif-controllers:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: The phandle list of the MXS SAIF controller
> +
> +  audio-codec:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: The phandle of the SGTL5000 audio codec
> +
> +  audio-routing:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description: |
> +      A list of the connections between audio components.
> +      Each entry is a pair of strings, the first being the
> +      connection's sink, the second being the connection's
> +      source. Valid names could be power supplies, SGTL5000
> +      pins, and the jacks on the board:
> +
> +      Power supplies:
> +        * Mic Bias
> +
> +      SGTL5000 pins:
> +        * MIC_IN
> +        * LINE_IN
> +        * HP_OUT
> +        * LINE_OUT
> +
> +      Board connectors:
> +        * Mic Jack
> +        * Line In Jack
> +        * Headphone Jack
> +        * Line Out Jack
> +        * Ext Spk
> +
> +required:
> +  - compatible
> +  - saif-controllers
> +  - audio-codec
> +  - audio-routing
> +
> +allOf:
> +  - $ref: dai-common.yaml#
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    sound {
> +        compatible =3D "fsl,imx28-evk-sgtl5000", "fsl,mxs-audio-sgtl5000=
";
> +        model =3D "imx28-evk-sgtl5000";
> +        saif-controllers =3D <&saif0 &saif1>;
> +        audio-codec =3D <&sgtl5000>;
> +        audio-routing =3D
> +            "MIC_IN", "Mic Jack",
> +            "Mic Jack", "Mic Bias",
> +            "Headphone Jack", "HP_OUT";
> +    };
> diff --git a/Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.t=
xt b/Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
> deleted file mode 100644
> index 4eb980bd02874..0000000000000
> --- a/Documentation/devicetree/bindings/sound/mxs-audio-sgtl5000.txt
> +++ /dev/null
> @@ -1,42 +0,0 @@
> -* Freescale MXS audio complex with SGTL5000 codec
> -
> -Required properties:
> -- compatible		: "fsl,mxs-audio-sgtl5000"
> -- model			: The user-visible name of this sound complex
> -- saif-controllers	: The phandle list of the MXS SAIF controller
> -- audio-codec		: The phandle of the SGTL5000 audio codec
> -- audio-routing		: A list of the connections between audio components.
> -			  Each entry is a pair of strings, the first being the
> -			  connection's sink, the second being the connection's
> -			  source. Valid names could be power supplies, SGTL5000
> -			  pins, and the jacks on the board:
> -
> -			  Power supplies:
> -			   * Mic Bias
> -
> -			  SGTL5000 pins:
> -			   * MIC_IN
> -			   * LINE_IN
> -			   * HP_OUT
> -			   * LINE_OUT
> -
> -			  Board connectors:
> -			   * Mic Jack
> -			   * Line In Jack
> -			   * Headphone Jack
> -			   * Line Out Jack
> -			   * Ext Spk
> -
> -Example:
> -
> -sound {
> -	compatible =3D "fsl,imx28-evk-sgtl5000",
> -		     "fsl,mxs-audio-sgtl5000";
> -	model =3D "imx28-evk-sgtl5000";
> -	saif-controllers =3D <&saif0 &saif1>;
> -	audio-codec =3D <&sgtl5000>;
> -	audio-routing =3D
> -		"MIC_IN", "Mic Jack",
> -		"Mic Jack", "Mic Bias",
> -		"Headphone Jack", "HP_OUT";
> -};
> --=20
> 2.34.1
>=20

--QgV6b+xA9WWLoYJ+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDXZnwAKCRB4tDGHoIJi
0nEvAP4+0dWY7AbxfwECG2Q0jh6CNsRqWWVvKqxzBboFQZHLnAEArcUEPosW6/FK
ixi841HYZzgd/3HVGrZSyjMCPRArVgk=
=5OT+
-----END PGP SIGNATURE-----

--QgV6b+xA9WWLoYJ+--

