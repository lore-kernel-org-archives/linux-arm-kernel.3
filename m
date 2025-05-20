Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6C936C3DA6D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 May 2025 11:59:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=woxzwAyZ6RrLC2mMTQgPFYg8FiXfzXKqL5cuFeASkfI=; b=jsEnjacXT5stdTp6SENxxE0Teq
	VGiQrgATJDUK9odwLa1mLc+7I7roKfnNswwW9GamXjQ5ECTj6nq1ih+4lbRSjF8BPVOvfvIijeTPC
	XvjQW5CQREUrXiVLGCDIacazt76YocLjEaSKiw4no/7kDR5rGLKYtVqzso67LRWoNNbAAUMK1cmHS
	lDbqovNMjFzhAG1qnb1o3xBek/0/hhH2EGor0l7BrT9WdOUMCzUJC9lpEXXG244i7Cup+L1KN40BH
	dItZF3oFtm+Ss57CYqSDeTm6riAOdWk4F4y8841JrYqYP93kqep7BdW7KzpXjCaX0tMmQq6n6YaPG
	gEMTcs0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLcs-0000000ClAm-1BIr;
	Tue, 20 May 2025 11:59:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uHLY8-0000000CjSN-2KWk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 May 2025 11:54:24 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B1173614BA;
	Tue, 20 May 2025 11:54:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3ACFC4CEE9;
	Tue, 20 May 2025 11:54:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747742062;
	bh=0LB3gKrRF3SFVit9CC5sVVaVIhIAGpiL+nMDYFs/lN0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PqcfLobAhQV2FBZve5MIeToYTg1PPfb92clxkq7Wb74DVWYgxkqB9QmQmmLJJDapG
	 sJyzIuO9JBHVt63utHY+PbNK5toAhJOfXlTnWEJ3ypvh+PtAXPfCBEAYCefYkpCAUt
	 8CUdvLIrh21EmJ5MErPP8/NfNxs/cCcKQHpdhF5ovtLnTd/j/9z8kzmEkwMB47KTc0
	 th9Izo7Wa8K6YRfsT2alL9ECLXtJwfutgARtGzOtxcJegOL1WT34roEW2Kg1dOyCRm
	 ukWFTV0L7RspaL4L4ftEPvdx+3y4Ew1lgrmC0Z8V9BBOE/8gp+BU1VE5ZXBUZGaa84
	 4rJ/86STpNoxA==
Date: Tue, 20 May 2025 20:54:19 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] counter: microchip-tcb-capture: Add watch validation
 support
Message-ID: <aCxtaya-1SXkPiob@ishi>
References: <F_LcZtjhYzQUlCmEka_20DiefdWFYYoq-u3JOct5ctrcMrJfTi3APjAWNAK97Mpluwkqgr9rQ-35KzO0Uuifow==@protonmail.internalid>
 <20250520-counter-tcb-v2-1-a0617d2d220a@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="35KqwYMATj7rtnUi"
Content-Disposition: inline
In-Reply-To: <20250520-counter-tcb-v2-1-a0617d2d220a@microchip.com>
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


--35KqwYMATj7rtnUi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, May 20, 2025 at 09:36:42AM +0530, Dharma Balasubiramani wrote:
> The Timer Counter Block (TCB) exposes several kinds of events to the
> Counter framework, but not every event is meaningful on every hardware
> channel. Add a `watch_validate()` callback so userspace may register only
> the combinations actually supported:
>=20
> * Channel 0 (COUNTER_MCHP_EVCHN_CV, COUNTER_MCHP_EVCHN_RA)
>    - COUNTER_EVENT_CAPTURE
>    - COUNTER_EVENT_CHANGE_OF_STATE
>    - COUNTER_EVENT_OVERFLOW
>=20
> * Channel 1 (COUNTER_MCHP_EVCHN_RB)
>    - COUNTER_EVENT_CAPTURE
>=20
> * Channel 2 (COUNTER_MCHP_EVCHN_RC)
>    - COUNTER_EVENT_THRESHOLD
>=20
> Any other request is rejected with `-EINVAL`, preventing undefined
> behaviour in userspace.

Hi Dharma

The requesting an invalid watch configuration wouldn't necessarily lead
to undefined beaviour in userspace -- at least as far as the Counter
character device interface is concerned. What would happen is that the
requested event is never pushed to that particular channel, so userspace
is left watching for an event that never arrives for that particular
watch: not an ideal situation, but not undefined.

