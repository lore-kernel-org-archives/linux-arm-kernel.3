Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C310EC19F32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:37:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7STf7KR5l+VejlzjpR6E9zLjagUfqiPeoLC/F4HyI+g=; b=c82paZ4jXEXSsx5UODaAjnzRsb
	FQIXhmy7YREL+XUl9Yh3a09u1Y925hcoP/ba1/thxdxSG2jsuQ3aqH0nEP+tSKX2yOustFz+XwO+K
	diKXRqT0YbN7f6PF4JlEGCIFi74aqwqpcKq5qdQa4DshGFuFrVsNUn5vVrcfyH6BomqtkusZpyKnR
	DOBQMPexRvQnpmpSIA/jswxSlwJhPYKe/Cfbpngtt3U5q22vce8q4uQfQPXu6XP72OfqIAyQc6yWe
	smtXWu0tA2VGS459Nmn9fHVemT2WezErh/uYQTOBMGlJdeHr0V71yvR0E7Wqr5lhve9vhoaSPo5G8
	s1RsHnsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnjhS-00000008ULL-3KJQ;
	Thu, 27 Feb 2025 19:37:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnfZL-00000007s9v-0DAE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:13:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id B16955C5CEE;
	Thu, 27 Feb 2025 15:12:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32EC8C4CEDD;
	Thu, 27 Feb 2025 15:12:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740669178;
	bh=7STf7KR5l+VejlzjpR6E9zLjagUfqiPeoLC/F4HyI+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y1DgGDbozJrXDySPeEwcaVWIuwFMGuBU00Hfx+8kMP+fKJY6gA5/1nay2+MTvwBIv
	 4mlESna60cg4Rx8ZpkUFHIf72oTAo+wQkVqvzL2jRCf8mtuoT89MRQ7V0Mx+xxdDgb
	 DMLu4CX1A8UtRup4TE8qLARxpydaweF/KQ/RYldAkeNPxpdQiO9hMsyUvGJi+FiAFA
	 4YVF2Yvaql9XEu5BxTQLTtFdAlw0rFgskYkC1LezmR3ALXNVyS+BPbo/Y2KNzdhkpR
	 wbuLSfMTjnO0iOP7AbCaaYxJDgrlZXEHybbIm7lfi36SX1rUKFrl7cFR+HNrRsY5j9
	 ZxOgqZ+gtOglQ==
Date: Fri, 28 Feb 2025 00:12:53 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <Z8CA9RTZWChh9cJW@ishi>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
 <Z8B1LDT-n2XTTp8q@ishi>
 <202502271437280a6701d8@mail.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="S63rS5Zp1ngJmb2c"
Content-Disposition: inline
In-Reply-To: <202502271437280a6701d8@mail.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_071259_186537_439589CA 
X-CRM114-Status: GOOD (  37.97  )
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Ludovic Desroches <ludovic.desroches@microchip.com>, =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--S63rS5Zp1ngJmb2c
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 03:37:28PM +0100, Alexandre Belloni wrote:
> On 27/02/2025 23:22:36+0900, William Breathitt Gray wrote:
> > On Thu, Feb 27, 2025 at 02:53:30PM +0100, Kamel Bouhara wrote:
> > > On Thu, Feb 27, 2025 at 01:59:57PM +0900, William Breathitt Gray wrot=
e:
> > > > Let me make sure I understand the situation correctly. This SoC has=
 two
> > > > Timer Counter Blocks (TCB) and each TCB has three Timer Counter Cha=
nnels
> > > > (TCC); each TCC has a Counter Value (CV) and three general registers
> > > > (RA, RB, RC); RA and RB can store Captures, and RC can be used for
> > > > Compare operations.
> > > >
> > > > If that is true, then the correct way for this hardware to be expos=
ed is
> > > > to have each TCB be a Counter device where each TCC is exposed as a
> > > > Count. So for this SoC: two Counter devices as counter0 and counter=
1;
> > > > count0, count1, and count2 as the three TCC; i.e. counter0/count{0,=
1,2}
> > > > and counter1/count{0,1,2}.
> >=20
> > [...]
> >=20
> > > > Kamel, what would it take for us to rectify this situation so that =
the
> > > > TCC are organized together by TCB under the same Counter devices?
> > >=20
> > > Hello,
> > >=20
> > > Indeed, each TCC operates independently except when quadrature mode is
> > > enabled. I assume this approach was taken to provide more flexibility=
 by
> > > exposing them separately.
> > >=20
> > > Currently only one channel is configured this would need to rework the
> > > driver to make the 3 TCCs exposed.
> > >=20
> > > Greetings,
> > > Kamel
> >=20
> > Skimming through the driver, it looks like what we'll need is for
> > mchp_tc_counts[] to have all three TCCs defined, then have
> > mchp_tc_probe() match on a TCB node and configure each TCC. Once that's
> > setup, then whenever we need to identify which TCC a callback is
> > exposing, we can get it from count->id.
> >=20
> > So for example, the TC_CV register offset is calculated as 0x00 +
> > channel * 0x40 + 0x10. In the count_read() callback we can leverage
> > count->id to identify the TCC and thus get the respective TC_CV register
> > at offset + count->id * 0x40 + 0x10.
> >=20
>=20
> We can't do that because the TCC of a single TCB can have a mix of
> different features. I struggled with the breakage to move away from the
> one TCB, one feature state we had.
> Be fore this, it was not possible to mix features on a single TCB, now,
> we can have e.g. the clocksource on TCC 0 and 1 of TCB0 and a PWM on
> TCC 2. mchp_tc_probe must not match on a TCB node...

Okay I see what you mean, if we match on a TCB mode then we wouldn't be
able to define the cases where one TCC is different from the next in the
same TCB.

The goal however isn't to support all functionality (i.e. PWM-related
settings, etc.) in the counter driver, but just expose the TCB
configuration options that affect the TCCs when configured for counter
mode. For example, the sysfs attributes can be created, but they don't
have to be available until the TCC is in the appropriate mode (e.g.
return -EBUSY until they are in a counter mode).

Is there a way to achieve that? Maybe there's a way we can populate the
sysfs tree on the first encountered TCC, and then somehow indicate when
additional TCCs match. Attributes can become available then dynamically
based on the TCCs that match.

William Breathitt Gray

--S63rS5Zp1ngJmb2c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8CA9QAKCRC1SFbKvhIj
KzfbAQDlTYiUlgbcGQwRUT570H/RH0ghKls+Gy2YmhpCVscIcAD9E/gGa6CbXDL+
5KRRytXkMqv0z8iXRNmCVcaYM07jxw4=
=xdBI
-----END PGP SIGNATURE-----

--S63rS5Zp1ngJmb2c--

