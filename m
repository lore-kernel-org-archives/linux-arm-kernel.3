Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 27EBAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 12:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zAIecpWj+6ZlXnaEaDqRZghTEFqyTj1RlT2HHiSkKis=; b=miJz2knCW4Ti7Xjd4ozrNHdfmE
	dZuTKptc0ro0V0A7IKvAQwhairyeYoCHqNUS4m3J6d2tl6FxXM9hZuZ8LSkOKWbqI/EhgMnFIbv6B
	ukr5oOvZHcqIGP60rBBCgZmr1BGwzRLJt+N4SRviusomHh+1u9pA7h0sEUKC6kp3SnFrHAhPHk2DX
	GlOIcAE8z1k5CtSSAtwQzGLy6iSITq1g1SkXQwxRz9GQ/st3EQIaS+hWAtklghAH4BLRi8EpqaeRZ
	fCkJGBnEHHpcPud4pRyzut1kNmQlpVcU5fVE4cjJtGQ3kXoFoIGB5ltdFWHCLE/vE3LCj+jwAjDO/
	fdMT8P5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSL4-00000005VGh-0XDB;
	Fri, 21 Feb 2025 12:41:06 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlSJb-00000005V63-1kXC
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 12:39:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 431AF612B8;
	Fri, 21 Feb 2025 12:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B7FF1C4CED6;
	Fri, 21 Feb 2025 12:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740141574;
	bh=THMok0Q/W8DPta8lrac9ilEkwc3iYgKDyZsc/gHSzSc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JissSfbDTmOYZeAAw7xb15eGe9FwQuQCmwXurgu7FEgy1Pd0WOYlCIrvhfqyee99A
	 koDSllkwxwOv62ApilcR4RNmkFUPPAMczBSn9hyXFa5kfdJH0hEDEQSGxLpV4K8QEx
	 f4+2VBzxhwFnvRYBEBC6RNDxwBSoO3VegWdc+PkPFC0BYKJRyRpl6+wWl6fXrwBuBC
	 XQ7PlhEKze6yWvYxnwtttVjBaaddf7x5oqHn1F/qUAHNwtiMbdLAlGFmoc57uf5FX2
	 z5WGzLu1IGwe5+/GvmUUgGSTOcabxEdM9xR6d2SLPfdHbgzw53xKWmpHRT18+ZBySm
	 WhZjFbks1rx/Q==
Date: Fri, 21 Feb 2025 21:39:29 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Bence =?iso-8859-1?B?Q3Pza+Fz?= <csokas.bence@prolan.hu>
Cc: linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>, Dharma.B@microchip.com
Subject: Re: [PATCH v4 0/2] microchip-tcb-capture: Add Capture, Compare,
 Overflow etc. events
Message-ID: <Z7h0AXV1zlgp9Nw-@ishi>
References: <20250211151914.313585-3-csokas.bence@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="aveAWsj+gpRZ7qux"
Content-Disposition: inline
In-Reply-To: <20250211151914.313585-3-csokas.bence@prolan.hu>
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


--aveAWsj+gpRZ7qux
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 04:19:11PM +0100, Bence Cs=F3k=E1s wrote:
> The TCB has three R/W-able "general purpose" hardware registers:
> RA, RB and RC. The hardware is capable of:
> * sampling Counter Value Register (CV) to RA/RB on a trigger edge
> * sending an interrupt of this change
> * sending an interrupt on CV change due to trigger
> * triggering an interrupt on CV compare to RC
> * stop counting after sampling to RB
>=20
> To enable using these features in user-space, an interrupt handler
> was added, generating the necessary counter events. On top, RA/B/C
> registers are added as Count Extensions. To aid interoperation, a
> uapi header was also added, containing the various numeral IDs of
> the Extensions, Event channels etc.
>=20
> Bence Cs=F3k=E1s (2):
>   counter: microchip-tcb-capture: Add IRQ handling
>   counter: microchip-tcb-capture: Add capture extensions for registers
>     RA-RC
>=20
>  MAINTAINERS                                   |   1 +
>  drivers/counter/microchip-tcb-capture.c       | 137 ++++++++++++++++++
>  .../linux/counter/microchip-tcb-capture.h     |  49 +++++++
>  3 files changed, 187 insertions(+)
>  create mode 100644 include/uapi/linux/counter/microchip-tcb-capture.h

Hi Bence,

I had some time to read over your description of the three hardware
registers (RA, RB, and RC)[^1] and I have some suggestions.

First, register RC seems to serve only as a threshold value for a
compare operation. So it shouldn't be exposed as "capture2", but rather
as its own dedicated threshold component. I think the 104-quad-8 module
is the only other driver supporting THRESHOLD events; it exposes the
threshold value configuration via the "preset" component, but perhaps we
should introduce a proper "threshold" component instead so counter
drivers have a standard way to expose this functionality. What do you
think?

Regarding registers RA and RB, these do hold historic captures of count
data so it does seem appropriate to expose these as "capture0" and
"capture1". However, I'm still somewhat confused about why there are two
registers holding the same sampled CV (or do RA and RB hold different
values from each other?). Does a single external line trigger the sample
of CV to both RA and RB, or are there two separate external lines
triggering the samples independently; or is this a situation where it's
a single external line where rising edge triggers a sample to RA while
falling edge triggers a sample to RB?

Next, the driver right now has three separate event channels, but I
believe you only need two. The purpose of counter event channels is to
provide a way for users to differentiate between the same type of event
being issued from different sources. An example might clarify what I
mean.

Suppose a hypothetical counter device has two independent timers. When
either timer overflows, the device fires off a single interrupt. We can
consider this interrupt a counter OVERFLOW event. As users we can watch
for COUNTER_EVENT_OVERFLOW to collect these events. However, a problem
arises: we know an OVERFLOW event occurred, but we don't know which
particular timer is the source of the overflow. The solution is to
dedicate each source to its own event channel so that users can
differentiate between them (e.g. channel 0 are events sourced from the
first timer whereas channel 1 are events sourced from the second timer).

Going back to your driver, there seems to be no ambiguity about the
source of the CHANGE-OF-STATE, THRESHOLD, and OVERFLOW events, so these
events can all coexist in the same event channel. The only possible
ambiguity I see is regarding the CAPTURE events, which could be sourced
by either a sample to RA or RB. Given this, I believe all your events
could go in channel 0, with channel 1 serving to simply differentiate
CAPTURE events that are sourced by samples to RB.

Finally, you mentioned that this device supports a PWM mode that also
makes use of the RA, RB, and RC registers. To prevent globbering the
registers when in the wrong mode, you should verify the device is in the
counter capture mode before handling the capture components (or return
an appropriate "Operation not support" error code when in PWM mode). You
don't need to worry about adding these checks for now because it looks
like this driver does not support PWM mode yet, but it's something to
keep in mind if you do add support for it in the future.

William Breathitt Gray

[^1] https://lore.kernel.org/all/7b581014-a351-4077-8832-d3d347b4fdb5@prola=
n.hu/

--aveAWsj+gpRZ7qux
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ7h0AQAKCRC1SFbKvhIj
K83fAPsGi+Iai9Thlz/7m5fGeJ+HhUhcH6iRbjw/UebvTdm15wD9H7R2IsqBSQ7/
iWgxHOmcexFlizlbeBzgmR2D7MO4PAA=
=a885
-----END PGP SIGNATURE-----

--aveAWsj+gpRZ7qux--