>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
> Tested the code on target (sam9x60_curiosity) using the following commands
>=20
> valid ones:
> ./counter_watch_events -d -wevt_change_of_state,chan=3D0
> ./counter_watch_events -d -wevt_ovf,chan=3D0
> ./counter_watch_events -d -wevt_capture,chan=3D0
> ./counter_watch_events -d -wevt_capture,chan=3D1
> ./counter_watch_events -d -wevt_threshold,chan=3D2
>=20
> invalid ones:
> ./counter_watch_events -d -wevt_threshold,chan=3D0
> ./counter_watch_events -d -wevt_threshold,chan=3D1
> Error adding watches[0]: Invalid argument
> ---
> Changes in v2:
> - Include COUNTER_MCHP_EVCHN_CV as well for the sake of completeness.
> - Adjust the code to ensure channel limitations.
> - Drop sorting in this patch, will be taken care seperately.
> - Link to v1: https://lore.kernel.org/r/20250515-counter-tcb-v1-1-e547061=
ed80f@microchip.com

Thank you for the changes. I have a minor adjustment suggestion below
that I believe makes the code look a little nicer.

> ---
>  drivers/counter/microchip-tcb-capture.c | 24 +++++++++++++++++++++++-
>  1 file changed, 23 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/mi=
crochip-tcb-capture.c
> index 1de3c50b9804..fe817f4f1edc 100644
> --- a/drivers/counter/microchip-tcb-capture.c
> +++ b/drivers/counter/microchip-tcb-capture.c
> @@ -337,6 +337,27 @@ static struct counter_comp mchp_tc_count_ext[] =3D {
>  	COUNTER_COMP_COMPARE(mchp_tc_count_compare_read, mchp_tc_count_compare_=
write),
>  };
>=20
> +static int mchp_tc_watch_validate(struct counter_device *counter,
> +				  const struct counter_watch *watch)
> +{
> +	if (watch->channel =3D=3D COUNTER_MCHP_EVCHN_CV || watch->channel =3D=
=3D COUNTER_MCHP_EVCHN_RA) {
> +		switch (watch->event) {
> +		case COUNTER_EVENT_CHANGE_OF_STATE:
> +		case COUNTER_EVENT_OVERFLOW:
> +		case COUNTER_EVENT_CAPTURE:
> +			return 0;
> +		default:
> +			return -EINVAL;
> +		}
> +	} else if (watch->channel =3D=3D COUNTER_MCHP_EVCHN_RB) {
> +		return (watch->event =3D=3D COUNTER_EVENT_CAPTURE) ? 0 : -EINVAL;
> +	} else if (watch->channel =3D=3D COUNTER_MCHP_EVCHN_RC) {
> +		return (watch->event =3D=3D COUNTER_EVENT_THRESHOLD) ? 0 : -EINVAL;
> +	} else {
> +		return -EINVAL;
> +	}

You can use the early returns to avoid the else statements, and some
other additional cleanups can be done as well:

    if (watch->channel =3D=3D COUNTER_MCHP_EVCHN_CV || watch->channel =3D=
=3D COUNTER_MCHP_EVCHN_RA)
    	switch (watch->event) {
    	case COUNTER_EVENT_CHANGE_OF_STATE:
    	case COUNTER_EVENT_OVERFLOW:
    	case COUNTER_EVENT_CAPTURE:
    		return 0;
    	default:
    		return -EINVAL;
    	}
   =20
    if (watch->channel =3D=3D COUNTER_MCHP_EVCHN_RB && watch->event =3D=3D =
COUNTER_EVENT_CAPTURE)
    	return 0;
   =20
    if (watch->channel =3D=3D COUNTER_MCHP_EVCHN_RC && watch->event =3D=3D =
COUNTER_EVENT_THRESHOLD)
    	return 0;
   =20
    return -EINVAL;

I think something like that looks a bit closer to the Linux kernel style
present in the other drivers, so that we're all consistent.

William Breathitt Gray

--35KqwYMATj7rtnUi
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCaCxtawAKCRC1SFbKvhIj
K7HiAP44UJ7XosMcMhno78Iqokz8eFSyozTDzQrtDg4VKOEBrgEAxV0xujh56HbW
6qwUGvsDhrhwAhNzaC9eiCW4MtlD3QA=
=mwXK
-----END PGP SIGNATURE-----

--35KqwYMATj7rtnUi--

