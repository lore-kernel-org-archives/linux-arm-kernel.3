Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2ED32C1B087
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DwHRwZmE4pv5OgydkogVPm2m4foeghXLNP4W9q1z10s=; b=VL+uLjFS6Lxd0UYD/un8WVSndh
	AxyEQKDf3kAsyGIEmI+LdeXyusJzeJdnHpJ/Sm31QgRUso0oydUrgMFBKgKwLn3cAF/6+muOl51J/
	hVayLdlLeepiOliy9zyq7aFbgpqj4ypoCWQl5HwS5+6Ap/ml+17XqEh66tviJqqNRh0tC9DgeXWTn
	9Wu6Q22DZ4gaSPgynnA5IAzhw+7p0vp29h1MJq8K2fJnH6rtcIrW3Vlz6ZiPn9K+aBgGmFOK4onjs
	ROsnwD+NY9KYK+0XhCnN7xU/8wGe9LcWGg3aGvscHJBmsndzUxjHTZ4q1I09Qt8LHN2kglynb4D0x
	RjONYT8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhK-00000008U4p-0Fu8;
	Thu, 27 Feb 2025 19:37:30 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfND-00000007qhl-2q2y
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:00:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 249535C5DE6;
	Thu, 27 Feb 2025 14:59:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D07CC4CEDD;
	Thu, 27 Feb 2025 15:00:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740668426;
	bh=/wEWDdRFvDhvBDXL2VX1k4uW6fkAuxc2yL3wG/BajfM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FBodfDEd7ufhMdkegCEIXifhmdKJEbQBFH73iRziE7fUxcJG3pQ8uRd5Ykm1o9N2J
	 ltD8hyx4eDfINE197ZJrIlz/4x9QVixyC/CPKEr4r3SqZw1mLzsJj/xkWqvG+8JYFn
	 vvFAwFNOQmQHpfc98u/tIpPXdmeIv9RgPrAWziici+0L+qS1Kq0Wcvt88s0YHvC56N
	 1+hViXT7+UXkey9Arl7pXxMk5CkdKSzNU84JM4Y9ohY4TFUjqHpy/WCXcPKGRw6o8e
	 XT3AYZzFL096g5xUDK9HZ1VIo88y0oWQBQZs6+FORy7aO2GwDth7KX/MzsYjmUCjlN
	 /AWimxzp8ao1g==
Date: Fri, 28 Feb 2025 00:00:21 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <Z8B-BW1JwIrI18E4@ishi>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <7c9941e0-1169-46cd-95b0-785e8f72eb34@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="JRv2vhZkORQfAtjS"
Content-Disposition: inline
In-Reply-To: <7c9941e0-1169-46cd-95b0-785e8f72eb34@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_070027_802780_FBA2455A 
X-CRM114-Status: GOOD (  29.60  )
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Jonathan Cameron <jic23@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--JRv2vhZkORQfAtjS
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 03:17:55PM +0100, Cs=F3k=E1s Bence wrote:
> On 2025. 02. 27. 5:59, William Breathitt Gray wrote:
> > If that is true, then the correct way for this hardware to be exposed is
> > to have each TCB be a Counter device where each TCC is exposed as a
> > Count. So for this SoC: two Counter devices as counter0 and counter1;
> > count0, count1, and count2 as the three TCC; i.e. counter0/count{0,1,2}
> > and counter1/count{0,1,2}.
>=20
> And how would the extensions fit into this? `capture{0..6}`/`compare{0..3=
}?
> For me, the status quo fits better.

For your patchset here, treat it as if nothing is changing. So leave it
as capture0 and capture1 exposing RA and RB respectively.

> > With that setup, configurations that affect the entire TCB (e.g. Block
> > Mode Register) can be exposed as Counter device components. Furthermore,
> > this would allow users to set Counter watches to collect component
> > values for the other two Counts while triggering off of the events of
> > any particular one, which wouldn't be possible if each TCC is isolated
> > to its own Counter device as is the case right now.
>=20
> TCCs are pretty self-contained though. BMR only seems to be used

In the Generic Counter Interface, hardware functionality exposure is
scoped by its influence over particular components of the Generic
Counter paradigm. That means, configurations that affect a particular
Count are grouped under that Count (i.e. "count0/enable" enables Count0)
while configurations that affect a particular Signal are grouped under
that Signal (i.e. "signal2/polarity" sets Signal2's polarity).

In the same way, configurations that affect the Counter device as a
whole are exposed as device components. That's what the functionality
BMR provides does, so it's appropriate to expose it as several Counter
device components.

Right now the microchip-tcb-capture doesn't do much with BMR, but
looking at the datasheet I see that it does have the capable to
configure several settings that affect the entire TCB. For example, you
can swap PHA and PHB (via SWAP bit), you can enable autocorrection for
missing pulses (via AUTOC bit), you can define a maximum filter threshold
(via MAXFILT bitfield), etc. These are controls users would expect to
find as Counter device components rather than Count components for
example.

> > Regardless, the three TCC of each TCB should be grouped together
> > logically as they can represent related values. For example,  when using
> > the quadrature decoder TTC0 CV can represent Speed/Position while TTC1
> > CV represents rotation, thus giving a high level of precision on motion
> > system position as the datasheet points out.
>=20
> From what I gathered from looking at the code, the quadrature mode uses a
> hardware decoder that gives us processed values already. Though I don't u=
se
> it, so I don't know any specifics.
>=20
> One more thing, as Kamel pointed it out, the current implementation allows
> channels of a TCB to perform different functions, e.g. one used for PWM, =
one
> for clocksource and a third for counter capture. Whether that works in
> practice, I cannot tell either, we only use TCB0 channel 0 for clocksource
> and TCB1 channel 1 for the counter.

In theory this shouldn't be a problem because the counter driver
shouldn't try to perform non-counter functions, just expose the
counter-specific ones when available. We would need to check which mode
the channel is in and return -EBUSY if that respective channel's
components are accessed during a non-supported mode. This is how we
handle similar situations in other counter driver such as the
stm32-lptimer-cnt and intel-qep modules.

William Breathitt Gray

--JRv2vhZkORQfAtjS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8B+BQAKCRC1SFbKvhIj
K2B7AP92Bqn5O1QmN/PsfBvrBJMxb/B6Caf8ZfWiXnKGsj0irwD+O+0ifNToacDX
/+9P6G5lzlqM3moVhdFNPdXC6ZCMjwc=
=sDy7
-----END PGP SIGNATURE-----

--JRv2vhZkORQfAtjS--

