Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 388B6C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 May 2025 16:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dLC9FGNy02pDL83tAaPJ87NrmGoBZGcsUzjb8XxGGNg=; b=LJCLYhwQn/p+vbRyd0ewGfo45d
	k7H46H9ri5Q4seHippQBT7p32qxovOPCbqTiY0pSK/8zyBRsNKwOjRe8oN66X9R/PoVVYEvhU8CZv
	EJWbPe5DyAyfXJ/caV22HFU+GsZRKJEVqRLy7yOD7s0AnBGuQ2vv+hUZVeoyr8etWXUk2Z+ZDuCw4
	2pdMl2i8uqNYihF2LTlr860NOm7nrw4WGqan5+a8VRV+IISoIVOuiP3Rm9R98WirssmGmCOEjReJs
	Sf40plzVkKadDYBHuEkjMPwIYvc/Y7pdawbGXAD2vB861yA1XUrWV51vBTQpi5AKWYqZt3P42FZvU
	3rIBB7HA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFEZO-0000000Ffpt-0lJE;
	Wed, 14 May 2025 16:02:58 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFDoZ-0000000FXyC-0TDd;
	Wed, 14 May 2025 15:14:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C85655C5877;
	Wed, 14 May 2025 15:12:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFAD4C4CEE3;
	Wed, 14 May 2025 15:14:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747235672;
	bh=dLC9FGNy02pDL83tAaPJ87NrmGoBZGcsUzjb8XxGGNg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HIsCCnkYpMWRtgCuQ3NFvMu+EM6eBuTQd4/ta+3wVQ6TTWIdcUylOtLpkwwZyxitX
	 q7LiHj5+rDSZ4YFHvkIHCZRR4qRbZWZe1LaAWwEj2967aZR7IMbltvSElc2wV6pSrd
	 /3wYFs16JBeHJBokX3dMCFd/64zzAs+SeCroZDGIg2iC5jCqYvlo4wWxVVIBkOqowu
	 9Et6lw3xW8OIm6D73GH0QSPjTFlRGyNZ3Atzu+SgEdtmfAQQB+SYr6VHzJQX2Yk7oo
	 PL7sDdebc1aoK4LfnAQ5whrdw/zjJlivgcptMl3yHe+8aynTAlCa9NoQBs43zHpkWy
	 jUui5QRzIUmTA==
Date: Wed, 14 May 2025 16:14:27 +0100
From: Conor Dooley <conor@kernel.org>
To: =?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chen Zhong <chen.zhong@mediatek.com>,
	Fabien Parent <fabien.parent@linaro.org>,
	Alexandre Mergnat <amergnat@baylibre.com>, kernel@collabora.com,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH] regulator: dt-bindings: mt6357: Drop fixed compatible
 requirement
Message-ID: <20250514-unifier-drone-9e50962071ff@spud>
References: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N++8apABCTdwFzjN"
Content-Disposition: inline
In-Reply-To: <20250514-mt6357-regulator-fixed-compatibles-removal-bindings-v1-1-2421e9cc6cc7@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250514_081435_191608_D9F352C4 
X-CRM114-Status: GOOD (  13.45  )
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


--N++8apABCTdwFzjN
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 08:36:06AM -0400, N=EDcolas F. R. A. Prado wrote:
> Some of the regulators on the MT6357 PMIC currently reference the
> fixed-regulator dt-binding, which enforces the presence of a
> regulator-fixed compatible. However since all regulators on the MT6357
> PMIC are handled by a single mt6357-regulator driver, probed through
> MFD, the compatibles don't serve any purpose. In fact they cause
> failures in the DT kselftest since they aren't probed by the fixed
> regulator driver as would be expected. Furthermore this is the only
> dt-binding in this family like this: mt6359-regulator and
> mt6358-regulator don't require those compatibles.
>=20
> Commit d77e89b7b03f ("arm64: dts: mediatek: mt6357: Drop regulator-fixed
> compatibles") removed the compatibles from Devicetree, but missed
> updating the binding, which still requires them, introducing dt-binding
> errors. Remove the compatible requirement by referencing the plain
> regulator dt-binding instead to fix the dt-binding errors.
>=20
> Fixes: d77e89b7b03f ("arm64: dts: mediatek: mt6357: Drop regulator-fixed =
compatibles")
> Signed-off-by: N=EDcolas F. R. A. Prado <nfraprado@collabora.com>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--N++8apABCTdwFzjN
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaCSzUwAKCRB4tDGHoIJi
0mJuAP9B/4VHGsZ0X0xndPuB01QdvWEoq6ZF6LCGTnGqk9VovQEAzjrQLtDlhNVH
A9jrFDYDFsPGw/EqpX0665ygyUQ18w8=
=URej
-----END PGP SIGNATURE-----

--N++8apABCTdwFzjN--

