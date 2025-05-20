Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C9D0C5479B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YSUYksmF2JYd7KqdCds1uC+4VC991TcWHjWmqBK+XDM=; b=YlvgoR0x3xRAq1uDuZsSU90lmJ
	JJEoSnP/pxE4nZs+TPWKJXt8AzIk/AZ3MXQRTOLDE4s5/fsqYls4K0sXNXQr9cEM6apIjDVKuVSGO
	E++zxWyywNV1pXGi8C5QzECPCtMDh0GdH+H62T1LSJKjYIOsm8a+IIyyaJv+TlN+StCw3OJwkCUs4
	snL5eib/NCCdCYCRo5cZ75pkI5PiF0Lk/1hLT+LlppmcsRoxfqzeHYCnX405lE3ImrXe/zQzU1eZU
	y7icYE8cafPQc9CzGySenMiflwcPjT7CcuUygdrcnJ8Fe0m+uFVsN3VDnOlXzlMl2rj5ydaC+p6eE
	/S7YwNCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLIc-0000000CfgK-3O7z;
	Tue, 20 May 2025 11:38:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHL2S-0000000CcG2-2dLu
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 11:21:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 156A5629EC;
	Tue, 20 May 2025 11:21:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EA94BC4CEE9;
	Tue, 20 May 2025 11:21:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747740099;
	bh=VP8Ww81JTL3HdjFwEW1wz4XYyan8mTwPcBHvMdWi3Xg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SP4NIiQE0Isk/Myz4Ms31E6tJBlGZlOQSN7Tyjq98LTiqFufY8oOY2m/WL2Pe4FRH
	 XmQDsQhVk/ShPui1inXG+br/Cisd+19YiVLb8X/AJDgfmHrO+GyMoySOOhiZ5VrpT/
	 V/V13W8tqzd6iw9dFp6Oq+QHaRr4bhzhWieiRI6MVNLzCfiZ8BMvjrSWqyre4aUh+N
	 AMjQyXrtB4iU43n8gETQHAWpTHv+8RncE0oHcl1rF2tRJzTMT5R64pBZ8G2KEWsrgJ
	 0Tofn2UUyiiKsAp8fIFfeCtnm02WjbZIE6BIRdWTenNVFrTDoHQc+Q4t4sa6hZupxz
	 PJV9RWVy7PlQQ==
Date: Tue, 20 May 2025 20:21:36 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Dharma.B@microchip.com
Cc: kamel.bouhara@bootlin.com, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Add watch validation
 support
Message-ID: <aCxlwAgX2A0dVn5l@ishi>
References: <CV37uwi-rAqU3els0ckl4KLz5ortFAdc7XXy7ex6-MMhxvptyeMh8vTBXQuZliairKQ1Dy4yM3MyE8o7EZ6VfA==@protonmail.internalid>
 <20250515-counter-tcb-v1-1-e547061ed80f@microchip.com>
 <aCmPLn16Ykabvhjv@ishi>
 <axFMnvsS0JXIwXl665iZU5CeLOIRgZCScixNFgE72GD8NpyMB3FfJDDNxIDSJrPhov-HLXkGiOPEr8fNsltCIw==@protonmail.internalid>
 <823cefaf-b225-4531-8733-5d90d3ccceb3@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="rqjICBkGZt6gvoAZ"
Content-Disposition: inline
In-Reply-To: <823cefaf-b225-4531-8733-5d90d3ccceb3@microchip.com>
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


--rqjICBkGZt6gvoAZ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, May 19, 2025 at 10:47:50AM +0000, Dharma.B@microchip.com wrote:
> On 18/05/25 1:11 pm, William Breathitt Gray wrote:
> > Include COUNTER_MCHP_EVCHN_CV as well for the sake of completeness. I
> > know COUNTER_MCHP_EVCHN_CV and COUNTER_MCHP_EVCHN_RA have the same
> > underlying channel id, but we're abstracting this fact so it's good to
> > maintain the consistency of the abstraction across all callbacks.
>=20
> To avoid the compiler error due to COUNTER_MCHP_EVCHN_CV and
> COUNTER_MCHP_EVCHN_RA sharing the same underlying value, would it be
> sufficient to include a comment indicating that both represent the same
> channel ID? Or would you prefer that I duplicate the logic explicitly
> for the sake of abstraction consistency, despite the shared value?

I see you use a conditional check in the v2 patch you submitted. That
solution works well to address both so we'll go with that way as you
have it.

