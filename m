Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6746FC197BF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 19:38:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JOi6jvqrpwn0mQdkcXsd75YE/yZBfD5lrwfCPQknSIs=; b=UtMfUQdBz+mgzzonVeMOnMu2Jv
	T8gnzwFMWq5B3HLxTXSFx8ym39Fu6xtyQxuVBPSMkzDYIPTIIYFcCy+I1Xvw4/xjrcHpSfS2y6XNs
	fN4UL2zQG757kx8n6kYxyj26B1fo3oHubPXGTNSFRJoaQd2RHQoRd3FBWBNsy6BY9a3O7aV3IqhUX
	qM8BtHrdJASxvYrGM8qaQf0Z9dQW3lpauYbtwWLu8oa3zS8NPGkN5+p9lv41YAP/FgO2TbW8vDDJY
	Zat12sPtAxxCQ576XWOXg2zF1qO5nxmq077/Cwf/qtFG6AL5f0jSqqcX3E4ZGl87cguMjz2RiPY4u
	Lf8k7tvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnji6-00000008Ve6-4AsV;
	Thu, 27 Feb 2025 19:38:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tngBk-00000007xpn-0bcM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 15:52:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1CCE561133;
	Thu, 27 Feb 2025 15:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9093C4CEDD;
	Thu, 27 Feb 2025 15:52:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740671559;
	bh=JOi6jvqrpwn0mQdkcXsd75YE/yZBfD5lrwfCPQknSIs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qIh54mAXCIHTzFega3kPEvDfLgCHCw3Zw+f/GacvtJTPUu/pIcXY19EEsSUFoE+Pj
	 yYQ+VsqjX0bp/iYcNhT8sAu5BgahFtR+TsUSyGhk4xg3n9On4lYgJjo32ZCaJLyxHg
	 BBFAaJJr+LNWsHOoTCney7KYvpTgbyZQBw/8IGDkGXrCyyEPBynIg5RGMGsnAjsLFy
	 IuULk6gLAdR97RR0ol+CDZrU+NUqEHNAxrDjQXYaqUdSCh2fXCuFt2kaaoPJSRsQWG
	 JjQ16ZbcXxTYRPGGOoplSDX8XgP6aIE7dZzcTHW0u1a9QMtQV/UayWHmzranKpCFkv
	 F34pwqARH64+w==
Date: Fri, 28 Feb 2025 00:52:34 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <Z8CKQvRjqH9lwzgO@ishi>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
 <Z7h0AXV1zlgp9Nw-@ishi>
 <8fb9f188-3065-4fdc-a9f1-152cc5959186@prolan.hu>
 <Z7vihBqOgP3fBUVq@ishi>
 <bfa70e78-3cc3-4295-820b-3925c26135cb@prolan.hu>
 <Z7_xTQeTzD-RH3nH@ishi>
 <20250227135330.GC182392@tpx1.home>
 <Z8B1LDT-n2XTTp8q@ishi>
 <202502271437280a6701d8@mail.local>
 <Z8CA9RTZWChh9cJW@ishi>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="9gI8yjbOsFJ0jwEr"
Content-Disposition: inline
In-Reply-To: <Z8CA9RTZWChh9cJW@ishi>
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
Cc: Jonathan Cameron <jic23@kernel.org>, linux-iio@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, linux-kernel@vger.kernel.org, Dharma.B@microchip.com, =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--9gI8yjbOsFJ0jwEr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 28, 2025 at 12:13:00AM +0900, William Breathitt Gray wrote:
> On Thu, Feb 27, 2025 at 03:37:28PM +0100, Alexandre Belloni wrote:
> > On 27/02/2025 23:22:36+0900, William Breathitt Gray wrote:
> > > Skimming through the driver, it looks like what we'll need is for
> > > mchp_tc_counts[] to have all three TCCs defined, then have
> > > mchp_tc_probe() match on a TCB node and configure each TCC. Once that=
's
> > > setup, then whenever we need to identify which TCC a callback is
> > > exposing, we can get it from count->id.
> > >=20
> > > So for example, the TC_CV register offset is calculated as 0x00 +
> > > channel * 0x40 + 0x10. In the count_read() callback we can leverage
> > > count->id to identify the TCC and thus get the respective TC_CV regis=
ter
> > > at offset + count->id * 0x40 + 0x10.
> > >=20
> >=20
> > We can't do that because the TCC of a single TCB can have a mix of
> > different features. I struggled with the breakage to move away from the
> > one TCB, one feature state we had.
> > Be fore this, it was not possible to mix features on a single TCB, now,
> > we can have e.g. the clocksource on TCC 0 and 1 of TCB0 and a PWM on
> > TCC 2. mchp_tc_probe must not match on a TCB node...
>=20
> Okay I see what you mean, if we match on a TCB mode then we wouldn't be
> able to define the cases where one TCC is different from the next in the
> same TCB.
>=20
> The goal however isn't to support all functionality (i.e. PWM-related
> settings, etc.) in the counter driver, but just expose the TCB
> configuration options that affect the TCCs when configured for counter
> mode. For example, the sysfs attributes can be created, but they don't
> have to be available until the TCC is in the appropriate mode (e.g.
> return -EBUSY until they are in a counter mode).
>=20
> Is there a way to achieve that? Maybe there's a way we can populate the
> sysfs tree on the first encountered TCC, and then somehow indicate when
> additional TCCs match. Attributes can become available then dynamically
> based on the TCCs that match.
>=20
> William Breathitt Gray

Sorry, let me step back for a moment because maybe I'm trying to solve
a problem that might not actually be a problem.

I see functionality settings available in the TC Block Mode Register
(BMR) that can affect multiple TCCs at a time. Are these BMR settings
exposed already to users in someway? If not, do we have a way to
introduce these settings if someone wants them; e.g. would the
AutoCorrection function enable bit be exposed as a sysfs attribute, or
configured in the devicetree?

Finally, if there's not much interest in general for exposing these BMR
settings, then I suppose there is no need to change how things are right
now with the microchip-tcb-capture module and we can just keep it the
way it is. That's my only concern, whether there are users that want to
control these settings but don't have a way right now.

William Breathitt Gray

--9gI8yjbOsFJ0jwEr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8CKQgAKCRC1SFbKvhIj
K++9AP9+Rmsilcgybpn7JO4p7Ml4k8jgN+zhXDy4QnHC1QH+DwD/avZEHG+vxsDd
UgB4AwcPFcN8MHVAEbkl10k8O9MmcAk=
=GOuM
-----END PGP SIGNATURE-----

--9gI8yjbOsFJ0jwEr--

