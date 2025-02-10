Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 833CDC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 13:24:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GmFBSooAPgBICRFFl1zRjjMwEJvHUrGlnGItfZxGH5g=; b=cgw3iK5Li3dJfkmqq2fc47WjJg
	zzfd5ZwVpYY0k7gmI4pVcZ4ZBmR6bKC5FpEWPSI/Qu9yF5GUfVX9TC+kR3E/3es9fO7cjPkpafny7
	DXR52wVis7CKI/qpfaTjvpogiC8IQiO7ECywyhpI21J0j8KCgRrIvxes22KEwBCa+OsmOAFY6pvU2
	HORPICztflyX1gBEBBO1MwWhQxy8VsP5cPKTm5YnF9CtNJHjiPf2eNVl5od/HhKNjUhqvm38a+hNP
	P49d4v3dULfWTtUunOW4p9Psz0zLZEEhfbFjwxax6K0lF7ZwjWJqsGwae4qB0YwWybHtmw4WBcy1D
	ov5RxCog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thTlf-0000000HX7P-3D1A;
	Mon, 10 Feb 2025 13:24:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thTii-0000000HWHA-2xAF;
	Mon, 10 Feb 2025 13:21:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 5F1075C566F;
	Mon, 10 Feb 2025 13:20:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E68AC4CED1;
	Mon, 10 Feb 2025 13:21:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739193663;
	bh=lbvK+R1S0to4+sFyhCiUUSM/9FdVL8vJT6v3dpUi7Tw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j4AESBWgPJM5RvSJTGIHU0D2oc2AIw6rs1zeVJykHsy5YANen2b1FheVdgalp7tNv
	 6qZvfth7GK8vEabaQRhJM83TGlkw2klGjo3wm0NKdjRxyo5WTzDSKAQ2bwGgabUOX1
	 tTC+I6tyWiqEnc3SaAoyLwOt7x5HAaBl879+fk1IwRmsz0qsz1jTeNNr2We3xkRtnr
	 kpYw2VFkiB+e3EB0T9wRS4HEpQkkWbeL/hrizEDfFeLOl3PuXe6RR30yThrHvvGZBv
	 R6KEpvmiyTUQYjyedx8LNofbDxbZCG2B0mqh09dE1kQ+PAJKvjZOmI9r5Rr7gIgqAb
	 02RLkMRZ5kwfw==
Date: Mon, 10 Feb 2025 13:20:58 +0000
From: Mark Brown <broonie@kernel.org>
To: Heiko =?iso-8859-1?Q?St=FCbner?= <heiko@sntech.de>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alexey Charkov <alchark@gmail.com>, linux-sound@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: ASoC: rockchip: Add compatible for
 RK3588 SPDIF
Message-ID: <56d128d7-c4bd-48de-b823-0b88147220e1@sirena.org.uk>
References: <20250120-rk3588-spdif-v1-0-1415f5871dc7@gmail.com>
 <20250120-rk3588-spdif-v1-1-1415f5871dc7@gmail.com>
 <4315116.iIbC2pHGDl@diego>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="eAhunf2YJnuAvrBB"
Content-Disposition: inline
In-Reply-To: <4315116.iIbC2pHGDl@diego>
X-Cookie: A beer delayed is a beer denied.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_052104_788118_95B6AD1E 
X-CRM114-Status: GOOD (  17.23  )
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


--eAhunf2YJnuAvrBB
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Feb 09, 2025 at 10:10:47PM +0100, Heiko St=FCbner wrote:
> Am Montag, 20. Januar 2025, 10:01:27 MEZ schrieb Alexey Charkov:
> > Add a compatible string for SPDIF on RK3588, which is similar to the
> > one on RK3568.

> as the binding is more in the driver-realm, is this patch still
> somewhere on your radar?

Please don't send content free pings and please allow a reasonable time
for review.  People get busy, go on holiday, attend conferences and so=20
on so unless there is some reason for urgency (like critical bug fixes)
please allow at least a couple of weeks for review.  If there have been
review comments then people may be waiting for those to be addressed.

Sending content free pings adds to the mail volume (if they are seen at
all) which is often the problem and since they can't be reviewed
directly if something has gone wrong you'll have to resend the patches
anyway, so sending again is generally a better approach though there are
some other maintainers who like them - if in doubt look at how patches
for the subsystem are normally handled.

--eAhunf2YJnuAvrBB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmep/TkACgkQJNaLcl1U
h9AzqAf/T2ZOQi4K9XfreabaTdPLm81THw5/XTKa/58i7z3jL11ZII9/Ysaw3CiW
YnuvbkR4j45WfM2AeD5BDn16fc9h+DDbNAqYefOwFO/tr98gejqkWblnx/rFpF9D
fNI/hH0hv+8unMp08sB+jdTjf48MtQHASTCqR0+MO15cT1pdgIvsz/ylNbkXo/c5
xrcpltcyDN/xa3QFa0WCIVcDQCRRUAdHuZt1dICCy7dRD7Jac+4PclQEYxMblt24
GkCkLXIUE80m/HlOcLqS2lJAELD/hV/aGFCLeo3PCaxKovKT8vj/6JKdhPvweZik
OOKsJg5hIinmNvYGZELSgMat3B6BbA==
=h/Aj
-----END PGP SIGNATURE-----

--eAhunf2YJnuAvrBB--

