Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E40CAC282D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 12:10:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f29vUjz9yr5FAYITEPm71mFj9/vHOJd1Qn0CfYv73Ss=; b=DNksUhAi//A9l4q3Hc7yOaUnaJ
	gYDB+bCTht5DU4iLoaOJEhHzweJjNWKvdBH9t6KUTZL79SZisYBA2sP+MjZc/nNp8LKxOodUzgu4+
	AJh3hx67wzPMuXq9VOTXwocGDSnOqxY/YA2WuhYVlXBlw+Nf9GjAYB1CSby8Ox6B8FRKvIwelGbl+
	ce00Z5ax74WkLIwy4EA4FLABecHGPGH24w7kgU16PMFtneahqF+7pTiSA+b7/dWwwPWNfDonbGgMT
	KMcY5/XuWodB5HP+Nx2zJVR0PzqZK8Nuuuf8NHA6xqDx6AQMAKxuRd94SkIogtwaqpf6K9jq2q2LU
	7tFWP4/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpR6b-00000004ZTd-3GSY;
	Tue, 04 Mar 2025 12:10:37 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tpQrC-00000004TiK-0del
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Mar 2025 11:54:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BB8E25C485E;
	Tue,  4 Mar 2025 11:52:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DD18C4CEE5;
	Tue,  4 Mar 2025 11:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741089281;
	bh=LUW0zHkOVQAa4MQP7h10oZ7A6fUqsf4kB4qq0+a2HpI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UBuL8Bq3Ngmn7f9GkjwYnrGI3+hvjmRyN4OGiX4QFdcJjtfdTmadnOaPjdQWvhLQw
	 yFgeYHdBjhx50aJzlU+7ezQ0PKP7x0dsxm8CAbXmP8K/8OnH8iQS+FpJQy/eQw/qMN
	 LLM1isF0KKEOP7Qzjfr/kyJASPoHfdNbx0P9iIPvhEHuT+Ole4PYLq9p953JBLpn/r
	 7609wHlkdZ8RnjwynHDqTh+rgng/cWn5VsMaLJyRiRo0UEq8DSqPZ8cE6YcGM/0m/2
	 ZOu/WbkYkocbVWFAul8WFI4kzUe4WRxZfEJdt2NPPKqMcoeZrpbbT2gfQy8PzxUrBo
	 ioI4/5jLpRudA==
Date: Tue, 4 Mar 2025 20:54:37 +0900
From: William Breathitt Gray <wbg@kernel.org>
To: =?iso-8859-1?B?Q3Pza+Fz?= Bence <csokas.bence@prolan.hu>
Cc: linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-iio@vger.kernel.org,
	Kamel Bouhara <kamel.bouhara@bootlin.com>
Subject: Re: [PATCH v6 1/3] include: uapi: counter: Add
 microchip-tcb-capture.h
Message-ID: <Z8bp_RJSPSXOLV5C@ishi>
References: <20250227144023.64530-1-csokas.bence@prolan.hu>
 <20250227144023.64530-2-csokas.bence@prolan.hu>
 <Z8bNFjh85p2jqK9C@ishi>
 <8cf056d7-22d0-4bf2-8dd6-79a45977bfc1@prolan.hu>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="HCA7+K3tzLJF8OJn"
Content-Disposition: inline
In-Reply-To: <8cf056d7-22d0-4bf2-8dd6-79a45977bfc1@prolan.hu>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_035442_273900_D9670841 
X-CRM114-Status: GOOD (  29.45  )
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


--HCA7+K3tzLJF8OJn
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 04, 2025 at 12:14:04PM +0100, Cs=F3k=E1s Bence wrote:
> Hi,
>=20
> On 2025. 03. 04. 10:51, William Breathitt Gray wrote:
> > On Thu, Feb 27, 2025 at 03:40:18PM +0100, Bence Cs=F3k=E1s wrote:
> > > Add UAPI header for the microchip-tcb-capture.c driver.
> > > This header will hold the various event channels, component numbers e=
tc.
> > > used by this driver.
> > >=20
> > > Signed-off-by: Bence Cs=F3k=E1s <csokas.bence@prolan.hu>
> >=20
> > Oops, I almost missed this one! Make sure I'm included in the To field
> > for the next revision. ;-)
> >=20
> > By the way, b4 is a nifty tool that can save you some work and help you
> > prep patch series for submission.[^1]
>=20
> Yes, I have considered it, but unfortunately it still has quite a few bug=
s,
> for example [1], which has mangled my tags before, when a maintainer using
> it tried to apply one of my patches with it.
>=20
> [1] https://github.com/mricon/b4/issues/52

Oh that is unfortunate, you'll have to continue submitting manually for
now until those bugs are fixed. :-(

> > > +/*
> > > + * The driver defines the following components:
> > > + *
> > > + * Count 0
> > > + * \__  Synapse 0 -- Signal 0 (Channel A, i.e. TIOA)
> > > + * \__  Synapse 1 -- Signal 1 (Channel B, i.e. TIOB)
> > > + */
> > > +
> > > +enum counter_mchp_signals {
> > > +	COUNTER_MCHP_SIG_TIOA,
> > > +	COUNTER_MCHP_SIG_TIOB,
> > > +};
> >=20
> > Are these meant to be used to identify the Signals in the
> > microchip-tcb-capture.c file. You should set the the counter_signal id
> > members to these enum constants then. However, this enum doesn't need to
> > be exposed to userspace in that case.
>=20
> The thought was to let userspace figure out which
> `signal%d_action_component_id` to read, but now I see that this is not the
> way to go.
>=20
> > If that is the only purpose of enum counter_mchp_signals, then we can
> > omit this patch from the series and you won't need to send it in the
> > next revision.
>=20
> Alright, I'll drop this enum. Then this header will be empty at the start,
> save for the block comment. I hope that will be alright.

No, it'll better to drop this patch and introduce the header in the IRQ
handling patch. You can merge the MAINTAINERS change there as well.

William Breathitt Gray

--HCA7+K3tzLJF8OJn
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEARYKAB0WIQSNN83d4NIlKPjon7a1SFbKvhIjKwUCZ8bp/QAKCRC1SFbKvhIj
K/3JAP4s2rB+FgZXHuQec3IkwA03zPOiw3XbhpvrtKIxRAv6zAEApHotPB/FA3ig
swg7lg9VXcf6u25HL0rGvfjLYWmFxww=
=mlmk
-----END PGP SIGNATURE-----

--HCA7+K3tzLJF8OJn--

