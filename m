Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5FC16C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 07:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BXfpVsjWF0Y78+XsAp5AT1RaqbCb/hX1z9JCJ/YUswA=; b=IoMQTzgYuMG+ibMT1jwZU7tNpL
	4GwHoD2nJ3tNgNeKZsCO9KVVV/97ETUpq2YBy4AiFslUC86vEQWAT+wLmmPDMj17POWdWVpesQd+Y
	PznJlmS3DdsOJU1VjPQM7seFgotqnmeeCWhaIMzhsKlh07l0xXOKvX798jCajtkrdwJ+vhkyKrdjt
	IGRgPt6xuRAOSOy32TcBAyjcENlV5KQkOAuDfG8EKqphSHv8MZrWshyOFd/NvUMCmtEGg+iFWkjMR
	10avytEkZbvrzIZobc1ZgUk/CZGid0Y5Cwa0hRp0v6yejyWkVepFOmXFxZzRr/IF/BzILTeSpjOra
	7l35jmzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnRD-00000009JKB-1UG3;
	Wed, 18 Jun 2025 07:42:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRnO5-00000009J5j-0eS7;
	Wed, 18 Jun 2025 07:39:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 32024629C5;
	Wed, 18 Jun 2025 07:39:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8C502C4CEE7;
	Wed, 18 Jun 2025 07:39:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750232351;
	bh=BXfpVsjWF0Y78+XsAp5AT1RaqbCb/hX1z9JCJ/YUswA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QmGbiLy3WreaKTciX0axCUsGg49kV6/sc/gGCErHdNBCr99cH1GrPnVnlkJOm3+9q
	 BundZ2J83ddUDvMbMMGvzpQNdCmzuFG+XHKPDvjdS6t3KKfkA70OxFqhYgjxdZG+bu
	 fu6yO9HZFnBHZEoi4R813zfAebXLbBe47i/az/jhEOp4BB6kFk6y+NL+i8TFRqvMJa
	 I4TpX416cZrCLTYFJhY4jIU69QiI74Cejg3LIujQV8p1xJooyiQvw6hM30KbuWen2D
	 7uvL2iXHoW0ux/Q/kauhuhxLIG85Fgi2/zjsrpubX3GwrP5a0S6jz8ueLfMsmYWVJL
	 /uySsCko3bqgw==
Date: Wed, 18 Jun 2025 09:39:09 +0200
From: Lorenzo Bianconi <lorenzo@kernel.org>
To: Jakub Kicinski <kuba@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, netdev@vger.kernel.org
Subject: Re: [PATCH net-next] net: airoha: Always check return value from
 airoha_ppe_foe_get_entry()
Message-ID: <aFJtHUmhoqjJUN9T@lore-desk>
References: <20250616-check-ret-from-airoha_ppe_foe_get_entry-v1-1-1acae5d677f7@kernel.org>
 <20250617153131.56a783c4@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uo43+w1z7RWJd+56"
Content-Disposition: inline
In-Reply-To: <20250617153131.56a783c4@kernel.org>
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


--uo43+w1z7RWJd+56
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

> On Mon, 16 Jun 2025 12:27:06 +0200 Lorenzo Bianconi wrote:
> > Subject: [PATCH net-next] net: airoha: Always check return value from a=
iroha_ppe_foe_get_entry()
> >=20
> > airoha_ppe_foe_get_entry routine can return NULL, so check the returned
> > pointer is not NULL in airoha_ppe_foe_flow_l2_entry_update()
> >=20
> > Fixes: b81e0f2b58be3 ("net: airoha: Add FLOW_CLS_STATS callback support=
")
>=20
> Looks like the commit under fixes is in net, is the tree in the subject
> wrong?

ack, fine. I will post v2 targeting net tree.

Regards,
Lorenzo

--uo43+w1z7RWJd+56
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTquNwa3Txd3rGGn7Y6cBh0uS2trAUCaFJtHQAKCRA6cBh0uS2t
rCKsAQCEFmeCcYEX24UTb6vH2FZr1eqY6402wluHC5kMW0VdqQD+OI0UDARUoXKC
xgnAAwGTKjYg1NfFKAcFPp9nkKkWYAA=
=Awjz
-----END PGP SIGNATURE-----

--uo43+w1z7RWJd+56--

