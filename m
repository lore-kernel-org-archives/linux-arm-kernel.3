Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25339C624DB
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  5 Sep 2026 12:52:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SwU7O5u2Zi+0MO7A5w4CrHOUj77vcKhfx446RwYJXHw=; b=PjvqqfWx/kvg3/67C1SEcoBIoX
	wGocWiCdvBrIXXhrv0NVmesCqZxBdaMRt9Oc3PjgXDT3Yr+nCC9DLqunRT1b0ARMlUrExpwRrUm4o
	w8cu8VoNddHRvwV9jWYRYq+Mwgwohx0rFTgXqxVYkEqrkxK1vSvJUv7CIqbtqqYC5dinst2XmES0H
	33JQ2+cxAtxVdhcebX+SLO6wDLpx0s/YPYdZY/J3Muji2ctUrDxBduWtLqNyyK0z0NBhnJTxspGXZ
	OsEJa90AUOFAOZlxOsvgLCWXKAf+zBj3mfJuFtrLeFt48X3w62qowcEW48o4prOBceUdTGWZ+nz6c
	edzGJfbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2psS-000000044nj-0vjD;
	Sat, 05 Sep 2026 12:52:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x2psR-000000044nU-0vH9;
	Sat, 05 Sep 2026 12:52:11 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 13EDF60214;
	Sat,  5 Sep 2026 12:52:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 420911F00A3D;
	Sat,  5 Sep 2026 12:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788612729;
	bh=SwU7O5u2Zi+0MO7A5w4CrHOUj77vcKhfx446RwYJXHw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=V/3O0UO2N7TAuDTcDreqSlhtwladrlO5QKUy1e5/D9xvoT985R3Bj7itqN8mcyR02
	 88VjkIbjtq9Vg0JTxy3TkQTtdqpNco4x2EEAJ2Fi3aNLeUl+G3BQeospCtFZXpjYW7
	 YG0NuinBhPqGLQDqLMpBwMzwsOJoxQwOQpH1WaS+CWgAWxFLVSQt4dfgFcIVpgPrfz
	 HnqVAEp4jXmB9Ju92NFz43erb9yRMLef7FNj4W2uw4N8+wPNSBah+WygeQMQSq/HiM
	 yfchUeKczzuPXxkqK7u0pEQJcbmEXvupPfM9uOzXVPc79FyKJqQqQGTFnNcNVz4fmW
	 pYyA9O8jPcgAg==
Date: Sat, 5 Sep 2026 14:52:07 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Paolo Abeni <pabeni@redhat.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Alexander Lobakin <aleksander.lobakin@intel.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
	Madhur Agrawal <madhur.agrawal@airoha.com>
Subject: Re: [PATCH net-next v5] net: airoha: add HW GRO offload support
Message-ID: <apwQd01aErOMVf7T@lore-desk>
References: <20260831-airoha-eth-lro-v5-1-6b0f50401121@kernel.org>
 <fce0ee5a-476a-4867-9dd2-08e55993bd90@redhat.com>
 <aplpllPidmCjhSmA@lore-desk>
 <1ef90408-99b6-42fb-a7c6-7e5bca20c46d@redhat.com>
 <apmWLtgcUXRrOTFj@lore-desk>
 <20260903162558.2679c1d1@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CrcWeQCa+fXKdkYr"
Content-Disposition: inline
In-Reply-To: <20260903162558.2679c1d1@kernel.org>
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

--CrcWeQCa+fXKdkYr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Thu, 3 Sep 2026 17:45:50 +0200 Lorenzo Bianconi wrote:
> > > Lacking more details from the vendor, I think you need to use a
> > > pktdrill-like sender, explicitly sets the segment lengths to some not
> > > mergeable (like, i.e. 200-300-400) but otherwise fitting a GRO packet
> > > (i.e. same hdr except for the sequence number and push flag allowed o=
nly
> > > in the last packet), ensure that the aggregation timeout lasts long
> > > enough to receive all of them, and check if the engine really aggrega=
tes
> > > them or not. =20
> >=20
> > I think in the example you pointed out (length 200,300,400) the hw engi=
ne will
> > create a single TCP packet composed by 3 segments (with gso_size =3D 30=
0) while
> > sw GRO will just push sigle skbs. I agree this is just a GRO approximat=
ion.
> > If it is not enough I am fine to switch back to LRO implementation.
>=20
> FWIW the gro.py test covers that and many more cases..

ack, thx for the pointer.
I run data_sml_lrg test available in gro.py and I can confirm the
hw aggregates the transmitted packets (even if it is not supposed
to do it). I will switch back to LRO in v6.

Regards,
Lorenzo

--CrcWeQCa+fXKdkYr
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCapwQdwAKCRA6cBh0uS2t
rPirAQC2OncL2LAuHYc8s0bUpffO3Nka35iD1jYtzPuIluDdaAEAwfTd23B04aYZ
UlRKhK+AWicClQ7Sknyr1xeLgqtENgA=
=U/DL
-----END PGP SIGNATURE-----

--CrcWeQCa+fXKdkYr--

