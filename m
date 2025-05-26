Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0796C54FB3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 May 2025 14:31:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n4iAyfmAHDQbsS1EO/JqRd7baMPaf1ePJ1/X2CCfYFE=; b=Wbk0q+Gn3gW0AQ7JFE2cvLPFwi
	/qCShlCTBD+AVirV5cNoMB6G77Yzcm/tZZ+z5f+m+oHu2W2yz78LIC6KvXMzwilTC8VZorR0caJQW
	GDrs5hIsG7UzSwPTurMUh3tB5PAldxJ4lSCP9kdg4IBozFWK9mtqO7GVFlbvw5AGccA0SYgKNzgss
	3pTitUA/i6DuIqnaclnzLfA6ooA67X5goUBkkVW/f2jHsc7kgqon1GuiQNgplurTGLfPrgvg0IpIk
	lj+mVG5F18Grpyp9zmVVam8TYoKiMz5NA10EG6pE5Zv/WxYJtCO1ame1C0omQ/OcpelGf5FgkG198
	rfqitSzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYr4-0000000913n-1DSj;
	Mon, 26 May 2025 14:31:06 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uJYoy-000000090sy-3wzU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 26 May 2025 14:28:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5AB916113B;
	Mon, 26 May 2025 14:28:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3ADEDC4CEE7;
	Mon, 26 May 2025 14:28:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1748269736;
	bh=n4iAyfmAHDQbsS1EO/JqRd7baMPaf1ePJ1/X2CCfYFE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FVKOUmfKS5yHfU1rOTLdJ9hNKl948oPmJYsPatXW9hjyV1EuSKEpDwXhAhwZr7Lbe
	 s4sG8xFzbB9G2vhptfRjlryu/iPI9Wb5J5lJIfZgXcJKaAMw707Y9iDGmfPIBDvfVT
	 yuTYQFcrjsA98u+OMFtaDuKjPidNXBFAslwQ8a8IefnLHGgpaG3rV4kD63YkHOPSUP
	 pRoTt2sDxDlsAu80a3na03FsoyANsa0jsQ4ERSPeOyoFSqJSd3fRD+IuGY8HkZxOT5
	 ppDfz0iMbv8scEjdao7dWoamDFMuZJCt6jDFWMOR22J1kDjwqK/Bwx2u/xKHEAR2iX
	 vWsGJRylscVhQ==
Date: Mon, 26 May 2025 15:28:51 +0100
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: soc: samsung: exynos-pmu: Constrain
 google,pmu-intr-gen-syscon
Message-ID: <20250526-hardware-periscope-08c2d4d4608c@spud>
References: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="xJlw5npM/QZjJtIy"
Content-Disposition: inline
In-Reply-To: <20250525190630.41858-2-krzysztof.kozlowski@linaro.org>
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


--xJlw5npM/QZjJtIy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, May 25, 2025 at 09:06:31PM +0200, Krzysztof Kozlowski wrote:
> PMU interrupt generation block is not present in older Samsung Exynos
> SoCs, so restrict the property to Google GS101 only.
>=20
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Acked-by: Conor Dooley <conor.dooley@microchip.com>

--xJlw5npM/QZjJtIy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaDR6owAKCRB4tDGHoIJi
0oihAPoDZbCU9o7lQHTuSr2zLVT5NPnXmxkQ4B1eqoQvLv3b5AEA+3563CoFF2lt
t2UeGUATSyYgk+O2mKtMzhhAyeZ3hQo=
=reNG
-----END PGP SIGNATURE-----

--xJlw5npM/QZjJtIy--

