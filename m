Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6B0CCD4846
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 01:25:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WmI5uFHKfFnMJ69xxu5ilKDj30A+JvH9IgU8N+M0S5k=; b=wBqx5Q3i/x+O0Fbh0eYvp5Thz/
	o+vf084KK1rYBhD15JWCW/wonGwQ1SlBVZCcYlGMaBO6edl+Y18pBSTmKBqGALwoGRYRff1VloZ95
	6x55vhyR/63EM/DPuQlH9NTtoqgksQsakPrCEtaoWPa49ZGY6BdOfiOnHaWGmj5VF8sb0gIo7g+Ph
	vn0A2s8sOJr/OA9kv5q7yvPhyE2uOQGuE7TTGifWOHbjoXKnDjnYukSvFPI0JQR/6saEQlBeonZoa
	voqtYjmkXrKc4aJphf9WfkMSPqdrFBMbAcGy0J3bi/yKu0yfUuMQlbkCq5QG4s8JiHUO4bNQ6zpwU
	pqbDQG8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbsW-0000000FAnJ-0Syx;
	Tue, 12 May 2026 01:25:44 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMbsT-0000000FAmV-2Ne3;
	Tue, 12 May 2026 01:25:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id A4E7142E09;
	Tue, 12 May 2026 01:25:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63B90C2BCB0;
	Tue, 12 May 2026 01:25:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778549140;
	bh=MDx6wyxJnrpM3xEGYmY3gDJSK85ARjHDfhMiTGvsheY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LacaZ//coubQsRNc1+AzKM4LLAQnjbZPI3UjHyCQ44EwYCejFMzDNMIyW0OhqNvuL
	 9y3ekVJ+rqxPYKmvBnxltPSQR36guKuhBxP5NnRcTxVBh6A23oIN55Qnbnhkm4uInv
	 1c2W3MKUPsu4NTEbWDyeIu7c+7qeDDSUTgc8la4pXrjyoOKNP5HcbFJCMrIABuCOoo
	 X0ZaPpQKe9KORWQjspPtC2QNrTlZnt2qN56NkqdiUyvNVlGgSpoqO03MEQwK5zBsmB
	 SSAjQwb3D/SNB/kPVhoE3cdYelYQR1ZzNp/SdgbYAdpaNS0WiThQczlbHiK2VYaboP
	 kkhDLQglFdJXA==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id F3EF01AC58C2; Tue, 12 May 2026 02:25:37 +0100 (BST)
Date: Tue, 12 May 2026 10:25:37 +0900
From: Mark Brown <broonie@kernel.org>
To: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: linux-mediatek@lists.infradead.org, lee@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org, matthias.bgg@gmail.com,
	lgirdwood@gmail.com, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	kernel@collabora.com, wenst@chromium.org
Subject: Re: [PATCH PARTIAL-RESEND v12 0/5] Add support MT6316/6363/MT6373
 PMICs regulators and MFD
Message-ID: <agKBkUBVM81Y6MUk@sirena.co.uk>
References: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ZO04f3tElFI8BsTK"
Content-Disposition: inline
In-Reply-To: <20260511101355.122478-1-angelogioacchino.delregno@collabora.com>
X-Cookie: Truckers welcome.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260511_182541_630112_C5A13A55 
X-CRM114-Status: GOOD (  11.26  )
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


--ZO04f3tElFI8BsTK
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, May 11, 2026 at 12:13:50PM +0200, AngeloGioacchino Del Regno wrote:
> Changes in v12:
>  - This is a partial resend. MT6373 regulators and MFD patches were not picked.
>  - Rebased over next-20260508

Is there a reason why this is a single patch series, are there any
interdependencies here?

--ZO04f3tElFI8BsTK
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoCgZEACgkQJNaLcl1U
h9Cl7wf/eGQ+SEV4WqVTokc90PnMsjaK7jSAFGVrllzf7QEaXe5nO3B3fWEelwKE
8t91+XH2mSW/YD/rSts6vFNTKBFZSKjCQ8SP2km1j5SxAxjN/SCIyXloy4MyPf4f
SS0frCVFc9ZdmqYHVolKlRGvFObHCyZH8dXNmvs+WRgm4HlpJjWz2SycDxdZXtS9
E/WEycZxxWMbuIJxesMr5hunbjozk1zbOKXDafHzjqzqEFiYXcvhvmTQV10CnJ3y
iipRScZhn+35h1bkg/QTR/WE/Oui/uRumeFkKSMonav4lu1X2vac4CzTMhM6uchX
oWUtt17l1wGDsLnlCCGF2cI5VwUP3w==
=GoUg
-----END PGP SIGNATURE-----

--ZO04f3tElFI8BsTK--

