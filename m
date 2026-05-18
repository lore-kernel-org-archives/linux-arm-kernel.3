Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86797CD4F49
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 14:14:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZgPHNxFeYLuFZ/hmvF0vBYpJj99fq4Y1mXbnP9/ld0U=; b=0kMYA2AEW2oa1zwmI5ePE7SiL4
	1zk3EIcFuD9z0Q7eNhSN0hw3m6Dfd9EvjSEtrRdM3K2K6pQ7PkX2FEEZVg2b/4CI9WctYVW4NG8i1
	h7zUh3XJT68M6+7cHHML9FpG9agQRApCGwB3+108C/2FTILI2vAVY1RzcGRYwzuDbeYKG78vEqBOm
	0ZnBSlxRP9epG8jHphij6cbrKLc87rVDJh1X1p82eeCc99QuCtbzukrxGQkEvEQqLMi0T+e99eORq
	igFwNZTXQBDpmg6qx3HL0ZkH3/ZLqWuOJ7A3Xc6ElbOmWgb5kfmrf14gm3B9uhtVLdhwgXwH36Cpv
	vCPZC43A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyk3-0000000FwcU-1rOJ;
	Mon, 18 May 2026 14:14:47 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOyk1-0000000Fwbn-0KAy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 14:14:46 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id D648D1F80044
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 14:14:42 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id EE03AB407F8; Mon, 18 May 2026 14:14:41 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 74C9EB407F3;
	Mon, 18 May 2026 14:14:41 +0000 (UTC)
Date: Mon, 18 May 2026 16:14:39 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <agsezxcxjQlBmesm@collins>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <agr9m_tidBr6Cu2h@collins>
 <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="13+JjIMW89tJHa3E"
Content-Disposition: inline
In-Reply-To: <579c7c33123c4cd0bd486301e56daf5962ca55ec.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_071445_304412_72EFF1F2 
X-CRM114-Status: GOOD (  23.54  )
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


--13+JjIMW89tJHa3E
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

Le Mon 18 May 26, 14:09, Alexander Sverdlin a =C3=A9crit :
> Hi Paul,
>=20
> On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> > Just in case you missed it, there was a previous submission for this
> > board which wasn't followed up on.
> >=20
> > I also have one of this board and wanted to respin support, but it looks
> > like you beat me to it :)
>=20
> thanks for the hint!
> Do you mean this series:
> https://lore.kernel.org/all/20241227-a133-display-support-v1-0-13b52f71fb=
14@linumiz.com/
> ?
>=20
> I've missed it indeed! I'll look into it!

Yes that's the one! But I don't think there are features that your
series is missing, as long as you apply the suggestions I made earlier.

I also have a U-Boot config ready for it, which I could send once the
device-trees are merged on the kernel side. I could send it to you if
you're interested.

I will also get back to you about your TF-A series so we can move all of
this forward!

By the way it's good to wait a few days before sending new versions of
patch series, to avoid overwhelmind the developers.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--13+JjIMW89tJHa3E
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLHs8ACgkQhP3B6o/u
lQzxQxAAj+POVozr8ILWTwBBo8K+9u6fOAhaIvVBK9Gh6e6QwQNxajiypvE+Ycbv
dsdYblGjo71iJlVVK/zbnzKA/1ISAjszLEMeKA5klCl74P8l7ev3rWtetQECbg91
8Ntww4kc9uDVuIDRpgRfkR2RFch1TMnPHfOPKY3k4jGJMIfLaOAhxCpcrclEmhov
Pl/IvFc8R3z8EpdAhrsa9yEcrboK/NpUH2Ja6SlYZ2KNceoTfnMl0kBFKJ/njt6k
XKe4nglJ5u6nHlnScCZDc/4w8tiOkBPAhV+IaEQ5qgSn9Y6At6d6NG0+/e7IETGr
0EN5Xv/CWoEjFpKNSiC59ar0zRm9nF028wficzJsM5+dLuoHDXxwrl6zoObEzu13
1VihUwQmzPWDZb00ZBSq6FPlmfLXzNqMz93hPe9RHqdyg1v61N6aDSl9+UQS6v4i
sSblUNGlnoIvWf5FaFmEksVxutLGVZstQBoxzVYQqOA5Ck67c/ImuUCzdF1iAn0n
x2BfCz37xh3IcvHUYYVcKmpO40OAYSypvYQDHz8WCacmnSBEUJVfgaLoqmRdOBxe
c6d7pCjgFsIP0EysryqtUX/PSot2BdsqdHvmO5ckiRGf9juZCPWEcoHNhu2geEI6
rho/+QfaS4RVA4E8SXUgqzqj5f0q5P4vWmcrDst3NLfj/EHQA3o=
=1xn4
-----END PGP SIGNATURE-----

--13+JjIMW89tJHa3E--

