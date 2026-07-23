Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5122C531F7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 20:19:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=46FWN177CCjlOBe+CD5xXNqVAb5ZdbN00qmRFVOXbnw=; b=3/ogmZ2mtoyJxD5LGnxmMb03Qg
	4UmRvZ3+NGfd1CzaEcykBDlMhA6O1SbsD0EeOvG5uA3hD9go1zfaSqSMT80Du8rdrmH+9Ox5dpf33
	ym3cwZFZMgWBqUtWEPYV4eB/d5BGnKPG7Kc0cTNYPsnCeFkolHwAyMnV2O/yrECqrNL+BCW0PiwYF
	EAuC0KIka/oFJ2r2C8gy7r1xFyts2d/HFUs+xGzT9Iqrnzejxzcrg9TWJrMts8VtPYHs5eYrnp9sw
	zkq4aRSrY7n1kvrJWcmivq0Oi+73yBs/nZ4MrSepzmd9sNJXwpZ2/OsQPxDU6yIdGCefwt0Y9GVdo
	QGXF/tkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzse-0000000F1Pn-1oSL;
	Thu, 23 Jul 2026 20:18:56 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmzsb-0000000F1P7-49AO;
	Thu, 23 Jul 2026 20:18:55 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 46F973700EC1;
	Thu, 23 Jul 2026 20:18:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DB8C1B49E9F; Thu, 23 Jul 2026 20:18:46 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C5575B49E99;
	Thu, 23 Jul 2026 20:18:45 +0000 (UTC)
Date: Thu, 23 Jul 2026 22:18:44 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: Jiaxing Hu <gahing@gahingwoo.com>, detlev.casanova@collabora.com,
	mchehab@kernel.org, heiko@sntech.de, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	ezequiel@vanguardiasur.com.ar, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] media: rockchip: VEPU510 H.264 encoder for RK3576
Message-ID: <amJ3JJjhlBokyzB5@collins>
References: <20260722073417.2064667-1-gahing@gahingwoo.com>
 <082e1141c38205222a91abf13b1a97d9a00e117a.camel@collabora.com>
 <20260723004642.2075233-1-gahing@gahingwoo.com>
 <210b72e32d1bd757a36b2baf532dd9f7d46ca5dc.camel@collabora.com>
 <amJgcHf2vVDb75nR@collins>
 <252d53c9e497530f9416599f9991b02c0c276a1f.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5NbzU9qqaTRP7CtZ"
Content-Disposition: inline
In-Reply-To: <252d53c9e497530f9416599f9991b02c0c276a1f.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_131854_356567_BC48B586 
X-CRM114-Status: GOOD (  29.23  )
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

--5NbzU9qqaTRP7CtZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Le Thu 23 Jul 26, 15:39, Nicolas Dufresne a =C3=A9crit :
> Hi Paul.
>=20
> Le jeudi 23 juillet 2026 =C3=A0 20:41 +0200, Paul Kocialkowski a =C3=A9cr=
it=C2=A0:
> > In my opinion it would be fine to have two drivers, but it's really up
> > to you. Since you already have a v4l2 base for it, I would encourage you
> > to move it to my proposal, which will probably be finalized in a shorter
> > time frame than the other proposal and lets you reuse the code you've
> > already written. Then you could also add RK3576 support to the drm-ish
> > Vulkan Video proposal without too much work when it is ready, reusing t=
he
> > RK3588 work.
>=20
> My main concern is that once you exposed an API, the transition path is n=
ear
> impossible unless you accept to support both APIs concurrently. So I may =
raise a
> slight objection on the above proposal.

Well there could be a recommended implementation using your design and a
more experimental v4l2 implementation that is discouraged to use but
still available.

But that means another driver to maintain and more long-term involvement
=66rom Jiaxing Hu. I am not sure it is worth it, but I don't think we
should entirely close the door on the idea. I also understand that there
can be a bit of frustration with trashing code and a desire to continue
working on it (especially now that it can benefit from the technical
knowledge acquired from your work). But I'm just speculating here.

Still I would be interested to eventually be able to compare performance
between the two approaches on the same hardware :)

> Once we have the code shared (Detlev is
> working on it), you'll see that Detlev (and Daniel Almeida) implementatio=
n is
> just a step ahead, and adding RK3576 to an RK3588 is just a minor update =
(its
> the same chip, different minor version). On top of which, once the kernel=
 driver
> will have settled, adding more codecs will mostly (or entirely) happen in
> userspace.
>=20
> With no offense, the RFC here requires significant work before it can be
> upstreamed. A lot of the code is hex tables generated from inspecting a r=
unning
> driver. So there is a lot of work to decipher this into clean code.

Yes I'm sure there is still a lot of work to do.

All the best,

Paul

> On that aspect, if you are missing any reference code or technical
> documentation, let us know, though I believe most of this is public infor=
mation
> for this chip.
>=20
> regards,
> Nicolas



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--5NbzU9qqaTRP7CtZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmpidyQACgkQhP3B6o/u
lQxJyQ//UloJz5n2lXdGyt3Z62A+B4oIbB2DTJ/v3EPlh37fTfmMOnXOR25G/Em+
I/4rc0DjJmSROIwu4b8DnZ5VC3NVG/K1F1+MxV67UXImGveKxrKzzs8CJ5/7GoOB
Gb8Xm6XzGYgsT+gYuNq5pxSIOZkO5RjrXlZdXGY1kkCO+0ht4ZBOZgSHWktIYWva
1wLIDQkt+eHnQ26lVLs1bDFjy8zE3UZXYTC04Qx/P0RNMA59f0iajMuVEOR9smvA
DqDQV7kklKA6wwqXYY4ksgDdIdyYuJVSLrBYMAIuS0CcGQEKkc3nB841bRT2Ow6y
ll8iHyq2ACkhJMZbG5uZ8W4258sLZ7Cp1bCAlK4dWwM9e0CArnqAdP7Y8g1RBfMn
ydWXbCl5wKIr1tQOTXDlu+pH+3k1lXj11FBi8zlB3CqwaFIibx9zTy3gAapzPJX5
ZHLw8t7dcK8xpaHAJXb0iDuffX+iOoa1irhTt9WCgfkZhOaPyh529N9GVHm1l54N
pLWa3cw4IkJ4n2HuKPnzkB/2sJrY/l7cng9yQH7+ls/7Weq5x/R4qMJCKOCu42GX
tpU5Dv13enniO8YpCbm94KetXN1OqLlC259A71vC9MlalzSmyGYr/RL8RICQ0+9O
kHxrS0Syc2qOjAfePLfm2KAMwbvsJ0K8iLN5wvSUa3gLnIkpJSc=
=Nec2
-----END PGP SIGNATURE-----

--5NbzU9qqaTRP7CtZ--

