Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8EBFFC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Feb 2025 00:15:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VjWpg7dP0s8mbOXJKdWV+Hs+lOOmlqB/DQ6QK29ok7o=; b=ui8O8RrrmsXySiEoN10hwTjVYI
	SZAjKGepAlMc41Pk2in1FjiInp4PSNgRvrmPbbHIGg8S2L7yJTjqWlZcHiiDpzP9q1sNWengI2PIz
	vc7xPANRwDUYyi3LtnMgfs8fK5WuGaKnGP04dkV4srrBZfUuvyREm+oRYbZBAGqpFd89sN+EcoKOw
	1S8/WejHjCiP0ZnYqargHz5P4RQ4nFV3CIEV8rq7WUQLuk+e+zY6lG1vyajfTyyqIrVZ31jOGT3yi
	QeyfTMrgulHbNm1ljnAnrg8Dhsi1l7SRfuNEFxEukaMZ15DgsSHzgDBK80ElzgVAXn5JjQKf1hjFi
	VY1JeUSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tno20-00000009FDa-1qiE;
	Fri, 28 Feb 2025 00:15:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tno0S-00000009F5O-3dQd
	for linux-arm-kernel@lists.infradead.org;
	Fri, 28 Feb 2025 00:13:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6B53561138;
	Fri, 28 Feb 2025 00:13:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08F47C4CEDD;
	Fri, 28 Feb 2025 00:13:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740701611;
	bh=VjWpg7dP0s8mbOXJKdWV+Hs+lOOmlqB/DQ6QK29ok7o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FPSIMBiYpk65tkQodTo/Q6a3uAXXcYR/A9MIjM+eaZtBDRB7mS3zYuwI8XBJKliJI
	 ZQIBtAcV49xzFkH3e9QjkktmvszB/CaIPUZBJUUhuLEQgAjYMKC9wkwMGfo00V4Ae/
	 MwgX177YXb8sLMGtS3MyHLB73/SS8BvzIPBqEOqi5fzMZ8xwbSwfoCylasr+Xg2LV9
	 gq0sW7FykZKyCJpc7A08PNzE/+EnNFxOcag/9/bPAdT28B8/s5UrXhrpLbQDrtEuN6
	 y9CuxIxYz2ZZB9KmRu2uT5vlzgqAuFMOcveNTnSzTJX+vGJWGrKUixNRyBuW1qQNep
	 0ursar10TjhZQ==
Date: Fri, 28 Feb 2025 09:13:26 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <Z8D_phw3GxvdAO8G@ishi>
References: <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
 <Z8B1LDT-n2XTTp8q@ishi>
 <202502271437280a6701d8@mail.local>
 <Z8CA9RTZWChh9cJW@ishi>
 <Z8CKQvRjqH9lwzgO@ishi>
 <077f23f1-3e5f-423c-aa97-ee7fcdf1475d@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aSZS/FbNbRmlzwJh"
Content-Disposition: inline
In-Reply-To: <077f23f1-3e5f-423c-aa97-ee7fcdf1475d@prolan.hu>
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
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, Ludovic Desroches <ludovic.desroches@microchip.com>, Jonathan Cameron <jic23@kernel.org>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--aSZS/FbNbRmlzwJh
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 27, 2025 at 04:56:17PM +0100, Cs=F3k=E1s Bence wrote:
> Hi,
>=20
> On 2025. 02. 27. 16:52, William Breathitt Gray wrote:
> > Sorry, let me step back for a moment because maybe I'm trying to solve
> > a problem that might not actually be a problem.
> >=20
> > I see functionality settings available in the TC Block Mode Register
> > (BMR) that can affect multiple TCCs at a time. Are these BMR settings
> > exposed already to users in someway? If not, do we have a way to
> > introduce these settings if someone wants them; e.g. would the
> > AutoCorrection function enable bit be exposed as a sysfs attribute, or
> > configured in the devicetree?
> >=20
> > Finally, if there's not much interest in general for exposing these BMR
> > settings, then I suppose there is no need to change how things are right
> > now with the microchip-tcb-capture module and we can just keep it the
> > way it is. That's my only concern, whether there are users that want to
> > control these settings but don't have a way right now.
>=20
> My knee-jerk answer to this is that if they do, they will bring it up by
> submitting a patch or bug request. But I'll let others chime in, we only =
use
> an extremely small subset of the features of the TCBs.
>=20
> Bence

I think that's a reasonable stance to take. I don't have an elegant
solution either to this situation, so I'll defer trying to solve it
until an actual user shows up who needs the functionality. Until then,
it seems that what we have right now is adequate for the current
usecases.

William Breathitt Gray

--aSZS/FbNbRmlzwJh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8D/pgAKCRC1SFbKvhIj
Kze+AP0TSQhmivwKtynvIgpJ5od2IRhKMwMjM51kwMuLN/TrgwEAzg47J/c7uToS
dZ/ygvQQpXY3J5aXOapiR28Wb6kZLgc=
=D3Ne
-----END PGP SIGNATURE-----

--aSZS/FbNbRmlzwJh--

