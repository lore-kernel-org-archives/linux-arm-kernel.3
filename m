Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF0A2C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 07:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z9xXKUONkmURg37S37TyS1+VxcJ9ZCVsI3Afzmew324=; b=44oer1mAn4CvMYM9D7mOq+aIzw
	WMzc8bdckEuNvd1zGcvOK9MAgio8LUpPzVvwpG2GI6hOlY3cNb2WvpbA9rQZmIR0JEq8q5OjCwYWb
	jGsLyVoGNEQyo9x3I9gnht8hXparfC56dorRnIajdk+LrO/AAaxqTOEwz5WXiaBmmBLaBQQPMOHmK
	eHMAlKQb+1RErlFYMVHWXe7tBeacQyaps/0mmWB+FgIOpMa+xAeGxLQfxwVkxBm6A7MUoGeYc4gSG
	vYezDRHXBnLeRqI6XnzFb4zNbovuITb+tdrK2sd9WWKiDGKcA2IFXvHd+ZQrILsLf8LwvHJbsFHKU
	scJZShIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGYgV-00000006rGu-1eFO;
	Sun, 18 May 2025 07:43:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGYeU-00000006rAR-0hEA
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 May 2025 07:41:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB4BA5C1377;
	Sun, 18 May 2025 07:39:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74234C4CEE7;
	Sun, 18 May 2025 07:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747554099;
	bh=AHAwzXBAnTp88J/0aYWfanpi1Ub+Fzwmq0oMxgOjE18=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=uhcg1tpwj28HVLQcJ0DPOi/La9tamrh21D3DiZmOBN872Lec2tPGsNDK4EEQsODE+
	 DNyK2ZPmM9lCGXzpRS+NmSOBdi3uT6Oclzg4GwoGglOpxwRD4J3DxIqUBInkdz+fSp
	 qWNBrdwc/8WcA464+En/fqJ9aD4KyzrcfB7h2unt1hPyT5cFTKTFKKYHvPa6Yrlv2P
	 w22z4TpxnqQZyMIYdm7NH1ez3ZqWuiW+jGNEM/Hoon67SM9y3VVA3JZ5nWEsQEtdip
	 NJdagNLvNgukzO9jaRFMzixZNP7Y8rCr9bbwel5x7j0zEfmOnZ0eiut/eei4Cy1NgA
	 /iG+ncIAMuLxw==
Date: Sun, 18 May 2025 16:41:34 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: Dharma Balasubiramani <dharma.b@microchip.com>
Cc: Kamel Bouhara <kamel.bouhara@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, linux-iio@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] counter: microchip-tcb-capture: Add watch validation
 support
Message-ID: <aCmPLn16Ykabvhjv@ishi>
References: <CV37uwi-rAqU3els0ckl4KLz5ortFAdc7XXy7ex6-MMhxvptyeMh8vTBXQuZliairKQ1Dy4yM3MyE8o7EZ6VfA==@protonmail.internalid>
 <20250515-counter-tcb-v1-1-e547061ed80f@microchip.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="TSzCOtGHpFOIyFHN"
Content-Disposition: inline
In-Reply-To: <20250515-counter-tcb-v1-1-e547061ed80f@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_004142_313606_A97496AC 
X-CRM114-Status: GOOD (  22.38  )
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


--TSzCOtGHpFOIyFHN
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, May 15, 2025 at 10:28:25AM +0530, Dharma Balasubiramani wrote:
> Introduce a watch validation callback to restrict supported event and
> channel combinations. This allows userspace to receive notifications only
> for valid event types and sources. Specifically, enable the following
> supported events on channels RA, RB, and RC:
>=20
>   - COUNTER_EVENT_CAPTURE
>   - COUNTER_EVENT_CHANGE_OF_STATE
>   - COUNTER_EVENT_OVERFLOW
>   - COUNTER_EVENT_THRESHOLD
>=20
> Signed-off-by: Dharma Balasubiramani <dharma.b@microchip.com>
> ---
>  drivers/counter/microchip-tcb-capture.c | 28 +++++++++++++++++++++++++---
>  1 file changed, 25 insertions(+), 3 deletions(-)
>=20
> diff --git a/drivers/counter/microchip-tcb-capture.c b/drivers/counter/mi=
crochip-tcb-capture.c
> index 1de3c50b9804..179ff5595143 100644
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
> +	switch (watch->channel) {
> +	case COUNTER_MCHP_EVCHN_RA:
> +	case COUNTER_MCHP_EVCHN_RB:
> +	case COUNTER_MCHP_EVCHN_RC:

Hello Dharma,

Include COUNTER_MCHP_EVCHN_CV as well for the sake of completeness. I
know COUNTER_MCHP_EVCHN_CV and COUNTER_MCHP_EVCHN_RA have the same
underlying channel id, but we're abstracting this fact so it's good to
maintain the consistency of the abstraction across all callbacks.

> +		switch (watch->event) {
> +		case COUNTER_EVENT_CAPTURE:
> +		case COUNTER_EVENT_CHANGE_OF_STATE:
> +		case COUNTER_EVENT_OVERFLOW:
> +		case COUNTER_EVENT_THRESHOLD:
> +			return 0;

The watch_validate callback is used to ensure that the requested watch
configuration is valid: i.e. the watch event is appropriate for the
watch channel.=20

Looking at include/uapi/linux/counter/microchip-tcb-capture.h:

     * Channel 0:
     * - CV register changed
     * - CV overflowed
     * - RA captured
     * Channel 1:
     * - RB captured
     * Channel 2:
     * - RC compare triggered

If I'm understanding correctly, channel 0 supports only the
CHANGE_OF_STATE, OVERFLOW, and CAPTURE events; channel 1 supports only
CAPTURE events; and channel 2 supports only THRESHOLD events.

Adjust the code to ensure those limitations.

> +		default:
> +			return -EINVAL;
> +		}
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +
>  static struct counter_count mchp_tc_counts[] =3D {
>  	{
>  		.id =3D 0,
> @@ -351,12 +372,13 @@ static struct counter_count mchp_tc_counts[] =3D {
>  };
>=20
>  static const struct counter_ops mchp_tc_ops =3D {
> -	.signal_read    =3D mchp_tc_count_signal_read,
> +	.action_read    =3D mchp_tc_count_action_read,
> +	.action_write   =3D mchp_tc_count_action_write,
>  	.count_read     =3D mchp_tc_count_read,
>  	.function_read  =3D mchp_tc_count_function_read,
>  	.function_write =3D mchp_tc_count_function_write,
> -	.action_read    =3D mchp_tc_count_action_read,
> -	.action_write   =3D mchp_tc_count_action_write
> +	.signal_read    =3D mchp_tc_count_signal_read,

It's nice to alphabetize the counter_ops callbacks, but it's also
unrelated to the watch_validate implementation. Move the alphabetization
cleanup to a separate patch so that this patch remains dedicated to
just watch_validate changes.

Thanks,

William Breathitt Gray

--TSzCOtGHpFOIyFHN
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCaCmPLgAKCRC1SFbKvhIj
K/U6AP9sLI94pWH9oxJ5ojO2ldb52ppFei+ym7sypqbu+AOh9QD/Xqg8FFHAJS9e
RltMKxTbESVr1UyIV3cfgwTc/eZ3sAw=
=0BaO
-----END PGP SIGNATURE-----

--TSzCOtGHpFOIyFHN--

