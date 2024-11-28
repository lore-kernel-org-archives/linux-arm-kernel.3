Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C933DD70DE8
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 Nov 2024 17:39:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QDtYYY34TrLCwCe3jJq0qrdz4K378capT3XqmEqTNsw=; b=O4xC1OUvTZmbvs7c3kX770KwuT
	OLtLfGWUwTVAnQ9JlVLQJo6Louzen3Le9VR4YaOXR9s3+u5DpeBNPuvviyC1L3C2BQHQu3Kbu98sj
	qelDmSozJZYt6Tsbmg/iGZS4flVMtHVpsNug4TbQMVStLfvT/nk6LjL0ClgdM7fWx9LunyiZW+5Kc
	lb8f+5CMLC7m59anCgXHoXtVpc4c8XavCfygvdBr2P6rcunHFvelW3y33vtJEDmyYs/BvSXqBmr46
	8/gqKBjrl9j8bh9huNoHYwIREfNKcoir1SF94fXRTgcNVSHQR3UETF4DAFKbZmy7pYpecbLd2SZdz
	cWRLNSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiTf-0000000G5lG-2mXc;
	Thu, 28 Nov 2024 17:38:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGiSg-0000000G5b7-11lW
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 Nov 2024 17:37:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 55F545C5E05;
	Thu, 28 Nov 2024 17:37:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B64A7C4CECE;
	Thu, 28 Nov 2024 17:37:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732815473;
	bh=o0pwC6XMRknJjTBnnyoXbxHTkRylRZacGbA62fKdvIY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SmdEJ8UX+T5rOEd1AGccC/II4MDyux7ErVstPuUFtEywl+C2wRVoMvQcTnYbAh/Wi
	 0iHouiETVr24Ot+mwYvGa72HwsMzKK3m5hZefZYkvwvjOqqYTK2WBput0cGg3QdkfB
	 P0tZrJ8z+1tThSqNz5MNdo242UmpEHeJIVv87orStQweRrfu/ay72EwB6yT3D+EjwF
	 4cGH1oANQizLuL5omgqjbkeO023xM1ajxnv7Yu36qaqRIt2u9Th+S1COWW+MoMVg+X
	 mBItimBVANBM+VjBeGX30rDILMHB3gBwHE37CTTLD1iwusM5TFoNRWc7VW47ZTuJDw
	 PY0oymZCMcvag==
Date: Thu, 28 Nov 2024 17:37:48 +0000
From: Conor Dooley <conor@kernel.org>
To: Frieder Schrempf <frieder@fris.de>
Cc: linux-arm-kernel@lists.infradead.org, Marek Vasut <marex@denx.de>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Liam Girdwood <lgirdwood@gmail.com>, linux-kernel@vger.kernel.org,
	Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>,
	Robin Gong <yibin.gong@nxp.com>,
	Frieder Schrempf <frieder.schrempf@kontron.de>,
	Joy Zou <joy.zou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v2 01/11] Revert "regulator: pca9450: Add sd-vsel GPIO"
Message-ID: <20241128-candle-guzzler-b7ea4e5ce643@spud>
References: <20241127164337.613915-1-frieder@fris.de>
 <20241127164337.613915-2-frieder@fris.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="N/ZxYTIhZMLCSiWb"
Content-Disposition: inline
In-Reply-To: <20241127164337.613915-2-frieder@fris.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241128_093754_370219_CE742A4A 
X-CRM114-Status: GOOD (  20.95  )
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


--N/ZxYTIhZMLCSiWb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 27, 2024 at 05:42:17PM +0100, Frieder Schrempf wrote:
> From: Frieder Schrempf <frieder.schrempf@kontron.de>
>=20
> This reverts commit 27866e3e8a7e93494f8374f48061aa73ee46ceb2.
>=20
> It turned out that this feature was implemented based on
> the wrong assumption that the SD_VSEL signal needs to be
> controlled as GPIO in any case.
>=20
> In fact the straight-forward approach is to mux the signal
> as USDHC_VSELECT and let the USDHC controller do the job.
>=20
> Most users never even used this property and the few who
> did have been or are getting migrated to the alternative
> approach.
>=20
> Signed-off-by: Frieder Schrempf <frieder.schrempf@kontron.de>
> ---
> Changes for v2:
> * split revert into separate patch
> ---
>  .../devicetree/bindings/regulator/nxp,pca9450-regulator.yaml | 5 -----
>  1 file changed, 5 deletions(-)
>=20
> diff --git a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regu=
lator.yaml b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regula=
tor.yaml
> index f8057bba747a5..79fc0baf5fa2f 100644
> --- a/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.y=
aml
> +++ b/Documentation/devicetree/bindings/regulator/nxp,pca9450-regulator.y=
aml
> @@ -77,11 +77,6 @@ properties:
> =20
>      additionalProperties: false
> =20
> -  sd-vsel-gpios:
> -    description: GPIO that is used to switch LDO5 between being configur=
ed by
> -      LDO5CTRL_L or LDO5CTRL_H register. Use this if the SD_VSEL signal =
is
> -      connected to a host GPIO.

Your driver side of this, that I wasn't sent and cba downloading an
mbox of is not backwards compatible. The code has been there for a few
years, are you sure that there are no out of tree users or other OSes
that use the property?

tbh, I think all 3 of your dt-binding patches should be squashed rather
than drip-feeding the conversion. It makes more sense as a single
change, rather than splitting the rationales across 3 patches.

--N/ZxYTIhZMLCSiWb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ0iqbAAKCRB4tDGHoIJi
0mT0AQCiXTwqFM5+GxJLCoh7WYfKuJN5s4Z/8m1bpp4wS2AK0AEAkpOHLVq34pmH
y8/xAjnEN7qQ1XsI4kWZ/mGj5QtgoA8=
=zhjq
-----END PGP SIGNATURE-----

--N/ZxYTIhZMLCSiWb--

