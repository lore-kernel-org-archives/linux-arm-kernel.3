Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FE50CAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 25 Sep 2025 15:03:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YxK95fh32bmvs3eUOHU609gQaq6SCA9IhpuHiYw2yMQ=; b=j42AJH6fXKPQCY6i2L1xRzo9Gk
	UWp2f8htTrOXP5RbJwwkEzYZSChHNVr7P13lLCvSXtM7rPoWc/whaOqLTk2ZzwbiuqID741BVC6Ri
	EKeay2kUeZT0NXMoU8qHvLfZm/EJ3cwm2pl8dMySGioTGxseUu+nxQtyrNPS6YQPnA8ZddFD/+IpE
	6y8Omu0CDiDKUVaF4liiNSY+rwyQD5Le4MchCudo4mJ902EFF9hoNdY7NHl4fm/uq5oXTUS2zeTvT
	qz14OHh6G3jxNvg867YvmieCkvzyY28yCN8rI2A5dFBt9Syo03/A42VTxdnXUQNcY0zuFeTjcKeCt
	QLuV68fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nUn-0000000ANps-06VZ;
	Thu, 25 Sep 2025 15:02:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1nUl-0000000ANpE-3Dhi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 25 Sep 2025 15:02:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 037A06061E;
	Thu, 25 Sep 2025 15:02:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F1E1EC4CEF0;
	Thu, 25 Sep 2025 15:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758812574;
	bh=YxK95fh32bmvs3eUOHU609gQaq6SCA9IhpuHiYw2yMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=rjNhqR/zzn/S/ZVhwIN9MDllGlsfDj31D8pywRVM2dLJ61TbNhYV0Ipp/47yT/K8V
	 +EeNMQrPGA3Y1YvS9pEwQlpqUKofGbRYdyQoFmohqW8CJPDRht+9bgY/qI8lr+JKhY
	 adWcnSdTmZTQe79STkhuY4T+z7c5Zz3in6VcCFYurRXeHhEzlnfTgmIvHuAhPDJTvh
	 +IfzoynuWUtduAiApEGquaiuMZgddUYcG2/nzqaxRTQv1zaH/DAse1uAYVB3CE1O+7
	 qQagTF/E2Z06COnpG6TE1OvVNdLbyjjiSx+tRAMAKiRqVTSm7xo3KXtn0VZe87unF8
	 /tCuV5J6O+HrQ==
Date: Thu, 25 Sep 2025 16:02:49 +0100
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@csie.org>
Cc: Rob Herring <robh@kernel.org>, Andre Przywara <andre.przywara@arm.com>,
	Lee Jones <lee@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Liam Girdwood <lgirdwood@gmail.com>, devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Mikhail Kalashnikov <iuncuim@gmail.com>
Subject: Re: [RFC PATCH 1/5] dt-bindings: mfd: x-powers,axp152: Add
 polyphased property
Message-ID: <e1e31e6c-59e9-422c-af72-718fcb7051aa@sirena.org.uk>
References: <20250919000020.16969-1-andre.przywara@arm.com>
 <20250919000020.16969-2-andre.przywara@arm.com>
 <20250922181611.GA567602-robh@kernel.org>
 <CAGb2v64KvnvSy0-MYd7FBLVKeJQk=-=VWxRLsHXMP1+MFOPPfg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jx2zlekHxWXeOT9r"
Content-Disposition: inline
In-Reply-To: <CAGb2v64KvnvSy0-MYd7FBLVKeJQk=-=VWxRLsHXMP1+MFOPPfg@mail.gmail.com>
X-Cookie: Shipping not included.
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


--Jx2zlekHxWXeOT9r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 25, 2025 at 10:52:45PM +0800, Chen-Yu Tsai wrote:
> On Tue, Sep 23, 2025 at 2:16=E2=80=AFAM Rob Herring <robh@kernel.org> wro=
te:
> > On Fri, Sep 19, 2025 at 01:00:16AM +0100, Andre Przywara wrote:

> > > Add the "x-powers,polyphased" property to the binding, to describe th=
ose
> > > pairs or tuples of regulators that should work together. In the lead
> > > regulator node, the property lists the phandles of the connected
> > > regulators. Just an empty property means no poly-phasing.

> > Don't we have a coupled regulator binding already?

> That was my first thought as well.

That's something separate, that's two separate regulators that need to
be kept within a range of each other manually.

> Unlike separate regulators that are ganged together, in the AXP PMICs it
> seems that when buck outputs are ganged, only the controls for the first
> output have any actual effect. In such cases I don't know if we should
> just ignore / leave out the secondary outputs from both the description
> and the runtime state.

This is very common, I would expect any regulators that are ganged
together into a single regulator like this to simply not appear in the
DT.

--Jx2zlekHxWXeOT9r
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjVWZgACgkQJNaLcl1U
h9DZDQf/YukKJO9QFk1kcg54NRNKNybvOqiTJfwZP4IhbmC5UEJESH1PbN7zcdH4
gmAKpJKDxrVMVLUfEUy1xOe8Kp+x1/ijJ4MHqZ8N5wnTba1KVnx+Ga+HP0lMwzh/
jGi/p8yAsZABxkpicJDMeo9tO7HcE54w3h9bahmHVqq/xLF9NbZhSIrkuak9WfgC
zbbwPBTxLbHA2WFdT6gE5BB/H2ZDs59gGEpc9t096dMZ1lA/s/EAie0xL22jWvjR
g/HvfTCXxLIq9Pmxf7nrUsaYadrmQPOl5OkLjKKlOpS9w0pt66SMvGl7NHu6ZMBK
+L4DakUqm1K0vlA6KvcmIl72yDcslg==
=lQZb
-----END PGP SIGNATURE-----

--Jx2zlekHxWXeOT9r--

