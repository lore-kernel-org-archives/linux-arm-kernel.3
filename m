Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36D92CD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Jun 2026 13:11:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kuMUN8h2+W6wUgkQ9k408YFxn0wgCD4IbDjP9jAwSMQ=; b=lFslcvJFWTULO3k5ZB4YEpP93K
	diVEHs29VFlSBpP+kRO7QxI/FfyKcevJYeLJY6sMZArKSDp0Bty6vzyTbospDUcxVS7/SRXyZa1Vu
	BzaIXqODwyNQNMLT7N3Kzu9OpwED8ghbJ2TsRkLMzSF34XclzX6YKGnWy17H8TaSz8ebGiLuu/QtQ
	S3f6seJT+bsd+a+E6TYO0if6f2VfQQBFzeVjCKNUixySqm8EuwjIgOegLQgG5vsx33+M+FzpYAG1O
	ftVJZX0sHqTiARNLxwCou+GR3vpAaY/kNDbmoXTj2K7roH2DEE0SBCJCT9d3cp5rKtTWJ4zIBJKlb
	usGJzO8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeRJ-000000050Dp-46jr;
	Mon, 22 Jun 2026 13:11:49 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbeRI-000000050Dg-3o1n;
	Mon, 22 Jun 2026 13:11:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F6E0434AE;
	Mon, 22 Jun 2026 13:11:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C61741F000E9;
	Mon, 22 Jun 2026 13:11:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782133908;
	bh=kuMUN8h2+W6wUgkQ9k408YFxn0wgCD4IbDjP9jAwSMQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W5h21FMaCiwhYRbfnJW3M/AUMrvlllxpB6VO8W4gonhHLkMWnj8xNphYEhnsiSRZO
	 zAFVLgywvIJjmpJwbdGkTzMVgH1BbaiUWnX+4VGs+Urj6R0yEMtyYTKn4mHQ673CKF
	 sEd0/TI9Os6VgCmM7fAXSZ2oQq81D7AEM2fp5d933Mx5vwbP4rZmkdOFZYVJ/r9LNi
	 RPF1Jssz+YKLaDoreUKdvUibwgI1FQxxIveUogaYSKw2S9UGnBk9kdAHyl/or11Lqd
	 FUn0AX6kcOGzO0Dx+CyFxIOr7Jsu+6d5IMtuL2fiX+sl4I3gVHQndXKoBXRAiQPbl7
	 H96mjxwMN23LA==
Date: Mon, 22 Jun 2026 15:11:45 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Simon Horman <horms@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Wayen Yan <win847@gmail.com>, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net v2 2/2] net: airoha: fix netif_set_real_num_tx_queues
 for sparse QoS channels
Message-ID: <ajk0kS76nahtop8g@lore-desk>
References: <20260619-airoha-qos-fixes-v2-0-5c43485038f9@kernel.org>
 <20260619-airoha-qos-fixes-v2-2-5c43485038f9@kernel.org>
 <20260622123136.GC827683@horms.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="96HHC6WywQkcy9r+"
Content-Disposition: inline
In-Reply-To: <20260622123136.GC827683@horms.kernel.org>
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


--96HHC6WywQkcy9r+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Fri, Jun 19, 2026 at 01:37:14PM +0200, Lorenzo Bianconi wrote:
> > airoha_tc_htb_alloc_leaf_queue() assigns queue IDs based on the channel
> > index (opt->qid =3D AIROHA_NUM_TX_RING + channel), but updates
> > real_num_tx_queues with a simple increment (num_tx_queues + 1). When QoS
> > channels are allocated sparsely (e.g., channels 0 and 3 without 1 and
> > 2), the returned qid can exceed real_num_tx_queues, causing out-of-boun=
ds
> > accesses in the networking stack.
> > For example, allocating channel 0 then channel 3 results in
> > real_num_tx_queues =3D 34 but qid =3D 35, which is out of range [0, 34).
> > Fix this by computing real_num_tx_queues based on the highest active
> > channel index rather than using a simple counter, in both the allocation
> > and deletion paths.
> >=20
> > Fixes: ef1ca9271313b ("net: airoha: Add sched HTB offload support")
> > Signed-off-by: Lorenzo Bianconi <lorenzo@kernel.org>
>=20
> Thanks for the update since v1.
>=20
> Reviewed-by: Simon Horman <horms@kernel.org>

Hi Simon,

thx for the review.

>=20
> FTR, there is an AI-generated review of this patch on sashiko.dev.
> I do not think that should impede the progress of this patch but
> you may want to consider it in the context of follow-up.

Even if it is not introduced by this patch, I do not think what is reported
by Sashiko is a real issue since airoha_eth driver implements
ndo_select_queue() callback and the selected queue is always in the range
[0, AIROHA_NUM_TX_RING[. HTB queues (in the range
[AIROHA_NUM_TX_RING, AIROHA_NUM_TX_RING + AIROHA_NUM_QOS_CHANNELS[) are jus=
t=20
'offloaded' and never used in the TC sw path. Agree?

Regards,
Lorenzo

--96HHC6WywQkcy9r+
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCajk0kQAKCRA6cBh0uS2t
rPifAP96JjXaiWba2fGEotElX4xAGC8NNJ35hRhS+KLQrqpXuQD/R5dEALeVbE9p
v+B8S48F2yLp/iWm796glhdXABPoyAw=
=/a4e
-----END PGP SIGNATURE-----

--96HHC6WywQkcy9r+--

