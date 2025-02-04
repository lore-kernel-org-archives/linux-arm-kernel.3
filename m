Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 33773C02193
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Feb 2025 18:15:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xdGtLFDo8ehnTibs2dWaZ2yvf9XQMvOCx0dpJl+p8gI=; b=yEYcGNgdNuzOzbGWKpN9+IbFxU
	knwTcLWaJwQ+wwnZTiOYlcADDVWWd+ATcsG3oBsMgxxOXbNTGRUrtfAhHWjt3ujUmmSeon0Wffrse
	n5tk0M53z9eOgAcKFVqjvzVpEi9/Re0iqsa2LKlSKtEqv3/tAGr23IDEcYMbY35UAJzEoQ7f1BLyz
	IfxjxCFE1xaPElcH5EtFFPFBuXyvbVBMU/HvS+PbNPeGgiEmROFSzKWVy4JzMykyg96I6UCmGiY/E
	CmzCDVCn9bnxnAVitQTzSg8UVgxdE9Cc1I1Q1f8u/qaiqnPlGvKjIFHQxJb6RlkiGGLPWDjudS0QY
	hIBr7q/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNSQ-00000001BfT-0H8C;
	Tue, 04 Feb 2025 18:15:34 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tfNQS-00000001BMR-1sGg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Feb 2025 18:13:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 684E65C4D3A;
	Tue,  4 Feb 2025 18:12:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C6E4C4CEDF;
	Tue,  4 Feb 2025 18:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738692810;
	bh=kng2DyWqA6JNggrFjlRb12di5rEVwAZW0UowZQv67Dk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Hf5aon4qmPlqr4e++nSMJgvbrB3O224PLfXIuYjCkj744Yg2dzK+Z2AIkiAIFElBm
	 rNWNNLp3/rANocqTUJU+tJr55DRrrqRyDCgR8gH+wFbfyA30meY7LQVluU6wlCnYCH
	 JRdZ4FChhk1gugaCtikxrEBZy/29ZMCsYmsfYXR35qlgqeOtAQWAKY0qI3SttiSShq
	 3ES8dyRIsIPqQ0suLHUWJm/gyRUgh4bTtqMwZPkgrusWj7NiAHLIhxmszAOdq/1cRz
	 lxW4jZC34BX2o0e1AMSp43157jv5chMWOF5W8clTvycuQSTHWn4MvMsI1nQwEh33tO
	 j1TvVDDYwMLNg==
Date: Tue, 4 Feb 2025 18:13:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Kaustabh Chakraborty <kauschluss@disroot.org>,
	Rob Herring <robh@kernel.org>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Sergey Lisov <sleirsgoevy@gmail.com>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add chip ID for Exynos7870 SoC
Message-ID: <20250204-stump-irritably-9a888742b1f7@spud>
References: <20250204-exynos7870-chipid-v1-0-0bf2db08e621@disroot.org>
 <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="t2zFMrcacXUKjbe6"
Content-Disposition: inline
In-Reply-To: <339ea40f-6bc7-42ad-a5c2-f57b3be8cc39@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250204_101332_526442_3F137820 
X-CRM114-Status: GOOD (  16.83  )
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


--t2zFMrcacXUKjbe6
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 04, 2025 at 08:53:31AM +0100, Krzysztof Kozlowski wrote:
> On 03/02/2025 21:32, Kaustabh Chakraborty wrote:
> > This patch series is a part of Exynos7870 upstreaming.
> >=20
> > Signed-off-by: Kaustabh Chakraborty <kauschluss@disroot.org>
> > ---
> > Kaustabh Chakraborty (2):
> >       dt-bindings: hwinfo: samsung,exynos-chipid: add exynos7870-chipid=
 compatible
> >       soc: samsung: exynos-chipid: add support for exynos7870
> >=20
> >  Documentation/devicetree/bindings/hwinfo/samsung,exynos-chipid.yaml | =
1 +
> >  drivers/soc/samsung/exynos-chipid.c                                 | =
1 +
> >  2 files changed, 2 insertions(+)
>=20
> When I asked to split, I said per subsystem. Soc is one subsystem.
> Everything targeting SoC should be in one patchset. get_maintainers.pl
> tells the name of the subsystem and its maintainers.
>=20
> If there is going to be resend/new version, combine patchsets for soc
> into one patchset (just like the example I gave last time).

And please send patches to the address people list in maintainers, don't
modify the addresses.

--t2zFMrcacXUKjbe6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6JYxgAKCRB4tDGHoIJi
0jLeAQDdvqoiOqQKqVa5LNCQXQV66EX+r7UEIBsCt9LVGuMpewEAw0yZ2uQRkO3F
3PnnDGci0d1yk9WSOgA3ys9/3IWmagU=
=OWFK
-----END PGP SIGNATURE-----

--t2zFMrcacXUKjbe6--

