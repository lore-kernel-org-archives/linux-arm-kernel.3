Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2114FF885A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Apr 2026 05:06:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U917SwhpbB6UAhdMf9U5LMPvrO9J0IZBP/tA6Bb5kfU=; b=IcWhq1LZNnVBGo+ORS3Se6eBdo
	42ty+662Tab92N/5yTnQNgs/JAXAJxVH+Im7cbe1bBfMMGF017yPKDWFLpiw/NwZfaYYugd70mn4l
	7vwWQlV4uFSq1LHn46ds6zhDeL+p/QiyaTbhlCKzP/udeP9o2fQ9y4jD3/9IObb8UFJAjnV3bR3Zc
	LL0hIHfokeXVPwoFHdOOucJT8ksooLGwFUoqRNyY9PTZF7hsvfAFOh7oUqgIVcKOo4JBdjsMIO3eP
	INZF357qqZ0dUwHM4r7UIyBDJT7af5QjQVKUHSYd+gve/x+pZ/ar8NlAtKeMhuv3OK76spRWhabPF
	kbaUkqIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHaeR-00000000YrR-1LNt;
	Tue, 28 Apr 2026 05:06:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHaeP-00000000Yr4-3crQ;
	Tue, 28 Apr 2026 05:06:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E122044407;
	Tue, 28 Apr 2026 05:06:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BED1C2BCAF;
	Tue, 28 Apr 2026 05:06:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777352784;
	bh=YkVuIVrPUH9G6CQvZXtEIKnd9PzfTiFbEiHpBUaI28o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qzKPtcxO67dGseiMrH0EaH4Cn+6MBhm4KkTVFSHhX2whOqWCuRtqzNeHRqYoK9g6V
	 3kNl1i9HqXxMudWRkhgqAo6Kj5ifkYoPXNk1n6r9qESysCNZ2slkHc44W3fJaxayI4
	 73HaY9dxvXnHYTp+aH6jtSPZzPKDQo4qO3TW7l+3gIm779H5R30peTxBp0dGdhiPFf
	 gLZL1xz/ltGbyoAjHU4WNQ1Aw/AtK/QQ4AERRX+eatEz0CNQqIJzwSj7tqnpfJbz14
	 kCUyiaKNktpzRoYV+SzyPnuvzi/s92bVyxa14uCybE7S8mWROn+RftYAQw52I3J/HJ
	 2PljOTdDU1d9g==
Date: Tue, 28 Apr 2026 07:06:22 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: airoha: Do not read uninitialized fragment
 address in airoha_dev_xmit()
Message-ID: <afBATq82XMLCaWl5@lore-desk>
References: <20260424-airoha-xmit-fix-read-frag-v1-1-fdc0a83c79e8@kernel.org>
 <aezLa2POvT0It5AA@lore-desk>
 <20260427173935.6a1e36ee@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OBY97DuD8kgF4vPM"
Content-Disposition: inline
In-Reply-To: <20260427173935.6a1e36ee@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_220625_923317_4957B292 
X-CRM114-Status: GOOD (  18.44  )
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


--OBY97DuD8kgF4vPM
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Sat, 25 Apr 2026 16:10:51 +0200 Lorenzo Bianconi wrote:
> > - Does the TSO checksum calculation earlier in this function ensure the
> >   TCP header is in the linear portion of the SKB?
> >   This issue is not related to the current patch. Moreover, can we have=
 a TSO
> >   packet where the tcp header is not in the linear area of the skb?
>=20
> Don't think so.
>=20
> > - If dma_map_single() fails partway through a multi-fragment packet and
> >   triggers this goto error_unmap, will it break the Tx ring contiguity?
> >   This issue is not related to the current patch. Moreover, I guess the=
 hw is
> >   capable of managing out-of-order descriptors.
> >=20
> > - Is it safe to map fragment data using dma_map_single() instead of
> >   skb_frag_dma_map()?
> >   This issue is not related to the current patch. I will post a dedicat=
ed patch
> >   for it.
>=20
> I don't think it's an issue. Unless you support DMABUF zero-copy=20
> the skb_frag helper is just for convenience. I wouldn't bother.

ack, let's skip it for the moment.

Regards,
Lorenzo

--OBY97DuD8kgF4vPM
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCafBATgAKCRA6cBh0uS2t
rM6MAQCQQURreRlwbz1P+oyJbYOcGonb68w+NBmP1WqyypDIrAD/b5Cj5TdBpCS3
ScvL3g37x9jKb0jOzE+BQ7fR37+t5Qs=
=Mk+y
-----END PGP SIGNATURE-----

--OBY97DuD8kgF4vPM--

