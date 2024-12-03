Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 100B1E74AC4
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Dec 2024 16:51:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c8yKeFLr7GK2j1GC41CvEEkFDcayC545MbavQqa2ETY=; b=VyuAsP8EInb6u1uA+Jx6dXd80I
	DSvK0jSLoEfs3MKiu6YNXZRmgyZ/+VJUKRNtmqmzVFqIl/P27MFAYJN7O2uNv+zyxK6sCIpu3rAdU
	I/PS4Vl7W4DmVRKo3s9+zwmI+Rr+QJSCHpCGVeXJwui9EfaOq3aAmD8THSBp+ofHhMU6Bsttn91uj
	juLNmyENTdycKov4PdoS8NvhIyl7Mk+u3KmmxFABv0KhQ1bJVBMF28Puw8Kpe86Xzbe54KzmhZAQy
	PwOBLS8vP7Yv0w0fGttKjIkjek2Lwd+LI3ZV9Xl+w3mgjfmXRS00YauDhUk5KcC8irs8RPCmbw71u
	IM2wYhUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW6q-0000000A9qI-0L69;
	Tue, 03 Dec 2024 16:50:48 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIW5p-0000000A9VX-1ycZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Dec 2024 16:49:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2E7925C5FD8;
	Tue,  3 Dec 2024 16:49:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5CEBC4CECF;
	Tue,  3 Dec 2024 16:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733244583;
	bh=1NqLuuLFwHm0v/yK7wKaDo26NhV34tP1XmqEcIsx8to=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uJo1JZl25KEUEqfUZcLBB/tMBA0DqTkqNW9sWubx4kv7Y3pfx/lt5a+4iT+XQL0W5
	 Txc43BClWHT6BKKuL7HBYTCMYPXmMS7V/t6cmHshp7VtgQnN9cAbB0LHUZCswVGJdc
	 DKHlIUuRyXVLaOQJbpL0q6rHr6D89fQVmdPLC61hw3lsn1M1x4dlSb+hV5S6sxRry3
	 dSuHczvq1DBSm+SCu7n4Y6K0QiEcqdGQo5ECPrRLkbwAiPNPYrO0tVEOabwTXRvjEs
	 3C1LyxcAoye0/25Q7rKK6tt5+i3LvrKa24QHpz300wIipXPYveiVEftvQvo6EzBScm
	 u870mSPB8nrlg==
Date: Tue, 3 Dec 2024 16:49:39 +0000
From: Conor Dooley <conor@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Christophe Leroy <christophe.leroy@csgroup.eu>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linuxppc-dev@lists.ozlabs.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Frank Li <Frank.Li@nxp.com>,
	stable@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: fsl: cpm_qe: Limit matching to nodes
 with "fsl,qe"
Message-ID: <20241203-egotistic-certainly-116f38bd39b6@spud>
References: <20241202045757.39244-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5+M0C7v+8zXCbXJ/"
Content-Disposition: inline
In-Reply-To: <20241202045757.39244-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241203_084945_600172_62811D97 
X-CRM114-Status: GOOD (  17.42  )
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


--5+M0C7v+8zXCbXJ/
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 02, 2024 at 12:57:55PM +0800, Chen-Yu Tsai wrote:
> Otherwise the binding matches against random nodes with "simple-bus"
> giving out all kinds of invalid warnings:
>=20
>     $ make CHECK_DTBS=3Dy mediatek/mt8188-evb.dtb
>       SYNC    include/config/auto.conf.cmd
>       UPD     include/config/kernel.release
>       SCHEMA  Documentation/devicetree/bindings/processed-schema.json
>       DTC [C] arch/arm64/boot/dts/mediatek/mt8188-evb.dtb
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible:0: 'fsl,=
qe' was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: compatible: ['simpl=
e-bus'] is too short
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000:compatible:0: 'fsl,qe-ic' was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000:reg: [[0, 201326592, 0, 262144], [0, 201588736, 0, 2097152]] is t=
oo long
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000:#interrupt-cells:0:0: 1 was expected
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: interrupt-controlle=
r@c000000: '#redistributor-regions', 'ppi-partitions' do not match any of t=
he regexes: 'pinctrl-[0-9]+'
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'reg' is a required=
 property
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#
>     arch/arm64/boot/dts/mediatek/mt8188-evb.dtb: soc: 'bus-frequency' is =
a required property
> 	    from schema $id: http://devicetree.org/schemas/soc/fsl/cpm_qe/fsl,qe=
=2Eyaml#

I'm curious why this is only coming up now, Rob applied this apparently
in July.

>=20
> Fixes: ecbfc6ff94a2 ("dt-bindings: soc: fsl: cpm_qe: convert to yaml form=
at")
> Cc: Frank Li <Frank.Li@nxp.com>
> Cc: <stable@vger.kernel.org> # v6.11+
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
>  .../devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml        | 8 ++++++++
>  1 file changed, 8 insertions(+)
>=20
> diff --git a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml=
 b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> index 89cdf5e1d0a8..9e07a2c4d05b 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/cpm_qe/fsl,qe.yaml
> @@ -21,6 +21,14 @@ description: |
>    The description below applies to the qe of MPC8360 and
>    more nodes and properties would be extended in the future.
> =20
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: fsl,qe
> +  required:
> +    - compatible
> +
>  properties:
>    compatible:
>      items:
> --=20
> 2.47.0.338.g60cca15819-goog
>=20

--5+M0C7v+8zXCbXJ/
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ082owAKCRB4tDGHoIJi
0s0HAQDAWUaDFTMODECrGoMpk/JQ6X3sb4Uok6Yl2lbO7EaJUwEAkJy4Xvisf0FS
fWsESM6zpR0CkagNmMJ9ezdGDBwYAAE=
=ZvIG
-----END PGP SIGNATURE-----

--5+M0C7v+8zXCbXJ/--

