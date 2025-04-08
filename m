Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54A93C369A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Apr 2025 22:56:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hpQpod7dJ19FCqCA7ULsaw9W9YKDpeqR+rpRTosUPvY=; b=YnjA9bN9usre5DhWTpJ2f7quQd
	cbmm3fr9d/JJHbb+8PemfRMzMmBJZmLNAAMo8KzBO/BFB4NH777AIEOc+KMO5J6hR3qDHqg7f+wJa
	Lc15X+t7hxnJUhH6e6Kkq2h16f61oNcMiLLrr5fjgLrOnMgO/fIU2RNyS2ybc7oiNLsFBqlPzk0IG
	+qp5HFtkrh0H3wZwlsBcy0ajVcClCY1MwPCZGypRJMkt0wSvXxqOMKL5vdYmKA5s6m75p3l/fMXyZ
	tby4x4YmbdRQiSOk2akuK5aWVMC8rlBbVgUFFGqqTo5xSzo1MIhXO3i+TZ0EryZz7VI6oMLIXklVu
	fW8k3D5g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2Hs2-00000005dX9-2k6f;
	Tue, 08 Apr 2025 22:56:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2HqH-00000005dSX-32Wl;
	Tue, 08 Apr 2025 22:54:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 5A28261143;
	Tue,  8 Apr 2025 22:54:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5AA5C4CEE5;
	Tue,  8 Apr 2025 22:54:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1744152891;
	bh=hpQpod7dJ19FCqCA7ULsaw9W9YKDpeqR+rpRTosUPvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lrTv7IPYgNZEzrxhfJn5SEO9OsPwJm2zDsJ8jD/sGC8U/9mlfZNFI41W8XtL/cFb+
	 EEXPQ9mEUVDioKafuVGq+rXx1LfS4fVIZMdAaWqXEjtaRONIy37w7/ANWZYscR8emw
	 ZoIhxoxr6wC3Z299vkT+2cHLgeJD/22PrkcQJDDE403xmzz1+M9my0XXw7mShyWKoi
	 F3xOHY1vfZwFcLi0bbfMysCrgz2MpntuFO+DLRfG/vesH0z/sKNDc4PhcCdmnYHOmK
	 Tu2LyAH/2Z6+CHkB1bIkIbFfeRp4KQNX947EB4GkNMgQYy30IIp3uT5dzXZt4pmLv3
	 h+2/vejLXx0Xw==
Date: Wed, 9 Apr 2025 00:54:48 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Michal Kubiak <michal.kubiak@intel.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next 1/3] net: airoha: Add l2_flows rhashtable
Message-ID: <Z_WpOIGugyLnc99N@lore-desk>
References: <20250407-airoha-flowtable-l2b-v1-0-18777778e568@kernel.org>
 <20250407-airoha-flowtable-l2b-v1-1-18777778e568@kernel.org>
 <Z/VCYwQS5hWqe/y0@localhost.localdomain>
 <Z_VTpBhntxXPncsv@lore-desk>
 <20250408115727.6b7468b3@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xnN5FBJtbR+nAVlX"
Content-Disposition: inline
In-Reply-To: <20250408115727.6b7468b3@kernel.org>
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


--xnN5FBJtbR+nAVlX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Tue, 8 Apr 2025 18:49:40 +0200 Lorenzo Bianconi wrote:
> > > I didn't find any usage of L4 flow type in the series.
> > > Is that reserved for future series? Shouldn't it be added together wi=
th
> > > its usage then? =20
> >=20
> > FLOW_TYPE_L4 is equal to 0 so it is the default value for
> > airoha_flow_table_entry type when not set explicitly.
> > It is done this way to reduce code changes.
>=20
> That seems quite unintuitive. Could you init explicitly for the
> benefit of people reading this code?

ack, I will do in v2.

Regards,
Lorenzo

--xnN5FBJtbR+nAVlX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCZ/WpOAAKCRA6cBh0uS2t
rPhJAP9tJumh66ALD7Mi9Lq67Q0zkiY3AAxsC78L/bK7hPMQFQD8CfrrTsGIVd2b
/YSRGiDILJJyG34/g8CbrhR6aFdaywo=
=k4nT
-----END PGP SIGNATURE-----

--xnN5FBJtbR+nAVlX--

