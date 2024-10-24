Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E865CE8E97
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 17:08:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f2YQH877b/ifTDOT6MCrQ8nDN7giywdFUJByMrg8sJE=; b=qKNFI75ZcIyW1ECAlCMXnGh1Mm
	22s7ucMUnElNwfMNlNDXkqiHDGU6HzyylIvJkG4R/GzGALPp2pBQK982mwlupKQErHpf4cBvoUTYb
	Y6Ogz4ct7Nj4a0/Y6Tv9V9QbFqxw7QrqXzNaWd9ZE4roV99nDKmG44AdFnNtm3MB+JwEBqPRHk+rl
	mo5MXCw0wsq23n3Vsbyb3HmDIHkOtKUhKHf1SVbJmcuxRx4WyCtiwNKBagwPV8eAsc4GJUczH78SP
	tdz5817TafJL8joI8bb92FSLcCjcGhMUjaLMH0e/Gyj7U2T4C3cxTPxITCZ/z+Snby5+i/u8cDYxG
	M5uON7Uw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t41JP-00000001DVc-1mOu;
	Thu, 24 Oct 2024 17:07:51 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t41Gi-00000001D7h-3dxg
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 17:05:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B6EA35C554E;
	Thu, 24 Oct 2024 17:04:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3A6FC4CEC7;
	Thu, 24 Oct 2024 17:05:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729789504;
	bh=N7N6QXRB+ovyAVDEtuqEAO0cC0MzxLTBg6Wql3hIpG0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RWfTNV4Qt3xOgEwh1JC8eIYgPqEVEYIZScAxT/4ojLpkBTpf5tgwQkfqSF1e+N+jr
	 jQTHHLpXZ4ONSx3gC+gmenNBsboACV5PcWOLWubUdM3tUC8pHScXDrV9d4BC8EQeoC
	 ErYzpm6i60JrvlgkgsGPr5IgaRMjYdO2KwQkqNgBBAa7WjJllkDiQGZh2Yhq0sjy4I
	 MKI7eGLv2r9y0qZCqb1T4McCi0rKJMcBAWDvdfpYwbqhsxaakjg1iup7MpFdDgEq/a
	 u/z2N9iELJgGHoiWj2NTiGlxG4S9tW7l83g1E3RR9XSb/Smdz9yANyto5axjYDhTQO
	 OVlE+USiB+vwQ==
Date: Thu, 24 Oct 2024 18:04:59 +0100
From: Conor Dooley <conor@kernel.org>
To: Fabio Estevam <festevam@gmail.com>
Cc: tglx@linutronix.de, daniel.lezcano@linaro.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/2] dt-bindings: timer: fsl,imxgpt: Fix the
 fsl,imx7d-gpt fallback
Message-ID: <20241024-pep-proud-d714705c9ddf@spud>
References: <20241023185841.1183706-1-festevam@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="5GUth0XOvb8nVxp6"
Content-Disposition: inline
In-Reply-To: <20241023185841.1183706-1-festevam@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_100504_979178_A0DFF206 
X-CRM114-Status: GOOD (  11.38  )
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


--5GUth0XOvb8nVxp6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 03:58:40PM -0300, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@denx.de>
>=20
> imx7s.dtsi correctly describes the GPT node as:
>=20
> compatible =3D "fsl,imx7d-gpt", "fsl,imx6dl-gpt";
>=20
> Document the fallback compatible to be "fsl,imx6dl-gpt" in the bindings.
>=20
> This fixes the following dt-schema warnings:
>=20
> timer@302f0000: compatible: 'oneOf' conditional failed, one must be fixed:
> 	['fsl,imx7d-gpt', 'fsl,imx6dl-gpt'] is too long
> 	'fsl,imx1-gpt' was expected
> 	'fsl,imx21-gpt' was expected
> 	'fsl,imx27-gpt' was expected
> 	'fsl,imx31-gpt' was expected
> 	'fsl,imx7d-gpt' is not one of ['fsl,imx25-gpt', 'fsl,imx50-gpt', 'fsl,im=
x51-gpt', 'fsl,imx53-gpt', 'fsl,imx6q-gpt']
> 	'fsl,imx6dl-gpt' was expected
> 	'fsl,imx7d-gpt' is not one of ['fsl,imx6sl-gpt', 'fsl,imx6sx-gpt', 'fsl,=
imx8mp-gpt', 'fsl,imxrt1050-gpt', 'fsl,imxrt1170-gpt']
> 	'fsl,imx6sx-gpt' was expected
>=20
> Signed-off-by: Fabio Estevam <festevam@denx.de>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--5GUth0XOvb8nVxp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxp+OwAKCRB4tDGHoIJi
0v/CAP4n36jVWrgh3x+vdOBqKn+NTHSuLsxXHINgpQ2AoNnjlQEAok8fcpbaLkAJ
xnoDV7a+AvYpqTLpapBNDg4WbMyhIgI=
=6cJq
-----END PGP SIGNATURE-----

--5GUth0XOvb8nVxp6--