> >> +		switch (watch->event) {
> >> +		case COUNTER_EVENT_CAPTURE:
> >> +		case COUNTER_EVENT_CHANGE_OF_STATE:
> >> +		case COUNTER_EVENT_OVERFLOW:
> >> +		case COUNTER_EVENT_THRESHOLD:
> >> +			return 0;
> >
> > The watch_validate callback is used to ensure that the requested watch
> > configuration is valid: i.e. the watch event is appropriate for the
> > watch channel.
> >
> > Looking at include/uapi/linux/counter/microchip-tcb-capture.h:
> >
> >       * Channel 0:
> >       * - CV register changed
> >       * - CV overflowed
> >       * - RA captured
> >       * Channel 1:
> >       * - RB captured
> >       * Channel 2:
> >       * - RC compare triggered
> >
> > If I'm understanding correctly, channel 0 supports only the
> > CHANGE_OF_STATE, OVERFLOW, and CAPTURE events; channel 1 supports only
> > CAPTURE events; and channel 2 supports only THRESHOLD events.
>=20
> Shouldn't it be
>=20
> /*
>   * Channel 0 (EVCHN_CV):
>   *   - CV register changed             =E2=86=92 COUNTER_EVENT_CHANGE_OF=
_STATE
>   *   - CV overflowed                   =E2=86=92 COUNTER_EVENT_OVERFLOW
>   *
>   * Channel 1 (EVCHN_RA):
>   *   - RA captured                     =E2=86=92 COUNTER_EVENT_CAPTURE
>   *
>   * Channel 2 (EVCHN_RB):
>   *   - RB captured                     =E2=86=92 COUNTER_EVENT_CAPTURE
>   *
>   * Channel 3 (EVCHN_RC):
>   *   - RC compare threshold reached    =E2=86=92 COUNTER_EVENT_THRESHOLD
>   */

These Counter event channels are established ultimately by where you
push the events via counter_push_event(). So in theory, when these
events were introduced we could have arranged them onto four channels as
you describe. Unfortunately, we can't change it now (unless a serious
defect is found) because it'll break the ABI for existing programs.

> Could you please help me understand whether these are logical channels
> or hardware channels related to the reg?

You can consider these Counter event channels as "logical" and not
necessarily tied to the underlying the hardware registers.

I regret naming this functionality "channel" because it has caused
confusion before in other drivers as well. The origin of the term was
because I envisioned these Counter "event channels" providing a flow of
events streamed from the driver to userspace (much like a water channel
provides a flow of water). Notice how that concept lies completely on
the software side; i.e. between userspace and kernel -- not necessarily
between kernel and hardware.

In practice, we are limited to the capabilities of the hardware so that
does factor into how much freedom we have in defining our Counter events
channels. So let's walkthrough a scenario where we might want to offer
muliple Counter event channels for a driver rather than funneling all
events through a single channel.

Suppose a hypothetical device has two Counts that increase independent
of each other and can overflow back to a value of 0. This device is able
to issue an interrupt when either Count overflows. Now imagine we have a
race between these two Counts to see which overflows first: to determine
that the race ended we just need to check that a COUNTER_EVENT_OVERFLOW
event has been pushed; but what do we do if we want to determine the
winner of the race?

One solution is to check the values of both Counts: when a Count
overflows it starts over at 0, so the winner will have a Count value of
0. That is correct, but if one Count did not increase during the race
while the other Count did then both Counts will be 0 at the end: the
winner cannot be differentiated in this case.

That's a scenario where a second Counter event channel is useful: to
differentiate between events of the same type (in this case
COUNTER_EVENT_OVERFLOW). So if we dedicate the first Counter event
channel to the first Count and the second Counter event channel to the
second Count, we can definitely determine that a COUNTER_EVENT_OVERFLOW
watched on a particular channel represents an overflow for that
particular Count.

I hope that helps showcase why we offer multiple Counter event channels
even though we as driver authors have the freedom to define these
channels arbitrarily and push events to channels as we see fit.

William Breathitt Gray

--rqjICBkGZt6gvoAZ
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCaCxlwAAKCRC1SFbKvhIj
K9J/AP9EJEJ/slOmCTj5jItJbQx764BuYxsp0iY0I9o2v4SknQEAnz7GnM9Jk5td
L4mlThLciBUBhwwubveFfJVmPZL4dQE=
=MtAs
-----END PGP SIGNATURE-----

--rqjICBkGZt6gvoAZ--

